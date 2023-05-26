# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.xor.h
//===----------------------------------------------------------------------===//

cv.xor.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.xor.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.xor.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.xor.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.xor.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.xor.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.xor.b
//===----------------------------------------------------------------------===//

cv.xor.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.xor.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.xor.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.xor.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.xor.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.xor.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.xor.sc.h
//===----------------------------------------------------------------------===//

cv.xor.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.xor.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.xor.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.xor.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.xor.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.xor.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.xor.sc.b
//===----------------------------------------------------------------------===//

cv.xor.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.xor.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.xor.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.xor.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.xor.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.xor.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.xor.sci.h
//===----------------------------------------------------------------------===//

cv.xor.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.xor.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.xor.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.xor.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.xor.sci.h t0, t1, -1
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.xor.sci.h t0, t1, 64
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.xor.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.xor.sci.b
//===----------------------------------------------------------------------===//

cv.xor.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.xor.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.xor.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.xor.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.xor.sci.b t0, t1, -1
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.xor.sci.b t0, t1, 64
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.xor.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

