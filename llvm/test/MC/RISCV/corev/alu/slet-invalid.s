# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvalu %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

cv.sle t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sle t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sle 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sle t0, t1
# CHECK-ERROR: too few operands for instruction

cv.sle t0, t1, t2, a0
# CHECK-ERROR: invalid operand for instruction

cv.slet t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.slet t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.slet 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.slet t0, t1
# CHECK-ERROR: too few operands for instruction

cv.slet t0, t1, t2, a0
# CHECK-ERROR: invalid operand for instruction
