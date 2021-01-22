# RUN: not llvm-mc -triple=riscv32 %s 2>&1 \
# RUN:        | FileCheck %s --check-prefix=CHECK-ERROR

cv.mac t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.msu t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

# MUL instructions

cv.muls t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.mulhhs t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.mulsn t0, t1, t2, 0
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.mulhhsn t0, t1, t2, 0
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.mulsrn t0, t1, t2, 1
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.mulhhsrn t0, t1, t2, 1
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.mulu t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.mulhhu t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.mulun t0, t1, t2, 0
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.mulhhun t0, t1, t2, 0
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.mulurn t0, t1, t2, 1
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.mulhhurn t0, t1, t2, 1
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

# MAC instructions

cv.macsn t0, t1, t2, 0
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.machhsn t0, t1, t2, 0
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.macsrn t0, t1, t2, 1
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.machhsrn t0, t1, t2, 1
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.macun t0, t1, t2, 0
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.machhun t0, t1, t2, 0
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.macurn t0, t1, t2, 1
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)

cv.machhurn t0, t1, t2, 1
# CHECK-ERROR: instruction requires the following: 'Xcorevmac' (Multiply-Accumulate)
