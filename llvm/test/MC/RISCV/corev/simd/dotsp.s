# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.dotsp.h
//===----------------------------------------------------------------------===//

cv.dotsp.h t0, t1, t2
# CHECK-INSTR: cv.dotsp.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x90]

cv.dotsp.h a0, a1, a2
# CHECK-INSTR: cv.dotsp.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x90]

cv.dotsp.h s0, s1, s2
# CHECK-INSTR: cv.dotsp.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x91]

//===----------------------------------------------------------------------===//
// cv.dotsp.b
//===----------------------------------------------------------------------===//

cv.dotsp.b t0, t1, t2
# CHECK-INSTR: cv.dotsp.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x90]

cv.dotsp.b a0, a1, a2
# CHECK-INSTR: cv.dotsp.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x90]

cv.dotsp.b s0, s1, s2
# CHECK-INSTR: cv.dotsp.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x91]

//===----------------------------------------------------------------------===//
// cv.dotsp.sc.h
//===----------------------------------------------------------------------===//

cv.dotsp.sc.h t0, t1, t2
# CHECK-INSTR: cv.dotsp.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x90]

cv.dotsp.sc.h a0, a1, a2
# CHECK-INSTR: cv.dotsp.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x90]

cv.dotsp.sc.h s0, s1, s2
# CHECK-INSTR: cv.dotsp.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x91]

//===----------------------------------------------------------------------===//
// cv.dotsp.sc.b
//===----------------------------------------------------------------------===//

cv.dotsp.sc.b t0, t1, t2
# CHECK-INSTR: cv.dotsp.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x90]

cv.dotsp.sc.b a0, a1, a2
# CHECK-INSTR: cv.dotsp.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x90]

cv.dotsp.sc.b s0, s1, s2
# CHECK-INSTR: cv.dotsp.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x91]

//===----------------------------------------------------------------------===//
// cv.dotsp.sci.h
//===----------------------------------------------------------------------===//

cv.dotsp.sci.h t0, t1, -32
# CHECK-INSTR: cv.dotsp.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x91]

cv.dotsp.sci.h a0, a1, 7
# CHECK-INSTR: cv.dotsp.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x92]

cv.dotsp.sci.h s0, s1, -1
# CHECK-INSTR: cv.dotsp.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x93]

//===----------------------------------------------------------------------===//
// cv.dotsp.sci.b
//===----------------------------------------------------------------------===//

cv.dotsp.sci.b t0, t1, -32
# CHECK-INSTR: cv.dotsp.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x91]

cv.dotsp.sci.b a0, a1, 7
# CHECK-INSTR: cv.dotsp.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x92]

cv.dotsp.sci.b s0, s1, -1
# CHECK-INSTR: cv.dotsp.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x93]

