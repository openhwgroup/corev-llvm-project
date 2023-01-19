# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.sub.h
//===----------------------------------------------------------------------===//

cv.sub.h t0, t1, t2
# CHECK-INSTR: cv.sub.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x08]

cv.sub.h a0, a1, a2
# CHECK-INSTR: cv.sub.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x08]

cv.sub.h s0, s1, s2
# CHECK-INSTR: cv.sub.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x09]

//===----------------------------------------------------------------------===//
// cv.sub.b
//===----------------------------------------------------------------------===//

cv.sub.b t0, t1, t2
# CHECK-INSTR: cv.sub.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x08]

cv.sub.b a0, a1, a2
# CHECK-INSTR: cv.sub.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x08]

cv.sub.b s0, s1, s2
# CHECK-INSTR: cv.sub.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x09]

//===----------------------------------------------------------------------===//
// cv.sub.sc.h
//===----------------------------------------------------------------------===//

cv.sub.sc.h t0, t1, t2
# CHECK-INSTR: cv.sub.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x08]

cv.sub.sc.h a0, a1, a2
# CHECK-INSTR: cv.sub.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x08]

cv.sub.sc.h s0, s1, s2
# CHECK-INSTR: cv.sub.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x09]

//===----------------------------------------------------------------------===//
// cv.sub.sc.b
//===----------------------------------------------------------------------===//

cv.sub.sc.b t0, t1, t2
# CHECK-INSTR: cv.sub.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x08]

cv.sub.sc.b a0, a1, a2
# CHECK-INSTR: cv.sub.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x08]

cv.sub.sc.b s0, s1, s2
# CHECK-INSTR: cv.sub.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x09]

//===----------------------------------------------------------------------===//
// cv.sub.sci.h
//===----------------------------------------------------------------------===//

cv.sub.sci.h t0, t1, -32
# CHECK-INSTR: cv.sub.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x09]

cv.sub.sci.h a0, a1, 7
# CHECK-INSTR: cv.sub.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x0a]

cv.sub.sci.h s0, s1, -1
# CHECK-INSTR: cv.sub.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x0b]

//===----------------------------------------------------------------------===//
// cv.sub.sci.b
//===----------------------------------------------------------------------===//

cv.sub.sci.b t0, t1, -32
# CHECK-INSTR: cv.sub.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x09]

cv.sub.sci.b a0, a1, 7
# CHECK-INSTR: cv.sub.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x0a]

cv.sub.sci.b s0, s1, -1
# CHECK-INSTR: cv.sub.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x0b]

//===----------------------------------------------------------------------===//
// cv.sub.div2
//===----------------------------------------------------------------------===//

cv.sub.div2 t0, t1, t2
# CHECK-INSTR: cv.sub.div2 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x22,0x73,0x74]

cv.sub.div2 a0, a1, a2
# CHECK-INSTR: cv.sub.div2 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xa5,0xc5,0x74]

cv.sub.div2 s0, s1, s2
# CHECK-INSTR: cv.sub.div2 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xa4,0x24,0x75]

//===----------------------------------------------------------------------===//
// cv.sub.div4
//===----------------------------------------------------------------------===//

cv.sub.div4 t0, t1, t2
# CHECK-INSTR: cv.sub.div4 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x74]

cv.sub.div4 a0, a1, a2
# CHECK-INSTR: cv.sub.div4 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x74]

cv.sub.div4 s0, s1, s2
# CHECK-INSTR: cv.sub.div4 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x75]

//===----------------------------------------------------------------------===//
// cv.sub.div8
//===----------------------------------------------------------------------===//

cv.sub.div8 t0, t1, t2
# CHECK-INSTR: cv.sub.div8 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x62,0x73,0x74]

cv.sub.div8 a0, a1, a2
# CHECK-INSTR: cv.sub.div8 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xe5,0xc5,0x74]

cv.sub.div8 s0, s1, s2
# CHECK-INSTR: cv.sub.div8 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xe4,0x24,0x75]

