//===-- RISCVInstrInfoCOREV.td - CORE-V instructions -------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file describes the CORE-V instructions.
//
//===----------------------------------------------------------------------===//

include "RISCVInstrFormatsCOREV.td"

def CVUImm1AsmOperand : AsmOperandClass {
  let Name = "CVUImm1";
  let RenderMethod = "addImmOperands";
  let DiagnosticType = "InvalidCVUImm1";
}

class CVUImmAsmOperand<int width> : AsmOperandClass {
  let Name = "CVUImm" # width;
  let RenderMethod = "addImmOperands";
  let DiagnosticType = !strconcat("Invalid", Name);
}

def cv_uimm1 : Operand<XLenVT>, ImmLeaf<XLenVT, [{return isUInt<1>(Imm);}]> {
  let ParserMatchClass = CVUImm1AsmOperand;
  let DecoderMethod = "decodeUImmOperand<1>";
  let MCOperandPredicate = [{
    int64_t Imm;
    if (MCOp.evaluateAsConstantImm(Imm))
      return isUInt<1>(Imm);
    return false;
  }];
  let OperandType = "OPERAND_UIMM1";
  let OperandNamespace = "RISCVOp";
}

def cv_uimm5 : Operand<XLenVT>,
               ImmLeaf<XLenVT, [{return isUInt<5>(Imm) && (Imm & 1) == 0;}]> {
  let ParserMatchClass = CVUImmAsmOperand<5>;
  let EncoderMethod = "getImmOpValue";
  let DecoderMethod = "decodeUImmOperand<5>";
  let MCOperandPredicate = [{
    int64_t Imm;
    if (MCOp.evaluateAsConstantImm(Imm))
      return isUInt<5>(Imm) && (Imm & 1) == 0;
    return MCOp.isBareSymbolRef();
  }];
  let OperandType = "OPERAND_UIMM5";
  let OperandNamespace = "RISCVOp";
}

def cv_uimm12 : Operand<XLenVT>,
                ImmLeaf<XLenVT, [{return isUInt<12>(Imm) && (Imm & 1) == 0;}]> {
  let ParserMatchClass = CVUImmAsmOperand<12>;
  let EncoderMethod = "getImmOpValue";
  let DecoderMethod = "decodeUImmOperand<12>";
  let MCOperandPredicate = [{
    int64_t Imm;
    if (MCOp.evaluateAsConstantImm(Imm))
      return isUInt<12>(Imm) && (Imm & 1) == 0;
    return MCOp.isBareSymbolRef();
  }];
  let OperandType = "OPERAND_UIMM12";
  let OperandNamespace = "RISCVOp";
}

let Predicates = [HasExtXCoreVHwlp], hasSideEffects = 0, mayLoad = 0, mayStore = 0 in {
  def CV_STARTI  : RVInstHwlp_i<0b000, (ins cv_uimm1:$imm1, cv_uimm12:$imm12),
                                "cv.starti", "$imm1, $imm12">,
                   Sched<[]>;
  def CV_ENDI    : RVInstHwlp_i<0b001, (ins cv_uimm1:$imm1, cv_uimm12:$imm12),
                                "cv.endi", "$imm1, $imm12">,
                   Sched<[]>;
  def CV_COUNT   : RVInstHwlp_r<0b010, (ins cv_uimm1:$imm1, GPR:$rs1),
                                "cv.count", "$imm1, $rs1">,
                   Sched<[]>;
  def CV_COUNTI  : RVInstHwlp_i<0b011, (ins cv_uimm1:$imm1, uimm12:$imm12),
                                "cv.counti", "$imm1, $imm12">,
                   Sched<[]>;
  def CV_SETUP   : RVInstHwlp_ri<0b100, (ins cv_uimm1:$imm1, GPR:$rs1, cv_uimm12:$imm12),
                                 "cv.setup", "$imm1, $rs1, $imm12">,
                   Sched<[]>;
  def CV_SETUPI  : RVInstHwlp_ii<0b101, (ins cv_uimm1:$imm1, cv_uimm5:$imm5, uimm12:$imm12),
                              "cv.setupi", "$imm1, $imm12, $imm5">,
                Sched<[]>;
} // Predicates = [HasExtXCoreVHwlp], hasSideEffects = 0, mayLoad = 0, mayStore = 0
