# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.cmpgt.h
//===----------------------------------------------------------------------===//

cv.cmpgt.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpgt.b
//===----------------------------------------------------------------------===//

cv.cmpgt.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpgt.sc.h
//===----------------------------------------------------------------------===//

cv.cmpgt.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpgt.sc.b
//===----------------------------------------------------------------------===//

cv.cmpgt.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpgt.sci.h
//===----------------------------------------------------------------------===//

cv.cmpgt.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgt.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgt.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgt.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpgt.sci.b
//===----------------------------------------------------------------------===//

cv.cmpgt.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgt.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgt.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgt.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgt.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

