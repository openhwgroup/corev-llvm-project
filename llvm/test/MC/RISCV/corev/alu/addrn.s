# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.addrn t0, t1, t2, 0
# CHECK-INSTR: cv.addrn t0, t1, t2, 0
# CHECK-ENCODING: [0xab,0x22,0x73,0x80]

cv.addrn t0, t1, t2, 16
# CHECK-INSTR: cv.addrn t0, t1, t2, 16
# CHECK-ENCODING: [0xab,0x22,0x73,0xa0]

cv.addrn a0, a1, zero, 31
# CHECK-INSTR: cv.addrn a0, a1, zero, 31
# CHECK-ENCODING: [0x2b,0xa5,0x05,0xbe]
