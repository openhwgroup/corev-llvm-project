# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.extract.h
//===----------------------------------------------------------------------===//

cv.extract.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.extract.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.extract.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.extract.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.extract.h t0, t1, -1
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.extract.h t0, t1, 64
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.extract.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.extract.b
//===----------------------------------------------------------------------===//

cv.extract.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.extract.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.extract.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.extract.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.extract.b t0, t1, -1
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.extract.b t0, t1, 64
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.extract.b t0, t1
# CHECK-ERROR: too few operands for instruction

