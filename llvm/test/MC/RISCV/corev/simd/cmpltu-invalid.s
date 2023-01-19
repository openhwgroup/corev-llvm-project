# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.cmpltu.h
//===----------------------------------------------------------------------===//

cv.cmpltu.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpltu.b
//===----------------------------------------------------------------------===//

cv.cmpltu.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpltu.sc.h
//===----------------------------------------------------------------------===//

cv.cmpltu.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpltu.sc.b
//===----------------------------------------------------------------------===//

cv.cmpltu.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpltu.sci.h
//===----------------------------------------------------------------------===//

cv.cmpltu.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpltu.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpltu.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpltu.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpltu.sci.b
//===----------------------------------------------------------------------===//

cv.cmpltu.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpltu.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpltu.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpltu.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpltu.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

