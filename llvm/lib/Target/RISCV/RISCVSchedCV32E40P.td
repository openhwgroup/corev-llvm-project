// ===---------------------------------------------------------------------===//

def CV32E40PModel : SchedMachineModel {
  let MicroOpBufferSize = 0; // CV32E40P is in-order.
  let IssueWidth = 1;        
  let LoadLatency = 1;          
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
def CV32E40PUnitLSU         : ProcResource<1>; // Load/Store
def CV32E40PUnitBranch      : ProcResource<1>; // Branch/JumpDecoder
def CV32E40PUnitALU         : ProcResource<1>; // ALU
def CV32E40PUnitMul         : ProcResource<1>; // Multiply
def CV32E40PUnitDiv         : ProcResource<1>; // Division
def CV32E40PUnitFPU         : ProcResource<1>; // Optional FPU 
def CV32E40PUnitCSR         : ProcResource<1>; // CSR
} 


//===----------------------------------------------------------------------===//

let SchedModel = CV32E40PModel in {

// ALU
def : WriteRes<WriteIALU, [CV32E40PUnitALU]>;
def : WriteRes<WriteShiftImm, [CV32E40PUnitALU]>;
def : WriteRes<WriteShiftReg, [CV32E40PUnitALU]>;

// Store (sb, sh, sw), assuming they are word aligned
def : WriteRes<WriteSTB, [CV32E40PUnitLSU]>; // sb
def : WriteRes<WriteSTH, [CV32E40PUnitLSU]>; // sh
def : WriteRes<WriteSTW, [CV32E40PUnitLSU]>; // sw

// Load (lh, lw, lbu, lhu), assuming they are word aligned
def : WriteRes<WriteLDH, [CV32E40PUnitLSU]>; // lh, lhu
def : WriteRes<WriteLDW, [CV32E40PUnitLSU]>; // lw
def : WriteRes<WriteLDWU, [CV32E40PUnitLSU]>;
def : WriteRes<WriteLDB, [CV32E40PUnitLSU]>; // lbu

// Jump instructions, assuming jumps are word alligned
let Latency = 2 in {
  def : WriteRes<WriteJmp, [CV32E40PUnitBranch]>;
  def : WriteRes<WriteJal, [CV32E40PUnitBranch]>;
  def : WriteRes<WriteJalr, [CV32E40PUnitBranch]>;
  def : WriteRes<WriteJmpReg, [CV32E40PUnitBranch]>;
}

// mul has a latency of 1 cycle, 
// mulh, mulhsu, mulhu take 5 cycles but RISCVSchedule.td
// does not provide a seperate scheduler resource for those instructions
// assuming that the majority of multiplications take 1 cycle
def : WriteRes<WriteIMul, [CV32E40PUnitMul]>;

// Division and remainder, assuming worst case latency
def : WriteRes<WriteIDiv, [CV32E40PUnitDiv]> {
  let Latency = 35;
  let ResourceCycles = [35];
}

// 32 bit floating point operations
// assuming worst case latency
def : WriteRes<WriteFST32, [CV32E40PUnitLSU]>;
def : WriteRes<WriteFLD32, [CV32E40PUnitLSU]>;
let Latency = 11 in {
  def : WriteRes<WriteFAdd32, [CV32E40PUnitFPU]>;
  def : WriteRes<WriteFSGNJ32, [CV32E40PUnitFPU]>;
  def : WriteRes<WriteFMinMax32, [CV32E40PUnitFPU]>;
  // conversions
  def : WriteRes<WriteFCvtI32ToF32, [CV32E40PUnitFPU]>;
  def : WriteRes<WriteFCvtI64ToF32, [CV32E40PUnitFPU]>;
  def : WriteRes<WriteFCvtF32ToI32, [CV32E40PUnitFPU]>;
  def : WriteRes<WriteFCvtF32ToI64, [CV32E40PUnitFPU]>;
  def : WriteRes<WriteFMovF32ToI32, [CV32E40PUnitFPU]>;
  def : WriteRes<WriteFMovI32ToF32, [CV32E40PUnitFPU]>;

  def : WriteRes<WriteFCmp32, [CV32E40PUnitFPU]>;
  def : WriteRes<WriteFClass32, [CV32E40PUnitFPU]>;
  def : WriteRes<WriteFMul32, [CV32E40PUnitFPU]>;
  def : WriteRes<WriteFMA32, [CV32E40PUnitFPU]>;
}
// Single Precision Floating-Point Division and Square-Root
let Latency = 12 in {
  def : WriteRes<WriteFDiv32, [CV32E40PUnitFPU]>;
  def : WriteRes<WriteFSqrt32, [CV32E40PUnitFPU]>;
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
  def : WriteRes<WriteAtomicW, [CV32E40PUnitLSU]>;
  def : WriteRes<WriteAtomicD, [CV32E40PUnitLSU]>;
  def : WriteRes<WriteAtomicLDW, [CV32E40PUnitLSU]>;
  def : WriteRes<WriteAtomicLDD, [CV32E40PUnitLSU]>;
  def : WriteRes<WriteAtomicSTW, [CV32E40PUnitLSU]>;
  def : WriteRes<WriteAtomicSTD, [CV32E40PUnitLSU]>;

  // 64 bit FP load/store
  def : WriteRes<WriteFST64, [CV32E40PUnitLSU]>;
  def : WriteRes<WriteFLD64, [CV32E40PUnitLSU]>;

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

// Others
// assuming the worst case latency for CSR access
// as there are no scheduler resources to differentiate them
def : WriteRes<WriteCSR, [CV32E40PUnitCSR]> {
  let Latency = 4;
}
def : WriteRes<WriteNop, []>;

//===----------------------------------------------------------------------===//
// Bypass and advance
// CV32E40P has no forwarding 
def : ReadAdvance<ReadJmp, 0>;
def : ReadAdvance<ReadJalr, 0>;
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
