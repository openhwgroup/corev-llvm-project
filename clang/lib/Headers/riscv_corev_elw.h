/*===---- riscv_corev_elw.h - CORE-V event load intrinsics -----------------===
 *
 * Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
 * See https://llvm.org/LICENSE.txt for license information.
 * SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
 *
 *===-----------------------------------------------------------------------===
 */

#ifndef __RISCV_COREV_ELW_H
#define __RISCV_COREV_ELW_H

#include <stdint.h>

#if defined(__cplusplus)
extern "C" {
#endif

#if defined(__riscv_xcvelw)
uint32_t __builtin_riscv_cv_elw_elw (void *loc);
#endif // defined(__riscv_xcvelw)

#if defined(__cplusplus)
}
#endif

#endif // define __RISCV_COREV_ELW_H
