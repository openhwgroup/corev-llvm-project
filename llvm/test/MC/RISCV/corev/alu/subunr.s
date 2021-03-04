# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.subunr t0, t1, t2
# CHECK-INSTR: cv.subunr t0, t1, t2
# CHECK-ENCODING: [0xdb,0x32,0x73,0xc0]

cv.subunr a0, a1, a2
# CHECK-INSTR: cv.subunr a0, a1, a2
# CHECK-ENCODING: [0x5b,0xb5,0xc5,0xc0]
