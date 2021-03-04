# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.max t0, t1, t2
# CHECK-INSTR: cv.max t0, t1, t2
# CHECK-ENCODING: [0xb3,0x62,0x73,0x04]

cv.max a0, a1, a2
# CHECK-INSTR: cv.max a0, a1, a2
# CHECK-ENCODING: [0x33,0xe5,0xc5,0x04]
