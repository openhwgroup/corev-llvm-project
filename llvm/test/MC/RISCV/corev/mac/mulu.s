# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevmac -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.mulu t0, t1, t2
# CHECK-INSTR: cv.mulu t0, t1, t2
# CHECK-ENCODING: [0xdb,0x02,0x73,0x00]

cv.mulu t0, t1, zero
# CHECK-INSTR: cv.mulu t0, t1, zero
# CHECK-ENCODING: [0xdb,0x02,0x03,0x00]
