# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.insert.h
//===----------------------------------------------------------------------===//

cv.insert.h t0, t1, 0
# CHECK-INSTR: cv.insert.h t0, t1, 0
# CHECK-ENCODING: [0xfb,0x42,0x03,0xb8]

cv.insert.h t3, t4, 32
# CHECK-INSTR: cv.insert.h t3, t4, 32
# CHECK-ENCODING: [0x7b,0xce,0x0e,0xb9]

cv.insert.h a0, a1, 7
# CHECK-INSTR: cv.insert.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xc5,0x35,0xba]

cv.insert.h s0, s1, 63
# CHECK-INSTR: cv.insert.h s0, s1, 63
# CHECK-ENCODING: [0x7b,0xc4,0xf4,0xbb]

//===----------------------------------------------------------------------===//
// cv.insert.b
//===----------------------------------------------------------------------===//

cv.insert.b t0, t1, 0
# CHECK-INSTR: cv.insert.b t0, t1, 0
# CHECK-ENCODING: [0xfb,0x52,0x03,0xb8]

cv.insert.b t3, t4, 32
# CHECK-INSTR: cv.insert.b t3, t4, 32
# CHECK-ENCODING: [0x7b,0xde,0x0e,0xb9]

cv.insert.b a0, a1, 7
# CHECK-INSTR: cv.insert.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xd5,0x35,0xba]

cv.insert.b s0, s1, 63
# CHECK-INSTR: cv.insert.b s0, s1, 63
# CHECK-ENCODING: [0x7b,0xd4,0xf4,0xbb]

