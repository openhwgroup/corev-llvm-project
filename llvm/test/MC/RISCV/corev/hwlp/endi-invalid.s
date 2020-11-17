# RUN: not llvm-mc -triple=riscv32 --mattr=+xcorevhwlp %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

cv.endi 1, 4093
# CHECK-ERROR: immediate must be an even integer in the range [0, 4094]

cv.endi 1, 4096
# CHECK-ERROR: immediate must be an even integer in the range [0, 4094]

cv.endi 0, -6
# CHECK-ERROR: immediate must be an even integer in the range [0, 4094]

cv.endi 0, -7
# CHECK-ERROR: immediate must be an even integer in the range [0, 4094]

cv.endi 2, 0
# CHECK-ERROR: immediate must be an integer in the range [0, 1]

cv.endi -1, 0
# CHECK-ERROR: immediate must be an integer in the range [0, 1]

cv.endi s2, 0
# CHECK-ERROR: immediate must be an integer in the range [0, 1]

cv.endi 0, s2
# CHECK-ERROR: immediate must be an even integer in the range [0, 4094]

cv.endi 2
# CHECK-ERROR: immediate must be an integer in the range [0, 1]

cv.endi 1
# CHECK-ERROR: too few operands for instruction

cv.endi 1, 0, 5
# CHECK-ERROR: invalid operand for instruction
