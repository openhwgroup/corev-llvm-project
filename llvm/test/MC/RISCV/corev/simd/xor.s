# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.xor.h
//===----------------------------------------------------------------------===//

cv.xor.h t0, t1, t2
# CHECK-INSTR: cv.xor.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x60]

cv.xor.h t3, t4, t5
# CHECK-INSTR: cv.xor.h t3, t4, t5
# CHECK-ENCODING: [0x7b,0x8e,0xee,0x61]

cv.xor.h a0, a1, a2
# CHECK-INSTR: cv.xor.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x60]

cv.xor.h s0, s1, s2
# CHECK-INSTR: cv.xor.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x61]

//===----------------------------------------------------------------------===//
// cv.xor.b
//===----------------------------------------------------------------------===//

cv.xor.b t0, t1, t2
# CHECK-INSTR: cv.xor.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x60]

cv.xor.b t3, t4, t5
# CHECK-INSTR: cv.xor.b t3, t4, t5
# CHECK-ENCODING: [0x7b,0x9e,0xee,0x61]

cv.xor.b a0, a1, a2
# CHECK-INSTR: cv.xor.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x60]

cv.xor.b s0, s1, s2
# CHECK-INSTR: cv.xor.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x61]

//===----------------------------------------------------------------------===//
// cv.xor.sc.h
//===----------------------------------------------------------------------===//

cv.xor.sc.h t0, t1, t2
# CHECK-INSTR: cv.xor.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x60]

cv.xor.sc.h t3, t4, t5
# CHECK-INSTR: cv.xor.sc.h t3, t4, t5
# CHECK-ENCODING: [0x7b,0xce,0xee,0x61]

cv.xor.sc.h a0, a1, a2
# CHECK-INSTR: cv.xor.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x60]

cv.xor.sc.h s0, s1, s2
# CHECK-INSTR: cv.xor.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x61]

//===----------------------------------------------------------------------===//
// cv.xor.sc.b
//===----------------------------------------------------------------------===//

cv.xor.sc.b t0, t1, t2
# CHECK-INSTR: cv.xor.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x60]

cv.xor.sc.b t3, t4, t5
# CHECK-INSTR: cv.xor.sc.b t3, t4, t5
# CHECK-ENCODING: [0x7b,0xde,0xee,0x61]

cv.xor.sc.b a0, a1, a2
# CHECK-INSTR: cv.xor.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x60]

cv.xor.sc.b s0, s1, s2
# CHECK-INSTR: cv.xor.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x61]

//===----------------------------------------------------------------------===//
// cv.xor.sci.h
//===----------------------------------------------------------------------===//

cv.xor.sci.h t0, t1, 0
# CHECK-INSTR: cv.xor.sci.h t0, t1, 0
# CHECK-ENCODING: [0xfb,0x62,0x03,0x60]

cv.xor.sci.h t3, t4, 32
# CHECK-INSTR: cv.xor.sci.h t3, t4, 32
# CHECK-ENCODING: [0x7b,0xee,0x0e,0x61]

cv.xor.sci.h a0, a1, 7
# CHECK-INSTR: cv.xor.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x62]

cv.xor.sci.h s0, s1, 63
# CHECK-INSTR: cv.xor.sci.h s0, s1, 63
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x63]

//===----------------------------------------------------------------------===//
// cv.xor.sci.b
//===----------------------------------------------------------------------===//

cv.xor.sci.b t0, t1, 0
# CHECK-INSTR: cv.xor.sci.b t0, t1, 0
# CHECK-ENCODING: [0xfb,0x72,0x03,0x60]

cv.xor.sci.b t3, t4, 32
# CHECK-INSTR: cv.xor.sci.b t3, t4, 32
# CHECK-ENCODING: [0x7b,0xfe,0x0e,0x61]

cv.xor.sci.b a0, a1, 7
# CHECK-INSTR: cv.xor.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x62]

cv.xor.sci.b s0, s1, 63
# CHECK-INSTR: cv.xor.sci.b s0, s1, 63
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x63]

