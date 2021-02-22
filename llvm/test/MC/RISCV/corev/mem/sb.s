# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevmem -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.sb t0, 0(t1!)
# CHECK-INSTR: cv.sb t0, 0(t1!)
# CHECK-ENCODING: [0x2b,0x00,0x53,0x00]

cv.sb a0, 2047(a1!)
# CHECK-INSTR: cv.sb a0, 2047(a1!)
# CHECK-ENCODING: [0xab,0x8f,0xa5,0x7e]



cv.sb t0, t2(t1!)
# CHECK-INSTR: cv.sb t0, t2(t1!)
# CHECK-ENCODING: [0xab,0x43,0x53,0x00]

cv.sb a0, a2(a1!)
# CHECK-INSTR: cv.sb a0, a2(a1!)
# CHECK-ENCODING: [0x2b,0xc6,0xa5,0x00]



cv.sb t0, t2(t1)
# CHECK-INSTR: cv.sb t0, t2(t1)
# CHECK-ENCODING: [0xa3,0x43,0x53,0x00]

cv.sb a0, a2(a1)
# CHECK-INSTR: cv.sb a0, a2(a1)
# CHECK-ENCODING: [0x23,0xc6,0xa5,0x00]
