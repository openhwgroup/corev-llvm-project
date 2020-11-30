//===-- RISCVSelectionDAGInfo.cpp - RISCV SelectionDAG Info ---------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements the RISCVSelectionDAGInfo class.
//
//===----------------------------------------------------------------------===//

#include "RISCVTargetMachine.h"
#include "RISCVSubtarget.h"
#include "llvm/CodeGen/SelectionDAGNodes.h"
using namespace llvm;

#define DEBUG_TYPE "riscv-selectiondag-info"

SDValue RISCVSelectionDAGInfo::EmitTargetCodeForMemcpy(
    SelectionDAG &DAG, const SDLoc &dl, SDValue Chain, SDValue Dst, SDValue Src,
    SDValue Size, Align Alignment, bool isVolatile, bool AlwaysInline,
    MachinePointerInfo DstPtrInfo, MachinePointerInfo SrcPtrInfo) const {
  // If no hardware loops are available, use the default lowering
  const RISCVSubtarget &Subtarget = DAG.getMachineFunction().getSubtarget<RISCVSubtarget>();
  if (!Subtarget.hasExtXCoreVHwlp())
    return SDValue();

  ConstantSDNode *CN = dyn_cast<ConstantSDNode>(Size);
  if (!CN || CN->getZExtValue() > 0xfff)
    return SDValue();

  SDValue ConstSize = DAG.getConstant(CN->getZExtValue(), dl, Src.getValueType());

  return DAG.getNode(RISCVISD::CV_HWLP_MEMCPY, dl, MVT::Other, Chain, Dst, Src, ConstSize);
}
