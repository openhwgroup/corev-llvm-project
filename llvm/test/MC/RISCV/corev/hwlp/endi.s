# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevhwlp -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.endi 1, 4094
# CHECK-INSTR: cv.endi 1, 4094
# CHECK-ENCODING: [0xfb,0x10,0xe0,0xff]

cv.endi 1, 1932
# CHECK-INSTR: cv.endi 1, 1932
# CHECK-ENCODING: [0xfb,0x10,0xc0,0x78]

cv.endi 1, 0
# CHECK-INSTR: cv.endi 1, 0
# CHECK-ENCODING: [0xfb,0x10,0x00,0x00]

cv.endi 0, 1000
# CHECK-INSTR: cv.endi 0, 1000
# CHECK-ENCODING: [0x7b,0x10,0x80,0x3e]

cv.endi 0, 0x400
# CHECK-INSTR: cv.endi 0, 1024
# CHECK-ENCODING: [0x7b,0x10,0x00,0x40]
