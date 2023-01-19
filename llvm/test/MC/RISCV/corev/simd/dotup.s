# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.dotup.h
//===----------------------------------------------------------------------===//

cv.dotup.h t0, t1, t2
# CHECK-INSTR: cv.dotup.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x80]

cv.dotup.h a0, a1, a2
# CHECK-INSTR: cv.dotup.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x80]

cv.dotup.h s0, s1, s2
# CHECK-INSTR: cv.dotup.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x81]

//===----------------------------------------------------------------------===//
// cv.dotup.b
//===----------------------------------------------------------------------===//

cv.dotup.b t0, t1, t2
# CHECK-INSTR: cv.dotup.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x80]

cv.dotup.b a0, a1, a2
# CHECK-INSTR: cv.dotup.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x80]

cv.dotup.b s0, s1, s2
# CHECK-INSTR: cv.dotup.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x81]

//===----------------------------------------------------------------------===//
// cv.dotup.sc.h
//===----------------------------------------------------------------------===//

cv.dotup.sc.h t0, t1, t2
# CHECK-INSTR: cv.dotup.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x80]

cv.dotup.sc.h a0, a1, a2
# CHECK-INSTR: cv.dotup.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x80]

cv.dotup.sc.h s0, s1, s2
# CHECK-INSTR: cv.dotup.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x81]

//===----------------------------------------------------------------------===//
// cv.dotup.sc.b
//===----------------------------------------------------------------------===//

cv.dotup.sc.b t0, t1, t2
# CHECK-INSTR: cv.dotup.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x80]

cv.dotup.sc.b a0, a1, a2
# CHECK-INSTR: cv.dotup.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x80]

cv.dotup.sc.b s0, s1, s2
# CHECK-INSTR: cv.dotup.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x81]

//===----------------------------------------------------------------------===//
// cv.dotup.sci.h
//===----------------------------------------------------------------------===//

cv.dotup.sci.h t0, t1, -32
# CHECK-INSTR: cv.dotup.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x81]

cv.dotup.sci.h a0, a1, 7
# CHECK-INSTR: cv.dotup.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x82]

cv.dotup.sci.h s0, s1, -1
# CHECK-INSTR: cv.dotup.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x83]

//===----------------------------------------------------------------------===//
// cv.dotup.sci.b
//===----------------------------------------------------------------------===//

cv.dotup.sci.b t0, t1, -32
# CHECK-INSTR: cv.dotup.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x81]

cv.dotup.sci.b a0, a1, 7
# CHECK-INSTR: cv.dotup.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x82]

cv.dotup.sci.b s0, s1, -1
# CHECK-INSTR: cv.dotup.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x83]

