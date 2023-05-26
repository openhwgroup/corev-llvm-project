# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.or.h
//===----------------------------------------------------------------------===//

cv.or.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.or.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.or.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.or.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.or.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.or.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.or.b
//===----------------------------------------------------------------------===//

cv.or.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.or.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.or.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.or.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.or.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.or.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.or.sc.h
//===----------------------------------------------------------------------===//

cv.or.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.or.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.or.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.or.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.or.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.or.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.or.sc.b
//===----------------------------------------------------------------------===//

cv.or.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.or.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.or.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.or.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.or.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.or.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.or.sci.h
//===----------------------------------------------------------------------===//

cv.or.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.or.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.or.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.or.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.or.sci.h t0, t1, -1
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.or.sci.h t0, t1, 64
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.or.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.or.sci.b
//===----------------------------------------------------------------------===//

cv.or.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.or.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.or.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.or.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.or.sci.b t0, t1, -1
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.or.sci.b t0, t1, 64
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.or.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

