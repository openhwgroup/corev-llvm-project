# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.clipu t0, t1, 0
# CHECK-INSTR: cv.clipu t0, t1, 0
# CHECK-ENCODING: [0xb3,0x22,0x03,0x14]

cv.clipu t0, t1, 16
# CHECK-INSTR: cv.clipu t0, t1, 16
# CHECK-ENCODING: [0xb3,0x22,0x03,0x15]

cv.clipu a0, zero, 31
# CHECK-INSTR: cv.clipu a0, zero, 31
# CHECK-ENCODING: [0x33,0x25,0xf0,0x15]
