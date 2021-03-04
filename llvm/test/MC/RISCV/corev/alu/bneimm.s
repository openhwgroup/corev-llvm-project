# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

label:

cv.bneimm t0, 0, 0
# CHECK-INSTR: cv.bneimm t0, 0, 0
# CHECK-ENCODING: [0x63,0xb0,0x02,0x00]

cv.bneimm a0, 5, 42
# CHECK-INSTR: cv.bneimm a0, 5, 42
# CHECK-ENCODING: [0x63,0x35,0x55,0x02]

cv.bneimm a0, -5, label
# CHECK-INSTR: cv.bneimm a0, -5, label
# CHECK-ENCODING: [0x63'A',0x30'A',0xb5'A',0x01'A']
# CHECK-ENCODING: fixup A - offset: 0, value: label, kind: fixup_riscv_branch
