# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.cmpleu.h
//===----------------------------------------------------------------------===//

cv.cmpleu.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpleu.b
//===----------------------------------------------------------------------===//

cv.cmpleu.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpleu.sc.h
//===----------------------------------------------------------------------===//

cv.cmpleu.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpleu.sc.b
//===----------------------------------------------------------------------===//

cv.cmpleu.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpleu.sci.h
//===----------------------------------------------------------------------===//

cv.cmpleu.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpleu.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpleu.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpleu.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpleu.sci.b
//===----------------------------------------------------------------------===//

cv.cmpleu.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpleu.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpleu.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpleu.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpleu.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

