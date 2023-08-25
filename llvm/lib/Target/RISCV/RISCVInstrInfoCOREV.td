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

def AddrRegReg : ComplexPattern<iPTR, 2, "SelectAddrRegReg">;

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
               ImmLeaf<XLenVT, [{return isShiftedUInt<5, 2>(Imm);}]> {
  let ParserMatchClass = CVUImmAsmOperand<5>;
  let EncoderMethod = "getImmOpValueAsr2";
  let DecoderMethod = "decodeUImmOperandAndLsl2<5>";
  let MCOperandPredicate = [{
    int64_t Imm;
    if (MCOp.evaluateAsConstantImm(Imm))
      return isShiftedUInt<5, 2>(Imm);
    return MCOp.isBareSymbolRef();
  }];
  let OperandType = "OPERAND_UIMM5";
  let OperandNamespace = "RISCVOp";
}

def cv_uimm12 : Operand<XLenVT>,
                ImmLeaf<XLenVT, [{return isShiftedUInt<12, 2>(Imm);}]> {
  let ParserMatchClass = CVUImmAsmOperand<12>;
  let EncoderMethod = "getImmOpValueAsr2";
  let DecoderMethod = "decodeUImmOperandAndLsl2<12>";
  let MCOperandPredicate = [{
    int64_t Imm;
    if (MCOp.evaluateAsConstantImm(Imm))
      return isShiftedUInt<12, 2>(Imm);
    return MCOp.isBareSymbolRef();
  }];
  let OperandType = "OPERAND_UIMM12";
  let OperandNamespace = "RISCVOp";
}

def cv_tsimm6 : Operand<XLenVT>, TImmLeaf<XLenVT, [{return isInt<6>(Imm);}]> {
  let ParserMatchClass = SImmAsmOperand<6>;
  let EncoderMethod = "getImmOpValue";
  let DecoderMethod = "decodeSImmOperand<6>";
  let OperandType = "OPERAND_SIMM6";
  let MCOperandPredicate = [{
    int64_t Imm;
    return MCOp.evaluateAsConstantImm(Imm) && isUInt<6>(Imm);
  }];
  let OperandNamespace = "RISCVOp";
}

def cv_uimm6 : Operand<XLenVT>, ImmLeaf<XLenVT, [{return isUInt<6>(Imm);}]> {
  let ParserMatchClass = CVUImmAsmOperand<6>;
  let EncoderMethod = "getImmOpValue";
  let DecoderMethod = "decodeUImmOperand<6>";
  let OperandType = "OPERAND_UIMM6";
  let MCOperandPredicate = [{
    int64_t Imm;
    return MCOp.evaluateAsConstantImm(Imm) && isUInt<6>(Imm);
  }];
  let OperandNamespace = "RISCVOp";
}

def cv_imm8: Operand<XLenVT>, TImmLeaf<XLenVT, [{return isUInt<8>(Imm);}]>;

def cv_tuimm2: Operand<XLenVT>, TImmLeaf<XLenVT, [{return isUInt<2>(Imm);}]>;
def cv_tuimm5: Operand<XLenVT>, TImmLeaf<XLenVT, [{return isUInt<5>(Imm);}]>;
def cv_uimm10: Operand<XLenVT>, ImmLeaf<XLenVT, [{return isUInt<10>(Imm);}]>;
def cv_tuimm10: Operand<XLenVT>, TImmLeaf<XLenVT, [{return isUInt<10>(Imm);}]>;

def cv_uimm32: Operand<XLenVT>,
               ImmLeaf<XLenVT, [{return isPowerOf2_32(Imm + 1);}]>;


//===----------------------------------------------------------------------===//
// CORE-V specific instructions
//===----------------------------------------------------------------------===//

let Predicates = [HasExtXcvhwlp], hasSideEffects = 1, mayLoad = 0, mayStore = 0 in {
  def CV_STARTI  : RVInstHwlp_i<0b0000, (ins cv_uimm1:$imm1, cv_uimm12:$imm12),
                                "cv.starti", "$imm1, $imm12">,
                   Sched<[]>;
  def CV_START  : RVInstHwlp_r<0b0001, (ins cv_uimm1:$imm1, GPR:$rs1),
                             "cv.start", "$imm1, $rs1">,
                 Sched<[]>;
  def CV_ENDI    : RVInstHwlp_i<0b0010, (ins cv_uimm1:$imm1, cv_uimm12:$imm12),
                                "cv.endi", "$imm1, $imm12">,
                   Sched<[]>;
  def CV_END    : RVInstHwlp_r<0b0011, (ins cv_uimm1:$imm1, GPR:$rs1),
                             "cv.end", "$imm1, $rs1">,
                    Sched<[]>;
  def CV_COUNTI  : RVInstHwlp_i<0b0100, (ins cv_uimm1:$imm1, uimm12:$imm12),
                                "cv.counti", "$imm1, $imm12">,
                   Sched<[]>;
  def CV_COUNT   : RVInstHwlp_r<0b0101, (ins cv_uimm1:$imm1, GPR:$rs1),
                                "cv.count", "$imm1, $rs1">,
                   Sched<[]>;
  def CV_SETUPI  : RVInstHwlp_ii<0b0110, (ins cv_uimm1:$imm1, uimm12:$imm12, cv_uimm5:$imm5),
                              "cv.setupi", "$imm1, $imm12, $imm5">,
                Sched<[]>;
  def CV_SETUP   : RVInstHwlp_ri<0b0111, (ins cv_uimm1:$imm1, GPR:$rs1, cv_uimm12:$imm12),
                                 "cv.setup", "$imm1, $rs1, $imm12">,
                   Sched<[]>;
} // Predicates = [HasExtXcvhwlp], hasSideEffects = 1, mayLoad = 0, mayStore = 0

let Predicates = [HasExtXcvmac], hasSideEffects = 0, mayLoad = 0, mayStore = 0, Constraints = "$rd = $rd_wb" in {
  // 32x32 bit macs
  def CV_MAC      : RVInstMac<0b1001000, 0b011, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                              "cv.mac", "$rd, $rs1, $rs2", []>,
                    Sched<[]>;
  def CV_MSU      : RVInstMac<0b1001001, 0b011, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                              "cv.msu", "$rd, $rs1, $rs2", []>,
                    Sched<[]>;

  // Signed 16x16 bit macs with imm
  def CV_MACSN    : RVInstMac16I<0b00, 0b110, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.macsn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MACHHSN  : RVInstMac16I<0b01, 0b110, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.machhsn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MACSRN   : RVInstMac16I<0b10, 0b110, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.macsrn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MACHHSRN : RVInstMac16I<0b11, 0b110, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.machhsrn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;

  // Unsigned 16x16 bit macs with imm
  def CV_MACUN    : RVInstMac16I<0b00, 0b111, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.macun", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MACHHUN  : RVInstMac16I<0b01, 0b111, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.machhun", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MACURN   : RVInstMac16I<0b10, 0b111, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.macurn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MACHHURN : RVInstMac16I<0b11, 0b111, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.machhurn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
} // Predicates = [HasExtXcvmac], hasSideEffects = 0, mayLoad = 0, mayStore = 0, Constraints = "$rd = $rd_wb"


class CVSIMDALURR<bits<5> funct5, bit F, bit funct1, bits<3> funct3, string opcodestr>
    : CVInstSIMDRR<funct5, F, funct1, funct3, OPC_CUSTOM3, (outs GPR:$rd),
              (ins GPR:$rs1, GPR:$rs2), opcodestr, "$rd, $rs1, $rs2">;

let Constraints = "$rd = $rd_wb" in 
class CVSIMDALURRWb<bits<5> funct5, bit F, bit funct1, bits<3> funct3, string opcodestr>
    : CVInstSIMDRR<funct5, F, funct1, funct3, OPC_CUSTOM3, (outs GPR:$rd_wb),
              (ins GPR:$rd, GPR:$rs1, GPR:$rs2), opcodestr, "$rd, $rs1, $rs2">;

class CVSIMDALURI<bits<5> funct5, bit F, bits<3> funct3, string opcodestr>
    : CVInstSIMDRI<funct5, F, funct3, OPC_CUSTOM3, (outs GPR:$rd),
              (ins GPR:$rs1, simm6:$imm6), opcodestr, "$rd, $rs1, $imm6">;

let Constraints = "$rd = $rd_wb" in 
class CVSIMDALURIWb<bits<5> funct5, bit F, bits<3> funct3, string opcodestr>
    : CVInstSIMDRI<funct5, F, funct3, OPC_CUSTOM3, (outs GPR:$rd_wb),
              (ins GPR:$rd, GPR:$rs1, simm6:$imm6), opcodestr, "$rd, $rs1, $imm6">;

class CVSIMDALURU<bits<5> funct5, bit F, bits<3> funct3, string opcodestr>
    : CVInstSIMDRI<funct5, F, funct3, OPC_CUSTOM3, (outs GPR:$rd),
              (ins GPR:$rs1, cv_uimm6:$imm6), opcodestr, "$rd, $rs1, $imm6">;

