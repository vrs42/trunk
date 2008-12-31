//++
//kl8e.v
//
//                       PDP-8/V SERIAL LINE UNIT
//  CONFIDENTIAL - CONTAINS TRADE SECRETS OF SPARE TIME GIZMOS, INC.
//   COPYRIGHT (C) 2007 BY SPARE TIME GIZMOS.  ALL RIGHTS RESERVED.
//
// DESCRIPTION:
//  This module implements a KL8/E compatible serial line unit for the PDP8/V.
//
// REVISION HISTORY:
//  4-Jul-07  RLA  New file.
//		   Add some Verilog magic to send the console output to the
//		     simulation window - this lets us actually see
//  CONGRATULATIONS!!
//  YOU HAVE SUCCESSFULLY LOADED 'FOCAL,1969' ON A PDP-8 COMPUTER.
//  7-Jul-07  RLA  Change to an asynchronous reset for compatibility with GSR.
//            RLA  Rewrite the ReaderRun code so XST can infer a F-F.
//  8-Jul-07  RLA  OldTBF should reset to 1, not zero!
//                 Convert open drain signals DeviceSkip, DeviceControl and
//                   InterruptRequest, to normal signals
//                 Pass FramingError and ReaderRun back up a level
//
// TODO:
//   Add support for the DECmate style extended serial units 
//     i.e. modem control, programmable baud rate, etc
//   Change terminology from "Reset" to "Clear" or "DeviceClear" ...
//--
//000000011111111112222222222333333333344444444445555555555666666666677777777778
//345678901234567890123456789012345678901234567890123456789012345678901234567890
`include "Parameters.v"		// global declarations for this project


// Receiver (keyboard) IOTs ...
`define KCF	3'O0	// clear keyboard data ready flag
`define KSF	3'O1	// skip on receiver data ready flag
`define KCC	3'O2	// clear AC and receiver flag, set reader run
`define KRS	3'O4	// OR transfer keyboard into AC
`define KIE	3'O5	// set interrupt enable from AC[11]
`define KRB	3'O6	// read keyboard and clear flag (KCC + KRS)

// Transmitter (teleprinter) IOTS ...
`define TFL	3'O0	// set transmitter flag
`define TSF	3'O1	// skip if transmitter flag is set
`define TCF	3'O2	// clear transmitter flag
`define TPC	3'O4	// load character from AC 
`define SPI	3'O5	// skip on transmitter or receiver interrupt
`define TLS	3'O6	// print character (TCF + TPC)


module KeyboardControl (Clock, Reset, IOT, Write, Read, Skip, Control,
	InterruptEnable, KeyboardFlag, ReaderRun, SetKeyboardFlag,
	ClearReaderRun, DataBus, ReadKeyboardData);

  //++
  //   This module implements the control logic for the keyboard (receiver)
  // half of the standard KL8E style serial line unit.  It decodes the IOTs,
  // drives the DeviceControl and DeviceSkip signals as necessary, gates the
  // receiver data onto the I/O bus when it should, and keeps track of the
  // Keyboard data ready flag.
  //
  //   In addition to that, it also implements the Interrupt Enable flag and
  // the Reader Run flag.  The interrupt enable is actually global to both the
  // keyboard and the teleprinter sections of the KL8E interface, and Reader
  // Run enables the paper tape reader on the ASR-33 (just in case you happen
  // to have one :-)
  //--
  parameter DeviceSelect = 6'O03;
  input [`DATA_WIDTH] IOT;  output ReadKeyboardData;  output [0:1] Control;
  input [`DATA_WIDTH] DataBus;  input SetKeyboardFlag, ClearReaderRun;
  input Clock, Reset, Write, Read;  output Skip;
  output reg KeyboardFlag=1'b0, ReaderRun=1'b1, InterruptEnable=1'b1;

  //   Selected is asserted whenever our device code appears, but this alone
  // isn't enough for an I/I - you still have to AND Select with either
  // DeviceRead or DeviceWrite or both ...
  wire Selected;  assign Selected = IOT[3:8] == DeviceSelect;

  //   The keyboard unit actually has three status flip flops - a receiver
  // data ready flag, a paper tape reader run flag, and an interrupt enable.
  // The interrupt enable is also shared by the teleprinter part of the KL8E.
  // This always block synthesizes those flip flops and handles updating them.
  // Notice that device flags are always set and/or cleared during phase 1
  // (the DeviceWrite) part of the IOT.
  always @(posedge Clock or posedge Reset) begin
    //   The KeyboardFlag is cleared by KCC, KRS, KRB or Reset (which is
    // itself a combination of global reset or the CAF IOT).  The receiver
    // flag is set only when a new character is received...
    if (Reset)
      KeyboardFlag = 1'b0;
    else if (  (Write & Selected & (IOT[9:11] == `KCC))
	     | (Write & Selected & (IOT[9:11] == `KRS))
	     | (Write & Selected & (IOT[9:11] == `KRB)) )
      KeyboardFlag = 1'b0;
    else if (SetKeyboardFlag)
      KeyboardFlag = 1'b1;

    //   ReaderRun is set by KCC, KRB or Reset and is reset by the start bit
    // of the next incoming character ...
    if (Reset)
      ReaderRun = 1'b1;
    else if (  (Write & Selected & (IOT[9:11] == `KCC))
	     | (Write & Selected & (IOT[9:11] == `KRB)) )
      ReaderRun = 1'b1;
    else if (ClearReaderRun)
      ReaderRun = 1'b0;

    // InterruptEnable is set by Clear and set/reset from AC[11] by KIE ...
    if (Reset)
      InterruptEnable = 1'b1;
    else if (Write & Selected & (IOT[9:11] == `KIE))
      InterruptEnable = DataBus[11];
  end

  //   C0 (clear the AC) is asserted for KCC and KRB, and C1 (read peripheral
  // data) is asserted for KRS and KRB.  Notice that the Cx lines are sampled
  // during the DeviceRead time...
  assign Control[0] = Read & Selected & ((IOT[9:11]==`KCC) | (IOT[9:11]==`KRB));
  assign Control[1] = Read & Selected & ((IOT[9:11]==`KRS) | (IOT[9:11]==`KRB));

  // Skip is asserted for KSF if the KeyboardFlag is also set ...
  // Notice that Skip is sampled during the DeviceWrite time ...
  assign Skip = Write & Selected & (IOT[9:11]==`KSF) & KeyboardFlag;

  // And drive the receiver data onto the bus during KRB or KRS...
  assign ReadKeyboardData = Read & Selected & ((IOT[9:11]==`KRS) | (IOT[9:11]==`KRB));
endmodule


module TeleprinterControl (Clock, Reset, IOT, Write, Read, Skip,
	InterruptRequest, PrinterFlag, SetPrinterFlag, LoadPrinterData);

  //++
  //   And this module implements the logic for the teleprinter (transmitter)
  // side of the KL8E.  It's a little simpler than the receiver logic because
  // a) the transmitter side never drives the Cx lines, and b) the transmitter
  // only has one status flip flop to deal with.
  //
  //   By the way, the LoadPrinterData output is an enable to the console UART
  // and should cause the data on the DeviceData bus to be loaded.  When the
  // UART is done sending, it should set the SetPrinterFlag input for at least
  // one clock cycle.
  //--
  parameter DeviceSelect = 6'O04;
  input Clock, Reset, Read, Write, InterruptRequest, SetPrinterFlag;
  input [`DATA_WIDTH] IOT;  output Skip;
  output reg PrinterFlag=1'b0;  output LoadPrinterData;

  //   Selected is asserted whenever our device code appears, but this alone
  // isn't enough for an I/I - you still have to AND Select with either
  // DeviceRead or DeviceWrite or both ...
  wire Selected;  assign Selected = IOT[3:8] == DeviceSelect;

  //   The teleprinter section only has one flag, which is set when a
  // byte is sent or by TFL, and is reset by Reset, TCF and TLS...
  always @(posedge Clock or posedge Reset) begin
    if (Reset)
      PrinterFlag = 1'b0;
    else if (  (Write & Selected & (IOT[9:11] == `TCF))
	     | (Write & Selected & (IOT[9:11] == `TLS)) )
      PrinterFlag = 1'b0;
    else if (SetPrinterFlag | (Write & Selected & (IOT[9:11] == `TFL)))
      PrinterFlag = 1'b1;
  end

  // Note that the teleprinter section _never_ asserts any Cx lines ...

  //   Skip is asserted for TSF if the PrinterFlag is also set, OR for SPI
  // if either the printer or the keyboard is interrupting now ...
  assign Skip =   (Write & Selected & (IOT[9:11]==`TSF) & PrinterFlag)
		| (Write & Selected & (IOT[9:11]==`SPI) & InterruptRequest);

  // And LoadPrinterData is asserted for the Write phase of TPC or TLS ...
  assign LoadPrinterData =
    Write & Selected & ((IOT[9:11]==`TPC) | (IOT[9:11]==`TLS));
