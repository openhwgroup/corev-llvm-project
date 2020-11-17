# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevhwlp -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.setupi 1, 30, 0
# CHECK-INSTR: cv.setupi 1, 30, 0
# CHECK-ENCODING: [0xfb,0x50,0x0f,0x00]

cv.setupi 1, 18, 0
# CHECK-INSTR: cv.setupi 1, 18, 0
# CHECK-ENCODING: [0xfb,0x50,0x09,0x00]

cv.setupi 1, 0, 0
# CHECK-INSTR: cv.setupi 1, 0, 0
# CHECK-ENCODING: [0xfb,0x50,0x00,0x00]

cv.setupi 1, 0, 4095
# CHECK-INSTR: cv.setupi 1, 0, 4095
# CHECK-ENCODING: [0xfb,0x50,0xf0,0xff]

cv.setupi 1, 0, 1932
# CHECK-INSTR: cv.setupi 1, 0, 1932
# CHECK-ENCODING: [0xfb,0x50,0xc0,0x78]

cv.setupi 1, 0, 0
# CHECK-INSTR: cv.setupi 1, 0, 0
# CHECK-ENCODING: [0xfb,0x50,0x00,0x00]

cv.setupi 0, 0, 0
# CHECK-INSTR: cv.setupi 0, 0, 0
# CHECK-ENCODING: [0x7b,0x50,0x00,0x00]

cv.setupi 0, 0x10, 0x400
# CHECK-INSTR: cv.setupi 0, 16, 1024
# CHECK-ENCODING: [0x7b,0x50,0x08,0x40]
