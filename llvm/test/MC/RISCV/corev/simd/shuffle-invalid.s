# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.shuffle.h
//===----------------------------------------------------------------------===//

cv.shuffle.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffle.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffle.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.shuffle.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.shuffle.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.shuffle.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.shuffle.b
//===----------------------------------------------------------------------===//

cv.shuffle.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffle.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffle.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.shuffle.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.shuffle.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.shuffle.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.shuffle.sci.h
//===----------------------------------------------------------------------===//

cv.shuffle.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffle.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffle.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.shuffle.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.shuffle.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.shuffle.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

