; RUN: llc -O0 -mtriple=riscv32 -mattr=+xcvbi -verify-machineinstrs -o %T/non-optimized.s < %s
; RUN: FileCheck %s --check-prefixes=CHECK,CHECK_NOPT -input-file=%T/non-optimized.s
; RUN: llc -O3 -mtriple=riscv32 -mattr=+xcvbi -verify-machineinstrs -o %T/optimized.s < %s
; RUN: FileCheck %s --check-prefixes=CHECK,CHECK_OPT -input-file=%T/optimized.s

define i32 @beqimm(i32 %a) {
; CHECK-LABEL:     beqimm:
; CHECK:           # %bb.0:
; CHECK_NOPT-NEXT:     cv.beqimm a0, 5, .LBB0_2
; CHECK_OPT-NEXT:      cv.bneimm a0, 5, .LBB0_2
; CHECK_NOPT-NEXT:     j .LBB0_1
; CHECK_NOPT-NEXT: .LBB0_1: # %f
; CHECK_OPT-NEXT:  # %bb.1: # %t
; CHECK_NOPT-NEXT:    li a0, 0
; CHECK_OPT-NEXT:     li a0, 1
; CHECK-NEXT:         ret
; CHECK_NOPT-NEXT:      .LBB0_2: # %t
; CHECK_OPT-NEXT:      .LBB0_2: # %f
; CHECK_NOPT-NEXT:    li a0, 1
; CHECK_OPT-NEXT:     li a0, 0
; CHECK-NEXT:         ret
  %1 = icmp eq i32 %a, 5
  br i1 %1, label %t, label %f
f:
  ret i32 0
t:
  ret i32 1
}

define i32 @bneimm(i32 %a) {
; CHECK-LABEL:     bneimm:
; CHECK:           # %bb.0:
; CHECK_NOPT-NEXT:     cv.bneimm a0, 5, .LBB1_2
; CHECK_OPT-NEXT:      cv.beqimm a0, 5, .LBB1_2
; CHECK_NOPT-NEXT:     j .LBB1_1
; CHECK_NOPT-NEXT: .LBB1_1: # %f
; CHECK_OPT-NEXT:  # %bb.1: # %t
; CHECK_NOPT-NEXT:     li a0, 0
; CHECK_OPT-NEXT:      li a0, 1
; CHECK-NEXT:          ret
; CHECK_NOPT-NEXT: .LBB1_2: # %t
; CHECK_OPT-NEXT:  .LBB1_2: # %f
; CHECK_NOPT-NEXT:     li a0, 1
; CHECK_OPT-NEXT:      li a0, 0
; CHECK-NEXT:          ret
  %1 = icmp ne i32 %a, 5
  br i1 %1, label %t, label %f
f:
  ret i32 0
t:
  ret i32 1
}
