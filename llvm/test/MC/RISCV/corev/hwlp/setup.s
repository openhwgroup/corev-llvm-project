# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevhwlp -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.setup 0, t0, 0
# CHECK-INSTR: cv.setup 0, t0, 0
# CHECK-ENCODING: [0x2b,0xc7,0x02,0x00]

cv.setup 1, t5, 488
# CHECK-INSTR: cv.setup 1, t5, 488
# CHECK-ENCODING: [0xab,0x47,0xaf,0x07]

cv.setup 0, a0, 8188
# CHECK-INSTR: cv.setup 0, a0, 8188
# CHECK-ENCODING: [0x2b,0x47,0xf5,0x7f]

cv.setup 1, t3, 16380
# CHECK-INSTR: cv.setup 1, t3, 16380
# CHECK-ENCODING: [0xab,0x47,0xfe,0xff]
