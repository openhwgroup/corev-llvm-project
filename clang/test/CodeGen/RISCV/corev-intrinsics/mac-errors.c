// RUN: %clang_cc1 %s -triple riscv32 -target-feature +xcvmac -fsyntax-only -verify

#include <stdint.h>

uint32_t test_mac_muluN(uint32_t x, uint32_t y) {
    return __builtin_riscv_cv_mac_muluN(x, y, 32);  // expected-error {{argument value 32 is outside the valid range [0, 31]}}
}

uint32_t test_mac_muluN_negative(uint32_t x, uint32_t y) {
    return __builtin_riscv_cv_mac_muluN(x, y, -1);  // expected-error {{argument value 255 is outside the valid range [0, 31]}}
}

uint32_t test_mac_mulhhuN(uint32_t x, uint32_t y) {
    return __builtin_riscv_cv_mac_mulhhuN(x, y, 32);  // expected-error {{argument value 32 is outside the valid range [0, 31]}}
}

uint32_t test_mac_mulhhuN_negative(uint32_t x, uint32_t y) {
    return __builtin_riscv_cv_mac_mulhhuN(x, y, -1);  // expected-error {{argument value 255 is outside the valid range [0, 31]}}
}

uint32_t test_mac_mulsN(uint32_t x, uint32_t y) {
    return __builtin_riscv_cv_mac_mulsN(x, y, 32);  // expected-error {{argument value 32 is outside the valid range [0, 31]}}
}

uint32_t test_mac_mulsN_negative(uint32_t x, uint32_t y) {
    return __builtin_riscv_cv_mac_mulsN(x, y, -1);  // expected-error {{argument value 255 is outside the valid range [0, 31]}}
}

uint32_t test_mac_mulhhsN(uint32_t x, uint32_t y) {
    return __builtin_riscv_cv_mac_mulhhsN(x, y, 32);  // expected-error {{argument value 32 is outside the valid range [0, 31]}}
}

uint32_t test_mac_mulhhsN_negative(uint32_t x, uint32_t y) {
    return __builtin_riscv_cv_mac_mulhhsN(x, y, -1);  // expected-error {{argument value 255 is outside the valid range [0, 31]}}
}

uint32_t test_mac_muluRN(uint32_t x, uint32_t y) {
    return __builtin_riscv_cv_mac_muluRN(x, y, 32);  // expected-error {{argument value 32 is outside the valid range [0, 31]}}
}

uint32_t test_mac_muluRN_negative(uint32_t x, uint32_t y) {
    return __builtin_riscv_cv_mac_muluRN(x, y, -1);  // expected-error {{argument value 255 is outside the valid range [0, 31]}}
}

uint32_t test_mac_mulhhuRN(uint32_t x, uint32_t y) {
    return __builtin_riscv_cv_mac_mulhhuRN(x, y, 32);  // expected-error {{argument value 32 is outside the valid range [0, 31]}}
}

uint32_t test_mac_mulhhuRN_negative(uint32_t x, uint32_t y) {
    return __builtin_riscv_cv_mac_mulhhuRN(x, y, -1);  // expected-error {{argument value 255 is outside the valid range [0, 31]}}
}

uint32_t test_mac_mulsRN(uint32_t x, uint32_t y) {
    return __builtin_riscv_cv_mac_mulsRN(x, y, 32);  // expected-error {{argument value 32 is outside the valid range [0, 31]}}
}

uint32_t test_mac_mulsRN_negative(uint32_t x, uint32_t y) {
    return __builtin_riscv_cv_mac_mulsRN(x, y, -1);  // expected-error {{argument value 255 is outside the valid range [0, 31]}}
}

uint32_t test_mac_mulhhsRN(uint32_t x, uint32_t y) {
    return __builtin_riscv_cv_mac_mulhhsRN(x, y, 32);  // expected-error {{argument value 32 is outside the valid range [0, 31]}}
}

uint32_t test_mac_mulhhsRN_negative(uint32_t x, uint32_t y) {
    return __builtin_riscv_cv_mac_mulhhsRN(x, y, -1);  // expected-error {{argument value 255 is outside the valid range [0, 31]}}
}

