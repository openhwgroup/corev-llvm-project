// RUN: %clang_cc1 -triple riscv32 -target-feature +xcvelw -emit-llvm %s -o - \
// RUN:     | FileCheck %s

#include <stdint.h>
#include <riscv_corev_elw.h>

// CHECK-LABEL: @test_elw
// CHECK: @llvm.riscv.cv.elw.elw
uint32_t test_elw(void *a) {
	return __riscv_cv_elw_elw(a);
}
