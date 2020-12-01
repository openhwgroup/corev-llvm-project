; RUN: llc < %s -mtriple=riscv32 -mattr=xcorev | FileCheck %s
; RUN: llc < %s -mtriple=riscv32 | FileCheck %s -check-prefix=CHECK-NOHWLP
; RUN: llc < %s -mtriple=riscv32 -mattr=xcorev,c --show-mc-encoding \
; RUN:   | FileCheck %s -check-prefix=CHECK-ENCODING

declare void @llvm.memcpy.p0i8.p0i8.i32(i8 *nocapture, i8 *nocapture, i32, i1) nounwind

define void @with_hwlp_unaligned(i8* %dest, i8* %src) {
  ; CHECK-LABEL: with_hwlp_unaligned:
  ; CHECK: .option push
  ; CHECK-NEXT: .option norvc
  ; CHECK-NEXT: cv.setupi 0, 16, .LBB0_2
  ; CHECK-NEXT: lb a2, 0(a1)
  ; CHECK-NEXT: sb a2, 0(a0)
  ; CHECK-NEXT: addi a1, a1, 1
  ; CHECK-NEXT: addi a0, a0, 1
  ; CHECK-NEXT: .option pop
  ; CHECK-NEXT: .LBB0_2
  ; CHECK-NEXT: .option push
  ; CHECK-NEXT: .option norvc
  ; CHECK-NEXT: nop
  ; CHECK-NEXT: .option pop
  ; CHECK-NEXT: .LBB0_3
  ; CHECK-NEXT: ret
  ; CHECK-ENCODING: [0x03,0x86,0x05,0x00]
  ; CHECK-ENCODING: [0x23,0x00,0xc5,0x00]
  ; CHECK-ENCODING: [0x93,0x85,0x15,0x00]
  ; CHECK-ENCODING: [0x13,0x05,0x15,0x00]
  ; CHECK-ENCODING: [0x13,0x00,0x00,0x00]
  ; CHECK-ENCODING: [0x82,0x80]
  ; CHECK-NOHWLP: call memcpy
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %dest, i8* %src, i32 16, i1 false)
  ret void
}

define void @with_hwlp(i8* %dest, i8* %src) {
  ; CHECK-LABEL: with_hwlp:
  ; CHECK: .option push
  ; CHECK-NEXT: .option norvc
  ; CHECK-NEXT: cv.setupi 0, 33, .LBB1_2
  ; CHECK-NEXT: lb a2, 0(a1)
  ; CHECK-NEXT: sb a2, 0(a0)
  ; CHECK-NEXT: addi a1, a1, 1
  ; CHECK-NEXT: addi a0, a0, 1
  ; CHECK-NEXT: .option pop
  ; CHECK-NEXT: .LBB1_2
  ; CHECK-NEXT: .option push
  ; CHECK-NEXT: .option norvc
  ; CHECK-NEXT: nop
  ; CHECK-NEXT: .option pop
  ; CHECK-NEXT: .LBB1_3
  ; CHECK-NEXT: ret
  ; CHECK-ENCODING: [0x03,0x86,0x05,0x00]
  ; CHECK-ENCODING: [0x23,0x00,0xc5,0x00]
  ; CHECK-ENCODING: [0x93,0x85,0x15,0x00]
  ; CHECK-ENCODING: [0x13,0x05,0x15,0x00]
  ; CHECK-ENCODING: [0x13,0x00,0x00,0x00]
  ; CHECK-ENCODING: [0x82,0x80]
  ; CHECK-NOHWLP: call memcpy
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %dest, i8* align 4 %src, i32 33, i1 false)
  ret void
}

define void @with_hwlp_max_count(i8* %dest, i8* %src) {
  ; CHECK-LABEL: with_hwlp_max_count:
  ; CHECK: .option push
  ; CHECK-NEXT: .option norvc
  ; CHECK-NEXT: cv.setupi 0, 4095, .LBB2_2
  ; CHECK-NEXT: lb a2, 0(a1)
  ; CHECK-NEXT: sb a2, 0(a0)
  ; CHECK-NEXT: addi a1, a1, 1
  ; CHECK-NEXT: addi a0, a0, 1
  ; CHECK-NEXT: .option pop
  ; CHECK-NEXT: .LBB2_2
  ; CHECK-NEXT: .option push
  ; CHECK-NEXT: .option norvc
  ; CHECK-NEXT: nop
  ; CHECK-NEXT: .option pop
  ; CHECK-NEXT: .LBB2_3
  ; CHECK-NEXT: ret
  ; CHECK-ENCODING: [0x03,0x86,0x05,0x00]
  ; CHECK-ENCODING: [0x23,0x00,0xc5,0x00]
  ; CHECK-ENCODING: [0x93,0x85,0x15,0x00]
  ; CHECK-ENCODING: [0x13,0x05,0x15,0x00]
  ; CHECK-ENCODING: [0x13,0x00,0x00,0x00]
  ; CHECK-ENCODING: [0x82,0x80]
  ; CHECK-NOHWLP: call memcpy
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %dest, i8* align 4 %src, i32 4095, i1 false)
  ret void
}

define void @with_load_store(i8* %Dest, i8* %Src) {
  ; CHECK-LABEL: with_load_store:
  ; CHECK: lw a2, 28(a1)
  ; CHECK-NEXT: sw a2, 28(a0)
  ; CHECK-NEXT: lw a2, 24(a1)
  ; CHECK-NEXT: sw a2, 24(a0)
  ; CHECK-NEXT: lw a2, 20(a1)
  ; CHECK-NEXT: sw a2, 20(a0)
  ; CHECK-NEXT: lw a2, 16(a1)
  ; CHECK-NEXT: sw a2, 16(a0)
  ; CHECK-NEXT: lw a2, 12(a1)
  ; CHECK-NEXT: sw a2, 12(a0)
  ; CHECK-NEXT: lw a2, 8(a1)
  ; CHECK-NEXT: sw a2, 8(a0)
  ; CHECK-NEXT: lw a2, 4(a1)
  ; CHECK-NEXT: sw a2, 4(a0)
  ; CHECK-NEXT: lw a1, 0(a1)
  ; CHECK-NEXT: sw a1, 0(a0)
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %Dest, i8* align 4 %Src, i32 32, i1 false)
  ret void
}

define void @without_hwlp_max_count_p1(i8* %dest, i8* %src) {
  ; CHECK-LABEL: without_hwlp_max_count_p1:
  ; CHECK: call memcpy
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %dest, i8* align 4 %src, i32 4096, i1 false)
  ret void
}
