# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.addunr t0, t1, t2
# CHECK-INSTR: cv.addunr t0, t1, t2
# CHECK-ENCODING: [0xdb,0x22,0x73,0xc0]

cv.addunr a0, a1, a2
# CHECK-INSTR: cv.addunr a0, a1, a2
# CHECK-ENCODING: [0x5b,0xa5,0xc5,0xc0]
