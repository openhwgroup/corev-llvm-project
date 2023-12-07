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

#define __DEFAULT_FN_ATTRS __attribute__((__always_inline__, __nodebug__))

long __DEFAULT_FN_ATTRS __riscv_cv_mac_mac(long a, long b, long c) {
  return __builtin_riscv_cv_mac_mac(a, b, c);
}

long __DEFAULT_FN_ATTRS __riscv_cv_mac_msu(long a, long b, long c) {
  return __builtin_riscv_cv_mac_msu(a, b, c);
}

unsigned long __DEFAULT_FN_ATTRS __riscv_cv_mac_muluN(unsigned long a, unsigned long b,
                                   const uint8_t shft) {
  return __builtin_riscv_cv_mac_muluN(a, b, shft);
}

unsigned long __DEFAULT_FN_ATTRS __riscv_cv_mac_mulhhuN(unsigned long a, unsigned long b,
                                     const uint8_t shft) {
  return __builtin_riscv_cv_mac_mulhhuN(a, b, shft);
}

long __DEFAULT_FN_ATTRS __riscv_cv_mac_mulsN(unsigned long a, unsigned long b,
                          const uint8_t shft) {
  return __builtin_riscv_cv_mac_mulsN(a, b, shft);
}

long __DEFAULT_FN_ATTRS __riscv_cv_mac_mulhhsN(unsigned long a, unsigned long b,
                            const uint8_t shft) {
  return __builtin_riscv_cv_mac_mulhhsN(a, b, shft);
}

unsigned long __DEFAULT_FN_ATTRS __riscv_cv_mac_muluRN(unsigned long a, unsigned long b,
                                    const uint8_t shft) {
  return __builtin_riscv_cv_mac_muluRN(a, b, shft);
}

unsigned long __DEFAULT_FN_ATTRS __riscv_cv_mac_mulhhuRN(unsigned long a, unsigned long b,
                                      const uint8_t shft) {
  return __builtin_riscv_cv_mac_mulhhuRN(a, b, shft);
}

long __DEFAULT_FN_ATTRS __riscv_cv_mac_mulsRN(unsigned long a, unsigned long b,
                           const uint8_t shft) {
  return __builtin_riscv_cv_mac_mulsRN(a, b, shft);
}

long __DEFAULT_FN_ATTRS __riscv_cv_mac_mulhhsRN(unsigned long a, unsigned long b,
                             const uint8_t shft) {
  return __builtin_riscv_cv_mac_mulhhsRN(a, b, shft);
}

unsigned long __DEFAULT_FN_ATTRS __riscv_cv_mac_macuN(unsigned long a, unsigned long b,
                                   unsigned long c, const uint8_t shft) {
  return __builtin_riscv_cv_mac_macuN(a, b, c, shft);
}

unsigned long __DEFAULT_FN_ATTRS __riscv_cv_mac_machhuN(unsigned long a, unsigned long b,
                                     unsigned long c, const uint8_t shft) {
  return __builtin_riscv_cv_mac_machhuN(a, b, c, shft);
}

long __DEFAULT_FN_ATTRS __riscv_cv_mac_macsN(unsigned long a, unsigned long b, long c,
                          const uint8_t shft) {
  return __builtin_riscv_cv_mac_macsN(a, b, c, shft);
}

long __DEFAULT_FN_ATTRS __riscv_cv_mac_machhsN(unsigned long a, unsigned long b, long c,
                            const uint8_t shft) {
  return __builtin_riscv_cv_mac_machhsN(a, b, c, shft);
}

unsigned long __DEFAULT_FN_ATTRS __riscv_cv_mac_macuRN(unsigned long a, unsigned long b,
                                    unsigned long c, const uint8_t shft) {
  return __builtin_riscv_cv_mac_macuRN(a, b, c, shft);
}

unsigned long __DEFAULT_FN_ATTRS __riscv_cv_mac_machhuRN(unsigned long a, unsigned long b,
                                      unsigned long c, const uint8_t shft) {
  return __builtin_riscv_cv_mac_machhuRN(a, b, c, shft);
}

long __DEFAULT_FN_ATTRS __riscv_cv_mac_macsRN(unsigned long a, unsigned long b, long c,
                           const uint8_t shft) {
  return __builtin_riscv_cv_mac_macsRN(a, b, c, shft);
}

long __DEFAULT_FN_ATTRS __riscv_cv_mac_machhsRN(unsigned long a, unsigned long b, long c,
                             const uint8_t shft) {
  return __builtin_riscv_cv_mac_machhsRN(a, b, c, shft);
}

#endif // defined(__riscv_xcvmac)

#if defined(__cplusplus)
}
#endif

#endif // define __RISCV_COREV_MAC_H
