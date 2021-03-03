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

let Predicates = [HasExtXCoreVAlu], hasSideEffects = 0, mayLoad = 0, mayStore = 0 in {
  // General ALU Operations
  def CV_ABS    : RVInstAlu_r<0b0000010, 0b000, (outs GPR:$rd), (ins GPR:$rs1),
                              "cv.abs", "$rd, $rs1", []>,
                  Sched<[]>;
  def CV_SLET   : RVInstAlu_rr<0b0000010, 0b010, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                               "cv.slet", "$rd, $rs1, $rs2", []>,
                  Sched<[]>;
  def CV_SLETU  : RVInstAlu_rr<0b0000010, 0b011, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                               "cv.sletu", "$rd, $rs1, $rs2", []>,
                  Sched<[]>;
  def CV_MIN    : RVInstAlu_rr<0b0000010, 0b100, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                               "cv.min", "$rd, $rs1, $rs2", []>,
                  Sched<[]>;
  def CV_MINU   : RVInstAlu_rr<0b0000010, 0b101, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                               "cv.minu", "$rd, $rs1, $rs2", []>,
                  Sched<[]>;
  def CV_MAX    : RVInstAlu_rr<0b0000010, 0b110, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                               "cv.max", "$rd, $rs1, $rs2", []>,
                  Sched<[]>;
  def CV_MAXU   : RVInstAlu_rr<0b0000010, 0b111, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                               "cv.maxu", "$rd, $rs1, $rs2", []>,
                  Sched<[]>;
  def CV_EXTHS  : RVInstAlu_r<0b0001000, 0b100, (outs GPR:$rd), (ins GPR:$rs1),
                              "cv.exths", "$rd, $rs1", []>,
                  Sched<[]>;
  def CV_EXTHZ  : RVInstAlu_r<0b0001000, 0b101, (outs GPR:$rd), (ins GPR:$rs1),
                              "cv.exthz", "$rd, $rs1", []>,
                  Sched<[]>;
  def CV_EXTBS  : RVInstAlu_r<0b0001000, 0b110, (outs GPR:$rd), (ins GPR:$rs1),
                              "cv.extbs", "$rd, $rs1", []>,
                  Sched<[]>;
  def CV_EXTBZ  : RVInstAlu_r<0b0001000, 0b111, (outs GPR:$rd), (ins GPR:$rs1),
                              "cv.extbz", "$rd, $rs1", []>,
                  Sched<[]>;

  def CV_CLIP   : RVInstAlu_ri<0b0001010, 0b001, (outs GPR:$rd), (ins GPR:$rs1, uimm5:$imm5),
                               "cv.clip", "$rd, $rs1, $imm5", []>,
                  Sched<[]>;
  def CV_CLIPU  : RVInstAlu_ri<0b0001010, 0b010, (outs GPR:$rd), (ins GPR:$rs1, uimm5:$imm5),
                               "cv.clipu", "$rd, $rs1, $imm5", []>,
                  Sched<[]>;
  def CV_CLIPR  : RVInstAlu_rr<0b0001010, 0b101, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                               "cv.clipr", "$rd, $rs1, $rs2", []>,
                  Sched<[]>;
  def CV_CLIPUR : RVInstAlu_rr<0b0001010, 0b110, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                               "cv.clipur", "$rd, $rs1, $rs2", []>,
                  Sched<[]>;

  def CV_ADDN   : RVInstAlu_rri<0b00, 0b010, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                "cv.addn", "$rd, $rs1, $rs2, $imm5", []>,
                  Sched<[]>;
  def CV_ADDUN  : RVInstAlu_rri<0b10, 0b010, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                "cv.addun", "$rd, $rs1, $rs2, $imm5", []>,
                  Sched<[]>;
  def CV_ADDRN  : RVInstAlu_rri<0b00, 0b110, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                "cv.addrn", "$rd, $rs1, $rs2, $imm5", []>,
                  Sched<[]>;
  def CV_ADDURN : RVInstAlu_rri<0b10, 0b110, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                "cv.addurn", "$rd, $rs1, $rs2, $imm5", []>,
                  Sched<[]>;
  def CV_SUBN   : RVInstAlu_rri<0b00, 0b011, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                "cv.subn", "$rd, $rs1, $rs2, $imm5", []>,
                  Sched<[]>;
  def CV_SUBUN  : RVInstAlu_rri<0b10, 0b011, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                "cv.subun", "$rd, $rs1, $rs2, $imm5", []>,
                  Sched<[]>;
  def CV_SUBRN  : RVInstAlu_rri<0b00, 0b111, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                "cv.subrn", "$rd, $rs1, $rs2, $imm5", []>,
                  Sched<[]>;
  def CV_SUBURN : RVInstAlu_rri<0b10, 0b111, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                "cv.suburn", "$rd, $rs1, $rs2, $imm5", []>,
                  Sched<[]>;
} // Predicates = [HasExtXCoreVAlu], hasSideEffects = 0, mayLoad = 0, mayStore = 0

