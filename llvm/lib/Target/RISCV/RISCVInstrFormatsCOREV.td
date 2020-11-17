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
    : RVInst<(outs), ins, opcodestr, argstr, [], InstFormatCVHWLP> {
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
    : RVInst<(outs), ins, opcodestr, argstr, [], InstFormatCVHWLP> {
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
    : RVInst<(outs), ins, opcodestr, argstr, [], InstFormatCVHWLP> {
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
    : RVInst<(outs), ins, opcodestr, argstr, [], InstFormatCVHWLP> {
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
