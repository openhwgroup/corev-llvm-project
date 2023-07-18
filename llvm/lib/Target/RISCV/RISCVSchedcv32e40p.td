// ===---------------------------------------------------------------------===//

def cv32e40pModel : SchedMachineModel {
  let MicroOpBufferSize = 0; // cv32e40p is in-order.
  let IssueWidth = 1;
  let LoadLatency = 3; // see Load SchedWriteRes defs for more detail
  let MispredictPenalty = 3;
  let CompleteModel = false;
  let UnsupportedFeatures = [HasStdExtA, HasAtomicLdSt,
                             HasStdExtZfinx, HasStdExtCOrZca,
                             HasStdExtZbkb, HasStdExtZbkc, HasStdExtZbkx,
                             HasStdExtZknd, HasStdExtZkne,
                             HasStdExtZknh, HasStdExtZksed, HasStdExtZksh,
                             HasStdExtZkr, HasVInstructions, HasVInstructionsI64];
}

// ===---------------------------------------------------------------------===//

let BufferSize = 0 in {     
def cv32e40pUnitLSU         : ProcResource<1>; // Load/Store
def cv32e40pUnitBranch      : ProcResource<1>; // Branch/JumpDecoder
def cv32e40pUnitALU         : ProcResource<1>; // ALU
def cv32e40pUnitMul         : ProcResource<1>; // Multiply
def cv32e40pUnitDiv         : ProcResource<1>; // Division
def cv32e40pUnitFPU         : ProcResource<1>; // Optional FPU 
def cv32e40pUnitCSR         : ProcResource<1>; // CSR
} 


//===----------------------------------------------------------------------===//