let Predicates = [HasExtXCoreVAlu], hasSideEffects = 0, mayLoad = 0, mayStore = 0, Opcode = OPC_CUSTOM2.Value, Constraints = "$rd = $rd_wb" in {
  def CV_ADDNR   : RVInstAlu_rr<0b0100000, 0b010, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                                "cv.addnr", "$rd, $rs1, $rs2", []>,
                   Sched<[]>;
  def CV_ADDUNR  : RVInstAlu_rr<0b1100000, 0b010, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                                "cv.addunr", "$rd, $rs1, $rs2", []>,
                   Sched<[]>;
  def CV_ADDRNR  : RVInstAlu_rr<0b0100000, 0b110, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                                "cv.addrnr", "$rd, $rs1, $rs2", []>,
                   Sched<[]>;
  def CV_ADDURNR : RVInstAlu_rr<0b1100000, 0b110, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                                "cv.addurnr", "$rd, $rs1, $rs2", []>,
                   Sched<[]>;
  def CV_SUBNR   : RVInstAlu_rr<0b0100000, 0b011, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                                "cv.subnr", "$rd, $rs1, $rs2", []>,
                   Sched<[]>;
  def CV_SUBUNR  : RVInstAlu_rr<0b1100000, 0b011, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                                "cv.subunr", "$rd, $rs1, $rs2", []>,
                   Sched<[]>;
  def CV_SUBRNR  : RVInstAlu_rr<0b0100000, 0b111, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                                "cv.subrnr", "$rd, $rs1, $rs2", []>,
                   Sched<[]>;
  def CV_SUBURNR : RVInstAlu_rr<0b1100000, 0b111, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                                "cv.suburnr", "$rd, $rs1, $rs2", []>,
                   Sched<[]>;

} // Predicates = [HasExtXCoreVAlu], hasSideEffects = 0, mayLoad = 0, mayStore = 0, Opcode = OPC_CUSTOM2.Value, Constraints = "$rd = $rd_wb"

let Predicates = [HasExtXCoreVAlu], hasSideEffects = 0, mayLoad = 0, mayStore = 0, isBranch = 1, isTerminator = 1 in {
  // Immediate branching operations
  def CV_BEQIMM : RVInstImmBranch<0b010, (outs), (ins GPR:$rs1, simm5:$imm5, simm13_lsb0:$imm12),
                                  "cv.beqimm", "$rs1, $imm5, $imm12", []>,
                  Sched<[]>;
  def CV_BNEIMM : RVInstImmBranch<0b011, (outs), (ins GPR:$rs1, simm5:$imm5, simm13_lsb0:$imm12),
                                  "cv.bneimm", "$rs1, $imm5, $imm12", []>,
                  Sched<[]>;

} // Predicates = [HasExtXCoreVAlu], hasSideEffects = 0, mayLoad = 0, mayStore = 0, isBranch = 1, isTerminator = 1

