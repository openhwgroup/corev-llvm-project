# RUN: llvm-mc -triple=riscv32 --mattr=+xcvbitmanip -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.insert t0, t1, 0, 1
# CHECK-INSTR: cv.insert t0, t1, 0, 1
# CHECK-ENCODING: [0xdb,0x02,0x13,0x80]

cv.insert a0, a1, 17, 18
# CHECK-INSTR: cv.insert a0, a1, 17, 18
# CHECK-ENCODING: [0x5b,0x85,0x25,0xa3]

cv.insert s0, s1, 30, 31
# CHECK-INSTR: cv.insert s0, s1, 30, 31
# CHECK-ENCODING: [0x5b,0x84,0xf4,0xbd]

