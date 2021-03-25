//===-- RISCVTargetTransformInfo.cpp - RISC-V specific TTI ----------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "RISCVTargetTransformInfo.h"
#include "Utils/RISCVMatInt.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/CodeGen/BasicTTIImpl.h"
#include "llvm/CodeGen/TargetLowering.h"
using namespace llvm;

#define DEBUG_TYPE "riscvtti"

int RISCVTTIImpl::getIntImmCost(const APInt &Imm, Type *Ty,
                                TTI::TargetCostKind CostKind) {
  assert(Ty->isIntegerTy() &&
         "getIntImmCost can only estimate cost of materialising integers");

  // We have a Zero register, so 0 is always free.
  if (Imm == 0)
    return TTI::TCC_Free;

  // Otherwise, we check how many instructions it will take to materialise.
  const DataLayout &DL = getDataLayout();
  return RISCVMatInt::getIntMatCost(Imm, DL.getTypeSizeInBits(Ty),
                                    getST()->is64Bit());
}

int RISCVTTIImpl::getIntImmCostInst(unsigned Opcode, unsigned Idx,
                                    const APInt &Imm, Type *Ty,
                                    TTI::TargetCostKind CostKind,
                                    Instruction *Inst) {
  assert(Ty->isIntegerTy() &&
         "getIntImmCost can only estimate cost of materialising integers");

  // We have a Zero register, so 0 is always free.
  if (Imm == 0)
    return TTI::TCC_Free;

  // Some instructions in RISC-V can take a 12-bit immediate. Some of these are
  // commutative, in others the immediate comes from a specific argument index.
  bool Takes12BitImm = false;
  unsigned ImmArgIdx = ~0U;

  switch (Opcode) {
  case Instruction::GetElementPtr:
    // Never hoist any arguments to a GetElementPtr. CodeGenPrepare will
    // split up large offsets in GEP into better parts than ConstantHoisting
    // can.
    return TTI::TCC_Free;
  case Instruction::Add:
  case Instruction::And:
  case Instruction::Or:
  case Instruction::Xor:
  case Instruction::Mul:
    Takes12BitImm = true;
    break;
  case Instruction::Sub:
  case Instruction::Shl:
  case Instruction::LShr:
  case Instruction::AShr:
    Takes12BitImm = true;
    ImmArgIdx = 1;
    break;
  default:
    break;
  }

  if (Takes12BitImm) {
    // Check immediate is the correct argument...
    if (Instruction::isCommutative(Opcode) || Idx == ImmArgIdx) {
      // ... and fits into the 12-bit immediate.
      if (Imm.getMinSignedBits() <= 64 &&
          getTLI()->isLegalAddImmediate(Imm.getSExtValue())) {
        return TTI::TCC_Free;
      }
    }

    // Otherwise, use the full materialisation cost.
    return getIntImmCost(Imm, Ty, CostKind);
  }

  // By default, prevent hoisting.
  return TTI::TCC_Free;
}

int RISCVTTIImpl::getIntImmCostIntrin(Intrinsic::ID IID, unsigned Idx,
                                      const APInt &Imm, Type *Ty,
                                      TTI::TargetCostKind CostKind) {
  // Prevent hoisting in unknown cases.
  return TTI::TCC_Free;
}

bool RISCVTTIImpl::shouldFavorPostInc() const {
  return ST->hasExtXCoreVMem();
}

bool RISCVTTIImpl::isHardwareLoopProfitable(Loop *L, ScalarEvolution &SE,
                                            AssumptionCache &AC,
                                            TargetLibraryInfo *LibInfo,
                                            HardwareLoopInfo &HWLoopInfo) {
  if (!ST->hasExtXCoreVHwlp()) {
    return false;
  }

  // Hardware loops need exactly one latch and exiting block and they need to be
  // the same block
  if (L->getNumBackEdges() != 1 || L->getLoopLatch() != L->getExitingBlock()) {
    return false;
  }

  if (!SE.hasLoopInvariantBackedgeTakenCount(L)) {
    return false;
  }

  const SCEV *BackedgeTakenCount = SE.getBackedgeTakenCount(L);
  if (isa<SCEVCouldNotCompute>(BackedgeTakenCount)) {
    return false;
  }

  // The trip count needs to fit into 32 Bits
  const SCEV *One = SE.getOne(BackedgeTakenCount->getType());
  const SCEV *TripCount = SE.getAddExpr(BackedgeTakenCount, One);
  if (SE.getUnsignedRangeMax(TripCount).getBitWidth() > 32) {
    return false;
  }

  bool HasInnerHardwareLoop = false;
  int InstrCount = 0;

  // Check all instructions in the loop body
  BasicBlock *BB = L->getHeader();
  while (BB) {
    BasicBlock *Next = BB->getSingleSuccessor();

    for (auto &I : BB->instructionsWithoutDebug()) {
      InstrCount++;

      // Function calls are not allowed
      const RISCVTargetLowering *TLI = getTLI();
      unsigned ISD = TLI->InstructionOpcodeToISD(I.getOpcode());
      EVT VT = TLI->getValueType(DL, I.getType(), true);
      if (TLI->getOperationAction(ISD, VT) == TargetLowering::LibCall) {
        return false;
      }

      if (auto *Call = dyn_cast<CallInst>(&I)) {
        if (isa<IntrinsicInst>(Call)) {
          if (!isLoweredToCall(Call->getCalledFunction())) {
            continue;
          }
        }
        return false;
      }

      // Unconditional branches are allowed, since they get removed, if the
      // following block is the branch target.
      // Conditional branches are only allowed, if they are the latch of this
      // loop or the latch of an inner hardware loop.
      if (auto *Branch = dyn_cast<BranchInst>(&I)) {
        if (Branch->isUnconditional() || L->isLoopLatch(BB)) {
          InstrCount--;
          continue;
        }
        else if (auto *Cond = dyn_cast<IntrinsicInst>(Branch->getCondition())) {
          if (Cond->getIntrinsicID() == Intrinsic::loop_decrement) {
            HasInnerHardwareLoop = true;
            Next = Branch->getSuccessor(1);
            // Need two more instructions after this
            InstrCount = 1;
            continue;
          }
        }
      }

      // Other terminators are not allowed
      if (I.isTerminator()) {
        return false;
      }

      // These are lowered to libcalls
      if (VT.isFloatingPoint() && !TLI->isOperationLegalOrCustom(ISD, VT)) {
        return false;
      }

      // The select instruction is lowered to a conditional branch
      if (I.getOpcode() == Instruction::Select) {
        return false;
      }
    }
    BB = Next;
  }

  if (InstrCount < 3) {
    return false;
  }

  LLVMContext &C = L->getHeader()->getContext();
  HWLoopInfo.CounterInReg = false;
  HWLoopInfo.IsNestingLegal = !HasInnerHardwareLoop;
  HWLoopInfo.PerformEntryTest = false;
  HWLoopInfo.CountType = Type::getInt32Ty(C);
  HWLoopInfo.LoopDecrement = ConstantInt::get(HWLoopInfo.CountType, 1);
  return true;
}

bool RISCVTTIImpl::isLoweredToCall(const Function *F) {
  if (F->getName().startswith("llvm.riscv.cv"))
    return false;

  return BaseT::isLoweredToCall(F);
}
