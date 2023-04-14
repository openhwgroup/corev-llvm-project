# RUN: llvm-mc -triple=riscv32 --mattr=+xcvbitmanip -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.fl1 t0, t1
# CHECK-INSTR: cv.fl1 t0, t1
# CHECK-ENCODING: [0xab,0x32,0x03,0x44]

cv.fl1 a0, a1
# CHECK-INSTR: cv.fl1 a0, a1
# CHECK-ENCODING: [0x2b,0xb5,0x05,0x44]

cv.fl1 s0, s1
# CHECK-INSTR: cv.fl1 s0, s1
# CHECK-ENCODING: [0x2b,0xb4,0x04,0x44]

