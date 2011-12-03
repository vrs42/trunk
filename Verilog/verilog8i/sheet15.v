module sheet15(clock_scale_2, in_stop_2_, initialize, iop1, iop2, iop4, kcc_, keyboard_flag_, mb03_, mb04_, mb05_, mb06_, mb07, mb08, reader_run_, rx_data, tt0_, tt1_, tt2_, tt3_, tt4_, tt5_, tt6_, tt7_, tt_ac_clr_, tti2, tti_clock, tti_data, tti_skip_, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
inout clock_scale_2;
inout in_stop_2_;
input initialize;
input iop1;
input iop2;
input iop4;
inout kcc_;
output keyboard_flag_;
input mb03_;
input mb04_;
input mb05_;
input mb06_;
input mb07;
input mb08;
output reader_run_;
input rx_data;
output tt0_;
output tt1_;
output tt2_;
output tt3_;
output tt4_;
output tt5_;
output tt6_;
output tt7_;
output tt_ac_clr_;
inout tti2;
input tti_clock;
inout tti_data;
output tti_skip_;

// Sheet 15
TTYReceiver ef01m706(.ad2(mb03_), .ae1(mb04_), .ae2(kcc_), .af1(mb05_), .af2(keyboard_flag_), .ah1(mb06_), .ah2(mb07), .aj1(mb08), .aj2(tti2), .ak1(tti2), .ak2(tt0_), .al1(tt3_), .al2(iop4), .am1(tt4_), .am2(tti_data), .an1(tti_clock), .an2(tt7_), .ap2(tt5_), .ar1(tti_data), .ar2(tt1_), .as2(tt2_), .at2(tt6_), .au2(reader_run_), .av2(kcc_), .bd1(1'b0), .bd2(iop1), .be2(tt_ac_clr_), .bf2(initialize), .bh2(tti_skip_), .bj2(iop2), .bm2(rx_data), .br1(1'b1), .br2(in_stop_2_), .bt2(clock_scale_2), .bu1(clock_scale_2), .bv2(in_stop_2_));

endmodule