endmodule


module KL8E (Clock, Reset, DeviceWrite, DeviceRead, DeviceSkip,
	MemoryData, DeviceData, DeviceControl, InterruptRequest,
	SerialDataIn, SerialDataOut, ReaderRun, FramingError);

  //++
  //   This module integrates the KeyboardControl, TeleprinterControl, and a
  // UART of some kind to form a complete serial line interface...
  //--
  parameter KeyboardSelect    = 6'O03;
  parameter TransmitterSelect = 6'O04;
  input  Clock;		  	// master clock for all operations
  input  Reset;	  	 	// clear all I/O devices
  input  DeviceWrite;		// strobe to transfer data to the device
  input  DeviceRead;		//  "  "  "   "    "    "  to the AC
  output DeviceSkip;		// TRUE during DeviceWrite to skip
  output InterruptRequest;	// TRUE to request an interrupt cycle
  input [`DATA_WIDTH]MemoryData;// contains the IOT opcode for decoding
  inout [`DATA_WIDTH]DeviceData;// input/output device data bus
  output [0:1] DeviceControl;	// IOT function (the Cx lines!)
  input  SerialDataIn;		// transmitted serial data output
  output SerialDataOut;		// received serial data input
  output ReaderRun;		// reader run flag (or clear to send)
  output FramingError;		// BREAK pressed on console terminal

  // Local signals ...
  wire KeyboardFlag, PrinterFlag, InterruptEnable;
  wire SetKeyboardFlag, ClearReaderRun, SetPrinterFlag;  wire LoadPrinterData;
  wire ReadKeyboardData, KeyboardSkip, PrinterSkip;
  wire OverflowError, TransmitterBufferEmpty, ReceiverBufferFull;

  KeyboardControl #(KeyboardSelect) KC (
    .Clock(Clock), .Reset(Reset),
    .IOT(MemoryData), .Write(DeviceWrite), .Read(DeviceRead),
    .Skip(KeyboardSkip), .Control(DeviceControl),
    .InterruptEnable(InterruptEnable), .KeyboardFlag(KeyboardFlag),
    .ReaderRun(ReaderRun),
    .SetKeyboardFlag(SetKeyboardFlag), .ClearReaderRun(ClearReaderRun),
    .DataBus(DeviceData), .ReadKeyboardData(ReadKeyboardData)
  );

  TeleprinterControl #(TransmitterSelect) TC (
    .Clock(Clock), .Reset(Reset),
    .IOT(MemoryData), .Write(DeviceWrite), .Read(DeviceRead),
    .Skip(PrinterSkip), 
    .InterruptRequest(InterruptRequest), .PrinterFlag(PrinterFlag),
    .SetPrinterFlag(SetPrinterFlag), .LoadPrinterData(LoadPrinterData));

  // Interrupt and skip logic ...
  assign InterruptRequest = InterruptEnable & (PrinterFlag | KeyboardFlag);
  assign DeviceSkip = KeyboardSkip | PrinterSkip;

  assign DeviceData[0:3] = ReadKeyboardData ? 4'b0 : 4'bz;
  assign ClearReaderRun = ~SerialDataIn;
  UART #(163) uart (.SystemClock(Clock), .Reset(Reset), .DataBus(DeviceData[4:11]),
    .SendData(LoadPrinterData), 
    .TransmitterBufferEmpty(TransmitterBufferEmpty), .SerialDataOut(SerialDataOut),
    .ReceiverBufferFull(ReceiverBufferFull), .ReadData(ReadKeyboardData),
    .SerialDataIn(SerialDataIn), .FramingError(FramingError),
    .OverflowError(OverflowError), .ClearErrors(1'b0)
  );

  // Find a 0 -> 1 transition on TransmitterBufferEmpty...
  reg OldTBE = 1'b1;
  assign SetPrinterFlag = ~OldTBE & TransmitterBufferEmpty;
  always @(posedge Clock or posedge Reset)
    if (Reset)
      OldTBE <= 1'b1;
    else begin
      OldTBE <= TransmitterBufferEmpty;
    end

  // Find a 0 -> 1 transition on ReceiverBufferFull...
  reg OldRBF = 1'b0;
  assign SetKeyboardFlag = ~OldRBF & ReceiverBufferFull;
  always @(posedge Clock or posedge Reset)
    if (Reset)
      OldRBF <= 1'b0;
    else begin
      OldRBF <= ReceiverBufferFull;
    end

//  // Send text output to the console for debugging...
//  reg [0:6] ch;
//  initial begin
//    SetPrinterFlag = 1'b0;  SetKeyboardFlag = 1'b0;  ClearReaderRun = 1'b0;
//  end
//  always @(negedge Clock) begin
//    if (LoadPrinterData) begin
//      ch = DeviceData[5:11]; $write("%c", ch);
//      #500 SetPrinterFlag = 1'b1;  #100 SetPrinterFlag = 1'b0;
//   end
//  end
endmodule
