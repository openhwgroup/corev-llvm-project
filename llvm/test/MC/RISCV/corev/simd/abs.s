# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.abs.h
//===----------------------------------------------------------------------===//

cv.abs.h t0, t1
# CHECK-INSTR: cv.abs.h t0, t1
# CHECK-ENCODING: [0xfb,0x02,0x03,0x70]

cv.abs.h a0, a1
# CHECK-INSTR: cv.abs.h a0, a1
# CHECK-ENCODING: [0x7b,0x85,0x05,0x70]

cv.abs.h s0, s1
# CHECK-INSTR: cv.abs.h s0, s1
# CHECK-ENCODING: [0x7b,0x84,0x04,0x70]

//===----------------------------------------------------------------------===//
// cv.abs.b
//===----------------------------------------------------------------------===//

cv.abs.b t0, t1
# CHECK-INSTR: cv.abs.b t0, t1
# CHECK-ENCODING: [0xfb,0x12,0x03,0x70]

cv.abs.b a0, a1
# CHECK-INSTR: cv.abs.b a0, a1
# CHECK-ENCODING: [0x7b,0x95,0x05,0x70]

cv.abs.b s0, s1
# CHECK-INSTR: cv.abs.b s0, s1
# CHECK-ENCODING: [0x7b,0x94,0x04,0x70]

