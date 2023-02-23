# RUN: llvm-mc -triple=riscv32 --mattr=+xcvhwlp -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.endi 0, 0
# CHECK-INSTR: cv.endi 0, 0
# CHECK-ENCODING: [0x2b,0x42,0x00,0x00]

cv.endi 1, 1056
# CHECK-INSTR: cv.endi 1, 1056
# CHECK-ENCODING: [0xab,0x42,0x80,0x10]

cv.endi 0, 8188
# CHECK-INSTR: cv.endi 0, 8188
# CHECK-ENCODING: [0x2b,0x42,0xf0,0x7f]

cv.endi 1, 16380
# CHECK-INSTR: cv.endi 1, 16380
# CHECK-ENCODING: [0xab,0x42,0xf0,0xff]
