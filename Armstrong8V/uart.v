//++
//uart.v
//
//   BASIC UART
//   Copyright (C) 2007 by Spare Time Gizmos.  All rights reserved.
//
// DESIGN NAME:	PDP-8/V
// DESCRIPTION:
//   This module implements a basic UART, something along the lines of the
// classic IM6402.  The transmitter and receiver are both double buffered
// and the receiver supports both a framing error and an overflow flag. The
// baud rate is fixed, however there is an internal baud rate generator that
// derives a baud clock by dividing down the system clock.  The character
// format is fixed at 8 data bits and one stop bit.  No parity is supported.
//
// TARGET DEVICES
// TOOL VERSIONS 
// REVISION HISTORY:
//  7-Jul-07  RLA  New file.
//  8-Jul-07  RLA  Make sure that all the F-Fs have initial values assigned.
//                 Cleanup the transmitter and receiver state machines so that
//                   XST can infer a simple upcounter rather than a full adder!
//                 Add a synchronizer for the received data (oops!) ...
//
// TODO:
//--
//000000011111111112222222222333333333344444444445555555555666666666677777777778
//345678901234567890123456789012345678901234567890123456789012345678901234567890
`timescale 1ns / 1ps


module BaudRateGenerator (SystemClock, Reset, BaudClock);
  //++
  //   This module divides down the system clock to generate a baud rate clock
  // for the transmitter and receiver.  The baud clock is 16x the desired bit
  // rate - it's 16x rather than 1x mainly so that the receiver can do some
  // fine adjustment to synchronize itself with the center of each bit.  Note
  // that this output is NOT a symmetrical square wave at some fraction of the
  // system frequency - instead, it has a single positive pulse, exactly one
  // system clock wide, that repeats every DIVISOR system clock cycles. That's
  // because the transmitter and receiver state machines are actually clocked
  // by the system clock, and the baud clock simply serves as an "enable" to
  // update the state.
  //
  //   The CLOCK_DIVISOR parameter can be computed as simply
  //
  //	CLOCK_DIVISOR = SystemClock / (BaudRate * 16)
  //
  // The COUNTER_SIZE is the number of bits in the clock divider counter.
  // Usually nine bits will be enough, but if you have an exceptionally fast
  // system clock or a very slow baud rate, you might need to bump that up ...
  //--
  parameter CLOCK_DIVISOR = 10;
  parameter COUNTER_SIZE  = 9;
  input SystemClock, Reset;  output reg BaudClock = 1'b0;
  reg [COUNTER_SIZE-1:0] Counter = 1'b0;

  always @(posedge SystemClock or posedge Reset)
    if (Reset) begin
      Counter <= 1'b0;  BaudClock <= 1'b0;
    end else if (Counter == CLOCK_DIVISOR-1) begin
      Counter <= 1'b0;  BaudClock <= 1'b1;
    end else begin
      Counter <= Counter + 1;  BaudClock <= 1'b0;
    end
endmodule


module SerialTransmitter (SystemClock, Reset, BaudClock,
	SendData, DataBus, TransmitterBufferEmpty, SerialDataOut);
  //++
  //   The transmitter is a super-simple state machine consisting of a four
  // bit state register, which counts the number of bits transmitted, and a
  // four bit counter which counts sixteen BaudClocks for each bit.  For
  // convenience, these two values are concatenated into a single eight bit
  // counter. All eight state bits are zero as long as the transmitter is idle.
  //
  //   When a byte is loaded into the transmitter shift register the state is
  // set to $10.  As long as the state is non-zero it's incremented every baud
  // clock, and the shift register is shifted every time the lower four bits of
  // the state roll over from $xF to $x0.  When the state finally reaches $AF,
  // indicating that we've sent ten complete bits, it's reset to zero and the
  // transmitter is idle again.  Nifty, no??
  //
  //   This module also implements a simple single byte buffer between the host
  // and the transmitter, and bytes to be transmitted are first loaded into the
  // buffer and then transferred to the shift register. In addition to boosting
  // the thruput this buffer also allows the loading of the shift register to
  // be synchronized with the BaudClock so that the start bit always gets a
  // complete bit time.
  //--
  input SystemClock, Reset, BaudClock, SendData;  input [7:0] DataBus;
  output reg TransmitterBufferEmpty = 1'b1; output SerialDataOut;
  //   The shift register actually holds nine bits - when the buffer is loaded
  // into the shifter an extra zero bit is always added on the right.  Since
  // the SerialOutput is just the LSB of the shift register, adding this extra
  // zero gives us the start bit "for free".  As we shift to the right, one
  // bits are shifted in on the left, so by the time we get to the stop bit
  // state, there'll be a one waiting in the LSB of the shifter.
  reg [8:0] Shifter=9'h1FF;  reg [7:0] State=8'h00;  reg [7:0] Buffer=8'h00;
  wire ShifterLoad,ShifterEmpty; reg ShiftData,LoadState; reg [7:0]NextState;

  //   ShifterEmpty is true whenever the transmitter can accept another byte
  // from the buffer.  Notice that this flag actually goes high during the
  // last BaudClock of the last bit (that's state $AF).  That allows the next
  // byte, if there's one already in the buffer, to start immediately.  We go
  // directly from state $AF to state $10 without wasting a clock.
  assign ShifterEmpty = (State == 8'h00) | (State == 8'hAF);

  //   The shifter can be loaded any time a) the shifter is empty, and b)
  // there's a byte in the buffer.  Notice that loading the shift register
  // has to be synchronized with the BaudClock so that the first bit always
  // gets a complete bit time.
  assign ShifterLoad = (ShifterEmpty & ~TransmitterBufferEmpty & BaudClock);

  // This block generates the shifter and current state registers ...
  always @(posedge SystemClock or posedge Reset)
    if (Reset) begin
      //   Reset always overrides any other inputs.  Remember that RS-232
      // idles in the one state and the serial output is just the LSB of the
      // shift register, so reset should set the shifter to all one bits.
      State <= 8'h00;  Shifter <= 10'b1111111111;
    end else if (BaudClock) begin
      // Everything else is synchronous with the baud rate clock ...
      if (ShifterLoad)
	Shifter <= {/*1'b1,*/ Buffer, 1'b0};
      else if (ShiftData)
	Shifter <= {1, Shifter[8:1]};
      State <= LoadState ? NextState : State+1;
    end

  // This generates the next state logic for the transmitter ...
  always @(State or ShifterLoad) begin
    LoadState = 1'b0;  ShiftData = 1'b0;  NextState = State;
    if (ShifterLoad) begin
      // A new byte was just loaded - start sending ...
      LoadState = 1'b1;  NextState = 8'h10;
    end else if (State == 8'hAF) begin
      // We just finished sending the stop bit - back to idle ...
      LoadState = 1'b1;  NextState = 8'h00;
    end else if (State != 8'h00) begin
      // Otherwise shift out a new bit every sixteen baud clocks ...
      if (State[3:0] == 4'hF) ShiftData = 1'b1;
    end
  end

  // And this block generates the logic for the buffer register ...
  always @(posedge SystemClock or posedge Reset)
    if (Reset) begin
      // Reset clears the buffer to the empty state ...
      Buffer <= 8'b0;  TransmitterBufferEmpty <= 1'b1;
    end else begin
      //   Note that there's a small (very small!) but non-zero possibility
      // we'll both transfer a byte to the transmitter AND load a byte from
      // the host in the same clock cycle.  There's not actually a problem
      // with that, but if it does happen then it's important that BufferEmpty
      // end up false. That makes the order of the following two conditions
      // important!
      if (ShifterLoad) TransmitterBufferEmpty <= 1'b1;
      if (SendData) begin
        Buffer <= DataBus;  TransmitterBufferEmpty <= 1'b0;
      end
    end

  // And the serial data is just the LSB of the shift register...
  assign SerialDataOut = Shifter[0];
endmodule


module SerialReceiver (SystemClock, Reset, BaudClock, SerialDataIn,
	DataBus, BufferFull, ReadBuffer, FramingError, OverflowError, ResetErrors);
  //++
  //   The receiver is a simple state machine much like the transmitter - the
  // the lower four bits of the current state count the sixteen baud clocks per
  // bit time, and the upper four bits count the ten bits in a character.  The
  // receiver state machine is a little more complicated, however, because
  // in this case it's the other end that's driving the timing.
  //
  //   Like the transmitter, the receiver implements a single byte buffer. This
  // allows the receiver shift register to be busy receiving a byte while the
  // previous one sits in the buffer waiting for the host to read it.  That
  // gives the full host up to a full character time (as opposed to only a bit
  // time if we didn't have the buffer) to read the data.
  //
  //   The receiver also has two error flags in addition to the BufferFull
  // flag.  The FramingError flag indicates that an invalid stop bit (i.e.
  // not a one!) was found, and the Overflow flag indicates that the host
  // didn't read the previous byte before the next one over wrote it. Both
  // these flags set and stay set independently of reading the buffer, and
  // they're only cleared by asserting the ResetErrors input.
 //--
  input SystemClock, Reset, BaudClock, SerialDataIn, ReadBuffer, ResetErrors;
  output reg BufferFull=1'b0, FramingError=1'b0, OverflowError=1'b0;
  output [7:0] DataBus;  reg [7:0] State=8'h00, Shifter=8'h00, Buffer=8'h00;
  reg LoadState, ShiftData;  reg [7:0] NextState;

  //   The state machine is actually written out as several register parts and
  // a separate combinatorial part.  This actually makes the code more complex,
  // but it does allow XST to infer a simple counter with parallel load for
  // the state register rather than a complete 8 bit adder!  The State register
  // always increments every baud clock UNLESS LoadState is TRUE, in which case
  // it parallel loads from NextState ...
  always @(posedge SystemClock or posedge Reset)
    if (Reset)
      State <= 8'h0;
    else if (BaudClock)
      State <= LoadState ? NextState : State+1;

  //   The shift register shifts in a new data bit every time the combinatorial
  // logic sets the ShiftData flag, and the buffer register is loaded from the
  // shift register at state $97 (the middle of the stop bit) ...
  always @(posedge SystemClock or posedge Reset)
    if (Reset) begin
      Shifter <= 8'h0;  Buffer <= 8'h0;
    end else if (BaudClock) begin
      if (ShiftData)  Shifter <= {SerialDataIn, Shifter[7:1]};
      if (State == 8'h97) Buffer <= Shifter;
    end

  //   Finally, this block implements three status flags - BufferFull,
  // FramingError and OverflowError.  All three are set appropriately during
  // the midpoint of the stop bit.  BufferFull is reset whenever the buffer
  // is read, and the two error flags can only be reset by the explicit
  // ClearErrorFlags input.
  always @(posedge SystemClock or posedge Reset)
    if (Reset) begin
      // Reset always clears all the internal flags, regardless ...
      BufferFull <= 1'b0;  FramingError <= 1'b0;  OverflowError <= 1'b0;
    end else begin
      // Clearing is synchronous with SystemClock, not BaudClock!
      if (ReadBuffer) BufferFull <= 1'b0;
      if (ResetErrors) begin FramingError <= 1'b0; OverflowError <= 1'b0; end
      if (BaudClock)
	// But updates to the flags are synchronous with BaudClock!
	if (State == 8'h97) begin
	  if (BufferFull) OverflowError <= 1'b1;
	  BufferFull <= 1'b1;
	  if (~SerialDataIn) FramingError <= 1'b1;
	end
    end

  //   This is the combinatorial logic part of the state machine.  It mostly
  // just figures out what the next state should be, which is pretty easy
  // since mostly we just want to increment State, and that will happen
  // automatically!
  always @(State or SerialDataIn) begin
    LoadState = 1'b0;  ShiftData = 1'b0;  NextState = State;
    if /*State<8'h08*/ (State[7:3] == 5'b0) begin
      //  We're idle now, and we stay in state zero until we see a zero
      // on the serial data.  For the first eight baud clocks after the
      // start we keep sampling the serial data and, if we see any ones,
      // we assume this was noise rather than a real start bit and go back
      // to state zero.
      if (SerialDataIn)  begin LoadState = 1'b1; NextState = 8'h00; end
    end else if /*State<8'h90*/ ((State[7]==1'b0) | (State[7:4]==4'h8)) begin
      //   For the next eight bits, we sample the serial data when the
      // low four bits of State are 7, approximating the middle of the
      // bit time.
	if (State[3:0] == 4'h7) ShiftData = 1'b1;
    end else if /*State<8'h9F*/ ((State[7:4]==4'h9) & (State[3:0]!=4'hF)) begin
      //   States 90 thru 9F are the stop bit, and in the middle of the
      // stop bit we transfer the shift register to the buffer and set
      // the BufferFull flag.  We also sample the stop bit and, if it's
      // not a one, set the framing error flag.  All of that happens up there,
      // though, in the register logic...
    end else begin
      // Anything else and we're back to idling ...
      LoadState = 1'b1;  NextState = 8'h00;
    end
  end

  //  Drive the data bus with the buffer data whenever ReadBuffer is asserted.
  // The previous always block already handled clearing the BufferFull flag.
  assign DataBus = ReadBuffer ? Buffer : 8'hz;
endmodule


module UART (SystemClock, Reset, DataBus,
	SendData, TransmitterBufferEmpty, SerialDataOut,
	ReceiverBufferFull, ReadData, SerialDataIn,
	FramingError, OverflowError, ClearErrors);
  //++
  // This pulls the other three modules together to generate a complete UART...
  //--
  parameter BaudRate=5;	// system clock divisor to generate Baud clock
  input  SystemClock;	// system clock (_NOT_ the baud rate clock)
  input  Reset;		// master reset
  inout  [7:0] DataBus;	// bidirectional data bus for transmit and receive
  // Transmitter signals ...
  input  SendData;		// load DataBus into the transmitter buffer
  output TransmitterBufferEmpty;// transmitter ready to accept another byte
  output SerialDataOut;		// transmitted data (Serial Output)
  // Receiver signals ...
  output ReceiverBufferFull;	// receiver has a byte ready for reading
  input  ReadData;		// drive receiver buffer onto DataBus
  input  SerialDataIn;		// received data (serial input)
  // Error flags ...
  output FramingError;		// invalid stop bit detected
  output OverflowError;		// receiver data overrun
  input  ClearErrors;		// clear the error flags

  //   Since the received data is asynchronous (well, duh!) it should be
  // synchronized with our clock domain to avoid any metastable conditions.
  // It's enough to synchronize with the system clock - its not necessary
  // to synchronize with the baud clock.  Better yer since the system clock
  // is typically several hundred times the baud clock, the delay this adds
  // is inconsequential ...
  reg SynchronizedData1=1'b1, SynchronizedData2=1'b1;
  always @(posedge SystemClock) begin
    SynchronizedData2 <= SynchronizedData1;
    SynchronizedData1 <= SerialDataIn;
  end

  // Generate the baud rate clock ...
  wire BaudClock;  // 16x Baud Rate clock
  BaudRateGenerator #(BaudRate) BRG (SystemClock, Reset, BaudClock);

  // The transmitter ...
  SerialTransmitter TSR (SystemClock, Reset, BaudClock,
	SendData, DataBus, TransmitterBufferEmpty, SerialDataOut);

  // And the receiver ...
  SerialReceiver RSR (SystemClock, Reset, BaudClock, SynchronizedData2, DataBus,
	ReceiverBufferFull, ReadData, FramingError, OverflowError, ClearErrors);
endmodule
