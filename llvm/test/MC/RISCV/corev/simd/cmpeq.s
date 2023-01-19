# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.cmpeq.h
//===----------------------------------------------------------------------===//

cv.cmpeq.h t0, t1, t2
# CHECK-INSTR: cv.cmpeq.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x04]

cv.cmpeq.h a0, a1, a2
# CHECK-INSTR: cv.cmpeq.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x04]

cv.cmpeq.h s0, s1, s2
# CHECK-INSTR: cv.cmpeq.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x05]

//===----------------------------------------------------------------------===//
// cv.cmpeq.b
//===----------------------------------------------------------------------===//

cv.cmpeq.b t0, t1, t2
# CHECK-INSTR: cv.cmpeq.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x04]

cv.cmpeq.b a0, a1, a2
# CHECK-INSTR: cv.cmpeq.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x04]

cv.cmpeq.b s0, s1, s2
# CHECK-INSTR: cv.cmpeq.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x05]

//===----------------------------------------------------------------------===//
// cv.cmpeq.sc.h
//===----------------------------------------------------------------------===//

cv.cmpeq.sc.h t0, t1, t2
# CHECK-INSTR: cv.cmpeq.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x04]

cv.cmpeq.sc.h a0, a1, a2
# CHECK-INSTR: cv.cmpeq.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x04]

cv.cmpeq.sc.h s0, s1, s2
# CHECK-INSTR: cv.cmpeq.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x05]

//===----------------------------------------------------------------------===//
// cv.cmpeq.sc.b
//===----------------------------------------------------------------------===//

cv.cmpeq.sc.b t0, t1, t2
# CHECK-INSTR: cv.cmpeq.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x04]

cv.cmpeq.sc.b a0, a1, a2
# CHECK-INSTR: cv.cmpeq.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x04]

cv.cmpeq.sc.b s0, s1, s2
# CHECK-INSTR: cv.cmpeq.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x05]

//===----------------------------------------------------------------------===//
// cv.cmpeq.sci.h
//===----------------------------------------------------------------------===//

cv.cmpeq.sci.h t0, t1, -32
# CHECK-INSTR: cv.cmpeq.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x05]

cv.cmpeq.sci.h a0, a1, 7
# CHECK-INSTR: cv.cmpeq.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x06]

cv.cmpeq.sci.h s0, s1, -1
# CHECK-INSTR: cv.cmpeq.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x07]

//===----------------------------------------------------------------------===//
// cv.cmpeq.sci.b
//===----------------------------------------------------------------------===//

cv.cmpeq.sci.b t0, t1, -32
# CHECK-INSTR: cv.cmpeq.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x05]

cv.cmpeq.sci.b a0, a1, 7
# CHECK-INSTR: cv.cmpeq.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x06]

cv.cmpeq.sci.b s0, s1, -1
# CHECK-INSTR: cv.cmpeq.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x07]

