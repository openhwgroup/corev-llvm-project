# RUN: not llvm-mc -triple=riscv32 --mattr=+xcorevhwlp %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

cv.setupi 1, 0, 31
# CHECK-ERROR: immediate must be an even integer in the range [0, 30]

cv.setupi 1, 0, 32
# CHECK-ERROR: immediate must be an even integer in the range [0, 30]

cv.setupi 0, 0, -6
# CHECK-ERROR: immediate must be an even integer in the range [0, 30]

cv.setupi 0, 0, -7
# CHECK-ERROR: immediate must be an even integer in the range [0, 30]

cv.setupi 1, 4096, 30
# CHECK-ERROR: immediate must be an integer in the range [0, 4095]

cv.setupi 1, -10, 30
# CHECK-ERROR: immediate must be an integer in the range [0, 4095]

cv.setupi 2, 0, 0
# CHECK-ERROR: loop ID must be an integer in the range [0, 1]

cv.setupi -1, 0, 0
# CHECK-ERROR: loop ID must be an integer in the range [0, 1]

cv.setupi s2, 0, 0
# CHECK-ERROR: loop ID must be an integer in the range [0, 1]

cv.setupi 0, 0, s2
# CHECK-ERROR: immediate must be an even integer in the range [0, 30]

cv.setupi 0, s2, 0
# CHECK-ERROR: immediate must be an integer in the range [0, 4095]

cv.setupi 2
# CHECK-ERROR: loop ID must be an integer in the range [0, 1]

cv.setupi 1, 30
# CHECK-ERROR: too few operands for instruction

cv.setupi 1, 30, 0, 10
# CHECK-ERROR: invalid operand for instruction
