# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvbitmanip %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

cv.bclr t0, t1
# CHECK-ERROR: too few operands for instruction

cv.bclr t0, t1, 0
# CHECK-ERROR: too few operands for instruction

cv.bclr t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [0, 31]

cv.bclr t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [0, 31]

cv.bclr t0, t1, 0, 32
# CHECK-ERROR: immediate must be an integer in the range [0, 31]

cv.bclr t0, t1, 0, -1
# CHECK-ERROR: immediate must be an integer in the range [0, 31]

cv.bclr t0, t1, 32, 0
# CHECK-ERROR: immediate must be an integer in the range [0, 31]

cv.bclr t0, t1, -1, 0
# CHECK-ERROR: immediate must be an integer in the range [0, 31]

