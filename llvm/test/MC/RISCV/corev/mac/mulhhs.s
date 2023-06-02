# RUN: llvm-mc -triple=riscv32 --mattr=+xcvmac -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.mulhhs t0, t1, t2
# CHECK-INSTR: cv.mulhhsn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x42,0x73,0x40]

cv.mulhhs t0, t1, zero
# CHECK-INSTR: cv.mulhhsn t0, t1, zero, 0
# CHECK-ENCODING: [0xdb,0x42,0x03,0x40]
