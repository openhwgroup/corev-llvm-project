# RUN: llvm-mc -triple=riscv32 --mattr=+xcvbitmanip -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.bset t0, t1, 0, 1
# CHECK-INSTR: cv.bset t0, t1, 0, 1
# CHECK-ENCODING: [0xdb,0x12,0x13,0x40]

cv.bset a0, a1, 17, 18
# CHECK-INSTR: cv.bset a0, a1, 17, 18
# CHECK-ENCODING: [0x5b,0x95,0x25,0x63]

cv.bset s0, s1, 30, 31
# CHECK-INSTR: cv.bset s0, s1, 30, 31
# CHECK-ENCODING: [0x5b,0x94,0xf4,0x7d]

