# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevhwlp -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.starti 1, 4092
# CHECK-INSTR: cv.starti 1, 4092
# CHECK-ENCODING: [0xab,0x40,0xf0,0x3f]

cv.starti 1, 1932
# CHECK-INSTR: cv.starti 1, 1932
# CHECK-ENCODING: [0xab,0x40,0x30,0x1e]

cv.starti 1, 0
# CHECK-INSTR: cv.starti 1, 0
# CHECK-ENCODING: [0xab,0x40,0x00,0x00]

cv.starti 0, 1000
# CHECK-INSTR: cv.starti 0, 1000
# CHECK-ENCODING: [0x2b,0x40,0xa0,0x0f]

cv.starti 0, 0x400
# CHECK-INSTR: cv.starti 0, 1024
# CHECK-ENCODING: [0x2b,0x40,0x00,0x10]
