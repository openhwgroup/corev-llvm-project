# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.avgu.h
//===----------------------------------------------------------------------===//

cv.avgu.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.avgu.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.avgu.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.avgu.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.avgu.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.avgu.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.avgu.b
//===----------------------------------------------------------------------===//

cv.avgu.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.avgu.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.avgu.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.avgu.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.avgu.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.avgu.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.avgu.sc.h
//===----------------------------------------------------------------------===//

cv.avgu.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.avgu.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.avgu.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.avgu.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.avgu.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.avgu.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.avgu.sc.b
//===----------------------------------------------------------------------===//

cv.avgu.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.avgu.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.avgu.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.avgu.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.avgu.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.avgu.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.avgu.sci.h
//===----------------------------------------------------------------------===//

cv.avgu.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.avgu.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.avgu.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.avgu.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.avgu.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.avgu.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.avgu.sci.b
//===----------------------------------------------------------------------===//

cv.avgu.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.avgu.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.avgu.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.avgu.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.avgu.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.avgu.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

