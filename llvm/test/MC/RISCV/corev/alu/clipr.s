# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.clipr t0, t1, t2
# CHECK-INSTR: cv.clipr t0, t1, t2
# CHECK-ENCODING: [0xb3,0x52,0x73,0x14]

cv.clipr a0, a1, a2
# CHECK-INSTR: cv.clipr a0, a1, a2
# CHECK-ENCODING: [0x33,0xd5,0xc5,0x14]
