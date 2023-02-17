# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.add.h
//===----------------------------------------------------------------------===//

cv.add.h t0, t1, t2
# CHECK-INSTR: cv.add.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x00]

cv.add.h a0, a1, a2
# CHECK-INSTR: cv.add.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x00]

cv.add.h s0, s1, s2
# CHECK-INSTR: cv.add.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x01]

//===----------------------------------------------------------------------===//
// cv.add.b
//===----------------------------------------------------------------------===//

cv.add.b t0, t1, t2
# CHECK-INSTR: cv.add.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x00]

cv.add.b a0, a1, a2
# CHECK-INSTR: cv.add.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x00]

cv.add.b s0, s1, s2
# CHECK-INSTR: cv.add.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x01]

//===----------------------------------------------------------------------===//
// cv.add.sc.h
//===----------------------------------------------------------------------===//

cv.add.sc.h t0, t1, t2
# CHECK-INSTR: cv.add.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x00]

cv.add.sc.h a0, a1, a2
# CHECK-INSTR: cv.add.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x00]

cv.add.sc.h s0, s1, s2
# CHECK-INSTR: cv.add.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x01]

//===----------------------------------------------------------------------===//
// cv.add.sc.b
//===----------------------------------------------------------------------===//

cv.add.sc.b t0, t1, t2
# CHECK-INSTR: cv.add.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x00]

cv.add.sc.b a0, a1, a2
# CHECK-INSTR: cv.add.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x00]

cv.add.sc.b s0, s1, s2
# CHECK-INSTR: cv.add.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x01]

//===----------------------------------------------------------------------===//
// cv.add.sci.h
//===----------------------------------------------------------------------===//

cv.add.sci.h t0, t1, -32
# CHECK-INSTR: cv.add.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x01]

cv.add.sci.h a0, a1, 7
# CHECK-INSTR: cv.add.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x02]

cv.add.sci.h s0, s1, -1
# CHECK-INSTR: cv.add.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x03]

//===----------------------------------------------------------------------===//
// cv.add.sci.b
//===----------------------------------------------------------------------===//

cv.add.sci.b t0, t1, -32
# CHECK-INSTR: cv.add.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x01]

cv.add.sci.b a0, a1, 7
# CHECK-INSTR: cv.add.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x02]

cv.add.sci.b s0, s1, -1
# CHECK-INSTR: cv.add.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x03]

//===----------------------------------------------------------------------===//
// cv.add.div2
//===----------------------------------------------------------------------===//

cv.add.div2 t0, t1, t2
# CHECK-INSTR: cv.add.div2 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x22,0x73,0x6c]

cv.add.div2 a0, a1, a2
# CHECK-INSTR: cv.add.div2 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xa5,0xc5,0x6c]

cv.add.div2 s0, s1, s2
# CHECK-INSTR: cv.add.div2 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xa4,0x24,0x6d]

//===----------------------------------------------------------------------===//
// cv.add.div4
//===----------------------------------------------------------------------===//

cv.add.div4 t0, t1, t2
# CHECK-INSTR: cv.add.div4 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x6c]

cv.add.div4 a0, a1, a2
# CHECK-INSTR: cv.add.div4 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x6c]

cv.add.div4 s0, s1, s2
# CHECK-INSTR: cv.add.div4 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x6d]

//===----------------------------------------------------------------------===//
// cv.add.div8
//===----------------------------------------------------------------------===//

cv.add.div8 t0, t1, t2
# CHECK-INSTR: cv.add.div8 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x62,0x73,0x6c]

cv.add.div8 a0, a1, a2
# CHECK-INSTR: cv.add.div8 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xe5,0xc5,0x6c]

cv.add.div8 s0, s1, s2
# CHECK-INSTR: cv.add.div8 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xe4,0x24,0x6d]