let Predicates = [HasExtXCoreVMem], hasSideEffects = 0, mayLoad = 1, mayStore = 0, Constraints = "$rs1_wb = $rs1" in {
  // Register-Immediate load with post-increment
  def CV_LB_ri_inc  : RVInstLoad_ri_inc<0b000, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, simm12:$imm12),
                                        "cv.lb", "$rd, ${imm12}(${rs1}!)", []>,
                      Sched<[]>;
  def CV_LBU_ri_inc : RVInstLoad_ri_inc<0b100, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, simm12:$imm12),
                                        "cv.lbu", "$rd, ${imm12}(${rs1}!)", []>,
                      Sched<[]>;
  def CV_LH_ri_inc  : RVInstLoad_ri_inc<0b001, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, simm12:$imm12),
                                        "cv.lh", "$rd, ${imm12}(${rs1}!)", []>,
                      Sched<[]>;
  def CV_LHU_ri_inc : RVInstLoad_ri_inc<0b101, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, simm12:$imm12),
                                        "cv.lhu", "$rd, ${imm12}(${rs1}!)", []>,
                      Sched<[]>;
  def CV_LW_ri_inc  : RVInstLoad_ri_inc<0b010, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, simm12:$imm12),
                                        "cv.lw", "$rd, ${imm12}(${rs1}!)", []>,
                      Sched<[]>;

  // Register-Register load with post-increment
  def CV_LB_rr_inc  : RVInstLoad_rr_inc<0b0000000, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lb", "$rd, ${rs2}(${rs1}!)", []>,
                      Sched<[]>;
  def CV_LBU_rr_inc : RVInstLoad_rr_inc<0b0100000, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lbu", "$rd, ${rs2}(${rs1}!)", []>,
                      Sched<[]>;
  def CV_LH_rr_inc  : RVInstLoad_rr_inc<0b0001000, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lh", "$rd, ${rs2}(${rs1}!)", []>,
                      Sched<[]>;
  def CV_LHU_rr_inc : RVInstLoad_rr_inc<0b0101000, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lhu", "$rd, ${rs2}(${rs1}!)", []>,
                      Sched<[]>;
  def CV_LW_rr_inc  : RVInstLoad_rr_inc<0b0010000, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lw", "$rd, ${rs2}(${rs1}!)", []>,
                      Sched<[]>;
} // Predicates = [HasExtXCoreVMem], hasSideEffects = 0, mayLoad = 1, mayStore = 0, Constraints = "$rs1_wb = $rs1"

let Predicates = [HasExtXCoreVMem], hasSideEffects = 0, mayLoad = 1, mayStore = 0 in {
  // Register-Register load
  def CV_LB_rr  : RVInstLoad_rr<0b0000000, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lb", "$rd, ${rs2}(${rs1})", []>,
                      Sched<[]>;
  def CV_LBU_rr : RVInstLoad_rr<0b0100000, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lbu", "$rd, ${rs2}(${rs1})", []>,
                      Sched<[]>;
  def CV_LH_rr  : RVInstLoad_rr<0b0001000, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lh", "$rd, ${rs2}(${rs1})", []>,
                      Sched<[]>;
  def CV_LHU_rr : RVInstLoad_rr<0b0101000, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lhu", "$rd, ${rs2}(${rs1})", []>,
                      Sched<[]>;
  def CV_LW_rr  : RVInstLoad_rr<0b0010000, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lw", "$rd, ${rs2}(${rs1})", []>,
                      Sched<[]>;

} // Predicates = [HasExtXCoreVMem], hasSideEffects = 0, mayLoad = 1, mayStore = 0

