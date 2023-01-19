# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.sdotusp.h
//===----------------------------------------------------------------------===//

cv.sdotusp.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sdotusp.b
//===----------------------------------------------------------------------===//

cv.sdotusp.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sdotusp.sc.h
//===----------------------------------------------------------------------===//

cv.sdotusp.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sdotusp.sc.b
//===----------------------------------------------------------------------===//

cv.sdotusp.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sdotusp.sci.h
//===----------------------------------------------------------------------===//

cv.sdotusp.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotusp.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotusp.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotusp.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sdotusp.sci.b
//===----------------------------------------------------------------------===//

cv.sdotusp.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotusp.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotusp.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotusp.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotusp.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

