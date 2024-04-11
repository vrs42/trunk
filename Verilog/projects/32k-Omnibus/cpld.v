`define xMMU
`ifndef MMU
`define SERIAL
`endif
`ifndef SERIAL
`define MMU
`endif

/* verilator lint_off COMBDLY */

//
// The pin-out is fixed in the project file, and must match the board
// as constructed.  Here we specify nice names for all the signals which
// match the names in the project's placement map.
//
module cpld (
`ifdef VERILATOR
  drive_ac,
  ac,
`endif
  cf0,			// 1
  pulse_la,		// 2
  data08_l,		// 4
  f_set_l,		// 5
  md11_l,		// 6
  user_mode_l,		// 8
  md10_l,		// 9
  md09_l,		// 10
  d_l,			// 11
  md08_l,		// 12
  f_l,			// 15
  ir01_l,		// 16
  ir00_l,		// 17
  ind2_l,		// 18
  ind1_l,		// 20
  cpma_disable_l,	// 21
  skip_l,		// 22
  initialize,		// 24
  int_rqst_l,		// 25
  ts3_l,		// 27
  internal_io_l,	// 28
  ts1_l,		// 29
  tp4,			// 30
  tp3,			// 31
  c1_l,			// 33
  tp2,			// 34
  c0_l,			// 35
  io_pause_l,		// 36
  df_enable,		// 37
  power_ok,		// 39
  data07_l,		// 40
  run_l,		// 41
  data06_l,		// 44
  data05_l,		// 45
  data04_l,		// 46
  int_in_prog_l,	// 48
  md07_l,		// 49
  md06_l,		// 50
  md05_l,		// 51
  md04_l,		// 52
  load_cont_l,		// 54
  tp_bb1,		// 55
  tp_ba1,		// 56
  data03_l,		// 57
  data02_l,		// 58
  data01_l,		// 60
  data00_l,		// 61
  md03_l,		// 63
  md02_l,		// 64
  md01_l,		// 65
  md00_l,		// 67
  ema2_l,		// 68
  ema1_l,		// 69
  ema0_l,		// 70
  tp_ab1,		// 73
  tp_aa1,		// 74
  rxdttl,		// 75
  txdttl,		// 76
  data11_l,		// 77
  key_ctl_l,		// 79
  data10_l,		// 80
  data09_l,		// 81
  clk,			// 83
  cf1			// 84
);

input cf0;
input pulse_la;
inout data08_l;
input f_set_l;
`ifdef SERIAL
input user_mode_l;
`else
output user_mode_l;
`endif
input md11_l;
input md10_l;
input md09_l;
input d_l;
input md08_l;
input f_l;
input ir01_l;
input ir00_l;
input ind2_l;
input ind1_l;
input cpma_disable_l;
output skip_l;
input initialize;
output int_rqst_l;
input ts3_l;
output internal_io_l;
input ts1_l;
input tp4;
input tp3;
output c1_l;
input tp2;
output c0_l;
input io_pause_l;
`ifdef SERIAL
input df_enable;
`else
inout df_enable;
`endif
input power_ok;
inout data07_l;
input run_l;
inout data06_l;
inout data05_l;
inout data04_l;
`ifdef SERIAL
input int_in_prog_l;
`else
output int_in_prog_l;
`endif
input md07_l;
input md06_l;
input md05_l;
input md04_l;
input load_cont_l;
`ifdef SERIAL
input tp_bb1;
input tp_ba1;
`else
output tp_bb1;
output tp_ba1;
`endif
inout data03_l;
inout data02_l;
inout data01_l;
inout data00_l;
input md03_l;
input md02_l;
input md01_l;
input md00_l;
`ifdef SERIAL
input ema2_l;
input ema1_l;
input ema0_l;
input tp_ab1;
input tp_aa1;
`else
output ema2_l;
output ema1_l;
output ema0_l;
output tp_ab1;
output tp_aa1;
`endif
output rxdttl;
output txdttl;
inout data11_l;
input key_ctl_l;
inout data10_l;
inout data09_l;
input clk;
input cf1;

`ifdef VERILATOR
//
// Signal array added here to make the trace output easier to read.
//
int md;
assign md[11:0] = {~md00_l, ~md01_l, ~md02_l, ~md03_l, ~md04_l, ~md05_l, ~md06_l, ~md07_l, ~md08_l, ~md09_l, ~md10_l, ~md11_l};
`endif

//
// Now, basically just instantiate the various modules.
//
// The modules are "dumbed down" to minimize warnings, and configured
// to match the limitations of the board, mostly imposed by the limited
// pin count.
//
// Ifdefs will get added later to configure for the various supported
// functions.
//