let Predicates = [HasExtXCoreVMem], hasSideEffects = 0, mayLoad = 0, mayStore = 1, Constraints = "$rs1_wb = $rs1" in {
  // Register-Immediate store with post-increment
  def CV_SB_ri_inc : RVInstStore_ri_inc<0b000, (outs GPR:$rs1_wb), (ins GPR:$rs2, GPR:$rs1, simm12:$imm12),
                                        "cv.sb", "$rs2, ${imm12}(${rs1}!)", []>,
                     Sched<[]>;
  def CV_SH_ri_inc : RVInstStore_ri_inc<0b001, (outs GPR:$rs1_wb), (ins GPR:$rs2, GPR:$rs1, simm12:$imm12),
                                        "cv.sh", "$rs2, ${imm12}(${rs1}!)", []>,
                     Sched<[]>;
  def CV_SW_ri_inc : RVInstStore_ri_inc<0b010, (outs GPR:$rs1_wb), (ins GPR:$rs2, GPR:$rs1, simm12:$imm12),
                                        "cv.sw", "$rs2, ${imm12}(${rs1}!)", []>,
                     Sched<[]>;

  // Register-Register store with post-increment
  def CV_SB_rr_inc : RVInstStore_rr_inc<0b100, (outs GPR:$rs1_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rs3),
                                        "cv.sb", "$rs2, ${rs3}(${rs1}!)", []>,
                     Sched<[]>;
  def CV_SH_rr_inc : RVInstStore_rr_inc<0b101, (outs GPR:$rs1_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rs3),
                                        "cv.sh", "$rs2, ${rs3}(${rs1}!)", []>,
                     Sched<[]>;
  def CV_SW_rr_inc : RVInstStore_rr_inc<0b110, (outs GPR:$rs1_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rs3),
                                        "cv.sw", "$rs2, ${rs3}(${rs1}!)", []>,
                     Sched<[]>;
} // Predicates = [HasExtXCoreVMem], hasSideEffects = 0, mayLoad = 0, mayStore = 1, Constraints = "$rs1_wb = $rs1"

let Predicates = [HasExtXCoreVMem], hasSideEffects = 0, mayLoad = 0, mayStore = 1 in {
  // Register-Register store
  def CV_SB_rr : RVInstStore_rr<0b100, (outs), (ins GPR:$rs2, GPR:$rs1, GPR:$rs3),
                                "cv.sb", "$rs2, ${rs3}(${rs1})", []>,
                 Sched<[]>;
  def CV_SH_rr : RVInstStore_rr<0b101, (outs), (ins GPR:$rs2, GPR:$rs1, GPR:$rs3),
                                "cv.sh", "$rs2, ${rs3}(${rs1})", []>,
                 Sched<[]>;
  def CV_SW_rr : RVInstStore_rr<0b110, (outs), (ins GPR:$rs2, GPR:$rs1, GPR:$rs3),
                                "cv.sw", "$rs2, ${rs3}(${rs1})", []>,
                 Sched<[]>;

} // Predicates = [HasExtXCoreVMem], hasSideEffects = 0, mayLoad = 0, mayStore = 1



//===----------------------------------------------------------------------===//
// CORE-V specific helper fragments
//===----------------------------------------------------------------------===//

def powerOf2 : ImmLeaf<XLenVT, [{ return isPowerOf2_32(Imm); }]>;
def powerOf2Minus1 : ImmLeaf<XLenVT, [{ return isPowerOf2_32(Imm+1); }]>;
def negativePowerOf2 : ImmLeaf<XLenVT, [{ return isPowerOf2_32(-Imm); }]>;

def shiftRound : PatFrag<(ops node:$value, node:$shiftAmount),
                         (sra (add node:$value, powerOf2), node:$shiftAmount), [{

  if (auto powerOf2 = dyn_cast<ConstantSDNode>(N->getOperand(0)->getOperand(1)))
    return (powerOf2->getZExtValue() << 1) == (1U << N->getConstantOperandVal(1));
  return false;
}]>;

def ushiftRound : PatFrag<(ops node:$value, node:$shiftAmount),
                          (srl (add node:$value, powerOf2), node:$shiftAmount), [{

  if (auto powerOf2 = dyn_cast<ConstantSDNode>(N->getOperand(0)->getOperand(1)))
    return (powerOf2->getZExtValue() << 1) == (1U << N->getConstantOperandVal(1));
  return false;
}]>;

def muls   : PatFrag<(ops node:$rs1, node:$rs2),
                     (mul (sext_inreg node:$rs1, i16), (sext_inreg node:$rs2, i16))>;
def mulhhs : PatFrag<(ops node:$rs1, node:$rs2),
                     (mul (sra node:$rs1, (i32 16)), (sra node:$rs2, (i32 16)))>;
