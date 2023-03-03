# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevhwlp -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.counti 1, 4095
# CHECK-INSTR: cv.counti 1, 4095
# CHECK-ENCODING: [0xab,0x44,0xf0,0xff]

cv.counti 1, 1932
# CHECK-INSTR: cv.counti 1, 1932
# CHECK-ENCODING: [0xab,0x44,0xc0,0x78]

cv.counti 1, 0
# CHECK-INSTR: cv.counti 1, 0
# CHECK-ENCODING: [0xab,0x44,0x00,0x00]

cv.counti 0, 1000
# CHECK-INSTR: cv.counti 0, 1000
# CHECK-ENCODING: [0x2b,0x44,0x80,0x3e]

cv.counti 0, 0x401
# CHECK-INSTR: cv.counti 0, 1025
# CHECK-ENCODING: [0x2b,0x44,0x10,0x40]
