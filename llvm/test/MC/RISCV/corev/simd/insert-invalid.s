# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.insert.h
//===----------------------------------------------------------------------===//

cv.insert.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.insert.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.insert.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.insert.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.insert.h t0, t1, -1
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.insert.h t0, t1, 64
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.insert.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.insert.b
//===----------------------------------------------------------------------===//

cv.insert.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.insert.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.insert.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.insert.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.insert.b t0, t1, -1
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.insert.b t0, t1, 64
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.insert.b t0, t1
# CHECK-ERROR: too few operands for instruction

