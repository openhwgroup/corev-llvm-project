# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.packhi.b
//===----------------------------------------------------------------------===//

cv.packhi.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.packhi.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.packhi.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.packhi.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.packhi.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.packhi.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.packlo.b
//===----------------------------------------------------------------------===//

cv.packlo.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.packlo.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.packlo.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.packlo.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.packlo.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.packlo.b t0, t1
# CHECK-ERROR: too few operands for instruction

