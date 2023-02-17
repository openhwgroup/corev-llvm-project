# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.cplxmul.r
//===----------------------------------------------------------------------===//

cv.cplxmul.r t0, t1, t2
# CHECK-INSTR: cv.cplxmul.r t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x54]

cv.cplxmul.r a0, a1, a2
# CHECK-INSTR: cv.cplxmul.r a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x54]

cv.cplxmul.r s0, s1, s2
# CHECK-INSTR: cv.cplxmul.r s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x55]

//===----------------------------------------------------------------------===//
// cv.cplxmul.r.div2
//===----------------------------------------------------------------------===//

cv.cplxmul.r.div2 t0, t1, t2
# CHECK-INSTR: cv.cplxmul.r.div2 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x22,0x73,0x54]

cv.cplxmul.r.div2 a0, a1, a2
# CHECK-INSTR: cv.cplxmul.r.div2 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xa5,0xc5,0x54]

cv.cplxmul.r.div2 s0, s1, s2
# CHECK-INSTR: cv.cplxmul.r.div2 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xa4,0x24,0x55]

//===----------------------------------------------------------------------===//
// cv.cplxmul.r.div4
//===----------------------------------------------------------------------===//

cv.cplxmul.r.div4 t0, t1, t2
# CHECK-INSTR: cv.cplxmul.r.div4 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x54]

cv.cplxmul.r.div4 a0, a1, a2
# CHECK-INSTR: cv.cplxmul.r.div4 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x54]

cv.cplxmul.r.div4 s0, s1, s2
# CHECK-INSTR: cv.cplxmul.r.div4 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x55]

//===----------------------------------------------------------------------===//
// cv.cplxmul.r.div8
//===----------------------------------------------------------------------===//

cv.cplxmul.r.div8 t0, t1, t2
# CHECK-INSTR: cv.cplxmul.r.div8 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x62,0x73,0x54]

cv.cplxmul.r.div8 a0, a1, a2
# CHECK-INSTR: cv.cplxmul.r.div8 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xe5,0xc5,0x54]

cv.cplxmul.r.div8 s0, s1, s2
# CHECK-INSTR: cv.cplxmul.r.div8 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xe4,0x24,0x55]

