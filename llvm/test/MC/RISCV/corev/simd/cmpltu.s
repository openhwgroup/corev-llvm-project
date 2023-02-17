# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.cmpltu.h
//===----------------------------------------------------------------------===//

cv.cmpltu.h t0, t1, t2
# CHECK-INSTR: cv.cmpltu.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x44]

cv.cmpltu.h a0, a1, a2
# CHECK-INSTR: cv.cmpltu.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x44]

cv.cmpltu.h s0, s1, s2
# CHECK-INSTR: cv.cmpltu.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x45]

//===----------------------------------------------------------------------===//
// cv.cmpltu.b
//===----------------------------------------------------------------------===//

cv.cmpltu.b t0, t1, t2
# CHECK-INSTR: cv.cmpltu.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x44]

cv.cmpltu.b a0, a1, a2
# CHECK-INSTR: cv.cmpltu.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x44]

cv.cmpltu.b s0, s1, s2
# CHECK-INSTR: cv.cmpltu.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x45]

//===----------------------------------------------------------------------===//
// cv.cmpltu.sc.h
//===----------------------------------------------------------------------===//

cv.cmpltu.sc.h t0, t1, t2
# CHECK-INSTR: cv.cmpltu.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x44]

cv.cmpltu.sc.h a0, a1, a2
# CHECK-INSTR: cv.cmpltu.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x44]

cv.cmpltu.sc.h s0, s1, s2
# CHECK-INSTR: cv.cmpltu.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x45]

//===----------------------------------------------------------------------===//
// cv.cmpltu.sc.b
//===----------------------------------------------------------------------===//

cv.cmpltu.sc.b t0, t1, t2
# CHECK-INSTR: cv.cmpltu.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x44]

cv.cmpltu.sc.b a0, a1, a2
# CHECK-INSTR: cv.cmpltu.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x44]

cv.cmpltu.sc.b s0, s1, s2
# CHECK-INSTR: cv.cmpltu.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x45]

//===----------------------------------------------------------------------===//
// cv.cmpltu.sci.h
//===----------------------------------------------------------------------===//

cv.cmpltu.sci.h t0, t1, -32
# CHECK-INSTR: cv.cmpltu.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x45]

cv.cmpltu.sci.h a0, a1, 7
# CHECK-INSTR: cv.cmpltu.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x46]

cv.cmpltu.sci.h s0, s1, -1
# CHECK-INSTR: cv.cmpltu.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x47]

//===----------------------------------------------------------------------===//
// cv.cmpltu.sci.b
//===----------------------------------------------------------------------===//

cv.cmpltu.sci.b t0, t1, -32
# CHECK-INSTR: cv.cmpltu.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x45]

cv.cmpltu.sci.b a0, a1, 7
# CHECK-INSTR: cv.cmpltu.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x46]

cv.cmpltu.sci.b s0, s1, -1
# CHECK-INSTR: cv.cmpltu.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x47]

