# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvmem %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

cv.lw t0, (0), 0
# CHECK-ERROR: invalid operand for instruction

cv.lw 0, (t1), 0
# CHECK-ERROR: invalid operand for instruction

cv.lw 0, (0), t2
# CHECK-ERROR: invalid operand for instruction

cv.lw t0, (t1), -2049
# CHECK-ERROR: operand must be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]

cv.lw t0, (t1), 2048
# CHECK-ERROR: operand must be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]

cv.lw t0, (0), t1
# CHECK-ERROR: invalid operand for instruction

cv.lw t0, t1(0)
# CHECK-ERROR: expected register

cv.lw 0, (t0), t1
# CHECK-ERROR: invalid operand for instruction

cv.lw t0
# CHECK-ERROR: too few operands for instruction

cv.lw t0, (t1)
# CHECK-ERROR: too few operands for instruction

cv.lw t0, (t1), t2, t3
# CHECK-ERROR: invalid operand for instruction 
