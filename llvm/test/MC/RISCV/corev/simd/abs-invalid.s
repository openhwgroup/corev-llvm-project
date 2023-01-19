# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.abs.h
//===----------------------------------------------------------------------===//

cv.abs.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.abs.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.abs.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.abs.h t0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.abs.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.abs.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

//===----------------------------------------------------------------------===//
// cv.abs.b
//===----------------------------------------------------------------------===//

cv.abs.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.abs.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.abs.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.abs.b t0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.abs.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.abs.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

