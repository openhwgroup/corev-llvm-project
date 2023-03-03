# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevmac -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.mulhhun t0, t1, t2, 0
# CHECK-INSTR: cv.mulhhun t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x52,0x73,0x40]

cv.mulhhun t0, t1, zero, 16
# CHECK-INSTR: cv.mulhhun t0, t1, zero, 16
# CHECK-ENCODING: [0xdb,0x52,0x03,0x60]

cv.mulhhun t0, t1, zero, 31
# CHECK-INSTR: cv.mulhhun t0, t1, zero, 31
# CHECK-ENCODING: [0xdb,0x52,0x03,0x7e]
