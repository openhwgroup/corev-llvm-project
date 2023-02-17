# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.sll.h
//===----------------------------------------------------------------------===//

cv.sll.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sll.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sll.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sll.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sll.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sll.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sll.b
//===----------------------------------------------------------------------===//

cv.sll.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sll.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sll.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sll.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sll.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sll.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sll.sc.h
//===----------------------------------------------------------------------===//

cv.sll.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sll.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sll.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sll.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sll.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sll.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sll.sc.b
//===----------------------------------------------------------------------===//

cv.sll.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sll.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sll.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sll.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sll.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sll.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sll.sci.h
//===----------------------------------------------------------------------===//

cv.sll.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sll.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sll.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sll.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sll.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sll.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sll.sci.b
//===----------------------------------------------------------------------===//

cv.sll.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sll.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sll.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sll.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sll.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sll.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

