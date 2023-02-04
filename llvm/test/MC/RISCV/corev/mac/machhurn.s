# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevmac -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.machhurn t0, t1, t2, 0
# CHECK-INSTR: cv.machhurn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x72,0x73,0xc0]

cv.machhurn t0, t1, zero, 16
# CHECK-INSTR: cv.machhurn t0, t1, zero, 16
# CHECK-ENCODING: [0xdb,0x72,0x03,0xe0]

cv.machhurn t0, t1, zero, 31
# CHECK-INSTR: cv.machhurn t0, t1, zero, 31
# CHECK-ENCODING: [0xdb,0x72,0x03,0xfe]
