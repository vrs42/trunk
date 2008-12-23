//++
//kk8v.v
//
//                        PDP-8/V TOP LEVEL CPU
//  CONFIDENTIAL - CONTAINS TRADE SECRETS OF SPARE TIME GIZMOS, INC.
//   COPYRIGHT (C) 2007 BY SPARE TIME GIZMOS.  ALL RIGHTS RESERVED.
//
// DESIGN NAME:	PDP-8/V
//
// DESCRIPTION:
//   The KK8-V is a Verilog implementation of the PDP-8 CPU. It's approximately
// modeled on the PDP-8/E or 8/A, but it also includes many of the enhancements
// (such as control panel mode) from the Harris HD6120. This is hardly the first
// HDL implementation of a PDP-8, but the 8/V was written with the idea of also
// implementing an OMNIBUS compatible interface that would work with existing
// peripherals such as the RX8-E, RL8-E, and the RK8-E.  Because of that the
// 8/V is fairly close to the /A or /E in both architecture and timing, although
// it is by no means an exact copy.  However, the 8/V was never designed to
// interface with OMNIBUS memories - that's pointless, because many modern FPGAs
// have more RAM inside them then you could ever put on the OMNIBUS anyway.
//
//   The Verilog description of the PDP-8/V is broken up in the classic Huffman
// style, just like we learned in school.  There's a DataPaths module that
// describes the registers, ALU, and their interconnections, and a Controller
// module that describes the state machine and combinatorial logic which direct
// the data paths.  This is in no way simply a behavioral model of a PDP-8 -
// such things are much easier to write but are synthesized less efficiently
// and don't lend themselves well to kind of regular standardized timing
// needed for the OMNIBUS.
//
// TARGET DEVICES
//
// TOOL VERSIONS 
//
// REVISION HISTORY:
// 30-Jun-07  RLA  New file.
//  3-Jul-07  RLA  Add 8/E processor IOTs (CAF, ION, IOF, SGT, etc)
//  3-Jul-07  RLA  Add DeviceClear output
//		   Runs MAINDEC-8E-D0DB-D successfully!
//  4-Jul-07  RLA  Change the InterruptRequest, DeviceControl and DeviceSkip
//		     nets to be active low.
//		   Now runs MAINDEC-8E-D0BB successfully!
//		   Now runs FOCAL-69 (yowza!)
//  7-Jul-07  RLA  Change to an asynchronous reset for compatibility with GSR.
//
// TODO:
//--
//000000011111111112222222222333333333344444444445555555555666666666677777777778
//345678901234567890123456789012345678901234567890123456789012345678901234567890
`include "Parameters.v"		// global declarations for this project


//++
// EXTERNAL INTERFACE
//   The PDP-8/V has separate twelve bit data busses for memory data and I/O
// device data, and those are in addition to the memory address bus.  That's
// a little unusual, but once again that's the way a real PDP-8/A or /E would
// handle it.  In OMNIBUS lingo the memory address bus is MA, the memory data
// bus is MD, and the I/O device data bus is simply DATA.
//
// MEMORY INTERFACE
//   Since the memory has its own separate data bus, there is no memory read
// strobe (e.g. MRD, MEMRD, etc) - the CPU simply presents a new address on the
// memory address bus and, after a suitable delay for memory access time, the
// CPU expects the corresponding location to appear on the memory data bus.
// To write to memory the CPU first outputs the address and then asserts the
// MemoryWrite strobe. MemoryWrite disables the bus drivers in the SRAM chips
// and enables the bus drivers in the CPU to output the contents of the MB
// register on the MemoryData bus.  After a suitable delay for memory access
// time, the CPU releases MemoryWrite.
//
//   This memory interface, especially the write part, is designed around
// modern SRAM chips like the 62256.  For these chips, asserting the WE input
// disables their bus drivers and the actual memory write is triggered by the
// trailing edge of WE.  The 62256 has a _zero_ hold time requirement for both
// the address and data after the trailing edge of WE, and it also has a _zero_
// address setup to WE active requirement.  So this simplified interface works
// quite well - just ground the /CS input and connect /WE to MemoryWrite on
// the SRAMs and you're all set.
//
// I/O DEVICE INTERFACE
//   Unlike memory, for I/O devices there is both a DeviceWrite and a DeviceRead
// strobe.  There's also a two bit DeviceControl bus and a single bit DeviceSkip
// flag, all of which are outputs from the device and inputs to the CPU.  Plus
// there's the usual InterruptRequest and InterruptGrant signals and the twelve
// bit DeviceData bus we discussed earlier.
//
//   Remember that the PDP-8 is unusual in in that it's the peripheral that
// decides what a specific IOT instruction does, and the peripheral tells the
// CPU what to do via the DeviceControl and DeviceSkip signals. When it fetches
// an IOT, the CPU has no idea whether it's an input, an output, a skip, a nop,
// or anything else.
//
//  Any IOT instruction starts out with the CPU asserting the DeviceWrite strobe
// and driving the contents of the AC onto the DeviceData bus.  It's important
// to realize that this write cycle happens for all IOTs and devices, even if
// the IOT is actually an input operation.  That's because the peripheral device
// decides what the IOT does and if it wants this IOT to be an input operation,
// then it can ignore the DeviceData bus at this time.  After the DeviceWrite
// cycle the CPU asserts DeviceRead and the device can, if this is an input IOT,
// use this as an enable signal to drive the device data onto the DeviceData
// bus. 
//
//   The actual IOT instruction is always available on the MemoryData bus for
// the entire duration of the IOT, and the peripheral devices should use the
// lower nine bits of MemoryData (the upper three will always be 3'b110 to
// signify an IOT instruction) to decide which device is addressed and what
// operation is to be performed.  This may be a little unusual, but that's the
// way the OMNIBUS does it - the IOT appears on the MD bus while the device
// data appears on the DATA bus.
//
//   Always while either DeviceWrite or DeviceRead is asserted the selected
// device must drive DeviceControl bus with a two bit code that tells the
// CPU which operation is performed by this IOT -
//
//		0 0	-> AC->DEVICE
//		0 1	-> AC->DEVICE and then AC <= 0
//		1 0	-> AC <= AC OR DEVICE
//		1 1	-> AC <= DEVICE
//
// This is very typical of the PDP-8 I/O bus.  In addition, the device may
// assert the DeviceSkip signal during the DeviceWrite time - if asserted,
// this will cause the CPU to increment the PC and skip the next instruction.
// DeviceSkip is implemented independently of the DeviceControl signals and
// any IOT can be made to skip this way.
//
//   One final thought - notice that the DeviceControl, DeviceSkip, and
// InterruptRequest busses are all active low.  I would have preferred not
// to do this, but in Xilinx devices undriven internal tristate busses are
// pulled high and it's critical that these signals remain inactive when
// they aren't driven by any internal I/O devices.
//--


module KK8V (Clock, Reset,
	MemoryAddress, MemoryData, MemoryWrite,
	DeviceData, DeviceWrite, DeviceRead, DeviceControl_n, DeviceSkip_n,
	InterruptRequest_n, InterruptGrant, Halted, DeviceClear);

  //++
  //   This is the top level module for the PDP-8/V CPU.  All it actually does
  // is instantiate the DataPaths and Controller modules and then wire
  // everything up.
  //--
  // Global signals ...
  input Clock;			// master clock for all operations
  input Reset;			// asynchronous global reset all registers
  // Timing signals ...
  output MemoryWrite;		// strobe for writing to memory
  output DeviceWrite;	 	//  "   "  "   "   "  "  I/O devices
  output DeviceRead;		//  "   "  "  reading from "  "   "
  output DeviceClear;	 	// clear all I/O devices (CAF or master reset)
  // Control and status signals ...
  input wand InterruptRequest_n;// TRUE to request an interrupt cycle
  output InterruptGrant; 	// TRUE while an interrupt cycle is executed
  output Halted;		// TRUE if a HLT instruction is executed
  input wand DeviceSkip_n;	// TRUE during DeviceWrite if the IOT skips
  // Memory and I/O device busses ...
  output [`ADDRESS_WIDTH] MemoryAddress;// memory address bus
  inout  [`DATA_WIDTH] MemoryData;	//   "    data     "
  inout  [`DATA_WIDTH] DeviceData;	// input/output device data bus
  input wand [0:1] DeviceControl_n;	// IOT function (the Cx lines!)
 
  // Internal signals ...
  wire [0:11] Opcode;
  wire LoadPC, LoadIR, LoadMA, LoadMB, LoadMQ, ClearMQ, LoadJMS;
  wire LoadSR, ReadSR, LoadAC, LoadLink, LoadFlags, ReadFlags;
  wire AC_Zero, AC_Minus, LinkBit, MB_Zero, AutoIndex;
  wire InterruptEnable, SetInterruptEnable, ClearInterruptEnable;
  wire [`LEFT_SOURCE_WIDTH] LeftSelect;
  wire [`ALU_FUNCTION_WIDTH] ALU_Function;
  wire [`AC_FUNCTION_WIDTH] AC_Function;
  wire [`ROTATE_FUNCTION_WIDTH] RotateFunction;

  // The DataPaths module ...
  DataPaths DP (
    .Clock(Clock), .Reset(Reset), .Opcode(Opcode),
    .MemoryAddress(MemoryAddress), .MemoryData(MemoryData),
    .DeviceData(DeviceData),
    .MemoryWrite(MemoryWrite), .DeviceWrite(DeviceWrite),
    .LoadPC(LoadPC), .LoadIR(LoadIR), .LoadMA(LoadMA), .LoadMB(LoadMB),
    .LoadMQ(LoadMQ), .ClearMQ(ClearMQ), .LoadSR(LoadSR), .ReadSR(ReadSR),
    .LoadAC(LoadAC), .LoadLink(LoadLink), .LeftSelect(LeftSelect),
    .ALU_Function(ALU_Function), .AC_Function(AC_Function),
    .RotateFunction(RotateFunction),
    .AC_Zero(AC_Zero), .AC_Minus(AC_Minus), .LinkBit(LinkBit),
    .MB_Zero(MB_Zero), .AutoIndex(AutoIndex), .LoadJMS(LoadJMS),
    .InterruptRequest(~InterruptRequest_n), .InterruptEnable(InterruptEnable),
    .InterruptInhibit(InterruptInhibit),.SetInterruptEnable(SetInterruptEnable),
    .ClearInterruptEnable(ClearInterruptEnable),
    .ReadFlags(ReadFlags), .LoadFlags(LoadFlags)
  );

  // And the Controller module ...
  Controller CU (
    .Clock(Clock), .Reset(Reset), .Opcode(Opcode),
    .MemoryData(MemoryData), .MemoryWrite(MemoryWrite),
    .DeviceWrite(DeviceWrite), .DeviceRead(DeviceRead),
    .DeviceSkip(~DeviceSkip_n), .DeviceControl(~DeviceControl_n),
    .InterruptRequest(~InterruptRequest_n), .InterruptGrant(InterruptGrant),
    .Halted(Halted), .AC_Zero(AC_Zero), .AutoIndex(AutoIndex),
    .AC_Minus(AC_Minus), .LinkBit(LinkBit), .MB_Zero(MB_Zero),
    .LoadPC(LoadPC), .LoadIR(LoadIR), .LoadMA(LoadMA), .LoadMB(LoadMB),
    .LoadMQ(LoadMQ), .ClearMQ(ClearMQ), .LoadSR(LoadSR), .ReadSR(ReadSR),
    .LoadAC(LoadAC), .LoadLink(LoadLink), .LoadJMS(LoadJMS),
    .LeftSelect(LeftSelect), .ALU_Function(ALU_Function),
    .AC_Function(AC_Function), .RotateFunction(RotateFunction),
    .SetInterruptEnable(SetInterruptEnable), .InterruptEnable(InterruptEnable),
    .ClearInterruptEnable(ClearInterruptEnable), .DeviceClear(DeviceClear),
    .InterruptInhibit(InterruptInhibit),
    .ReadFlags(ReadFlags), .LoadFlags(LoadFlags)
  );

endmodule
