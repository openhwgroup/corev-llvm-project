# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.shuffle.h
//===----------------------------------------------------------------------===//

cv.shuffle.h t0, t1, t2
# CHECK-INSTR: cv.shuffle.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0xc0]

cv.shuffle.h a0, a1, a2
# CHECK-INSTR: cv.shuffle.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0xc0]

cv.shuffle.h s0, s1, s2
# CHECK-INSTR: cv.shuffle.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0xc1]

//===----------------------------------------------------------------------===//
// cv.shuffle.b
//===----------------------------------------------------------------------===//

cv.shuffle.b t0, t1, t2
# CHECK-INSTR: cv.shuffle.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0xc0]

cv.shuffle.b a0, a1, a2
# CHECK-INSTR: cv.shuffle.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0xc0]

cv.shuffle.b s0, s1, s2
# CHECK-INSTR: cv.shuffle.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0xc1]

//===----------------------------------------------------------------------===//
// cv.shuffle.sci.h
//===----------------------------------------------------------------------===//

cv.shuffle.sci.h t0, t1, -32
# CHECK-INSTR: cv.shuffle.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0xc1]

cv.shuffle.sci.h a0, a1, 7
# CHECK-INSTR: cv.shuffle.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0xc2]

cv.shuffle.sci.h s0, s1, -1
# CHECK-INSTR: cv.shuffle.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0xc3]

