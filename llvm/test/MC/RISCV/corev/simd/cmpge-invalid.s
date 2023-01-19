# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.cmpge.h
//===----------------------------------------------------------------------===//

cv.cmpge.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpge.b
//===----------------------------------------------------------------------===//

cv.cmpge.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpge.sc.h
//===----------------------------------------------------------------------===//

cv.cmpge.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpge.sc.b
//===----------------------------------------------------------------------===//

cv.cmpge.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpge.sci.h
//===----------------------------------------------------------------------===//

cv.cmpge.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpge.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpge.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpge.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpge.sci.b
//===----------------------------------------------------------------------===//

cv.cmpge.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpge.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpge.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpge.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpge.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

