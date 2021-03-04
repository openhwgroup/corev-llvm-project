# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.extbs t0, t1
# CHECK-INSTR: cv.extbs t0, t1
# CHECK-ENCODING: [0xb3,0x62,0x03,0x10]

cv.extbs a0, a1
# CHECK-INSTR: cv.extbs a0, a1
# CHECK-ENCODING: [0x33,0xe5,0x05,0x10]
