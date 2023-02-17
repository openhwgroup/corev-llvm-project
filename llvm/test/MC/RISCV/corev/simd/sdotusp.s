# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.sdotusp.h
//===----------------------------------------------------------------------===//

cv.sdotusp.h t0, t1, t2
# CHECK-INSTR: cv.sdotusp.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0xa0]

cv.sdotusp.h a0, a1, a2
# CHECK-INSTR: cv.sdotusp.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0xa0]

cv.sdotusp.h s0, s1, s2
# CHECK-INSTR: cv.sdotusp.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0xa1]

//===----------------------------------------------------------------------===//
// cv.sdotusp.b
//===----------------------------------------------------------------------===//

cv.sdotusp.b t0, t1, t2
# CHECK-INSTR: cv.sdotusp.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0xa0]

cv.sdotusp.b a0, a1, a2
# CHECK-INSTR: cv.sdotusp.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0xa0]

cv.sdotusp.b s0, s1, s2
# CHECK-INSTR: cv.sdotusp.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0xa1]

//===----------------------------------------------------------------------===//
// cv.sdotusp.sc.h
//===----------------------------------------------------------------------===//

cv.sdotusp.sc.h t0, t1, t2
# CHECK-INSTR: cv.sdotusp.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0xa0]

cv.sdotusp.sc.h a0, a1, a2
# CHECK-INSTR: cv.sdotusp.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0xa0]

cv.sdotusp.sc.h s0, s1, s2
# CHECK-INSTR: cv.sdotusp.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0xa1]

//===----------------------------------------------------------------------===//
// cv.sdotusp.sc.b
//===----------------------------------------------------------------------===//

cv.sdotusp.sc.b t0, t1, t2
# CHECK-INSTR: cv.sdotusp.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0xa0]

cv.sdotusp.sc.b a0, a1, a2
# CHECK-INSTR: cv.sdotusp.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0xa0]

cv.sdotusp.sc.b s0, s1, s2
# CHECK-INSTR: cv.sdotusp.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0xa1]

//===----------------------------------------------------------------------===//
// cv.sdotusp.sci.h
//===----------------------------------------------------------------------===//

cv.sdotusp.sci.h t0, t1, -32
# CHECK-INSTR: cv.sdotusp.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0xa1]

cv.sdotusp.sci.h a0, a1, 7
# CHECK-INSTR: cv.sdotusp.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0xa2]

cv.sdotusp.sci.h s0, s1, -1
# CHECK-INSTR: cv.sdotusp.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0xa3]

//===----------------------------------------------------------------------===//
// cv.sdotusp.sci.b
//===----------------------------------------------------------------------===//

cv.sdotusp.sci.b t0, t1, -32
# CHECK-INSTR: cv.sdotusp.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0xa1]

cv.sdotusp.sci.b a0, a1, 7
# CHECK-INSTR: cv.sdotusp.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0xa2]

cv.sdotusp.sci.b s0, s1, -1
# CHECK-INSTR: cv.sdotusp.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0xa3]

