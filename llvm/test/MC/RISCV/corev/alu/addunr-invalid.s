# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvalu %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

cv.adduNr t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.adduNr t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.adduNr 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.adduNr t0, t1
# CHECK-ERROR: too few operands for instruction

cv.adduNr t0, t1, t2, a0
# CHECK-ERROR: invalid operand for instruction