def mulu   : PatFrag<(ops node:$rs1, node:$rs2),
                     (mul (and node:$rs1, 0xffff), (and node:$rs2, 0xffff))>;
def mulhhu : PatFrag<(ops node:$rs1, node:$rs2),
                     (mul (srl node:$rs1, (i32 16)), (srl node:$rs2, (i32 16)))>;

def macs   : PatFrag<(ops node:$rd, node:$rs1, node:$rs2),
                     (add node:$rd, (muls node:$rs1, node:$rs2))>;
def machhs : PatFrag<(ops node:$rd, node:$rs1, node:$rs2),
                     (add node:$rd, (mulhhs node:$rs1, node:$rs2))>;
def macu   : PatFrag<(ops node:$rd, node:$rs1, node:$rs2),
                     (add node:$rd, (mulu node:$rs1, node:$rs2))>;
def machhu : PatFrag<(ops node:$rd, node:$rs1, node:$rs2),
                     (add node:$rd, (mulhhu node:$rs1, node:$rs2))>;

def between : PatFrags<(ops node:$lowerBound, node:$upperBound, node:$value),
                       [(smin (smax node:$value, node:$lowerBound), node:$upperBound),
                        (smax (smin node:$value, node:$upperBound), node:$lowerBound)]>;

def betweenu : PatFrags<(ops node:$upperBound, node:$value),
                        [(umin (umax node:$value, 0), node:$upperBound),
                         (umax (umin node:$value, node:$upperBound), 0)]>;


def clip : PatFrag<(ops node:$upperBound, node:$value),
                   (between negativePowerOf2, node:$upperBound, node:$value), [{
  // Checking lower & upper bound for the clip instruction
  if (auto bound1 = dyn_cast<ConstantSDNode>(N->getOperand(0)->getOperand(1))) {
    if (auto bound2 = dyn_cast<ConstantSDNode>(N->getOperand(1))) {
      return (bound1->getSExtValue() == ~bound2->getSExtValue());
    }
  }
  return false;
}]>;

def roundBit : PatFrag<(ops node:$shiftAmount),
                       (srl (shl 1, node:$shiftAmount), (i32 1))>;

def trailing1sPlus1 : SDNodeXForm<imm, [{
  return CurDAG->getTargetConstant(
                          countTrailingOnes<uint32_t>(N->getSExtValue()) + 1,
                          SDLoc(N), N->getValueType(0));
}]>;

//===----------------------------------------------------------------------===//
// Patterns for MAC operations
//===----------------------------------------------------------------------===//


