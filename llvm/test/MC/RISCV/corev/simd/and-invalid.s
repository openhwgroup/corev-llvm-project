# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.and.h
//===----------------------------------------------------------------------===//

cv.and.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.and.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.and.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.and.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.and.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.and.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.and.b
//===----------------------------------------------------------------------===//

cv.and.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.and.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.and.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.and.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.and.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.and.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.and.sc.h
//===----------------------------------------------------------------------===//

cv.and.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.and.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.and.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.and.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.and.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.and.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.and.sc.b
//===----------------------------------------------------------------------===//

cv.and.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.and.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.and.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.and.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.and.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.and.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.and.sci.h
//===----------------------------------------------------------------------===//

cv.and.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.and.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.and.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.and.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.and.sci.h t0, t1, -1
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.and.sci.h t0, t1, 64
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.and.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.and.sci.b
//===----------------------------------------------------------------------===//

cv.and.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.and.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.and.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.and.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.and.sci.b t0, t1, -1
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.and.sci.b t0, t1, 64
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.and.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

