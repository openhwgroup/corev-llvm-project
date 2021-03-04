# RUN: not llvm-mc -triple=riscv32 --mattr=+xcorevalu %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

cv.extbz t0, 0
# CHECK-ERROR: invalid operand for instruction

cv.extbz 0, t1
# CHECK-ERROR: invalid operand for instruction

cv.extbz t0
# CHECK-ERROR: too few operands for instruction

cv.extbz t0, t1, t2
# CHECK-ERROR: invalid operand for instruction
