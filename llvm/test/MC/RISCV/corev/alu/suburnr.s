# RUN: llvm-mc -triple=riscv32 --mattr=+xcvalu -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.subuRNr t0, t1, t2
# CHECK-INSTR: cv.subuRNr t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x8e]

cv.subuRNr a0, a1, a2
# CHECK-INSTR: cv.subuRNr a0, a1, a2
# CHECK-ENCODING: [0x2b,0xb5,0xc5,0x8e]