let Constraints = "$rd = $rd_wb" in 
class CVSIMDALURUWb<bits<5> funct5, bit F, bits<3> funct3, string opcodestr>
    : CVInstSIMDRI<funct5, F, funct3, OPC_CUSTOM3, (outs GPR:$rd_wb),
              (ins GPR:$rd, GPR:$rs1, cv_uimm6:$imm6), opcodestr, "$rd, $rs1, $imm6">;

class CVSIMDALUR<bits<5> funct5, bit F, bit funct1, bits<3> funct3, string opcodestr>
    : CVInstSIMDR<funct5, F, funct1, funct3, OPC_CUSTOM3, (outs GPR:$rd),
              (ins GPR:$rs1), opcodestr, "$rd, $rs1">;

multiclass CVSIMDBinarySigned<bits<5> funct5, bit F, bit funct1, string mnemonic> {
  def CV_ # NAME # _H : CVSIMDALURR<funct5, F, funct1, 0b000, "cv." # mnemonic # ".h">;
  def CV_ # NAME # _B : CVSIMDALURR<funct5, F, funct1, 0b001, "cv." # mnemonic # ".b">;
  def CV_ # NAME # _SC_H : CVSIMDALURR<funct5, F, funct1, 0b100, "cv." # mnemonic # ".sc.h">;
  def CV_ # NAME # _SC_B : CVSIMDALURR<funct5, F, funct1, 0b101, "cv." # mnemonic # ".sc.b">;
  def CV_ # NAME # _SCI_H : CVSIMDALURI<funct5, F, 0b110, "cv." # mnemonic # ".sci.h">;
  def CV_ # NAME # _SCI_B : CVSIMDALURI<funct5, F, 0b111, "cv." # mnemonic # ".sci.b">;
}

multiclass CVSIMDBinaryUnsigned<bits<5> funct5, bit F, bit funct1, string mnemonic> {
  def CV_ # NAME # _H : CVSIMDALURR<funct5, F, funct1, 0b000, "cv." # mnemonic # ".h">;
  def CV_ # NAME # _B : CVSIMDALURR<funct5, F, funct1, 0b001, "cv." # mnemonic # ".b">;
  def CV_ # NAME # _SC_H : CVSIMDALURR<funct5, F, funct1, 0b100, "cv." # mnemonic # ".sc.h">;
  def CV_ # NAME # _SC_B : CVSIMDALURR<funct5, F, funct1, 0b101, "cv." # mnemonic # ".sc.b">;
  def CV_ # NAME # _SCI_H : CVSIMDALURU<funct5, F, 0b110, "cv." # mnemonic # ".sci.h">;
  def CV_ # NAME # _SCI_B : CVSIMDALURU<funct5, F, 0b111, "cv." # mnemonic # ".sci.b">;
}

multiclass CVSIMDBinarySignedWb<bits<5> funct5, bit F, bit funct1, string mnemonic> {
  def CV_ # NAME # _H : CVSIMDALURRWb<funct5, F, funct1, 0b000, "cv." # mnemonic # ".h">;
  def CV_ # NAME # _B : CVSIMDALURRWb<funct5, F, funct1, 0b001, "cv." # mnemonic # ".b">;
  def CV_ # NAME # _SC_H : CVSIMDALURRWb<funct5, F, funct1, 0b100, "cv." # mnemonic # ".sc.h">;
  def CV_ # NAME # _SC_B : CVSIMDALURRWb<funct5, F, funct1, 0b101, "cv." # mnemonic # ".sc.b">;
  def CV_ # NAME # _SCI_H : CVSIMDALURIWb<funct5, F, 0b110, "cv." # mnemonic # ".sci.h">;
  def CV_ # NAME # _SCI_B : CVSIMDALURIWb<funct5, F, 0b111, "cv." # mnemonic # ".sci.b">;
}

multiclass CVSIMDBinaryUnsignedWb<bits<5> funct5, bit F, bit funct1, string mnemonic> {
  def CV_ # NAME # _H : CVSIMDALURRWb<funct5, F, funct1, 0b000, "cv." # mnemonic # ".h">;
  def CV_ # NAME # _B : CVSIMDALURRWb<funct5, F, funct1, 0b001, "cv." # mnemonic # ".b">;
  def CV_ # NAME # _SC_H : CVSIMDALURRWb<funct5, F, funct1, 0b100, "cv." # mnemonic # ".sc.h">;
  def CV_ # NAME # _SC_B : CVSIMDALURRWb<funct5, F, funct1, 0b101, "cv." # mnemonic # ".sc.b">;
  def CV_ # NAME # _SCI_H : CVSIMDALURUWb<funct5, F, 0b110, "cv." # mnemonic # ".sci.h">;
  def CV_ # NAME # _SCI_B : CVSIMDALURUWb<funct5, F, 0b111, "cv." # mnemonic # ".sci.b">;
}


