# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevmem -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.sw t0, 0(t1!)
# CHECK-INSTR: cv.sw t0, 0(t1!)
# CHECK-ENCODING: [0x2b,0x20,0x53,0x00]

cv.sw a0, 2047(a1!)
# CHECK-INSTR: cv.sw a0, 2047(a1!)
# CHECK-ENCODING: [0xab,0xaf,0xa5,0x7e]



cv.sw t0, t2(t1!)
# CHECK-INSTR: cv.sw t0, t2(t1!)
# CHECK-ENCODING: [0xab,0x63,0x53,0x00]

cv.sw a0, a2(a1!)
# CHECK-INSTR: cv.sw a0, a2(a1!)
# CHECK-ENCODING: [0x2b,0xe6,0xa5,0x00]



cv.sw t0, t2(t1)
# CHECK-INSTR: cv.sw t0, t2(t1)
# CHECK-ENCODING: [0xa3,0x63,0x53,0x00]

cv.sw a0, a2(a1)
# CHECK-INSTR: cv.sw a0, a2(a1)
# CHECK-ENCODING: [0x23,0xe6,0xa5,0x00]
