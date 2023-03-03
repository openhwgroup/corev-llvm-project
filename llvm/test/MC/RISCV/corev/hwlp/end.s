# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevhwlp -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.end 0, t0
# CHECK-INSTR: cv.end 0, t0
# CHECK-ENCODING: [0x2b,0xc3,0x02,0x00]

cv.end 1, s4
# CHECK-INSTR: cv.end 1, s4
# CHECK-ENCODING: [0xab,0x43,0x0a,0x00]

cv.end 0, zero
# CHECK-INSTR: cv.end 0, zero
# CHECK-ENCODING: [0x2b,0x43,0x00,0x00]
