# RUN: llvm-mc -triple=riscv32 --mattr=+xcvbitmanip -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.extract t0, t1, 0, 1
# CHECK-INSTR: cv.extract t0, t1, 0, 1
# CHECK-ENCODING: [0xdb,0x02,0x13,0x00]

cv.extract a0, a1, 17, 18
# CHECK-INSTR: cv.extract a0, a1, 17, 18
# CHECK-ENCODING: [0x5b,0x85,0x25,0x23]

cv.extract s0, s1, 30, 31
# CHECK-INSTR: cv.extract s0, s1, 30, 31
# CHECK-ENCODING: [0x5b,0x84,0xf4,0x3d]