let Predicates = [HasExtXCoreVMac] in {

  def : Pat<(add GPR:$rd, (mul GPR:$rs1, GPR:$rs2)),
            (CV_MAC GPR:$rd, GPR:$rs1, GPR:$rs2)>;
  def : Pat<(sub GPR:$rd, (mul GPR:$rs1, GPR:$rs2)),
            (CV_MSU GPR:$rd, GPR:$rs1, GPR:$rs2)>;

  def : Pat<(muls GPR:$rs1, GPR:$rs2),
            (CV_MULS GPR:$rs1, GPR:$rs2)>;
  def : Pat<(mulhhs GPR:$rs1, GPR:$rs2),
            (CV_MULHHS GPR:$rs1, GPR:$rs2)>;
  def : Pat<(sra (muls GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MULSN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(sra (mulhhs GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MULHHSN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(shiftRound (muls GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MULSRN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(shiftRound (mulhhs GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MULHHSRN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;

  def : Pat<(mulu GPR:$rs1, GPR:$rs2),
            (CV_MULU GPR:$rs1, GPR:$rs2)>;
  def : Pat<(mulhhu GPR:$rs1, GPR:$rs2),
            (CV_MULHHU GPR:$rs1, GPR:$rs2)>;
  def : Pat<(srl (mulu GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MULUN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(srl (mulhhu GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MULHHUN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(ushiftRound (mulu GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MULURN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(ushiftRound (mulhhu GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MULHHURN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;

  def : Pat<(sra (macs GPR:$rd, GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MACSN GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(sra (machhs GPR:$rd, GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MACHHSN GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(shiftRound (macs GPR:$rd, GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MACSRN GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(shiftRound (machhs GPR:$rd, GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MACHHSRN GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;

  def : Pat<(srl (macu GPR:$rd, GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MACUN GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(srl (machhu GPR:$rd, GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MACHHUN GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(ushiftRound (macu GPR:$rd, GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MACURN GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(ushiftRound (machhu GPR:$rd, GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MACHHURN GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;

}

//===----------------------------------------------------------------------===//
// Patterns for general ALU operations
//===----------------------------------------------------------------------===//

let Predicates = [HasExtXCoreVAlu] in {

  def : Pat<(abs GPR:$rs1), (CV_ABS GPR:$rs1)>;
  def : PatGprGpr<setle, CV_SLET>;
  def : PatGprGpr<setule, CV_SLETU>;
  def : PatGprGpr<smin, CV_MIN>;
  def : PatGprGpr<umin, CV_MINU>;
  def : PatGprGpr<smax, CV_MAX>;
  def : PatGprGpr<umax, CV_MAXU>;

  def : Pat<(sext_inreg GPR:$rs1, i16), (CV_EXTHS GPR:$rs1)>;
  def : Pat<(sext_inreg GPR:$rs1, i8), (CV_EXTBS GPR:$rs1)>;
  def : Pat<(and GPR:$rs1, 0xffff), (CV_EXTHZ GPR:$rs1)>;
  def : Pat<(and GPR:$rs1, 0xff), (CV_EXTBZ GPR:$rs1)>;

  def : Pat<(clip powerOf2Minus1:$upperBound, GPR:$rs1),
            (CV_CLIP GPR:$rs1, (trailing1sPlus1 imm:$upperBound))>;
  def : Pat<(between (not GPR:$rs2), GPR:$rs2, GPR:$rs1),
            (CV_CLIPR GPR:$rs1, GPR:$rs2)>;
  def : Pat<(betweenu powerOf2Minus1:$upperBound, GPR:$rs1),
            (CV_CLIPU GPR:$rs1, (trailing1sPlus1 imm:$upperBound))>;
  def : Pat<(betweenu GPR:$rs2, GPR:$rs1),
            (CV_CLIPUR GPR:$rs1, GPR:$rs2)>;

  def : Pat<(sra (add GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_ADDN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(srl (add GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_ADDUN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(shiftRound (add GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_ADDRN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(ushiftRound (add GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_ADDURN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;

  def : Pat<(sra (sub GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_SUBN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(srl (sub GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_SUBUN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(shiftRound (sub GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_SUBRN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(ushiftRound (sub GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_SUBURN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;

  def : Pat<(sra (add GPR:$rd, GPR:$rs1), GPR:$rs2),
            (CV_ADDNR GPR:$rd, GPR:$rs1, GPR:$rs2)>;
  def : Pat<(srl (add GPR:$rd, GPR:$rs1), GPR:$rs2),
            (CV_ADDUNR GPR:$rd, GPR:$rs1, GPR:$rs2)>;
  def : Pat<(sra (add (add GPR:$rd, GPR:$rs1), (roundBit GPR:$rs2)), GPR:$rs2),
            (CV_ADDRNR  GPR:$rd, GPR:$rs1, GPR:$rs2)>;
  def : Pat<(srl (add (add GPR:$rd, GPR:$rs1), (roundBit GPR:$rs2)), GPR:$rs2),
            (CV_ADDURNR GPR:$rd, GPR:$rs1, GPR:$rs2)>;

  def : Pat<(sra (sub GPR:$rd, GPR:$rs1), GPR:$rs2),
            (CV_SUBNR GPR:$rd, GPR:$rs1, GPR:$rs2)>;
  def : Pat<(srl (sub GPR:$rd, GPR:$rs1), GPR:$rs2),
            (CV_SUBUNR GPR:$rd, GPR:$rs1, GPR:$rs2)>;
  def : Pat<(sra (add (sub GPR:$rd, GPR:$rs1), (roundBit GPR:$rs2)), GPR:$rs2),
            (CV_SUBRNR  GPR:$rd, GPR:$rs1, GPR:$rs2)>;
  def : Pat<(srl (add (sub GPR:$rd, GPR:$rs1), (roundBit GPR:$rs2)), GPR:$rs2),
            (CV_SUBURNR GPR:$rd, GPR:$rs1, GPR:$rs2)>;


//===----------------------------------------------------------------------===//
// Patterns for immediate branching operations
//===----------------------------------------------------------------------===//

  def : Pat<(brcond (XLenVT (seteq GPR:$rs1, simm5:$imm5)), bb:$imm12),
            (CV_BEQIMM GPR:$rs1, simm5:$imm5, simm13_lsb0:$imm12)>;
  def : Pat<(brcond (XLenVT (setne GPR:$rs1, simm5:$imm5)), bb:$imm12),
            (CV_BNEIMM GPR:$rs1, simm5:$imm5, simm13_lsb0:$imm12)>;

}

//===----------------------------------------------------------------------===//
// Patterns for load & store operations
//===----------------------------------------------------------------------===//

let Predicates = [HasExtXCoreVMem] in {

  def : Pat<(sextloadi8 (add GPR:$base, GPR:$offset)),
            (CV_LB_rr GPR:$base, GPR:$offset)>;
  def : Pat<(zextloadi8 (add GPR:$base, GPR:$offset)),
            (CV_LBU_rr GPR:$base, GPR:$offset)>;
  def : Pat<(extloadi8 (add GPR:$base, GPR:$offset)),
            (CV_LBU_rr GPR:$base, GPR:$offset)>;
  def : Pat<(sextloadi16 (add GPR:$base, GPR:$offset)),
            (CV_LH_rr GPR:$base, GPR:$offset)>;
  def : Pat<(zextloadi16 (add GPR:$base, GPR:$offset)),
            (CV_LHU_rr GPR:$base, GPR:$offset)>;
  def : Pat<(extloadi16 (add GPR:$base, GPR:$offset)),
            (CV_LHU_rr GPR:$base, GPR:$offset)>;
  def : Pat<(load (add GPR:$base, GPR:$offset)),
            (CV_LW_rr GPR:$base, GPR:$offset)>;

  def : Pat<(post_truncsti8 GPR:$val, GPR:$base, simm12:$offset),
            (CV_SB_ri_inc GPR:$val, GPR:$base, simm12:$offset)>;
  def : Pat<(post_truncsti16 GPR:$val, GPR:$base, simm12:$offset),
            (CV_SH_ri_inc GPR:$val, GPR:$base, simm12:$offset)>;
  def : Pat<(post_store GPR:$val, GPR:$base, simm12:$offset),
            (CV_SW_ri_inc GPR:$val, GPR:$base, simm12:$offset)>;

  def : Pat<(post_truncsti8 GPR:$val, GPR:$base, GPR:$offset),
            (CV_SB_rr_inc GPR:$val, GPR:$base, GPR:$offset)>;
  def : Pat<(post_truncsti16 GPR:$val, GPR:$base, GPR:$offset),
            (CV_SH_rr_inc GPR:$val, GPR:$base, GPR:$offset)>;
  def : Pat<(post_store GPR:$val, GPR:$base, GPR:$offset),
            (CV_SW_rr_inc GPR:$val, GPR:$base, GPR:$offset)>;

  def : Pat<(truncstorei8 GPR:$val, (add GPR:$base, GPR:$offset)),
            (CV_SB_rr GPR:$val, GPR:$base, GPR:$offset)>;
  def : Pat<(truncstorei16 GPR:$val, (add GPR:$base, GPR:$offset)),
            (CV_SH_rr GPR:$val, GPR:$base, GPR:$offset)>;
  def : Pat<(store GPR:$val, (add GPR:$base, GPR:$offset)),
            (CV_SW_rr GPR:$val, GPR:$base, GPR:$offset)>;

}
