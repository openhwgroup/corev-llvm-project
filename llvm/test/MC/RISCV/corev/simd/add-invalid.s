# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.add.h
//===----------------------------------------------------------------------===//

cv.add.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.add.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.add.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.add.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.add.b
//===----------------------------------------------------------------------===//

cv.add.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.add.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.add.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.add.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.add.sc.h
//===----------------------------------------------------------------------===//

cv.add.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.add.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.add.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.add.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.add.sc.b
//===----------------------------------------------------------------------===//

cv.add.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.add.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.add.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.add.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.add.sci.h
//===----------------------------------------------------------------------===//

cv.add.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.add.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.add.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.add.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.add.sci.b
//===----------------------------------------------------------------------===//

cv.add.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.add.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.add.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.add.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.add.div2
//===----------------------------------------------------------------------===//

cv.add.div2 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.div2 t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.div2 t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.add.div2 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.add.div2 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.add.div2 t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.add.div4
//===----------------------------------------------------------------------===//

cv.add.div4 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.div4 t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.div4 t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.add.div4 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.add.div4 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.add.div4 t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.add.div8
//===----------------------------------------------------------------------===//

cv.add.div8 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.div8 t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.add.div8 t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.add.div8 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.add.div8 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.add.div8 t0, t1
# CHECK-ERROR: too few operands for instruction

