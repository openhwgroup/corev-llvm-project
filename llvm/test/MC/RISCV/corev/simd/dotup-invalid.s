# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.dotup.h
//===----------------------------------------------------------------------===//

cv.dotup.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotup.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotup.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.dotup.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotup.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotup.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.dotup.b
//===----------------------------------------------------------------------===//

cv.dotup.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotup.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotup.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.dotup.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotup.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotup.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.dotup.sc.h
//===----------------------------------------------------------------------===//

cv.dotup.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotup.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotup.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.dotup.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotup.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotup.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.dotup.sc.b
//===----------------------------------------------------------------------===//

cv.dotup.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotup.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotup.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.dotup.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotup.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotup.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.dotup.sci.h
//===----------------------------------------------------------------------===//

cv.dotup.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotup.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotup.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotup.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotup.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotup.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.dotup.sci.b
//===----------------------------------------------------------------------===//

cv.dotup.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotup.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotup.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotup.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotup.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotup.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

