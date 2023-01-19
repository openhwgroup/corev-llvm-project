# RUN: llvm-mc -triple=riscv32 --mattr=+xcvsimd -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INSTR
# RUN: not llvm-mc -triple=riscv32 -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
# RUN: llvm-mc -filetype=obj -triple=riscv32 --mattr=+xcvsimd < %s \
# RUN:     | llvm-objdump -M no-aliases  --mattr=+xcvsimd -d -r - \
# RUN:     | FileCheck -check-prefixes=CHECK-INSTR %s
# RUN: llvm-mc -filetype=obj -triple=riscv32 --mattr=+xcvsimd %s \
# RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

cv.add.h t0, t1, t2
# CHECK-INSTR: cv.add.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x00] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 00 <unknown>

cv.add.h a0, a1, a2
# CHECK-INSTR: cv.add.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x00] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 00 <unknown>

cv.add.h s0, s1, s2
# CHECK-INSTR: cv.add.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x01] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 01 <unknown>

cv.add.b t0, t1, t2
# CHECK-INSTR: cv.add.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x00] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 00 <unknown>

cv.add.b a0, a1, a2
# CHECK-INSTR: cv.add.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x00] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 00 <unknown>

cv.add.b s0, s1, s2
# CHECK-INSTR: cv.add.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x01] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 01 <unknown>

cv.add.sc.h t0, t1, t2
# CHECK-INSTR: cv.add.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x00] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 00 <unknown>

cv.add.sc.h a0, a1, a2
# CHECK-INSTR: cv.add.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x00] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 00 <unknown>

cv.add.sc.h s0, s1, s2
# CHECK-INSTR: cv.add.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x01] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 01 <unknown>

cv.add.sc.b t0, t1, t2
# CHECK-INSTR: cv.add.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x00] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 00 <unknown>

cv.add.sc.b a0, a1, a2
# CHECK-INSTR: cv.add.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x00] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 00 <unknown>

cv.add.sc.b s0, s1, s2
# CHECK-INSTR: cv.add.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x01] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 01 <unknown>

cv.add.sci.h t0, t1, -32
# CHECK-INSTR: cv.add.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x01] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 01 <unknown>

cv.add.sci.h a0, a1, 7
# CHECK-INSTR: cv.add.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x02] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 02 <unknown>

cv.add.sci.h s0, s1, -1
# CHECK-INSTR: cv.add.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x03] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 03 <unknown>

cv.add.sci.b t0, t1, -32
# CHECK-INSTR: cv.add.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x01] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 01 <unknown>

cv.add.sci.b a0, a1, 7
# CHECK-INSTR: cv.add.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x02] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 02 <unknown>

cv.add.sci.b s0, s1, -1
# CHECK-INSTR: cv.add.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x03] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 03 <unknown>

cv.sub.h t0, t1, t2
# CHECK-INSTR: cv.sub.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x08] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 08 <unknown>

cv.sub.h a0, a1, a2
# CHECK-INSTR: cv.sub.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x08] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 08 <unknown>

cv.sub.h s0, s1, s2
# CHECK-INSTR: cv.sub.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x09] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 09 <unknown>

cv.sub.b t0, t1, t2
# CHECK-INSTR: cv.sub.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x08] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 08 <unknown>

cv.sub.b a0, a1, a2
# CHECK-INSTR: cv.sub.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x08] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 08 <unknown>

cv.sub.b s0, s1, s2
# CHECK-INSTR: cv.sub.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x09] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 09 <unknown>

cv.sub.sc.h t0, t1, t2
# CHECK-INSTR: cv.sub.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x08] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 08 <unknown>

cv.sub.sc.h a0, a1, a2
# CHECK-INSTR: cv.sub.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x08] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 08 <unknown>

cv.sub.sc.h s0, s1, s2
# CHECK-INSTR: cv.sub.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x09] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 09 <unknown>

cv.sub.sc.b t0, t1, t2
# CHECK-INSTR: cv.sub.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x08] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 08 <unknown>

cv.sub.sc.b a0, a1, a2
# CHECK-INSTR: cv.sub.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x08] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 08 <unknown>

cv.sub.sc.b s0, s1, s2
# CHECK-INSTR: cv.sub.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x09] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 09 <unknown>

cv.sub.sci.h t0, t1, -32
# CHECK-INSTR: cv.sub.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x09] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 09 <unknown>

cv.sub.sci.h a0, a1, 7
# CHECK-INSTR: cv.sub.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x0a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 0a <unknown>

cv.sub.sci.h s0, s1, -1
# CHECK-INSTR: cv.sub.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x0b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 0b <unknown>

cv.sub.sci.b t0, t1, -32
# CHECK-INSTR: cv.sub.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x09] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 09 <unknown>

cv.sub.sci.b a0, a1, 7
# CHECK-INSTR: cv.sub.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x0a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 0a <unknown>

cv.sub.sci.b s0, s1, -1
# CHECK-INSTR: cv.sub.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x0b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 0b <unknown>

cv.avg.h t0, t1, t2
# CHECK-INSTR: cv.avg.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x10] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 10 <unknown>

cv.avg.h a0, a1, a2
# CHECK-INSTR: cv.avg.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x10] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 10 <unknown>

cv.avg.h s0, s1, s2
# CHECK-INSTR: cv.avg.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x11] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 11 <unknown>

cv.avg.b t0, t1, t2
# CHECK-INSTR: cv.avg.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x10] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 10 <unknown>

cv.avg.b a0, a1, a2
# CHECK-INSTR: cv.avg.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x10] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 10 <unknown>

cv.avg.b s0, s1, s2
# CHECK-INSTR: cv.avg.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x11] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 11 <unknown>

cv.avg.sc.h t0, t1, t2
# CHECK-INSTR: cv.avg.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x10] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 10 <unknown>

cv.avg.sc.h a0, a1, a2
# CHECK-INSTR: cv.avg.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x10] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 10 <unknown>

cv.avg.sc.h s0, s1, s2
# CHECK-INSTR: cv.avg.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x11] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 11 <unknown>

cv.avg.sc.b t0, t1, t2
# CHECK-INSTR: cv.avg.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x10] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 10 <unknown>

cv.avg.sc.b a0, a1, a2
# CHECK-INSTR: cv.avg.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x10] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 10 <unknown>

cv.avg.sc.b s0, s1, s2
# CHECK-INSTR: cv.avg.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x11] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 11 <unknown>

cv.avg.sci.h t0, t1, -32
# CHECK-INSTR: cv.avg.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x11] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 11 <unknown>

cv.avg.sci.h a0, a1, 7
# CHECK-INSTR: cv.avg.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x12] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 12 <unknown>

cv.avg.sci.h s0, s1, -1
# CHECK-INSTR: cv.avg.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x13] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 13 <unknown>

cv.avg.sci.b t0, t1, -32
# CHECK-INSTR: cv.avg.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x11] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 11 <unknown>

cv.avg.sci.b a0, a1, 7
# CHECK-INSTR: cv.avg.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x12] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 12 <unknown>

cv.avg.sci.b s0, s1, -1
# CHECK-INSTR: cv.avg.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x13] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 13 <unknown>

cv.avgu.h t0, t1, t2
# CHECK-INSTR: cv.avgu.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x18] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 18 <unknown>

cv.avgu.h a0, a1, a2
# CHECK-INSTR: cv.avgu.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x18] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 18 <unknown>

cv.avgu.h s0, s1, s2
# CHECK-INSTR: cv.avgu.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x19] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 19 <unknown>

cv.avgu.b t0, t1, t2
# CHECK-INSTR: cv.avgu.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x18] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 18 <unknown>

cv.avgu.b a0, a1, a2
# CHECK-INSTR: cv.avgu.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x18] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 18 <unknown>

cv.avgu.b s0, s1, s2
# CHECK-INSTR: cv.avgu.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x19] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 19 <unknown>

cv.avgu.sc.h t0, t1, t2
# CHECK-INSTR: cv.avgu.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x18] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 18 <unknown>

cv.avgu.sc.h a0, a1, a2
# CHECK-INSTR: cv.avgu.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x18] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 18 <unknown>

cv.avgu.sc.h s0, s1, s2
# CHECK-INSTR: cv.avgu.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x19] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 19 <unknown>

cv.avgu.sc.b t0, t1, t2
# CHECK-INSTR: cv.avgu.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x18] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 18 <unknown>

cv.avgu.sc.b a0, a1, a2
# CHECK-INSTR: cv.avgu.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x18] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 18 <unknown>

cv.avgu.sc.b s0, s1, s2
# CHECK-INSTR: cv.avgu.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x19] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 19 <unknown>

cv.avgu.sci.h t0, t1, -32
# CHECK-INSTR: cv.avgu.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x19] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 19 <unknown>

cv.avgu.sci.h a0, a1, 7
# CHECK-INSTR: cv.avgu.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x1a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 1a <unknown>

cv.avgu.sci.h s0, s1, -1
# CHECK-INSTR: cv.avgu.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x1b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 1b <unknown>

cv.avgu.sci.b t0, t1, -32
# CHECK-INSTR: cv.avgu.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x19] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 19 <unknown>

cv.avgu.sci.b a0, a1, 7
# CHECK-INSTR: cv.avgu.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x1a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 1a <unknown>

cv.avgu.sci.b s0, s1, -1
# CHECK-INSTR: cv.avgu.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x1b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 1b <unknown>

cv.min.h t0, t1, t2
# CHECK-INSTR: cv.min.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x20] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 20 <unknown>

cv.min.h a0, a1, a2
# CHECK-INSTR: cv.min.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x20] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 20 <unknown>

cv.min.h s0, s1, s2
# CHECK-INSTR: cv.min.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x21] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 21 <unknown>

cv.min.b t0, t1, t2
# CHECK-INSTR: cv.min.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x20] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 20 <unknown>

cv.min.b a0, a1, a2
# CHECK-INSTR: cv.min.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x20] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 20 <unknown>

cv.min.b s0, s1, s2
# CHECK-INSTR: cv.min.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x21] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 21 <unknown>

cv.min.sc.h t0, t1, t2
# CHECK-INSTR: cv.min.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x20] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 20 <unknown>

cv.min.sc.h a0, a1, a2
# CHECK-INSTR: cv.min.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x20] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 20 <unknown>

cv.min.sc.h s0, s1, s2
# CHECK-INSTR: cv.min.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x21] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 21 <unknown>

cv.min.sc.b t0, t1, t2
# CHECK-INSTR: cv.min.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x20] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 20 <unknown>

cv.min.sc.b a0, a1, a2
# CHECK-INSTR: cv.min.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x20] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 20 <unknown>

cv.min.sc.b s0, s1, s2
# CHECK-INSTR: cv.min.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x21] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 21 <unknown>

cv.min.sci.h t0, t1, -32
# CHECK-INSTR: cv.min.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x21] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 21 <unknown>

cv.min.sci.h a0, a1, 7
# CHECK-INSTR: cv.min.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x22] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 22 <unknown>

cv.min.sci.h s0, s1, -1
# CHECK-INSTR: cv.min.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x23] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 23 <unknown>

cv.min.sci.b t0, t1, -32
# CHECK-INSTR: cv.min.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x21] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 21 <unknown>