let Predicates = [HasExtXcvsimd], hasSideEffects = 0, mayLoad = 0, mayStore = 0 in {
  defm ADD :    CVSIMDBinarySigned<0b00000, 0, 0, "add">;
  defm SUB :    CVSIMDBinarySigned<0b00001, 0, 0, "sub">;
  defm AVG :    CVSIMDBinarySigned<0b00010, 0, 0, "avg">;
  defm AVGU :   CVSIMDBinarySigned<0b00011, 0, 0, "avgu">;
  defm MIN :    CVSIMDBinarySigned<0b00100, 0, 0, "min">;
  defm MINU : CVSIMDBinaryUnsigned<0b00101, 0, 0, "minu">;
  defm MAX :    CVSIMDBinarySigned<0b00110, 0, 0, "max">;
  defm MAXU : CVSIMDBinaryUnsigned<0b00111, 0, 0, "maxu">;
  defm SRL :  CVSIMDBinaryUnsigned<0b01000, 0, 0, "srl">;
  defm SRA :  CVSIMDBinaryUnsigned<0b01001, 0, 0, "sra">;
  defm SLL :  CVSIMDBinaryUnsigned<0b01010, 0, 0, "sll">;
  defm OR :     CVSIMDBinaryUnsigned<0b01011, 0, 0, "or">;
  defm XOR :    CVSIMDBinaryUnsigned<0b01100, 0, 0, "xor">;
  defm AND :    CVSIMDBinaryUnsigned<0b01101, 0, 0, "and">;

  def CV_ABS_H :    CVSIMDALUR<0b01110, 0, 0, 0b000, "cv.abs.h">;
  def CV_ABS_B :    CVSIMDALUR<0b01110, 0, 0, 0b001, "cv.abs.b">;

  // 0b01111xx: UNDEF

  defm DOTUP :   CVSIMDBinaryUnsigned<0b10000, 0, 0, "dotup">;
  defm DOTUSP :  CVSIMDBinarySigned<0b10001, 0, 0, "dotusp">;
  defm DOTSP :   CVSIMDBinarySigned<0b10010, 0, 0, "dotsp">;
  defm SDOTUP :  CVSIMDBinaryUnsignedWb<0b10011, 0, 0, "sdotup">;
  defm SDOTUSP : CVSIMDBinarySignedWb<0b10100, 0, 0, "sdotusp">;
  defm SDOTSP :  CVSIMDBinarySignedWb<0b10101, 0, 0, "sdotsp">;

  // 0b10110xx: UNDEF

  def CV_EXTRACT_H :    CVSIMDALURU<0b10111, 0, 0b000, "cv.extract.h">;
  def CV_EXTRACT_B :    CVSIMDALURU<0b10111, 0, 0b001, "cv.extract.b">;
  def CV_EXTRACTU_H :   CVSIMDALURU<0b10111, 0, 0b010, "cv.extractu.h">;
  def CV_EXTRACTU_B :   CVSIMDALURU<0b10111, 0, 0b011, "cv.extractu.b">;
  def CV_INSERT_H :     CVSIMDALURUWb<0b10111, 0, 0b100, "cv.insert.h">;
  def CV_INSERT_B :     CVSIMDALURUWb<0b10111, 0, 0b101, "cv.insert.b">;

  def CV_SHUFFLE_H :    CVSIMDALURR<0b11000, 0, 0, 0b000, "cv.shuffle.h">;
  def CV_SHUFFLE_B :    CVSIMDALURR<0b11000, 0, 0, 0b001, "cv.shuffle.b">;
  def CV_SHUFFLE_SCI_H : CVSIMDALURU<0b11000, 0, 0b110, "cv.shuffle.sci.h">;
  def CV_SHUFFLEI0_SCI_B : CVSIMDALURU<0b11000, 0, 0b111, "cv.shufflei0.sci.b">;

  def CV_SHUFFLEI1_SCI_B : CVSIMDALURU<0b11001, 0, 0b111, "cv.shufflei1.sci.b">;

  def CV_SHUFFLEI2_SCI_B : CVSIMDALURU<0b11010, 0, 0b111, "cv.shufflei2.sci.b">;

  def CV_SHUFFLEI3_SCI_B : CVSIMDALURU<0b11011, 0, 0b111, "cv.shufflei3.sci.b">;

  def CV_SHUFFLE2_H :    CVSIMDALURRWb<0b11100, 0, 0, 0b000, "cv.shuffle2.h">;
  def CV_SHUFFLE2_B :    CVSIMDALURRWb<0b11100, 0, 0, 0b001, "cv.shuffle2.b">;

  // 0b11101xx: UNDEF

  def CV_PACK :      CVSIMDALURR<0b11110, 0, 0, 0b000, "cv.pack">;
  def CV_PACK_H :    CVSIMDALURR<0b11110, 0, 1, 0b000, "cv.pack.h">;
  
  def CV_PACKHI_B : CVSIMDALURRWb<0b11111, 0, 1, 0b001, "cv.packhi.b">;
  def CV_PACKLO_B : CVSIMDALURRWb<0b11111, 0, 0, 0b001, "cv.packlo.b">;
  
  defm CMPEQ : CVSIMDBinarySigned<0b00000, 1, 0, "cmpeq">;
  defm CMPNE :  CVSIMDBinarySigned<0b00001, 1, 0, "cmpne">;
  defm CMPGT :  CVSIMDBinarySigned<0b00010, 1, 0, "cmpgt">;
  defm CMPGE :  CVSIMDBinarySigned<0b00011, 1, 0, "cmpge">;
  defm CMPLT :  CVSIMDBinarySigned<0b00100, 1, 0, "cmplt">;
  defm CMPLE :  CVSIMDBinarySigned<0b00101, 1, 0, "cmple">;
  defm CMPGTU : CVSIMDBinaryUnsigned<0b00110, 1, 0, "cmpgtu">;
  defm CMPGEU : CVSIMDBinaryUnsigned<0b00111, 1, 0, "cmpgeu">;
  defm CMPLTU : CVSIMDBinaryUnsigned<0b01000, 1, 0, "cmpltu">;
  defm CMPLEU : CVSIMDBinaryUnsigned<0b01001, 1, 0, "cmpleu">;

  def CV_CPLXMUL_R :    CVSIMDALURRWb<0b01010, 1, 0, 0b000, "cv.cplxmul.r">;
  def CV_CPLXMUL_I :    CVSIMDALURRWb<0b01010, 1, 1, 0b000, "cv.cplxmul.i">;
  def CV_CPLXMUL_R_DIV2 :    CVSIMDALURRWb<0b01010, 1, 0, 0b010, "cv.cplxmul.r.div2">;
  def CV_CPLXMUL_I_DIV2 :    CVSIMDALURRWb<0b01010, 1, 1, 0b010, "cv.cplxmul.i.div2">;
  def CV_CPLXMUL_R_DIV4 :    CVSIMDALURRWb<0b01010, 1, 0, 0b100, "cv.cplxmul.r.div4">;
  def CV_CPLXMUL_I_DIV4 :    CVSIMDALURRWb<0b01010, 1, 1, 0b100, "cv.cplxmul.i.div4">; 
  def CV_CPLXMUL_R_DIV8 :    CVSIMDALURRWb<0b01010, 1, 0, 0b110, "cv.cplxmul.r.div8">;
  def CV_CPLXMUL_I_DIV8 :    CVSIMDALURRWb<0b01010, 1, 1, 0b110, "cv.cplxmul.i.div8">;

  def CV_CPLXCONJ :    CVSIMDALUR<0b01011, 1, 0, 0b000, "cv.cplxconj">;

  // 0b01011xx: UNDEF

  def CV_SUBROTMJ :    CVSIMDALURR<0b01100, 1, 0, 0b000, "cv.subrotmj">;
  def CV_SUBROTMJ_DIV2 :    CVSIMDALURR<0b01100, 1, 0, 0b010, "cv.subrotmj.div2">;
  def CV_SUBROTMJ_DIV4 :    CVSIMDALURR<0b01100, 1, 0, 0b100, "cv.subrotmj.div4">; 
  def CV_SUBROTMJ_DIV8 :    CVSIMDALURR<0b01100, 1, 0, 0b110, "cv.subrotmj.div8">;  

  def CV_ADD_DIV2 :    CVSIMDALURR<0b01101, 1, 0, 0b010, "cv.add.div2">;
  def CV_ADD_DIV4 :    CVSIMDALURR<0b01101, 1, 0, 0b100, "cv.add.div4">;
  def CV_ADD_DIV8 :    CVSIMDALURR<0b01101, 1, 0, 0b110, "cv.add.div8">;

  def CV_SUB_DIV2 :    CVSIMDALURR<0b01110, 1, 0, 0b010, "cv.sub.div2">;
  def CV_SUB_DIV4 :    CVSIMDALURR<0b01110, 1, 0, 0b100, "cv.sub.div4">;
  def CV_SUB_DIV8 :    CVSIMDALURR<0b01110, 1, 0, 0b110, "cv.sub.div8">; 
}

let Predicates = [HasExtXcvmac], hasSideEffects = 0, mayLoad = 0, mayStore = 0 in {
  // Signed 16x16 bit muls with imm
  def CV_MULSN    : RVInstMac16I<0b00, 0b100, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.mulsn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MULHHSN  : RVInstMac16I<0b01, 0b100, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.mulhhsn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MULSRN   : RVInstMac16I<0b10, 0b100, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.mulsrn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MULHHSRN : RVInstMac16I<0b11, 0b100, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.mulhhsrn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;


  // Unsigned 16x16 bit muls with imm
  def CV_MULUN    : RVInstMac16I<0b00, 0b101, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.mulun", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MULHHUN  : RVInstMac16I<0b01, 0b101, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.mulhhun", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MULURN   : RVInstMac16I<0b10, 0b101, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.mulurn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
  def CV_MULHHURN : RVInstMac16I<0b11, 0b101, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                 "cv.mulhhurn", "$rd, $rs1, $rs2, $imm5", []>,
                    Sched<[]>;
} // Predicates = [HasExtXcvmac], hasSideEffects = 0, mayLoad = 0, mayStore = 0

let Predicates = [HasExtXcvmac] in {
  // Xcvmac Pseudo Instructions
  // Signed 16x16 bit muls
  def : InstAlias<"cv.muls $rd1, $rs1, $rs2", (CV_MULSN GPR:$rd1, GPR:$rs1, GPR:$rs2, 0), 0>;
  def : InstAlias<"cv.mulhhs $rd1, $rs1, $rs2", (CV_MULHHSN GPR:$rd1, GPR:$rs1, GPR:$rs2, 0), 0>;

  // Unsigned 16x16 bit muls
  def : InstAlias<"cv.mulu $rd1, $rs1, $rs2", (CV_MULUN GPR:$rd1, GPR:$rs1, GPR:$rs2, 0), 0>;
  def : InstAlias<"cv.mulhhu $rd1, $rs1, $rs2", (CV_MULHHUN GPR:$rd1, GPR:$rs1, GPR:$rs2, 0), 0>;
} // Predicates = [HasExtXcvmac]

