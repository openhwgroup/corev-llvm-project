# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.cmpleu.h
//===----------------------------------------------------------------------===//

cv.cmpleu.h t0, t1, t2
# CHECK-INSTR: cv.cmpleu.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x4c]

cv.cmpleu.h a0, a1, a2
# CHECK-INSTR: cv.cmpleu.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x4c]

cv.cmpleu.h s0, s1, s2
# CHECK-INSTR: cv.cmpleu.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x4d]

//===----------------------------------------------------------------------===//
// cv.cmpleu.b
//===----------------------------------------------------------------------===//

cv.cmpleu.b t0, t1, t2
# CHECK-INSTR: cv.cmpleu.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x4c]

cv.cmpleu.b a0, a1, a2
# CHECK-INSTR: cv.cmpleu.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x4c]

cv.cmpleu.b s0, s1, s2
# CHECK-INSTR: cv.cmpleu.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x4d]

//===----------------------------------------------------------------------===//
// cv.cmpleu.sc.h
//===----------------------------------------------------------------------===//

cv.cmpleu.sc.h t0, t1, t2
# CHECK-INSTR: cv.cmpleu.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x4c]

cv.cmpleu.sc.h a0, a1, a2
# CHECK-INSTR: cv.cmpleu.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x4c]

cv.cmpleu.sc.h s0, s1, s2
# CHECK-INSTR: cv.cmpleu.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x4d]

//===----------------------------------------------------------------------===//
// cv.cmpleu.sc.b
//===----------------------------------------------------------------------===//

cv.cmpleu.sc.b t0, t1, t2
# CHECK-INSTR: cv.cmpleu.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x4c]

cv.cmpleu.sc.b a0, a1, a2
# CHECK-INSTR: cv.cmpleu.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x4c]

cv.cmpleu.sc.b s0, s1, s2
# CHECK-INSTR: cv.cmpleu.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x4d]

//===----------------------------------------------------------------------===//
// cv.cmpleu.sci.h
//===----------------------------------------------------------------------===//

cv.cmpleu.sci.h t0, t1, -32
# CHECK-INSTR: cv.cmpleu.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x4d]

cv.cmpleu.sci.h a0, a1, 7
# CHECK-INSTR: cv.cmpleu.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x4e]

cv.cmpleu.sci.h s0, s1, -1
# CHECK-INSTR: cv.cmpleu.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x4f]

//===----------------------------------------------------------------------===//
// cv.cmpleu.sci.b
//===----------------------------------------------------------------------===//

cv.cmpleu.sci.b t0, t1, -32
# CHECK-INSTR: cv.cmpleu.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x4d]

cv.cmpleu.sci.b a0, a1, 7
# CHECK-INSTR: cv.cmpleu.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x4e]

cv.cmpleu.sci.b s0, s1, -1
# CHECK-INSTR: cv.cmpleu.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x4f]

