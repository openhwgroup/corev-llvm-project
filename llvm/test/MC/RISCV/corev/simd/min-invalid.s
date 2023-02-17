# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.min.h
//===----------------------------------------------------------------------===//

cv.min.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.min.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.min.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.min.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.min.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.min.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.min.b
//===----------------------------------------------------------------------===//

cv.min.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.min.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.min.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.min.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.min.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.min.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.min.sc.h
//===----------------------------------------------------------------------===//

cv.min.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.min.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.min.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.min.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.min.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.min.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.min.sc.b
//===----------------------------------------------------------------------===//

cv.min.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.min.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.min.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.min.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.min.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.min.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.min.sci.h
//===----------------------------------------------------------------------===//

cv.min.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.min.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.min.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.min.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.min.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.min.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.min.sci.b
//===----------------------------------------------------------------------===//

cv.min.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.min.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.min.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.min.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.min.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.min.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

