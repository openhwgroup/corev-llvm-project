# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.cmpne.h
//===----------------------------------------------------------------------===//

cv.cmpne.h t0, t1, t2
# CHECK-INSTR: cv.cmpne.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x0c]

cv.cmpne.h a0, a1, a2
# CHECK-INSTR: cv.cmpne.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x0c]

cv.cmpne.h s0, s1, s2
# CHECK-INSTR: cv.cmpne.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x0d]

//===----------------------------------------------------------------------===//
// cv.cmpne.b
//===----------------------------------------------------------------------===//

cv.cmpne.b t0, t1, t2
# CHECK-INSTR: cv.cmpne.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x0c]

cv.cmpne.b a0, a1, a2
# CHECK-INSTR: cv.cmpne.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x0c]

cv.cmpne.b s0, s1, s2
# CHECK-INSTR: cv.cmpne.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x0d]

//===----------------------------------------------------------------------===//
// cv.cmpne.sc.h
//===----------------------------------------------------------------------===//

cv.cmpne.sc.h t0, t1, t2
# CHECK-INSTR: cv.cmpne.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x0c]

cv.cmpne.sc.h a0, a1, a2
# CHECK-INSTR: cv.cmpne.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x0c]

cv.cmpne.sc.h s0, s1, s2
# CHECK-INSTR: cv.cmpne.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x0d]

//===----------------------------------------------------------------------===//
// cv.cmpne.sc.b
//===----------------------------------------------------------------------===//

cv.cmpne.sc.b t0, t1, t2
# CHECK-INSTR: cv.cmpne.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x0c]

cv.cmpne.sc.b a0, a1, a2
# CHECK-INSTR: cv.cmpne.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x0c]

cv.cmpne.sc.b s0, s1, s2
# CHECK-INSTR: cv.cmpne.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x0d]

//===----------------------------------------------------------------------===//
// cv.cmpne.sci.h
//===----------------------------------------------------------------------===//

cv.cmpne.sci.h t0, t1, -32
# CHECK-INSTR: cv.cmpne.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x0d]

cv.cmpne.sci.h a0, a1, 7
# CHECK-INSTR: cv.cmpne.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x0e]

cv.cmpne.sci.h s0, s1, -1
# CHECK-INSTR: cv.cmpne.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x0f]

//===----------------------------------------------------------------------===//
// cv.cmpne.sci.b
//===----------------------------------------------------------------------===//

cv.cmpne.sci.b t0, t1, -32
# CHECK-INSTR: cv.cmpne.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x0d]

cv.cmpne.sci.b a0, a1, 7
# CHECK-INSTR: cv.cmpne.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x0e]

cv.cmpne.sci.b s0, s1, -1
# CHECK-INSTR: cv.cmpne.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x0f]

