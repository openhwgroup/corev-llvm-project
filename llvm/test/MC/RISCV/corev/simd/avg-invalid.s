# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.avg.h
//===----------------------------------------------------------------------===//

cv.avg.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.avg.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.avg.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.avg.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.avg.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.avg.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.avg.b
//===----------------------------------------------------------------------===//

cv.avg.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.avg.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.avg.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.avg.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.avg.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.avg.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.avg.sc.h
//===----------------------------------------------------------------------===//

cv.avg.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.avg.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.avg.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.avg.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.avg.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.avg.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.avg.sc.b
//===----------------------------------------------------------------------===//

cv.avg.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.avg.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.avg.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.avg.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.avg.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.avg.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.avg.sci.h
//===----------------------------------------------------------------------===//

cv.avg.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.avg.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.avg.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.avg.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.avg.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.avg.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.avg.sci.b
//===----------------------------------------------------------------------===//

cv.avg.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.avg.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.avg.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.avg.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.avg.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.avg.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

