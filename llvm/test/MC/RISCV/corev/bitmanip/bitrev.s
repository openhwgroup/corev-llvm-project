# RUN: llvm-mc -triple=riscv32 --mattr=+xcvbitmanip -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.bitrev t0, t1, 0, 1
# CHECK-INSTR: cv.bitrev t0, t1, 0, 1
# CHECK-ENCODING: [0xdb,0x12,0x13,0xc0]

cv.bitrev a0, a1, 1, 18
# CHECK-INSTR: cv.bitrev a0, a1, 1, 18
# CHECK-ENCODING: [0x5b,0x95,0x25,0xc3]

cv.bitrev s0, s1, 2, 31
# CHECK-INSTR: cv.bitrev s0, s1, 2, 31
# CHECK-ENCODING: [0x5b,0x94,0xf4,0xc5]

