//===-- RISCVExpandCoreVHwlpPseudoInsts.cpp - Expand hwlp pseudo instrs. --===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains a pass that expands hardware loop pseudo instructions into
// the instructions of the xcorevhwlp extension.
//
//===----------------------------------------------------------------------===//

#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineLoopInfo.h"
#include "llvm/CodeGen/Passes.h"
#include "RISCV.h"
#include "RISCVSubtarget.h"
#include "llvm/MC/MCContext.h"
using namespace llvm;

#define COREV_EXPAND_HWLP_PSEUDO_NAME                                          \
  "Core-V hardware loop pseudo instruction expansion pass"

#define DEBUG_TYPE "corev-expand-hwlp-pseudo"

namespace {
  class RISCVExpandCoreVHwlpPseudo : public MachineFunctionPass {

    private:
      bool ProcessLoop(MachineLoop *ML, MachineFunction &MF);

    public:
      static char ID;
      RISCVExpandCoreVHwlpPseudo() : MachineFunctionPass(ID) { }

      bool runOnMachineFunction(MachineFunction &MF) override;

      StringRef getPassName() const override {
        return COREV_EXPAND_HWLP_PSEUDO_NAME;
      }

      void getAnalysisUsage(AnalysisUsage &AU) const override {
        AU.addRequired<MachineLoopInfo>();
        MachineFunctionPass::getAnalysisUsage(AU);
      }
  };
}

char RISCVExpandCoreVHwlpPseudo::ID = 0;

bool RISCVExpandCoreVHwlpPseudo::runOnMachineFunction(MachineFunction &MF) {
  if (!MF.getSubtarget<RISCVSubtarget>().hasExtXCoreVHwlp()) {
    return false;
  }

  MachineLoopInfo &MLI = getAnalysis<MachineLoopInfo>();

  bool Changed = false;
  for (auto &ML : MLI) {
    Changed |= ProcessLoop(ML, MF);
  }
  return Changed;
}

