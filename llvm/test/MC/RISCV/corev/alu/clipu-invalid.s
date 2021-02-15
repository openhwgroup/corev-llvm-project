# RUN: not llvm-mc -triple=riscv32 --mattr=+xcorevalu %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

cv.clipu t0, t1, -1
# CHECK-ERROR: immediate must be an integer in the range [0, 31]

cv.clipu t0, t1, 32
# CHECK-ERROR: immediate must be an integer in the range [0, 31]

cv.clipu t0, t1, a0
# CHECK-ERROR: immediate must be an integer in the range [0, 31]

cv.clipu t0, 0, 0
# CHECK-ERROR: invalid operand for instruction

cv.clipu 0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.clipu t0, t1
# CHECK-ERROR: too few operands for instruction

cv.clipu t0, t1, 0, 0
# CHECK-ERROR: invalid operand for instruction
