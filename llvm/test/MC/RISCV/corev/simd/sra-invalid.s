# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.sra.h
//===----------------------------------------------------------------------===//

cv.sra.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sra.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sra.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sra.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sra.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sra.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sra.b
//===----------------------------------------------------------------------===//

cv.sra.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sra.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sra.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sra.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sra.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sra.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sra.sc.h
//===----------------------------------------------------------------------===//

cv.sra.sc.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sra.sc.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sra.sc.h t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sra.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sra.sc.h t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sra.sc.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sra.sc.b
//===----------------------------------------------------------------------===//

cv.sra.sc.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sra.sc.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sra.sc.b t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.sra.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sra.sc.b t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.sra.sc.b t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sra.sci.h
//===----------------------------------------------------------------------===//

cv.sra.sci.h 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sra.sci.h t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sra.sci.h t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sra.sci.h t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sra.sci.h t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sra.sci.h t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.sra.sci.b
//===----------------------------------------------------------------------===//

cv.sra.sci.b 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.sra.sci.b t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.sra.sci.b t0, t1, t2, t3
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sra.sci.b t0, t1, t2
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sra.sci.b t0, t1, 63
# CHECK-ERROR: immediate must be an integer in the range [-32, 31]

cv.sra.sci.b t0, t1
# CHECK-ERROR: too few operands for instruction

