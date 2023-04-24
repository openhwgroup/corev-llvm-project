# RUN: llvm-mc -triple=riscv32 --mattr=+xcvbi -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-INSTR,CHECK-ENCODING


cv.beqimm t0, 0, 0
# CHECK-INSTR: cv.beqimm t0, 0, 0
# CHECK-ENCODING: [0x0b,0xe0,0x02,0x00]

cv.bneimm t0, 0, 0
# CHECK-INSTR: cv.bneimm t0, 0, 0
# CHECK-ENCODING: [0x0b,0xf0,0x02,0x00]

