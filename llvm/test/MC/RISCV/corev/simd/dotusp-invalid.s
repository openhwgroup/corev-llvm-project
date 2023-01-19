# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.dotusp.h
//===----------------------------------------------------------------------===//

cv.dotusp.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.dotusp.b
//===----------------------------------------------------------------------===//

cv.dotusp.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.dotusp.sc.h
//===----------------------------------------------------------------------===//

cv.dotusp.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.dotusp.sc.b
//===----------------------------------------------------------------------===//

cv.dotusp.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.dotusp.sci.h
//===----------------------------------------------------------------------===//

cv.dotusp.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotusp.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotusp.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotusp.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.dotusp.sci.b
//===----------------------------------------------------------------------===//

cv.dotusp.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.dotusp.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotusp.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotusp.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.dotusp.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

