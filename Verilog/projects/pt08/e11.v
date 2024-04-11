// ex: sw=4 ts=4
//Eagle Pinout:
//E11      1        in       INITIALIZE
//         2        in       RX_RATE
//         4        in       INITIALIZE
//         5        in       BAC8
//         6        in       BIOP4
//         8        in       BAC7
//         9        in       BIOP2
//         11       in       BAC5
//         12       in       BAC6
//         14       in       BIOP1
//         16       in       BAC4
//         17       in       BAC3
//         18       in       BAC11
//         19       in       BAC2
//         20       in       BAC1
//         21       in       BAC10
//         24       in       BAC0
//         25       in       BAC9
//         26       in       RX_SEL
//         28       out      !SKIP
//         29       out      !IRQ
//         31       in       TX_SEL
//         33       out      !INIT
//         36       out      TXDTTL
//         37       out      STOP1
//         39       out      STOP2
//         41       out      TX_RATEO
//         43       in       TX_RATEI
//         44       in       STP_MARK

module e11(initialize, rx_rate, bac8, biop4, bac7, biop2, bac5, bac6, biop1, bac4, bac3, bac11, bac2, bac1, bac10, bac0, bac9, rx_sel, skip_l, irq_l, tx_sel, init_l, txdttl, stop1, stop2, tx_rateo, tx_ratei, stp_mark);
input initialize, rx_rate, rx_sel, tx_sel;
input bac0, bac1, bac2, bac3, bac4, bac5, bac6, bac7, bac8, bac9, bac10, bac11;
input biop1, biop2, biop4;
output skip_l, irq_l, init_l;
output txdttl, stop1, stop2, tx_rateo;
input tx_ratei, stp_mark;

/* M707 Transmitter */
m707 m707(
   .ae1(tx_sel),	// in  mb04_
   .ae2(tx_sel),	// in  mb03_
   .af1(tx_sel),	// in  mb06_
   .af2(tx_sel),	// in  mb05_
   .ah1(enable_),	// in  enable_zdetect
   .ah2(tx_sel),	// in  mb07_
   .aj1(),	// out tto[6]
   .aj2(tx_sel),	// in  mb08_
   .ak1(enable),	// in  new_char
   .ak2(enable),	// out enable
   .al1(enable_),	// out enable_
   .al2(bac6),	// in  ac6
   .am2(bac7),	// in  ac7
   .an1(1'b1),	// in  force_select
   .an2(1'b1),	// in  force_enable
   .ap2(bac4),	// in  ac4
   .ar1(),	// out tpc_
   .ar2(bac5),	// in  ac5
   .as1(biop4),	// in  iop4
   .as2(bac9),	// in  ac9
   .at2(bac10),	// in  ac10
   .au1(bac11),	// in  ac11
   .au2(bac8),	// in  ac8
   .av2(tx_data_),	// out tx_data_
   .bd2(biop2),	// in  iop2
   .be2(initialize),	// in  initialize
   .bf2(1'b1),	// in  flag_clr_
   .bh2(biop1),	// in  iop1
   .bj1(tx_sel),	// in  iot_ok
   .bj2(tto_skip_),	// out tto_skip_
   .bk2(irq_),	// out teleprinter_flag_
   .bn1(stop2),	// out out_stop_[2]
   .bn2(stp_mark),	// in  stop_
   .bp1(),	// out out_stop_[1]
   .bp2(tx_ratei),	// in  tto_clock_
   .br2(stop1),	// out out_stop_[0]
   .bs2(1'b1)	// in  force_stop_
);

wire tx_data_, skip_, irq_, tx_rate;
wire enable, enable_;
wire tto_skip_;

assign skip_l = tto_skip_? 1'bz : 1'b0;
assign irq_l = irq_? 1'bz : 1'b0;
assign txdttl = ~tx_data_;
assign init_l = ~initialize;
// tx_rateo must be derived from rx_ratei here.
reg tx_ratem, tx_rateo;
always @(posedge rx_rate)
  begin
    tx_ratem <= ~tx_ratem;
  end
always @(posedge tx_ratem)
  begin
    tx_rateo <= ~tx_rateo;
  end

endmodule