let Predicates = [HasExtXcvalu], hasSideEffects = 0, mayLoad = 0, mayStore = 0 in {
  // General ALU Operations
  def CV_ABS    : RVInstAlu_r<0b0101000, 0b011, (outs GPR:$rd), (ins GPR:$rs1),
                              "cv.abs", "$rd, $rs1", []>,
                  Sched<[]>;
  def CV_SLE   : RVInstAlu_rr<0b0101001, 0b011, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                               "cv.sle", "$rd, $rs1, $rs2", []>,
                  Sched<[]>;
  def CV_SLEU  : RVInstAlu_rr<0b0101010, 0b011, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                               "cv.sleu", "$rd, $rs1, $rs2", []>,
                  Sched<[]>;
  def CV_MIN    : RVInstAlu_rr<0b0101011, 0b011, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                               "cv.min", "$rd, $rs1, $rs2", []>,
                  Sched<[]>;
  def CV_MINU   : RVInstAlu_rr<0b0101100, 0b011, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                               "cv.minu", "$rd, $rs1, $rs2", []>,
                  Sched<[]>;
  def CV_MAX    : RVInstAlu_rr<0b0101101, 0b011, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                               "cv.max", "$rd, $rs1, $rs2", []>,
                  Sched<[]>;
  def CV_MAXU   : RVInstAlu_rr<0b0101110, 0b011, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                               "cv.maxu", "$rd, $rs1, $rs2", []>,
                  Sched<[]>;
  def CV_EXTHS  : RVInstAlu_r<0b0110000, 0b011, (outs GPR:$rd), (ins GPR:$rs1),
                              "cv.exths", "$rd, $rs1", []>,
                  Sched<[]>;
  def CV_EXTHZ  : RVInstAlu_r<0b0110001, 0b011, (outs GPR:$rd), (ins GPR:$rs1),
                              "cv.exthz", "$rd, $rs1", []>,
                  Sched<[]>;
  def CV_EXTBS  : RVInstAlu_r<0b0110010, 0b011, (outs GPR:$rd), (ins GPR:$rs1),
                              "cv.extbs", "$rd, $rs1", []>,
                  Sched<[]>;
  def CV_EXTBZ  : RVInstAlu_r<0b0110011, 0b011, (outs GPR:$rd), (ins GPR:$rs1),
                              "cv.extbz", "$rd, $rs1", []>,
                  Sched<[]>;

  def CV_CLIP   : RVInstAlu_ri<0b0111000, 0b011, (outs GPR:$rd), (ins GPR:$rs1, uimm5:$imm5),
                               "cv.clip", "$rd, $rs1, $imm5", []>,
                  Sched<[]>;
  def CV_CLIPU  : RVInstAlu_ri<0b0111001, 0b011, (outs GPR:$rd), (ins GPR:$rs1, uimm5:$imm5),
                               "cv.clipu", "$rd, $rs1, $imm5", []>,
                  Sched<[]>;
  def CV_CLIPR  : RVInstAlu_rr<0b0111010, 0b011, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                               "cv.clipr", "$rd, $rs1, $rs2", []>,
                  Sched<[]>;
  def CV_CLIPUR : RVInstAlu_rr<0b0111011, 0b011, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                               "cv.clipur", "$rd, $rs1, $rs2", []>,
                  Sched<[]>;

  def CV_ADDN   : RVInstAlu_rri<0b00, 0b010, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                "cv.addN", "$rd, $rs1, $rs2, $imm5", []>,
                  Sched<[]>;
  def CV_ADDUN  : RVInstAlu_rri<0b01, 0b010, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                "cv.adduN", "$rd, $rs1, $rs2, $imm5", []>,
                  Sched<[]>;
  def CV_ADDRN  : RVInstAlu_rri<0b10, 0b010, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                "cv.addRN", "$rd, $rs1, $rs2, $imm5", []>,
                  Sched<[]>;
  def CV_ADDURN : RVInstAlu_rri<0b11, 0b010, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                "cv.adduRN", "$rd, $rs1, $rs2, $imm5", []>,
                  Sched<[]>;
  def CV_SUBN   : RVInstAlu_rri<0b00, 0b011, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                "cv.subN", "$rd, $rs1, $rs2, $imm5", []>,
                  Sched<[]>;
  def CV_SUBUN  : RVInstAlu_rri<0b01, 0b011, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                "cv.subuN", "$rd, $rs1, $rs2, $imm5", []>,
                  Sched<[]>;
  def CV_SUBRN  : RVInstAlu_rri<0b10, 0b011, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                "cv.subRN", "$rd, $rs1, $rs2, $imm5", []>,
                  Sched<[]>;
  def CV_SUBURN : RVInstAlu_rri<0b11, 0b011, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm5),
                                "cv.subuRN", "$rd, $rs1, $rs2, $imm5", []>,
                  Sched<[]>;
} // Predicates = [HasExtXcvalu], hasSideEffects = 0, mayLoad = 0, mayStore = 0

let Predicates = [HasExtXcvalu], hasSideEffects = 0, mayLoad = 0, mayStore = 0, Opcode = OPC_CUSTOM1.Value, Constraints = "$rd = $rd_wb" in {
  def CV_ADDNR   : RVInstAlu_rr<0b1000000, 0b011, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                                "cv.addNr", "$rd, $rs1, $rs2", []>,
                   Sched<[]>;
  def CV_ADDUNR  : RVInstAlu_rr<0b1000001, 0b011, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                                "cv.adduNr", "$rd, $rs1, $rs2", []>,
                   Sched<[]>;
  def CV_ADDRNR  : RVInstAlu_rr<0b1000010, 0b011, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                                "cv.addRNr", "$rd, $rs1, $rs2", []>,
                   Sched<[]>;
  def CV_ADDURNR : RVInstAlu_rr<0b1000011, 0b011, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                                "cv.adduRNr", "$rd, $rs1, $rs2", []>,
                   Sched<[]>;
  def CV_SUBNR   : RVInstAlu_rr<0b1000100, 0b011, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                                "cv.subNr", "$rd, $rs1, $rs2", []>,
                   Sched<[]>;
  def CV_SUBUNR  : RVInstAlu_rr<0b1000101, 0b011, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                                "cv.subuNr", "$rd, $rs1, $rs2", []>,
                   Sched<[]>;
  def CV_SUBRNR  : RVInstAlu_rr<0b1000110, 0b011, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                                "cv.subRNr", "$rd, $rs1, $rs2", []>,
                   Sched<[]>;
  def CV_SUBURNR : RVInstAlu_rr<0b1000111, 0b011, (outs GPR:$rd_wb), (ins GPR:$rd, GPR:$rs1, GPR:$rs2),
                                "cv.subuRNr", "$rd, $rs1, $rs2", []>,
                   Sched<[]>;

} // Predicates = [HasExtXcvalu], hasSideEffects = 0, mayLoad = 0, mayStore = 0, Opcode = OPC_CUSTOM1.Value, Constraints = "$rd = $rd_wb"

let Predicates = [HasExtXcvalu] in {
  // Xcvalu Pseudo Instructions
  def : InstAlias<"cv.slet $rd, $rs1, $rs2", (CV_SLE GPR:$rd, GPR:$rs1, GPR:$rs2), 0>;
  def : InstAlias<"cv.sletu $rd, $rs1, $rs2", (CV_SLEU GPR:$rd, GPR:$rs1, GPR:$rs2), 0>;
} // Predicates = [HasExtXcvalu]

let Predicates = [HasExtXcvbi], hasSideEffects = 0, mayLoad = 0, mayStore = 0, isBranch = 1, isTerminator = 1 in {
  // Immediate branching operations
  def CV_BEQIMM : RVInstImmBranch<0b110, (outs), (ins GPR:$rs1, simm5:$imm5, simm13_lsb0:$imm12),
                                  "cv.beqimm", "$rs1, $imm5, $imm12", []>,
                  Sched<[]>;
  def CV_BNEIMM : RVInstImmBranch<0b111, (outs), (ins GPR:$rs1, simm5:$imm5, simm13_lsb0:$imm12),
                                  "cv.bneimm", "$rs1, $imm5, $imm12", []>,
                  Sched<[]>;

} // Predicates = [HasExtXcvalu], hasSideEffects = 0, mayLoad = 0, mayStore = 0, isBranch = 1, isTerminator = 1

let Predicates = [HasExtXcvmem], hasSideEffects = 0, mayLoad = 1, mayStore = 0, Constraints = "$rs1_wb = $rs1" in {
  // Register-Immediate load with post-increment
  def CV_LB_ri_inc  : RVInstLoad_ri_inc<0b000, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, simm12:$imm12),
                                        "cv.lb", "$rd, (${rs1}), ${imm12}", []>,
                      Sched<[]>;
  def CV_LBU_ri_inc : RVInstLoad_ri_inc<0b100, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, simm12:$imm12),
                                        "cv.lbu", "$rd, (${rs1}), ${imm12}", []>,
                      Sched<[]>;
  def CV_LH_ri_inc  : RVInstLoad_ri_inc<0b001, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, simm12:$imm12),
                                        "cv.lh", "$rd, (${rs1}), ${imm12}", []>,
                      Sched<[]>;
  def CV_LHU_ri_inc : RVInstLoad_ri_inc<0b101, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, simm12:$imm12),
                                        "cv.lhu", "$rd, (${rs1}), ${imm12}", []>,
                      Sched<[]>;
  def CV_LW_ri_inc  : RVInstLoad_ri_inc<0b010, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, simm12:$imm12),
                                        "cv.lw", "$rd, (${rs1}), ${imm12}", []>,
                      Sched<[]>;

  // Register-Register load with post-increment
  def CV_LB_rr_inc  : RVInstLoad_rr_inc<0b0000000, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lb", "$rd, (${rs1}), ${rs2}", []>,
                      Sched<[]>;
  def CV_LBU_rr_inc : RVInstLoad_rr_inc<0b0001000, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lbu", "$rd, (${rs1}), ${rs2}", []>,
                      Sched<[]>;
  def CV_LH_rr_inc  : RVInstLoad_rr_inc<0b0000001, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lh", "$rd, (${rs1}), ${rs2}", []>,
                      Sched<[]>;
  def CV_LHU_rr_inc : RVInstLoad_rr_inc<0b0001001, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lhu", "$rd, (${rs1}), ${rs2}", []>,
                      Sched<[]>;
  def CV_LW_rr_inc  : RVInstLoad_rr_inc<0b0000010, (outs GPR:$rd, GPR:$rs1_wb), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lw", "$rd, (${rs1}), ${rs2}", []>,
                      Sched<[]>;
} // Predicates = [HasExtXcvmem], hasSideEffects = 0, mayLoad = 1, mayStore = 0, Constraints = "$rs1_wb = $rs1"

