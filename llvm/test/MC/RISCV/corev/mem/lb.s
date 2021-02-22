# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevmem -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.lb t0, 0(t1!)
# CHECK-INSTR: cv.lb t0, 0(t1!)
# CHECK-ENCODING: [0x8b,0x02,0x03,0x00]

cv.lb a0, 2047(a1!)
# CHECK-INSTR: cv.lb a0, 2047(a1!)
# CHECK-ENCODING: [0x0b,0x85,0xf5,0x7f]



cv.lb t0, t2(t1!)
# CHECK-INSTR: cv.lb t0, t2(t1!)
# CHECK-ENCODING: [0x8b,0x72,0x73,0x00]

cv.lb a0, a2(a1!)
# CHECK-INSTR: cv.lb a0, a2(a1!)
# CHECK-ENCODING: [0x0b,0xf5,0xc5,0x00]



cv.lb t0, t2(t1)
# CHECK-INSTR: cv.lb t0, t2(t1)
# CHECK-ENCODING: [0x83,0x72,0x73,0x00]

cv.lb a0, a2(a1)
# CHECK-INSTR: cv.lb a0, a2(a1)
# CHECK-ENCODING: [0x03,0xf5,0xc5,0x00]
