# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvmem %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

cv.sh t0, (0), 0
# CHECK-ERROR: invalid operand for instruction

cv.sh 0, (t1), 0
# CHECK-ERROR: invalid operand for instruction

cv.sh t0, 0(t1)
# CHECK-ERROR: invalid operand for instruction

cv.sh t0, (t1), 2048
# CHECK-ERROR: operand must be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]

cv.sh t0, (0), t1
# CHECK-ERROR: invalid operand for instruction

cv.sh 0, (t1), t1
# CHECK-ERROR: invalid operand for instruction

cv.sh t0, t1(0)
# CHECK-ERROR: expected register

cv.sh 0, 0(t1)
# CHECK-ERROR: invalid operand for instruction

cv.sh t0
# CHECK-ERROR: too few operands for instruction