let Predicates = [HasExtXcvmem], hasSideEffects = 0, mayLoad = 1, mayStore = 0 in {
  // Register-Register load
  def CV_LB_rr  : RVInstLoad_rr<0b0000100, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lb", "$rd, ${rs2}(${rs1})", []>,
                      Sched<[]>;
  def CV_LBU_rr : RVInstLoad_rr<0b0001100, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lbu", "$rd, ${rs2}(${rs1})", []>,
                      Sched<[]>;
  def CV_LH_rr  : RVInstLoad_rr<0b0000101, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lh", "$rd, ${rs2}(${rs1})", []>,
                      Sched<[]>;
  def CV_LHU_rr : RVInstLoad_rr<0b0001101, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lhu", "$rd, ${rs2}(${rs1})", []>,
                      Sched<[]>;
  def CV_LW_rr  : RVInstLoad_rr<0b0000110, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                                        "cv.lw", "$rd, ${rs2}(${rs1})", []>,
                      Sched<[]>;

} // Predicates = [HasExtXcvmem], hasSideEffects = 0, mayLoad = 1, mayStore = 0

let Predicates = [HasExtXcvmem], hasSideEffects = 0, mayLoad = 0, mayStore = 1, Constraints = "$rs1_wb = $rs1" in {
  // Register-Immediate store with post-increment
  def CV_SB_ri_inc : RVInstStore_ri_inc<0b000, (outs GPR:$rs1_wb), (ins GPR:$rs2, GPR:$rs1, simm12:$imm12),
                                        "cv.sb", "$rs2, (${rs1}), ${imm12}", []>,
                     Sched<[]>;
  def CV_SH_ri_inc : RVInstStore_ri_inc<0b001, (outs GPR:$rs1_wb), (ins GPR:$rs2, GPR:$rs1, simm12:$imm12),
                                        "cv.sh", "$rs2, (${rs1}), ${imm12}", []>,
                     Sched<[]>;
  def CV_SW_ri_inc : RVInstStore_ri_inc<0b010, (outs GPR:$rs1_wb), (ins GPR:$rs2, GPR:$rs1, simm12:$imm12),
                                        "cv.sw", "$rs2, (${rs1}), ${imm12}", []>,
                     Sched<[]>;

  // Register-Register store with post-increment
  def CV_SB_rr_inc : RVInstStore_rr_inc<0b011, 0b0010000, (outs GPR:$rs1_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rs3),
                                        "cv.sb", "$rs2, (${rs1}), ${rs3}", []>,
                     Sched<[]>;
  def CV_SH_rr_inc : RVInstStore_rr_inc<0b011, 0b0010001, (outs GPR:$rs1_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rs3),
                                        "cv.sh", "$rs2, (${rs1}), ${rs3}", []>,
                     Sched<[]>;
  def CV_SW_rr_inc : RVInstStore_rr_inc<0b011, 0b0010010, (outs GPR:$rs1_wb), (ins GPR:$rs2, GPR:$rs1, GPR:$rs3),
                                        "cv.sw", "$rs2, (${rs1}), ${rs3}", []>,
                     Sched<[]>;
} // Predicates = [HasExtXcvmem], hasSideEffects = 0, mayLoad = 0, mayStore = 1, Constraints = "$rs1_wb = $rs1"

let Predicates = [HasExtXcvmem], hasSideEffects = 0, mayLoad = 0, mayStore = 1 in {
  // Register-Register store
  def CV_SB_rr : RVInstStore_rr<0b011, 0b0010100, (outs), (ins GPR:$rs2, GPR:$rs1, GPR:$rs3),
                                "cv.sb", "$rs2, ${rs3}(${rs1})", []>,
                 Sched<[]>;
  def CV_SH_rr : RVInstStore_rr<0b011, 0b0010101, (outs), (ins GPR:$rs2, GPR:$rs1, GPR:$rs3),
                                "cv.sh", "$rs2, ${rs3}(${rs1})", []>,
                 Sched<[]>;
  def CV_SW_rr : RVInstStore_rr<0b011, 0b0010110, (outs), (ins GPR:$rs2, GPR:$rs1, GPR:$rs3),
                                "cv.sw", "$rs2, ${rs3}(${rs1})", []>,
                 Sched<[]>;

} // Predicates = [HasExtXcvmem], hasSideEffects = 0, mayLoad = 0, mayStore = 1

class CVBitManipRII<bits<2> funct2, bits<3> funct3, string opcodestr>
  : RVInstBitManip<funct2, funct3, (outs GPR:$rd), (ins GPR:$rs1, uimm5:$is3, uimm5:$is2),
                   opcodestr, "$rd, $rs1, $is3, $is2", []>;

class CVBitManipRR<bits<7> funct7, string opcodestr>
  : RVInstAlu_rr<funct7, 0b011, (outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2),
                   opcodestr, "$rd, $rs1, $rs2", []>;

class CVBitManipR<bits<7> funct7, string opcodestr>
  : RVInstAlu_r<funct7, 0b011, (outs GPR:$rd), (ins GPR:$rs1),
                   opcodestr, "$rd, $rs1", []>;

let Predicates = [HasExtXcvbitmanip, IsRV32], hasSideEffects = 0, mayLoad = 0, mayStore = 0 in {
  def CV_EXTRACT : CVBitManipRII<0b00, 0b000, "cv.extract">;
  def CV_EXTRACTU : CVBitManipRII<0b01, 0b000, "cv.extractu">;

  def CV_BCLR : CVBitManipRII<0b00, 0b001, "cv.bclr">;
  def CV_BSET : CVBitManipRII<0b01, 0b001, "cv.bset">;
  def CV_BITREV : RVInstBitManip<0b11, 0b001, (outs GPR:$rd), (ins GPR:$rs1, uimm2:$is3, uimm5:$is2),
                                 "cv.bitrev", "$rd, $rs1, $is3, $is2", []>;

  def CV_EXTRACTR : CVBitManipRR<0b0011000, "cv.extractr">;
  def CV_EXTRACTUR : CVBitManipRR<0b0011001, "cv.extractur">;

  let Constraints = "$rd = $rd_wb" in {
  def CV_INSERT : RVInstBitManip<0b10, 0b000, (outs GPR:$rd_wb),
                                 (ins GPR:$rs1, uimm5:$is3, uimm5:$is2, GPR:$rd),
                                 "cv.insert", "$rd, $rs1, $is3, $is2", []>;
  def CV_INSERTR : RVInstAlu_rr<0b0011010, 0b011, (outs GPR:$rd_wb),
                                 (ins GPR:$rs1, GPR:$rs2, GPR:$rd),
                                 "cv.insertr", "$rd, $rs1, $rs2", []>;
  }

  def CV_BCLRR : CVBitManipRR<0b0011100, "cv.bclrr">;
  def CV_BSETR : CVBitManipRR<0b0011101, "cv.bsetr">;

  def CV_ROR : CVBitManipRR<0b0100000, "cv.ror">;
  def CV_FF1 : CVBitManipR<0b0100001, "cv.ff1">;
  def CV_FL1 : CVBitManipR<0b0100010, "cv.fl1">;
  def CV_CLB : CVBitManipR<0b0100011, "cv.clb">;
  def CV_CNT : CVBitManipR<0b0100100, "cv.cnt">;
}

let Predicates = [HasExtXcvelw], hasSideEffects = 0, mayLoad = 1, mayStore = 0 in {
  def PseudoCV_ELW : PseudoLoad<"cv.elw">;
  def CV_ELW : RVInstLoad_ri_inc<0b011, (outs GPR:$rd), (ins GPR:$rs1, simm12:$imm12),
                                 "cv.elw", "$rd, ${imm12}(${rs1})", []>,
               Sched<[]>;
} // Predicates = [HasExtXcvelw], hasSideEffects = 0, mayLoad = 1, mayStore = 0

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
                        [(smin (smax node:$value, 0), node:$upperBound),
                         (smax (smin node:$value, node:$upperBound), 0)]>;


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

