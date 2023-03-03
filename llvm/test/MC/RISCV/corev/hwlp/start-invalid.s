# RUN: not llvm-mc -triple=riscv32 --mattr=+xcorevhwlp %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

cv.start 2, 0
# CHECK-ERROR: loop ID must be an integer in the range [0, 1]

cv.start -1, 0
# CHECK-ERROR: loop ID must be an integer in the range [0, 1]

cv.start 1, 10
# CHECK-ERROR: invalid operand for instruction

cv.start 1
# CHECK-ERROR: too few operands for instruction

cv.start 1, s2, 0
# CHECK-ERROR: invalid operand for instruction
