# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevmac -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.mac t0, t1, t2
# CHECK-INSTR: cv.mac t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x90]

cv.mac t0, t1, zero
# CHECK-INSTR: cv.mac t0, t1, zero
# CHECK-ENCODING: [0xab,0x32,0x03,0x90]
