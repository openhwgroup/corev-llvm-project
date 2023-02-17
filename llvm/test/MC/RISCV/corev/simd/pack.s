# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.pack
//===----------------------------------------------------------------------===//

cv.pack t0, t1, t2
# CHECK-INSTR: cv.pack t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0xf0]

cv.pack a0, a1, a2
# CHECK-INSTR: cv.pack a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0xf0]

cv.pack s0, s1, s2
# CHECK-INSTR: cv.pack s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0xf1]

//===----------------------------------------------------------------------===//
// cv.pack.h
//===----------------------------------------------------------------------===//

cv.pack.h t0, t1, t2
# CHECK-INSTR: cv.pack.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0xf2]

cv.pack.h a0, a1, a2
# CHECK-INSTR: cv.pack.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0xf2]

cv.pack.h s0, s1, s2
# CHECK-INSTR: cv.pack.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0xf3]