//
// Serial Device Instantiation
//
`ifdef SERIAL
wire bd230400;
assign bd230400 = clk;

reg bd115200;
reg bd38400;
reg bd19200;
reg bd9600;
reg bd4800;
reg bd2400;
reg bd1200;
reg bd600;
reg bd300;
wire bd109;
reg n_t_1x;
wire n_t_2x;
wire sw1, sw2, sw3, sw4, sw5, sw6;
assign sw1 = cf0;
assign sw2 = cf1;
assign sw3 = tp_aa1;
assign sw4 = tp_ab1;
assign sw5 = tp_ba1;
assign sw6 = tp_bb1;

wire md03_set, md04_set, md05_set, md07_set;
wire md03_ok, md04_ok, md05_ok;
wire md06_in, md07_in, md08_in;
wire md06_out, md07_out, md08_out;
wire rx_sel_l;
wire tx_sel_l;
wire j23;
wire rx_rate, h12;
wire ratex2;

// The DEC M8650 board model is instantiated here.
// The M8650 serial interface is modified during instantiation by replacing
// tha address decoder, the baud rate generator, and the level converters.
// The board has no support for current loop, so we also set up here for 1
// stop bit.  Settings:
// sw[1:3]	Baud		sw[4:6]		Address
// 000		110		000		Disabled
// 001		300		001		03/04
// 010		600		010		40/41
// 011		1200		011		42/43
// 100		9600		100		44/45
// 101		38400		101		46/47
// 110		115200		110		34/35
// 111		230400		111		11/12
// The six switches for settings are wired to
// [cf0,cf1,tp_aa1,tp_ab1,tp_ba1,tp_bb1].  (This precludes the use of
// the test points when serial I/O is chosen.)
//
/* verilator lint_off PINMISSING */
m8650d m8650d (
  .n3v3(1'b1),
//.n_t_128x(n_t_128x),	// RX20MA clamped to TTL(ish) (input)
  .n_t_152x(1'b1),	// 19.661 MHz Baud rate divider input (614.4 Kbaud)
  .n_t_50x(rx_sel_l),	// RX polarity for MD03
  .n_t_3x(rx_sel_l),	// RX polarity for MD04
  .n_t_165x(rx_sel_l),	// RX polarity for MD05
  .n_t_86x(rx_sel_l),	// RX polarity for MD06
  .n_t_90x(rx_sel_l),	// RX polarity for MD07
  .n_t_96x(rx_sel_l),	// RX polarity for MD08
  .n_t_32x(tx_sel_l),	// TX polarity for MD03
  .n_t_74x(tx_sel_l),	// TX polarity for MD04
  .n_t_1x(tx_sel_l),	// TX polarity for MD05
  .n_t_84x(tx_sel_l),	// TX polarity for MD06
  .n_t_58x(tx_sel_l),	// TX polarity for MD07
  .n_t_95x(tx_sel_l),	// TX polarity for MD08
  .stp_mark(j23),	// Stop bit jumpering
//.n_t_119x(j23),	// Use Two Stop Bits
  .n_t_146x(j23),	// Use One Stop Bit
  .rx_rate(rx_rate),	// RX rate * 1
  .testp4(ratex2),	// Baud Rate Clock Input
  .n_t_162x(h12),	// TX Rate = RX Rate output
  .tx_rate(h12),	// TX Rate = RX Rate
//.tx_rate(rx_rate),	// TX Rate = RX Rate * 8
//.bd2400(ratex2),	// Internally Generated Baud Rates
//.bd1200(ratex2),
//.bd600(ratex2),
//.bd300(ratex2),
//.bd150(ratex2),
  .c0_l(c0_l),
  .c1_l(c1_l),
  .data04_l(data04_l),
  .data05_l(data05_l),
  .data06_l(data06_l),
  .data07_l(data07_l),
  .data08_l(data08_l),
  .data09_l(data09_l),
  .data10_l(data10_l),
  .data11_l(data11_l),
  .initialize(initialize),
//.int_enab(cb1),	// Test point, not implemented
  .int_rqst_l(int_rqst_l),
  .internal_io_l(internal_io_l),
  .io_pause_l(io_pause_l),
  .line(txdttl),	// TTL Serial Output 
// These generated duplicate pin errors in Verilator
//.md03(md03_l),
//.md04(md04_l),
//.md05(md05_l),
//.md06(md06_l),
//.md07(md07_l),
  .md08(md08_l),
  .md09(md09_l),
  .md10(md10_l),
  .md11(md11_l),
//.n_t_83x(~rx_data),	// RX_DATA, inverted (input)
  .power_ok(power_ok),
//.r_run_l(r_run_l),	// Reader Run, not implemented
//.reader_run(db1),	// Test point, not implemented
//.rx20ma_data(rx20ma_data), // CL input data (TTL, output to H)
//.rx_active(ab1),	// Test point, not implemented
//.rx_data(rx_data),	// EIA input data (TTL, output to M)
  .serial_in(rxdttl),	// UART input (TTL, input pin E)
  .skip_l(skip_l),
  .tp3(tp3),
//.tx_active(ba1),	// Test point (not implemented)
//.tx_div_l(tx_div_l),	// Delay Line input
  .n_t_103x(1'b1),	// E25 pin 5, delay line output
//.n_t_103x(~tx_active_l), // E25 pin 5, delay line output
);
//
// The new baud rate generator.
// Our two highest speeds are 6X and 3X the next lower group.  We implent
// divide-by-two, then divide-by-3.
always @(posedge bd230400)
  begin
    bd115200 <= ~bd115200;
  end
// Divide-by-3.  We use n_t_2x to reset when the count reaches
// three.  This also means the duty cycle for 28,400 baud isn't
// 50%, which is hopefully not a problem.
always @(negedge bd115200, negedge n_t_2x)
  if (~n_t_2x) begin
    n_t_1x <= 1'b0;
  end else begin
    n_t_1x <= ~n_t_1x;
  end
always @(negedge n_t_1x, negedge n_t_2x)
  if (~n_t_2x) begin
    bd38400 <= 1'b0;
  end else begin
    bd38400 <= ~bd38400;
  end
assign n_t_2x = ~(n_t_1x & bd38400);
// 300, 600, 1200, 2400, 4800, 9600, 19200, 38400
// are all divide-by-2.
always @(posedge bd38400)
  begin
    bd19200 <= ~bd19200;
  end
always @(posedge bd19200)
  begin
    bd9600 <= ~bd9600;
  end
always @(posedge bd9600)
  begin
    bd4800 <= ~bd4800;
  end
always @(posedge bd4800)
  begin
    bd2400 <= ~bd2400;
  end
always @(posedge bd2400)
  begin
    bd1200 <= ~bd1200;
  end
always @(posedge bd1200)
  begin
    bd600 <= ~bd600;
  end
always @(posedge bd600)
  begin
    bd300 <= ~bd300;
  end
// OK.  Now, we go back to 1200 baud.  Dividing that
// by 11 will give 109 baud.  Again without a 50% duty cycle.
reg   div11a,  div11b,  div11c,  div11d;
wire ndiv11a, ndiv11b, ndiv11c, ndiv11d;
assign ndiv11d = ~(div11d | div11a&div11c);
assign ndiv11c = ~(div11d? div11c: ~div11c | div11a&div11c);
assign ndiv11b = ~(div11c&div11d? div11b: ~div11b | div11a&div11c);
assign ndiv11a = ~(div11b&div11c&div11d? div11a: ~div11a | div11a&div11c);
always @(negedge bd1200)
  begin
    div11a = ndiv11a;
    div11b = ndiv11b;
    div11c = ndiv11c;
    div11d = ndiv11d;
  end
assign bd109 = div11a;

// Finally, assign the rate based on the config switches.
assign ratex2 = (~sw1 & ~sw2 & ~sw3) & bd109
              | (~sw1 & ~sw2 &  sw3) & bd300
              | (~sw1 &  sw2 & ~sw3) & bd600
              | (~sw1 &  sw2 &  sw3) & bd1200
              | ( sw1 & ~sw2 & ~sw3) & bd9600
              | ( sw1 & ~sw2 &  sw3) & bd38400
              | ( sw1 &  sw2 & ~sw3) & bd115200
              | ( sw1 &  sw2 &  sw3) & bd230400;
//
// Hook up address decoders.  The first digit of the I/O address
// is always the same for the input and output devices.
assign md03_set = (~sw4 &  sw5)
                | ( sw4 & ~sw5);
assign md04_set = ( sw4 &  sw5 & ~sw6);
assign md05_set = ( sw4 &  sw5);
assign md03_ok  = ( md03_set & ~md03_l)
                | (~md03_set &  md03_l);
assign md04_ok  = ( md04_set & ~md04_l)
                | (~md04_set &  md04_l);
assign md05_ok  = ( md05_set & ~md05_l)
                | (~md05_set &  md05_l);
// 456	IA	in	OA	out
// 000	--	000	--	000
// 001	03	-78	04	6--
// 010	40	---	41	--8
// 011	42	-7-	43	-78
// 100	44	6--	45	6-8
// 101	46	67-	47	678
// 110	34	6--	35	6-8
// 111	11	--8	12	-7-
assign md06_in  = ( sw4 & ~sw5)
                | ( sw4 &  sw5 & ~sw6);
assign md06_out = md06_in
                | (~sw4 & ~sw5 &  sw6);
assign md07_set = (~sw4 &  sw5 &  sw6)
                | ( sw4 & ~sw5 &  sw6);
assign md07_in  = md07_set
                | (~sw4 & ~sw5 &  sw6);
assign md07_out = md07_set
                | ( sw4 &  sw5 &  sw6);
assign md08_in  = (~sw4 & ~sw5 &  sw6)
                | ( sw4 &  sw5 &  sw6);
assign md08_out = ~md08_in;
assign rx_sel_l = ~(md03_ok & md04_ok & md05_ok
                  & ((md06_in & ~md06_l) | (~md06_in & md06_l))
                  & ((md07_in & ~md07_l) | (~md07_in & md07_l))
                  & ((md08_in & ~md08_l) | (~md08_in & md08_l)));
assign tx_sel_l = ~(md03_ok & md04_ok & md05_ok
                  & ((md06_out & ~md06_l) | (~md06_out & md06_l))
                  & ((md07_out & ~md07_l) | (~md07_out & md07_l))
                  & ((md08_out & ~md08_l) | (~md08_out & md08_l)));
`endif

