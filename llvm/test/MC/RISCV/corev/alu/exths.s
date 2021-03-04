# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.exths t0, t1
# CHECK-INSTR: cv.exths t0, t1
# CHECK-ENCODING: [0xb3,0x42,0x03,0x10]

cv.exths a0, a1
# CHECK-INSTR: cv.exths a0, a1
# CHECK-ENCODING: [0x33,0xc5,0x05,0x10]