bool RISCVExpandCoreVHwlpPseudo::ProcessLoop(MachineLoop *ML,
                                             MachineFunction &MF) {
  bool Changed = false;
  for (auto &Inner : *ML) {
    Changed |= ProcessLoop(Inner, MF);
  }

  MachineBasicBlock *Preheader = ML->getLoopPreheader(),
                    *Latch = ML->getLoopLatch();

  if (!Preheader || !Latch) {
    return Changed;
  }

  MachineInstr *HwlpSetup = nullptr, *HwlpBranch = nullptr;
  for (auto &MI : *Preheader) {
    if (MI.getOpcode() == RISCV::HwlpSetup ||
        MI.getOpcode() == RISCV::HwlpSetupImm) {
      HwlpSetup = &MI;
      break;
    }
  }
  for (auto &MI : Latch->terminators()) {
    if (MI.getOpcode() == RISCV::HwlpBranch) {
      HwlpBranch = &MI;
    }
  }
  if (!HwlpSetup || !HwlpBranch) {
    return Changed;
  }

  const TargetInstrInfo *TII = MF.getSubtarget().getInstrInfo();

  MachineBasicBlock *LoopHeader = ML->getHeader();
  LoopHeader->setLabelMustBeEmitted();

  // Iterate through the instructions to get the last instruction and the offset
  // for the loop start and end.
  int Offset = 0, StartOffset = 0, EndOffset = 0, InnerHwlpEndOffset = 0;
  MCSymbol *InnerEndSymbol = nullptr;
  MachineInstr *MI = HwlpSetup,
               *LastInstr = nullptr;
  while (MI) {
    if (!StartOffset && MI->getParent() == LoopHeader) {
      StartOffset = Offset;
    }
    if (MI == HwlpBranch) {
      // Add 'nop' if the loop body is too short or the loops end is too close
      // to the end of an inner hardware loop.
      if (EndOffset - StartOffset < 8 || EndOffset - InnerHwlpEndOffset < 8) {
        MI = BuildMI(*Latch, MI, MI->getDebugLoc(), TII->get(RISCV::ADDI),
                     RISCV::X0).addReg(RISCV::X0).addImm(0);
      } else {
        break;
      }
    }
    if (!MI->isDebugInstr()) {
      LastInstr = MI;
      EndOffset = Offset;
    }
    // Find the end of an inner hardware loop
    switch (MI->getOpcode()) {
      case RISCV::CV_SETUP:
      case RISCV::CV_SETUPI:
        InnerEndSymbol = MI->getOperand(2).getMCSymbol();
        break;
      case RISCV::CV_ENDI:
        InnerEndSymbol = MI->getOperand(1).getMCSymbol();
        break;
      default:
        break;
    }
    if (InnerEndSymbol && InnerEndSymbol == MI->getPreInstrSymbol()) {
      InnerHwlpEndOffset = Offset;
    }
    unsigned Size = TII->getInstSizeInBytes(*MI);
    // Instruction compression is disabled here
    if (Size == 2){
      Size = 4;
    }
    Offset += Size;

    MachineInstr *Next = MI->getNextNode();
    if (!Next) {
      Next = &MI->getParent()->getNextNode()->front();
    }
    MI = Next;
  }

  assert(isUInt<13>(StartOffset) && "Hwlp start out of range");
  assert(isUInt<13>(EndOffset) && "Hwlp end out of range");

  MCSymbol *LastInstrSymbol = LastInstr->getPreInstrSymbol();
  if (!LastInstrSymbol) {
    LastInstrSymbol = MF.getContext().createLinkerPrivateTempSymbol();
    LastInstr->setPreInstrSymbol(MF, LastInstrSymbol);
  }

  DebugLoc DL = HwlpSetup->getDebugLoc();
  int64_t LoopNum = Changed ? 1 : 0;

  if(HwlpSetup->getOpcode() == RISCV::HwlpSetup) {
    Register count = HwlpSetup->getOperand(0).getReg();
    if (StartOffset == 12) {
      BuildMI(*Preheader, HwlpSetup, DL, TII->get(RISCV::CV_SETUP))
              .addImm(LoopNum).addReg(count).addSym(LastInstrSymbol);

    } else {
      BuildMI(*Preheader, HwlpSetup, DL, TII->get(RISCV::CV_COUNT))
              .addImm(LoopNum).addReg(count);
      BuildMI(*Preheader, HwlpSetup, DL, TII->get(RISCV::CV_STARTI))
              .addImm(LoopNum).addMBB(LoopHeader);
      BuildMI(*Preheader, HwlpSetup, DL, TII->get(RISCV::CV_ENDI))
              .addImm(LoopNum).addSym(LastInstrSymbol);
    }
  } else {
    int64_t count = HwlpSetup->getOperand(0).getImm();
    if (StartOffset == 12 && EndOffset < 64) {
      BuildMI(*Preheader, HwlpSetup, DL, TII->get(RISCV::CV_SETUPI))
              .addImm(LoopNum).addImm(count).addSym(LastInstrSymbol);

    } else {
      BuildMI(*Preheader, HwlpSetup, DL, TII->get(RISCV::CV_COUNTI))
              .addImm(LoopNum).addImm(count);
      BuildMI(*Preheader, HwlpSetup, DL, TII->get(RISCV::CV_STARTI))
              .addImm(LoopNum).addMBB(LoopHeader);
      BuildMI(*Preheader, HwlpSetup, DL, TII->get(RISCV::CV_ENDI))
              .addImm(LoopNum).addSym(LastInstrSymbol);
    }
  }

  HwlpSetup->removeFromParent();
  HwlpBranch->removeFromParent();

  return true;
}

INITIALIZE_PASS(RISCVExpandCoreVHwlpPseudo, DEBUG_TYPE,
                COREV_EXPAND_HWLP_PSEUDO_NAME, false, false)

FunctionPass *llvm::createRISCVExpandCoreVHwlpPseudoPass() {
  return new RISCVExpandCoreVHwlpPseudo();
}
