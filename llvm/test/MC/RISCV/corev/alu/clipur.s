# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.clipur t0, t1, t2
# CHECK-INSTR: cv.clipur t0, t1, t2
# CHECK-ENCODING: [0xb3,0x62,0x73,0x14]

cv.clipur a0, a1, a2
# CHECK-INSTR: cv.clipur a0, a1, a2
# CHECK-ENCODING: [0x33,0xe5,0xc5,0x14]
