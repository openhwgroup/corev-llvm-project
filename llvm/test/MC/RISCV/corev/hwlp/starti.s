# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevhwlp -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.starti 1, 4094
# CHECK-INSTR: cv.starti 1, 4094
# CHECK-ENCODING: [0xfb,0x00,0xe0,0xff]

cv.starti 1, 1932
# CHECK-INSTR: cv.starti 1, 1932
# CHECK-ENCODING: [0xfb,0x00,0xc0,0x78]

cv.starti 1, 0
# CHECK-INSTR: cv.starti 1, 0
# CHECK-ENCODING: [0xfb,0x00,0x00,0x00]

cv.starti 0, 1000
# CHECK-INSTR: cv.starti 0, 1000
# CHECK-ENCODING: [0x7b,0x00,0x80,0x3e]

cv.starti 0, 0x400
# CHECK-INSTR: cv.starti 0, 1024
# CHECK-ENCODING: [0x7b,0x00,0x00,0x40]
