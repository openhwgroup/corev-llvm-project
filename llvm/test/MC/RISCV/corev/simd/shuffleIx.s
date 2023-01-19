# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.shuffleI0.sci.b
//===----------------------------------------------------------------------===//

cv.shuffleI0.sci.b t0, t1, -32
# CHECK-INSTR: cv.shuffleI0.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0xc1]

cv.shuffleI0.sci.b a0, a1, 7
# CHECK-INSTR: cv.shuffleI0.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0xc2]

cv.shuffleI0.sci.b s0, s1, -1
# CHECK-INSTR: cv.shuffleI0.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0xc3]

//===----------------------------------------------------------------------===//
// cv.shuffleI1.sci.b
//===----------------------------------------------------------------------===//

cv.shuffleI1.sci.b t0, t1, -32
# CHECK-INSTR: cv.shuffleI1.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0xc9]

cv.shuffleI1.sci.b a0, a1, 7
# CHECK-INSTR: cv.shuffleI1.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0xca]

cv.shuffleI1.sci.b s0, s1, -1
# CHECK-INSTR: cv.shuffleI1.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0xcb]

//===----------------------------------------------------------------------===//
// cv.shuffleI2.sci.b
//===----------------------------------------------------------------------===//

cv.shuffleI2.sci.b t0, t1, -32
# CHECK-INSTR: cv.shuffleI2.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0xd1]

cv.shuffleI2.sci.b a0, a1, 7
# CHECK-INSTR: cv.shuffleI2.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0xd2]

cv.shuffleI2.sci.b s0, s1, -1
# CHECK-INSTR: cv.shuffleI2.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0xd3]

//===----------------------------------------------------------------------===//
// cv.shuffleI3.sci.b
//===----------------------------------------------------------------------===//

cv.shuffleI3.sci.b t0, t1, -32
# CHECK-INSTR: cv.shuffleI3.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0xd9]

cv.shuffleI3.sci.b a0, a1, 7
# CHECK-INSTR: cv.shuffleI3.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0xda]

cv.shuffleI3.sci.b s0, s1, -1
# CHECK-INSTR: cv.shuffleI3.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0xdb]