cv.min.sci.b a0, a1, 7
# CHECK-INSTR: cv.min.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x22] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 22 <unknown>

cv.min.sci.b s0, s1, -1
# CHECK-INSTR: cv.min.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x23] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 23 <unknown>

cv.minu.h t0, t1, t2
# CHECK-INSTR: cv.minu.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x28] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 28 <unknown>

cv.minu.h a0, a1, a2
# CHECK-INSTR: cv.minu.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x28] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 28 <unknown>

cv.minu.h s0, s1, s2
# CHECK-INSTR: cv.minu.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x29] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 29 <unknown>

cv.minu.b t0, t1, t2
# CHECK-INSTR: cv.minu.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x28] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 28 <unknown>

cv.minu.b a0, a1, a2
# CHECK-INSTR: cv.minu.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x28] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 28 <unknown>

cv.minu.b s0, s1, s2
# CHECK-INSTR: cv.minu.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x29] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 29 <unknown>

cv.minu.sc.h t0, t1, t2
# CHECK-INSTR: cv.minu.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x28] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 28 <unknown>

cv.minu.sc.h a0, a1, a2
# CHECK-INSTR: cv.minu.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x28] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 28 <unknown>

cv.minu.sc.h s0, s1, s2
# CHECK-INSTR: cv.minu.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x29] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 29 <unknown>

cv.minu.sc.b t0, t1, t2
# CHECK-INSTR: cv.minu.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x28] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 28 <unknown>

cv.minu.sc.b a0, a1, a2
# CHECK-INSTR: cv.minu.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x28] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 28 <unknown>

cv.minu.sc.b s0, s1, s2
# CHECK-INSTR: cv.minu.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x29] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 29 <unknown>

cv.minu.sci.h t0, t1, -32
# CHECK-INSTR: cv.minu.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x29] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 29 <unknown>

cv.minu.sci.h a0, a1, 7
# CHECK-INSTR: cv.minu.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x2a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 2a <unknown>

cv.minu.sci.h s0, s1, -1
# CHECK-INSTR: cv.minu.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x2b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 2b <unknown>

cv.minu.sci.b t0, t1, -32
# CHECK-INSTR: cv.minu.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x29] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 29 <unknown>

cv.minu.sci.b a0, a1, 7
# CHECK-INSTR: cv.minu.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x2a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 2a <unknown>

cv.minu.sci.b s0, s1, -1
# CHECK-INSTR: cv.minu.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x2b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 2b <unknown>

cv.max.h t0, t1, t2
# CHECK-INSTR: cv.max.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x30] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 30 <unknown>

cv.max.h a0, a1, a2
# CHECK-INSTR: cv.max.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x30] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 30 <unknown>

cv.max.h s0, s1, s2
# CHECK-INSTR: cv.max.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x31] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 31 <unknown>

cv.max.b t0, t1, t2
# CHECK-INSTR: cv.max.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x30] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 30 <unknown>

cv.max.b a0, a1, a2
# CHECK-INSTR: cv.max.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x30] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 30 <unknown>

cv.max.b s0, s1, s2
# CHECK-INSTR: cv.max.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x31] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 31 <unknown>

cv.max.sc.h t0, t1, t2
# CHECK-INSTR: cv.max.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x30] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 30 <unknown>

cv.max.sc.h a0, a1, a2
# CHECK-INSTR: cv.max.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x30] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 30 <unknown>

cv.max.sc.h s0, s1, s2
# CHECK-INSTR: cv.max.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x31] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 31 <unknown>

cv.max.sc.b t0, t1, t2
# CHECK-INSTR: cv.max.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x30] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 30 <unknown>

cv.max.sc.b a0, a1, a2
# CHECK-INSTR: cv.max.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x30] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 30 <unknown>

cv.max.sc.b s0, s1, s2
# CHECK-INSTR: cv.max.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x31] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 31 <unknown>

cv.max.sci.h t0, t1, -32
# CHECK-INSTR: cv.max.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x31] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 31 <unknown>

cv.max.sci.h a0, a1, 7
# CHECK-INSTR: cv.max.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x32] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 32 <unknown>

cv.max.sci.h s0, s1, -1
# CHECK-INSTR: cv.max.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x33] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 33 <unknown>

cv.max.sci.b t0, t1, -32
# CHECK-INSTR: cv.max.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x31] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 31 <unknown>

cv.max.sci.b a0, a1, 7
# CHECK-INSTR: cv.max.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x32] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 32 <unknown>

cv.max.sci.b s0, s1, -1
# CHECK-INSTR: cv.max.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x33] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 33 <unknown>

cv.maxu.h t0, t1, t2
# CHECK-INSTR: cv.maxu.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x38] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 38 <unknown>

cv.maxu.h a0, a1, a2
# CHECK-INSTR: cv.maxu.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x38] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 38 <unknown>

cv.maxu.h s0, s1, s2
# CHECK-INSTR: cv.maxu.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x39] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 39 <unknown>

cv.maxu.b t0, t1, t2
# CHECK-INSTR: cv.maxu.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x38] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 38 <unknown>

cv.maxu.b a0, a1, a2
# CHECK-INSTR: cv.maxu.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x38] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 38 <unknown>

cv.maxu.b s0, s1, s2
# CHECK-INSTR: cv.maxu.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x39] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 39 <unknown>

cv.maxu.sc.h t0, t1, t2
# CHECK-INSTR: cv.maxu.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x38] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 38 <unknown>

cv.maxu.sc.h a0, a1, a2
# CHECK-INSTR: cv.maxu.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x38] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 38 <unknown>

cv.maxu.sc.h s0, s1, s2
# CHECK-INSTR: cv.maxu.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x39] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 39 <unknown>

cv.maxu.sc.b t0, t1, t2
# CHECK-INSTR: cv.maxu.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x38] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 38 <unknown>

cv.maxu.sc.b a0, a1, a2
# CHECK-INSTR: cv.maxu.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x38] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 38 <unknown>

cv.maxu.sc.b s0, s1, s2
# CHECK-INSTR: cv.maxu.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x39] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 39 <unknown>

cv.maxu.sci.h t0, t1, -32
# CHECK-INSTR: cv.maxu.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x39] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 39 <unknown>

cv.maxu.sci.h a0, a1, 7
# CHECK-INSTR: cv.maxu.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x3a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 3a <unknown>

cv.maxu.sci.h s0, s1, -1
# CHECK-INSTR: cv.maxu.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x3b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 3b <unknown>

cv.maxu.sci.b t0, t1, -32
# CHECK-INSTR: cv.maxu.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x39] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 39 <unknown>

cv.maxu.sci.b a0, a1, 7
# CHECK-INSTR: cv.maxu.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x3a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 3a <unknown>

cv.maxu.sci.b s0, s1, -1
# CHECK-INSTR: cv.maxu.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x3b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 3b <unknown>

cv.srl.h t0, t1, t2
# CHECK-INSTR: cv.srl.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x40] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 40 <unknown>

cv.srl.h a0, a1, a2
# CHECK-INSTR: cv.srl.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x40] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 40 <unknown>

cv.srl.h s0, s1, s2
# CHECK-INSTR: cv.srl.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x41] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 41 <unknown>

cv.srl.b t0, t1, t2
# CHECK-INSTR: cv.srl.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x40] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 40 <unknown>

cv.srl.b a0, a1, a2
# CHECK-INSTR: cv.srl.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x40] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 40 <unknown>

cv.srl.b s0, s1, s2
# CHECK-INSTR: cv.srl.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x41] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 41 <unknown>

cv.srl.sc.h t0, t1, t2
# CHECK-INSTR: cv.srl.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x40] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 40 <unknown>

cv.srl.sc.h a0, a1, a2
# CHECK-INSTR: cv.srl.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x40] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 40 <unknown>

cv.srl.sc.h s0, s1, s2
# CHECK-INSTR: cv.srl.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x41] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 41 <unknown>

cv.srl.sc.b t0, t1, t2
# CHECK-INSTR: cv.srl.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x40] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 40 <unknown>

cv.srl.sc.b a0, a1, a2
# CHECK-INSTR: cv.srl.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x40] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 40 <unknown>

cv.srl.sc.b s0, s1, s2
# CHECK-INSTR: cv.srl.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x41] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 41 <unknown>

cv.srl.sci.h t0, t1, -32
# CHECK-INSTR: cv.srl.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x41] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 41 <unknown>

cv.srl.sci.h a0, a1, 7
# CHECK-INSTR: cv.srl.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x42] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 42 <unknown>

cv.srl.sci.h s0, s1, -1
# CHECK-INSTR: cv.srl.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x43] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 43 <unknown>

cv.srl.sci.b t0, t1, -32
# CHECK-INSTR: cv.srl.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x41] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 41 <unknown>

cv.srl.sci.b a0, a1, 7
# CHECK-INSTR: cv.srl.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x42] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 42 <unknown>

cv.srl.sci.b s0, s1, -1
# CHECK-INSTR: cv.srl.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x43] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 43 <unknown>

cv.sra.h t0, t1, t2
# CHECK-INSTR: cv.sra.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x48] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 48 <unknown>

cv.sra.h a0, a1, a2
# CHECK-INSTR: cv.sra.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x48] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 48 <unknown>

cv.sra.h s0, s1, s2
# CHECK-INSTR: cv.sra.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x49] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 49 <unknown>

cv.sra.b t0, t1, t2
# CHECK-INSTR: cv.sra.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x48] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 48 <unknown>

cv.sra.b a0, a1, a2
# CHECK-INSTR: cv.sra.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x48] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 48 <unknown>

cv.sra.b s0, s1, s2
# CHECK-INSTR: cv.sra.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x49] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 49 <unknown>

cv.sra.sc.h t0, t1, t2
# CHECK-INSTR: cv.sra.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x48] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 48 <unknown>

cv.sra.sc.h a0, a1, a2
# CHECK-INSTR: cv.sra.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x48] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 48 <unknown>

cv.sra.sc.h s0, s1, s2
# CHECK-INSTR: cv.sra.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x49] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 49 <unknown>

cv.sra.sc.b t0, t1, t2
# CHECK-INSTR: cv.sra.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x48] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 48 <unknown>

cv.sra.sc.b a0, a1, a2
# CHECK-INSTR: cv.sra.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x48] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 48 <unknown>

cv.sra.sc.b s0, s1, s2
# CHECK-INSTR: cv.sra.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x49] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 49 <unknown>

cv.sra.sci.h t0, t1, -32
# CHECK-INSTR: cv.sra.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x49] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 49 <unknown>

cv.sra.sci.h a0, a1, 7
# CHECK-INSTR: cv.sra.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x4a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 4a <unknown>

cv.sra.sci.h s0, s1, -1
# CHECK-INSTR: cv.sra.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x4b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 4b <unknown>

cv.sra.sci.b t0, t1, -32
# CHECK-INSTR: cv.sra.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x49] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 49 <unknown>

cv.sra.sci.b a0, a1, 7
# CHECK-INSTR: cv.sra.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x4a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 4a <unknown>

cv.sra.sci.b s0, s1, -1
# CHECK-INSTR: cv.sra.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x4b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 4b <unknown>

cv.sll.h t0, t1, t2
# CHECK-INSTR: cv.sll.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x50] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 50 <unknown>

