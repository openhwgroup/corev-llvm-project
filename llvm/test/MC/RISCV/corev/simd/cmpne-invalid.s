# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.cmpne.h
//===----------------------------------------------------------------------===//

cv.cmpne.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpne.b
//===----------------------------------------------------------------------===//

cv.cmpne.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpne.sc.h
//===----------------------------------------------------------------------===//

cv.cmpne.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpne.sc.b
//===----------------------------------------------------------------------===//

cv.cmpne.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpne.sci.h
//===----------------------------------------------------------------------===//

cv.cmpne.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpne.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpne.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpne.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpne.sci.b
//===----------------------------------------------------------------------===//

cv.cmpne.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpne.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpne.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpne.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpne.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

