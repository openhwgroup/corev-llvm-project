# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

label:

cv.beqimm t0, 0, 0
# CHECK-INSTR: cv.beqimm t0, 0, 0
# CHECK-ENCODING: [0x63,0xa0,0x02,0x00]

cv.beqimm a0, 5, 42
# CHECK-INSTR: cv.beqimm a0, 5, 42
# CHECK-ENCODING: [0x63,0x25,0x55,0x02]

cv.beqimm a0, -5, label
# CHECK-INSTR: cv.beqimm a0, -5, label
# CHECK-ENCODING: [0x63'A',0x20'A',0xb5'A',0x01'A']
# CHECK-ENCODING: fixup A - offset: 0, value: label, kind: fixup_riscv_branch
