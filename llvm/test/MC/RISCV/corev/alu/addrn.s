# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.addrn t0, t1, t2, 0
# CHECK-INSTR: cv.addrn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x62,0x73,0x00]

cv.addrn t0, t1, t2, 16
# CHECK-INSTR: cv.addrn t0, t1, t2, 16
# CHECK-ENCODING: [0xdb,0x62,0x73,0x20]

cv.addrn a0, a1, zero, 31
# CHECK-INSTR: cv.addrn a0, a1, zero, 31
# CHECK-ENCODING: [0x5b,0xe5,0x05,0x3e]
