# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.sdotup.h
//===----------------------------------------------------------------------===//

cv.sdotup.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sdotup.b
//===----------------------------------------------------------------------===//

cv.sdotup.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sdotup.sc.h
//===----------------------------------------------------------------------===//

cv.sdotup.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sdotup.sc.b
//===----------------------------------------------------------------------===//

cv.sdotup.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sdotup.sci.h
//===----------------------------------------------------------------------===//

cv.sdotup.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotup.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotup.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotup.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sdotup.sci.b
//===----------------------------------------------------------------------===//

cv.sdotup.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotup.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotup.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotup.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotup.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

