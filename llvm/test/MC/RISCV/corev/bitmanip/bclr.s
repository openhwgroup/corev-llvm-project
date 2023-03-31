# RUN: llvm-mc -triple=riscv32 --mattr=+xcvbitmanip -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.bclr t0, t1, 0, 1
# CHECK-INSTR: cv.bclr t0, t1, 0, 1
# CHECK-ENCODING: [0xdb,0x12,0x13,0x00]

cv.bclr a0, a1, 17, 18
# CHECK-INSTR: cv.bclr a0, a1, 17, 18
# CHECK-ENCODING: [0x5b,0x95,0x25,0x23]

cv.bclr s0, s1, 30, 31
# CHECK-INSTR: cv.bclr s0, s1, 30, 31
# CHECK-ENCODING: [0x5b,0x94,0xf4,0x3d]

