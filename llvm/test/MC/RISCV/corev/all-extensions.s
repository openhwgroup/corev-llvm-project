# RUN: llvm-mc -triple=riscv32 --mattr=xcorev -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-INSTR,CHECK-ENCODING

cv.starti 0, 0
# CHECK-INSTR: cv.starti 0, 0
# CHECK-ENCODING: [0x7b,0x00,0x00,0x00]

cv.endi 0, 0
# CHECK-INSTR: cv.endi 0, 0
# CHECK-ENCODING: [0x7b,0x10,0x00,0x00]

cv.count 0, zero
# CHECK-INSTR: cv.count 0, zero
# CHECK-ENCODING: [0x7b,0x20,0x00,0x00]

cv.counti 0, 0
# CHECK-INSTR: cv.counti 0, 0
# CHECK-ENCODING: [0x7b,0x30,0x00,0x00]

cv.setup 0, zero, 0
# CHECK-INSTR: cv.setup 0, zero, 0
# CHECK-ENCODING: [0x7b,0x40,0x00,0x00]

cv.setupi 0, 0, 0
# CHECK-INSTR: cv.setupi 0, 0, 0
# CHECK-ENCODING: [0x7b,0x50,0x00,0x00]
