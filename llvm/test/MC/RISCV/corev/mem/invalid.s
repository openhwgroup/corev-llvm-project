# RUN: not llvm-mc -triple=riscv32 %s 2>&1 \
# RUN:        | FileCheck %s --check-prefix=CHECK-ERROR

# Load instructions

cv.lb t0, 0(t1!)
# CHECK-ERROR: expected ')'

cv.lbu t0, 0(t1!)
# CHECK-ERROR: expected ')'

cv.lh t0, 0(t1!)
# CHECK-ERROR: expected ')'

cv.lhu t0, 0(t1!)
# CHECK-ERROR: expected ')'

cv.lw t0, 0(t1!)
# CHECK-ERROR: expected ')'


cv.lb t0, t2(t1!)
# CHECK-ERROR: unexpected token

cv.lbu t0, t2(t1!)
# CHECK-ERROR: unexpected token

cv.lh t0, t2(t1!)
# CHECK-ERROR: unexpected token

cv.lhu t0, t2(t1!)
# CHECK-ERROR: unexpected token

cv.lw t0, t2(t1!)
# CHECK-ERROR: unexpected token


cv.lb t0, t2(t1)
# CHECK-ERROR: unexpected token

cv.lbu t0, t2(t1)
# CHECK-ERROR: unexpected token

cv.lh t0, t2(t1)
# CHECK-ERROR: unexpected token

cv.lhu t0, t2(t1)
# CHECK-ERROR: unexpected token

cv.lw t0, t2(t1)
# CHECK-ERROR: unexpected token


# Store instructions

cv.sb t0, 0(t1!)
# CHECK-ERROR: expected ')'

cv.sh t0, 0(t1!)
# CHECK-ERROR: expected ')'

cv.sw t0, 0(t1!)
# CHECK-ERROR: expected ')'


cv.sb t0, t2(t1!)
# CHECK-ERROR: unexpected token

cv.sh t0, t2(t1!)
# CHECK-ERROR: unexpected token

cv.sw t0, t2(t1!)
# CHECK-ERROR: unexpected token


cv.sb t0, t2(t1)
# CHECK-ERROR: unexpected token

cv.sh t0, t2(t1)
# CHECK-ERROR: unexpected token

cv.sw t0, t2(t1)
# CHECK-ERROR: unexpected token
