# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.shuffle2.h
//===----------------------------------------------------------------------===//

cv.shuffle2.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffle2.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffle2.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.shuffle2.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.shuffle2.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.shuffle2.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.shuffle2.b
//===----------------------------------------------------------------------===//

cv.shuffle2.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffle2.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffle2.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.shuffle2.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.shuffle2.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.shuffle2.b t0, t1
# CHECK-ERROR: too few operands for instruction

