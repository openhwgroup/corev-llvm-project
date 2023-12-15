// RUN: %clang_cc1 -triple riscv32 -target-feature +xcvmac -emit-llvm %s -o - \
// RUN:     | FileCheck %s

#include <stdint.h>
#include <riscv_corev_mac.h>

// CHECK-LABEL: @test_mac_mac
// CHECK: @llvm.riscv.cv.mac.mac
int32_t test_mac_mac(int32_t x, int32_t y, int32_t z) {
    return __riscv_cv_mac_mac(x, y, z);
}

// CHECK-LABEL: @test_mac_msu
// CHECK: @llvm.riscv.cv.mac.msu
int32_t test_mac_msu(int32_t x, int32_t y, int32_t z) {
    return __riscv_cv_mac_msu(x, y, z);
}

// CHECK-LABEL: @test_mac_muluN
// CHECK: @llvm.riscv.cv.mac.muluN
uint32_t test_mac_muluN(uint32_t x, uint32_t y) {
    return __riscv_cv_mac_muluN(x, y, 0);
}

// CHECK-LABEL: @test_mac_mulhhuN
// CHECK: @llvm.riscv.cv.mac.mulhhuN
uint32_t test_mac_mulhhuN(uint32_t x, uint32_t y) {
    return __riscv_cv_mac_mulhhuN(x, y, 0);
}

// CHECK-LABEL: @test_mac_mulsN
// CHECK:  @llvm.riscv.cv.mac.mulsN
int32_t test_mac_mulsN(uint32_t x, uint32_t y) {
    return __riscv_cv_mac_mulsN(x, y, 0);
}

// CHECK-LABEL: @test_mac_mulhhsN
// CHECK: @llvm.riscv.cv.mac.mulhhsN
int32_t test_mac_mulhhsN(uint32_t x, uint32_t y) {
    return __riscv_cv_mac_mulhhsN(x, y, 0);
}

// CHECK-LABEL: @test_mac_muluRN
// CHECK: @llvm.riscv.cv.mac.muluRN
uint32_t test_mac_muluRN(uint32_t x, uint32_t y) {
    return __riscv_cv_mac_muluRN(x, y, 0);
}

// CHECK-LABEL: @test_mac_mulhhuRN
// CHECK: @llvm.riscv.cv.mac.mulhhuRN
uint32_t test_mac_mulhhuRN(uint32_t x, uint32_t y) {
    return __riscv_cv_mac_mulhhuRN(x, y, 0);
}

// CHECK-LABEL: @test_mac_mulsRN
// CHECK: @llvm.riscv.cv.mac.mulsRN
int32_t test_mac_mulsRN(uint32_t x, uint32_t y) {
    return __riscv_cv_mac_mulsRN(x, y, 0);
}

// CHECK-LABEL: @test_mac_mulhhsRN
// CHECK: @llvm.riscv.cv.mac.mulhhsRN
int32_t test_mac_mulhhsRN(uint32_t x, uint32_t y) {
    return __riscv_cv_mac_mulhhsRN(x, y, 0);
}

// 16-bit x 16-bit multiply-accumulate
// CHECK-LABEL: @test_mac_macuN
// CHECK: @llvm.riscv.cv.mac.macuN
uint32_t test_mac_macuN(uint32_t x, uint32_t y, uint32_t z) {
    return __riscv_cv_mac_macuN(x, y, z, 0);
}

// CHECK-LABEL: @test_mac_machhuN
// CHECK: @llvm.riscv.cv.mac.machhuN
uint32_t test_mac_machhuN(uint32_t x, uint32_t y, uint32_t z) {
    return __riscv_cv_mac_machhuN(x, y, z, 0);
}

// CHECK-LABEL: @test_mac_macsN
// CHECK: @llvm.riscv.cv.mac.macsN
int32_t test_mac_macsN(uint32_t x, uint32_t y, int32_t z) {
    return __riscv_cv_mac_macsN(x, y, z, 0);
}

// CHECK-LABEL: @test_mac_machhsN
// CHECK: @llvm.riscv.cv.mac.machhsN
int32_t test_mac_machhsN(uint32_t x, uint32_t y, int32_t z) {
    return __riscv_cv_mac_machhsN(x, y, z, 0);
}

// CHECK-LABEL: @test_mac_macuRN
// CHECK: @llvm.riscv.cv.mac.macuRN
uint32_t test_mac_macuRN(uint32_t x, uint32_t y, uint32_t z) {
    return __riscv_cv_mac_macuRN(x, y, z, 0);
}

// CHECK-LABEL: @test_mac_machhuRN
// CHECK: @llvm.riscv.cv.mac.machhuRN
uint32_t test_mac_machhuRN(uint32_t x, uint32_t y, uint32_t z) {
    return __riscv_cv_mac_machhuRN(x, y, z, 0);
}

// CHECK-LABEL: @test_mac_macsRN
// CHECK: @llvm.riscv.cv.mac.macsRN
int32_t test_mac_macsRN(uint32_t x, uint32_t y, int32_t z) {
    return __riscv_cv_mac_macsRN(x, y, z, 0);
}

// CHECK-LABEL: @test_mac_machhsRN
// CHECK: @llvm.riscv.cv.mac.machhsRN
int32_t test_mac_machhsRN(uint32_t x, uint32_t y, int32_t z) {
    return __riscv_cv_mac_machhsRN(x, y, z, 0);
}
