# RUN: llvm-mc -triple=riscv32 --mattr=+xcvbi < %s -show-encoding \
# RUN:     | FileCheck -check-prefix=CHECK-FIXUP %s
# RUN: llvm-mc -filetype=obj -triple=riscv32 --mattr=+xcvbi < %s \
# RUN:     | llvm-objdump --mattr=+xcvbi -M no-aliases -d - \
# RUN:     | FileCheck -check-prefix=CHECK-INSTR %s


foo:
cv.beqimm t0, 0, foo
# CHECK-INSTR: cv.beqimm t0, 0, 0
# CHECK-FIXUP: fixup A - offset: 0, value: foo, kind: fixup_riscv_branch

cv.bneimm t0, 0, foo
# CHECK-INSTR: cv.bneimm t0, 0, 0
# CHECK-FIXUP: fixup A - offset: 0, value: foo, kind: fixup_riscv_branch
