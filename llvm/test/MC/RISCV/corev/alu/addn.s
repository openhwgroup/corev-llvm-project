# RUN: llvm-mc -triple=riscv32 --mattr=+xcvalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.addN t0, t1, t2, 0
# CHECK-INSTR: cv.addN t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x22,0x73,0x00]

cv.addN t0, t1, t2, 16
# CHECK-INSTR: cv.addN t0, t1, t2, 16
# CHECK-ENCODING: [0xdb,0x22,0x73,0x20]

cv.addN a0, a1, zero, 31
# CHECK-INSTR: cv.addN a0, a1, zero, 31
# CHECK-ENCODING: [0x5b,0xa5,0x05,0x3e]
