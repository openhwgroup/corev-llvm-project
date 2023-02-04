# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevmac -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.msu t0, t1, t2
# CHECK-INSTR: cv.msu t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x92]

cv.msu t0, t1, zero
# CHECK-INSTR: cv.msu t0, t1, zero
# CHECK-ENCODING: [0xab,0x32,0x03,0x92]
