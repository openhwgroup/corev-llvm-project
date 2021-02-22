# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevmem -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.lhu t0, 0(t1!)
# CHECK-INSTR: cv.lhu t0, 0(t1!)
# CHECK-ENCODING: [0x8b,0x52,0x03,0x00]

cv.lhu a0, 2047(a1!)
# CHECK-INSTR: cv.lhu a0, 2047(a1!)
# CHECK-ENCODING: [0x0b,0xd5,0xf5,0x7f]



cv.lhu t0, t2(t1!)
# CHECK-INSTR: cv.lhu t0, t2(t1!)
# CHECK-ENCODING: [0x8b,0x72,0x73,0x50]

cv.lhu a0, a2(a1!)
# CHECK-INSTR: cv.lhu a0, a2(a1!)
# CHECK-ENCODING: [0x0b,0xf5,0xc5,0x50]



cv.lhu t0, t2(t1)
# CHECK-INSTR: cv.lhu t0, t2(t1)
# CHECK-ENCODING: [0x83,0x72,0x73,0x50]

cv.lhu a0, a2(a1)
# CHECK-INSTR: cv.lhu a0, a2(a1)
# CHECK-ENCODING: [0x03,0xf5,0xc5,0x50]
