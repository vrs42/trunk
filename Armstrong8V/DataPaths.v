//++
//datapaths.v
//
//	         PDP-8/V REGISTERS AND FUNCTIONAL UNITS
//  CONFIDENTIAL - CONTAINS TRADE SECRETS OF SPARE TIME GIZMOS, INC.
//   COPYRIGHT (C) 2007 BY SPARE TIME GIZMOS.  ALL RIGHTS RESERVED.
//
// DESCRIPTION:
//   This module implements all the registers and "functional units" (such as
// the ALU, the rotate unit, etc) in the PDP-8/V.  The operation of all these
// registers and functions is controlled by a nearly endless array of signals
// that originate from the Controller module.
//
//   As somebody once said, a picture is worth a thousand words, and Spare Time
// Gizmos has a fairly nice drawing of a block diagram of the PDP-8/V data
// paths. Needless to say, this module is a whole lot easier to figure out if
// you've got one of those handy.
//
// REVISION HISTORY:
// 30-Jun-07  RLA  New file.
//  2-Jul-07  RLA  Drive the AC onto the IO bus during DeviceWrite.
//  3-Jul-07  RLA  Add 8/E processor IOTs (CAF, ION, IOF, SGT, etc)
//  4-Jul-07  RLA  There's a bit missing from the ReadFlags results
//		   The FlagsUnit needs to get its input data from the
//		    AC_BUS, _not_ the DeviceData bus!
//  7-Jul-07  RLA  Change to an asynchronous reset for compatibility with GSR.
//
// TODO:
//--
//000000011111111112222222222333333333344444444445555555555666666666677777777778
//345678901234567890123456789012345678901234567890123456789012345678901234567890
`include "Parameters.v"		// global declarations for this project


module ArithmeticLogicUnit (Function, Left, Right, LinkIn, Sum, LinkOut);
  //++
  //   The ALU of our PDP-8, such as it is, has two inputs - left and right.
  // The output can be either the left or right input directly, the left or
  // right input incremented, or any one of the AND, OR or ADD functions.
  // The link bit is logically a carry bit, but the PDP-8 is a little unusual
  // in that a carry out of the addition doesn't set the link - it complements
  // it.  If there's no carry out, then the link is unchanged. Note that any
  // addition operation, even the +1 versions, can complement the link but the
  // control unit only latches the new link value for the TAD instruction.
  //--
  input [`ALU_FUNCTION_WIDTH] Function;
  input [`DATA_WIDTH] Left, Right;  output reg [`DATA_WIDTH] Sum;
  input LinkIn; output LinkOut;  reg Carry;

  always @(Left or Right or Function)
    case (Function)
      `ALU_LEFT:
	{Carry, Sum} <= {1'B0, Left};
      `ALU_RIGHT:
	{Carry, Sum} <= {1'B0, Right};
      `ALU_LEFT_AND_RIGHT:
	{Carry, Sum} <= {1'B0, Left & Right};
      `ALU_LEFT_OR_RIGHT:
	{Carry, Sum} <= {1'B0, Left | Right};
      `ALU_LEFT_PLUS_RIGHT, `ALU_LEFT_PLUS_ONE, `ALU_RIGHT_PLUS_ONE:
	{Carry, Sum} <= ((Function==`ALU_RIGHT_PLUS_ONE) ? 12'O0001 : Left)
		    + ((Function==`ALU_LEFT_PLUS_ONE) ? 12'O0001 : Right);
      default:
	{Carry, Sum} <= 13'B0;
    endcase

  // Any carry out of the adder complements the link...
  assign LinkOut = Carry ? ~LinkIn : LinkIn;
endmodule


module RotateUnit (Function, DataIn, LinkIn, DataOut, LinkOut);
  //++
  //   The RotateUnit can implement all the rotate functions of the PDP-8
  // group one micro instruction.  That includes rotate left and right,
  // rotate left or right _twice_, byte swap, and rotate 3 bits left.
  // Note that the latter instruction, R3L is a HD6120 opcode, but we
  // implement it here anyway. Finally, note that all rotations, even
  // the two bit varieties, are implemented in a single clock cycle.
  // This whole thing is basically a giant 13 bit, eight input mux...
  //--
  input [`ROTATE_FUNCTION_WIDTH] Function;
  input [`DATA_WIDTH] DataIn;  output reg [`DATA_WIDTH] DataOut;
  input LinkIn;  output reg LinkOut;

  always @(Function or DataIn or LinkIn)
    case (Function)
      `BYTE_SWAP:
	{LinkOut, DataOut} <= {LinkIn, DataIn[6:11], DataIn[0:5]};
      `ROTATE_THREE_LEFT:
	{LinkOut, DataOut} <= {LinkIn, DataIn[3:11], DataIn[0:2]};
      `ROTATE_LEFT:
	{LinkOut, DataOut} <= {DataIn[0], DataIn[1:11], LinkIn};
      `ROTATE_LEFT_TWICE:
	{LinkOut, DataOut} <= {DataIn[1], DataIn[2:11], LinkIn, DataIn[0]};
      `ROTATE_RIGHT:
	{LinkOut, DataOut} <= {DataIn[11], LinkIn, DataIn[0:10]};
      `ROTATE_RIGHT_TWICE:
	{LinkOut, DataOut} <= {DataIn[10], DataIn[11], LinkIn, DataIn[0:9]};
       default:
	{LinkOut, DataOut} <= {LinkIn, DataIn};
    endcase
endmodule


module ACFunctionUnit (Function, DataIn, LinkIn, DataOut, LinkOut);
  //++
  //   The ACFunctionUnit implements the clear and complement functions
  // of the group 1 operate micro instruction - clear the AC, clear the
  // link, complement the AC, and complement the link. Note that the
  // function bits MUST be exactly the same as bits 4:7 of the PDP-8
  // operate instruction...
  //--
  input [`AC_FUNCTION_WIDTH] Function;
  input [`DATA_WIDTH] DataIn;  output reg [`DATA_WIDTH] DataOut;
  input LinkIn;  output reg LinkOut;

  always @(Function or DataIn or LinkIn)
    case ({Function[0], Function[2]})
      2'B00:   DataOut <= DataIn;     // NOP
      2'B01:   DataOut <= ~DataIn;    // CMA
      2'B10:   DataOut <= 12'O0000;   // CLA
      default: DataOut <= 12'O7777;   // CLA CMA
    endcase

  always @(Function or DataIn or LinkIn)
    case ({Function[1], Function[3]})
      2'B00:   LinkOut <= LinkIn;     // NOP
      2'B01:   LinkOut <= ~LinkIn;    // CML
      2'B10:   LinkOut <= 1'B0;	      // CLL
      default: LinkOut <= 1'B1;	      // CLL CML
    endcase
endmodule


module LeftSelectionUnit (Select, IO, PC, MQ, EA, MA, MD, MB, Out);
  //++
  //   This module is a simple eight input, twelve bit multiplexer that
  // selects the register for the left input of the ALU...
  //--
  input [`LEFT_SOURCE_WIDTH] Select;  output reg [`DATA_WIDTH] Out;
  input [`DATA_WIDTH] IO, PC, MQ, EA, MA, MD, MB;

  always @(Select, IO, PC, MQ, EA, MA, MD, MB)
    case (Select)
      `LEFT_IO: Out <= IO;
      `LEFT_PC: Out <= PC;
      `LEFT_MQ: Out <= MQ;
      `LEFT_EA: Out <= EA;
      `LEFT_MA: Out <= MA;
      `LEFT_MD: Out <= MD;
      `LEFT_MB: Out <= MB;
      default:	Out <= 12'B0;
    endcase
endmodule


module AddressCalculationUnit (IR, MA, EA, AutoIndex);
  //++
  //   This module will calculate the direct address of an MRI.  Bits 5:11
  // of the address come from bits 5:11 of the instruction, and bits 0:4
  // are either zero (if IR[4] == 0) or come from bits 0:4 of the MA.
  //
  //   There's a subtle but critical behavior of the real PDP-8 that if the
  // last instruction on a memory page is current page MRI, then it refers
  // to the page of the MRI, not the next page. For example, if location
  // 0377 contains 1200 (TAD 200) then location 200 is added, not 400. This
  // may not seem like a big deal, but it's why we use the MA in this calc-
  // ulation rather than the PC - by the time the EA is used, the PC has
  // already been incremented.
  //--
  input [`DATA_WIDTH] IR, MA;  output [`DATA_WIDTH] EA;  output AutoIndex;
  assign EA = { (IR[4] ? MA[0:4] : 5'B0),  IR[5:11] };
  assign AutoIndex = EA[0:8] == 9'O001;
endmodule


module RegisterUnit (Clock, Reset, Load, Clear, Read, DataIn, DataOut);
  //++
  //   This RegisterUnit has a synchronous reset, load and clear, and tristate
  // outputs.  Clear and reset are exactly the same function - both reset the
  // register to zero on the next clock - and they're separate inputs only for
  // convenience.  The tristate outputs are enabled on the DataOut lines when
  // the Read input is asserted.  Note that Clear takes precedence over Load
  // if both are asserted.  The MQ, in particular, depends on this particular
  // behaviour.
  //
  //   This sufficies for the AC, PC, IR, MA, MB, SR and MQ - in fact, all
  // registers except for the LINK.  Note that many of these registers do not
  // use all the inputs; for example, only the SR uses the output enable, and
  // only the MQ uses the clear input, but you can simply tie the unused inputs
  // to zero and the synthesis tool will be smart enough to optimize away the
  // useless logic.
  //
  //   And finally, the ClearValue and ResetValue parameters can be used to
  // establish a non-zero values for a reset and clear operation.  
  //--
  parameter ResetValue = 12'O0000;
  parameter ClearValue = 12'O0000;
  input Clock, Reset, Clear, Load, Read;
  input [`DATA_WIDTH] DataIn;  output [`DATA_WIDTH] DataOut;
  reg [`DATA_WIDTH] Data = ResetValue;

  always @(posedge Clock or posedge Reset) begin
    if (Reset)
      Data <= ResetValue;
    else if (Clear)
      Data <= ClearValue;
    else if (Load)
      Data <= DataIn;
  end
  assign DataOut = Read ? Data : 12'BZ;
endmodule


module FlagsUnit (Clock, Reset, LoadLink, LinkIn, LinkBit, InterruptRequest,
	InterruptEnable, SetInterruptEnable, ClearInterruptEnable,
	ReadFlags, LoadFlags, DataIn, DataOut);

  //++
  //   This module implements the basic, non-EMA, version of the PDP-8 flags
  // register.  This is limited to the LINK bit, the interrupt enable flag,
  // and the interrupt request status bit.  FYI - the "FlagData" bus is in
  // reality the DeviceData or I/O bus.  ReadFlags enables bus drivers for
  // bits 0, 2 and 4 which is then gated thru the ALU and into the AC for
  // the GTF instruction.  Conversely, the RTF instruction puts the AC data
  // on the bus and loads bits 0 and into the LINK and Interrupt Enable flip
  // flops.
  //--
  input  Clock, Reset, LoadLink, LinkIn, ReadFlags, LoadFlags;
  input  InterruptRequest, SetInterruptEnable, ClearInterruptEnable;
  output reg LinkBit = 1'b0, InterruptEnable = 1'b0;
  input [`DATA_WIDTH] DataIn;  output [`DATA_WIDTH] DataOut;

  //   The link logic is pretty straight forward and is largely independent
  // of everything else.  Here's a summary of what happens -
  //
  //	       Load  Read   Load
  //	Reset  Link  Flags  Flags       Operation
  //    -----  ----  -----  -----       ----------------------
  //	  1      x     x      x		LinkBit <= 0;
  //      0      1     x      x         LinkBit <= LinkIn;
  //      0      0     1      0         FlagData[0] = LinkBit;
  //      0      0     0      1         LinkBit = FlagData[0]
  always @(posedge Clock or posedge Reset) begin
    if (Reset)
      LinkBit = 1'b0;
    else if (LoadLink)
      LinkBit = LinkIn;
    else if (LoadFlags)
      LinkBit = DataIn[0];
  end

  //  The Interrupt Enable flag is similar, but it has separate control inputs
  // for setting (by the ION instruction) and clearing (by IOF).  BTW, notice
  // that RTF (LoadFlags) _doesn't_ restore InterruptEnable; only the LINK!
  always @(posedge Clock or posedge Reset) begin
    if (Reset | ClearInterruptEnable)
      InterruptEnable = 1'b0;
    else if (SetInterruptEnable)
      InterruptEnable = 1'b1;
  end

  //   And finally, InterruptRequest is just a status bit.  It can be read by
  // the GTF instruction via ReadFlags, but it can't be written...
  assign DataOut = ReadFlags ?
    {LinkBit, 1'b0, InterruptRequest, 1'b0, InterruptEnable, 7'b0} : 12'bz;
  //assign FlagData[0] = ReadFlags ? LinkBit : 1'bz;
  //assign FlagData[2] = ReadFlags ? InterruptRequest : 1'bz;
  //assign FlagData[4] = ReadFlags ? InterruptEnable : 1'bz;
endmodule


//   This module implements the FLAGS register which contains an assortment of
// ad-hoc, unrelated, bits including the LINK, the instruction and data fields,
// the interrupt enable flip flop, the interrupt inhibit flip flop, and more.
// They're implemented all together because they act as a single register for
// the GTF/GCF/RTF instructions, but they also have a lot of separate
// behaviours.

//   Note that the IF can only ever be loaded from the IB - there's no other
// source.  The IB and the DF, however, can be loaded from several places
// including the SF (by RMF), the AC (via RTF), and the IR (by CIF/CDF).
//
//  Instructions that load the IB and/or DF ...
//  Operation       IB          DF
//  ---------   ----------  ----------
//        CDF               Opcode[6:8]
//        CIF   Opcode[6:8]
//        RTF     AC[6:8]     AC[9:11]
//        RMF     SF[0:2]     SF[3:5]
//  Interrupt       0           0
//
//  Instructions that read the IF, IB, DF or SF ...
//  Operation       IB          IF          DF          SF
//  ---------   ----------  ----------  ----------  ----------
//  Interrupt	 SF[0:2]                 SF[3:5]
//        GTF	                                     AC[6:11]
//        RDF                            AC[6:8]
//        RIF                AC[6:8]
//	  RIB                                        AC[6:11]
//        GCF                AC[6:8]     AC[9:11]
//module FieldsUnit (Clock, Reset,
//  FlagData, ReadFlags, LoadFlags, ReadFields, LoadFields, SaveFields,
//  LoadIBtoIF, InterruptInhibit, InstructionField, DataField, Opcode);
//
//  //++
//  //--
//  input  Clock;		// master clock for all operations
//  input  Reset;		// TRUE to synchronously reset all registers
//  input  ReadFields;	// TRUE to read the fields according to Opcode
//  input  LoadFields;	//   "  "  load  "    "     "     "   "  "   "
//  input  SaveFields;	// transfer {IF,DF} -> SF and clear {IF,DF}
//  input  LoadIBtoIF;	// update the IF after a JMP/JMS instruction
//  input  ReadFlags;	// TRUE to read the flags according to Opcode
//  input  LoadFlags;	//   "  "  load  "    "    "    "   "   "  "
//  inout  [`DATA_WIDTH] FlagData;// DeviceData bus for I/O
//  input  [`DATA_WIDTH] Opcode;  // opcode being executed
//  output reg InterruptInhibit;  //  "   "    "   "   "    "   "   inhibit  "
//  output reg [`FIELD_WIDTH]InstructionField;// current instruction field
//  output reg [`FIELD_WIDTH] DataField;	    //  "  "   data     "   "  "
//endmodule


module DataPaths (Clock, Reset, MemoryAddress, MemoryData, DeviceData, Opcode,
  MemoryWrite, DeviceWrite, LoadPC, LoadIR, LoadMA, LoadMB, LoadMQ, ClearMQ,
  LoadSR, ReadSR, LoadAC, LoadLink, LeftSelect, ALU_Function, AC_Function,
  RotateFunction, AC_Zero, AC_Minus, LinkBit, MB_Zero, AutoIndex,
  InterruptRequest, InterruptEnable, SetInterruptEnable, ClearInterruptEnable,
  InterruptInhibit, ReadFlags, LoadFlags, LoadJMS);

  //++
  //--
  input  Clock;			// master clock for all operations
  input  Reset;			// TRUE to synchronously reset all registers
  // Control inputs ...
  input  MemoryWrite;		// TRUE to drive the MB onto the MD bus
  input  DeviceWrite;		//   "	 "  "  "  "  AC onto the IO bus
  input  LoadAC;		// TRUE to load the AC register this cycle
  input  LoadLink;		//   "   "   "	 "  link bit      "      "
  input  LoadPC;		//   "   "   "	 "  PC register	  "      "
  input  LoadMQ;		//   "   "   "	 "  MQ   "   "    "      "
  input  LoadIR;		//   "   "   "	 "  instruction register "
  input  LoadSR;		//   "   "   "	 "  switch register      "
  input  LoadMA;		//   "   "   "	 "  memory address "     "
  input  LoadMB;		//   "   "   "	 "  memory buffer  "     "
  input  ClearMQ;		// TRUE to load MQ with zero this cycle
  input  ReadSR;		// TRUE to gate the SR onto the IOBUS
  input  ReadFlags;		// TRUE to gate the FLAGS into the IOBUS
  input  LoadFlags;		// TRUE to load the FLAGS from the IOBUS
  input  LoadJMS;		// TRUE to load a 4000 (JMS) opcode into the IR
//input  DataField;		// TRUE with LoadMA to use the data field
//input  LoadFields;		// TRUE to load the field according to opcode
//input  SaveFields;		// TRUE to load the SF from {IF,DF}
  input  [`LEFT_SOURCE_WIDTH] LeftSelect;	// register for the ALU left
  input  [`ALU_FUNCTION_WIDTH] ALU_Function;	// ALU function code
  input  [`AC_FUNCTION_WIDTH] AC_Function;	// AC function code
  input  [`ROTATE_FUNCTION_WIDTH]RotateFunction;// rotate function code
  // Status outputs ...
  output AC_Zero;		// TRUE if the AC is zero
  output AC_Minus;		// TRUE if the AC is < 0 (AC[0] != 0)
  output LinkBit;		// current state of the LINK bit
  output MB_Zero;		// TRUE if MB is zero
  output AutoIndex;		// TRUE if MA == 12'O001x
  // Interrupt system flag bits ...
  input  InterruptRequest;	// state of the external interrupt request line
  input  ClearInterruptEnable;	// TRUE to clear the interrupt enable F-F
  input  SetInterruptEnable;	//   "   " set    "    "    "    "     "
  output InterruptEnable;	// current state of the interrupt enable flag
  output InterruptInhibit;	//  "   "    "   "   "   "     "  inhibit  "
  // Memory and device data busses ...
  output [`ADDRESS_WIDTH] MemoryAddress;	// memory address bus
  inout  [`DATA_WIDTH] MemoryData;		//   "	  data	   "
  inout  [`DATA_WIDTH] DeviceData;		// input/output device data bus
  output [`DATA_WIDTH] Opcode;			// current instruction

  // Local signals ...
  wire [`DATA_WIDTH] AC_Bus, MQ_Bus, PC_Bus, Opcode, EA_Bus, MB_Bus;
  wire [`DATA_WIDTH] LeftBus, RightBus, ALU_Bus, SumBus;
  wire Link1, Link2;

  // Processor status flags (LINK, Interrupt Enable, fields) ...
  FlagsUnit FLAGS (Clock, Reset, LoadLink, NewLink, LinkBit,
    InterruptRequest, InterruptEnable, SetInterruptEnable, ClearInterruptEnable,
    ReadFlags, LoadFlags, AC_Bus, DeviceData);

  // Registers ...
  RegisterUnit AC (Clock, Reset, LoadAC, 1'b0, 1'b1, SumBus, AC_Bus);
  RegisterUnit MQ (Clock, Reset, LoadMQ, ClearMQ, 1'b1, AC_Bus, MQ_Bus);
  RegisterUnit MA (Clock, Reset, LoadMA, 1'b0, 1'b1, SumBus, MemoryAddress);
  RegisterUnit MB (Clock, Reset, LoadMB, 1'b0, 1'b1, SumBus, MB_Bus);
  RegisterUnit #(12'O0000, 12'O4000)
		   IR (Clock, Reset, LoadIR, LoadJMS, 1'b1, MemoryData, Opcode);
  RegisterUnit #(12'O0200, 12'O0200)
		   PC (Clock, Reset, LoadPC, 1'b0, 1'b1, SumBus, PC_Bus);
  RegisterUnit #(12'O0, 12'O0)
		   SR (Clock, Reset, LoadSR, 1'b0, ReadSR, AC_Bus, DeviceData);

  // And the data paths ...
  AddressCalculationUnit EA (Opcode, MemoryAddress, EA_Bus, AutoIndex);
  LeftSelectionUnit MUX (LeftSelect, DeviceData, PC_Bus, MQ_Bus,
			  EA_Bus, MemoryAddress, MemoryData, MB_Bus, LeftBus);
  ACFunctionUnit ACF (AC_Function, AC_Bus, LinkBit, RightBus, Link1);
  ArithmeticLogicUnit ALU (ALU_Function,LeftBus,RightBus,Link1,ALU_Bus,Link2);
  RotateUnit ROT (RotateFunction, ALU_Bus, Link2, SumBus, NewLink);

  //   When we're doing a memory write, the MB register actually drives the
  // MD bus, but at all other times the MD bus floats so that the SRAMs can
  // drive data onto it.
  assign MemoryData = MemoryWrite ? MB_Bus : 12'BZ;
  // The same is true of a device write, the AC and the IO bus...
  assign DeviceData = DeviceWrite ? AC_Bus : 12'BZ;

  // These outputs are various simple status flags...
  assign AC_Zero  = (AC_Bus == 12'B0);
  assign AC_Minus = AC_Bus[0];
  assign MB_Zero  = (MB_Bus == 12'B0);
  assign InterruptInhibit = 1'b0;

  // Debugging....
  always @(posedge Clock) begin
    $strobe("AC=%o, L=%b, PC=%o, MQ=%o, IR=%o, IO=%o, IE=%b",
      AC_Bus, LinkBit, PC_Bus, MQ_Bus, Opcode, DeviceData, InterruptEnable);
  end
endmodule
