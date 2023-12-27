// RUN: %clang_cc1 %s -triple=riscv32 -target-feature +xcvsimd -fsyntax-only -verify
#include <stdint.h>

uint32_t test_add_h(uint32_t a, uint32_t b) {
    return __builtin_riscv_cv_simd_add_h(a, b, 4);  // expected-error {{argument value 4 is outside the valid range [0, 3]}}
}

uint32_t test_add_h_negative(uint32_t a, uint32_t b) {
    return __builtin_riscv_cv_simd_add_h(a, b, -1); // expected-error {{argument value 255 is outside the valid range [0, 3]}}
}

uint32_t test_sub_h(uint32_t a, uint32_t b) {
    return __builtin_riscv_cv_simd_sub_h(a, b, 4);  // expected-error {{argument value 4 is outside the valid range [0, 3]}}
}

uint32_t test_sub_h_negative(uint32_t a, uint32_t b) {
    return __builtin_riscv_cv_simd_sub_h(a, b, -1); // expected-error {{argument value 255 is outside the valid range [0, 3]}}
}

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

uint32_t test_shuffle_sci_h(uint32_t a) {
    return __builtin_riscv_cv_simd_shuffle_sci_h(a, 4);  // expected-error {{argument value 4 is outside the valid range [0, 3]}}
}

uint32_t test_shuffle_sci_h_negative(uint32_t a) {
    return __builtin_riscv_cv_simd_shuffle_sci_h(a, -1);  // expected-error {{argument value 255 is outside the valid range [0, 3]}}
}

uint32_t test_cplxmul_r(uint32_t a, uint32_t b, uint32_t c) {
    return __builtin_riscv_cv_simd_cplxmul_r(a, b, c, 4);  // expected-error {{argument value 4 is outside the valid range [0, 3]}}
}

uint32_t test_cplxmul_r_negative(uint32_t a, uint32_t b, uint32_t c) {
    return __builtin_riscv_cv_simd_cplxmul_r(a, b, c, -1); // expected-error {{argument value 255 is outside the valid range [0, 3]}}
}

uint32_t test_cplxmul_i(uint32_t a, uint32_t b, uint32_t c) {
    return __builtin_riscv_cv_simd_cplxmul_i(a, b, c, 4);  // expected-error {{argument value 4 is outside the valid range [0, 3]}}
}

uint32_t test_cplxmul_i_negative(uint32_t a, uint32_t b, uint32_t c) {
    return __builtin_riscv_cv_simd_cplxmul_i(a, b, c, -1); // expected-error {{argument value 255 is outside the valid range [0, 3]}}
}

uint32_t test_subrotmj(uint32_t a, uint32_t b) {
    return __builtin_riscv_cv_simd_subrotmj(a, b, 4);  // expected-error {{argument value 4 is outside the valid range [0, 3]}}
}

uint32_t test_subrotmj_negative(uint32_t a, uint32_t b) {
    return __builtin_riscv_cv_simd_subrotmj(a, b, -1); // expected-error {{argument value 255 is outside the valid range [0, 3]}}
}