cv.sll.h a0, a1, a2
# CHECK-INSTR: cv.sll.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x50] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 50 <unknown>

cv.sll.h s0, s1, s2
# CHECK-INSTR: cv.sll.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x51] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 51 <unknown>

cv.sll.b t0, t1, t2
# CHECK-INSTR: cv.sll.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x50] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 50 <unknown>

cv.sll.b a0, a1, a2
# CHECK-INSTR: cv.sll.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x50] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 50 <unknown>

cv.sll.b s0, s1, s2
# CHECK-INSTR: cv.sll.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x51] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 51 <unknown>

cv.sll.sc.h t0, t1, t2
# CHECK-INSTR: cv.sll.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x50] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 50 <unknown>

cv.sll.sc.h a0, a1, a2
# CHECK-INSTR: cv.sll.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x50] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 50 <unknown>

cv.sll.sc.h s0, s1, s2
# CHECK-INSTR: cv.sll.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x51] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 51 <unknown>

cv.sll.sc.b t0, t1, t2
# CHECK-INSTR: cv.sll.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x50] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 50 <unknown>

cv.sll.sc.b a0, a1, a2
# CHECK-INSTR: cv.sll.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x50] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 50 <unknown>

cv.sll.sc.b s0, s1, s2
# CHECK-INSTR: cv.sll.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x51] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 51 <unknown>

cv.sll.sci.h t0, t1, -32
# CHECK-INSTR: cv.sll.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x51] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 51 <unknown>

cv.sll.sci.h a0, a1, 7
# CHECK-INSTR: cv.sll.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x52] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 52 <unknown>

cv.sll.sci.h s0, s1, -1
# CHECK-INSTR: cv.sll.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x53] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 53 <unknown>

cv.sll.sci.b t0, t1, -32
# CHECK-INSTR: cv.sll.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x51] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 51 <unknown>

cv.sll.sci.b a0, a1, 7
# CHECK-INSTR: cv.sll.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x52] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 52 <unknown>

cv.sll.sci.b s0, s1, -1
# CHECK-INSTR: cv.sll.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x53] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 53 <unknown>

cv.or.h t0, t1, t2
# CHECK-INSTR: cv.or.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x58] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 58 <unknown>

cv.or.h a0, a1, a2
# CHECK-INSTR: cv.or.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x58] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 58 <unknown>

cv.or.h s0, s1, s2
# CHECK-INSTR: cv.or.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x59] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 59 <unknown>

cv.or.b t0, t1, t2
# CHECK-INSTR: cv.or.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x58] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 58 <unknown>

cv.or.b a0, a1, a2
# CHECK-INSTR: cv.or.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x58] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 58 <unknown>

cv.or.b s0, s1, s2
# CHECK-INSTR: cv.or.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x59] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 59 <unknown>

cv.or.sc.h t0, t1, t2
# CHECK-INSTR: cv.or.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x58] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 58 <unknown>

cv.or.sc.h a0, a1, a2
# CHECK-INSTR: cv.or.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x58] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 58 <unknown>

cv.or.sc.h s0, s1, s2
# CHECK-INSTR: cv.or.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x59] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 59 <unknown>

cv.or.sc.b t0, t1, t2
# CHECK-INSTR: cv.or.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x58] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 58 <unknown>

cv.or.sc.b a0, a1, a2
# CHECK-INSTR: cv.or.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x58] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 58 <unknown>

cv.or.sc.b s0, s1, s2
# CHECK-INSTR: cv.or.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x59] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 59 <unknown>

cv.or.sci.h t0, t1, -32
# CHECK-INSTR: cv.or.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x59] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 59 <unknown>

cv.or.sci.h a0, a1, 7
# CHECK-INSTR: cv.or.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x5a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 5a <unknown>

cv.or.sci.h s0, s1, -1
# CHECK-INSTR: cv.or.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x5b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 5b <unknown>

cv.or.sci.b t0, t1, -32
# CHECK-INSTR: cv.or.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x59] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 59 <unknown>

cv.or.sci.b a0, a1, 7
# CHECK-INSTR: cv.or.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x5a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 5a <unknown>

cv.or.sci.b s0, s1, -1
# CHECK-INSTR: cv.or.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x5b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 5b <unknown>

cv.xor.h t0, t1, t2
# CHECK-INSTR: cv.xor.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x60] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 60 <unknown>

cv.xor.h a0, a1, a2
# CHECK-INSTR: cv.xor.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x60] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 60 <unknown>

cv.xor.h s0, s1, s2
# CHECK-INSTR: cv.xor.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x61] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 61 <unknown>

cv.xor.b t0, t1, t2
# CHECK-INSTR: cv.xor.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x60] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 60 <unknown>

cv.xor.b a0, a1, a2
# CHECK-INSTR: cv.xor.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x60] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 60 <unknown>

cv.xor.b s0, s1, s2
# CHECK-INSTR: cv.xor.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x61] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 61 <unknown>

cv.xor.sc.h t0, t1, t2
# CHECK-INSTR: cv.xor.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x60] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 60 <unknown>

cv.xor.sc.h a0, a1, a2
# CHECK-INSTR: cv.xor.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x60] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 60 <unknown>

cv.xor.sc.h s0, s1, s2
# CHECK-INSTR: cv.xor.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x61] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 61 <unknown>

cv.xor.sc.b t0, t1, t2
# CHECK-INSTR: cv.xor.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x60] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 60 <unknown>

cv.xor.sc.b a0, a1, a2
# CHECK-INSTR: cv.xor.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x60] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 60 <unknown>

cv.xor.sc.b s0, s1, s2
# CHECK-INSTR: cv.xor.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x61] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 61 <unknown>

cv.xor.sci.h t0, t1, -32
# CHECK-INSTR: cv.xor.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x61] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 61 <unknown>

cv.xor.sci.h a0, a1, 7
# CHECK-INSTR: cv.xor.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x62] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 62 <unknown>

cv.xor.sci.h s0, s1, -1
# CHECK-INSTR: cv.xor.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x63] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 63 <unknown>

cv.xor.sci.b t0, t1, -32
# CHECK-INSTR: cv.xor.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x61] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 61 <unknown>

cv.xor.sci.b a0, a1, 7
# CHECK-INSTR: cv.xor.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x62] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 62 <unknown>

cv.xor.sci.b s0, s1, -1
# CHECK-INSTR: cv.xor.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x63] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 63 <unknown>

cv.and.h t0, t1, t2
# CHECK-INSTR: cv.and.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x68] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 68 <unknown>

cv.and.h a0, a1, a2
# CHECK-INSTR: cv.and.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x68] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 68 <unknown>

cv.and.h s0, s1, s2
# CHECK-INSTR: cv.and.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x69] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 69 <unknown>

cv.and.b t0, t1, t2
# CHECK-INSTR: cv.and.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x68] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 68 <unknown>

cv.and.b a0, a1, a2
# CHECK-INSTR: cv.and.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x68] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 68 <unknown>

cv.and.b s0, s1, s2
# CHECK-INSTR: cv.and.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x69] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 69 <unknown>

cv.and.sc.h t0, t1, t2
# CHECK-INSTR: cv.and.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x68] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 68 <unknown>

cv.and.sc.h a0, a1, a2
# CHECK-INSTR: cv.and.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x68] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 68 <unknown>

cv.and.sc.h s0, s1, s2
# CHECK-INSTR: cv.and.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x69] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 69 <unknown>

cv.and.sc.b t0, t1, t2
# CHECK-INSTR: cv.and.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x68] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 68 <unknown>

cv.and.sc.b a0, a1, a2
# CHECK-INSTR: cv.and.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x68] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 68 <unknown>

cv.and.sc.b s0, s1, s2
# CHECK-INSTR: cv.and.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x69] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 69 <unknown>

cv.and.sci.h t0, t1, -32
# CHECK-INSTR: cv.and.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x69] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 69 <unknown>

cv.and.sci.h a0, a1, 7
# CHECK-INSTR: cv.and.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x6a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 6a <unknown>

cv.and.sci.h s0, s1, -1
# CHECK-INSTR: cv.and.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x6b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 6b <unknown>

cv.and.sci.b t0, t1, -32
# CHECK-INSTR: cv.and.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x69] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 69 <unknown>

cv.and.sci.b a0, a1, 7
# CHECK-INSTR: cv.and.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x6a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 6a <unknown>

cv.and.sci.b s0, s1, -1
# CHECK-INSTR: cv.and.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x6b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 6b <unknown>

cv.abs.h t0, t1
# CHECK-INSTR: cv.abs.h t0, t1
# CHECK-ENCODING: [0xfb,0x02,0x03,0x70] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 03 70 <unknown>

cv.abs.h a0, a1
# CHECK-INSTR: cv.abs.h a0, a1
# CHECK-ENCODING: [0x7b,0x85,0x05,0x70] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 05 70 <unknown>

cv.abs.h s0, s1
# CHECK-INSTR: cv.abs.h s0, s1
# CHECK-ENCODING: [0x7b,0x84,0x04,0x70] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 04 70 <unknown>

cv.abs.b t0, t1
# CHECK-INSTR: cv.abs.b t0, t1
# CHECK-ENCODING: [0xfb,0x12,0x03,0x70] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 03 70 <unknown>

cv.abs.b a0, a1
# CHECK-INSTR: cv.abs.b a0, a1
# CHECK-ENCODING: [0x7b,0x95,0x05,0x70] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 05 70 <unknown>

cv.abs.b s0, s1
# CHECK-INSTR: cv.abs.b s0, s1
# CHECK-ENCODING: [0x7b,0x94,0x04,0x70] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 04 70 <unknown>

cv.dotup.h t0, t1, t2
# CHECK-INSTR: cv.dotup.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x80] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 80 <unknown>

cv.dotup.h a0, a1, a2
# CHECK-INSTR: cv.dotup.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x80] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 80 <unknown>

cv.dotup.h s0, s1, s2
# CHECK-INSTR: cv.dotup.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x81] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 81 <unknown>

cv.dotup.b t0, t1, t2
# CHECK-INSTR: cv.dotup.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x80] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 80 <unknown>

cv.dotup.b a0, a1, a2
# CHECK-INSTR: cv.dotup.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x80] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 80 <unknown>

cv.dotup.b s0, s1, s2
# CHECK-INSTR: cv.dotup.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x81] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 81 <unknown>

cv.dotup.sc.h t0, t1, t2
# CHECK-INSTR: cv.dotup.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x80] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 80 <unknown>

cv.dotup.sc.h a0, a1, a2
# CHECK-INSTR: cv.dotup.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x80] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 80 <unknown>

cv.dotup.sc.h s0, s1, s2
# CHECK-INSTR: cv.dotup.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x81] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 81 <unknown>

cv.dotup.sc.b t0, t1, t2
# CHECK-INSTR: cv.dotup.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x80] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 80 <unknown>

cv.dotup.sc.b a0, a1, a2
# CHECK-INSTR: cv.dotup.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x80] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 80 <unknown>

cv.dotup.sc.b s0, s1, s2
# CHECK-INSTR: cv.dotup.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x81] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 81 <unknown>

cv.dotup.sci.h t0, t1, -32
# CHECK-INSTR: cv.dotup.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x81] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 81 <unknown>

