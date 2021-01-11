//===- IntrinsicsRISCV.td - Defines RISCV intrinsics -------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines all of the RISCV-specific intrinsics.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Atomics

// Atomic Intrinsics have multiple versions for different access widths, which
// all follow one of the following signatures (depending on how many arguments
// they require). We carefully instantiate only specific versions of these for
// specific integer widths, rather than using `llvm_anyint_ty`.
//
// In fact, as these intrinsics take `llvm_anyptr_ty`, the given names are the
// canonical names, and the intrinsics used in the code will have a name
// suffixed with the pointer type they are specialised for (denoted `<p>` in the
// names below), in order to avoid type conflicts.

let TargetPrefix = "riscv" in {

  // T @llvm.<name>.T.<p>(any*, T, T, T imm);
  class MaskedAtomicRMWFourArg<LLVMType itype>
      : Intrinsic<[itype], [llvm_anyptr_ty, itype, itype, itype],
                  [IntrArgMemOnly, NoCapture<ArgIndex<0>>, ImmArg<ArgIndex<3>>]>;
  // T @llvm.<name>.T.<p>(any*, T, T, T, T imm);
  class MaskedAtomicRMWFiveArg<LLVMType itype>
      : Intrinsic<[itype], [llvm_anyptr_ty, itype, itype, itype, itype],
                  [IntrArgMemOnly, NoCapture<ArgIndex<0>>, ImmArg<ArgIndex<4>>]>;

  // We define 32-bit and 64-bit variants of the above, where T stands for i32
  // or i64 respectively:
  multiclass MaskedAtomicRMWFourArgIntrinsics {
    // i32 @llvm.<name>.i32.<p>(any*, i32, i32, i32 imm);
    def _i32 : MaskedAtomicRMWFourArg<llvm_i32_ty>;
    // i64 @llvm.<name>.i32.<p>(any*, i64, i64, i64 imm);
    def _i64 : MaskedAtomicRMWFourArg<llvm_i64_ty>;
  }

  multiclass MaskedAtomicRMWFiveArgIntrinsics {
    // i32 @llvm.<name>.i32.<p>(any*, i32, i32, i32, i32 imm);
    def _i32 : MaskedAtomicRMWFiveArg<llvm_i32_ty>;
    // i64 @llvm.<name>.i64.<p>(any*, i64, i64, i64, i64 imm);
    def _i64 : MaskedAtomicRMWFiveArg<llvm_i64_ty>;
  }

  // @llvm.riscv.masked.atomicrmw.*.{i32,i64}.<p>(...)
  defm int_riscv_masked_atomicrmw_xchg : MaskedAtomicRMWFourArgIntrinsics;
  defm int_riscv_masked_atomicrmw_add : MaskedAtomicRMWFourArgIntrinsics;
  defm int_riscv_masked_atomicrmw_sub : MaskedAtomicRMWFourArgIntrinsics;
  defm int_riscv_masked_atomicrmw_nand : MaskedAtomicRMWFourArgIntrinsics;
  // Signed min and max need an extra operand to do sign extension with.
  defm int_riscv_masked_atomicrmw_max : MaskedAtomicRMWFiveArgIntrinsics;
  defm int_riscv_masked_atomicrmw_min : MaskedAtomicRMWFiveArgIntrinsics;
  // Unsigned min and max don't need the extra operand.
  defm int_riscv_masked_atomicrmw_umax : MaskedAtomicRMWFourArgIntrinsics;
  defm int_riscv_masked_atomicrmw_umin : MaskedAtomicRMWFourArgIntrinsics;

  // @llvm.riscv.masked.cmpxchg.{i32,i64}.<p>(...)
  defm int_riscv_masked_cmpxchg : MaskedAtomicRMWFiveArgIntrinsics;

} // TargetPrefix = "riscv"

