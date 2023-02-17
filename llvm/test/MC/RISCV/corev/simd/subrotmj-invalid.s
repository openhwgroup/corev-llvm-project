# RUN: not llvm-mc -triple=riscv32 --mattr=+xcvsimd %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ERROR

//===----------------------------------------------------------------------===//
// cv.subrotmj
//===----------------------------------------------------------------------===//

cv.subrotmj 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.subrotmj.div2
//===----------------------------------------------------------------------===//

cv.subrotmj.div2 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj.div2 t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj.div2 t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj.div2 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj.div2 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj.div2 t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.subrotmj.div4
//===----------------------------------------------------------------------===//

cv.subrotmj.div4 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj.div4 t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj.div4 t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj.div4 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj.div4 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj.div4 t0, t1
# CHECK-ERROR: too few operands for instruction

//===----------------------------------------------------------------------===//
// cv.subrotmj.div8
//===----------------------------------------------------------------------===//

cv.subrotmj.div8 0, t1, t2
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj.div8 t0, 0, t2
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj.div8 t0, t1, t2, t3
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj.div8 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj.div8 t0, t1, 0
# CHECK-ERROR: invalid operand for instruction

cv.subrotmj.div8 t0, t1
# CHECK-ERROR: too few operands for instruction

