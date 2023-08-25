# RUN: llvm-mc -triple=riscv32 --mattr=+xcvalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.subN t0, t1, t2, 0
# CHECK-INSTR: cv.subN t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x32,0x73,0x00]

cv.subN t0, t1, t2, 16
# CHECK-INSTR: cv.subN t0, t1, t2, 16
# CHECK-ENCODING: [0xdb,0x32,0x73,0x20]

cv.subN a0, a1, zero, 31
# CHECK-INSTR: cv.subN a0, a1, zero, 31
# CHECK-ENCODING: [0x5b,0xb5,0x05,0x3e]
