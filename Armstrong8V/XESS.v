//++
// XESS.v
//
//                        PDP-8/V KK8E TEST BENCH
//  CONFIDENTIAL - CONTAINS TRADE SECRETS OF SPARE TIME GIZMOS, INC.
//   COPYRIGHT (C) 2007 BY SPARE TIME GIZMOS.  ALL RIGHTS RESERVED.
//
// DESCRIPTION:
//   This module is a simple Verilog  test fixture for the KK8V CPU.  It will
// instantiate the CPU, attach a suitable memory, reset the CPU, and then
// start clocking.  The clock loop actually never terminates - the Verilog for
// the HLT instruction (and other error conditions) will end the simulation.
//
//
// REVISION HISTORY:
// 23-Dec-08  VRS  New file based on kk8v_tb.v
//--
//000000011111111112222222222333333333344444444445555555555666666666677777777778
//345678901234567890123456789012345678901234567890123456789012345678901234567890
`include "Parameters.v"

module XESS (CLKB, Reset,
	MemoryAddress, MemoryData, MemoryWrite,
	DeviceData, DeviceWrite, DeviceRead, DeviceControl, DeviceSkip,
	InterruptRequest, InterruptGrant, Halted, DeviceClear,
        RS232_TXD, RS232_RXD, RS232_RTS,
        S3_LSER, S3_LCLK, S3_LCL_N,
        S3_SSER_N, S3_SCLK, S3_SCL_N
        );
  // Global signals ...
  input CLKB;			// master clock for all operations
  input Reset;			// asynchronous global reset all registers
  // Timing signals ...
  output MemoryWrite;		// strobe for writing to memory
  output DeviceWrite;	 	//  "   "  "   "   "  "  I/O devices
  output DeviceRead;		//  "   "  "  reading from "  "   "
  output DeviceClear;	 	// clear all I/O devices (CAF or master reset)
  // Control and status signals ...
  inout wand InterruptRequest;// TRUE to request an interrupt cycle
  output InterruptGrant; 	// TRUE while an interrupt cycle is executed
  output Halted;		// TRUE if a HLT instruction is executed
  inout wand DeviceSkip;	// TRUE during DeviceWrite if the IOT skips
  // Memory and I/O device busses ...
  output [`ADDRESS_WIDTH] MemoryAddress;// memory address bus
  output [`DATA_WIDTH] MemoryData;	//   "    data     "
  inout  [`DATA_WIDTH] DeviceData;	// input/output device data bus
  inout wand [0:1] DeviceControl;	// IOT function (the Cx lines!)
  output RS232_TXD, RS232_RTS;
  input RS232_RXD;
  output S3_LSER, S3_LCLK, S3_LCL_N;
  output S3_SCLK, S3_SCL_N;
  input S3_SSER_N;


  //++
  // XESS Interface to KK8V ...
  //--

  // Outputs
  wire [0:11] MemoryAddress;
  wire MemoryWrite;
