# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.cmplt.h
//===----------------------------------------------------------------------===//

cv.cmplt.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmplt.b
//===----------------------------------------------------------------------===//

cv.cmplt.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmplt.sc.h
//===----------------------------------------------------------------------===//

cv.cmplt.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmplt.sc.b
//===----------------------------------------------------------------------===//

cv.cmplt.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmplt.sci.h
//===----------------------------------------------------------------------===//

cv.cmplt.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmplt.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmplt.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmplt.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmplt.sci.b
//===----------------------------------------------------------------------===//

cv.cmplt.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmplt.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmplt.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmplt.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmplt.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

