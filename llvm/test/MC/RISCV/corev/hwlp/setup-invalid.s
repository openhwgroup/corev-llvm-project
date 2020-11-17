# RUN: not llvm-mc -triple=riscv32 --mattr=+xcorevhwlp %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

cv.setup 1, 10, 0
# CHECK-ERROR: invalid operand for instruction

cv.setup 1, s2, 4095
# CHECK-ERROR: immediate must be an even integer in the range [0, 4094]

cv.setup 0, s2, 4096
# CHECK-ERROR: immediate must be an even integer in the range [0, 4094]

cv.setup 2, s2, 0
# CHECK-ERROR: immediate must be an integer in the range [0, 1]

cv.setup -1, s2, 0
# CHECK-ERROR: immediate must be an integer in the range [0, 1]

cv.setup 0, s2
# CHECK-ERROR: too few operands for instruction

cv.setup 0, s2, 0, 10
# CHECK-ERROR: invalid operand for instruction
