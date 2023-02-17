# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.avgu.h
//===----------------------------------------------------------------------===//

cv.avgu.h t0, t1, t2
# CHECK-INSTR: cv.avgu.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x18]

cv.avgu.h a0, a1, a2
# CHECK-INSTR: cv.avgu.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x18]

cv.avgu.h s0, s1, s2
# CHECK-INSTR: cv.avgu.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x19]

//===----------------------------------------------------------------------===//
// cv.avgu.b
//===----------------------------------------------------------------------===//

cv.avgu.b t0, t1, t2
# CHECK-INSTR: cv.avgu.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x18]

cv.avgu.b a0, a1, a2
# CHECK-INSTR: cv.avgu.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x18]

cv.avgu.b s0, s1, s2
# CHECK-INSTR: cv.avgu.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x19]

//===----------------------------------------------------------------------===//
// cv.avgu.sc.h
//===----------------------------------------------------------------------===//

cv.avgu.sc.h t0, t1, t2
# CHECK-INSTR: cv.avgu.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x18]

cv.avgu.sc.h a0, a1, a2
# CHECK-INSTR: cv.avgu.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x18]

cv.avgu.sc.h s0, s1, s2
# CHECK-INSTR: cv.avgu.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x19]

//===----------------------------------------------------------------------===//
// cv.avgu.sc.b
//===----------------------------------------------------------------------===//

cv.avgu.sc.b t0, t1, t2
# CHECK-INSTR: cv.avgu.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x18]

cv.avgu.sc.b a0, a1, a2
# CHECK-INSTR: cv.avgu.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x18]

cv.avgu.sc.b s0, s1, s2
# CHECK-INSTR: cv.avgu.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x19]

//===----------------------------------------------------------------------===//
// cv.avgu.sci.h
//===----------------------------------------------------------------------===//

cv.avgu.sci.h t0, t1, -32
# CHECK-INSTR: cv.avgu.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x19]

cv.avgu.sci.h a0, a1, 7
# CHECK-INSTR: cv.avgu.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x1a]

cv.avgu.sci.h s0, s1, -1
# CHECK-INSTR: cv.avgu.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x1b]

//===----------------------------------------------------------------------===//
// cv.avgu.sci.b
//===----------------------------------------------------------------------===//

cv.avgu.sci.b t0, t1, -32
# CHECK-INSTR: cv.avgu.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x19]

cv.avgu.sci.b a0, a1, 7
# CHECK-INSTR: cv.avgu.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x1a]

cv.avgu.sci.b s0, s1, -1
# CHECK-INSTR: cv.avgu.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x1b]