//wire DeviceWrite, DeviceRead, DeviceClear;
//wire InterruptGrant;
//wire Halted;

  // Bidirs
  wand [`DATA_WIDTH] MemoryData;
  wand [`DATA_WIDTH] DeviceData;
  wire IoDone;
  wire [0:1] ConsoleStatus;
  wire [`DATA_WIDTH] IOrData, IOwData;

  reg CLKC = 1'b0;
  always @(posedge CLKB) begin
     CLKC = ~CLKC;
  end
  
  // The XESS clocks (100Mhz and 50Mhz) are too fast.
  // Synthesise a 25Mhz Clock (from the 50Mhz) here.
  reg Clock = 1'b0;
  always @(posedge CLKC) begin
     Clock = ~Clock;
  end

  // Instantiate the Unit Under Test (UUT)
  KK8V cpu (
	.Clock(Clock), 
	.Reset(Reset), 
	.MemoryAddress(MemoryAddress), 
	.MemoryData(MemoryData), 
	.DeviceData(DeviceData), 
	.MemoryWrite(MemoryWrite), 
	.DeviceClear(DeviceClear),
	.DeviceWrite(DeviceWrite), 
	.DeviceRead(DeviceRead), 
	.DeviceSkip(DeviceSkip), 
	.DeviceControl(DeviceControl), 
	.InterruptRequest(InterruptRequest), 
	.InterruptGrant(InterruptGrant), 
	.Halted(Halted),
        .S3_LSER(S3_LSER),
        .S3_LCLK(S3_LCLK),
        .S3_LCL_N(S3_LCL_N),
        .S3_SSER_N(S3_SSER_N),
        .S3_SCLK(S3_SCLK),
        .S3_SCL_N(S3_SCL_N)
  );

  // We need some memory
  PDP8mem mem (
    .clk(Clock),
    .reset(Reset),
    .rd(~MemoryWrite),
    .wr(MemoryWrite),
    .done(MemoryDone),
    .addr({3'b0, MemoryAddress}),
    .wdata(MemoryData),
    .rdata(MemoryData)
  );
  
`ifdef VRS
  // And a teletype unit ...
  PDP8tty console (
      .clk(Clock),
      .reset(DeviceClear | Reset),
      .IOstart(DeviceRead | DeviceWrite),
      .IOwdata(IOwData),
      .IOaddr(MemoryData[3:8]),
      .IOiop(MemoryData[9:11]),
      .IOcaf(DeviceClear),
      .IOinterrupt(~InterruptRequest),
      .IOrdata(IOrData),
      .IOdevstatus(ConsoleStatus), // Debug stuff
      .IOdone(IoDone),
      .IOskip(~DeviceSkip),
      .Config(2'b0),    // 9600 baud
      .RXD(RS232_RXD),
      .TXD(RS232_TXD),
      .RTS(RS232_RTS)
  );
  assign IOwData = (DeviceWrite)? DeviceData : 12'bz;
  assign DeviceData = (~DeviceWrite)? IOrData : 12'bz;
`endif

  KL8E console(
      .Clock(Clock),
      .Reset(DeviceClear),
      .DeviceWrite(DeviceWrite), 
      .DeviceRead(DeviceRead),
      .DeviceSkip(DeviceSkip),
      .MemoryData(MemoryData),
      .DeviceData(DeviceData),
      .DeviceControl(DeviceControl),
      .InterruptRequest(InterruptRequest),
      .SerialDataIn(RS232_RXD),
      .SerialDataOut(RS232_TXD),
      .ReaderRun(RS232_RTS)
  );

endmodule

`ifdef SIMULATION
module testbed;
  reg Clock;
  reg Reset;
  wire MemoryWrite;		// strobe for writing to memory
  wire DeviceWrite;	 	//  "   "  "   "   "  "  I/O devices
  wire DeviceRead;		//  "   "  "  reading from "  "   "
  wire DeviceClear;	 	// clear all I/O devices (CAF or master reset)
  // Control and status signals ...
  wand InterruptRequest;// TRUE to request an interrupt cycle
  wire InterruptGrant; 	// TRUE while an interrupt cycle is executed
  wire Halted;		// TRUE if a HLT instruction is executed
  wand DeviceSkip;	// TRUE during DeviceWrite if the IOT skips
  // Memory and I/O device busses ...
  wire [`ADDRESS_WIDTH] MemoryAddress;// memory address bus
  wire [`DATA_WIDTH] MemoryData;	//   "    data     "
  wire  [`DATA_WIDTH] DeviceData;	// input/output device data bus
  wand [0:1] DeviceControl;	// IOT function (the Cx lines!)

  //   Simulate pullups on the InterruptRequest, DeviceControl and DeviceSkip
  // signals. This behaviour is automatic for Xilinx internal tristate busses,
  // but we need them for simulation.
  pullup p0(InterruptRequest);  pullup p1(DeviceSkip);
  pullup p2(DeviceControl[0]);  pullup p3(DeviceControl[1]);

  pulldown p4(S3_SSER_N);
  
  XESS xess(
    .Clock(Clock),
    .Reset(Reset),
    .MemoryAddress(MemoryAddress),
    .MemoryData(MemoryData),
    .MemoryWrite(MemoryWrite),
    .DeviceData(DeviceData),
    .DeviceWrite(DeviceWrite),
    .DeviceRead(DeviceRead),
    .DeviceControl(DeviceControl),
    .DeviceSkip(DeviceSkip),
    .InterruptRequest(InterruptRequest),
    .InterruptGrant(InterruptGrant),
    .Halted(Halted),
    .DeviceClear(DeviceClear),
    .RS232_TXD(RS232_TXD),
    .RS232_RXD(RS232_RXD),
    .RS232_RTS(RS232_RTS),
    .S3_LSER(S3_LSER), 
    .S3_LCLK(S3_LCLK), 
    .S3_LCL_N(S3_LCL_N),
    .S3_SSER_N(S3_SSER_N), 
    .S3_SCLK(S3_SCLK), 
    .S3_SCL_N(S3_SCL_N)
  );

  
  initial begin
     Clock = 1;
     Reset = 1;
     #100 Reset = 0;
  end
  always @(posedge Clock) begin
     #10 Clock = 0;
  end
  always @(negedge Clock) begin
     #10 Clock = 1;
  end
  pullup RXD(RS232_RXD);
  pullup iod(IoDone);
endmodule
`endif