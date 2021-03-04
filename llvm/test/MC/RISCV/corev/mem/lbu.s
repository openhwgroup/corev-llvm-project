# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevmem -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.lbu t0, 0(t1!)
# CHECK-INSTR: cv.lbu t0, 0(t1!)
# CHECK-ENCODING: [0x8b,0x42,0x03,0x00]

cv.lbu a0, 2047(a1!)
# CHECK-INSTR: cv.lbu a0, 2047(a1!)
# CHECK-ENCODING: [0x0b,0xc5,0xf5,0x7f]



cv.lbu t0, t2(t1!)
# CHECK-INSTR: cv.lbu t0, t2(t1!)
# CHECK-ENCODING: [0x8b,0x72,0x73,0x40]

cv.lbu a0, a2(a1!)
# CHECK-INSTR: cv.lbu a0, a2(a1!)
# CHECK-ENCODING: [0x0b,0xf5,0xc5,0x40]



cv.lbu t0, t2(t1)
# CHECK-INSTR: cv.lbu t0, t2(t1)
# CHECK-ENCODING: [0x83,0x72,0x73,0x40]

cv.lbu a0, a2(a1)
# CHECK-INSTR: cv.lbu a0, a2(a1)
# CHECK-ENCODING: [0x03,0xf5,0xc5,0x40]
