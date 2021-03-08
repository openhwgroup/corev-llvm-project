# RUN: llvm-mc -triple=riscv32 --mattr=+xcorev -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-INSTR,CHECK-ENCODING

# ALU instructions

cv.abs t0, t1
# CHECK-INSTR: cv.abs t0, t1
# CHECK-ENCODING: [0xb3,0x02,0x03,0x04]

cv.slet t0, t1, t2
# CHECK-INSTR: cv.slet t0, t1, t2
# CHECK-ENCODING: [0xb3,0x22,0x73,0x04]

cv.sletu t0, t1, t2
# CHECK-INSTR: cv.sletu t0, t1, t2
# CHECK-ENCODING: [0xb3,0x32,0x73,0x04]

cv.min t0, t1, t2
# CHECK-INSTR: cv.min t0, t1, t2
# CHECK-ENCODING: [0xb3,0x42,0x73,0x04]

cv.minu t0, t1, t2
# CHECK-INSTR: cv.minu t0, t1, t2
# CHECK-ENCODING: [0xb3,0x52,0x73,0x04]

cv.max t0, t1, t2
# CHECK-INSTR: cv.max t0, t1, t2
# CHECK-ENCODING: [0xb3,0x62,0x73,0x04]

cv.maxu t0, t1, t2
# CHECK-INSTR: cv.maxu t0, t1, t2
# CHECK-ENCODING: [0xb3,0x72,0x73,0x04]

cv.exths t0, t1
# CHECK-INSTR: cv.exths t0, t1
# CHECK-ENCODING: [0xb3,0x42,0x03,0x10]

cv.exthz t0, t1
# CHECK-INSTR: cv.exthz t0, t1
# CHECK-ENCODING: [0xb3,0x52,0x03,0x10]

cv.extbs t0, t1
# CHECK-INSTR: cv.extbs t0, t1
# CHECK-ENCODING: [0xb3,0x62,0x03,0x10]

cv.extbz t0, t1
# CHECK-INSTR: cv.extbz t0, t1
# CHECK-ENCODING: [0xb3,0x72,0x03,0x10]


cv.clip t0, t1, 5
# CHECK-INSTR: cv.clip t0, t1, 5
# CHECK-ENCODING: [0xb3,0x12,0x53,0x14]

cv.clipu t0, t1, 5
# CHECK-INSTR: cv.clipu t0, t1, 5
# CHECK-ENCODING: [0xb3,0x22,0x53,0x14]

cv.clipr t0, t1, t2
# CHECK-INSTR: cv.clipr t0, t1, t2
# CHECK-ENCODING: [0xb3,0x52,0x73,0x14]

cv.clipur t0, t1, t2
# CHECK-INSTR: cv.clipur t0, t1, t2
# CHECK-ENCODING: [0xb3,0x62,0x73,0x14]


cv.addn t0, t1, t2, 5
# CHECK-INSTR: cv.addn t0, t1, t2, 5
# CHECK-ENCODING: [0xdb,0x22,0x73,0x0a]

cv.addun t0, t1, t2, 5
# CHECK-INSTR: cv.addun t0, t1, t2, 5
# CHECK-ENCODING: [0xdb,0x22,0x73,0x8a]

cv.addrn t0, t1, t2, 5
# CHECK-INSTR: cv.addrn t0, t1, t2, 5
# CHECK-ENCODING: [0xdb,0x62,0x73,0x0a]

cv.addurn t0, t1, t2, 5
# CHECK-INSTR: cv.addurn t0, t1, t2, 5
# CHECK-ENCODING: [0xdb,0x62,0x73,0x8a]

cv.subn t0, t1, t2, 5
# CHECK-INSTR: cv.subn t0, t1, t2, 5
# CHECK-ENCODING: [0xdb,0x32,0x73,0x0a]

cv.subun t0, t1, t2, 5
# CHECK-INSTR: cv.subun t0, t1, t2, 5
# CHECK-ENCODING: [0xdb,0x32,0x73,0x8a]

cv.subrn t0, t1, t2, 5
# CHECK-INSTR: cv.subrn t0, t1, t2, 5
# CHECK-ENCODING: [0xdb,0x72,0x73,0x0a]

cv.suburn t0, t1, t2, 5
# CHECK-INSTR: cv.suburn t0, t1, t2, 5
# CHECK-ENCODING: [0xdb,0x72,0x73,0x8a]

cv.addnr t0, t1, t2
# CHECK-INSTR: cv.addnr t0, t1, t2
# CHECK-ENCODING: [0xdb,0x22,0x73,0x40]

cv.addunr t0, t1, t2
# CHECK-INSTR: cv.addunr t0, t1, t2
# CHECK-ENCODING: [0xdb,0x22,0x73,0xc0]

cv.addrnr t0, t1, t2
# CHECK-INSTR: cv.addrnr t0, t1, t2
# CHECK-ENCODING: [0xdb,0x62,0x73,0x40]

cv.addurnr t0, t1, t2
# CHECK-INSTR: cv.addurnr t0, t1, t2
# CHECK-ENCODING: [0xdb,0x62,0x73,0xc0]

cv.subnr t0, t1, t2
# CHECK-INSTR: cv.subnr t0, t1, t2
# CHECK-ENCODING: [0xdb,0x32,0x73,0x40]

cv.subunr t0, t1, t2
# CHECK-INSTR: cv.subunr t0, t1, t2
# CHECK-ENCODING: [0xdb,0x32,0x73,0xc0]

cv.subrnr t0, t1, t2
# CHECK-INSTR: cv.subrnr t0, t1, t2
# CHECK-ENCODING: [0xdb,0x72,0x73,0x40]

cv.suburnr t0, t1, t2
# CHECK-INSTR: cv.suburnr t0, t1, t2
# CHECK-ENCODING: [0xdb,0x72,0x73,0xc0]


cv.beqimm t0, 0, 0
# CHECK-INSTR: cv.beqimm t0, 0, 0
# CHECK-ENCODING: [0x63,0xa0,0x02,0x00]

cv.bneimm t0, 0, 0
# CHECK-INSTR: cv.bneimm t0, 0, 0
# CHECK-ENCODING: [0x63,0xb0,0x02,0x00]
