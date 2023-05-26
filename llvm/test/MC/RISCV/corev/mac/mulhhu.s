# RUN: llvm-mc -triple=riscv32 --mattr=+xcvmac -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.mulhhu t0, t1, t2
# CHECK-INSTR: cv.mulhhun t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x52,0x73,0x40]

cv.mulhhu t0, t1, zero
# CHECK-INSTR: cv.mulhhun t0, t1, zero, 0
# CHECK-ENCODING: [0xdb,0x52,0x03,0x40]
