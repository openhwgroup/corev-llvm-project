//===-- RISCVCoreVHwlpBlocks.cpp - Prepare hwlp basic blocks --------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains a pass that finds the basic blocks inside hardware loops,
// stores them in RISCVMachineFunctionInfo and reorders them to eliminate branch
// instructions.
//
//===----------------------------------------------------------------------===//

#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineLoopInfo.h"
#include "llvm/CodeGen/Passes.h"
#include "RISCV.h"
#include "RISCVSubtarget.h"
#include "RISCVMachineFunctionInfo.h"
using namespace llvm;

#define COREV_HWLP_BLOCKS_NAME "Core-V prepare hardware loop basic blocks pass"

#define DEBUG_TYPE "corev-hwlp-blocks"

namespace {
  class RISCVCoreVHwlpBlocks : public MachineFunctionPass {

    private:
      bool ProcessLoop(MachineLoop *ML, MachineFunction &MF);

    public:
      static char ID;
      RISCVCoreVHwlpBlocks() : MachineFunctionPass(ID) { }

      bool runOnMachineFunction(MachineFunction &MF) override;

      StringRef getPassName() const override {
        return COREV_HWLP_BLOCKS_NAME;
      }

      void getAnalysisUsage(AnalysisUsage &AU) const override {
        AU.addRequired<MachineLoopInfo>();
        MachineFunctionPass::getAnalysisUsage(AU);
      }
  };
}

char RISCVCoreVHwlpBlocks::ID = 0;

bool RISCVCoreVHwlpBlocks::runOnMachineFunction(MachineFunction &MF) {
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

bool RISCVCoreVHwlpBlocks::ProcessLoop(MachineLoop *ML, MachineFunction &MF) {

  bool hwlp = false;
  MachineBasicBlock *Preheader = ML->getLoopPreheader();
  MachineBasicBlock *Latch = ML->getLoopLatch();
  if (Latch && Preheader) {
    for (auto &MI : *Preheader) {
      if (MI.getOpcode() == RISCV::HwlpSetup ||
          MI.getOpcode() == RISCV::HwlpSetupImm) {
        hwlp = true;
        break;
      }
    }
  }
  if (!hwlp) {
    bool Changed = false;
    for (auto Inner : *ML) {
      Changed |= ProcessLoop(Inner, MF);
    }
    return Changed;
  }

  auto *RVFI = MF.getInfo<RISCVMachineFunctionInfo>();

  MachineBasicBlock *BB = Preheader;

  while (BB != Latch) {
    assert(BB->succ_size() <= 2 && "Too many basic block successors");

    MachineBasicBlock *Next = *BB->succ_begin();

    if (BB->succ_size() == 2) {
      hwlp = false;
      for (auto &MI : BB->terminators()) {
        if (MI.getOpcode() == RISCV::HwlpBranch) {
          hwlp = true;
          if (Next == MI.getOperand(2).getMBB()) {
            Next = *BB->succ_rbegin();
          }
          break;
        }
      }
      assert(hwlp && "Conditional branch inside hwlp is not allowed");
    }

    if (!BB->isLayoutSuccessor(Next)) {
      MachineBasicBlock *OldPred = Next->getPrevNode();
      MachineBasicBlock *OldSucc1 = Next->getNextNode();
      MachineBasicBlock *OldSucc2 = BB->getNextNode();
      Next->moveAfter(BB);
      OldPred->updateTerminator(Next);
      Next->updateTerminator(OldSucc1);
      BB->updateTerminator(OldSucc2);
    }

    RVFI->pushHwlpBasicBlock(Next);

    BB = Next;

  }

  return true;
}

INITIALIZE_PASS(RISCVCoreVHwlpBlocks, DEBUG_TYPE, COREV_HWLP_BLOCKS_NAME,
                false, false)

FunctionPass *llvm::createRISCVCoreVHwlpBlocksPass() {
  return new RISCVCoreVHwlpBlocks();
}
