# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevmac -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.mulhhs t0, t1, t2
# CHECK-INSTR: cv.mulhhs t0, t1, t2
# CHECK-ENCODING: [0xdb,0x02,0x73,0xc0]

cv.mulhhs t0, t1, zero
# CHECK-INSTR: cv.mulhhs t0, t1, zero
# CHECK-ENCODING: [0xdb,0x02,0x03,0xc0]
