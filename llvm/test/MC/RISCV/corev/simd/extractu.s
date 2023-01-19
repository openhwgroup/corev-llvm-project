# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.extractu.h
//===----------------------------------------------------------------------===//

cv.extractu.h t0, t1, -32
# CHECK-INSTR: cv.extractu.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x22,0x03,0xb9]

cv.extractu.h a0, a1, 7
# CHECK-INSTR: cv.extractu.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xa5,0x35,0xba]

cv.extractu.h s0, s1, -1
# CHECK-INSTR: cv.extractu.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xa4,0xf4,0xbb]

//===----------------------------------------------------------------------===//
// cv.extractu.b
//===----------------------------------------------------------------------===//

cv.extractu.b t0, t1, -32
# CHECK-INSTR: cv.extractu.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x32,0x03,0xb9]

cv.extractu.b a0, a1, 7
# CHECK-INSTR: cv.extractu.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xb5,0x35,0xba]

cv.extractu.b s0, s1, -1
# CHECK-INSTR: cv.extractu.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xb4,0xf4,0xbb]

