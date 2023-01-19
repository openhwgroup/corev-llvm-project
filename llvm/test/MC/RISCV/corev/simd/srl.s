# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.srl.h
//===----------------------------------------------------------------------===//

cv.srl.h t0, t1, t2
# CHECK-INSTR: cv.srl.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x40]

cv.srl.h a0, a1, a2
# CHECK-INSTR: cv.srl.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x40]

cv.srl.h s0, s1, s2
# CHECK-INSTR: cv.srl.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x41]

//===----------------------------------------------------------------------===//
// cv.srl.b
//===----------------------------------------------------------------------===//

cv.srl.b t0, t1, t2
# CHECK-INSTR: cv.srl.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x40]

cv.srl.b a0, a1, a2
# CHECK-INSTR: cv.srl.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x40]

cv.srl.b s0, s1, s2
# CHECK-INSTR: cv.srl.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x41]

//===----------------------------------------------------------------------===//
// cv.srl.sc.h
//===----------------------------------------------------------------------===//

cv.srl.sc.h t0, t1, t2
# CHECK-INSTR: cv.srl.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x40]

cv.srl.sc.h a0, a1, a2
# CHECK-INSTR: cv.srl.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x40]

cv.srl.sc.h s0, s1, s2
# CHECK-INSTR: cv.srl.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x41]

//===----------------------------------------------------------------------===//
// cv.srl.sc.b
//===----------------------------------------------------------------------===//

cv.srl.sc.b t0, t1, t2
# CHECK-INSTR: cv.srl.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x40]

cv.srl.sc.b a0, a1, a2
# CHECK-INSTR: cv.srl.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x40]

cv.srl.sc.b s0, s1, s2
# CHECK-INSTR: cv.srl.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x41]

//===----------------------------------------------------------------------===//
// cv.srl.sci.h
//===----------------------------------------------------------------------===//

cv.srl.sci.h t0, t1, -32
# CHECK-INSTR: cv.srl.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x41]

cv.srl.sci.h a0, a1, 7
# CHECK-INSTR: cv.srl.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x42]

cv.srl.sci.h s0, s1, -1
# CHECK-INSTR: cv.srl.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x43]

//===----------------------------------------------------------------------===//
// cv.srl.sci.b
//===----------------------------------------------------------------------===//

cv.srl.sci.b t0, t1, -32
# CHECK-INSTR: cv.srl.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x41]

cv.srl.sci.b a0, a1, 7
# CHECK-INSTR: cv.srl.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x42]

cv.srl.sci.b s0, s1, -1
# CHECK-INSTR: cv.srl.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x43]

