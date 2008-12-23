//++
// kk8v_tb.v
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
//   The contents of the memory is pre-loaded with an external data file
// (see the RAM module for more details) to give the CPU something to do.
//
// REVISION HISTORY:
// 01-Jul-07  RLA  New file.
//--
//000000011111111112222222222333333333344444444445555555555666666666677777777778
//345678901234567890123456789012345678901234567890123456789012345678901234567890
`include "C:\Xilinx91i\verilog\src\glbl.v"
`include "Parameters.v"


module RAM (A, D, WE);
  //++
  //   This is a simple 4K x 12 SRAM module implemented using the Spartan
  // block RAM devices.  The interface is basically the same as a 62256
  // type SRAM - address, data and write strobe...
  //--
  input [11:0]A;		// address inputs
  inout [11:0]D;		// bidirectional data bus
  input WE;			// write strobe
  reg [11:0] Data [0:4095];	// internal registered bus drivers
  integer i;

  //   Load the contents of an external hex file into RAM - this sets the
  // initial RAM contents, although those can of course always be over
  // written later by the CPU.  Notice that before loading the file we also
  // initialize everything to a HLT instruction - that ensures that any RAM
  // locations which _aren't_ in the .MEM file will be initialized too.
  initial begin
    for (i = 0;  i < 4096;  i=i+1) Data[i] = 12'O7402;
    $readmemh("d0eb.mem", Data, 0, 4095);
  end
  
  //   Here's the basic RAM module.  It's nothing special, but be careful when
  // fooling with it.  If you change the structure too much, then the synthesis
  // tool may not be able to infer a block RAM any more!
  assign D = (~WE) ? Data[A] : 12'OZ;
  always @(A or D or WE) begin
    if (WE) begin
      Data[A] = D;
      //$strobe("Write RAM[%o] = %o", A, D);
    end
  end
endmodule


module kk8v_tb_v;
  //++
  // KK8V Verilog test bench ...
  //--

  // Inputs
  reg Clock;  wire Reset;
  wand DeviceSkip_n, InterruptRequest_n; 
  wand [0:1] DeviceControl_n;

  // Outputs
  wire [0:11] MemoryAddress;
  wire MemoryWrite, DeviceWrite, DeviceRead, DeviceClear;
  wire InterruptGrant;
  wire Halted;

  // Bidirs
  wire [0:11] MemoryData, DeviceData;

  // Implement the CPU reset using the global reset built into the FPGA ...
  glbl GLBL();
  assign Reset = GLBL.GSR;
  //assign Reset = 1'b0;

  //   Simulate pullups on the InterruptRequest, DeviceControl and DeviceSkip
  // signals. This behaviour is automatic for Xilinx internal tristate busses,
  // but we need them for simulation.
  pullup(InterruptRequest_n);  pullup(DeviceSkip_n);
  pullup(DeviceControl_n[0]);  pullup(DeviceControl_n[1]);

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
	.DeviceSkip_n(DeviceSkip_n), 
	.DeviceControl_n(DeviceControl_n), 
	.InterruptRequest_n(InterruptRequest_n), 
	.InterruptGrant(InterruptGrant), 
	.Halted(Halted)
  );
  
  // Attach a RAM module ... 
  RAM ram (MemoryAddress, MemoryData, MemoryWrite);

  // And attach a teletype unit ...
  KL8E tty (
	.Clock(Clock), 
	.Reset(DeviceClear | Reset),
	.DeviceWrite(DeviceWrite), 
	.DeviceRead(DeviceRead), 
	.DeviceSkip_n(DeviceSkip_n), 
	.DeviceControl_n(DeviceControl_n), 
	.InterruptRequest_n(InterruptRequest_n), 
	.MemoryData(MemoryData), 
	.DeviceData(DeviceData) 
  );

  initial begin
    // Initialize Inputs
    Clock = 1'b0;  //Reset = 1'b1;
    //DeviceSkip_n = 1'b1;  DeviceControl_n = 2'b11;  InterruptRequest_n = 1'b1;
    // Wait 100 ns for global reset to finish
    #100;

    // Do a reset cycle...
    //#20 Clock = 1'b1;  #20 Reset = 1'b0;  Clock = 1'b0;
    // Add stimulus here

    forever begin
      #20 Clock = 1'b1;  #20 Clock = 1'b0;
    end
  end
endmodule

