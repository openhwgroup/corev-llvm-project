// RUN: %clang_cc1 -triple riscv32 -target-feature +xcorevmac -emit-llvm -o - %s | FileCheck %s

int test_corev_mac(int dest, int src1, int src2) {
  // CHECK: %3 = call i32 @llvm.riscv.cv.mac(i32 %0, i32 %1, i32 %2)
  dest = __builtin_corev_mac(dest, src1, src2);
  return dest;
}

int test_corev_msu(int dest, int src1, int src2) {
  // CHECK: %3 = call i32 @llvm.riscv.cv.msu(i32 %0, i32 %1, i32 %2)
  dest = __builtin_corev_msu(dest, src1, src2);
  return dest;
}

int test_corev_muls(int dest, short src1, short src2) {
  // CHECK: %2 = call i32 @llvm.riscv.cv.muls(i16 %0, i16 %1)
  dest = __builtin_corev_muls(src1, src2);
  return dest;
}

int test_corev_mulhhs(int dest, int src1, int src2) {
  // CHECK: %2 = call i32 @llvm.riscv.cv.mulhhs(i32 %0, i32 %1)
  dest = __builtin_corev_mulhhs(src1, src2);
  return dest;
}

int test_corev_mulsn(int dest, short src1, short src2) {
  // CHECK: %2 = call i32 @llvm.riscv.cv.mulsn(i16 %0, i16 %1, i16 0)
  dest = __builtin_corev_mulsn(src1, src2, 0);
  return dest;
}

int test_corev_mulhhsn(int dest, int src1, int src2) {
  // CHECK: %2 = call i32 @llvm.riscv.cv.mulhhsn(i32 %0, i32 %1, i16 0)
  dest = __builtin_corev_mulhhsn(src1, src2, 0);
  return dest;
}

int test_corev_mulsrn(int dest, short src1, short src2) {
  // CHECK: %2 = call i32 @llvm.riscv.cv.mulsrn(i16 %0, i16 %1, i16 0)
  dest = __builtin_corev_mulsrn(src1, src2, 0);
  return dest;
}

int test_corev_mulhhsrn(int dest, int src1, int src2) {
  // CHECK: %2 = call i32 @llvm.riscv.cv.mulhhsrn(i32 %0, i32 %1, i16 0)
  dest = __builtin_corev_mulhhsrn(src1, src2, 0);
  return dest;
}

int test_corev_mulu(int dest, short src1, short src2) {
  // CHECK: %2 = call i32 @llvm.riscv.cv.mulu(i16 %0, i16 %1)
  dest = __builtin_corev_mulu(src1, src2);
  return dest;
}

int test_corev_mulhhu(int dest, int src1, int src2) {
  // CHECK: %2 = call i32 @llvm.riscv.cv.mulhhu(i32 %0, i32 %1)
  dest = __builtin_corev_mulhhu(src1, src2);
  return dest;
}

int test_corev_mulun(int dest, short src1, short src2) {
  // CHECK: %2 = call i32 @llvm.riscv.cv.mulun(i16 %0, i16 %1, i16 0)
  dest = __builtin_corev_mulun(src1, src2, 0);
  return dest;
}

int test_corev_mulhhun(int dest, int src1, int src2) {
  // CHECK: %2 = call i32 @llvm.riscv.cv.mulhhun(i32 %0, i32 %1, i16 0)
  dest = __builtin_corev_mulhhun(src1, src2, 0);
  return dest;
}

int test_corev_mulurn(int dest, short src1, short src2) {
  // CHECK: %2 = call i32 @llvm.riscv.cv.mulurn(i16 %0, i16 %1, i16 0)
  dest = __builtin_corev_mulurn(src1, src2, 0);
  return dest;
}

int test_corev_mulhhurn(int dest, int src1, int src2) {
  // CHECK: %2 = call i32 @llvm.riscv.cv.mulhhurn(i32 %0, i32 %1, i16 0)
  dest = __builtin_corev_mulhhurn(src1, src2, 0);
  return dest;
}

int test_corev_macsn(int dest, short src1, short src2) {
  // CHECK: %3 = call i32 @llvm.riscv.cv.macsn(i32 %0, i16 %1, i16 %2, i16 0)
  dest = __builtin_corev_macsn(dest, src1, src2, 0);
  return dest;
}

int test_corev_machhsn(int dest, int src1, int src2) {
  // CHECK: %3 = call i32 @llvm.riscv.cv.machhsn(i32 %0, i32 %1, i32 %2, i16 0)
  dest = __builtin_corev_machhsn(dest, src1, src2, 0);
  return dest;
}

int test_corev_macsrn(int dest, short src1, short src2) {
  // CHECK: %3 = call i32 @llvm.riscv.cv.macsrn(i32 %0, i16 %1, i16 %2, i16 0)
  dest = __builtin_corev_macsrn(dest, src1, src2, 0);
  return dest;
}

int test_corev_machhsrn(int dest, int src1, int src2) {
  // CHECK: %3 = call i32 @llvm.riscv.cv.machhsrn(i32 %0, i32 %1, i32 %2, i16 0)
  dest = __builtin_corev_machhsrn(dest, src1, src2, 0);
  return dest;
}

int test_corev_macun(int dest, short src1, short src2) {
  // CHECK: %3 = call i32 @llvm.riscv.cv.macun(i32 %0, i16 %1, i16 %2, i16 0)
  dest = __builtin_corev_macun(dest, src1, src2, 0);
  return dest;
}

int test_corev_machhun(int dest, int src1, int src2) {
  // CHECK: %3 = call i32 @llvm.riscv.cv.machhun(i32 %0, i32 %1, i32 %2, i16 0)
  dest = __builtin_corev_machhun(dest, src1, src2, 0);
  return dest;
}

int test_corev_macurn(int dest, short src1, short src2) {
  // CHECK: %3 = call i32 @llvm.riscv.cv.macurn(i32 %0, i16 %1, i16 %2, i16 0)
  dest = __builtin_corev_macurn(dest, src1, src2, 0);
  return dest;
}

int test_corev_machhurn(int dest, int src1, int src2) {
  // CHECK: %3 = call i32 @llvm.riscv.cv.machhurn(i32 %0, i32 %1, i32 %2, i16 0)
  dest = __builtin_corev_machhurn(dest, src1, src2, 0);
  return dest;
}
