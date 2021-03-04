//===- RISCVInstrFormatsCOREV.td - COREV Instr Formats -----*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
//
//  This file describes the CORE-V instruction formats.
//
//===----------------------------------------------------------------------===//

class RVInstHwlp_i<bits<3> funct3, dag ins, string opcodestr, string argstr>
    : RVInst<(outs), ins, opcodestr, argstr, [], InstFormatCVHwlp> {
  bits<12> imm12;
  bits<1> imm1;

  let Inst{31-20} = imm12;
  let Inst{19-15} = 0b00000;
  let Inst{14-12} = funct3;
  let Inst{11-8} = 0b0000;
  let Inst{7} = imm1;
  let Opcode = OPC_CUSTOM3.Value;
}

class RVInstHwlp_r<bits<3> funct3, dag ins, string opcodestr, string argstr>
    : RVInst<(outs), ins, opcodestr, argstr, [], InstFormatCVHwlp> {
  bits<5> rs1;
  bits<1> imm1;

  let Inst{31-20} = 0;
  let Inst{19-15} = rs1;
  let Inst{14-12} = funct3;
  let Inst{11-8} = 0b0000;
  let Inst{7} = imm1;
  let Opcode = OPC_CUSTOM3.Value;
}

class RVInstHwlp_ri<bits<3> funct3, dag ins, string opcodestr, string argstr>
    : RVInst<(outs), ins, opcodestr, argstr, [], InstFormatCVHwlp> {
  bits<12> imm12;
  bits<5> rs1;
  bits<1> imm1;

  let Inst{31-20} = imm12;
  let Inst{19-15} = rs1;
  let Inst{14-12} = funct3;
  let Inst{11-8} = 0b0000;
  let Inst{7} = imm1;
  let Opcode = OPC_CUSTOM3.Value;
}

class RVInstHwlp_ii<bits<3> funct3, dag ins, string opcodestr, string argstr>
    : RVInst<(outs), ins, opcodestr, argstr, [], InstFormatCVHwlp> {
  bits<12> imm12;
  bits<5> imm5;
  bits<1> imm1;

  let Inst{31-20} = imm12;
  let Inst{19-15} = imm5;
  let Inst{14-12} = funct3;
  let Inst{11-8} = 0b0000;
  let Inst{7} = imm1;
  let Opcode = OPC_CUSTOM3.Value;
}

class RVInstMac<bits<7> funct7, bits<3> funct3, dag outs, dag ins,
                string opcodestr, string argstr, list<dag> pattern>
    : RVInst<outs, ins, opcodestr, argstr, pattern, InstFormatOther> {
  bits<5> rs2;
  bits<5> rs1;
  bits<5> rd;

  let Inst{31-25} = funct7;
  let Inst{24-20} = rs2;
  let Inst{19-15} = rs1;
  let Inst{14-12} = funct3;
  let Inst{11-7} = rd;
  let Opcode = OPC_OP.Value;
}

class RVInstMac16<bits<2> funct2, bits<3> funct3, dag outs, dag ins,
                  string opcodestr, string argstr, list<dag> pattern>
    : RVInst<outs, ins, opcodestr, argstr, pattern, InstFormatOther> {
  bits<5> rs2;
  bits<5> rs1;
  bits<5> rd;

  let Inst{31-30} = funct2;
  let Inst{29-25} = 0b00000;
  let Inst{24-20} = rs2;
  let Inst{19-15} = rs1;
  let Inst{14-12} = funct3;
  let Inst{11-7} = rd;
  let Opcode = OPC_CUSTOM2.Value;
}

class RVInstMac16I<bits<2> funct2, bits<3> funct3, dag outs, dag ins,
                   string opcodestr, string argstr, list<dag> pattern>
    : RVInst<outs, ins, opcodestr, argstr, pattern, InstFormatOther> {
  bits<5> imm5;
  bits<5> rs2;
  bits<5> rs1;
  bits<5> rd;

  let Inst{31-30} = funct2;
  let Inst{29-25} = imm5;
  let Inst{24-20} = rs2;
  let Inst{19-15} = rs1;
  let Inst{14-12} = funct3;
  let Inst{11-7} = rd;
  let Opcode = OPC_CUSTOM2.Value;
}

class RVInstAlu_rri<bits<2> funct2, bits<3> funct3, dag outs, dag ins,
                    string opcodestr, string argstr, list<dag> pattern>
    : RVInst<outs, ins, opcodestr, argstr, pattern, InstFormatOther> {
  bits<5> imm5;
  bits<5> rs2;
  bits<5> rs1;
  bits<5> rd;

  let Inst{31-30} = funct2;
  let Inst{29-25} = imm5;
  let Inst{24-20} = rs2;
  let Inst{19-15} = rs1;
  let Inst{14-12} = funct3;
  let Inst{11-7} = rd;
  let Opcode = OPC_CUSTOM2.Value;
}

class RVInstAlu_rr<bits<7> funct7, bits<3> funct3, dag outs, dag ins,
                   string opcodestr, string argstr, list<dag> pattern>
    : RVInst<outs, ins, opcodestr, argstr, pattern, InstFormatOther> {
  bits<5> rs2;
  bits<5> rs1;
  bits<5> rd;

  let Inst{31-25} = funct7;
  let Inst{24-20} = rs2;
  let Inst{19-15} = rs1;
  let Inst{14-12} = funct3;
  let Inst{11-7} = rd;
  let Opcode = OPC_OP.Value;
}

class RVInstAlu_ri<bits<7> funct7, bits<3> funct3, dag outs, dag ins,
                   string opcodestr, string argstr, list<dag> pattern>
    : RVInst<outs, ins, opcodestr, argstr, pattern, InstFormatOther> {
  bits<5> imm5;
  bits<5> rs1;
  bits<5> rd;

  let Inst{31-25} = funct7;
  let Inst{24-20} = imm5;
  let Inst{19-15} = rs1;
  let Inst{14-12} = funct3;
  let Inst{11-7} = rd;
  let Opcode = OPC_OP.Value;
}

class RVInstAlu_r<bits<7> funct7, bits<3> funct3, dag outs, dag ins,
                  string opcodestr, string argstr, list<dag> pattern>
    : RVInst<outs, ins, opcodestr, argstr, pattern, InstFormatOther> {
  bits<5> rs2;
  bits<5> rs1;
  bits<5> rd;

  let Inst{31-25} = funct7;
  let Inst{24-20} = 0b00000;
  let Inst{19-15} = rs1;
  let Inst{14-12} = funct3;
  let Inst{11-7} = rd;
  let Opcode = OPC_OP.Value;
}

class RVInstImmBranch<bits<3> funct3, dag outs, dag ins,
                      string opcodestr, string argstr, list<dag> pattern>
    : RVInst<outs, ins, opcodestr, argstr, pattern, InstFormatB> {
  bits<12> imm12;
  bits<5> imm5;
  bits<5> rs1;

  let Inst{31} = imm12{11};
  let Inst{30-25} = imm12{9-4};
  let Inst{24-20} = imm5;
  let Inst{19-15} = rs1;
  let Inst{14-12} = funct3;
  let Inst{11-8} = imm12{3-0};
  let Inst{7} = imm12{10};
  let Opcode = OPC_BRANCH.Value;
}
