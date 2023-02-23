# RUN: llvm-mc -triple=riscv32 --mattr=+xcvalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.extbs t0, t1
# CHECK-INSTR: cv.extbs t0, t1
# CHECK-ENCODING: [0xab,0x32,0x03,0x64]

cv.extbs a0, a1
# CHECK-INSTR: cv.extbs a0, a1
# CHECK-ENCODING: [0x2b,0xb5,0x05,0x64]
