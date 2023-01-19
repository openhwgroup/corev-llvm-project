# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.cplxmul.r
//===----------------------------------------------------------------------===//

cv.cplxmul.r 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cplxmul.r.div2
//===----------------------------------------------------------------------===//

cv.cplxmul.r.div2 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r.div2 t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r.div2 t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r.div2 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r.div2 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r.div2 t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cplxmul.r.div4
//===----------------------------------------------------------------------===//

cv.cplxmul.r.div4 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r.div4 t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r.div4 t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r.div4 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r.div4 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r.div4 t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cplxmul.r.div8
//===----------------------------------------------------------------------===//

cv.cplxmul.r.div8 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r.div8 t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r.div8 t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r.div8 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r.div8 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.r.div8 t0, t1
# CHECK-ERROR: too few operands for instruction

