// RUN: %clang_cc1 %s -triple=riscv32 -target-feature +xcvsimd -fsyntax-only -verify
#include <stdint.h>

uint32_t test_extract_h(uint32_t a) {
	return __builtin_riscv_cv_simd_extract_h(a, 2); // expected-error {{argument value 2 is outside the valid range [0, 1]}}
}

uint32_t test_extract_h_negative(uint32_t a) {
	return __builtin_riscv_cv_simd_extract_h(a, -1); // expected-error {{argument value 255 is outside the valid range [0, 1]}}
}

uint32_t test_extractu_h(uint32_t a) {
	return __builtin_riscv_cv_simd_extractu_h(a, 2); // expected-error {{argument value 2 is outside the valid range [0, 1]}}
}

uint32_t test_extractu_h_negative(uint32_t a) {
	return __builtin_riscv_cv_simd_extractu_h(a, -1); // expected-error {{argument value 255 is outside the valid range [0, 1]}}
}

uint32_t test_extract_b(uint32_t a) {
	return __builtin_riscv_cv_simd_extract_b(a, 4); // expected-error {{argument value 4 is outside the valid range [0, 3]}}
}

uint32_t test_extract_b_negative(uint32_t a) {
	return __builtin_riscv_cv_simd_extract_b(a, -1); // expected-error {{argument value 255 is outside the valid range [0, 3]}}
}

uint32_t test_extractu_b(uint32_t a) {
	return __builtin_riscv_cv_simd_extractu_b(a, 4); // expected-error {{argument value 4 is outside the valid range [0, 3]}}
}

uint32_t test_extractu_b_negative(uint32_t a) {
	return __builtin_riscv_cv_simd_extractu_b(a, -1); // expected-error {{argument value 255 is outside the valid range [0, 3]}}
}

uint32_t test_insert_h(uint32_t dst, uint8_t a) {
    return __builtin_riscv_cv_simd_insert_h(dst, a, 2);  // expected-error {{argument value 2 is outside the valid range [0, 1]}}
}

uint32_t test_insert_h_negative(uint32_t dst, uint8_t a) {
    return __builtin_riscv_cv_simd_insert_h(dst, a, -1); // expected-error {{argument value 255 is outside the valid range [0, 1]}}
}

uint32_t test_insert_b(uint32_t dst, uint8_t a) {
    return __builtin_riscv_cv_simd_insert_b(dst, a, 4);  // expected-error {{argument value 4 is outside the valid range [0, 3]}}
}

uint32_t test_insert_b_negative(uint32_t dst, uint8_t a) {
    return __builtin_riscv_cv_simd_insert_b(dst, a, -1); // expected-error {{argument value 255 is outside the valid range [0, 3]}}
}
