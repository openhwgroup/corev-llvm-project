# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevmem -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.lh t0, 0(t1!)
# CHECK-INSTR: cv.lh t0, 0(t1!)
# CHECK-ENCODING: [0x8b,0x12,0x03,0x00]

cv.lh a0, 2047(a1!)
# CHECK-INSTR: cv.lh a0, 2047(a1!)
# CHECK-ENCODING: [0x0b,0x95,0xf5,0x7f]



cv.lh t0, t2(t1!)
# CHECK-INSTR: cv.lh t0, t2(t1!)
# CHECK-ENCODING: [0x8b,0x72,0x73,0x10]

cv.lh a0, a2(a1!)
# CHECK-INSTR: cv.lh a0, a2(a1!)
# CHECK-ENCODING: [0x0b,0xf5,0xc5,0x10]



cv.lh t0, t2(t1)
# CHECK-INSTR: cv.lh t0, t2(t1)
# CHECK-ENCODING: [0x83,0x72,0x73,0x10]

cv.lh a0, a2(a1)
# CHECK-INSTR: cv.lh a0, a2(a1)
# CHECK-ENCODING: [0x03,0xf5,0xc5,0x10]
