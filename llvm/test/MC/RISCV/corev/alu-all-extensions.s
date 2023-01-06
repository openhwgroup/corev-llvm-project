# RUN: llvm-mc -triple=riscv32 --mattr=+xcorev -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-INSTR,CHECK-ENCODING

# ALU instructions

cv.abs t0, t1
# CHECK-INSTR: cv.abs t0, t1
# CHECK-ENCODING: [0xab,0x32,0x03,0x50]

cv.slet t0, t1, t2
# CHECK-INSTR: cv.slet t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x52]

cv.sletu t0, t1, t2
# CHECK-INSTR: cv.sletu t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x54]

cv.min t0, t1, t2
# CHECK-INSTR: cv.min t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x56]

cv.minu t0, t1, t2
# CHECK-INSTR: cv.minu t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x58]

cv.max t0, t1, t2
# CHECK-INSTR: cv.max t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x5a]

cv.maxu t0, t1, t2
# CHECK-INSTR: cv.maxu t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x5c]

cv.exths t0, t1
# CHECK-INSTR: cv.exths t0, t1
# CHECK-ENCODING: [0xab,0x32,0x03,0x5e]

cv.exthz t0, t1
# CHECK-INSTR: cv.exthz t0, t1
# CHECK-ENCODING: [0xab,0x32,0x03,0x60]

cv.extbs t0, t1
# CHECK-INSTR: cv.extbs t0, t1
# CHECK-ENCODING: [0xab,0x32,0x03,0x62]

cv.extbz t0, t1
# CHECK-INSTR: cv.extbz t0, t1
# CHECK-ENCODING: [0xab,0x32,0x03,0x64]


cv.clip t0, t1, 5
# CHECK-INSTR: cv.clip t0, t1, 5
# CHECK-ENCODING: [0xab,0x32,0x53,0x70]

cv.clipu t0, t1, 5
# CHECK-INSTR: cv.clipu t0, t1, 5
# CHECK-ENCODING: [0xab,0x32,0x53,0x72]

cv.clipr t0, t1, t2
# CHECK-INSTR: cv.clipr t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x74]

cv.clipur t0, t1, t2
# CHECK-INSTR: cv.clipur t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x76]


cv.addn t0, t1, t2, 5
# CHECK-INSTR: cv.addn t0, t1, t2, 5
# CHECK-ENCODING: [0xab,0x22,0x73,0x0a]

cv.addun t0, t1, t2, 5
# CHECK-INSTR: cv.addun t0, t1, t2, 5
# CHECK-ENCODING: [0xab,0x22,0x73,0x4a]

cv.addrn t0, t1, t2, 5
# CHECK-INSTR: cv.addrn t0, t1, t2, 5
# CHECK-ENCODING: [0xab,0x22,0x73,0x8a]

cv.addurn t0, t1, t2, 5
# CHECK-INSTR: cv.addurn t0, t1, t2, 5
# CHECK-ENCODING: [0xab,0x22,0x73,0xca]

cv.subn t0, t1, t2, 5
# CHECK-INSTR: cv.subn t0, t1, t2, 5
# CHECK-ENCODING: [0xab,0x32,0x73,0x0a]

cv.subun t0, t1, t2, 5
# CHECK-INSTR: cv.subun t0, t1, t2, 5
# CHECK-ENCODING: [0xab,0x32,0x73,0x4a]

cv.subrn t0, t1, t2, 5
# CHECK-INSTR: cv.subrn t0, t1, t2, 5
# CHECK-ENCODING: [0xab,0x32,0x73,0x8a]

cv.suburn t0, t1, t2, 5
# CHECK-INSTR: cv.suburn t0, t1, t2, 5
# CHECK-ENCODING: [0xab,0x32,0x73,0xca]

cv.addnr t0, t1, t2
# CHECK-INSTR: cv.addnr t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x80]

cv.addunr t0, t1, t2
# CHECK-INSTR: cv.addunr t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x82]

cv.addrnr t0, t1, t2
# CHECK-INSTR: cv.addrnr t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x84]

cv.addurnr t0, t1, t2
# CHECK-INSTR: cv.addurnr t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x86]

cv.subnr t0, t1, t2
# CHECK-INSTR: cv.subnr t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x88]

cv.subunr t0, t1, t2
# CHECK-INSTR: cv.subunr t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x8a]

cv.subrnr t0, t1, t2
# CHECK-INSTR: cv.subrnr t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x8c]

cv.suburnr t0, t1, t2
# CHECK-INSTR: cv.suburnr t0, t1, t2
# CHECK-ENCODING: [0xab,0x32,0x73,0x8e]


cv.beqimm t0, 0, 0
# CHECK-INSTR: cv.beqimm t0, 0, 0
# CHECK-ENCODING: [0x63,0xa0,0x02,0x00]

cv.bneimm t0, 0, 0
# CHECK-INSTR: cv.bneimm t0, 0, 0
# CHECK-ENCODING: [0x63,0xb0,0x02,0x00]