cv.dotup.sci.h a0, a1, 7
# CHECK-INSTR: cv.dotup.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x82] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 82 <unknown>

cv.dotup.sci.h s0, s1, -1
# CHECK-INSTR: cv.dotup.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x83] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 83 <unknown>

cv.dotup.sci.b t0, t1, -32
# CHECK-INSTR: cv.dotup.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x81] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 81 <unknown>

cv.dotup.sci.b a0, a1, 7
# CHECK-INSTR: cv.dotup.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x82] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 82 <unknown>

cv.dotup.sci.b s0, s1, -1
# CHECK-INSTR: cv.dotup.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x83] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 83 <unknown>

cv.dotusp.h t0, t1, t2
# CHECK-INSTR: cv.dotusp.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x88] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 88 <unknown>

cv.dotusp.h a0, a1, a2
# CHECK-INSTR: cv.dotusp.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x88] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 88 <unknown>

cv.dotusp.h s0, s1, s2
# CHECK-INSTR: cv.dotusp.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x89] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 89 <unknown>

cv.dotusp.b t0, t1, t2
# CHECK-INSTR: cv.dotusp.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x88] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 88 <unknown>

cv.dotusp.b a0, a1, a2
# CHECK-INSTR: cv.dotusp.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x88] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 88 <unknown>

cv.dotusp.b s0, s1, s2
# CHECK-INSTR: cv.dotusp.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x89] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 89 <unknown>

cv.dotusp.sc.h t0, t1, t2
# CHECK-INSTR: cv.dotusp.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x88] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 88 <unknown>

cv.dotusp.sc.h a0, a1, a2
# CHECK-INSTR: cv.dotusp.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x88] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 88 <unknown>

cv.dotusp.sc.h s0, s1, s2
# CHECK-INSTR: cv.dotusp.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x89] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 89 <unknown>

cv.dotusp.sc.b t0, t1, t2
# CHECK-INSTR: cv.dotusp.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x88] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 88 <unknown>

cv.dotusp.sc.b a0, a1, a2
# CHECK-INSTR: cv.dotusp.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x88] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 88 <unknown>

cv.dotusp.sc.b s0, s1, s2
# CHECK-INSTR: cv.dotusp.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x89] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 89 <unknown>

cv.dotusp.sci.h t0, t1, -32
# CHECK-INSTR: cv.dotusp.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x89] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 89 <unknown>

cv.dotusp.sci.h a0, a1, 7
# CHECK-INSTR: cv.dotusp.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x8a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 8a <unknown>

cv.dotusp.sci.h s0, s1, -1
# CHECK-INSTR: cv.dotusp.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x8b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 8b <unknown>

cv.dotusp.sci.b t0, t1, -32
# CHECK-INSTR: cv.dotusp.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x89] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 89 <unknown>

cv.dotusp.sci.b a0, a1, 7
# CHECK-INSTR: cv.dotusp.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x8a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 8a <unknown>

cv.dotusp.sci.b s0, s1, -1
# CHECK-INSTR: cv.dotusp.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x8b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 8b <unknown>

cv.dotsp.h t0, t1, t2
# CHECK-INSTR: cv.dotsp.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x90] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 90 <unknown>

cv.dotsp.h a0, a1, a2
# CHECK-INSTR: cv.dotsp.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x90] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 90 <unknown>

cv.dotsp.h s0, s1, s2
# CHECK-INSTR: cv.dotsp.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x91] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 91 <unknown>

cv.dotsp.b t0, t1, t2
# CHECK-INSTR: cv.dotsp.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x90] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 90 <unknown>

cv.dotsp.b a0, a1, a2
# CHECK-INSTR: cv.dotsp.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x90] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 90 <unknown>

cv.dotsp.b s0, s1, s2
# CHECK-INSTR: cv.dotsp.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x91] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 91 <unknown>

cv.dotsp.sc.h t0, t1, t2
# CHECK-INSTR: cv.dotsp.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x90] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 90 <unknown>

cv.dotsp.sc.h a0, a1, a2
# CHECK-INSTR: cv.dotsp.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x90] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 90 <unknown>

cv.dotsp.sc.h s0, s1, s2
# CHECK-INSTR: cv.dotsp.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x91] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 91 <unknown>

cv.dotsp.sc.b t0, t1, t2
# CHECK-INSTR: cv.dotsp.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x90] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 90 <unknown>

cv.dotsp.sc.b a0, a1, a2
# CHECK-INSTR: cv.dotsp.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x90] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 90 <unknown>

cv.dotsp.sc.b s0, s1, s2
# CHECK-INSTR: cv.dotsp.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x91] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 91 <unknown>

cv.dotsp.sci.h t0, t1, -32
# CHECK-INSTR: cv.dotsp.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x91] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 91 <unknown>

cv.dotsp.sci.h a0, a1, 7
# CHECK-INSTR: cv.dotsp.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x92] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 92 <unknown>

cv.dotsp.sci.h s0, s1, -1
# CHECK-INSTR: cv.dotsp.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x93] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 93 <unknown>

cv.dotsp.sci.b t0, t1, -32
# CHECK-INSTR: cv.dotsp.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x91] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 91 <unknown>

cv.dotsp.sci.b a0, a1, 7
# CHECK-INSTR: cv.dotsp.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x92] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 92 <unknown>

cv.dotsp.sci.b s0, s1, -1
# CHECK-INSTR: cv.dotsp.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x93] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 93 <unknown>

cv.sdotup.h t0, t1, t2
# CHECK-INSTR: cv.sdotup.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x98] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 98 <unknown>

cv.sdotup.h a0, a1, a2
# CHECK-INSTR: cv.sdotup.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x98] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 98 <unknown>

cv.sdotup.h s0, s1, s2
# CHECK-INSTR: cv.sdotup.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x99] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 99 <unknown>

cv.sdotup.b t0, t1, t2
# CHECK-INSTR: cv.sdotup.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x98] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 98 <unknown>

cv.sdotup.b a0, a1, a2
# CHECK-INSTR: cv.sdotup.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x98] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 98 <unknown>

cv.sdotup.b s0, s1, s2
# CHECK-INSTR: cv.sdotup.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x99] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 99 <unknown>

cv.sdotup.sc.h t0, t1, t2
# CHECK-INSTR: cv.sdotup.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x98] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 98 <unknown>

cv.sdotup.sc.h a0, a1, a2
# CHECK-INSTR: cv.sdotup.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x98] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 98 <unknown>

cv.sdotup.sc.h s0, s1, s2
# CHECK-INSTR: cv.sdotup.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x99] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 99 <unknown>

cv.sdotup.sc.b t0, t1, t2
# CHECK-INSTR: cv.sdotup.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x98] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 98 <unknown>

cv.sdotup.sc.b a0, a1, a2
# CHECK-INSTR: cv.sdotup.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x98] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 98 <unknown>

cv.sdotup.sc.b s0, s1, s2
# CHECK-INSTR: cv.sdotup.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x99] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 99 <unknown>

cv.sdotup.sci.h t0, t1, -32
# CHECK-INSTR: cv.sdotup.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x99] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 99 <unknown>

cv.sdotup.sci.h a0, a1, 7
# CHECK-INSTR: cv.sdotup.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x9a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 9a <unknown>

cv.sdotup.sci.h s0, s1, -1
# CHECK-INSTR: cv.sdotup.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x9b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 9b <unknown>

cv.sdotup.sci.b t0, t1, -32
# CHECK-INSTR: cv.sdotup.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x99] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 99 <unknown>

cv.sdotup.sci.b a0, a1, 7
# CHECK-INSTR: cv.sdotup.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x9a] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 9a <unknown>

cv.sdotup.sci.b s0, s1, -1
# CHECK-INSTR: cv.sdotup.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x9b] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 9b <unknown>

cv.sdotusp.h t0, t1, t2
# CHECK-INSTR: cv.sdotusp.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0xa0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 a0 <unknown>

cv.sdotusp.h a0, a1, a2
# CHECK-INSTR: cv.sdotusp.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0xa0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 a0 <unknown>

cv.sdotusp.h s0, s1, s2
# CHECK-INSTR: cv.sdotusp.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0xa1] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 a1 <unknown>

cv.sdotusp.b t0, t1, t2
# CHECK-INSTR: cv.sdotusp.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0xa0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 a0 <unknown>

cv.sdotusp.b a0, a1, a2
# CHECK-INSTR: cv.sdotusp.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0xa0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 a0 <unknown>

cv.sdotusp.b s0, s1, s2
# CHECK-INSTR: cv.sdotusp.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0xa1] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 a1 <unknown>

cv.sdotusp.sc.h t0, t1, t2
# CHECK-INSTR: cv.sdotusp.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0xa0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 a0 <unknown>

cv.sdotusp.sc.h a0, a1, a2
# CHECK-INSTR: cv.sdotusp.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0xa0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 a0 <unknown>

cv.sdotusp.sc.h s0, s1, s2
# CHECK-INSTR: cv.sdotusp.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0xa1] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 a1 <unknown>

cv.sdotusp.sc.b t0, t1, t2
# CHECK-INSTR: cv.sdotusp.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0xa0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 a0 <unknown>

cv.sdotusp.sc.b a0, a1, a2
# CHECK-INSTR: cv.sdotusp.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0xa0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 a0 <unknown>

cv.sdotusp.sc.b s0, s1, s2
# CHECK-INSTR: cv.sdotusp.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0xa1] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 a1 <unknown>

cv.sdotusp.sci.h t0, t1, -32
# CHECK-INSTR: cv.sdotusp.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0xa1] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 a1 <unknown>

cv.sdotusp.sci.h a0, a1, 7
# CHECK-INSTR: cv.sdotusp.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0xa2] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 a2 <unknown>

cv.sdotusp.sci.h s0, s1, -1
# CHECK-INSTR: cv.sdotusp.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0xa3] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 a3 <unknown>

cv.sdotusp.sci.b t0, t1, -32
# CHECK-INSTR: cv.sdotusp.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0xa1] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 a1 <unknown>

cv.sdotusp.sci.b a0, a1, 7
# CHECK-INSTR: cv.sdotusp.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0xa2] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 a2 <unknown>

cv.sdotusp.sci.b s0, s1, -1
# CHECK-INSTR: cv.sdotusp.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0xa3] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 a3 <unknown>

cv.sdotsp.h t0, t1, t2
# CHECK-INSTR: cv.sdotsp.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0xa8] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 a8 <unknown>

cv.sdotsp.h a0, a1, a2
# CHECK-INSTR: cv.sdotsp.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0xa8] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 a8 <unknown>

cv.sdotsp.h s0, s1, s2
# CHECK-INSTR: cv.sdotsp.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0xa9] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 a9 <unknown>

cv.sdotsp.b t0, t1, t2
# CHECK-INSTR: cv.sdotsp.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0xa8] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 a8 <unknown>

cv.sdotsp.b a0, a1, a2
# CHECK-INSTR: cv.sdotsp.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0xa8] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 a8 <unknown>

cv.sdotsp.b s0, s1, s2
# CHECK-INSTR: cv.sdotsp.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0xa9] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 a9 <unknown>

