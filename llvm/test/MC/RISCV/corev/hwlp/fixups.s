# RUN: llvm-mc -triple riscv32 --mattr=+xcorevhwlp -show-encoding %s \
# RUN:     | FileCheck -check-prefix=CHECK-FIXUP %s
# RUN: llvm-mc -filetype=obj -triple riscv32 -mattr=+xcorevhwlp < %s \
# RUN:     | llvm-readobj -r - | FileCheck -check-prefix=CHECK-RELOC %s

.long foo
# CHECK-RELOC: R_RISCV_32 foo 0x0

cv.starti 0, foo
# CHECK-FIXUP: fixup A - offset: 0, value: foo, kind: fixup_riscv_cvpcrel_ui12
# CHECK-RELOC: R_RISCV_CVPCREL_UI12 foo 0x0
cv.endi 0, foo
# CHECK-FIXUP: fixup A - offset: 0, value: foo, kind: fixup_riscv_cvpcrel_ui12
# CHECK-RELOC: R_RISCV_CVPCREL_UI12 foo 0x0
cv.setup 0, zero, foo
# CHECK-FIXUP: fixup A - offset: 0, value: foo, kind: fixup_riscv_cvpcrel_ui12
# CHECK-RELOC: R_RISCV_CVPCREL_UI12 foo 0x0
cv.setupi 0, foo, 0
# CHECK-FIXUP: fixup A - offset: 0, value: foo, kind: fixup_riscv_cvpcrel_urs1
# CHECK-RELOC: R_RISCV_CVPCREL_URS1 foo 0x0
