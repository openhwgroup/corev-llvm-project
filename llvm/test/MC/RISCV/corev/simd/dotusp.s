# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.dotusp.h
//===----------------------------------------------------------------------===//

cv.dotusp.h t0, t1, t2
# CHECK-INSTR: cv.dotusp.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x88]

cv.dotusp.h a0, a1, a2
# CHECK-INSTR: cv.dotusp.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x88]

cv.dotusp.h s0, s1, s2
# CHECK-INSTR: cv.dotusp.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x89]

//===----------------------------------------------------------------------===//
// cv.dotusp.b
//===----------------------------------------------------------------------===//

cv.dotusp.b t0, t1, t2
# CHECK-INSTR: cv.dotusp.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x88]

cv.dotusp.b a0, a1, a2
# CHECK-INSTR: cv.dotusp.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x88]

cv.dotusp.b s0, s1, s2
# CHECK-INSTR: cv.dotusp.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x89]

//===----------------------------------------------------------------------===//
// cv.dotusp.sc.h
//===----------------------------------------------------------------------===//

cv.dotusp.sc.h t0, t1, t2
# CHECK-INSTR: cv.dotusp.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x88]

cv.dotusp.sc.h a0, a1, a2
# CHECK-INSTR: cv.dotusp.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x88]

cv.dotusp.sc.h s0, s1, s2
# CHECK-INSTR: cv.dotusp.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x89]

//===----------------------------------------------------------------------===//
// cv.dotusp.sc.b
//===----------------------------------------------------------------------===//

cv.dotusp.sc.b t0, t1, t2
# CHECK-INSTR: cv.dotusp.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x88]

cv.dotusp.sc.b a0, a1, a2
# CHECK-INSTR: cv.dotusp.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x88]

cv.dotusp.sc.b s0, s1, s2
# CHECK-INSTR: cv.dotusp.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x89]

//===----------------------------------------------------------------------===//
// cv.dotusp.sci.h
//===----------------------------------------------------------------------===//

cv.dotusp.sci.h t0, t1, -32
# CHECK-INSTR: cv.dotusp.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x89]

cv.dotusp.sci.h a0, a1, 7
# CHECK-INSTR: cv.dotusp.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x8a]

cv.dotusp.sci.h s0, s1, -1
# CHECK-INSTR: cv.dotusp.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x8b]

//===----------------------------------------------------------------------===//
// cv.dotusp.sci.b
//===----------------------------------------------------------------------===//

cv.dotusp.sci.b t0, t1, -32
# CHECK-INSTR: cv.dotusp.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x89]

cv.dotusp.sci.b a0, a1, 7
# CHECK-INSTR: cv.dotusp.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x8a]

cv.dotusp.sci.b s0, s1, -1
# CHECK-INSTR: cv.dotusp.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x8b]