cv.sdotsp.sc.h t0, t1, t2
# CHECK-INSTR: cv.sdotsp.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0xa8] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 a8 <unknown>

cv.sdotsp.sc.h a0, a1, a2
# CHECK-INSTR: cv.sdotsp.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0xa8] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 a8 <unknown>

cv.sdotsp.sc.h s0, s1, s2
# CHECK-INSTR: cv.sdotsp.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0xa9] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 a9 <unknown>

cv.sdotsp.sc.b t0, t1, t2
# CHECK-INSTR: cv.sdotsp.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0xa8] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 a8 <unknown>

cv.sdotsp.sc.b a0, a1, a2
# CHECK-INSTR: cv.sdotsp.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0xa8] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 a8 <unknown>

cv.sdotsp.sc.b s0, s1, s2
# CHECK-INSTR: cv.sdotsp.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0xa9] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 a9 <unknown>

cv.sdotsp.sci.h t0, t1, -32
# CHECK-INSTR: cv.sdotsp.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0xa9] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 a9 <unknown>

cv.sdotsp.sci.h a0, a1, 7
# CHECK-INSTR: cv.sdotsp.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0xaa] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 aa <unknown>

cv.sdotsp.sci.h s0, s1, -1
# CHECK-INSTR: cv.sdotsp.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0xab] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 ab <unknown>

cv.sdotsp.sci.b t0, t1, -32
# CHECK-INSTR: cv.sdotsp.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0xa9] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 a9 <unknown>

cv.sdotsp.sci.b a0, a1, 7
# CHECK-INSTR: cv.sdotsp.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0xaa] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 aa <unknown>

cv.sdotsp.sci.b s0, s1, -1
# CHECK-INSTR: cv.sdotsp.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0xab] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 ab <unknown>

cv.extract.h t0, t1, -32
# CHECK-INSTR: cv.extract.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x02,0x03,0xb9] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 03 b9 <unknown>

cv.extract.h a0, a1, 7
# CHECK-INSTR: cv.extract.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0x85,0x35,0xba] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 35 ba <unknown>

cv.extract.h s0, s1, -1
# CHECK-INSTR: cv.extract.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0x84,0xf4,0xbb] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 f4 bb <unknown>

cv.extract.b t0, t1, -32
# CHECK-INSTR: cv.extract.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x12,0x03,0xb9] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 03 b9 <unknown>

cv.extract.b a0, a1, 7
# CHECK-INSTR: cv.extract.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0x95,0x35,0xba] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 35 ba <unknown>

cv.extract.b s0, s1, -1
# CHECK-INSTR: cv.extract.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0x94,0xf4,0xbb] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 f4 bb <unknown>

cv.extractu.h t0, t1, -32
# CHECK-INSTR: cv.extractu.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x22,0x03,0xb9] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 22 03 b9 <unknown>

cv.extractu.h a0, a1, 7
# CHECK-INSTR: cv.extractu.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xa5,0x35,0xba] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b a5 35 ba <unknown>

cv.extractu.h s0, s1, -1
# CHECK-INSTR: cv.extractu.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xa4,0xf4,0xbb] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b a4 f4 bb <unknown>

cv.extractu.b t0, t1, -32
# CHECK-INSTR: cv.extractu.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x32,0x03,0xb9] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 32 03 b9 <unknown>

cv.extractu.b a0, a1, 7
# CHECK-INSTR: cv.extractu.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xb5,0x35,0xba] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b b5 35 ba <unknown>

cv.extractu.b s0, s1, -1
# CHECK-INSTR: cv.extractu.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xb4,0xf4,0xbb] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b b4 f4 bb <unknown>

cv.insert.h t0, t1, -32
# CHECK-INSTR: cv.insert.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x42,0x03,0xb9] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 03 b9 <unknown>

cv.insert.h a0, a1, 7
# CHECK-INSTR: cv.insert.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xc5,0x35,0xba] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 35 ba <unknown>

cv.insert.h s0, s1, -1
# CHECK-INSTR: cv.insert.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xc4,0xf4,0xbb] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 f4 bb <unknown>

cv.insert.b t0, t1, -32
# CHECK-INSTR: cv.insert.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x52,0x03,0xb9] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 03 b9 <unknown>

cv.insert.b a0, a1, 7
# CHECK-INSTR: cv.insert.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xd5,0x35,0xba] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 35 ba <unknown>

cv.insert.b s0, s1, -1
# CHECK-INSTR: cv.insert.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xd4,0xf4,0xbb] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 f4 bb <unknown>

cv.shuffle.h t0, t1, t2
# CHECK-INSTR: cv.shuffle.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0xc0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 c0 <unknown>

cv.shuffle.h a0, a1, a2
# CHECK-INSTR: cv.shuffle.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0xc0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 c0 <unknown>

cv.shuffle.h s0, s1, s2
# CHECK-INSTR: cv.shuffle.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0xc1] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 c1 <unknown>

cv.shuffle.b t0, t1, t2
# CHECK-INSTR: cv.shuffle.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0xc0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 c0 <unknown>

cv.shuffle.b a0, a1, a2
# CHECK-INSTR: cv.shuffle.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0xc0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 c0 <unknown>

cv.shuffle.b s0, s1, s2
# CHECK-INSTR: cv.shuffle.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0xc1] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 c1 <unknown>

cv.shuffle.sci.h t0, t1, -32
# CHECK-INSTR: cv.shuffle.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0xc1] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 c1 <unknown>

cv.shuffle.sci.h a0, a1, 7
# CHECK-INSTR: cv.shuffle.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0xc2] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 c2 <unknown>

cv.shuffle.sci.h s0, s1, -1
# CHECK-INSTR: cv.shuffle.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0xc3] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 c3 <unknown>

cv.shuffleI0.sci.b t0, t1, -32
# CHECK-INSTR: cv.shuffleI0.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0xc1] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 c1 <unknown>

cv.shuffleI0.sci.b a0, a1, 7
# CHECK-INSTR: cv.shuffleI0.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0xc2] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 c2 <unknown>

cv.shuffleI0.sci.b s0, s1, -1
# CHECK-INSTR: cv.shuffleI0.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0xc3] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 c3 <unknown>

cv.shuffleI1.sci.b t0, t1, -32
# CHECK-INSTR: cv.shuffleI1.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0xc9] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 c9 <unknown>

cv.shuffleI1.sci.b a0, a1, 7
# CHECK-INSTR: cv.shuffleI1.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0xca] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 ca <unknown>

cv.shuffleI1.sci.b s0, s1, -1
# CHECK-INSTR: cv.shuffleI1.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0xcb] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 cb <unknown>

cv.shuffleI2.sci.b t0, t1, -32
# CHECK-INSTR: cv.shuffleI2.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0xd1] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 d1 <unknown>

cv.shuffleI2.sci.b a0, a1, 7
# CHECK-INSTR: cv.shuffleI2.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0xd2] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 d2 <unknown>

cv.shuffleI2.sci.b s0, s1, -1
# CHECK-INSTR: cv.shuffleI2.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0xd3] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 d3 <unknown>

cv.shuffleI3.sci.b t0, t1, -32
# CHECK-INSTR: cv.shuffleI3.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0xd9] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 d9 <unknown>

cv.shuffleI3.sci.b a0, a1, 7
# CHECK-INSTR: cv.shuffleI3.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0xda] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 da <unknown>

cv.shuffleI3.sci.b s0, s1, -1
# CHECK-INSTR: cv.shuffleI3.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0xdb] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 db <unknown>

cv.shuffle2.h t0, t1, t2
# CHECK-INSTR: cv.shuffle2.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0xe0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 e0 <unknown>

cv.shuffle2.h a0, a1, a2
# CHECK-INSTR: cv.shuffle2.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0xe0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 e0 <unknown>

cv.shuffle2.h s0, s1, s2
# CHECK-INSTR: cv.shuffle2.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0xe1] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 e1 <unknown>

cv.shuffle2.b t0, t1, t2
# CHECK-INSTR: cv.shuffle2.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0xe0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 e0 <unknown>

cv.shuffle2.b a0, a1, a2
# CHECK-INSTR: cv.shuffle2.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0xe0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 e0 <unknown>

cv.shuffle2.b s0, s1, s2
# CHECK-INSTR: cv.shuffle2.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0xe1] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 e1 <unknown>

cv.pack t0, t1, t2
# CHECK-INSTR: cv.pack t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0xf0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 f0 <unknown>

cv.pack a0, a1, a2
# CHECK-INSTR: cv.pack a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0xf0] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 f0 <unknown>

cv.pack s0, s1, s2
# CHECK-INSTR: cv.pack s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0xf1] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 f1 <unknown>

cv.pack.h t0, t1, t2
# CHECK-INSTR: cv.pack.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0xf2] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 f2 <unknown>

cv.pack.h a0, a1, a2
# CHECK-INSTR: cv.pack.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0xf2] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 f2 <unknown>

cv.pack.h s0, s1, s2
# CHECK-INSTR: cv.pack.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0xf3] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 f3 <unknown>

cv.packhi.b t0, t1, t2
# CHECK-INSTR: cv.packhi.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0xfa] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 fa <unknown>

cv.packhi.b a0, a1, a2
# CHECK-INSTR: cv.packhi.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0xfa] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 fa <unknown>

cv.packhi.b s0, s1, s2
# CHECK-INSTR: cv.packhi.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0xfb] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 fb <unknown>

cv.packlo.b t0, t1, t2
# CHECK-INSTR: cv.packlo.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0xf8] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 f8 <unknown>

cv.packlo.b a0, a1, a2
# CHECK-INSTR: cv.packlo.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0xf8] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 f8 <unknown>

cv.packlo.b s0, s1, s2
# CHECK-INSTR: cv.packlo.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0xf9] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 f9 <unknown>

cv.cmpeq.h t0, t1, t2
# CHECK-INSTR: cv.cmpeq.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x04] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 04 <unknown>

cv.cmpeq.h a0, a1, a2
# CHECK-INSTR: cv.cmpeq.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x04] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 04 <unknown>

cv.cmpeq.h s0, s1, s2
# CHECK-INSTR: cv.cmpeq.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x05] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 05 <unknown>

cv.cmpeq.b t0, t1, t2
# CHECK-INSTR: cv.cmpeq.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x04] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 04 <unknown>

cv.cmpeq.b a0, a1, a2
# CHECK-INSTR: cv.cmpeq.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x04] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 04 <unknown>

cv.cmpeq.b s0, s1, s2
# CHECK-INSTR: cv.cmpeq.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x05] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 05 <unknown>

cv.cmpeq.sc.h t0, t1, t2
# CHECK-INSTR: cv.cmpeq.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x04] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 04 <unknown>

cv.cmpeq.sc.h a0, a1, a2
# CHECK-INSTR: cv.cmpeq.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x04] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 04 <unknown>

cv.cmpeq.sc.h s0, s1, s2
# CHECK-INSTR: cv.cmpeq.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x05] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 05 <unknown>

cv.cmpeq.sc.b t0, t1, t2
# CHECK-INSTR: cv.cmpeq.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x04] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 04 <unknown>

cv.cmpeq.sc.b a0, a1, a2
# CHECK-INSTR: cv.cmpeq.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x04] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 04 <unknown>

