# RUN: llvm-mc -triple=riscv32 --mattr=+xcv -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-INSTR,CHECK-ENCODING

# MAC instructions

# 32x32 bit MAC instructions

cv.mac t0, t1, t2
# CHECK-INSTR: cv.mac t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x90]

cv.msu t0, t1, t2
# CHECK-INSTR: cv.msu t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x92]

# 16x16 bit MUL instructions

cv.muls t0, t1, t2
# CHECK-INSTR: cv.mulsn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x42,0x73,0x00]

cv.mulhhs t0, t1, t2
# CHECK-INSTR: cv.mulhhsn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x42,0x73,0x40]

cv.mulsn t0, t1, t2, 0
# CHECK-INSTR: cv.mulsn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x42,0x73,0x00]

cv.mulhhsn t0, t1, t2, 0
# CHECK-INSTR: cv.mulhhsn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x42,0x73,0x40]

cv.mulsrn t0, t1, t2, 0
# CHECK-INSTR: cv.mulsrn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x42,0x73,0x80]

cv.mulhhsrn t0, t1, t2, 0
# CHECK-INSTR: cv.mulhhsrn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x42,0x73,0xc0]

cv.mulu t0, t1, t2
# CHECK-INSTR: cv.mulun t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x52,0x73,0x00]

cv.mulhhu t0, t1, t2
# CHECK-INSTR: cv.mulhhun t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x52,0x73,0x40]

cv.mulun t0, t1, t2, 0
# CHECK-INSTR: cv.mulun t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x52,0x73,0x00]

cv.mulhhun t0, t1, t2, 0
# CHECK-INSTR: cv.mulhhun t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x52,0x73,0x40]

cv.mulurn t0, t1, t2, 0
# CHECK-INSTR: cv.mulurn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x52,0x73,0x80]

cv.mulhhurn t0, t1, t2, 0
# CHECK-INSTR: cv.mulhhurn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x52,0x73,0xc0]

# 16x16 bit MAC instructions

cv.macsn t0, t1, t2, 0
# CHECK-INSTR: cv.macsn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x62,0x73,0x00]

cv.machhsn t0, t1, t2, 0
# CHECK-INSTR: cv.machhsn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x62,0x73,0x40]

cv.macsrn t0, t1, t2, 0
# CHECK-INSTR: cv.macsrn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x62,0x73,0x80]

cv.machhsrn t0, t1, t2, 0
# CHECK-INSTR: cv.machhsrn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x62,0x73,0xc0]

cv.macun t0, t1, t2, 0
# CHECK-INSTR: cv.macun t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x72,0x73,0x00]

cv.machhun t0, t1, t2, 0
# CHECK-INSTR: cv.machhun t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x72,0x73,0x40]

cv.macurn t0, t1, t2, 0
# CHECK-INSTR: cv.macurn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x72,0x73,0x80]

cv.machhurn t0, t1, t2, 0
# CHECK-INSTR: cv.machhurn t0, t1, t2, 0
# CHECK-ENCODING: [0xdb,0x72,0x73,0xc0]
