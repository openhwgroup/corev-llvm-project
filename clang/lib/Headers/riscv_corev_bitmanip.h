/*===---- riscv_corev_bitmanip.h - CORE-V bit manipulation intrinsics ------===
 *
 * Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
 * See https://llvm.org/LICENSE.txt for license information.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 *
 *===-----------------------------------------------------------------------===
 */

#ifndef __RISCV_COREV_BITMANIP_H
#define __RISCV_COREV_BITMANIP_H

#include <stdint.h>

#if defined(__cplusplus)
extern "C" {
#endif

#if defined(__riscv_xcvbitmanip)

#define __DEFAULT_FN_ATTRS __attribute__((__always_inline__, __nodebug__))

long __DEFAULT_FN_ATTRS __riscv_cv_bitmanip_extract(long a, uint16_t range) {
  return __builtin_riscv_cv_bitmanip_extract(a, range);
}

unsigned long __DEFAULT_FN_ATTRS __riscv_cv_bitmanip_extractu(unsigned long a, uint16_t range) {
  return __builtin_riscv_cv_bitmanip_extractu(a, range);
}

unsigned long __DEFAULT_FN_ATTRS __riscv_cv_bitmanip_insert(unsigned long a, uint16_t range,
                                         unsigned long k) {
  return __builtin_riscv_cv_bitmanip_insert(a, range, k);
}

unsigned long __DEFAULT_FN_ATTRS __riscv_cv_bitmanip_bclr(unsigned long a, uint16_t range) {
  return __builtin_riscv_cv_bitmanip_bclr(a, range);
}

unsigned long __DEFAULT_FN_ATTRS __riscv_cv_bitmanip_bset(unsigned long a, uint16_t range) {
  return __builtin_riscv_cv_bitmanip_bset(a, range);
}

uint8_t __DEFAULT_FN_ATTRS __riscv_cv_bitmanip_ff1(unsigned long a) {
  return __builtin_riscv_cv_bitmanip_ff1(a);
}

uint8_t __DEFAULT_FN_ATTRS __riscv_cv_bitmanip_fl1(unsigned long a) {
  return __builtin_riscv_cv_bitmanip_fl1(a);
}

uint8_t __DEFAULT_FN_ATTRS __riscv_cv_bitmanip_clb(unsigned long a) {
  return __builtin_riscv_cv_bitmanip_clb(a);
}

uint8_t __DEFAULT_FN_ATTRS __riscv_cv_bitmanip_cnt(unsigned long a) {
  return __builtin_riscv_cv_bitmanip_cnt(a);
}

unsigned long __DEFAULT_FN_ATTRS __riscv_cv_bitmanip_ror(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_bitmanip_ror(a, b);
}

#define __riscv_cv_bitmanip_bitrev(rs1, PTS, RADIX) \
  (unsigned long) __builtin_riscv_cv_bitmanip_bitrev((unsigned long) (rs1), \
                                 (const uint8_t) (PTS), (const uint8_t) (RADIX))

#endif // defined(__riscv_xcvbitmanip)

#if defined(__cplusplus)
}
#endif

#endif // define __RISCV_COREV_BITMANIP_H