cv.cmpeq.sc.b s0, s1, s2
# CHECK-INSTR: cv.cmpeq.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x05] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 05 <unknown>

cv.cmpeq.sci.h t0, t1, -32
# CHECK-INSTR: cv.cmpeq.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x05] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 05 <unknown>

cv.cmpeq.sci.h a0, a1, 7
# CHECK-INSTR: cv.cmpeq.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x06] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 06 <unknown>

cv.cmpeq.sci.h s0, s1, -1
# CHECK-INSTR: cv.cmpeq.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x07] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 07 <unknown>

cv.cmpeq.sci.b t0, t1, -32
# CHECK-INSTR: cv.cmpeq.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x05] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 05 <unknown>

cv.cmpeq.sci.b a0, a1, 7
# CHECK-INSTR: cv.cmpeq.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x06] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 06 <unknown>

cv.cmpeq.sci.b s0, s1, -1
# CHECK-INSTR: cv.cmpeq.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x07] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 07 <unknown>

cv.cmpne.h t0, t1, t2
# CHECK-INSTR: cv.cmpne.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x0c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 0c <unknown>

cv.cmpne.h a0, a1, a2
# CHECK-INSTR: cv.cmpne.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x0c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 0c <unknown>

cv.cmpne.h s0, s1, s2
# CHECK-INSTR: cv.cmpne.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x0d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 0d <unknown>

cv.cmpne.b t0, t1, t2
# CHECK-INSTR: cv.cmpne.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x0c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 0c <unknown>

cv.cmpne.b a0, a1, a2
# CHECK-INSTR: cv.cmpne.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x0c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 0c <unknown>

cv.cmpne.b s0, s1, s2
# CHECK-INSTR: cv.cmpne.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x0d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 0d <unknown>

cv.cmpne.sc.h t0, t1, t2
# CHECK-INSTR: cv.cmpne.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x0c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 0c <unknown>

cv.cmpne.sc.h a0, a1, a2
# CHECK-INSTR: cv.cmpne.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x0c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 0c <unknown>

cv.cmpne.sc.h s0, s1, s2
# CHECK-INSTR: cv.cmpne.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x0d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 0d <unknown>

cv.cmpne.sc.b t0, t1, t2
# CHECK-INSTR: cv.cmpne.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x0c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 0c <unknown>

cv.cmpne.sc.b a0, a1, a2
# CHECK-INSTR: cv.cmpne.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x0c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 0c <unknown>

cv.cmpne.sc.b s0, s1, s2
# CHECK-INSTR: cv.cmpne.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x0d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 0d <unknown>

cv.cmpne.sci.h t0, t1, -32
# CHECK-INSTR: cv.cmpne.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x0d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 0d <unknown>

cv.cmpne.sci.h a0, a1, 7
# CHECK-INSTR: cv.cmpne.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x0e] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 0e <unknown>

cv.cmpne.sci.h s0, s1, -1
# CHECK-INSTR: cv.cmpne.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x0f] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 0f <unknown>

cv.cmpne.sci.b t0, t1, -32
# CHECK-INSTR: cv.cmpne.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x0d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 0d <unknown>

cv.cmpne.sci.b a0, a1, 7
# CHECK-INSTR: cv.cmpne.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x0e] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 0e <unknown>

cv.cmpne.sci.b s0, s1, -1
# CHECK-INSTR: cv.cmpne.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x0f] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 0f <unknown>

cv.cmpgt.h t0, t1, t2
# CHECK-INSTR: cv.cmpgt.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x14] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 14 <unknown>

cv.cmpgt.h a0, a1, a2
# CHECK-INSTR: cv.cmpgt.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x14] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 14 <unknown>

cv.cmpgt.h s0, s1, s2
# CHECK-INSTR: cv.cmpgt.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x15] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 15 <unknown>

cv.cmpgt.b t0, t1, t2
# CHECK-INSTR: cv.cmpgt.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x14] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 14 <unknown>

cv.cmpgt.b a0, a1, a2
# CHECK-INSTR: cv.cmpgt.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x14] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 14 <unknown>

cv.cmpgt.b s0, s1, s2
# CHECK-INSTR: cv.cmpgt.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x15] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 15 <unknown>

cv.cmpgt.sc.h t0, t1, t2
# CHECK-INSTR: cv.cmpgt.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x14] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 14 <unknown>

cv.cmpgt.sc.h a0, a1, a2
# CHECK-INSTR: cv.cmpgt.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x14] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 14 <unknown>

cv.cmpgt.sc.h s0, s1, s2
# CHECK-INSTR: cv.cmpgt.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x15] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 15 <unknown>

cv.cmpgt.sc.b t0, t1, t2
# CHECK-INSTR: cv.cmpgt.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x14] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 14 <unknown>

cv.cmpgt.sc.b a0, a1, a2
# CHECK-INSTR: cv.cmpgt.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x14] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 14 <unknown>

cv.cmpgt.sc.b s0, s1, s2
# CHECK-INSTR: cv.cmpgt.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x15] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 15 <unknown>

cv.cmpgt.sci.h t0, t1, -32
# CHECK-INSTR: cv.cmpgt.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x15] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 15 <unknown>

cv.cmpgt.sci.h a0, a1, 7
# CHECK-INSTR: cv.cmpgt.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x16] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 16 <unknown>

cv.cmpgt.sci.h s0, s1, -1
# CHECK-INSTR: cv.cmpgt.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x17] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 17 <unknown>

cv.cmpgt.sci.b t0, t1, -32
# CHECK-INSTR: cv.cmpgt.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x15] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 15 <unknown>

cv.cmpgt.sci.b a0, a1, 7
# CHECK-INSTR: cv.cmpgt.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x16] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 16 <unknown>

cv.cmpgt.sci.b s0, s1, -1
# CHECK-INSTR: cv.cmpgt.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x17] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 17 <unknown>

cv.cmpge.h t0, t1, t2
# CHECK-INSTR: cv.cmpge.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x1c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 1c <unknown>

cv.cmpge.h a0, a1, a2
# CHECK-INSTR: cv.cmpge.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x1c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 1c <unknown>

cv.cmpge.h s0, s1, s2
# CHECK-INSTR: cv.cmpge.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x1d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 1d <unknown>

cv.cmpge.b t0, t1, t2
# CHECK-INSTR: cv.cmpge.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x1c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 1c <unknown>

cv.cmpge.b a0, a1, a2
# CHECK-INSTR: cv.cmpge.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x1c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 1c <unknown>

cv.cmpge.b s0, s1, s2
# CHECK-INSTR: cv.cmpge.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x1d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 1d <unknown>

cv.cmpge.sc.h t0, t1, t2
# CHECK-INSTR: cv.cmpge.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x1c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 1c <unknown>

cv.cmpge.sc.h a0, a1, a2
# CHECK-INSTR: cv.cmpge.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x1c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 1c <unknown>

cv.cmpge.sc.h s0, s1, s2
# CHECK-INSTR: cv.cmpge.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x1d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 1d <unknown>

cv.cmpge.sc.b t0, t1, t2
# CHECK-INSTR: cv.cmpge.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x1c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 1c <unknown>

cv.cmpge.sc.b a0, a1, a2
# CHECK-INSTR: cv.cmpge.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x1c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 1c <unknown>

cv.cmpge.sc.b s0, s1, s2
# CHECK-INSTR: cv.cmpge.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x1d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 1d <unknown>

cv.cmpge.sci.h t0, t1, -32
# CHECK-INSTR: cv.cmpge.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x1d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 1d <unknown>

cv.cmpge.sci.h a0, a1, 7
# CHECK-INSTR: cv.cmpge.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x1e] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 1e <unknown>

cv.cmpge.sci.h s0, s1, -1
# CHECK-INSTR: cv.cmpge.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x1f] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 1f <unknown>

cv.cmpge.sci.b t0, t1, -32
# CHECK-INSTR: cv.cmpge.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x1d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 1d <unknown>

cv.cmpge.sci.b a0, a1, 7
# CHECK-INSTR: cv.cmpge.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x1e] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 1e <unknown>

cv.cmpge.sci.b s0, s1, -1
# CHECK-INSTR: cv.cmpge.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x1f] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 1f <unknown>

cv.cmplt.h t0, t1, t2
# CHECK-INSTR: cv.cmplt.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x24] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 24 <unknown>

cv.cmplt.h a0, a1, a2
# CHECK-INSTR: cv.cmplt.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x24] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 24 <unknown>

cv.cmplt.h s0, s1, s2
# CHECK-INSTR: cv.cmplt.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x25] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 25 <unknown>

cv.cmplt.b t0, t1, t2
# CHECK-INSTR: cv.cmplt.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x24] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 24 <unknown>

cv.cmplt.b a0, a1, a2
# CHECK-INSTR: cv.cmplt.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x24] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 24 <unknown>

cv.cmplt.b s0, s1, s2
# CHECK-INSTR: cv.cmplt.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x25] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 25 <unknown>

cv.cmplt.sc.h t0, t1, t2
# CHECK-INSTR: cv.cmplt.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x24] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 24 <unknown>

cv.cmplt.sc.h a0, a1, a2
# CHECK-INSTR: cv.cmplt.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x24] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 24 <unknown>

cv.cmplt.sc.h s0, s1, s2
# CHECK-INSTR: cv.cmplt.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x25] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 25 <unknown>

cv.cmplt.sc.b t0, t1, t2
# CHECK-INSTR: cv.cmplt.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x24] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 24 <unknown>

cv.cmplt.sc.b a0, a1, a2
# CHECK-INSTR: cv.cmplt.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x24] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 24 <unknown>

cv.cmplt.sc.b s0, s1, s2
# CHECK-INSTR: cv.cmplt.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x25] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 25 <unknown>

cv.cmplt.sci.h t0, t1, -32
# CHECK-INSTR: cv.cmplt.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x25] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 25 <unknown>

cv.cmplt.sci.h a0, a1, 7
# CHECK-INSTR: cv.cmplt.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x26] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 26 <unknown>

cv.cmplt.sci.h s0, s1, -1
# CHECK-INSTR: cv.cmplt.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x27] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 27 <unknown>

cv.cmplt.sci.b t0, t1, -32
# CHECK-INSTR: cv.cmplt.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x25] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 25 <unknown>

cv.cmplt.sci.b a0, a1, 7
# CHECK-INSTR: cv.cmplt.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x26] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 26 <unknown>

cv.cmplt.sci.b s0, s1, -1
# CHECK-INSTR: cv.cmplt.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x27] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 27 <unknown>

cv.cmple.h t0, t1, t2
# CHECK-INSTR: cv.cmple.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x2c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 2c <unknown>

cv.cmple.h a0, a1, a2
# CHECK-INSTR: cv.cmple.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x2c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 2c <unknown>

cv.cmple.h s0, s1, s2
# CHECK-INSTR: cv.cmple.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x2d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 2d <unknown>

cv.cmple.b t0, t1, t2
# CHECK-INSTR: cv.cmple.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x2c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 2c <unknown>

cv.cmple.b a0, a1, a2
# CHECK-INSTR: cv.cmple.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x2c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 2c <unknown>

cv.cmple.b s0, s1, s2
# CHECK-INSTR: cv.cmple.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x2d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 2d <unknown>