class PatCoreVMacGprGprGpr <string intr, string asm>
  : Pat<(!cast<Intrinsic>("int_riscv_cv_mac_" # intr) GPR:$rs1, GPR:$rs2, GPR:$rd),
        (!cast<RVInst>("CV_" # asm) GPR:$rd, GPR:$rs1, GPR:$rs2)>;
class PatCoreVMacGprGprGprUimm5 <string intr, string asm>
  : Pat<(!cast<Intrinsic>("int_riscv_cv_mac_" # intr) GPR:$rs1, GPR:$rs2, GPR:$rd, cv_tuimm5:$imm5),
        (!cast<RVInst>("CV_" # asm) GPR:$rd, GPR:$rs1, GPR:$rs2, cv_tuimm5:$imm5)>;
class PatCoreVMacGprGprUimm5 <string intr, string asm>
  : Pat<(!cast<Intrinsic>("int_riscv_cv_mac_" # intr) GPR:$rs1, GPR:$rs2, cv_tuimm5:$imm5),
        (!cast<RVInst>("CV_" # asm) GPR:$rs1, GPR:$rs2, cv_tuimm5:$imm5)>;

let Predicates = [HasExtXcvmac] in {

  def : Pat<(add GPR:$rd, (mul GPR:$rs1, GPR:$rs2)),
            (CV_MAC GPR:$rd, GPR:$rs1, GPR:$rs2)>;
  def : Pat<(sub GPR:$rd, (mul GPR:$rs1, GPR:$rs2)),
            (CV_MSU GPR:$rd, GPR:$rs1, GPR:$rs2)>;

  def : Pat<(muls GPR:$rs1, GPR:$rs2),
            (CV_MULSN GPR:$rs1, GPR:$rs2, 0)>;
  def : Pat<(mulhhs GPR:$rs1, GPR:$rs2),
            (CV_MULHHSN GPR:$rs1, GPR:$rs2, 0)>;
  def : Pat<(sra (muls GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MULSN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(sra (mulhhs GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MULHHSN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(shiftRound (muls GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MULSRN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;
  def : Pat<(shiftRound (mulhhs GPR:$rs1, GPR:$rs2), uimm5:$imm5),
            (CV_MULHHSRN GPR:$rs1, GPR:$rs2, uimm5:$imm5)>;

  def : Pat<(mulu GPR:$rs1, GPR:$rs2),
            (CV_MULUN GPR:$rs1, GPR:$rs2, 0)>;
  def : Pat<(mulhhu GPR:$rs1, GPR:$rs2),
            (CV_MULHHUN GPR:$rs1, GPR:$rs2, 0)>;
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

  def : PatCoreVMacGprGprGpr<"mac", "MAC">;
  def : PatCoreVMacGprGprGpr<"msu", "MSU">;

  def : PatCoreVMacGprGprUimm5<"muluN", "MULUN">;
  def : PatCoreVMacGprGprUimm5<"mulhhuN", "MULHHUN">;
  def : PatCoreVMacGprGprUimm5<"mulsN", "MULSN">;
  def : PatCoreVMacGprGprUimm5<"mulhhsN", "MULHHSN">;
  def : PatCoreVMacGprGprUimm5<"muluRN", "MULURN">;
  def : PatCoreVMacGprGprUimm5<"mulhhuRN", "MULHHURN">;
  def : PatCoreVMacGprGprUimm5<"mulsRN", "MULSRN">;
  def : PatCoreVMacGprGprUimm5<"mulhhsRN", "MULHHSRN">;

  def : PatCoreVMacGprGprGprUimm5<"macuN", "MACUN">;
  def : PatCoreVMacGprGprGprUimm5<"machhuN", "MACHHUN">;
  def : PatCoreVMacGprGprGprUimm5<"macsN", "MACSN">;
  def : PatCoreVMacGprGprGprUimm5<"machhsN", "MACHHSN">;
  def : PatCoreVMacGprGprGprUimm5<"macuRN", "MACURN">;
  def : PatCoreVMacGprGprGprUimm5<"machhuRN", "MACHHURN">;
  def : PatCoreVMacGprGprGprUimm5<"macsRN", "MACSRN">;
  def : PatCoreVMacGprGprGprUimm5<"machhsRN", "MACHHSRN">;
}

//===----------------------------------------------------------------------===//
// Patterns for general ALU operations
//===----------------------------------------------------------------------===//

class PatCoreVAluGpr <string intr, string asm> :
  PatGpr<!cast<Intrinsic>("int_riscv_cv_alu_" # intr),
            !cast<RVInst>("CV_" # asm)>;
class PatCoreVAluGprGpr <string intr, string asm> :
  PatGprGpr<!cast<Intrinsic>("int_riscv_cv_alu_" # intr),
               !cast<RVInst>("CV_" # asm)>;
multiclass PatCoreVAluGprImm <Intrinsic intr> {
  def "CV_" # NAME # "_PSEUDO" :
    Pseudo<(outs GPR:$rd), (ins GPR:$rs, cv_uimm32:$imm), []>;
  def : PatGprGpr<intr, !cast<RVInst>("CV_" # NAME # "R")>;
  def : PatGprImm<intr, !cast<RVInst>("CV_" # NAME # "_PSEUDO"), cv_uimm32>;
}
multiclass PatCoreVAluGprGprImm <Intrinsic intr> {
  def "CV_" # NAME # "_PSEUDO" :
    Pseudo<(outs GPR:$rd), (ins GPR:$rs1, GPR:$rs2, uimm5:$imm), []>;
  def : Pat<(intr GPR:$rs1, GPR:$rs2, GPR:$rs3),
            (!cast<RVInst>("CV_" # NAME # "R") GPR:$rs1, GPR:$rs2, GPR:$rs3)>;
  def : Pat<(intr GPR:$rs1, GPR:$rs2, uimm5:$imm),
            (!cast<RVInst>("CV_" # NAME # "_PSEUDO") GPR:$rs1, GPR:$rs2, uimm5:$imm)>;
}

let Predicates = [HasExtXcvalu] in {

  def : Pat<(abs GPR:$rs1), (CV_ABS GPR:$rs1)>;
  def : PatGprGpr<setle, CV_SLE>;
  def : PatGprGpr<setule, CV_SLEU>;
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

  def : PatCoreVAluGpr<"abs", "ABS">;
  def : PatCoreVAluGprGpr<"slet", "SLE">;
  def : PatCoreVAluGprGpr<"sletu", "SLEU">;
  def : PatCoreVAluGprGpr<"min", "MIN">;
  def : PatCoreVAluGprGpr<"minu", "MINU">;
  def : PatCoreVAluGprGpr<"max", "MAX">;
  def : PatCoreVAluGprGpr<"maxu", "MAXU">;
  def : PatCoreVAluGpr<"exths", "EXTHS">;
  def : PatCoreVAluGpr<"exthz", "EXTHZ">;
  def : PatCoreVAluGpr<"extbs", "EXTBS">;
  def : PatCoreVAluGpr<"extbz", "EXTBZ">;

  defm CLIP   : PatCoreVAluGprImm<int_riscv_cv_alu_clip>;
  defm CLIPU  : PatCoreVAluGprImm<int_riscv_cv_alu_clipu>;
  defm ADDN   : PatCoreVAluGprGprImm<int_riscv_cv_alu_addn>;
  defm ADDUN  : PatCoreVAluGprGprImm<int_riscv_cv_alu_addun>;
  defm ADDRN  : PatCoreVAluGprGprImm<int_riscv_cv_alu_addrn>;
  defm ADDURN : PatCoreVAluGprGprImm<int_riscv_cv_alu_addurn>;
  defm SUBN   : PatCoreVAluGprGprImm<int_riscv_cv_alu_subn>;
  defm SUBUN  : PatCoreVAluGprGprImm<int_riscv_cv_alu_subun>;
  defm SUBRN  : PatCoreVAluGprGprImm<int_riscv_cv_alu_subrn>;
  defm SUBURN : PatCoreVAluGprGprImm<int_riscv_cv_alu_suburn>;
}

//===----------------------------------------------------------------------===//
// Patterns for immediate branching operations
//===----------------------------------------------------------------------===//

let Predicates = [HasExtXcvbi] in {
  def : Pat<(riscv_brcc GPR:$rs1, simm5:$imm5, SETEQ, bb:$imm12),
            (CV_BEQIMM GPR:$rs1, simm5:$imm5, simm13_lsb0:$imm12)>;
  def : Pat<(riscv_brcc GPR:$rs1, simm5:$imm5, SETNE, bb:$imm12),
            (CV_BNEIMM GPR:$rs1, simm5:$imm5, simm13_lsb0:$imm12)>;

}

//===----------------------------------------------------------------------===//
// Patterns for load & store operations
//===----------------------------------------------------------------------===//

let Predicates = [HasExtXcvmem] in {

  def : Pat<(sextloadi8 (AddrRegReg GPR:$base, GPR:$offset)),
            (CV_LB_rr GPR:$base, GPR:$offset)>;
  def : Pat<(zextloadi8 (AddrRegReg GPR:$base, GPR:$offset)),
            (CV_LBU_rr GPR:$base, GPR:$offset)>;
  def : Pat<(extloadi8 (AddrRegReg GPR:$base, GPR:$offset)),
            (CV_LBU_rr GPR:$base, GPR:$offset)>;
  def : Pat<(sextloadi16 (AddrRegReg GPR:$base, GPR:$offset)),
            (CV_LH_rr GPR:$base, GPR:$offset)>;
  def : Pat<(zextloadi16 (AddrRegReg GPR:$base, GPR:$offset)),
            (CV_LHU_rr GPR:$base, GPR:$offset)>;
  def : Pat<(extloadi16 (AddrRegReg GPR:$base, GPR:$offset)),
            (CV_LHU_rr GPR:$base, GPR:$offset)>;
  def : Pat<(load (AddrRegReg GPR:$base, GPR:$offset)),
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

  def : Pat<(truncstorei8 GPR:$val, (AddrRegReg GPR:$base, GPR:$offset)),
            (CV_SB_rr GPR:$val, GPR:$base, GPR:$offset)>;
  def : Pat<(truncstorei16 GPR:$val, (AddrRegReg GPR:$base, GPR:$offset)),
            (CV_SH_rr GPR:$val, GPR:$base, GPR:$offset)>;
  def : Pat<(store GPR:$val, (AddrRegReg GPR:$base, GPR:$offset)),
            (CV_SW_rr GPR:$val, GPR:$base, GPR:$offset)>;

}

//===----------------------------------------------------------------------===//
// Patterns for SIMD operations
//===----------------------------------------------------------------------===//

class PatCorevGprGpr <string intr, string asm> :
  PatGprGpr<!cast<Intrinsic>("int_riscv_cv_simd_" # intr),
            !cast<RVInst>("CV_" # asm)>;

// Note that rd is the last argument
class PatCorevGprGprGpr <string intr, string asm> :
  Pat<(!cast<Intrinsic>("int_riscv_cv_simd_" # intr) GPR:$rs1, GPR:$rs2, GPR:$rd), 
      (!cast<RVInst>("CV_" # asm) GPR:$rd, GPR:$rs1, GPR:$rs2)>;

class PatCorevGprTImm <string intr, string asm> :
  PatGprImm<!cast<Intrinsic>("int_riscv_cv_simd_" # intr), 
            !cast<RVInst>("CV_" # asm), cv_tsimm6>;

class PatCorevGprImm <string intr, string asm> :
  PatGprImm<!cast<Intrinsic>("int_riscv_cv_simd_" # intr), 
            !cast<RVInst>("CV_" # asm), simm6>;

class PatCorevGprUImm <string intr, string asm> :
  PatGprImm<!cast<Intrinsic>("int_riscv_cv_simd_" # intr), 
            !cast<RVInst>("CV_" # asm), cv_uimm6>;

multiclass PatCorevGprGprHB <string intr> {
  def : PatCorevGprGpr<intr # "_h", NAME # "_H">;
  def : PatCorevGprGpr<intr # "_b", NAME # "_B">;
}

multiclass PatCorevGprGprGprHB <string intr> {
  def : PatCorevGprGprGpr<intr # "_h", NAME # "_H">;
  def : PatCorevGprGprGpr<intr # "_b", NAME # "_B">;
}

multiclass PatCorevGprTImmHB <string intr> {
  def : PatCorevGprTImm<intr # "_h", NAME # "_H">;
  def : PatCorevGprTImm<intr # "_b", NAME # "_B">;
}

multiclass PatCorevGprImmHB <string intr> {
  def : PatCorevGprImm<intr # "_h", NAME # "_H">;
  def : PatCorevGprImm<intr # "_b", NAME # "_B">;
}

multiclass PatCorevGprUImmHB <string intr> {
  def : PatCorevGprUImm<intr # "_h", NAME # "_H">;
  def : PatCorevGprUImm<intr # "_b", NAME # "_B">;
}

class PatCorevGprGprDiv <Intrinsic intr, string asm, int div> : 
  Pat<(intr GPR:$rs1, GPR:$rs2, (i32 div)),
      (!cast<RVInst>("CV_" # asm) GPR:$rs1, GPR:$rs2)>;

class PatCorevGprGprGprDiv <Intrinsic intr, string asm, int div> : 
  Pat<(intr GPR:$rd, GPR:$rs1, GPR:$rs2, (i32 div)),
      (!cast<RVInst>("CV_" # asm) GPR:$rd, GPR:$rs1, GPR:$rs2)>;

class PatCorevGprShuffle <Intrinsic intr, RVInst inst, int s> : 
  Pat<(intr GPR:$rs1, (i32 s)),
      (inst GPR:$rs1, 0)>; // TODO: parse it

multiclass PatCorevGprGprDivAll <Intrinsic intr> {
  def : PatCorevGprGprDiv<intr, NAME # "_DIV2", 1>;
  def : PatCorevGprGprDiv<intr, NAME # "_DIV4", 2>;
  def : PatCorevGprGprDiv<intr, NAME # "_DIV8", 3>;
}

multiclass PatCorevGprGprGprDivAll <Intrinsic intr> {
  def : PatCorevGprGprGprDiv<intr, NAME # "_DIV2", 1>;
  def : PatCorevGprGprGprDiv<intr, NAME # "_DIV4", 2>;
  def : PatCorevGprGprGprDiv<intr, NAME # "_DIV8", 3>;
}

class PatCorevGpr <string intr, string asm> :
  PatGpr<!cast<Intrinsic>("int_riscv_cv_simd_" # intr), 
            !cast<RVInst>("CV_" # asm)>;

multiclass PatCorevGprHB <string intr> {
  def : PatCorevGpr<intr # "_h", NAME # "_H">;
  def : PatCorevGpr<intr # "_b", NAME # "_B">;
}

multiclass PatCorevBinary <string intr, bit exclude_h = false> {
  if exclude_h then {
    def : PatCorevGprGpr<intr # "_b", NAME # "_B">;
  } else {
    defm NAME : PatCorevGprGprHB<intr>;
  }
  defm NAME # "_SC" : PatCorevGprGprHB<intr # "_sc">;
  defm NAME # "_SCI" : PatCorevGprImmHB<intr # "_sc">;
}

multiclass PatCorevBinaryUnsigned <string intr> {
  defm NAME : PatCorevGprGprHB<intr>;
  defm NAME # "_SC" : PatCorevGprGprHB<intr # "_sc">;
  defm NAME # "_SCI" : PatCorevGprUImmHB<intr # "_sc">;
}

multiclass PatCorevTernary <string intr> {
  defm NAME : PatCorevGprGprGprHB<intr>;
  defm NAME # "_SC" : PatCorevGprGprGprHB<intr # "_sc">;
  def : Pat<(!cast<Intrinsic>("int_riscv_cv_simd_" # intr # "_sc_h") GPR:$rs1, simm6:$rs2, GPR:$rd),
            (!cast<RVInst>("CV_" # NAME # "_SCI_H") GPR:$rd, GPR:$rs1, simm6:$rs2)>;
  def : Pat<(!cast<Intrinsic>("int_riscv_cv_simd_" # intr # "_sc_b") GPR:$rs1, simm6:$rs2, GPR:$rd),
            (!cast<RVInst>("CV_" # NAME # "_SCI_B") GPR:$rd, GPR:$rs1, simm6:$rs2)>;
}

multiclass PatCorevTernaryUnsigned <string intr> {
  defm NAME : PatCorevGprGprGprHB<intr>;
  defm NAME # "_SC" : PatCorevGprGprGprHB<intr # "_sc">;
  def : Pat<(!cast<Intrinsic>("int_riscv_cv_simd_" # intr # "_sc_h") GPR:$rs1, cv_uimm6:$rs2, GPR:$rd),
            (!cast<RVInst>("CV_" # NAME # "_SCI_H") GPR:$rd, GPR:$rs1, cv_uimm6:$rs2)>;
  def : Pat<(!cast<Intrinsic>("int_riscv_cv_simd_" # intr # "_sc_b") GPR:$rs1, cv_uimm6:$rs2, GPR:$rd),
            (!cast<RVInst>("CV_" # NAME # "_SCI_B") GPR:$rd, GPR:$rs1, cv_uimm6:$rs2)>;
}

let Predicates = [HasExtXcvsimd, IsRV32] in {
  defm ADD :  PatCorevBinary<"add", true>;
  def : PatCorevGprGprDiv<int_riscv_cv_simd_add_h, "ADD_H", 0>;
  defm SUB :  PatCorevBinary<"sub", true>;
  def : PatCorevGprGprDiv<int_riscv_cv_simd_sub_h, "SUB_H", 0>;
  defm AVG :  PatCorevBinary<"avg">;
  defm AVGU : PatCorevBinary<"avgu">;
  defm MIN :  PatCorevBinary<"min">;
  defm MINU : PatCorevBinaryUnsigned<"minu">;
  defm MAX :  PatCorevBinary<"max">;
  defm MAXU : PatCorevBinaryUnsigned<"maxu">;
  defm SRL :  PatCorevBinaryUnsigned<"srl">;
  defm SRA :  PatCorevBinaryUnsigned<"sra">;
  defm SLL :  PatCorevBinaryUnsigned<"sll">;
  defm OR :   PatCorevBinary<"or">;
  defm XOR :  PatCorevBinary<"xor">;
  defm AND :  PatCorevBinary<"and">;

  defm ABS : PatCorevGprHB<"abs">;

  defm DOTUP :   PatCorevBinaryUnsigned<"dotup">;
  defm DOTUSP :  PatCorevBinary<"dotusp">;
  defm DOTSP :   PatCorevBinary<"dotsp">;
  defm SDOTUP :  PatCorevTernaryUnsigned<"sdotup">;
  defm SDOTUSP : PatCorevTernary<"sdotusp">;
  defm SDOTSP :  PatCorevTernary<"sdotsp">;

  defm EXTRACT :  PatCorevGprTImmHB<"extract">;
  defm EXTRACTU : PatCorevGprTImmHB<"extractu">;
  def : Pat<(int_riscv_cv_simd_insert_b GPR:$rd, GPR:$rs1, cv_tsimm6:$imm), 
            (CV_INSERT_B GPR:$rd, GPR:$rs1, cv_tsimm6:$imm)>;
  def : Pat<(int_riscv_cv_simd_insert_h GPR:$rd, GPR:$rs1, cv_tsimm6:$imm), 
            (CV_INSERT_H GPR:$rd, GPR:$rs1, cv_tsimm6:$imm)>;

  defm SHUFFLE : PatCorevGprGprHB<"shuffle">;
  def : PatCorevGprTImm<"shuffle_sci_h", "SHUFFLE_SCI_H">;

  def CV_SHUFFLE_SCI_B_PSEUDO : Pseudo<(outs GPR:$rd), (ins GPR:$rs, cv_imm8:$imm), []>;
  def : PatGprImm<int_riscv_cv_simd_shuffle_sci_b, CV_SHUFFLE_SCI_B_PSEUDO, cv_imm8>;

  def : Pat<(int_riscv_cv_simd_shuffle2_h GPR:$rs1, GPR:$rs2, GPR:$rd),
            (CV_SHUFFLE2_H GPR:$rd, GPR:$rs1, GPR:$rs2)>;
  def : Pat<(int_riscv_cv_simd_shuffle2_b GPR:$rs1, GPR:$rs2, GPR:$rd),
            (CV_SHUFFLE2_B GPR:$rd, GPR:$rs1, GPR:$rs2)>;

  def : PatCorevGprGpr<"packhi_h", "PACK_H">;
  def : PatCorevGprGpr<"packlo_h", "PACK">;
  def : Pat<(int_riscv_cv_simd_packhi_b GPR:$rd, GPR:$rs1, GPR:$rs2), 
            (CV_PACKHI_B GPR:$rd, GPR:$rs1, GPR:$rs2)>;
  def : Pat<(int_riscv_cv_simd_packlo_b GPR:$rd, GPR:$rs1, GPR:$rs2), 
            (CV_PACKLO_B GPR:$rd, GPR:$rs1, GPR:$rs2)>;

  defm CMPEQ :  PatCorevBinary<"cmpeq">;
  defm CMPNE :  PatCorevBinary<"cmpne">;
  defm CMPGT :  PatCorevBinary<"cmpgt">;
  defm CMPGE :  PatCorevBinary<"cmpge">;
  defm CMPLT :  PatCorevBinary<"cmplt">;
  defm CMPLE :  PatCorevBinary<"cmple">;
  defm CMPGTU : PatCorevBinaryUnsigned<"cmpgtu">;
  defm CMPGEU : PatCorevBinaryUnsigned<"cmpgeu">;
  defm CMPLTU : PatCorevBinaryUnsigned<"cmpltu">;
  defm CMPLEU : PatCorevBinaryUnsigned<"cmpleu">;
  
  def : PatCorevGprGprGprDiv<int_riscv_cv_simd_cplxmul_r, "CPLXMUL_R", 0>;
  defm CPLXMUL_R : PatCorevGprGprGprDivAll<int_riscv_cv_simd_cplxmul_r>;
  def : PatCorevGprGprGprDiv<int_riscv_cv_simd_cplxmul_i, "CPLXMUL_I", 0>;
  defm CPLXMUL_I : PatCorevGprGprGprDivAll<int_riscv_cv_simd_cplxmul_i>;

  def : PatCorevGpr<"cplxconj", "CPLXCONJ">;

  def : PatCorevGprGprDiv<int_riscv_cv_simd_subrotmj, "SUBROTMJ", 0>;
  defm SUBROTMJ : PatCorevGprGprDivAll<int_riscv_cv_simd_subrotmj>;

  defm ADD : PatCorevGprGprDivAll<int_riscv_cv_simd_add_h>;
  defm SUB : PatCorevGprGprDivAll<int_riscv_cv_simd_sub_h>;
}

multiclass PatCoreVBitManip <Intrinsic intr> {
  def "CV_" # NAME # "_PSEUDO" : Pseudo<(outs GPR:$rd), (ins GPR:$rs1, cv_uimm10:$imm), []>;
  def : PatGprGpr<intr, !cast<RVInst>("CV_" # NAME # "R")>;
  def : PatGprImm<intr, !cast<RVInst>("CV_" # NAME # "_PSEUDO"), cv_uimm10>;
}

let Predicates = [HasExtXcvbitmanip, IsRV32] in {
  defm EXTRACT : PatCoreVBitManip<int_riscv_cv_bitmanip_extract>;
  defm EXTRACTU : PatCoreVBitManip<int_riscv_cv_bitmanip_extractu>;
  defm BCLR : PatCoreVBitManip<int_riscv_cv_bitmanip_bclr>;
  defm BSET : PatCoreVBitManip<int_riscv_cv_bitmanip_bset>;

  def CV_INSERT_PSEUDO : Pseudo<(outs GPR:$rd_wb), (ins GPR:$rs1, cv_tuimm10:$imm, GPR:$rd), []>;
  def : Pat<(int_riscv_cv_bitmanip_insert GPR:$rs1, GPR:$rs2, GPR:$rd),
            (CV_INSERTR GPR:$rs1, GPR:$rs2, GPR:$rd)>;
  def : Pat<(int_riscv_cv_bitmanip_insert GPR:$rs1, cv_uimm10:$imm, GPR:$rd),
            (CV_INSERT_PSEUDO GPR:$rs1, cv_uimm10:$imm, GPR:$rd)>;

  def : PatGpr<int_riscv_cv_bitmanip_ff1, CV_FF1>;
  def : PatGpr<int_riscv_cv_bitmanip_fl1, CV_FL1>;
  def : PatGpr<int_riscv_cv_bitmanip_clb, CV_CLB>;
  def : PatGpr<int_riscv_cv_bitmanip_cnt, CV_CNT>;

  def : PatGprGpr<int_riscv_cv_bitmanip_ror, CV_ROR>;

  def : Pat<(int_riscv_cv_bitmanip_bitrev GPR:$rs1, cv_tuimm5:$pts, cv_tuimm2:$radix),
            (CV_BITREV GPR:$rs1, cv_tuimm2:$radix, cv_tuimm5:$pts)>;
}

let Predicates = [HasExtXcvelw, IsRV32] in {
  def : Pat<(int_riscv_cv_elw_elw GPR:$rs1), (PseudoCV_ELW GPR:$rs1)>;
  def : Pat<(int_riscv_cv_elw_elw (AddrRegImm GPR:$rs1, simm12:$imm12)),
            (CV_ELW GPR:$rs1, simm12:$imm12)>;
}

//===----------------------------------------------------------------------===//
// Pseudo instructions and patterns for hardware loop generation
//===----------------------------------------------------------------------===//

let Predicates = [HasExtXcvhwlp], isNotDuplicable = 1,
    hasSideEffects = 1, mayLoad = 1, mayStore = 1 in {

  // RISCVInstrInfo assumes 3 operands for conditional branch instructions,
  // so we add 2 immediates and ignore them.
  let isBranch = 1, isTerminator = 1, Size = 0, mayStore = 0 in
  def HwlpBranch : Pseudo<(outs),
                          (ins uimm5:$op1, uimm5:$op2, simm13_lsb0:$rs1), []>;

  let Size = 12 in {
    def HwlpSetup : Pseudo<(outs), (ins GPR:$rs1), []>;
    def HwlpSetupImm : Pseudo<(outs), (ins uimm12:$rs1), []>;
  }
}

// We need to custom select the loop decrement intrinsic, because tablegen
// doesn't know that we promoted it to i32
def loop_decrement_32
  : ComplexPattern<i32, 0, "SelectLoopDecrement", [intrinsic_w_chain],
                   [SDNPSideEffect, SDNPMayLoad, SDNPMayStore]>;

def : Pat<(riscv_brcc (i32 (and (loop_decrement_32), 1)), 0, SETNE, bb:$branchDest),
          (HwlpBranch 0, 0, bb:$branchDest)>;

def : Pat<(int_set_loop_iterations GPR:$rs1),
          (HwlpSetup GPR:$rs1)>;

def : Pat<(int_set_loop_iterations uimm12:$rs1),
          (HwlpSetupImm uimm12:$rs1)>;
