# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.sdotsp.h
//===----------------------------------------------------------------------===//

cv.sdotsp.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sdotsp.b
//===----------------------------------------------------------------------===//

cv.sdotsp.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sdotsp.sc.h
//===----------------------------------------------------------------------===//

cv.sdotsp.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sdotsp.sc.b
//===----------------------------------------------------------------------===//

cv.sdotsp.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sdotsp.sci.h
//===----------------------------------------------------------------------===//

cv.sdotsp.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotsp.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotsp.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotsp.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sdotsp.sci.b
//===----------------------------------------------------------------------===//

cv.sdotsp.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sdotsp.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotsp.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotsp.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sdotsp.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

