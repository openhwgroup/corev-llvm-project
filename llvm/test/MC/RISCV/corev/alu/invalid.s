# RUN: not llvm-mc -triple=riscv32 %s 2>&1 \
# RUN:        | FileCheck %s --check-prefix=CHECK-ERROR

# ALU instructions

cv.abs t0, t1
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.slet t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.sletu t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.min t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.minu t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.max t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.maxu t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.exths t0, t1
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.exthz t0, t1
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.extbs t0, t1
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.extbz t0, t1
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)


cv.clip t0, t1, 5
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.clipu t0, t1, 5
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.clipr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.clipur t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)


cv.addn t0, t1, t2, 5
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.addun t0, t1, t2, 5
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.addrn t0, t1, t2, 5
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.addurn t0, t1, t2, 5
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.subn t0, t1, t2, 5
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.subun t0, t1, t2, 5
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.subrn t0, t1, t2, 5
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.suburn t0, t1, t2, 5
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.addnr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.addunr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.addrnr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.addurnr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.subnr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.subunr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.subrnr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.suburnr t0, t1, t2
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)


cv.beqimm t0, 0, 0
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)

cv.bneimm t0, 0, 0
# CHECK-ERROR: instruction requires the following: 'Xcorevalu' (ALU Operations)
