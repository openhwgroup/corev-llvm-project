# RUN: not llvm-mc -triple=riscv32 --mattr=+xcorevmem %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

cv.sw t0, 0(0!)
# CHECK-ERROR: expected register

cv.sw 0, 0(t1!)
# CHECK-ERROR: invalid operand for instruction

cv.sw t0, 0(t1)
# CHECK-ERROR: invalid operand for instruction

cv.sw t0, 2048(t1!)
# CHECK-ERROR: operand must be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]

cv.sw t0, t1(0!)
# CHECK-ERROR: expected register

cv.sw 0, t1(t1!)
# CHECK-ERROR: invalid operand for instruction

cv.sw t0, t1(0)
# CHECK-ERROR: expected register

cv.sw 0, 0(t1)
# CHECK-ERROR: invalid operand for instruction

cv.sw t0
# CHECK-ERROR: too few operands for instruction
