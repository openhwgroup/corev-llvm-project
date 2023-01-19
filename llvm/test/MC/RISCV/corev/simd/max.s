# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.max.h
//===----------------------------------------------------------------------===//

cv.max.h t0, t1, t2
# CHECK-INSTR: cv.max.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x30]

cv.max.h a0, a1, a2
# CHECK-INSTR: cv.max.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x30]

cv.max.h s0, s1, s2
# CHECK-INSTR: cv.max.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x31]

//===----------------------------------------------------------------------===//
// cv.max.b
//===----------------------------------------------------------------------===//

cv.max.b t0, t1, t2
# CHECK-INSTR: cv.max.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x30]

cv.max.b a0, a1, a2
# CHECK-INSTR: cv.max.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x30]

cv.max.b s0, s1, s2
# CHECK-INSTR: cv.max.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x31]

//===----------------------------------------------------------------------===//
// cv.max.sc.h
//===----------------------------------------------------------------------===//

cv.max.sc.h t0, t1, t2
# CHECK-INSTR: cv.max.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x30]

cv.max.sc.h a0, a1, a2
# CHECK-INSTR: cv.max.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x30]

cv.max.sc.h s0, s1, s2
# CHECK-INSTR: cv.max.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x31]

//===----------------------------------------------------------------------===//
// cv.max.sc.b
//===----------------------------------------------------------------------===//

cv.max.sc.b t0, t1, t2
# CHECK-INSTR: cv.max.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x30]

cv.max.sc.b a0, a1, a2
# CHECK-INSTR: cv.max.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x30]

cv.max.sc.b s0, s1, s2
# CHECK-INSTR: cv.max.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x31]

//===----------------------------------------------------------------------===//
// cv.max.sci.h
//===----------------------------------------------------------------------===//

cv.max.sci.h t0, t1, -32
# CHECK-INSTR: cv.max.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x31]

cv.max.sci.h a0, a1, 7
# CHECK-INSTR: cv.max.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x32]

cv.max.sci.h s0, s1, -1
# CHECK-INSTR: cv.max.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x33]

//===----------------------------------------------------------------------===//
// cv.max.sci.b
//===----------------------------------------------------------------------===//

cv.max.sci.b t0, t1, -32
# CHECK-INSTR: cv.max.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x31]

cv.max.sci.b a0, a1, 7
# CHECK-INSTR: cv.max.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x32]

cv.max.sci.b s0, s1, -1
# CHECK-INSTR: cv.max.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x33]