`ifdef VERILATOR
// Copy output serial data to simulate a loop-back connector.
assign rxdttl = txdttl;

// Copy AC data onto the bus here, so Verilator can see it happen.
input drive_ac;
input ac[0:11];
assign data04_l = drive_ac? ~ac[4] : 1'bz;
assign data05_l = drive_ac? ~ac[5] : 1'bz;
assign data06_l = drive_ac? ~ac[6] : 1'bz;
assign data07_l = drive_ac? ~ac[7] : 1'bz;
assign data08_l = drive_ac? ~ac[8] : 1'bz;
assign data09_l = drive_ac? ~ac[9] : 1'bz;
assign data10_l = drive_ac? ~ac[10] : 1'bz;
assign data11_l = drive_ac? ~ac[11] : 1'bz;

// Attempt to get weak pull-ups working.
pup pup(
   .c0_low(c0_l),
   .c1_low(c1_l),
   .data00_low(data00_l),
   .data01_low(data01_l),
   .data02_low(data02_l),
   .data03_low(data03_l),
   .data04_low(data04_l),
   .data05_low(data05_l),
   .data06_low(data06_l),
   .data07_low(data07_l),
   .data08_low(data08_l),
   .data09_low(data09_l),
   .data10_low(data10_l),
   .data11_low(data11_l),
   .internal_io_low(internal_io_l),
   .interrupt_low(int_rqst_l),
   .skip_low(skip_l)
);
`endif

