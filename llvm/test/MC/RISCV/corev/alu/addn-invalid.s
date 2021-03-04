# RUN: not llvm-mc -triple=riscv32 --mattr=+xcorevalu %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

cv.addn t0, t1, t2, -1
# CHECK-ERROR: immediate must be an integer in the range [0, 31]

cv.addn t0, t1, t2, 32
# CHECK-ERROR: immediate must be an integer in the range [0, 31]

cv.addn t0, t1, t2, a0
# CHECK-ERROR: immediate must be an integer in the range [0, 31]

cv.addn t0, t1, 0, 0
# CHECK-ERROR: invalid operand for instruction

cv.addn t0, 0, t2, 0
# CHECK-ERROR: invalid operand for instruction

cv.addn 0, t1, t2, 0
# CHECK-ERROR: invalid operand for instruction

cv.addn t0, t1, t2
# CHECK-ERROR: too few operands for instruction

cv.addn t0, t1, t2, 0, a0
# CHECK-ERROR: invalid operand for instruction
