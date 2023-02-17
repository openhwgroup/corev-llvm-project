# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.cplxmul.i
//===----------------------------------------------------------------------===//

cv.cplxmul.i t0, t1, t2
# CHECK-INSTR: cv.cplxmul.i t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x56]

cv.cplxmul.i a0, a1, a2
# CHECK-INSTR: cv.cplxmul.i a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x56]

cv.cplxmul.i s0, s1, s2
# CHECK-INSTR: cv.cplxmul.i s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x57]

//===----------------------------------------------------------------------===//
// cv.cplxmul.i.div2
//===----------------------------------------------------------------------===//

cv.cplxmul.i.div2 t0, t1, t2
# CHECK-INSTR: cv.cplxmul.i.div2 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x22,0x73,0x56]

cv.cplxmul.i.div2 a0, a1, a2
# CHECK-INSTR: cv.cplxmul.i.div2 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xa5,0xc5,0x56]

cv.cplxmul.i.div2 s0, s1, s2
# CHECK-INSTR: cv.cplxmul.i.div2 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xa4,0x24,0x57]

//===----------------------------------------------------------------------===//
// cv.cplxmul.i.div4
//===----------------------------------------------------------------------===//

cv.cplxmul.i.div4 t0, t1, t2
# CHECK-INSTR: cv.cplxmul.i.div4 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x56]

cv.cplxmul.i.div4 a0, a1, a2
# CHECK-INSTR: cv.cplxmul.i.div4 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x56]

cv.cplxmul.i.div4 s0, s1, s2
# CHECK-INSTR: cv.cplxmul.i.div4 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x57]

//===----------------------------------------------------------------------===//
// cv.cplxmul.i.div8
//===----------------------------------------------------------------------===//

cv.cplxmul.i.div8 t0, t1, t2
# CHECK-INSTR: cv.cplxmul.i.div8 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x62,0x73,0x56]

cv.cplxmul.i.div8 a0, a1, a2
# CHECK-INSTR: cv.cplxmul.i.div8 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xe5,0xc5,0x56]

cv.cplxmul.i.div8 s0, s1, s2
# CHECK-INSTR: cv.cplxmul.i.div8 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xe4,0x24,0x57]

