# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevhwlp -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.setup 1, s2, 0
# CHECK-INSTR: cv.setup 1, s2, 0
# CHECK-ENCODING: [0xfb,0x40,0x09,0x00]

cv.setup 0, s4, 1932
# CHECK-INSTR: cv.setup 0, s4, 1932
# CHECK-ENCODING: [0x7b,0x40,0xca,0x78]

cv.setup 0, s4, 4094
# CHECK-INSTR: cv.setup 0, s4, 4094
# CHECK-ENCODING: [0x7b,0x40,0xea,0xff]

cv.setup 0, zero, 0x400
# CHECK-INSTR: cv.setup 0, zero, 1024
# CHECK-ENCODING: [0x7b,0x40,0x00,0x40]
