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

//===----------------------------------------------------------------------===//
// CORE-V specific instructions
//===----------------------------------------------------------------------===//

let Predicates = [HasExtXCoreVHwlp], hasSideEffects = 1, mayLoad = 0, mayStore = 0 in {
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
  def CV_SETUPI  : RVInstHwlp_ii<0b101, (ins cv_uimm1:$imm1, uimm12:$imm12, cv_uimm5:$imm5),
                              "cv.setupi", "$imm1, $imm12, $imm5">,
                Sched<[]>;
} // Predicates = [HasExtXCoreVHwlp], hasSideEffects = 1, mayLoad = 0, mayStore = 0

let Predicates = [HasExtXCoreVMac], hasSideEffects = 0, mayLoad = 0, mayStore = 0, Constraints = "$rd = $rd_wb" in {
  // 32x32 bit macs
  def CV_MAC      : RVInstMac<0b0100001, 0b000, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                              "cv.mac", "$rd, $rs1, $rs2", []>,
                    Sched<[]>;
  def CV_MSU      : RVInstMac<0b0100001, 0b001, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                              "cv.msu", "$rd, $rs1, $rs2", []>,
                    Sched<[]>;

  // Signed 16x16 bit macs with imm
  def CV_MACSN    : RVInstMac16I<0b10, 0b001, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.macsn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MACHHSN  : RVInstMac16I<0b11, 0b001, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.machhsn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MACSRN   : RVInstMac16I<0b10, 0b101, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.macsrn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MACHHSRN : RVInstMac16I<0b11, 0b101, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.machhsrn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;

  // Unsigned 16x16 bit macs with imm
  def CV_MACUN    : RVInstMac16I<0b00, 0b001, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.macun", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MACHHUN  : RVInstMac16I<0b01, 0b001, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.machhun", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MACURN   : RVInstMac16I<0b00, 0b101, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.macurn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MACHHURN : RVInstMac16I<0b01, 0b101, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.machhurn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
} // Predicates = [HasExtXCoreVMac], hasSideEffects = 0, mayLoad = 0, mayStore = 0, Constraints = "$rd = $rd_wb"

let Predicates = [HasExtXCoreVMac], hasSideEffects = 0, mayLoad = 0, mayStore = 0 in {
  // Signed 16x16 bit muls
  def CV_MULS     : RVInstMac16<0b10, 0b000, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                                "cv.muls", "$rd, $rs1, $rs2", []>,
                    Sched<[]>;
  def CV_MULHHS   : RVInstMac16<0b11, 0b000, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                                "cv.mulhhs", "$rd, $rs1, $rs2", []>,
                    Sched<[]>;

  // Signed 16x16 bit muls with imm
  def CV_MULSN    : RVInstMac16I<0b10, 0b000, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.mulsn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MULHHSN  : RVInstMac16I<0b11, 0b000, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.mulhhsn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MULSRN   : RVInstMac16I<0b10, 0b100, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.mulsrn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MULHHSRN : RVInstMac16I<0b11, 0b100, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.mulhhsrn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;

  // Unsigned 16x16 bit muls
  def CV_MULU     : RVInstMac16<0b00, 0b000, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                                "cv.mulu", "$rd, $rs1, $rs2", []>,
                    Sched<[]>;
  def CV_MULHHU   : RVInstMac16<0b01, 0b000, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                                "cv.mulhhu", "$rd, $rs1, $rs2", []>,
                    Sched<[]>;

  // Unsigned 16x16 bit muls with imm
  def CV_MULUN    : RVInstMac16I<0b00, 0b000, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.mulun", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MULHHUN  : RVInstMac16I<0b01, 0b000, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.mulhhun", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MULURN   : RVInstMac16I<0b00, 0b100, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.mulurn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MULHHURN : RVInstMac16I<0b01, 0b100, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.mulhhurn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
} // Predicates = [HasExtXCoreVMac], hasSideEffects = 0, mayLoad = 0, mayStore = 0
