# RUN: not llvm-mc -triple=riscv32 --mattr=+xcorevalu %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

cv.addurnr t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.addurnr t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.addurnr 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.addurnr t0, t1
# CHECK-ERROR: too few operands for instruction

cv.addurnr t0, t1, t2, a0
# CHECK-ERROR: invalid operand for instruction
