# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvhwlp %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

cv.end 2, 0
# CHECK-ERROR: loop ID must be an integer in the range [0, 1]

cv.end -1, 0
# CHECK-ERROR: loop ID must be an integer in the range [0, 1]

cv.end 1, 10
# CHECK-ERROR: invalid operand for instruction

cv.end 1
# CHECK-ERROR: too few operands for instruction

cv.end 1, s2, 0
# CHECK-ERROR: invalid operand for instruction
