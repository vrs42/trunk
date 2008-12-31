//++
//s3test.v
//
//  TEST THE PDP-8/V ON THE DIGILENT SPARTAN S3-400 EVALUATION BOARD
//  CONFIDENTIAL - CONTAINS TRADE SECRETS OF SPARE TIME GIZMOS, INC.
//   COPYRIGHT (C) 2007 BY SPARE TIME GIZMOS.  ALL RIGHTS RESERVED.
//
// DESCRIPTION:
//   This module is essentially a test fixture for the PDP-8/V design, and it
// uses real hardware, the Digilent Spartan S3-400 Evaluation Board, as the
// platform.  It synthesizes a twelve bit octal display using the seven segment
// LEDs on the Digilent board, a couple of push buttons for control functions
// (e.g. an asynchronous reset), a serial port using the S3 board's MAX232
// level shifters and DB9 connector, and external memory using the boards
// static RAM chips.
//
// REVISION HISTORY:
// 25-Dec-08  RLA  New file.
//--
//000000011111111112222222222333333333344444444445555555555666666666677777777778
//345678901234567890123456789012345678901234567890123456789012345678901234567890
`include "Parameters.v"


module Generate200HzClock (SystemClock, Clock200Hz);
  //++
  //   Generate a 200Hz (more or less) clock from the 50Mhz system clock.
  // This 200Hz clock is used for scanning the S3 board LED displays and also
  // to debounce the board push buttons ...
  //--
  input SystemClock;  output Clock200Hz;
  reg [17:0] Count = 18'b0;
  always @(posedge SystemClock)
    Count <= (Count == 18'd250000) ? 0 : Count+1;
  assign Clock200Hz = (Count == 18'b0);
endmodule


module DebounceButton (SystemClock, Clock200Hz, ButtonState, DebouncedState);
  //++
  //   Debounce a push button...  This implements a purely digital debounce
  // circuit by using a four bit shift register, clocked by the 200Hz clock,
  // to capture the last four states of the button.  The button is down only
  // if the last four states are all '1' ...
  //--
  input SystemClock, Clock200Hz, ButtonState;
  output reg DebouncedState = 1'b0;  reg [3:0] Delay = 4'b0;
  always @ (posedge SystemClock)
    if (Clock200Hz) begin
      Delay <= {Delay [2:0], ButtonState};
      if (Delay == 4'b1111)
	DebouncedState <= 1'b1;
      else if (Delay == 4'b0000)
	DebouncedState <= 1'b0;
     end
endmodule


module OctalDisplay (SystemClock, Clock200Hz, Reset, Data, Segments, Digits);
  //++
  //   This moudle implements a simple four digit, 12 bit, octal display using
  // the four seven segment LEDs on the S3 evaluation board.  The only hassle
  // is that these displays are multiplexed, so we have to actually scan the
  // display one octal digit at a time...
  //--
  input  SystemClock;			// 50Mhz master system clock
  input  Clock200Hz;				// 200Hz scan clock
  input  Reset;					// global reset
  input  [0:11] Data;			// twelve bit octal data to display
  output reg [7:0] Segments;	// numeric display segments
  output reg [3:0] Digits;		//  "   "   "   "  digits

  // The 200Hz clock increments a two bit digit selection register...
  reg [1:0] Select = 2'b0;
  always @(posedge SystemClock or posedge Reset) begin
    if (Reset)
      Select <= 2'b0;
    else
      if (Clock200Hz) Select <= Select + 1;
  end

  // This generates a MUX that selects the correct 3 bit octal digit ...
  reg [2:0] OIT;
  always @(Data or Select)
    case (Select)
      2'H0:  OIT <= Data[9:11];
      2'H1:  OIT <= Data[6:8];
      2'H2:  OIT <= Data[3:5];
      2'H3:  OIT <= Data[0:2];
    endcase

  // This drives the appropriate digit enable when the Select changes...
  always @(Select or Reset)
    if (Reset)
      Digits <= 4'hz;
    else case (Select)
      2'H0:  Digits <= 4'b1110;
      2'H1:  Digits <= 4'b1101;
      2'H2:  Digits <= 4'b1011;
      2'H3:  Digits <= 4'b0111;
    endcase

  // And finally, this is an octal to seven segment decoder ...
  always @(OIT or Reset)
    if (Reset)
      Segments <= 8'hz;
    else case (OIT)
      3'O0:  Segments <= 8'b1000_0001;
      3'O1:  Segments <= 8'b1100_1111;
      3'O2:  Segments <= 8'b1001_0010;
      3'O3:  Segments <= 8'b1000_0110;
      3'O4:  Segments <= 8'b1100_1100;
      3'O5:  Segments <= 8'b1010_0100;
      3'O6:  Segments <= 8'b1010_0000;
      3'O7:  Segments <= 8'b1000_1111;
    endcase
endmodule


module Memory (Clock, Address, Data, WriteEnable);
  //++
  //   This module creates the 4Kx12 RAM for the PDP-8.  Remember when I said
  // that this was implemented with the S3 evaluation board SRAM?  I lied -
  // sorry.  In this case we actually use block RAM inside the FPGA for the
  // main memory instead.  The main reason (the only reason really) is so that
  // we can initialize the contents of memory from a data file on the PC (e.g.
  // FOCAL69.MEM) - otherwise the PDP-8 would have nothing to run and there's
  // currently no way to download anything!
  //--
  input Clock;				// system CPU clock (for clocking writes only)
  input [11:0] Address;	// twelve bit address bus
  inout [11:0] Data;		// twelve bit bidirectional data bus
  input WriteEnable;		// TRUE to write to memory this cycle

  //   Allocate the memory and initialize it.  The Xilinx synthesis tools,
  // at least the later versions, are able to do this via an initial
  // $readmemh() operation...
  reg [11:0] BlockRAM [(2**12)-1:0];  reg [11:0] DataOut;
  initial
    $readmemh("FOCAL69.mem", BlockRAM, 0, 4095);

  // Synthesize a single port block RAM w/synchronous write ...
  always @(posedge Clock)
    if (WriteEnable)
      BlockRAM[Address] <= Data;
    else
      DataOut <= BlockRAM[Address];
  assign Data = ~WriteEnable ? DataOut : 12'bz;
endmodule


module s3test(SystemClock, Segments, Digits, Switches, LEDs, Buttons, SerialOutput, SerialInput);
  //++
  //   This is the top level module for the entire test platform.  All the
  // inputs and outputs to this module correspond to actual hardware on the
  // S3 evaluation board, and you need to be sure they're connected to the
  // right pins via the UCF file...
  //--
  input  SystemClock;		// 50Mhz master system clock
  output [7:0] Segments;	// numeric display segments
  output [3:0] Digits;		//  "   "   "   "  digits
  input  [7:0] Switches;	// slide switches
  output [7:0] LEDs;			// discrete LEDs
  input  [3:0] Buttons;		// push buttons
  output SerialOutput;		// RS-232 port TxD
  input  SerialInput;		//  "  "   "   RxD

  // Create one debounced push button for reset ...
  wire Reset, Clock200Hz;
  Generate200HzClock CK200Hz (SystemClock, Clock200Hz);
  DebounceButton RSTBTN (SystemClock, Clock200Hz, Buttons[3], Reset);

  // Divide the system clock by two to get a 25MHz CPU clock...
  reg CPU_Clock = 1'b0;
  always @(posedge SystemClock) CPU_Clock <= ~CPU_Clock;

  // Internal busses and signals connecting various parts of the PDP-8/V...
  wire MemoryWrite, DeviceWrite, DeviceRead, DeviceClear;
  wire DeviceSkip, InterruptRequest, KL8E_Skip, KL8E_Interrupt;
  wire InterruptGrant, Halted;  wire [1:0] DeviceControl, KL8E_Control;
  wire ReaderRun, FramingError;
  wire [`ADDRESS_WIDTH] MemoryAddress;  wire [`DATA_WIDTH] MemoryData, DeviceData;
  wire [`DATA_WIDTH] FrontPanelDisplay;

  // Synthesize a main memory module for the PDP-8 ...
  Memory ram (SystemClock, MemoryAddress, MemoryData, MemoryWrite);

  // Synthesize a CPU ...
  KK8V cpu (.Clock(CPU_Clock), .Reset(Reset), 
	.MemoryAddress(MemoryAddress), .MemoryData(MemoryData),
	.MemoryWrite(MemoryWrite), .DeviceData(DeviceData), .DeviceClear(DeviceClear),
	.DeviceWrite(DeviceWrite), .DeviceRead(DeviceRead), .DeviceSkip(DeviceSkip), 
	.DeviceControl(DeviceControl), .InterruptRequest(InterruptRequest), 
	.InterruptGrant(InterruptGrant), .Halted(Halted),
	.FrontPanelDisplay(FrontPanelDisplay)
  );

  // Synthesize a console KL8/E terminal interface ...
  KL8E tty (.Clock(CPU_Clock), .Reset(DeviceClear | Reset), .DeviceWrite(DeviceWrite), 
	.DeviceRead(DeviceRead), .DeviceSkip(KL8E_Skip), 
	.DeviceControl(KL8E_Control), .InterruptRequest(KL8E_Interrupt), 
	.MemoryData(MemoryData), .DeviceData(DeviceData),
	.SerialDataIn(SerialInput), .SerialDataOut(SerialOutput),
	.ReaderRun(ReaderRun), .FramingError(FramingError)
  );

  //   Rather than use a wire OR bus (which is always a problem in the FPGA),
  // we just keep separate Skip, Interrupt and Control outputs for every
  // internal device.  They're all explicitly OR'ed together here, along with
  // the external device inputs ...
  assign DeviceSkip       = KL8E_Skip;
  assign DeviceControl    = KL8E_Control;
  assign InterruptRequest = KL8E_Interrupt;

  // The discrete LEDs show various internal status signals ...
  assign LEDs = {Reset, MemoryWrite, DeviceWrite, DeviceRead,
	ReaderRun, FramingError, InterruptRequest, Halted};
	
  // And the octal display shows either the AC or the MA, depending on switch 0 ...
  OctalDisplay ODISP (SystemClock, Clock200Hz, Reset,
	Switches[0] ? MemoryAddress : FrontPanelDisplay, Segments, Digits);
endmodule
