# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.sub.h
//===----------------------------------------------------------------------===//

cv.sub.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sub.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sub.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sub.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sub.b
//===----------------------------------------------------------------------===//

cv.sub.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sub.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sub.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sub.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sub.sc.h
//===----------------------------------------------------------------------===//

cv.sub.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sub.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sub.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sub.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sub.sc.b
//===----------------------------------------------------------------------===//

cv.sub.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sub.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sub.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sub.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sub.sci.h
//===----------------------------------------------------------------------===//

cv.sub.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sub.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sub.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sub.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sub.sci.b
//===----------------------------------------------------------------------===//

cv.sub.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sub.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sub.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sub.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sub.div2
//===----------------------------------------------------------------------===//

cv.sub.div2 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.div2 t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.div2 t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sub.div2 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sub.div2 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sub.div2 t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sub.div4
//===----------------------------------------------------------------------===//

cv.sub.div4 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.div4 t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.div4 t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sub.div4 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sub.div4 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sub.div4 t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sub.div8
//===----------------------------------------------------------------------===//

cv.sub.div8 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.div8 t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sub.div8 t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sub.div8 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sub.div8 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sub.div8 t0, t1
# CHECK-ERROR: too few operands for instruction

