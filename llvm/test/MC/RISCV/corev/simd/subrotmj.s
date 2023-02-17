# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

//===----------------------------------------------------------------------===//
// cv.subrotmj
//===----------------------------------------------------------------------===//

cv.subrotmj t0, t1, t2
# CHECK-INSTR: cv.subrotmj t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x64]

cv.subrotmj a0, a1, a2
# CHECK-INSTR: cv.subrotmj a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x64]

cv.subrotmj s0, s1, s2
# CHECK-INSTR: cv.subrotmj s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x65]

//===----------------------------------------------------------------------===//
// cv.subrotmj.div2
//===----------------------------------------------------------------------===//

cv.subrotmj.div2 t0, t1, t2
# CHECK-INSTR: cv.subrotmj.div2 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x22,0x73,0x64]

cv.subrotmj.div2 a0, a1, a2
# CHECK-INSTR: cv.subrotmj.div2 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xa5,0xc5,0x64]

cv.subrotmj.div2 s0, s1, s2
# CHECK-INSTR: cv.subrotmj.div2 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xa4,0x24,0x65]

//===----------------------------------------------------------------------===//
// cv.subrotmj.div4
//===----------------------------------------------------------------------===//

cv.subrotmj.div4 t0, t1, t2
# CHECK-INSTR: cv.subrotmj.div4 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x64]

cv.subrotmj.div4 a0, a1, a2
# CHECK-INSTR: cv.subrotmj.div4 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x64]

cv.subrotmj.div4 s0, s1, s2
# CHECK-INSTR: cv.subrotmj.div4 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x65]

//===----------------------------------------------------------------------===//
// cv.subrotmj.div8
//===----------------------------------------------------------------------===//

cv.subrotmj.div8 t0, t1, t2
# CHECK-INSTR: cv.subrotmj.div8 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x62,0x73,0x64]

cv.subrotmj.div8 a0, a1, a2
# CHECK-INSTR: cv.subrotmj.div8 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xe5,0xc5,0x64]

cv.subrotmj.div8 s0, s1, s2
# CHECK-INSTR: cv.subrotmj.div8 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xe4,0x24,0x65]