cv.cmple.sc.h t0, t1, t2
# CHECK-INSTR: cv.cmple.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x2c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 2c <unknown>

cv.cmple.sc.h a0, a1, a2
# CHECK-INSTR: cv.cmple.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x2c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 2c <unknown>

cv.cmple.sc.h s0, s1, s2
# CHECK-INSTR: cv.cmple.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x2d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 2d <unknown>

cv.cmple.sc.b t0, t1, t2
# CHECK-INSTR: cv.cmple.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x2c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 2c <unknown>

cv.cmple.sc.b a0, a1, a2
# CHECK-INSTR: cv.cmple.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x2c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 2c <unknown>

cv.cmple.sc.b s0, s1, s2
# CHECK-INSTR: cv.cmple.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x2d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 2d <unknown>

cv.cmple.sci.h t0, t1, -32
# CHECK-INSTR: cv.cmple.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x2d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 2d <unknown>

cv.cmple.sci.h a0, a1, 7
# CHECK-INSTR: cv.cmple.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x2e] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 2e <unknown>

cv.cmple.sci.h s0, s1, -1
# CHECK-INSTR: cv.cmple.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x2f] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 2f <unknown>

cv.cmple.sci.b t0, t1, -32
# CHECK-INSTR: cv.cmple.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x2d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 2d <unknown>

cv.cmple.sci.b a0, a1, 7
# CHECK-INSTR: cv.cmple.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x2e] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 2e <unknown>

cv.cmple.sci.b s0, s1, -1
# CHECK-INSTR: cv.cmple.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x2f] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 2f <unknown>

cv.cmpgtu.h t0, t1, t2
# CHECK-INSTR: cv.cmpgtu.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x34] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 34 <unknown>

cv.cmpgtu.h a0, a1, a2
# CHECK-INSTR: cv.cmpgtu.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x34] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 34 <unknown>

cv.cmpgtu.h s0, s1, s2
# CHECK-INSTR: cv.cmpgtu.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x35] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 35 <unknown>

cv.cmpgtu.b t0, t1, t2
# CHECK-INSTR: cv.cmpgtu.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x34] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 34 <unknown>

cv.cmpgtu.b a0, a1, a2
# CHECK-INSTR: cv.cmpgtu.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x34] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 34 <unknown>

cv.cmpgtu.b s0, s1, s2
# CHECK-INSTR: cv.cmpgtu.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x35] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 35 <unknown>

cv.cmpgtu.sc.h t0, t1, t2
# CHECK-INSTR: cv.cmpgtu.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x34] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 34 <unknown>

cv.cmpgtu.sc.h a0, a1, a2
# CHECK-INSTR: cv.cmpgtu.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x34] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 34 <unknown>

cv.cmpgtu.sc.h s0, s1, s2
# CHECK-INSTR: cv.cmpgtu.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x35] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 35 <unknown>

cv.cmpgtu.sc.b t0, t1, t2
# CHECK-INSTR: cv.cmpgtu.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x34] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 34 <unknown>

cv.cmpgtu.sc.b a0, a1, a2
# CHECK-INSTR: cv.cmpgtu.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x34] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 34 <unknown>

cv.cmpgtu.sc.b s0, s1, s2
# CHECK-INSTR: cv.cmpgtu.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x35] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 35 <unknown>

cv.cmpgtu.sci.h t0, t1, -32
# CHECK-INSTR: cv.cmpgtu.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x35] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 35 <unknown>

cv.cmpgtu.sci.h a0, a1, 7
# CHECK-INSTR: cv.cmpgtu.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x36] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 36 <unknown>

cv.cmpgtu.sci.h s0, s1, -1
# CHECK-INSTR: cv.cmpgtu.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x37] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 37 <unknown>

cv.cmpgtu.sci.b t0, t1, -32
# CHECK-INSTR: cv.cmpgtu.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x35] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 35 <unknown>

cv.cmpgtu.sci.b a0, a1, 7
# CHECK-INSTR: cv.cmpgtu.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x36] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 36 <unknown>

cv.cmpgtu.sci.b s0, s1, -1
# CHECK-INSTR: cv.cmpgtu.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x37] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 37 <unknown>

cv.cmpgeu.h t0, t1, t2
# CHECK-INSTR: cv.cmpgeu.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x3c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 3c <unknown>

cv.cmpgeu.h a0, a1, a2
# CHECK-INSTR: cv.cmpgeu.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x3c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 3c <unknown>

cv.cmpgeu.h s0, s1, s2
# CHECK-INSTR: cv.cmpgeu.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x3d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 3d <unknown>

cv.cmpgeu.b t0, t1, t2
# CHECK-INSTR: cv.cmpgeu.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x3c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 3c <unknown>

cv.cmpgeu.b a0, a1, a2
# CHECK-INSTR: cv.cmpgeu.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x3c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 3c <unknown>

cv.cmpgeu.b s0, s1, s2
# CHECK-INSTR: cv.cmpgeu.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x3d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 3d <unknown>

cv.cmpgeu.sc.h t0, t1, t2
# CHECK-INSTR: cv.cmpgeu.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x3c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 3c <unknown>

cv.cmpgeu.sc.h a0, a1, a2
# CHECK-INSTR: cv.cmpgeu.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x3c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 3c <unknown>

cv.cmpgeu.sc.h s0, s1, s2
# CHECK-INSTR: cv.cmpgeu.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x3d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 3d <unknown>

cv.cmpgeu.sc.b t0, t1, t2
# CHECK-INSTR: cv.cmpgeu.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x3c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 3c <unknown>

cv.cmpgeu.sc.b a0, a1, a2
# CHECK-INSTR: cv.cmpgeu.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x3c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 3c <unknown>

cv.cmpgeu.sc.b s0, s1, s2
# CHECK-INSTR: cv.cmpgeu.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x3d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 3d <unknown>

cv.cmpgeu.sci.h t0, t1, -32
# CHECK-INSTR: cv.cmpgeu.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x3d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 3d <unknown>

cv.cmpgeu.sci.h a0, a1, 7
# CHECK-INSTR: cv.cmpgeu.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x3e] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 3e <unknown>

cv.cmpgeu.sci.h s0, s1, -1
# CHECK-INSTR: cv.cmpgeu.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x3f] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 3f <unknown>

cv.cmpgeu.sci.b t0, t1, -32
# CHECK-INSTR: cv.cmpgeu.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x3d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 3d <unknown>

cv.cmpgeu.sci.b a0, a1, 7
# CHECK-INSTR: cv.cmpgeu.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x3e] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 3e <unknown>

cv.cmpgeu.sci.b s0, s1, -1
# CHECK-INSTR: cv.cmpgeu.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x3f] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 3f <unknown>

cv.cmpltu.h t0, t1, t2
# CHECK-INSTR: cv.cmpltu.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x44] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 44 <unknown>

cv.cmpltu.h a0, a1, a2
# CHECK-INSTR: cv.cmpltu.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x44] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 44 <unknown>

cv.cmpltu.h s0, s1, s2
# CHECK-INSTR: cv.cmpltu.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x45] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 45 <unknown>

cv.cmpltu.b t0, t1, t2
# CHECK-INSTR: cv.cmpltu.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x44] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 44 <unknown>

cv.cmpltu.b a0, a1, a2
# CHECK-INSTR: cv.cmpltu.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x44] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 44 <unknown>

cv.cmpltu.b s0, s1, s2
# CHECK-INSTR: cv.cmpltu.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x45] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 45 <unknown>

cv.cmpltu.sc.h t0, t1, t2
# CHECK-INSTR: cv.cmpltu.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x44] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 44 <unknown>

cv.cmpltu.sc.h a0, a1, a2
# CHECK-INSTR: cv.cmpltu.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x44] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 44 <unknown>

cv.cmpltu.sc.h s0, s1, s2
# CHECK-INSTR: cv.cmpltu.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x45] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 45 <unknown>

cv.cmpltu.sc.b t0, t1, t2
# CHECK-INSTR: cv.cmpltu.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x44] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 44 <unknown>

cv.cmpltu.sc.b a0, a1, a2
# CHECK-INSTR: cv.cmpltu.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x44] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 44 <unknown>

cv.cmpltu.sc.b s0, s1, s2
# CHECK-INSTR: cv.cmpltu.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x45] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 45 <unknown>

cv.cmpltu.sci.h t0, t1, -32
# CHECK-INSTR: cv.cmpltu.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x45] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 45 <unknown>

cv.cmpltu.sci.h a0, a1, 7
# CHECK-INSTR: cv.cmpltu.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x46] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 46 <unknown>

cv.cmpltu.sci.h s0, s1, -1
# CHECK-INSTR: cv.cmpltu.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x47] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 47 <unknown>

cv.cmpltu.sci.b t0, t1, -32
# CHECK-INSTR: cv.cmpltu.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x45] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 45 <unknown>

cv.cmpltu.sci.b a0, a1, 7
# CHECK-INSTR: cv.cmpltu.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x46] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 46 <unknown>

cv.cmpltu.sci.b s0, s1, -1
# CHECK-INSTR: cv.cmpltu.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x47] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 47 <unknown>

cv.cmpleu.h t0, t1, t2
# CHECK-INSTR: cv.cmpleu.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x4c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 4c <unknown>

cv.cmpleu.h a0, a1, a2
# CHECK-INSTR: cv.cmpleu.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x4c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 4c <unknown>

cv.cmpleu.h s0, s1, s2
# CHECK-INSTR: cv.cmpleu.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x4d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 4d <unknown>

cv.cmpleu.b t0, t1, t2
# CHECK-INSTR: cv.cmpleu.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x12,0x73,0x4c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 12 73 4c <unknown>

cv.cmpleu.b a0, a1, a2
# CHECK-INSTR: cv.cmpleu.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0x95,0xc5,0x4c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 95 c5 4c <unknown>

cv.cmpleu.b s0, s1, s2
# CHECK-INSTR: cv.cmpleu.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0x94,0x24,0x4d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 94 24 4d <unknown>

cv.cmpleu.sc.h t0, t1, t2
# CHECK-INSTR: cv.cmpleu.sc.h t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x4c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 4c <unknown>

cv.cmpleu.sc.h a0, a1, a2
# CHECK-INSTR: cv.cmpleu.sc.h a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x4c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 4c <unknown>

cv.cmpleu.sc.h s0, s1, s2
# CHECK-INSTR: cv.cmpleu.sc.h s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x4d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 4d <unknown>

cv.cmpleu.sc.b t0, t1, t2
# CHECK-INSTR: cv.cmpleu.sc.b t0, t1, t2
# CHECK-ENCODING: [0xfb,0x52,0x73,0x4c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 52 73 4c <unknown>

cv.cmpleu.sc.b a0, a1, a2
# CHECK-INSTR: cv.cmpleu.sc.b a0, a1, a2
# CHECK-ENCODING: [0x7b,0xd5,0xc5,0x4c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d5 c5 4c <unknown>

cv.cmpleu.sc.b s0, s1, s2
# CHECK-INSTR: cv.cmpleu.sc.b s0, s1, s2
# CHECK-ENCODING: [0x7b,0xd4,0x24,0x4d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b d4 24 4d <unknown>

