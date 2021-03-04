# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.addurnr t0, t1, t2
# CHECK-INSTR: cv.addurnr t0, t1, t2
# CHECK-ENCODING: [0xdb,0x62,0x73,0xc0]

cv.addurnr a0, a1, a2
# CHECK-INSTR: cv.addurnr a0, a1, a2
# CHECK-ENCODING: [0x5b,0xe5,0xc5,0xc0]
