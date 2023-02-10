# RUN: llvm-mc -triple=riscv32 --mattr=+xcorevmem -show-encoding %s \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR

cv.sh t0, 0(t1!)
# CHECK-INSTR: cv.sh t0, 0(t1!)
# CHECK-ENCODING: [0x2b,0x10,0x53,0x00]

cv.sh a0, 2047(a1!)
# CHECK-INSTR: cv.sh a0, 2047(a1!)
# CHECK-ENCODING: [0xab,0x9f,0xa5,0x7e]



cv.sh t0, t2(t1!)
# CHECK-INSTR: cv.sh t0, t2(t1!)
# CHECK-ENCODING: [0xab,0x33,0x53,0x22]

cv.sh a0, a2(a1!)
# CHECK-INSTR: cv.sh a0, a2(a1!)
# CHECK-ENCODING: [0x2b,0xb6,0xa5,0x22]



cv.sh t0, t2(t1)
# CHECK-INSTR: cv.sh t0, t2(t1)
# CHECK-ENCODING: [0xab,0x33,0x53,0x2a]

cv.sh a0, a2(a1)
# CHECK-INSTR: cv.sh a0, a2(a1)
# CHECK-ENCODING: [0x2b,0xb6,0xa5,0x2a]
