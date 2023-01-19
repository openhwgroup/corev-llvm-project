# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.shuffleI0.sci.b
//===----------------------------------------------------------------------===//

cv.shuffleI0.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffleI0.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffleI0.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.shuffleI0.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.shuffleI0.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.shuffleI0.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.shuffleI1.sci.b
//===----------------------------------------------------------------------===//

cv.shuffleI1.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffleI1.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffleI1.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.shuffleI1.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.shuffleI1.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.shuffleI1.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.shuffleI2.sci.b
//===----------------------------------------------------------------------===//

cv.shuffleI2.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffleI2.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffleI2.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.shuffleI2.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.shuffleI2.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.shuffleI2.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.shuffleI3.sci.b
//===----------------------------------------------------------------------===//

cv.shuffleI3.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffleI3.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.shuffleI3.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.shuffleI3.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.shuffleI3.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.shuffleI3.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

