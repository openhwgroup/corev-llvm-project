# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.minu.h
//===----------------------------------------------------------------------===//

cv.minu.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.minu.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.minu.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.minu.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.minu.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.minu.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.minu.b
//===----------------------------------------------------------------------===//

cv.minu.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.minu.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.minu.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.minu.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.minu.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.minu.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.minu.sc.h
//===----------------------------------------------------------------------===//

cv.minu.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.minu.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.minu.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.minu.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.minu.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.minu.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.minu.sc.b
//===----------------------------------------------------------------------===//

cv.minu.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.minu.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.minu.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.minu.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.minu.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.minu.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.minu.sci.h
//===----------------------------------------------------------------------===//

cv.minu.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.minu.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.minu.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.minu.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.minu.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.minu.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.minu.sci.b
//===----------------------------------------------------------------------===//

cv.minu.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.minu.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.minu.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.minu.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.minu.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.minu.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

