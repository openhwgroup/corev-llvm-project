# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.cmple.h
//===----------------------------------------------------------------------===//

cv.cmple.h t0, t1, t2
# CHECK-INSTR: cv.cmple.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x2c]

cv.cmple.h a0, a1, a2
# CHECK-INSTR: cv.cmple.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x2c]

cv.cmple.h s0, s1, s2
# CHECK-INSTR: cv.cmple.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x2d]

//===----------------------------------------------------------------------===//
// cv.cmple.b
//===----------------------------------------------------------------------===//

cv.cmple.b t0, t1, t2
# CHECK-INSTR: cv.cmple.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x2c]

cv.cmple.b a0, a1, a2
# CHECK-INSTR: cv.cmple.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x2c]

cv.cmple.b s0, s1, s2
# CHECK-INSTR: cv.cmple.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x2d]

//===----------------------------------------------------------------------===//
// cv.cmple.sc.h
//===----------------------------------------------------------------------===//

cv.cmple.sc.h t0, t1, t2
# CHECK-INSTR: cv.cmple.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x2c]

cv.cmple.sc.h a0, a1, a2
# CHECK-INSTR: cv.cmple.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x2c]

cv.cmple.sc.h s0, s1, s2
# CHECK-INSTR: cv.cmple.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x2d]

//===----------------------------------------------------------------------===//
// cv.cmple.sc.b
//===----------------------------------------------------------------------===//

cv.cmple.sc.b t0, t1, t2
# CHECK-INSTR: cv.cmple.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x2c]

cv.cmple.sc.b a0, a1, a2
# CHECK-INSTR: cv.cmple.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x2c]

cv.cmple.sc.b s0, s1, s2
# CHECK-INSTR: cv.cmple.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x2d]

//===----------------------------------------------------------------------===//
// cv.cmple.sci.h
//===----------------------------------------------------------------------===//

cv.cmple.sci.h t0, t1, -32
# CHECK-INSTR: cv.cmple.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x2d]

cv.cmple.sci.h a0, a1, 7
# CHECK-INSTR: cv.cmple.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x2e]

cv.cmple.sci.h s0, s1, -1
# CHECK-INSTR: cv.cmple.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x2f]

//===----------------------------------------------------------------------===//
// cv.cmple.sci.b
//===----------------------------------------------------------------------===//

cv.cmple.sci.b t0, t1, -32
# CHECK-INSTR: cv.cmple.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x2d]

cv.cmple.sci.b a0, a1, 7
# CHECK-INSTR: cv.cmple.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x2e]

cv.cmple.sci.b s0, s1, -1
# CHECK-INSTR: cv.cmple.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x2f]

