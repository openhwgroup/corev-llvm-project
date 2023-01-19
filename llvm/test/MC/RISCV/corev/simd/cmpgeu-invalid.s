# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.cmpgeu.h
//===----------------------------------------------------------------------===//

cv.cmpgeu.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpgeu.b
//===----------------------------------------------------------------------===//

cv.cmpgeu.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpgeu.sc.h
//===----------------------------------------------------------------------===//

cv.cmpgeu.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpgeu.sc.b
//===----------------------------------------------------------------------===//

cv.cmpgeu.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpgeu.sci.h
//===----------------------------------------------------------------------===//

cv.cmpgeu.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgeu.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgeu.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgeu.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cmpgeu.sci.b
//===----------------------------------------------------------------------===//

cv.cmpgeu.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cmpgeu.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgeu.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgeu.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.cmpgeu.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

