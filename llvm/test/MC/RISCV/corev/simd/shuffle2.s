# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.shuffle2.h
//===----------------------------------------------------------------------===//

cv.shuffle2.h t0, t1, t2
# CHECK-INSTR: cv.shuffle2.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0xe0]

cv.shuffle2.h a0, a1, a2
# CHECK-INSTR: cv.shuffle2.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0xe0]

cv.shuffle2.h s0, s1, s2
# CHECK-INSTR: cv.shuffle2.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0xe1]

//===----------------------------------------------------------------------===//
// cv.shuffle2.b
//===----------------------------------------------------------------------===//

cv.shuffle2.b t0, t1, t2
# CHECK-INSTR: cv.shuffle2.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0xe0]

cv.shuffle2.b a0, a1, a2
# CHECK-INSTR: cv.shuffle2.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0xe0]

cv.shuffle2.b s0, s1, s2
# CHECK-INSTR: cv.shuffle2.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0xe1]

