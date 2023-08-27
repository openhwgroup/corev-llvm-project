/*===---- riscv_corev_mac.h - CORE-V multiply accumulate intrinsics --------===
 *
 * Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
 * See https://llvm.org/LICENSE.txt for license information.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 *
 *===-----------------------------------------------------------------------===
 */

#ifndef __RISCV_COREV_MAC_H
#define __RISCV_COREV_MAC_H

#include <stdint.h>

#if defined(__cplusplus)
extern "C" {
#endif

#if defined(__riscv_xcvmac)
int32_t __builtin_riscv_cv_mac_mac (int32_t x, int32_t y, int32_t z);
int32_t __builtin_riscv_cv_mac_msu (int32_t x, int32_t y, int32_t z);
uint32_t __builtin_riscv_cv_mac_muluN (uint32_t x, uint32_t y, const uint8_t shft);
uint32_t __builtin_riscv_cv_mac_mulhhuN (uint32_t x, uint32_t y, const uint8_t shft);
int32_t __builtin_riscv_cv_mac_mulsN (uint32_t x, uint32_t y, const uint8_t shft);
int32_t __builtin_riscv_cv_mac_mulhhsN (uint32_t x, uint32_t y, const uint8_t shft);
uint32_t __builtin_riscv_cv_mac_muluRN (uint32_t x, uint32_t y, const uint8_t shft);
uint32_t __builtin_riscv_cv_mac_mulhhuRN (uint32_t x, uint32_t y, const uint8_t shft);
int32_t __builtin_riscv_cv_mac_mulsRN (uint32_t x, uint32_t y, const uint8_t shft);
int32_t __builtin_riscv_cv_mac_mulhhsRN (uint32_t x, uint32_t y, const uint8_t shft);
uint32_t __builtin_riscv_cv_mac_macuN (uint32_t x, uint32_t y, uint32_t z, const uint8_t shft);
uint32_t __builtin_riscv_cv_mac_machhuN (uint32_t x, uint32_t y, uint32_t z, const uint8_t shft);
int32_t __builtin_riscv_cv_mac_macsN (uint32_t x, uint32_t y, int32_t z, const uint8_t shft);
int32_t __builtin_riscv_cv_mac_machhsN (uint32_t x, uint32_t y, int32_t z, const uint8_t shft);
uint32_t __builtin_riscv_cv_mac_macuRN (uint32_t x, uint32_t y, uint32_t z, const uint8_t shft);
uint32_t __builtin_riscv_cv_mac_machhuRN (uint32_t x, uint32_t y, uint32_t z, const uint8_t shft);
int32_t __builtin_riscv_cv_mac_macsRN (uint32_t x, uint32_t y, int32_t z, const uint8_t shft);
int32_t __builtin_riscv_cv_mac_machhsRN (uint32_t x, uint32_t y, int32_t z, const uint8_t shft);
#endif // defined(__riscv_xcvmac)

#if defined(__cplusplus)
}
#endif

#endif // define __RISCV_COREV_MAC_H
