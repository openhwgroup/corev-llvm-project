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
