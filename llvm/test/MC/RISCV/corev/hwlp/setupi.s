# RUN: llvm-mc -triple=riscv32 --mattr=+xcvhwlp -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.setupi 1, 0, 32
# CHECK-INSTR: cv.setupi 1, 0, 32
# CHECK-ENCODING: [0xab,0x46,0x04,0x00]

cv.setupi 1, 0, 20
# CHECK-INSTR: cv.setupi 1, 0, 20
# CHECK-ENCODING: [0xab,0xc6,0x02,0x00]

cv.setupi 1, 0, 0
# CHECK-INSTR: cv.setupi 1, 0, 0
# CHECK-ENCODING: [0xab,0x46,0x00,0x00]

cv.setupi 1, 4095, 0
# CHECK-INSTR: cv.setupi 1, 4095, 0
# CHECK-ENCODING: [0xab,0x46,0xf0,0xff]

cv.setupi 1, 1932, 0
# CHECK-INSTR: cv.setupi 1, 1932, 0
# CHECK-ENCODING: [0xab,0x46,0xc0,0x78]

cv.setupi 0, 0, 0
# CHECK-INSTR: cv.setupi 0, 0, 0
# CHECK-ENCODING: [0x2b,0x46,0x00,0x00]

cv.setupi 0, 0x400, 0x10
# CHECK-INSTR: cv.setupi 0, 1024, 16
# CHECK-ENCODING: [0x2b,0x46,0x02,0x40]
