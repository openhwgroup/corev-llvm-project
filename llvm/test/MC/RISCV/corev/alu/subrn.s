# RUN: llvm-mc -triple=riscv32 --mattr=+xcvalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.subrn t0, t1, t2, 0
# CHECK-INSTR: cv.subrn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x32,0x73,0x80]

cv.subrn t0, t1, t2, 16
# CHECK-INSTR: cv.subrn t0, t1, t2, 16
# CHECK-ENCODING: [0xdb,0x32,0x73,0xa0]

cv.subrn a0, a1, zero, 31
# CHECK-INSTR: cv.subrn a0, a1, zero, 31
# CHECK-ENCODING: [0x5b,0xb5,0x05,0xbe]
