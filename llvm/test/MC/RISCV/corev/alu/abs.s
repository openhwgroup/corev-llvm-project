# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.abs t0, t1
# CHECK-INSTR: cv.abs t0, t1
# CHECK-ENCODING: [0xb3,0x02,0x03,0x04]

cv.abs a0, a1
# CHECK-INSTR: cv.abs a0, a1
# CHECK-ENCODING: [0x33,0x85,0x05,0x04]
