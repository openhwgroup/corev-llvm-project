/*===---- riscv_corev_simd.h - CORE-V SIMD intrinsics ----------------------===
 *
 * Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
 * See https://llvm.org/LICENSE.txt for license information.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 *
 *===-----------------------------------------------------------------------===
 */

#ifndef __RISCV_COREV_SIMD_H
#define __RISCV_COREV_SIMD_H

#include <stdint.h>

#if defined(__cplusplus)
extern "C" {
#endif

#if defined(__riscv_xcvsimd)

#define __DEFAULT_FN_ATTRS __attribute__((__always_inline__, __nodebug__))

#define __riscv_cv_simd_add_h(rs1, rs2, DIV) \
  (unsigned long) __builtin_riscv_cv_simd_add_h((unsigned long) (rs1), \
                                   (unsigned long) (rs2), (const uint8_t) (DIV))

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_add_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_add_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_add_sc_h(unsigned long a, int16_t b) {
  return __builtin_riscv_cv_simd_add_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_add_sc_b(unsigned long a, int8_t b) {
  return __builtin_riscv_cv_simd_add_sc_b(a, b);
}

#define __riscv_cv_simd_sub_h(rs1, rs2, DIV) \
  (unsigned long) __builtin_riscv_cv_simd_sub_h((unsigned long) (rs1), \
                                   (unsigned long) (rs2), (const uint8_t) (DIV))

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_sub_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_sub_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_sub_sc_h(unsigned long a, int16_t b) {
  return __builtin_riscv_cv_simd_sub_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_sub_sc_b(unsigned long a, int8_t b) {
  return __builtin_riscv_cv_simd_sub_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_avg_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_avg_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_avg_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_avg_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_avg_sc_h(unsigned long a, int16_t b) {
  return __builtin_riscv_cv_simd_avg_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_avg_sc_b(unsigned long a, int8_t b) {
  return __builtin_riscv_cv_simd_avg_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_avgu_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_avgu_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_avgu_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_avgu_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_avgu_sc_h(unsigned long a, uint16_t b) {
  return __builtin_riscv_cv_simd_avgu_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_avgu_sc_b(unsigned long a, uint8_t b) {
  return __builtin_riscv_cv_simd_avgu_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_min_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_min_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_min_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_min_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_min_sc_h(unsigned long a, int16_t b) {
  return __builtin_riscv_cv_simd_min_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_min_sc_b(unsigned long a, int8_t b) {
  return __builtin_riscv_cv_simd_min_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_minu_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_minu_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_minu_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_minu_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_minu_sc_h(unsigned long a, uint16_t b) {
  return __builtin_riscv_cv_simd_minu_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_minu_sc_b(unsigned long a, uint8_t b) {
  return __builtin_riscv_cv_simd_minu_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_max_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_max_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_max_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_max_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_max_sc_h(unsigned long a, int16_t b) {
  return __builtin_riscv_cv_simd_max_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_max_sc_b(unsigned long a, int8_t b) {
  return __builtin_riscv_cv_simd_max_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_maxu_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_maxu_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_maxu_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_maxu_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_maxu_sc_h(unsigned long a, uint16_t b) {
  return __builtin_riscv_cv_simd_maxu_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_maxu_sc_b(unsigned long a, uint8_t b) {
  return __builtin_riscv_cv_simd_maxu_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_srl_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_srl_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_srl_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_srl_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_srl_sc_h(unsigned long a, uint8_t b) {
  return __builtin_riscv_cv_simd_srl_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_srl_sc_b(unsigned long a, uint8_t b) {
  return __builtin_riscv_cv_simd_srl_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_sra_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_sra_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_sra_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_sra_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_sra_sc_h(unsigned long a, uint8_t b) {
  return __builtin_riscv_cv_simd_sra_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_sra_sc_b(unsigned long a, uint8_t b) {
  return __builtin_riscv_cv_simd_sra_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_sll_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_sll_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_sll_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_sll_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_sll_sc_h(unsigned long a, uint8_t b) {
  return __builtin_riscv_cv_simd_sll_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_sll_sc_b(unsigned long a, uint8_t b) {
  return __builtin_riscv_cv_simd_sll_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_or_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_or_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_or_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_or_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_or_sc_h(unsigned long a, int16_t b) {
  return __builtin_riscv_cv_simd_or_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_or_sc_b(unsigned long a, int8_t b) {
  return __builtin_riscv_cv_simd_or_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_xor_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_xor_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_xor_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_xor_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_xor_sc_h(unsigned long a, int16_t b) {
  return __builtin_riscv_cv_simd_xor_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_xor_sc_b(unsigned long a, int8_t b) {
  return __builtin_riscv_cv_simd_xor_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_and_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_and_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_and_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_and_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_and_sc_h(unsigned long a, int16_t b) {
  return __builtin_riscv_cv_simd_and_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_and_sc_b(unsigned long a, int8_t b) {
  return __builtin_riscv_cv_simd_and_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_abs_h(unsigned long a) {
  return __builtin_riscv_cv_simd_abs_h(a);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_abs_b(unsigned long a) {
  return __builtin_riscv_cv_simd_abs_b(a);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_neg_h(unsigned long a) {
  return __builtin_riscv_cv_simd_neg_h(a);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_neg_b(unsigned long a) {
  return __builtin_riscv_cv_simd_neg_b(a);
}

#define __riscv_cv_simd_extract_h(rs1, SEL) \
  (unsigned long) __builtin_riscv_cv_simd_extract_h((unsigned long) (rs1), \
                                                    (const uint8_t) (SEL))

#define __riscv_cv_simd_extract_b(rs1, SEL) \
  (unsigned long) __builtin_riscv_cv_simd_extract_b((unsigned long) (rs1), \
                                                    (const uint8_t) (SEL))

#define __riscv_cv_simd_extractu_h(rs1, SEL) \
  (unsigned long) __builtin_riscv_cv_simd_extractu_h((unsigned long) (rs1), \
                                                     (const uint8_t) (SEL))

#define __riscv_cv_simd_extractu_b(rs1, SEL) \
  (unsigned long) __builtin_riscv_cv_simd_extractu_b((unsigned long) (rs1), \
                                                     (const uint8_t) (SEL))

#define __riscv_cv_simd_insert_h(rs1, rs2, SEL) \
  (unsigned long) __builtin_riscv_cv_simd_insert_h((unsigned long) (rs1), \
                                   (unsigned long) (rs2), (const uint8_t) (SEL))

#define __riscv_cv_simd_insert_b(rs1, rs2, SEL) \
  (unsigned long) __builtin_riscv_cv_simd_insert_b((unsigned long) (rs1), \
                                   (unsigned long) (rs2), (const uint8_t) (SEL))

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_dotup_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_dotup_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_dotup_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_dotup_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_dotup_sc_h(unsigned long a, uint16_t b) {
  return __builtin_riscv_cv_simd_dotup_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_dotup_sc_b(unsigned long a, uint8_t b) {
  return __builtin_riscv_cv_simd_dotup_sc_b(a, b);
}

static long __DEFAULT_FN_ATTRS __riscv_cv_simd_dotusp_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_dotusp_h(a, b);
}

static long __DEFAULT_FN_ATTRS __riscv_cv_simd_dotusp_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_dotusp_b(a, b);
}

static long __DEFAULT_FN_ATTRS __riscv_cv_simd_dotusp_sc_h(unsigned long a, int16_t b) {
  return __builtin_riscv_cv_simd_dotusp_sc_h(a, b);
}

static long __DEFAULT_FN_ATTRS __riscv_cv_simd_dotusp_sc_b(unsigned long a, int8_t b) {
  return __builtin_riscv_cv_simd_dotusp_sc_b(a, b);
}

static long __DEFAULT_FN_ATTRS __riscv_cv_simd_dotsp_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_dotsp_h(a, b);
}

static long __DEFAULT_FN_ATTRS __riscv_cv_simd_dotsp_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_dotsp_b(a, b);
}

static long __DEFAULT_FN_ATTRS __riscv_cv_simd_dotsp_sc_h(unsigned long a, int16_t b) {
  return __builtin_riscv_cv_simd_dotsp_sc_h(a, b);
}

static long __DEFAULT_FN_ATTRS __riscv_cv_simd_dotsp_sc_b(unsigned long a, int8_t b) {
  return __builtin_riscv_cv_simd_dotsp_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_sdotup_h(unsigned long a, unsigned long b,
                                       unsigned long c) {
  return __builtin_riscv_cv_simd_sdotup_h(a, b, c);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_sdotup_b(unsigned long a, unsigned long b,
                                       unsigned long c) {
  return __builtin_riscv_cv_simd_sdotup_b(a, b, c);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_sdotup_sc_h(unsigned long a, uint16_t b,
                                          unsigned long c) {
  return __builtin_riscv_cv_simd_sdotup_sc_h(a, b, c);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_sdotup_sc_b(unsigned long a, uint8_t b,
                                          unsigned long c) {
  return __builtin_riscv_cv_simd_sdotup_sc_b(a, b, c);
}

static long __DEFAULT_FN_ATTRS __riscv_cv_simd_sdotusp_h(unsigned long a, unsigned long b, long c) {
  return __builtin_riscv_cv_simd_sdotusp_h(a, b, c);
}

static long __DEFAULT_FN_ATTRS __riscv_cv_simd_sdotusp_b(unsigned long a, unsigned long b, long c) {
  return __builtin_riscv_cv_simd_sdotusp_b(a, b, c);
}

static long __DEFAULT_FN_ATTRS __riscv_cv_simd_sdotusp_sc_h(unsigned long a, int16_t b, long c) {
  return __builtin_riscv_cv_simd_sdotusp_sc_h(a, b, c);
}

static long __DEFAULT_FN_ATTRS __riscv_cv_simd_sdotusp_sc_b(unsigned long a, int8_t b, long c) {
  return __builtin_riscv_cv_simd_sdotusp_sc_b(a, b, c);
}

static long __DEFAULT_FN_ATTRS __riscv_cv_simd_sdotsp_h(unsigned long a, unsigned long b, long c) {
  return __builtin_riscv_cv_simd_sdotsp_h(a, b, c);
}

static long __DEFAULT_FN_ATTRS __riscv_cv_simd_sdotsp_b(unsigned long a, unsigned long b, long c) {
  return __builtin_riscv_cv_simd_sdotsp_b(a, b, c);
}

static long __DEFAULT_FN_ATTRS __riscv_cv_simd_sdotsp_sc_h(unsigned long a, int16_t b, long c) {
  return __builtin_riscv_cv_simd_sdotsp_sc_h(a, b, c);
}

static long __DEFAULT_FN_ATTRS __riscv_cv_simd_sdotsp_sc_b(unsigned long a, int8_t b, long c) {
  return __builtin_riscv_cv_simd_sdotsp_sc_b(a, b, c);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_shuffle_h(unsigned long a, unsigned long flgs) {
  return __builtin_riscv_cv_simd_shuffle_h(a, flgs);
}

#define __riscv_cv_simd_shuffle_sci_h(rs1, FLGS) \
  (unsigned long) __builtin_riscv_cv_simd_shuffle_sci_h((unsigned long) (rs1), \
                                        (const uint8_t) (FLGS))

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_shuffle_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_shuffle_b(a, b);
}

#define __riscv_cv_simd_shuffle_sci_b(rs1, FLGS) \
  (unsigned long) __builtin_riscv_cv_simd_shuffle_sci_b((unsigned long) (rs1), \
                                        (const uint8_t) (FLGS))

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_shuffle2_h(unsigned long a, unsigned long flgs,
                                         unsigned long c) {
  return __builtin_riscv_cv_simd_shuffle2_h(a, flgs, c);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_shuffle2_b(unsigned long a, unsigned long flgs,
                                         unsigned long c) {
  return __builtin_riscv_cv_simd_shuffle2_b(a, flgs, c);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_packhi_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_packhi_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_packlo_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_packlo_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_packhi_b(unsigned long a, unsigned long b,
                                       unsigned long c) {
  return __builtin_riscv_cv_simd_packhi_b(a, b, c);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_packlo_b(unsigned long a, unsigned long b,
                                       unsigned long c) {
  return __builtin_riscv_cv_simd_packlo_b(a, b, c);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpeq_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmpeq_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpeq_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmpeq_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpeq_sc_h(unsigned long a, int16_t b) {
  return __builtin_riscv_cv_simd_cmpeq_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpeq_sc_b(unsigned long a, int8_t b) {
  return __builtin_riscv_cv_simd_cmpeq_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpne_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmpne_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpne_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmpne_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpne_sc_h(unsigned long a, int16_t b) {
  return __builtin_riscv_cv_simd_cmpne_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpne_sc_b(unsigned long a, int8_t b) {
  return __builtin_riscv_cv_simd_cmpne_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpgt_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmpgt_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpgt_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmpgt_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpgt_sc_h(unsigned long a, int16_t b) {
  return __builtin_riscv_cv_simd_cmpgt_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpgt_sc_b(unsigned long a, int8_t b) {
  return __builtin_riscv_cv_simd_cmpgt_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpge_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmpge_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpge_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmpge_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpge_sc_h(unsigned long a, int16_t b) {
  return __builtin_riscv_cv_simd_cmpge_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpge_sc_b(unsigned long a, int8_t b) {
  return __builtin_riscv_cv_simd_cmpge_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmplt_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmplt_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmplt_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmplt_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmplt_sc_h(unsigned long a, int16_t b) {
  return __builtin_riscv_cv_simd_cmplt_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmplt_sc_b(unsigned long a, int8_t b) {
  return __builtin_riscv_cv_simd_cmplt_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmple_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmple_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmple_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmple_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmple_sc_h(unsigned long a, int16_t b) {
  return __builtin_riscv_cv_simd_cmple_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmple_sc_b(unsigned long a, int8_t b) {
  return __builtin_riscv_cv_simd_cmple_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpgtu_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmpgtu_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpgtu_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmpgtu_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpgtu_sc_h(unsigned long a, uint16_t b) {
  return __builtin_riscv_cv_simd_cmpgtu_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpgtu_sc_b(unsigned long a, uint8_t b) {
  return __builtin_riscv_cv_simd_cmpgtu_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpgeu_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmpgeu_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpgeu_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmpgeu_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpgeu_sc_h(unsigned long a, uint16_t b) {
  return __builtin_riscv_cv_simd_cmpgeu_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpgeu_sc_b(unsigned long a, uint8_t b) {
  return __builtin_riscv_cv_simd_cmpgeu_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpltu_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmpltu_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpltu_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmpltu_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpltu_sc_h(unsigned long a, uint16_t b) {
  return __builtin_riscv_cv_simd_cmpltu_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpltu_sc_b(unsigned long a, uint8_t b) {
  return __builtin_riscv_cv_simd_cmpltu_sc_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpleu_h(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmpleu_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpleu_b(unsigned long a, unsigned long b) {
  return __builtin_riscv_cv_simd_cmpleu_b(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpleu_sc_h(unsigned long a, uint16_t b) {
  return __builtin_riscv_cv_simd_cmpleu_sc_h(a, b);
}

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cmpleu_sc_b(unsigned long a, uint8_t b) {
  return __builtin_riscv_cv_simd_cmpleu_sc_b(a, b);
}

#define __riscv_cv_simd_cplxmul_r(rs1, rs2, rD, DIV) \
  (unsigned long) __builtin_riscv_cv_simd_cplxmul_r((unsigned long) (rs1), \
                                  (unsigned long) (rs2), (unsigned long) (rD), \
                                  (const uint8_t) (DIV))

#define __riscv_cv_simd_cplxmul_i(rs1, rs2, rD, DIV) \
  (unsigned long) __builtin_riscv_cv_simd_cplxmul_i((unsigned long) (rs1), \
                                  (unsigned long) (rs2), (unsigned long) (rD), \
                                  (const uint8_t) (DIV))

static unsigned long __DEFAULT_FN_ATTRS __riscv_cv_simd_cplxconj(unsigned long a) {
  return __builtin_riscv_cv_simd_cplxconj(a);
}

#define __riscv_cv_simd_subrotmj(rs1, rs2, DIV) \
  (unsigned long) __builtin_riscv_cv_simd_subrotmj((unsigned long) (rs1), \
                                   (unsigned long) (rs2), (const uint8_t) (DIV))

#endif // defined(__riscv_xcvsimd)

#if defined(__cplusplus)
}
#endif

#endif // define __RISCV_COREV_SIMD_H
