# RUN: llvm-mc -triple=riscv32 --mattr=+xcorev -show-encoding %s 2>&1 \
# RUN:        | FileCheck %s --check-prefixes=CHECK-INSTR,CHECK-ENCODING

# Load instructions

cv.lb t0, 0(t1!)
# CHECK-INSTR: cv.lb t0, 0(t1!)
# CHECK-ENCODING: [0x8b,0x02,0x03,0x00]

cv.lbu t0, 0(t1!)
# CHECK-INSTR: cv.lbu t0, 0(t1!)
# CHECK-ENCODING: [0x8b,0x42,0x03,0x00]

cv.lh t0, 0(t1!)
# CHECK-INSTR: cv.lh t0, 0(t1!)
# CHECK-ENCODING: [0x8b,0x12,0x03,0x00]

cv.lhu t0, 0(t1!)
# CHECK-INSTR: cv.lhu t0, 0(t1!)
# CHECK-ENCODING: [0x8b,0x52,0x03,0x00]

cv.lw t0, 0(t1!)
# CHECK-INSTR: cv.lw t0, 0(t1!)
# CHECK-ENCODING: [0x8b,0x22,0x03,0x00]


cv.lb t0, t2(t1!)
# CHECK-INSTR: cv.lb t0, t2(t1!)
# CHECK-ENCODING: [0xab,0x32,0x73,0x00]

cv.lbu t0, t2(t1!)
# CHECK-INSTR: cv.lbu t0, t2(t1!)
# CHECK-ENCODING: [0xab,0x32,0x73,0x10]

cv.lh t0, t2(t1!)
# CHECK-INSTR: cv.lh t0, t2(t1!)
# CHECK-ENCODING: [0xab,0x32,0x73,0x02]

cv.lhu t0, t2(t1!)
# CHECK-INSTR: cv.lhu t0, t2(t1!)
# CHECK-ENCODING: [0xab,0x32,0x73,0x12]

cv.lw t0, t2(t1!)
# CHECK-INSTR: cv.lw t0, t2(t1!)
# CHECK-ENCODING: [0xab,0x32,0x73,0x04]


cv.lb t0, t2(t1)
# CHECK-INSTR: cv.lb t0, t2(t1)
# CHECK-ENCODING: [0xab,0x32,0x73,0x08]

cv.lbu t0, t2(t1)
# CHECK-INSTR: cv.lbu t0, t2(t1)
# CHECK-ENCODING: [0xab,0x32,0x73,0x18]

cv.lh t0, t2(t1)
# CHECK-INSTR: cv.lh t0, t2(t1)
# CHECK-ENCODING: [0xab,0x32,0x73,0x0a]

cv.lhu t0, t2(t1)
# CHECK-INSTR: cv.lhu t0, t2(t1)
# CHECK-ENCODING: [0xab,0x32,0x73,0x1a]

cv.lw t0, t2(t1)
# CHECK-INSTR: cv.lw t0, t2(t1)
# CHECK-ENCODING: [0xab,0x32,0x73,0x0c]


# Store instructions

cv.sb t0, 0(t1!)
# CHECK-INSTR: cv.sb t0, 0(t1!)
# CHECK-ENCODING: [0x2b,0x00,0x53,0x00]

cv.sh t0, 0(t1!)
# CHECK-INSTR: cv.sh t0, 0(t1!)
# CHECK-ENCODING: [0x2b,0x10,0x53,0x00]

cv.sw t0, 0(t1!)
# CHECK-INSTR: cv.sw t0, 0(t1!)
# CHECK-ENCODING: [0x2b,0x20,0x53,0x00]


cv.sb t0, t2(t1!)
# CHECK-INSTR: cv.sb t0, t2(t1!)
# CHECK-ENCODING: [0xab,0x33,0x53,0x20]

cv.sh t0, t2(t1!)
# CHECK-INSTR: cv.sh t0, t2(t1!)
# CHECK-ENCODING: [0xab,0x33,0x53,0x22]

cv.sw t0, t2(t1!)
# CHECK-INSTR: cv.sw t0, t2(t1!)
# CHECK-ENCODING: [0xab,0x33,0x53,0x24]


cv.sb t0, t2(t1)
# CHECK-INSTR: cv.sb t0, t2(t1)
# CHECK-ENCODING: [0xab,0x33,0x53,0x28]

cv.sh t0, t2(t1)
# CHECK-INSTR: cv.sh t0, t2(t1)
# CHECK-ENCODING: [0xab,0x33,0x53,0x2a]

cv.sw t0, t2(t1)
# CHECK-INSTR: cv.sw t0, t2(t1)
# CHECK-ENCODING: [0xab,0x33,0x53,0x2c]
