# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.cmpgtu.h
//===----------------------------------------------------------------------===//

cv.cmpgtu.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpgtu.b
//===----------------------------------------------------------------------===//

cv.cmpgtu.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpgtu.sc.h
//===----------------------------------------------------------------------===//

cv.cmpgtu.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpgtu.sc.b
//===----------------------------------------------------------------------===//

cv.cmpgtu.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpgtu.sci.h
//===----------------------------------------------------------------------===//

cv.cmpgtu.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgtu.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgtu.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgtu.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpgtu.sci.b
//===----------------------------------------------------------------------===//

cv.cmpgtu.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgtu.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgtu.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgtu.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgtu.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

