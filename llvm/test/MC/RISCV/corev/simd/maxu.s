# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.maxu.h
//===----------------------------------------------------------------------===//

cv.maxu.h t0, t1, t2
# CHECK-INSTR: cv.maxu.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x38]

cv.maxu.h a0, a1, a2
# CHECK-INSTR: cv.maxu.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x38]

cv.maxu.h s0, s1, s2
# CHECK-INSTR: cv.maxu.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x39]

//===----------------------------------------------------------------------===//
// cv.maxu.b
//===----------------------------------------------------------------------===//

cv.maxu.b t0, t1, t2
# CHECK-INSTR: cv.maxu.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x38]

cv.maxu.b a0, a1, a2
# CHECK-INSTR: cv.maxu.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x38]

cv.maxu.b s0, s1, s2
# CHECK-INSTR: cv.maxu.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x39]

//===----------------------------------------------------------------------===//
// cv.maxu.sc.h
//===----------------------------------------------------------------------===//

cv.maxu.sc.h t0, t1, t2
# CHECK-INSTR: cv.maxu.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x38]

cv.maxu.sc.h a0, a1, a2
# CHECK-INSTR: cv.maxu.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x38]

cv.maxu.sc.h s0, s1, s2
# CHECK-INSTR: cv.maxu.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x39]

//===----------------------------------------------------------------------===//
// cv.maxu.sc.b
//===----------------------------------------------------------------------===//

cv.maxu.sc.b t0, t1, t2
# CHECK-INSTR: cv.maxu.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x38]

cv.maxu.sc.b a0, a1, a2
# CHECK-INSTR: cv.maxu.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x38]

cv.maxu.sc.b s0, s1, s2
# CHECK-INSTR: cv.maxu.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x39]

//===----------------------------------------------------------------------===//
// cv.maxu.sci.h
//===----------------------------------------------------------------------===//

cv.maxu.sci.h t0, t1, -32
# CHECK-INSTR: cv.maxu.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x39]

cv.maxu.sci.h a0, a1, 7
# CHECK-INSTR: cv.maxu.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x3a]

cv.maxu.sci.h s0, s1, -1
# CHECK-INSTR: cv.maxu.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x3b]

//===----------------------------------------------------------------------===//
// cv.maxu.sci.b
//===----------------------------------------------------------------------===//

cv.maxu.sci.b t0, t1, -32
# CHECK-INSTR: cv.maxu.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x39]

cv.maxu.sci.b a0, a1, 7
# CHECK-INSTR: cv.maxu.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x3a]

cv.maxu.sci.b s0, s1, -1
# CHECK-INSTR: cv.maxu.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x3b]

