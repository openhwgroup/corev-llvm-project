# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.srl.h
//===----------------------------------------------------------------------===//

cv.srl.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.srl.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.srl.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.srl.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.srl.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.srl.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.srl.b
//===----------------------------------------------------------------------===//

cv.srl.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.srl.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.srl.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.srl.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.srl.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.srl.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.srl.sc.h
//===----------------------------------------------------------------------===//

cv.srl.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.srl.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.srl.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.srl.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.srl.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.srl.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.srl.sc.b
//===----------------------------------------------------------------------===//

cv.srl.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.srl.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.srl.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.srl.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.srl.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.srl.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.srl.sci.h
//===----------------------------------------------------------------------===//

cv.srl.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.srl.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.srl.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.srl.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.srl.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.srl.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.srl.sci.b
//===----------------------------------------------------------------------===//

cv.srl.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.srl.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.srl.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.srl.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.srl.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.srl.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