// CORE-V instrinsics
let TargetPrefix = "riscv" in {
  class CoreVBuiltin<string name,
                     LLVMType ret_type,
                     list<LLVMType> param_types,
                     list<IntrinsicProperty> intr_properties>
    : GCCBuiltin<"__builtin_corev_" # name>,
      Intrinsic<[ret_type], param_types, intr_properties>;

  def int_riscv_cv_mac :      CoreVBuiltin<"mac", llvm_i32_ty,
                                           [llvm_i32_ty, llvm_i32_ty, llvm_i32_ty],
                                           [IntrNoMem, Returned<ArgIndex<0>>]>;
  def int_riscv_cv_msu :      CoreVBuiltin<"msu", llvm_i32_ty,
                                           [llvm_i32_ty, llvm_i32_ty, llvm_i32_ty],
                                           [IntrNoMem, Returned<ArgIndex<0>>]>;

  def int_riscv_cv_muls :     CoreVBuiltin<"muls", llvm_i32_ty,
                                           [llvm_i16_ty, llvm_i16_ty],
                                           [IntrNoMem]>;
  def int_riscv_cv_mulhhs :   CoreVBuiltin<"mulhhs", llvm_i32_ty,
                                           [llvm_i32_ty, llvm_i32_ty],
                                           [IntrNoMem]>;
  def int_riscv_cv_mulsn :    CoreVBuiltin<"mulsn", llvm_i32_ty,
                                           [llvm_i16_ty, llvm_i16_ty, llvm_i16_ty],
                                           [IntrNoMem, ImmArg<ArgIndex<2>>]>;
  def int_riscv_cv_mulhhsn :  CoreVBuiltin<"mulhhsn", llvm_i32_ty,
                                           [llvm_i32_ty, llvm_i32_ty, llvm_i16_ty],
                                           [IntrNoMem, ImmArg<ArgIndex<2>>]>;
  def int_riscv_cv_mulsrn :   CoreVBuiltin<"mulsrn", llvm_i32_ty,
                                           [llvm_i16_ty, llvm_i16_ty, llvm_i16_ty],
                                           [IntrNoMem, ImmArg<ArgIndex<2>>]>;
  def int_riscv_cv_mulhhsrn : CoreVBuiltin<"mulhhsrn", llvm_i32_ty,
                                           [llvm_i32_ty, llvm_i32_ty, llvm_i16_ty],
                                           [IntrNoMem, ImmArg<ArgIndex<2>>]>;

  def int_riscv_cv_mulu :     CoreVBuiltin<"mulu", llvm_i32_ty,
                                           [llvm_i16_ty, llvm_i16_ty],
                                           [IntrNoMem]>;
  def int_riscv_cv_mulhhu :   CoreVBuiltin<"mulhhu", llvm_i32_ty,
                                           [llvm_i32_ty, llvm_i32_ty],
                                           [IntrNoMem]>;
  def int_riscv_cv_mulun :    CoreVBuiltin<"mulun", llvm_i32_ty,
                                           [llvm_i16_ty, llvm_i16_ty, llvm_i16_ty],
                                           [IntrNoMem, ImmArg<ArgIndex<2>>]>;
  def int_riscv_cv_mulhhun :  CoreVBuiltin<"mulhhun", llvm_i32_ty,
                                           [llvm_i32_ty, llvm_i32_ty, llvm_i16_ty],
                                           [IntrNoMem, ImmArg<ArgIndex<2>>]>;
  def int_riscv_cv_mulurn :   CoreVBuiltin<"mulurn", llvm_i32_ty,
                                           [llvm_i16_ty, llvm_i16_ty, llvm_i16_ty],
                                           [IntrNoMem, ImmArg<ArgIndex<2>>]>;
  def int_riscv_cv_mulhhurn : CoreVBuiltin<"mulhhurn", llvm_i32_ty,
                                           [llvm_i32_ty, llvm_i32_ty, llvm_i16_ty],
                                           [IntrNoMem, ImmArg<ArgIndex<2>>]>;

  def int_riscv_cv_macsn :    CoreVBuiltin<"macsn", llvm_i32_ty,
                                           [llvm_i32_ty, llvm_i16_ty, llvm_i16_ty, llvm_i16_ty],
                                           [IntrNoMem, Returned<ArgIndex<0>>, ImmArg<ArgIndex<3>>]>;
  def int_riscv_cv_machhsn :  CoreVBuiltin<"machhsn", llvm_i32_ty,
                                           [llvm_i32_ty, llvm_i32_ty, llvm_i32_ty, llvm_i16_ty],
                                           [IntrNoMem, Returned<ArgIndex<0>>, ImmArg<ArgIndex<3>>]>;
  def int_riscv_cv_macsrn :   CoreVBuiltin<"macsrn", llvm_i32_ty,
                                           [llvm_i32_ty, llvm_i16_ty, llvm_i16_ty, llvm_i16_ty],
                                           [IntrNoMem, Returned<ArgIndex<0>>, ImmArg<ArgIndex<3>>]>;
  def int_riscv_cv_machhsrn : CoreVBuiltin<"machhsrn", llvm_i32_ty,
                                           [llvm_i32_ty, llvm_i32_ty, llvm_i32_ty, llvm_i16_ty],
                                           [IntrNoMem, Returned<ArgIndex<0>>, ImmArg<ArgIndex<3>>]>;

  def int_riscv_cv_macun :    CoreVBuiltin<"macun", llvm_i32_ty,
                                           [llvm_i32_ty, llvm_i16_ty, llvm_i16_ty, llvm_i16_ty],
                                           [IntrNoMem, Returned<ArgIndex<0>>, ImmArg<ArgIndex<3>>]>;
  def int_riscv_cv_machhun :  CoreVBuiltin<"machhun", llvm_i32_ty,
                                           [llvm_i32_ty, llvm_i32_ty, llvm_i32_ty, llvm_i16_ty],
                                           [IntrNoMem, Returned<ArgIndex<0>>, ImmArg<ArgIndex<3>>]>;
  def int_riscv_cv_macurn :   CoreVBuiltin<"macurn", llvm_i32_ty,
                                           [llvm_i32_ty, llvm_i16_ty, llvm_i16_ty, llvm_i16_ty],
                                           [IntrNoMem, Returned<ArgIndex<0>>, ImmArg<ArgIndex<3>>]>;
  def int_riscv_cv_machhurn : CoreVBuiltin<"machhurn", llvm_i32_ty,
                                           [llvm_i32_ty, llvm_i32_ty, llvm_i32_ty, llvm_i16_ty],
                                           [IntrNoMem, Returned<ArgIndex<0>>, ImmArg<ArgIndex<3>>]>;
}
