# RUN: not llvm-mc -triple=riscv32 %s 2>&1 \
# RUN:        | FileCheck %s --check-prefix=CHECK-ERROR

cv.starti 0, 0
# CHECK-ERROR: instruction requires the following: 'XCoreVHwlp' (Hardware Loop)

cv.endi 0, 0
# CHECK-ERROR: instruction requires the following: 'XCoreVHwlp' (Hardware Loop)

cv.count 0, zero
# CHECK-ERROR: instruction requires the following: 'XCoreVHwlp' (Hardware Loop)

cv.counti 0, 0
# CHECK-ERROR: instruction requires the following: 'XCoreVHwlp' (Hardware Loop)

cv.setup 0, zero, 0
# CHECK-ERROR: instruction requires the following: 'XCoreVHwlp' (Hardware Loop)

cv.setupi 0, 0, 0
# CHECK-ERROR: instruction requires the following: 'XCoreVHwlp' (Hardware Loop)
