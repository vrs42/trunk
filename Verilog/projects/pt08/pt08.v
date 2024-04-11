`define xMMU
`ifndef MMU
`define SERIAL
`endif
`ifndef SERIAL
`define MMU
`endif

/* veri//lator lint_off COMBDLY */

//
// The pin-out is fixed in the project file, and must match the board
// as constructed.  Here we specify nice names for all the signals which
// match the names in the project's placement map.
//
module pt08(
  // Serial I/O
  clk, dsrttl, rxdttl, txdttl, rx_rate,
  // Posibus BMB paddle
  bmb0, bmb1, bmb2, bmb3, bmb4, bmb5, bmb6, bmb7, bmb8, bmb9, bmb10, bmb11,
  bmb3_l, bmb4_l, bmb5_l, bmb6_l, bmb7_l, bmb8_l,
  // Posibus BAC paddle
  bac0, bac1, bac2, bac3, bac4, bac5, bac6, bac7, bac8, bac9, bac10, bac11,
  biop1, biop2, biop4, bts1, bts3, initialize,
  // Posibus IOB paddle
  iob0_l, iob1_l, iob2_l, iob3_l, iob4_l, iob5_l,
  iob6_l, iob7_l, iob8_l, iob9_l, iob10_l, iob11_l,
  skip_l, irq_l, acclr_l, run
);
input clk;
output dsrttl, txdttl;
output rxdttl, rx_rate;
input bmb0, bmb1, bmb2, bmb3, bmb4, bmb5, bmb6, bmb7, bmb8, bmb9, bmb10, bmb11;
input bmb3_l, bmb4_l, bmb5_l, bmb6_l, bmb7_l, bmb8_l;
input bac0, bac1, bac2, bac3, bac4, bac5, bac6, bac7, bac8, bac9, bac10, bac11;
input biop1, biop2, biop4, bts1, bts3, initialize;
output iob0_l, iob1_l, iob2_l, iob3_l, iob4_l, iob5_l;
output iob6_l, iob7_l, iob8_l, iob9_l, iob10_l, iob11_l;
output skip_l, irq_l, acclr_l;
input run;

`ifdef VERILATOR
//
// Signal array added here to make the trace output easier to read.
//
int mb;
assign mb[11:0] = { bmb0, bmb1, bmb2, bmb3, bmb4, bmb5, bmb6, bmb7, bmb8, bmb9, bmb10, bmb11 };
int ac;
assign ac[11:0] = { bac0, bac1, bac2, bac3, bac4, bac5, bac6, bac7, bac8, bac9, bac10, bac11 };
int ib;
assign ib[11:0] = { ~iob0_l, ~iob1_l, ~iob2_l, ~iob3_l, ~iob4_l, ~iob5_l, ~iob6_l, ~iob7_l, ~iob8_l, ~iob9_l, ~iob10_l, ~iob11_l };
`endif


//
// Now, basically just instantiate the various modules.
//
wire rx_sel, tx_sel;
wire init_l;

// Instantiate Receiver
/* verilator lint_off PINMISSING */
e2 e2(
// BUGBUG: iob_ should use OC drivers!!
  .iob0_l(iob0_l),
  .iob1_l(iob1_l),
  .iob2_l(iob2_l),
  .iob3_l(iob3_l),
  .iob4_l(iob4_l),
  .iob5_l(iob5_l),
  .iob6_l(iob6_l),
  .iob7_l(iob7_l),
  .iob8_l(iob8_l),
  .iob9_l(iob9_l),
  .iob10_l(iob10_l),
  .iob11_l(iob11_l),
  .biop1(biop1),
  .biop2(biop2),
  .biop4(biop4),
  .init_l(init_l),
  .acclr_l(acclr_l),
  .skip_l(skip_l),
  .irq_l(irq_l),
  .rx_rate(rx_rate),
  .dsrttl(dsrttl),
  .rx_data(rxdttl),
  .rx_sel(rx_sel),
  .txdttl(txdttl),	// Unused
  .tx_sel(tx_sel)	// Unused
);
// EIA and 20ma current loop conversion omitted

// Instantiate Transmitter
wire stop1, stop2, stp_mark, tx_ratei, tx_rateo;
/* verilator lint_off PINMISSING */
e11 e11(
  .bac0(bac0),
  .bac1(bac1),
  .bac2(bac2),
  .bac3(bac3),
  .bac4(bac4),
  .bac5(bac5),
  .bac6(bac6),
  .bac7(bac7),
  .bac8(bac8),
  .bac9(bac9),
  .bac10(bac10),
  .bac11(bac11),
  .biop1(biop1),
  .biop2(biop2),
  .biop4(biop4),
  .initialize(initialize),
  .init_l(init_l),
  .skip_l(skip_l),
  .irq_l(irq_l),
  .rx_rate(rx_rate),
//.rx_data(rxdttl),	// Unused
  .rx_sel(rx_sel),	// Unused
  .txdttl(txdttl),
  .tx_sel(tx_sel),
  .stop1(stop1),
  .stop2(stop2),
  .stp_mark(stp_mark),
  .tx_ratei(tx_ratei),
  .tx_rateo(tx_rateo)
);
assign tx_ratei = tx_rateo;	// Config jumper
assign stp_mark = stop2;	// Config jumper

//
// BMB Board Discrete logic
//

// Baud Rate Generator
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

// TODO
// Settings:
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
reg n_t_1x;
wire n_t_2x;
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

// Finally, choose the baud rate.
assign rx_rate = bd115200;

//
// Hook up address decoders.  The first digit of the I/O address
// is always the same for the input and output devices.
// Configurations:
// IA	OA
// --	--
// 03	04
// 40	41
// 42	43
// 44	45
// 46	47
// 34	35
// 11	12
wire mb3_rx, mb4_rx, mb5_rx, mb6_rx, mb7_rx, mb8_rx;
wire mb3_tx, mb4_tx, mb5_tx, mb6_tx, mb7_tx, mb8_tx;
assign mb3_rx = ~bmb3;
assign mb4_rx = ~bmb4;
assign mb5_rx = ~bmb5;
assign mb6_rx = ~bmb6;
assign mb7_rx =  bmb7;
assign mb8_rx =  bmb8;
assign mb3_tx = ~bmb3;
assign mb4_tx = ~bmb4;
assign mb5_tx = ~bmb5;
assign mb6_tx =  bmb6;
assign mb7_tx = ~bmb7;
assign mb8_tx = ~bmb8;
assign rx_sel = (mb3_rx & mb4_rx & mb5_rx & mb6_rx & mb7_rx & mb8_rx);
assign tx_sel = (mb3_tx & mb4_tx & mb5_tx & mb6_tx & mb7_tx & mb8_tx);


`ifdef VERILATOR
// Copy output serial data to simulate a loop-back connector.
assign rxdttl = txdttl;

// Attempt to get weak pull-ups working.
pup pup(
   .iob0_l(iob0_l),
   .iob1_l(iob1_l),
   .iob2_l(iob2_l),
   .iob3_l(iob3_l),
   .iob4_l(iob4_l),
   .iob5_l(iob5_l),
   .iob6_l(iob6_l),
   .iob7_l(iob7_l),
   .iob8_l(iob8_l),
   .iob9_l(iob9_l),
   .iob10_l(iob10_l),
   .iob11_l(iob11_l),
   .acclr_l(acclr_l),
   .irq_l(irq_l),
   .skip_l(skip_l)
);
`endif

endmodule
