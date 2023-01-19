# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.pack
//===----------------------------------------------------------------------===//

cv.pack 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.pack t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.pack t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.pack t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.pack t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.pack t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.pack.h
//===----------------------------------------------------------------------===//

cv.pack.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.pack.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.pack.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.pack.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.pack.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.pack.h t0, t1
# CHECK-ERROR: too few operands for instruction

