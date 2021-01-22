# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevmac -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.mac t0, t1, t2
# CHECK-INSTR: cv.mac t0, t1, t2
# CHECK-ENCODING: [0xb3,0x02,0x73,0x42]

cv.mac t0, t1, zero
# CHECK-INSTR: cv.mac t0, t1, zero
# CHECK-ENCODING: [0xb3,0x02,0x03,0x42]
