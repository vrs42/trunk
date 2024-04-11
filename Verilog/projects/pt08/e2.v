// ex: sw=4 ts=4
// Eagle Pinout:
//E2       1        in       !INIT
//         2        in       RX_RATE
//         4        io                *** unconnected ***
//         5        io       !IOB8
//         6        io       BIOP4
//         8        io       !IOB7
//         9        io       BIOP2
//         11       io       !IOB5
//         12       io       !IOB6
//         14       io       BIOP1
//         16       io       !IOB4
//         17       io       !IOB3
//         18       io       !IOB11
//         19       io       !IOB2
//         20       io       !IOB1
//         21       io       !IOB10
//         24       io       !IOB0
//         25       io       !IOB9
//         26       io       RX_SEL
//         27       io       RX_DATA
//         28       io       !SKIP
//         29       io       !IRQ
//         31       io       TX_SEL
//         33       io       !INIT
//         34       io       !ACCLR
//         36       io       TXDTTL
//         37       io                *** unconnected ***
//         39       io                *** unconnected ***
//         40       io       DSRTTL
//         41       io                *** unconnected ***
//         43       in       RX_RATE

/* M706 Receiver */
module e2(init_l, rx_rate, biop1, biop2, biop4, iob0_l, iob1_l, iob2_l, iob3_l, iob4_l, iob5_l, iob6_l, iob7_l, iob8_l, iob9_l, iob10_l, iob11_l, rx_sel, rx_data, skip_l, irq_l, tx_sel, acclr_l, txdttl, dsrttl);
input init_l, rx_rate, biop1, biop2, biop4;
output iob0_l, iob1_l, iob2_l, iob3_l, iob4_l, iob5_l;
output iob6_l, iob7_l, iob8_l, iob9_l, iob10_l, iob11_l;
input rx_sel, rx_data, tx_sel;
output skip_l, irq_l, acclr_l;
output txdttl, dsrttl;

wire tt_[0:7];
wire rx_sel, kcc_, irql, tti02, serial;
wire buffer_strobe, reader_run_l, tti_skip_;
wire cscale_in, instop0_, instop1_;

// Here we invoke a debugged M706 model, connecting the relevant signals.
m706 m706(
   .ad2(rx_sel),		// input  mb03_
   .ae1(rx_sel),		// input  mb04_
   .ae2(kcc_),			// output kcc_ (output)
   .af1(rx_sel),		// input  mb05_
   .af2(irql),			// output keyboard_flag_l
   .ah1(rx_sel),		// input  mb06_
   .ah2(rx_sel),		// input  mb07_
   .aj1(rx_sel),		// input  mb08_
   .aj2(tti02), 		// input  tti3_set
   .ak1(tti02), 		// output tti02[2]
   .ak2(tt_[0]),		// output tt_[0]
   .al1(tt_[3]),		// output tt_[3]
   .al2(biop4),			// input  iop4
   .am1(tt_[4]),		// output tt_[4]
   .am2(serial),		// output ~rx_data
   .an1(rx_rate),		// input  tti_clk_in
   .an2(tt_[7]),		// output tt_[7]
   .ap2(tt_[5]),		// output tt_[5]
   .ar1(serial),		// input  tti0_set
   .ar2(tt_[1]),		// output tt_[1]
   .as2(tt_[2]),		// output tt_[2]
   .at2(tt_[6]),		// output tt_[6]
   .au2(reader_run_l),	// output ~reader_run
   .av1(buffer_strobe), // output buffer_strobe
   .av2(irql),			// input  reader_run_clr_
   .bd1(1'b0),			// input  clr_flag2
   .bd2(biop1), 		// input  iop1
   .be2(acclr_l),		// output tt_ac_clr_
   .bf2(~init_l),		// input  initialize
   .bh2(tti_skip_),		// output tti_skip_
   .bj2(biop2), 		// input  iop2
   .bm2(rx_data),		// input  rx_data
   .bn2(),				// output ~in_active
// .bp2(cscale_in),		// input  (Missing from model!)
   .br1(1'b1),			// input  enable
   .br2(instop1_),		// input  in_stop
   .bs1(),				// output ~clock_scale[2]
   .bt2(cscale_in),		// output clock_scale[2]
   .bu1(cscale_in), 	// input  clock_scale_in
   .bu2(instop0_),		// output ~in_stop[0]
   .bv2(instop1_)		// output ~in_stop[1]
);

assign irq_l = irql? 1'bz : 1'b0;
assign iob0_l = 1'bz;
assign iob1_l = 1'bz;
assign iob2_l = 1'bz;
assign iob3_l = 1'bz;
assign iob4_l = (~tt_[0]|~buffer_strobe)? 1'bz : 1'b0;
assign iob5_l = (~tt_[1]|~buffer_strobe)? 1'bz : 1'b0;
assign iob6_l = (~tt_[2]|~buffer_strobe)? 1'bz : 1'b0;
assign iob7_l = (~tt_[3]|~buffer_strobe)? 1'bz : 1'b0;
assign iob8_l = (~tt_[4]|~buffer_strobe)? 1'bz : 1'b0;
assign iob9_l = (~tt_[5]|~buffer_strobe)? 1'bz : 1'b0;
assign iob10_l = (~tt_[6]|~buffer_strobe)? 1'bz : 1'b0;
assign iob11_l = (~tt_[7]|~buffer_strobe)? 1'bz : 1'b0;
assign txdttl = 1'bz;
assign dsrttl = ~reader_run_l;
assign skip_l = tti_skip_? 1'bz : 1'b0;

endmodule
