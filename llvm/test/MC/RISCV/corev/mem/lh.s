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
# CHECK-ENCODING: [0xab,0x32,0x73,0x02]

cv.lh a0, a2(a1!)
# CHECK-INSTR: cv.lh a0, a2(a1!)
# CHECK-ENCODING: [0x2b,0xb5,0xc5,0x02]



cv.lh t0, t2(t1)
# CHECK-INSTR: cv.lh t0, t2(t1)
# CHECK-ENCODING: [0xab,0x32,0x73,0x0a]

cv.lh a0, a2(a1)
# CHECK-INSTR: cv.lh a0, a2(a1)
# CHECK-ENCODING: [0x2b,0xb5,0xc5,0x0a]
