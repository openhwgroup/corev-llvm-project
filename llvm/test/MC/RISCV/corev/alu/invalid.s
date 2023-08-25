# RUN: not llvm-mc -triple=riscv32 %s 2>&1 \
# RUN:        | FileCheck %s --check-prefix=CHECK-ERROR

# ALU instructions

cv.abs t0, t1
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.sle t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.sleu t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.slet t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.sletu t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.min t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.minu t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.max t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.maxu t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.exths t0, t1
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.exthz t0, t1
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.extbs t0, t1
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.extbz t0, t1
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)


cv.clip t0, t1, 5
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.clipu t0, t1, 5
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.clipr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.clipur t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)


cv.addN t0, t1, t2, 5
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.adduN t0, t1, t2, 5
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.addRN t0, t1, t2, 5
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.adduRN t0, t1, t2, 5
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.subN t0, t1, t2, 5
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.subuN t0, t1, t2, 5
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.subRN t0, t1, t2, 5
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.subuRN t0, t1, t2, 5
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.addNr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.adduNr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.addRNr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.adduRNr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.subNr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.subuNr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.subRNr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)

cv.subuRNr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcvalu' (ALU Operations)
