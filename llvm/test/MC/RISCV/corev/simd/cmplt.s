# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.cmplt.h
//===----------------------------------------------------------------------===//

cv.cmplt.h t0, t1, t2
# CHECK-INSTR: cv.cmplt.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x24]

cv.cmplt.h a0, a1, a2
# CHECK-INSTR: cv.cmplt.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x24]

cv.cmplt.h s0, s1, s2
# CHECK-INSTR: cv.cmplt.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x25]

//===----------------------------------------------------------------------===//
// cv.cmplt.b
//===----------------------------------------------------------------------===//

cv.cmplt.b t0, t1, t2
# CHECK-INSTR: cv.cmplt.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x24]

cv.cmplt.b a0, a1, a2
# CHECK-INSTR: cv.cmplt.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x24]

cv.cmplt.b s0, s1, s2
# CHECK-INSTR: cv.cmplt.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x25]

//===----------------------------------------------------------------------===//
// cv.cmplt.sc.h
//===----------------------------------------------------------------------===//

cv.cmplt.sc.h t0, t1, t2
# CHECK-INSTR: cv.cmplt.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x24]

cv.cmplt.sc.h a0, a1, a2
# CHECK-INSTR: cv.cmplt.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x24]

cv.cmplt.sc.h s0, s1, s2
# CHECK-INSTR: cv.cmplt.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x25]

//===----------------------------------------------------------------------===//
// cv.cmplt.sc.b
//===----------------------------------------------------------------------===//

cv.cmplt.sc.b t0, t1, t2
# CHECK-INSTR: cv.cmplt.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x24]

cv.cmplt.sc.b a0, a1, a2
# CHECK-INSTR: cv.cmplt.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x24]

cv.cmplt.sc.b s0, s1, s2
# CHECK-INSTR: cv.cmplt.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x25]

//===----------------------------------------------------------------------===//
// cv.cmplt.sci.h
//===----------------------------------------------------------------------===//

cv.cmplt.sci.h t0, t1, -32
# CHECK-INSTR: cv.cmplt.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x25]

cv.cmplt.sci.h a0, a1, 7
# CHECK-INSTR: cv.cmplt.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x26]

cv.cmplt.sci.h s0, s1, -1
# CHECK-INSTR: cv.cmplt.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x27]

//===----------------------------------------------------------------------===//
// cv.cmplt.sci.b
//===----------------------------------------------------------------------===//

cv.cmplt.sci.b t0, t1, -32
# CHECK-INSTR: cv.cmplt.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x25]

cv.cmplt.sci.b a0, a1, 7
# CHECK-INSTR: cv.cmplt.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x26]

cv.cmplt.sci.b s0, s1, -1
# CHECK-INSTR: cv.cmplt.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x27]