cv.cmpleu.sci.h t0, t1, -32
# CHECK-INSTR: cv.cmpleu.sci.h t0, t1, -32
# CHECK-ENCODING: [0xfb,0x62,0x03,0x4d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 03 4d <unknown>

cv.cmpleu.sci.h a0, a1, 7
# CHECK-INSTR: cv.cmpleu.sci.h a0, a1, 7
# CHECK-ENCODING: [0x7b,0xe5,0x35,0x4e] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 35 4e <unknown>

cv.cmpleu.sci.h s0, s1, -1
# CHECK-INSTR: cv.cmpleu.sci.h s0, s1, -1
# CHECK-ENCODING: [0x7b,0xe4,0xf4,0x4f] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 f4 4f <unknown>

cv.cmpleu.sci.b t0, t1, -32
# CHECK-INSTR: cv.cmpleu.sci.b t0, t1, -32
# CHECK-ENCODING: [0xfb,0x72,0x03,0x4d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 72 03 4d <unknown>

cv.cmpleu.sci.b a0, a1, 7
# CHECK-INSTR: cv.cmpleu.sci.b a0, a1, 7
# CHECK-ENCODING: [0x7b,0xf5,0x35,0x4e] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f5 35 4e <unknown>

cv.cmpleu.sci.b s0, s1, -1
# CHECK-INSTR: cv.cmpleu.sci.b s0, s1, -1
# CHECK-ENCODING: [0x7b,0xf4,0xf4,0x4f] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b f4 f4 4f <unknown>

cv.cplxmul.r t0, t1, t2
# CHECK-INSTR: cv.cplxmul.r t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x54] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 54 <unknown>

cv.cplxmul.r a0, a1, a2
# CHECK-INSTR: cv.cplxmul.r a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x54] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 54 <unknown>

cv.cplxmul.r s0, s1, s2
# CHECK-INSTR: cv.cplxmul.r s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x55] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 55 <unknown>

cv.cplxmul.i t0, t1, t2
# CHECK-INSTR: cv.cplxmul.i t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x56] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 56 <unknown>

cv.cplxmul.i a0, a1, a2
# CHECK-INSTR: cv.cplxmul.i a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x56] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 56 <unknown>

cv.cplxmul.i s0, s1, s2
# CHECK-INSTR: cv.cplxmul.i s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x57] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 57 <unknown>

cv.cplxmul.r.div2 t0, t1, t2
# CHECK-INSTR: cv.cplxmul.r.div2 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x22,0x73,0x54] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 22 73 54 <unknown>

cv.cplxmul.r.div2 a0, a1, a2
# CHECK-INSTR: cv.cplxmul.r.div2 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xa5,0xc5,0x54] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b a5 c5 54 <unknown>

cv.cplxmul.r.div2 s0, s1, s2
# CHECK-INSTR: cv.cplxmul.r.div2 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xa4,0x24,0x55] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b a4 24 55 <unknown>

cv.cplxmul.i.div2 t0, t1, t2
# CHECK-INSTR: cv.cplxmul.i.div2 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x22,0x73,0x56] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 22 73 56 <unknown>

cv.cplxmul.i.div2 a0, a1, a2
# CHECK-INSTR: cv.cplxmul.i.div2 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xa5,0xc5,0x56] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b a5 c5 56 <unknown>

cv.cplxmul.i.div2 s0, s1, s2
# CHECK-INSTR: cv.cplxmul.i.div2 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xa4,0x24,0x57] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b a4 24 57 <unknown>

cv.cplxmul.r.div4 t0, t1, t2
# CHECK-INSTR: cv.cplxmul.r.div4 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x54] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 54 <unknown>

cv.cplxmul.r.div4 a0, a1, a2
# CHECK-INSTR: cv.cplxmul.r.div4 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x54] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 54 <unknown>

cv.cplxmul.r.div4 s0, s1, s2
# CHECK-INSTR: cv.cplxmul.r.div4 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x55] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 55 <unknown>

cv.cplxmul.i.div4 t0, t1, t2
# CHECK-INSTR: cv.cplxmul.i.div4 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x56] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 56 <unknown>

cv.cplxmul.i.div4 a0, a1, a2
# CHECK-INSTR: cv.cplxmul.i.div4 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x56] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 56 <unknown>

cv.cplxmul.i.div4 s0, s1, s2
# CHECK-INSTR: cv.cplxmul.i.div4 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x57] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 57 <unknown>

cv.cplxmul.r.div8 t0, t1, t2
# CHECK-INSTR: cv.cplxmul.r.div8 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x62,0x73,0x54] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 73 54 <unknown>

cv.cplxmul.r.div8 a0, a1, a2
# CHECK-INSTR: cv.cplxmul.r.div8 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xe5,0xc5,0x54] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 c5 54 <unknown>

cv.cplxmul.r.div8 s0, s1, s2
# CHECK-INSTR: cv.cplxmul.r.div8 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xe4,0x24,0x55] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 24 55 <unknown>

cv.cplxmul.i.div8 t0, t1, t2
# CHECK-INSTR: cv.cplxmul.i.div8 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x62,0x73,0x56] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 73 56 <unknown>

cv.cplxmul.i.div8 a0, a1, a2
# CHECK-INSTR: cv.cplxmul.i.div8 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xe5,0xc5,0x56] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 c5 56 <unknown>

cv.cplxmul.i.div8 s0, s1, s2
# CHECK-INSTR: cv.cplxmul.i.div8 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xe4,0x24,0x57] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 24 57 <unknown>

cv.cplxconj t0, t1
# CHECK-INSTR: cv.cplxconj t0, t1
# CHECK-ENCODING: [0xfb,0x02,0x03,0x5c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 03 5c <unknown>

cv.cplxconj a0, a1
# CHECK-INSTR: cv.cplxconj a0, a1
# CHECK-ENCODING: [0x7b,0x85,0x05,0x5c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 05 5c <unknown>

cv.cplxconj s0, s1
# CHECK-INSTR: cv.cplxconj s0, s1
# CHECK-ENCODING: [0x7b,0x84,0x04,0x5c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 04 5c <unknown>

cv.subrotmj t0, t1, t2
# CHECK-INSTR: cv.subrotmj t0, t1, t2
# CHECK-ENCODING: [0xfb,0x02,0x73,0x64] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 02 73 64 <unknown>

cv.subrotmj a0, a1, a2
# CHECK-INSTR: cv.subrotmj a0, a1, a2
# CHECK-ENCODING: [0x7b,0x85,0xc5,0x64] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 85 c5 64 <unknown>

cv.subrotmj s0, s1, s2
# CHECK-INSTR: cv.subrotmj s0, s1, s2
# CHECK-ENCODING: [0x7b,0x84,0x24,0x65] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b 84 24 65 <unknown>

cv.subrotmj.div2 t0, t1, t2
# CHECK-INSTR: cv.subrotmj.div2 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x22,0x73,0x64] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 22 73 64 <unknown>

cv.subrotmj.div2 a0, a1, a2
# CHECK-INSTR: cv.subrotmj.div2 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xa5,0xc5,0x64] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b a5 c5 64 <unknown>

cv.subrotmj.div2 s0, s1, s2
# CHECK-INSTR: cv.subrotmj.div2 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xa4,0x24,0x65] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b a4 24 65 <unknown>

cv.subrotmj.div4 t0, t1, t2
# CHECK-INSTR: cv.subrotmj.div4 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x64] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 64 <unknown>

cv.subrotmj.div4 a0, a1, a2
# CHECK-INSTR: cv.subrotmj.div4 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x64] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 64 <unknown>

cv.subrotmj.div4 s0, s1, s2
# CHECK-INSTR: cv.subrotmj.div4 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x65] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 65 <unknown>

cv.subrotmj.div8 t0, t1, t2
# CHECK-INSTR: cv.subrotmj.div8 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x62,0x73,0x64] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 73 64 <unknown>

cv.subrotmj.div8 a0, a1, a2
# CHECK-INSTR: cv.subrotmj.div8 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xe5,0xc5,0x64] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 c5 64 <unknown>

cv.subrotmj.div8 s0, s1, s2
# CHECK-INSTR: cv.subrotmj.div8 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xe4,0x24,0x65] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 24 65 <unknown>

cv.add.div2 t0, t1, t2
# CHECK-INSTR: cv.add.div2 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x22,0x73,0x6c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 22 73 6c <unknown>

cv.add.div2 a0, a1, a2
# CHECK-INSTR: cv.add.div2 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xa5,0xc5,0x6c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b a5 c5 6c <unknown>

cv.add.div2 s0, s1, s2
# CHECK-INSTR: cv.add.div2 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xa4,0x24,0x6d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b a4 24 6d <unknown>

cv.add.div4 t0, t1, t2
# CHECK-INSTR: cv.add.div4 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x6c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 6c <unknown>

cv.add.div4 a0, a1, a2
# CHECK-INSTR: cv.add.div4 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x6c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 6c <unknown>

cv.add.div4 s0, s1, s2
# CHECK-INSTR: cv.add.div4 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x6d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 6d <unknown>

cv.add.div8 t0, t1, t2
# CHECK-INSTR: cv.add.div8 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x62,0x73,0x6c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 73 6c <unknown>

cv.add.div8 a0, a1, a2
# CHECK-INSTR: cv.add.div8 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xe5,0xc5,0x6c] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 c5 6c <unknown>

cv.add.div8 s0, s1, s2
# CHECK-INSTR: cv.add.div8 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xe4,0x24,0x6d] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 24 6d <unknown>

cv.sub.div2 t0, t1, t2
# CHECK-INSTR: cv.sub.div2 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x22,0x73,0x74] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 22 73 74 <unknown>

cv.sub.div2 a0, a1, a2
# CHECK-INSTR: cv.sub.div2 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xa5,0xc5,0x74] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b a5 c5 74 <unknown>

cv.sub.div2 s0, s1, s2
# CHECK-INSTR: cv.sub.div2 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xa4,0x24,0x75] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b a4 24 75 <unknown>

cv.sub.div4 t0, t1, t2
# CHECK-INSTR: cv.sub.div4 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x42,0x73,0x74] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 42 73 74 <unknown>

cv.sub.div4 a0, a1, a2
# CHECK-INSTR: cv.sub.div4 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xc5,0xc5,0x74] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c5 c5 74 <unknown>

cv.sub.div4 s0, s1, s2
# CHECK-INSTR: cv.sub.div4 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xc4,0x24,0x75] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b c4 24 75 <unknown>

cv.sub.div8 t0, t1, t2
# CHECK-INSTR: cv.sub.div8 t0, t1, t2
# CHECK-ENCODING: [0xfb,0x62,0x73,0x74] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: fb 62 73 74 <unknown>

cv.sub.div8 a0, a1, a2
# CHECK-INSTR: cv.sub.div8 a0, a1, a2
# CHECK-ENCODING: [0x7b,0xe5,0xc5,0x74] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e5 c5 74 <unknown>

cv.sub.div8 s0, s1, s2
# CHECK-INSTR: cv.sub.div8 s0, s1, s2
# CHECK-ENCODING: [0x7b,0xe4,0x24,0x75] 
# CHECK-ERROR: error: instruction requires the following: 'Xcvsimd' (SIMD ALU)
# CHECK-UNKNOWN: 7b e4 24 75 <unknown>