let SchedModel = cv32e40pModel in {

// ALU
def : WriteRes<WriteIALU, [cv32e40pUnitALU]>;
def : WriteRes<WriteShiftImm, [cv32e40pUnitALU]>;
def : WriteRes<WriteShiftReg, [cv32e40pUnitALU]>;

// Store, assuming they are word aligned
def : WriteRes<WriteSTB, [cv32e40pUnitLSU]>; // sb
def : WriteRes<WriteSTH, [cv32e40pUnitLSU]>; // sh
def : WriteRes<WriteSTW, [cv32e40pUnitLSU]>; // sw

// Load (lh, lw, lbu, lhu), assuming they are word aligned
// Loads/Stores are pipelined across the EX and WB stage so ResourceCycle = 1
// A data-hazard occurs when the result of a load is used in the next instruction
// This could be modeled with a latency of 2, but a Latency = 3 provided better results in benchmarks
let Latency = 3, let ResourceCycles = [1] in {
  def : WriteRes<WriteLDH, [cv32e40pUnitLSU]>; // lh, lhu
  def : WriteRes<WriteLDW, [cv32e40pUnitLSU]>; // lw
  def : WriteRes<WriteLDWU, [cv32e40pUnitLSU]>;
  def : WriteRes<WriteLDB, [cv32e40pUnitLSU]>; // lbu
}

// Jump instructions, assuming jumps are word aligned
let Latency = 2 in {
  def : WriteRes<WriteJmp, [cv32e40pUnitBranch]>;
  def : WriteRes<WriteJal, [cv32e40pUnitBranch]>;
  def : WriteRes<WriteJalr, [cv32e40pUnitBranch]>;
  def : WriteRes<WriteJmpReg, [cv32e40pUnitBranch]>;
}

// mul has a latency of 1 cycle, 
def : WriteRes<WriteIMul, [cv32e40pUnitMul]>;
// mulh, mulhsu and mulhu take 5 cycles
def cv32e40pUnit_wr : SchedWriteRes<[cv32e40pUnitMul]> {let Latency = 5; let ResourceCycles = [5]; }
def : InstRW<[cv32e40pUnit_wr], (instregex "MULHS?U?")>;

// Division and remainder, assuming worst case latency
def : WriteRes<WriteIDiv, [cv32e40pUnitDiv]> {
  let Latency = 35;
  let ResourceCycles = [35];
}

// 32 bit floating point operations
// assuming worst case latency
// load/store
def : WriteRes<WriteFST32, [cv32e40pUnitLSU]>;
def : WriteRes<WriteFLD32, [cv32e40pUnitLSU]>;
let Latency = 11 in {
  def : WriteRes<WriteFAdd32, [cv32e40pUnitFPU]>;
  def : WriteRes<WriteFMul32, [cv32e40pUnitFPU]>;
  def : WriteRes<WriteFMA32, [cv32e40pUnitFPU]>;
  def : WriteRes<WriteFSGNJ32, [cv32e40pUnitFPU]>;
  def : WriteRes<WriteFMinMax32, [cv32e40pUnitFPU]>;
  // conversions
  def : WriteRes<WriteFCvtI32ToF32, [cv32e40pUnitFPU]>;
  def : WriteRes<WriteFCvtI64ToF32, [cv32e40pUnitFPU]>;
  def : WriteRes<WriteFCvtF32ToI32, [cv32e40pUnitFPU]>;
  def : WriteRes<WriteFCvtF32ToI64, [cv32e40pUnitFPU]>;
  def : WriteRes<WriteFMovF32ToI32, [cv32e40pUnitFPU]>;
  def : WriteRes<WriteFMovI32ToF32, [cv32e40pUnitFPU]>;
  // compare and classify
  def : WriteRes<WriteFCmp32, [cv32e40pUnitFPU]>;
  def : WriteRes<WriteFClass32, [cv32e40pUnitFPU]>;
}
// Single Precision Floating-Point Division and Square-Root
let Latency = 12 in {
  def : WriteRes<WriteFDiv32, [cv32e40pUnitFPU]>;
  def : WriteRes<WriteFSqrt32, [cv32e40pUnitFPU]>;
}

let Unsupported = true in {
  // RV64I
  def : WriteRes<WriteIALU32, []>;
  def : WriteRes<WriteShiftImm32, []>;
  def : WriteRes<WriteShiftReg32, []>;
  def : WriteRes<WriteIDiv32, []>; 
  def : WriteRes<WriteIMul32, []>;
  def : WriteRes<WriteLDD, []>;
  def : WriteRes<WriteSTD, []>;
  // Atomic memory
  def : WriteRes<WriteAtomicW, [cv32e40pUnitLSU]>;
  def : WriteRes<WriteAtomicD, [cv32e40pUnitLSU]>;
  def : WriteRes<WriteAtomicLDW, [cv32e40pUnitLSU]>;
  def : WriteRes<WriteAtomicLDD, [cv32e40pUnitLSU]>;
  def : WriteRes<WriteAtomicSTW, [cv32e40pUnitLSU]>;
  def : WriteRes<WriteAtomicSTD, [cv32e40pUnitLSU]>;
  // 64 bit FP load/store
  def : WriteRes<WriteFST64, [cv32e40pUnitLSU]>;
  def : WriteRes<WriteFLD64, [cv32e40pUnitLSU]>;
  // 64 bit FP instructions 
  def : WriteRes<WriteFAdd64, []>;
  def : WriteRes<WriteFSGNJ64, []>;
  def : WriteRes<WriteFMinMax64, []>;
  def : WriteRes<WriteFCvtI32ToF64, []>;
  def : WriteRes<WriteFCvtI64ToF64, []>;
  def : WriteRes<WriteFCvtF64ToI32, []>;
  def : WriteRes<WriteFCvtF64ToI64, []>;
  def : WriteRes<WriteFCvtF32ToF64, []>;
  def : WriteRes<WriteFCvtF64ToF32, []>;
  def : WriteRes<WriteFClass64, []>;
  def : WriteRes<WriteFCmp64, []>;
  def : WriteRes<WriteFMovF64ToI64, []>;
  def : WriteRes<WriteFMovI64ToF64, []>;
  def : WriteRes<WriteFMul64, []>;
  def : WriteRes<WriteFMA64, []>;
  def : WriteRes<WriteFDiv64, []>;
  def : WriteRes<WriteFSqrt64, []>;
} // Unsupported

// assuming the worst case latency for CSR access
def : WriteRes<WriteCSR, [cv32e40pUnitCSR]> {
  let Latency = 4;
}
def : WriteRes<WriteNop, []>;

//===----------------------------------------------------------------------===//
// ReadAdvance definitions
def : ReadAdvance<ReadJmp, 0>;
// There is a 1-cycle data hazard if jalr depends on a immediatly preceding instrucion
def : ReadAdvance<ReadJalr, -1>;
def : ReadAdvance<ReadCSR, 0>;
def : ReadAdvance<ReadStoreData, 0>;
def : ReadAdvance<ReadMemBase, 0>;
def : ReadAdvance<ReadIALU, 0>;
def : ReadAdvance<ReadIALU32, 0>;
def : ReadAdvance<ReadShiftImm, 0>;
def : ReadAdvance<ReadShiftImm32, 0>;
def : ReadAdvance<ReadShiftReg, 0>;
def : ReadAdvance<ReadShiftReg32, 0>;
def : ReadAdvance<ReadIDiv, 0>;
def : ReadAdvance<ReadIDiv32, 0>;
def : ReadAdvance<ReadIMul, 0>;
def : ReadAdvance<ReadIMul32, 0>;
def : ReadAdvance<ReadAtomicWA, 0>;
def : ReadAdvance<ReadAtomicWD, 0>;
def : ReadAdvance<ReadAtomicDA, 0>;
def : ReadAdvance<ReadAtomicDD, 0>;
def : ReadAdvance<ReadAtomicLDW, 0>;
def : ReadAdvance<ReadAtomicLDD, 0>;
def : ReadAdvance<ReadAtomicSTW, 0>;
def : ReadAdvance<ReadAtomicSTD, 0>;
def : ReadAdvance<ReadFStoreData, 0>;
def : ReadAdvance<ReadFMemBase, 0>;
def : ReadAdvance<ReadFAdd32, 0>;
def : ReadAdvance<ReadFAdd64, 0>;
def : ReadAdvance<ReadFMul32, 0>;
def : ReadAdvance<ReadFMul64, 0>;
def : ReadAdvance<ReadFMA32, 0>;
def : ReadAdvance<ReadFMA64, 0>;
def : ReadAdvance<ReadFDiv32, 0>;
def : ReadAdvance<ReadFDiv64, 0>;
def : ReadAdvance<ReadFSqrt32, 0>;
def : ReadAdvance<ReadFSqrt64, 0>;
def : ReadAdvance<ReadFCmp32, 0>;
def : ReadAdvance<ReadFCmp64, 0>;
def : ReadAdvance<ReadFSGNJ32, 0>;
def : ReadAdvance<ReadFSGNJ64, 0>;
def : ReadAdvance<ReadFMinMax32, 0>;
def : ReadAdvance<ReadFMinMax64, 0>;
def : ReadAdvance<ReadFCvtF32ToI32, 0>;
def : ReadAdvance<ReadFCvtF32ToI64, 0>;
def : ReadAdvance<ReadFCvtF64ToI32, 0>;
def : ReadAdvance<ReadFCvtF64ToI64, 0>;
def : ReadAdvance<ReadFCvtI32ToF32, 0>;
def : ReadAdvance<ReadFCvtI32ToF64, 0>;
def : ReadAdvance<ReadFCvtI64ToF32, 0>;
def : ReadAdvance<ReadFCvtI64ToF64, 0>;
def : ReadAdvance<ReadFCvtF32ToF64, 0>;
def : ReadAdvance<ReadFCvtF64ToF32, 0>;
def : ReadAdvance<ReadFMovF32ToI32, 0>;
def : ReadAdvance<ReadFMovI32ToF32, 0>;
def : ReadAdvance<ReadFMovF64ToI64, 0>;
def : ReadAdvance<ReadFMovI64ToF64, 0>;
def : ReadAdvance<ReadFClass32, 0>;
def : ReadAdvance<ReadFClass64, 0>;

//===----------------------------------------------------------------------===//
// Unsupported extensions
defm : UnsupportedSchedV;
defm : UnsupportedSchedZba;
defm : UnsupportedSchedZbb;
defm : UnsupportedSchedZbc;
defm : UnsupportedSchedZbs;
defm : UnsupportedSchedZbkb;
defm : UnsupportedSchedZbkx;
defm : UnsupportedSchedZfh;
defm : UnsupportedSchedSFB;
}
