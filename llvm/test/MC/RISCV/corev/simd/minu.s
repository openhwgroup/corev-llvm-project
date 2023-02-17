# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.minu.h
//===----------------------------------------------------------------------===//

cv.minu.h t0, t1, t2
# CHECK-INSTR: cv.minu.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x28]

cv.minu.h a0, a1, a2
# CHECK-INSTR: cv.minu.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x28]

cv.minu.h s0, s1, s2
# CHECK-INSTR: cv.minu.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x29]

//===----------------------------------------------------------------------===//
// cv.minu.b
//===----------------------------------------------------------------------===//

cv.minu.b t0, t1, t2
# CHECK-INSTR: cv.minu.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x28]

cv.minu.b a0, a1, a2
# CHECK-INSTR: cv.minu.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x28]

cv.minu.b s0, s1, s2
# CHECK-INSTR: cv.minu.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x29]

//===----------------------------------------------------------------------===//
// cv.minu.sc.h
//===----------------------------------------------------------------------===//

cv.minu.sc.h t0, t1, t2
# CHECK-INSTR: cv.minu.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x28]

cv.minu.sc.h a0, a1, a2
# CHECK-INSTR: cv.minu.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x28]

cv.minu.sc.h s0, s1, s2
# CHECK-INSTR: cv.minu.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x29]

//===----------------------------------------------------------------------===//
// cv.minu.sc.b
//===----------------------------------------------------------------------===//

cv.minu.sc.b t0, t1, t2
# CHECK-INSTR: cv.minu.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x28]

cv.minu.sc.b a0, a1, a2
# CHECK-INSTR: cv.minu.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x28]

cv.minu.sc.b s0, s1, s2
# CHECK-INSTR: cv.minu.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x29]

//===----------------------------------------------------------------------===//
// cv.minu.sci.h
//===----------------------------------------------------------------------===//

cv.minu.sci.h t0, t1, -32
# CHECK-INSTR: cv.minu.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x29]

cv.minu.sci.h a0, a1, 7
# CHECK-INSTR: cv.minu.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x2a]

cv.minu.sci.h s0, s1, -1
# CHECK-INSTR: cv.minu.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x2b]

//===----------------------------------------------------------------------===//
// cv.minu.sci.b
//===----------------------------------------------------------------------===//

cv.minu.sci.b t0, t1, -32
# CHECK-INSTR: cv.minu.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x29]

cv.minu.sci.b a0, a1, 7
# CHECK-INSTR: cv.minu.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x2a]

cv.minu.sci.b s0, s1, -1
# CHECK-INSTR: cv.minu.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x2b]

