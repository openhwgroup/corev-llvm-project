# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.packhi.b
//===----------------------------------------------------------------------===//

cv.packhi.b t0, t1, t2
# CHECK-INSTR: cv.packhi.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0xfa]

cv.packhi.b a0, a1, a2
# CHECK-INSTR: cv.packhi.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0xfa]

cv.packhi.b s0, s1, s2
# CHECK-INSTR: cv.packhi.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0xfb]

//===----------------------------------------------------------------------===//
// cv.packlo.b
//===----------------------------------------------------------------------===//

cv.packlo.b t0, t1, t2
# CHECK-INSTR: cv.packlo.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0xf8]

cv.packlo.b a0, a1, a2
# CHECK-INSTR: cv.packlo.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0xf8]

cv.packlo.b s0, s1, s2
# CHECK-INSTR: cv.packlo.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0xf9]

