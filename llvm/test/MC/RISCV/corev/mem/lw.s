# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevmem -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.lw t0, 0(t1!)
# CHECK-INSTR: cv.lw t0, 0(t1!)
# CHECK-ENCODING: [0x8b,0x22,0x03,0x00]

cv.lw a0, 2047(a1!)
# CHECK-INSTR: cv.lw a0, 2047(a1!)
# CHECK-ENCODING: [0x0b,0xa5,0xf5,0x7f]



cv.lw t0, t2(t1!)
# CHECK-INSTR: cv.lw t0, t2(t1!)
# CHECK-ENCODING: [0xab,0x32,0x73,0x04]

cv.lw a0, a2(a1!)
# CHECK-INSTR: cv.lw a0, a2(a1!)
# CHECK-ENCODING: [0x2b,0xb5,0xc5,0x04]



cv.lw t0, t2(t1)
# CHECK-INSTR: cv.lw t0, t2(t1)
# CHECK-ENCODING: [0xab,0x32,0x73,0x0c]

cv.lw a0, a2(a1)
# CHECK-INSTR: cv.lw a0, a2(a1)
# CHECK-ENCODING: [0x2b,0xb5,0xc5,0x0c]
