# RUN: not llvm-mc -triple=riscv32 --mattr=+xcorevhwlp %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

cv.count 2, 0
# CHECK-ERROR: immediate must be an integer in the range [0, 1]

cv.count -1, 0
# CHECK-ERROR: immediate must be an integer in the range [0, 1]

cv.count 1, 10
# CHECK-ERROR: invalid operand for instruction

cv.count 1
# CHECK-ERROR: too few operands for instruction

cv.count 1, s2, 0
# CHECK-ERROR: invalid operand for instruction
