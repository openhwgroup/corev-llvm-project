#ifndef __RISCV_COREV_SIMD_H
#define __RISCV_COREV_SIMD_H

#include <stdint.h>

#if defined(__cplusplus)
extern "C" {
#endif

#if defined(__riscv_xcvsimd)
uint32_t __builtin_riscv_cv_simd_add_h (uint32_t i, uint32_t j, const uint8_t shft);
uint32_t __builtin_riscv_cv_simd_add_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_add_sc_h (uint32_t i, int16_t j);
uint32_t __builtin_riscv_cv_simd_add_sc_b (uint32_t i, int8_t j);
uint32_t __builtin_riscv_cv_simd_sub_h (uint32_t i, uint32_t j, const uint8_t shft);
uint32_t __builtin_riscv_cv_simd_sub_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_sub_sc_h (uint32_t i, int16_t j);
uint32_t __builtin_riscv_cv_simd_sub_sc_b (uint32_t i, int8_t j);
uint32_t __builtin_riscv_cv_simd_avg_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_avg_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_avg_sc_h (uint32_t i, int16_t j);
uint32_t __builtin_riscv_cv_simd_avg_sc_b (uint32_t i, int8_t j);
uint32_t __builtin_riscv_cv_simd_avgu_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_avgu_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_avgu_sc_h (uint32_t i, uint16_t j);
uint32_t __builtin_riscv_cv_simd_avgu_sc_b (uint32_t i, uint8_t j);
uint32_t __builtin_riscv_cv_simd_min_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_min_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_min_sc_h (uint32_t i, int16_t j);
uint32_t __builtin_riscv_cv_simd_min_sc_b (uint32_t i, int8_t j);
uint32_t __builtin_riscv_cv_simd_minu_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_minu_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_minu_sc_h (uint32_t i, uint16_t j);
uint32_t __builtin_riscv_cv_simd_minu_sc_b (uint32_t i, uint8_t j);
uint32_t __builtin_riscv_cv_simd_max_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_max_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_max_sc_h (uint32_t i, int16_t j);
uint32_t __builtin_riscv_cv_simd_max_sc_b (uint32_t i, int8_t j);
uint32_t __builtin_riscv_cv_simd_maxu_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_maxu_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_maxu_sc_h (uint32_t i, uint16_t j);
uint32_t __builtin_riscv_cv_simd_maxu_sc_b (uint32_t i, uint8_t j);
uint32_t __builtin_riscv_cv_simd_srl_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_srl_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_srl_sc_h (uint32_t i, uint8_t j);
uint32_t __builtin_riscv_cv_simd_srl_sc_b (uint32_t i, uint8_t j);
uint32_t __builtin_riscv_cv_simd_sra_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_sra_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_sra_sc_h (uint32_t i, uint8_t j);
uint32_t __builtin_riscv_cv_simd_sra_sc_b (uint32_t i, uint8_t j);
uint32_t __builtin_riscv_cv_simd_sll_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_sll_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_sll_sc_h (uint32_t i, uint8_t j);
uint32_t __builtin_riscv_cv_simd_sll_sc_b (uint32_t i, uint8_t j);
uint32_t __builtin_riscv_cv_simd_or_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_or_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_or_sc_h (uint32_t i, int16_t j);
uint32_t __builtin_riscv_cv_simd_or_sc_b (uint32_t i, int8_t j);
uint32_t __builtin_riscv_cv_simd_xor_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_xor_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_xor_sc_h (uint32_t i, int16_t j);
uint32_t __builtin_riscv_cv_simd_xor_sc_b (uint32_t i, int8_t j);
uint32_t __builtin_riscv_cv_simd_and_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_and_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_and_sc_h (uint32_t i, int16_t j);
uint32_t __builtin_riscv_cv_simd_and_sc_b (uint32_t i, int8_t j);
uint32_t __builtin_riscv_cv_simd_abs_h (uint32_t i);
uint32_t __builtin_riscv_cv_simd_abs_b (uint32_t i);
uint32_t __builtin_riscv_cv_simd_neg_h (uint32_t i);
uint32_t __builtin_riscv_cv_simd_neg_b (uint32_t i);
int32_t __builtin_riscv_cv_simd_extract_h (uint32_t i, const uint8_t sel);
int32_t __builtin_riscv_cv_simd_extract_b (uint32_t i, const uint8_t sel);
uint32_t __builtin_riscv_cv_simd_extractu_h (uint32_t i, const uint8_t sel);
uint32_t __builtin_riscv_cv_simd_extractu_b (uint32_t i, const uint8_t sel);
uint32_t __builtin_riscv_cv_simd_insert_h (uint32_t i, uint32_t j, const uint8_t sel);
uint32_t __builtin_riscv_cv_simd_insert_b (uint32_t i, uint32_t j, const uint8_t sel);
uint32_t __builtin_riscv_cv_simd_dotup_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_dotup_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_dotup_sc_h (uint32_t i, uint16_t j);
uint32_t __builtin_riscv_cv_simd_dotup_sc_b (uint32_t i, uint8_t j);
int32_t __builtin_riscv_cv_simd_dotusp_h (uint32_t i, uint32_t j);
int32_t __builtin_riscv_cv_simd_dotusp_b (uint32_t i, uint32_t j);
int32_t __builtin_riscv_cv_simd_dotusp_sc_h (uint32_t i, int16_t j);
int32_t __builtin_riscv_cv_simd_dotusp_sc_b (uint32_t i, int8_t j);
int32_t __builtin_riscv_cv_simd_dotsp_h (uint32_t i, uint32_t j);
int32_t __builtin_riscv_cv_simd_dotsp_b (uint32_t i, uint32_t j);
int32_t __builtin_riscv_cv_simd_dotsp_sc_h (uint32_t i, int16_t j);
int32_t __builtin_riscv_cv_simd_dotsp_sc_b (uint32_t i, int8_t j);
uint32_t __builtin_riscv_cv_simd_sdotup_h (uint32_t i, uint32_t j, uint32_t k);
uint32_t __builtin_riscv_cv_simd_sdotup_b (uint32_t i, uint32_t j, uint32_t k);
uint32_t __builtin_riscv_cv_simd_sdotup_sc_h (uint32_t i, uint16_t j, uint32_t k);
uint32_t __builtin_riscv_cv_simd_sdotup_sc_b (uint32_t i, uint8_t j, uint32_t k);
int32_t __builtin_riscv_cv_simd_sdotusp_h (uint32_t i, uint32_t j, int32_t k);
int32_t __builtin_riscv_cv_simd_sdotusp_b (uint32_t i, uint32_t j, int32_t k);
int32_t __builtin_riscv_cv_simd_sdotusp_sc_h (uint32_t i, int16_t j, int32_t k);
int32_t __builtin_riscv_cv_simd_sdotusp_sc_b (uint32_t i, int8_t j, int32_t k);
int32_t __builtin_riscv_cv_simd_sdotsp_h (uint32_t i, uint32_t j, int32_t k);
int32_t __builtin_riscv_cv_simd_sdotsp_b (uint32_t i, uint32_t j, int32_t k);
int32_t __builtin_riscv_cv_simd_sdotsp_sc_h (uint32_t i, int16_t j, int32_t k);
int32_t __builtin_riscv_cv_simd_sdotsp_sc_b (uint32_t i, int8_t j, int32_t k);
uint32_t __builtin_riscv_cv_simd_shuffle_h (uint32_t  i, uint32_t flgs);
uint32_t __builtin_riscv_cv_simd_shuffle_sci_h (uint32_t i, const uint8_t flgs);
uint32_t __builtin_riscv_cv_simd_shuffle_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_shuffle_sci_b (uint32_t i, const uint8_t flgs);
uint32_t __builtin_riscv_cv_simd_shuffle2_h (uint32_t i, uint32_t flgs, uint32_t k);
uint32_t __builtin_riscv_cv_simd_shuffle2_b (uint32_t i, uint32_t flgs, uint32_t k);
uint32_t __builtin_riscv_cv_simd_packhi_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_packlo_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_packhi_b (uint32_t i, uint32_t j, uint32_t k);
uint32_t __builtin_riscv_cv_simd_packlo_b (uint32_t i, uint32_t j, uint32_t k);
uint32_t __builtin_riscv_cv_simd_cmpeq_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmpeq_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmpeq_sc_h (uint32_t i, int16_t j);
uint32_t __builtin_riscv_cv_simd_cmpeq_sc_b (uint32_t i, int8_t j);
uint32_t __builtin_riscv_cv_simd_cmpne_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmpne_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmpne_sc_h (uint32_t i, int16_t j);
uint32_t __builtin_riscv_cv_simd_cmpne_sc_b (uint32_t i, int8_t j);
uint32_t __builtin_riscv_cv_simd_cmpgt_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmpgt_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmpgt_sc_h (uint32_t i, int16_t j);
uint32_t __builtin_riscv_cv_simd_cmpgt_sc_b (uint32_t i, int8_t j);
uint32_t __builtin_riscv_cv_simd_cmpge_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmpge_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmpge_sc_h (uint32_t i, int16_t j);
uint32_t __builtin_riscv_cv_simd_cmpge_sc_b (uint32_t i, int8_t j);
uint32_t __builtin_riscv_cv_simd_cmplt_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmplt_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmplt_sc_h (uint32_t i, int16_t j);
uint32_t __builtin_riscv_cv_simd_cmplt_sc_b (uint32_t i, int8_t j);
uint32_t __builtin_riscv_cv_simd_cmple_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmple_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmple_sc_h (uint32_t i, int16_t j);
uint32_t __builtin_riscv_cv_simd_cmple_sc_b (uint32_t i, int8_t j);
uint32_t __builtin_riscv_cv_simd_cmpgtu_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmpgtu_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmpgtu_sc_h (uint32_t i, uint16_t j);
uint32_t __builtin_riscv_cv_simd_cmpgtu_sc_b (uint32_t i, uint8_t j);
uint32_t __builtin_riscv_cv_simd_cmpgeu_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmpgeu_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmpgeu_sc_h (uint32_t i, uint16_t j);
uint32_t __builtin_riscv_cv_simd_cmpgeu_sc_b (uint32_t i, uint8_t j);
uint32_t __builtin_riscv_cv_simd_cmpltu_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmpltu_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmpltu_sc_h (uint32_t i, uint16_t j);
uint32_t __builtin_riscv_cv_simd_cmpltu_sc_b (uint32_t i, uint8_t j);
uint32_t __builtin_riscv_cv_simd_cmpleu_h (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmpleu_b (uint32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_simd_cmpleu_sc_h (uint32_t i, uint16_t j);
uint32_t __builtin_riscv_cv_simd_cmpleu_sc_b (uint32_t i, uint8_t j);
uint32_t __builtin_riscv_cv_simd_cplxmul_r (uint32_t i, uint32_t j, uint32_t k, const uint8_t shft);
uint32_t __builtin_riscv_cv_simd_cplxmul_i (uint32_t i, uint32_t j, uint32_t k, const uint8_t shft);
uint32_t __builtin_riscv_cv_simd_cplxconj (uint32_t i);
uint32_t __builtin_riscv_cv_simd_subrotmj (uint32_t  i, uint32_t j, const uint8_t shft);
#endif // defined(__riscv_xcvsimd)

#if defined(__cplusplus)
}
#endif

#endif // define __RISCV_COREV_SIMD_H
