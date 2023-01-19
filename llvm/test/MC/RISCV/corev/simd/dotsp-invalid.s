# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.dotsp.h
//===----------------------------------------------------------------------===//

cv.dotsp.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.dotsp.b
//===----------------------------------------------------------------------===//

cv.dotsp.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.dotsp.sc.h
//===----------------------------------------------------------------------===//

cv.dotsp.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.dotsp.sc.b
//===----------------------------------------------------------------------===//

cv.dotsp.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.dotsp.sci.h
//===----------------------------------------------------------------------===//

cv.dotsp.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotsp.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotsp.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotsp.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.dotsp.sci.b
//===----------------------------------------------------------------------===//

cv.dotsp.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotsp.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotsp.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotsp.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotsp.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

