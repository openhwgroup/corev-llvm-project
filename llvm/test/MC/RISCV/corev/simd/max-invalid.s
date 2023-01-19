# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.max.h
//===----------------------------------------------------------------------===//

cv.max.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.max.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.max.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.max.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.max.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.max.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.max.b
//===----------------------------------------------------------------------===//

cv.max.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.max.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.max.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.max.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.max.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.max.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.max.sc.h
//===----------------------------------------------------------------------===//

cv.max.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.max.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.max.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.max.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.max.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.max.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.max.sc.b
//===----------------------------------------------------------------------===//

cv.max.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.max.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.max.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.max.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.max.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.max.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.max.sci.h
//===----------------------------------------------------------------------===//

cv.max.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.max.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.max.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.max.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.max.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.max.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.max.sci.b
//===----------------------------------------------------------------------===//

cv.max.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.max.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.max.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.max.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.max.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.max.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