uint32_t test_mac_macuN(uint32_t x, uint32_t y, uint32_t z) {
    return __builtin_riscv_cv_mac_macuN(x, y, z, 32);  // expected-error {{argument value 32 is outside the valid range [0, 31]}}
}

uint32_t test_mac_macuN_negative(uint32_t x, uint32_t y, uint32_t z) {
    return __builtin_riscv_cv_mac_macuN(x, y, z, -1);  // expected-error {{argument value 255 is outside the valid range [0, 31]}}
}

uint32_t test_mac_machhuN(uint32_t x, uint32_t y, uint32_t z) {
    return __builtin_riscv_cv_mac_machhuN(x, y, z, 32);  // expected-error {{argument value 32 is outside the valid range [0, 31]}}
}

uint32_t test_mac_machhuN_negative(uint32_t x, uint32_t y, uint32_t z) {
    return __builtin_riscv_cv_mac_machhuN(x, y, z, -1);  // expected-error {{argument value 255 is outside the valid range [0, 31]}}
}

uint32_t test_mac_macsN(uint32_t x, uint32_t y, uint32_t z) {
    return __builtin_riscv_cv_mac_macsN(x, y, z, 32);  // expected-error {{argument value 32 is outside the valid range [0, 31]}}
}

uint32_t test_mac_macsN_negative(uint32_t x, uint32_t y, uint32_t z) {
    return __builtin_riscv_cv_mac_macsN(x, y, z, -1);  // expected-error {{argument value 255 is outside the valid range [0, 31]}}
}

uint32_t test_mac_machhsN(uint32_t x, uint32_t y, uint32_t z) {
    return __builtin_riscv_cv_mac_machhsN(x, y, z, 32);  // expected-error {{argument value 32 is outside the valid range [0, 31]}}
}

uint32_t test_mac_machhsN_negative(uint32_t x, uint32_t y, uint32_t z) {
    return __builtin_riscv_cv_mac_machhsN(x, y, z, -1);  // expected-error {{argument value 255 is outside the valid range [0, 31]}}
}

uint32_t test_mac_macuRN(uint32_t x, uint32_t y, uint32_t z) {
    return __builtin_riscv_cv_mac_macuRN(x, y, z, 32);  // expected-error {{argument value 32 is outside the valid range [0, 31]}}
}

uint32_t test_mac_macuRN_negative(uint32_t x, uint32_t y, uint32_t z) {
    return __builtin_riscv_cv_mac_macuRN(x, y, z, -1);  // expected-error {{argument value 255 is outside the valid range [0, 31]}}
}

uint32_t test_mac_machhuRN(uint32_t x, uint32_t y, uint32_t z) {
    return __builtin_riscv_cv_mac_machhuRN(x, y, z, 32);  // expected-error {{argument value 32 is outside the valid range [0, 31]}}
}

uint32_t test_mac_machhuRN_negative(uint32_t x, uint32_t y, uint32_t z) {
    return __builtin_riscv_cv_mac_machhuRN(x, y, z, -1);  // expected-error {{argument value 255 is outside the valid range [0, 31]}}
}

uint32_t test_mac_macsRN(uint32_t x, uint32_t y, uint32_t z) {
    return __builtin_riscv_cv_mac_macsRN(x, y, z, 32);  // expected-error {{argument value 32 is outside the valid range [0, 31]}}
}

uint32_t test_mac_macsRN_negative(uint32_t x, uint32_t y, uint32_t z) {
    return __builtin_riscv_cv_mac_macsRN(x, y, z, -1);  // expected-error {{argument value 255 is outside the valid range [0, 31]}}
}

uint32_t test_mac_machhsRN(uint32_t x, uint32_t y, uint32_t z) {
    return __builtin_riscv_cv_mac_machhsRN(x, y, z, 32);  // expected-error {{argument value 32 is outside the valid range [0, 31]}}
}

uint32_t test_mac_machhsRN_negative(uint32_t x, uint32_t y, uint32_t z) {
    return __builtin_riscv_cv_mac_machhsRN(x, y, z, -1);  // expected-error {{argument value 255 is outside the valid range [0, 31]}}
}
