# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.extractu.h
//===----------------------------------------------------------------------===//

cv.extractu.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.extractu.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.extractu.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.extractu.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.extractu.h t0, t1, -1
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.extractu.h t0, t1, 64
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.extractu.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.extractu.b
//===----------------------------------------------------------------------===//

cv.extractu.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.extractu.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.extractu.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.extractu.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.extractu.b t0, t1, -1
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.extractu.b t0, t1, 64
# CHECK-ERROR: immediate must be an integer in the range [0, 63]

cv.extractu.b t0, t1
# CHECK-ERROR: too few operands for instruction

