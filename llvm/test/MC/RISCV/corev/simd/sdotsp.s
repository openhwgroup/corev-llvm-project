# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.sdotsp.h
//===----------------------------------------------------------------------===//

cv.sdotsp.h t0, t1, t2
# CHECK-INSTR: cv.sdotsp.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0xa8]

cv.sdotsp.h a0, a1, a2
# CHECK-INSTR: cv.sdotsp.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0xa8]

cv.sdotsp.h s0, s1, s2
# CHECK-INSTR: cv.sdotsp.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0xa9]

//===----------------------------------------------------------------------===//
// cv.sdotsp.b
//===----------------------------------------------------------------------===//

cv.sdotsp.b t0, t1, t2
# CHECK-INSTR: cv.sdotsp.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0xa8]

cv.sdotsp.b a0, a1, a2
# CHECK-INSTR: cv.sdotsp.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0xa8]

cv.sdotsp.b s0, s1, s2
# CHECK-INSTR: cv.sdotsp.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0xa9]

//===----------------------------------------------------------------------===//
// cv.sdotsp.sc.h
//===----------------------------------------------------------------------===//

cv.sdotsp.sc.h t0, t1, t2
# CHECK-INSTR: cv.sdotsp.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0xa8]

cv.sdotsp.sc.h a0, a1, a2
# CHECK-INSTR: cv.sdotsp.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0xa8]

cv.sdotsp.sc.h s0, s1, s2
# CHECK-INSTR: cv.sdotsp.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0xa9]

//===----------------------------------------------------------------------===//
// cv.sdotsp.sc.b
//===----------------------------------------------------------------------===//

cv.sdotsp.sc.b t0, t1, t2
# CHECK-INSTR: cv.sdotsp.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0xa8]

cv.sdotsp.sc.b a0, a1, a2
# CHECK-INSTR: cv.sdotsp.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0xa8]

cv.sdotsp.sc.b s0, s1, s2
# CHECK-INSTR: cv.sdotsp.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0xa9]

//===----------------------------------------------------------------------===//
// cv.sdotsp.sci.h
//===----------------------------------------------------------------------===//

cv.sdotsp.sci.h t0, t1, -32
# CHECK-INSTR: cv.sdotsp.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0xa9]

cv.sdotsp.sci.h a0, a1, 7
# CHECK-INSTR: cv.sdotsp.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0xaa]

cv.sdotsp.sci.h s0, s1, -1
# CHECK-INSTR: cv.sdotsp.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0xab]

//===----------------------------------------------------------------------===//
// cv.sdotsp.sci.b
//===----------------------------------------------------------------------===//

cv.sdotsp.sci.b t0, t1, -32
# CHECK-INSTR: cv.sdotsp.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0xa9]

cv.sdotsp.sci.b a0, a1, 7
# CHECK-INSTR: cv.sdotsp.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0xaa]

cv.sdotsp.sci.b s0, s1, -1
# CHECK-INSTR: cv.sdotsp.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0xab]

