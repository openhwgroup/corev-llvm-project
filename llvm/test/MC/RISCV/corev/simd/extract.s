# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.extract.h
//===----------------------------------------------------------------------===//

cv.extract.h t0, t1, 0
# CHECK-INSTR: cv.extract.h t0, t1, 0
# CHECK-ENCODING: [0xfb,0x02,0x03,0xb8]

cv.extract.h t3, t4, 32
# CHECK-INSTR: cv.extract.h t3, t4, 32
# CHECK-ENCODING: [0x7b,0x8e,0x0e,0xb9]

cv.extract.h a0, a1, 7
# CHECK-INSTR: cv.extract.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0x85,0x35,0xba]

cv.extract.h s0, s1, 63
# CHECK-INSTR: cv.extract.h s0, s1, 63
# CHECK-ENCODING: [0x7b,0x84,0xf4,0xbb]

//===----------------------------------------------------------------------===//
// cv.extract.b
//===----------------------------------------------------------------------===//

cv.extract.b t0, t1, 0
# CHECK-INSTR: cv.extract.b t0, t1, 0
# CHECK-ENCODING: [0xfb,0x12,0x03,0xb8]

cv.extract.b t3, t4, 32
# CHECK-INSTR: cv.extract.b t3, t4, 32
# CHECK-ENCODING: [0x7b,0x9e,0x0e,0xb9]

cv.extract.b a0, a1, 7
# CHECK-INSTR: cv.extract.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0x95,0x35,0xba]

cv.extract.b s0, s1, 63
# CHECK-INSTR: cv.extract.b s0, s1, 63
# CHECK-ENCODING: [0x7b,0x94,0xf4,0xbb]

