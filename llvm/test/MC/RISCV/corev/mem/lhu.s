# RUN: llvm-mc -triple=riscv32 --mattr=+xcvmem -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.lhu t0, (t1), 0
# CHECK-INSTR: cv.lhu t0, (t1), 0
# CHECK-ENCODING: [0x8b,0x52,0x03,0x00]

cv.lhu a0, (a1), 2047
# CHECK-INSTR: cv.lhu a0, (a1), 2047
# CHECK-ENCODING: [0x0b,0xd5,0xf5,0x7f]



cv.lhu t0, (t1), t2
# CHECK-INSTR: cv.lhu t0, (t1), t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x12]

cv.lhu a0, (a1), a2
# CHECK-INSTR: cv.lhu a0, (a1), a2
# CHECK-ENCODING: [0x2b,0xb5,0xc5,0x12]



cv.lhu t0, t2(t1)
# CHECK-INSTR: cv.lhu t0, t2(t1)
# CHECK-ENCODING: [0xab,0x32,0x73,0x1a]

cv.lhu a0, a2(a1)
# CHECK-INSTR: cv.lhu a0, a2(a1)
# CHECK-ENCODING: [0x2b,0xb5,0xc5,0x1a]
