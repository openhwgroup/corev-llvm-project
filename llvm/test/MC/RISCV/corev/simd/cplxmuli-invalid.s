# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.cplxmul.i
//===----------------------------------------------------------------------===//

cv.cplxmul.i 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cplxmul.i.div2
//===----------------------------------------------------------------------===//

cv.cplxmul.i.div2 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i.div2 t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i.div2 t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i.div2 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i.div2 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i.div2 t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cplxmul.i.div4
//===----------------------------------------------------------------------===//

cv.cplxmul.i.div4 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i.div4 t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i.div4 t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i.div4 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i.div4 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i.div4 t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.cplxmul.i.div8
//===----------------------------------------------------------------------===//

cv.cplxmul.i.div8 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i.div8 t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i.div8 t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i.div8 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i.div8 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.cplxmul.i.div8 t0, t1
# CHECK-ERROR: too few operands for instruction

