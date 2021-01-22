# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevmac -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.mulsn t0, t1, t2, 0
# CHECK-INSTR: cv.mulsn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x02,0x73,0x80]

cv.mulsn t0, t1, zero, 16
# CHECK-INSTR: cv.mulsn t0, t1, zero, 16
# CHECK-ENCODING: [0xdb,0x02,0x03,0xa0]

cv.mulsn t0, t1, zero, 31
# CHECK-INSTR: cv.mulsn t0, t1, zero, 31
# CHECK-ENCODING: [0xdb,0x02,0x03,0xbe]
