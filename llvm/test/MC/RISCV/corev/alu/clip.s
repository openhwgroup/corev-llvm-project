# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.clip t0, t1, 0
# CHECK-INSTR: cv.clip t0, t1, 0
# CHECK-ENCODING: [0xb3,0x12,0x03,0x14]

cv.clip t0, t1, 16
# CHECK-INSTR: cv.clip t0, t1, 16
# CHECK-ENCODING: [0xb3,0x12,0x03,0x15]

cv.clip a0, zero, 31
# CHECK-INSTR: cv.clip a0, zero, 31
# CHECK-ENCODING: [0x33,0x15,0xf0,0x15]
