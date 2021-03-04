# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.extbz t0, t1
# CHECK-INSTR: cv.extbz t0, t1
# CHECK-ENCODING: [0xb3,0x72,0x03,0x10]

cv.extbz a0, a1
# CHECK-INSTR: cv.extbz a0, a1
# CHECK-ENCODING: [0x33,0xf5,0x05,0x10]
