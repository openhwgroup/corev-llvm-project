#ifndef __RISCV_COREV_ALU_H
#define __RISCV_COREV_ALU_H

#include <stdint.h>

#if defined(__cplusplus)
extern "C" {
#endif

#if defined(__riscv_xcvalu)
int __builtin_abs (int j);
int __builtin_riscv_cv_alu_slet (int32_t  i, int32_t  j);
int __builtin_riscv_cv_alu_sletu (uint32_t i, uint32_t j);
int32_t __builtin_riscv_cv_alu_min (int32_t i, int32_t j);
uint32_t __builtin_riscv_cv_alu_minu (uint32_t i, uint32_t j);
int32_t __builtin_riscv_cv_alu_max (int32_t i, int32_t j);
uint32_t __builtin_riscv_cv_alu_maxu (uint32_t i, uint32_t j);
int32_t __builtin_riscv_cv_alu_exths (int16_t i);
uint32_t __builtin_riscv_cv_alu_exthz (uint16_t i);
int32_t __builtin_riscv_cv_alu_extbs (int8_t i);
uint32_t __builtin_riscv_cv_alu_extbz (uint8_t);
int32_t __builtin_riscv_cv_alu_clip (int32_t i, uint32_t j);
uint32_t __builtin_riscv_cv_alu_clipu (uint32_t i, uint32_t j);
int32_t __builtin_riscv_cv_alu_addN (int32_t x, int32_t y, uint8_t shft);
uint32_t __builtin_riscv_cv_alu_adduN (uint32_t x, uint32_t y, uint8_t shft);
int32_t __builtin_riscv_cv_alu_addRN (int32_t x, int32_t y, uint8_t shft);
uint32_t __builtin_riscv_cv_alu_adduRN (uint32_t x, uint32_t y, uint8_t shft);
int32_t __builtin_riscv_cv_alu_subN (int32_t x, int32_t y, uint8_t shft);
uint32_t __builtin_riscv_cv_alu_subuN (uint32_t x, uint32_t y, uint8_t shft);
int32_t __builtin_riscv_cv_alu_subRN (int32_t x, int32_t y, uint8_t shft);
uint32_t __builtin_riscv_cv_alu_subuRN (uint32_t x, uint32_t y, uint8_t shft);
#endif // defined(__riscv_xcvalu)

#if defined(__cplusplus)
}
#endif

#endif // define __RISCV_COREV_ALU_H
