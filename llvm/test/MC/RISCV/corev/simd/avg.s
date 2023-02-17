# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.avg.h
//===----------------------------------------------------------------------===//

cv.avg.h t0, t1, t2
# CHECK-INSTR: cv.avg.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x10]

cv.avg.h a0, a1, a2
# CHECK-INSTR: cv.avg.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x10]

cv.avg.h s0, s1, s2
# CHECK-INSTR: cv.avg.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x11]

//===----------------------------------------------------------------------===//
// cv.avg.b
//===----------------------------------------------------------------------===//

cv.avg.b t0, t1, t2
# CHECK-INSTR: cv.avg.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x10]

cv.avg.b a0, a1, a2
# CHECK-INSTR: cv.avg.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x10]

cv.avg.b s0, s1, s2
# CHECK-INSTR: cv.avg.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x11]

//===----------------------------------------------------------------------===//
// cv.avg.sc.h
//===----------------------------------------------------------------------===//

cv.avg.sc.h t0, t1, t2
# CHECK-INSTR: cv.avg.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x10]

cv.avg.sc.h a0, a1, a2
# CHECK-INSTR: cv.avg.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x10]

cv.avg.sc.h s0, s1, s2
# CHECK-INSTR: cv.avg.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x11]

//===----------------------------------------------------------------------===//
// cv.avg.sc.b
//===----------------------------------------------------------------------===//

cv.avg.sc.b t0, t1, t2
# CHECK-INSTR: cv.avg.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x10]

cv.avg.sc.b a0, a1, a2
# CHECK-INSTR: cv.avg.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x10]

cv.avg.sc.b s0, s1, s2
# CHECK-INSTR: cv.avg.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x11]

//===----------------------------------------------------------------------===//
// cv.avg.sci.h
//===----------------------------------------------------------------------===//

cv.avg.sci.h t0, t1, -32
# CHECK-INSTR: cv.avg.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x11]

cv.avg.sci.h a0, a1, 7
# CHECK-INSTR: cv.avg.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x12]

cv.avg.sci.h s0, s1, -1
# CHECK-INSTR: cv.avg.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x13]

//===----------------------------------------------------------------------===//
// cv.avg.sci.b
//===----------------------------------------------------------------------===//

cv.avg.sci.b t0, t1, -32
# CHECK-INSTR: cv.avg.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x11]

cv.avg.sci.b a0, a1, 7
# CHECK-INSTR: cv.avg.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x12]

cv.avg.sci.b s0, s1, -1
# CHECK-INSTR: cv.avg.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x13]

