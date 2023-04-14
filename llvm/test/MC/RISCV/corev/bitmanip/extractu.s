# RUN: llvm-mc -triple=riscv32 --mattr=+xcvbitmanip -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.extractu t0, t1, 0, 1
# CHECK-INSTR: cv.extractu t0, t1, 0, 1
# CHECK-ENCODING: [0xdb,0x02,0x13,0x40]

cv.extractu a0, a1, 17, 18
# CHECK-INSTR: cv.extractu a0, a1, 17, 18
# CHECK-ENCODING: [0x5b,0x85,0x25,0x63]

cv.extractu s0, s1, 30, 31
# CHECK-INSTR: cv.extractu s0, s1, 30, 31
# CHECK-ENCODING: [0x5b,0x84,0xf4,0x7d]

