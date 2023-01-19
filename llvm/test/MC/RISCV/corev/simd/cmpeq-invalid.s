# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.cmpeq.h
//===----------------------------------------------------------------------===//

cv.cmpeq.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpeq.b
//===----------------------------------------------------------------------===//

cv.cmpeq.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpeq.sc.h
//===----------------------------------------------------------------------===//

cv.cmpeq.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpeq.sc.b
//===----------------------------------------------------------------------===//

cv.cmpeq.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpeq.sci.h
//===----------------------------------------------------------------------===//

cv.cmpeq.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpeq.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpeq.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpeq.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpeq.sci.b
//===----------------------------------------------------------------------===//

cv.cmpeq.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpeq.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpeq.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpeq.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpeq.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

