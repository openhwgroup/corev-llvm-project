# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevhwlp -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.count 1, s2
# CHECK-INSTR: cv.count 1, s2
# CHECK-ENCODING: [0xab,0x45,0x09,0x00]

cv.count 0, s4
# CHECK-INSTR: cv.count 0, s4
# CHECK-ENCODING: [0x2b,0x45,0x0a,0x00]

cv.count 0, zero
# CHECK-INSTR: cv.count 0, zero
# CHECK-ENCODING: [0x2b,0x45,0x00,0x00]
