# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.sdotup.h
//===----------------------------------------------------------------------===//

cv.sdotup.h t0, t1, t2
# CHECK-INSTR: cv.sdotup.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x98]

cv.sdotup.h a0, a1, a2
# CHECK-INSTR: cv.sdotup.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x98]

cv.sdotup.h s0, s1, s2
# CHECK-INSTR: cv.sdotup.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x99]

//===----------------------------------------------------------------------===//
// cv.sdotup.b
//===----------------------------------------------------------------------===//

cv.sdotup.b t0, t1, t2
# CHECK-INSTR: cv.sdotup.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x98]

cv.sdotup.b a0, a1, a2
# CHECK-INSTR: cv.sdotup.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x98]

cv.sdotup.b s0, s1, s2
# CHECK-INSTR: cv.sdotup.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x99]

//===----------------------------------------------------------------------===//
// cv.sdotup.sc.h
//===----------------------------------------------------------------------===//

cv.sdotup.sc.h t0, t1, t2
# CHECK-INSTR: cv.sdotup.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x98]

cv.sdotup.sc.h a0, a1, a2
# CHECK-INSTR: cv.sdotup.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x98]

cv.sdotup.sc.h s0, s1, s2
# CHECK-INSTR: cv.sdotup.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x99]

//===----------------------------------------------------------------------===//
// cv.sdotup.sc.b
//===----------------------------------------------------------------------===//

cv.sdotup.sc.b t0, t1, t2
# CHECK-INSTR: cv.sdotup.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x98]

cv.sdotup.sc.b a0, a1, a2
# CHECK-INSTR: cv.sdotup.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x98]

cv.sdotup.sc.b s0, s1, s2
# CHECK-INSTR: cv.sdotup.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x99]

//===----------------------------------------------------------------------===//
// cv.sdotup.sci.h
//===----------------------------------------------------------------------===//

cv.sdotup.sci.h t0, t1, -32
# CHECK-INSTR: cv.sdotup.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x99]

cv.sdotup.sci.h a0, a1, 7
# CHECK-INSTR: cv.sdotup.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x9a]

cv.sdotup.sci.h s0, s1, -1
# CHECK-INSTR: cv.sdotup.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x9b]

//===----------------------------------------------------------------------===//
// cv.sdotup.sci.b
//===----------------------------------------------------------------------===//

cv.sdotup.sci.b t0, t1, -32
# CHECK-INSTR: cv.sdotup.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x99]

cv.sdotup.sci.b a0, a1, 7
# CHECK-INSTR: cv.sdotup.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x9a]

cv.sdotup.sci.b s0, s1, -1
# CHECK-INSTR: cv.sdotup.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x9b]

