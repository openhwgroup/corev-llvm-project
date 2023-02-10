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
# CHECK-ENCODING: [0xab,0x33,0x53,0x24]

cv.sw a0, a2(a1!)
# CHECK-INSTR: cv.sw a0, a2(a1!)
# CHECK-ENCODING: [0x2b,0xb6,0xa5,0x24]



cv.sw t0, t2(t1)
# CHECK-INSTR: cv.sw t0, t2(t1)
# CHECK-ENCODING: [0xab,0x33,0x53,0x2c]

cv.sw a0, a2(a1)
# CHECK-INSTR: cv.sw a0, a2(a1)
# CHECK-ENCODING: [0x2b,0xb6,0xa5,0x2c]
