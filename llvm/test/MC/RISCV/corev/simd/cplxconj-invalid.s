# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.cplxconj
//===----------------------------------------------------------------------===//

cv.cplxconj 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxconj t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxconj t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cplxconj t0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxconj t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxconj t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

