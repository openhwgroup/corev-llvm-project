# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.cmple.h
//===----------------------------------------------------------------------===//

cv.cmple.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmple.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmple.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmple.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmple.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmple.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmple.b
//===----------------------------------------------------------------------===//

cv.cmple.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmple.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmple.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmple.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmple.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmple.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmple.sc.h
//===----------------------------------------------------------------------===//

cv.cmple.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmple.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmple.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmple.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmple.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmple.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmple.sc.b
//===----------------------------------------------------------------------===//

cv.cmple.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmple.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmple.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmple.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmple.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmple.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmple.sci.h
//===----------------------------------------------------------------------===//

cv.cmple.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmple.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmple.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmple.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmple.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmple.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmple.sci.b
//===----------------------------------------------------------------------===//

cv.cmple.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmple.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmple.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmple.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmple.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmple.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

