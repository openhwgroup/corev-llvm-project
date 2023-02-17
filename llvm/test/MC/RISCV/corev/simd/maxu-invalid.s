# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.maxu.h
//===----------------------------------------------------------------------===//

cv.maxu.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.maxu.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.maxu.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.maxu.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.maxu.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.maxu.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.maxu.b
//===----------------------------------------------------------------------===//

cv.maxu.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.maxu.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.maxu.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.maxu.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.maxu.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.maxu.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.maxu.sc.h
//===----------------------------------------------------------------------===//

cv.maxu.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.maxu.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.maxu.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.maxu.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.maxu.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.maxu.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.maxu.sc.b
//===----------------------------------------------------------------------===//

cv.maxu.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.maxu.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.maxu.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.maxu.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.maxu.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.maxu.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.maxu.sci.h
//===----------------------------------------------------------------------===//

cv.maxu.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.maxu.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.maxu.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.maxu.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.maxu.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.maxu.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.maxu.sci.b
//===----------------------------------------------------------------------===//

cv.maxu.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.maxu.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.maxu.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.maxu.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.maxu.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.maxu.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