`ifdef MMU
/* verilator lint_off PINMISSING */
m837cc m837cc (
  .n_t_145x(1'b1),
  .n_t_42x(1'b1),
  .ts_disable_l(cf0),
  .c1l(c1_l),
  .cpma_disable_l(cpma_disable_l),
  .d_l(d_l),
  .data03_l(data03_l),
  .data05_l(data05_l),
  .data06_l(data06_l),
  .data07_l(data07_l),
  .data08_l(data08_l),
  .data09_l(data09_l),
  .data10_l(data10_l),
  .data11_l(data11_l),
  .df_enable(df_enable),
  .ema0_l(ema0_l),
  .ema1_l(ema1_l),
  .ema2_l(ema2_l),
  .f_l(f_l),
  .f_set_l(f_set_l),
  .ind1_l(ind1_l),
  .ind2_l(ind2_l),
  .initialize(initialize),
  .int_in_progress_l(int_in_prog_l),
  .int_rqst_l(int_rqst_l),
  .internal_io_l(internal_io_l),
//.iot010xxx1xx_l(iot010xxx1xx_l),
  .io_pause_l(io_pause_l),
  .ir00_l(ir00_l),
  .ir01_l(ir01_l),
  .key_ctl_l(key_ctl_l),
  .load_addr(pulse_la),
  .load_cntl(load_cont_l),
  .md00_l(md00_l),
  .md01_l(md01_l),
  .md02_l(md02_l),
  .md03_l(md03_l),
  .md04_l(md04_l),
  .md05_l(md05_l),
  .md06_l(md06_l),
  .md07_l(md07_l),
  .md08_l(md08_l),
  .md09_l(md09_l),
  .md10_l(md10_l),
  .md11_l(md11_l),
  .power_ok(power_ok),
  .run_l(run_l),
  .skip_l(skip_l),
  .tp2(tp2),
  .tp3(tp3),
  .tp4(tp4),
  .tp_aa1(tp_aa1),
  .tp_ab1(tp_ab1),
  .tp_ba1(tp_ba1),
  .tp_bb1(tp_bb1),
  .ts1_l(ts1_l),
  .user_mode_l(user_mode_l)
);
assign c0_l = 1'bz;
assign txdttl = 1'bz;
`endif

endmodule
