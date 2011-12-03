module sheet2(b_fetch, b_mem_start, b_power_clear_, biop1, biop2, biop4, btp2, e09f1, eae_end, eae_set_, eae_start_, f15f1, f17f1, f_set, initialize, initialize_, int_strobe, int_strobe_, io_end, io_end_, io_on, io_start_, io_strobe, iop1, iop1_, iop1_clr, iop1_set_, iop2, iop2_, iop2_clr, iop2_set_, iop4, iop4_, iop4_clr, iop4_set_, iot, key_cont, key_cont_, key_dp, key_dp_, key_ex_, key_exdp, key_exdp_, key_la, key_la_, key_laexdp, key_laexdp_, key_si_, key_sistop, key_ss, key_ss_, key_st, key_st_, key_stexdp, key_stop_, manual_preset_, mb09, mb10, mb11, mb11_, mem_done_, mem_ext_, mem_idle, mftp0, mftp1, mftp2, mfts0, mfts1, mfts1_, mfts2, mfts2_, mfts3, n__11, n__12, n__13, n__14, n__15, n__16, n__17, n__18, n__19, n__20, n__21, n__22, n__24, n__25, n__29, n__30, n__31, n__32, n__33, n__34, n__35, n__36, n__37, n__38, n__39, n__40, n__41, n__42, n__43, n__44, n__45, n__46, n__47, n__48, n__49, n__7, n__748, n__8, n__9, op2, pause, pause_, power_ok_, processor_iot_, restart_, run, run_, slow_cycle, slow_cycle_, stop_ok, strobe_, tp1, tp2, tp3, tp4, ts1, ts1_, ts2, ts3, ts3_, ts4, ts4_, tt_inst_, uf_, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
input b_fetch;
output b_mem_start;
input b_power_clear_;
output biop1;
output biop2;
output biop4;
output btp2;
input e09f1;
input eae_end;
input eae_set_;
input eae_start_;
inout f15f1;
inout f17f1;
input f_set;
inout initialize;
inout wand initialize_;
inout int_strobe;
inout int_strobe_;
inout io_end;
inout io_end_;
output reg io_on;
inout io_start_;
output io_strobe;
output reg iop1;
inout iop1_;
inout iop1_clr;
inout iop1_set_;
output reg iop2;
inout iop2_;
inout iop2_clr;
inout iop2_set_;
output reg iop4;
inout iop4_;
inout iop4_clr;
inout iop4_set_;
input iot;
inout key_cont;
input key_cont_;
output key_dp;
input key_dp_;
input key_ex_;
inout key_exdp;
inout key_exdp_;
output key_la;
input key_la_;
inout key_laexdp;
output key_laexdp_;
input key_si_;
inout key_sistop;
inout key_ss;
input key_ss_;
inout key_st;
input key_st_;
output key_stexdp;
input key_stop_;
inout wand manual_preset_;
input mb09;
input mb10;
input mb11;
input mb11_;
input mem_done_;
input mem_ext_;
output reg mem_idle;
inout mftp0;
output mftp1;
inout mftp2;
inout mfts0;
output reg mfts1;
inout mfts1_;
output reg mfts2;
inout mfts2_;
output mfts3;
inout n__11;
inout n__12;
inout n__13;
inout n__14;
inout n__15;
inout n__16;
inout n__17;
inout n__18;
inout n__19;
inout n__20;
inout n__21;
inout n__22;
inout n__24;
inout n__25;
inout n__29;
inout n__30;
inout n__31;
inout n__32;
inout n__33;
inout n__34;
inout n__35;
inout n__36;
inout n__37;
inout n__38;
inout n__39;
inout n__40;
inout n__41;
inout n__42;
inout n__43;
inout n__44;
inout n__45;
inout n__46;
inout n__47;
inout n__48;
inout n__49;
inout n__7;
inout n__748;
inout n__8;
inout n__9;
input op2;
output reg pause;
inout pause_;
input power_ok_;
input processor_iot_;
input restart_;
output reg run;
inout run_;
inout slow_cycle;
inout slow_cycle_;
input stop_ok;
input strobe_;
output tp1;
inout tp2;
inout tp3;
inout tp4;
output reg ts1;
output ts1_;
output reg ts2;
output reg ts3;
output ts3_;
output reg ts4;
output ts4_;
input tt_inst_;
input uf_;

// Sheet 2
assign initialize_ = ~(initialize);
assign biop2 = ~(iop2_);
assign biop1 = ~(iop1_);
assign biop4 = ~(iop4_);
assign key_la = ~(key_la_);
assign key_st = ~(key_st_ & restart_);
assign key_exdp = ~(key_dp_ & key_ex_);
assign key_sistop = ~(key_stop_ & key_si_);
assign key_dp = ~(key_dp_);
assign key_ss = ~(key_ss_);
assign key_exdp_ = ~(key_exdp);
assign key_cont = ~(key_cont_);
assign n__16 = ~(n__15);
assign n__15 = ~(io_start_ & eae_start_);
assign io_end_ = ~(io_end);
assign slow_cycle = ~(slow_cycle_);
assign n__17 = ~(eae_end & io_end_);
assign key_laexdp = ~(key_exdp_ & key_la_);
assign n__11 = (mb10 & mb11_ & op2 & uf_) | (key_sistop & f_set) | (key_exdp & mfts0) | (stop_ok & power_ok_) | (key_ss);
assign n__19 = ~(mem_idle & pause_ & run);
assign n__25 = ~(tp3 & eae_set_ & slow_cycle_);
assign n__46 = ~(iop4_set_ & iop2_set_ & iop1_set_);
assign key_stexdp = ~(key_st_ & restart_ & key_exdp_);
assign int_strobe = ~(n__25 & eae_end & io_end_);
assign n__13 = ~(mfts0 & mfts1_ & mfts2_);
assign n__20 = ~(mftp2 & key_la_);
assign n__21 = ~(mftp2 & key_cont);
assign n__24 = ~(tp2);
assign io_start_ = ~(tp3 & slow_cycle);
assign tp4 = ~(n__19 & n__21);
assign tp1 = ~(strobe_);
assign int_strobe_ = ~(int_strobe);
assign n__29 = ~(io_start_);
assign mfts3 = ~(n__13);
DelayLine #(300) dl_n__14(dclk, n__17, n__14);
assign n__18 = n__14;
DelayLine #(150) dl_n__22(dclk, e09f1, n__22);
DelayLine #(450) dl_n__748(dclk, e09f1, n__748);
assign tp2 = n__22;
assign tp3 = n__748;
always @(posedge tp4, negedge strobe_, negedge manual_preset_) begin
  if (~manual_preset_)
    ts1 <= 1'b1;
  else
  if (~strobe_)
    ts1 <= 1'b0;
  else
    ts1 <= 1'b1;
end
assign ts1_ = ~ts1;
always @(posedge 1'b0, negedge strobe_, negedge mem_done_) begin
  if (~strobe_)
    mem_idle <= 1'b0;
  else
  if (~mem_done_)
    mem_idle <= 1'b1;
  else
    mem_idle <= 1'b0;
end
always @(posedge n__18, negedge strobe_, negedge n__16) begin
  if (~strobe_)
    pause <= 1'b0;
  else
  if (~n__16)
    pause <= 1'b1;
  else
    pause <= 1'b0;
end
assign pause_ = ~pause;
always @(posedge tp3, negedge b_power_clear_) begin
  if (~b_power_clear_)
    run <= 1'b0;
  else
    run <= n__11;
end
assign run_ = ~run;
always @(posedge tp2, negedge manual_preset_, negedge strobe_) begin
  if (~manual_preset_)
    ts2 <= 1'b0;
  else
  if (~strobe_)
    ts2 <= 1'b1;
  else
    ts2 <= 1'b0;
end
always @(posedge tp3, negedge manual_preset_, negedge n__24) begin
  if (~manual_preset_)
    ts3 <= 1'b0;
  else
  if (~n__24)
    ts3 <= 1'b1;
  else
    ts3 <= 1'b0;
end
assign ts3_ = ~ts3;
always @(posedge tp4, negedge manual_preset_, negedge int_strobe_) begin
  if (~manual_preset_)
    ts4 <= 1'b0;
  else
  if (~int_strobe_)
    ts4 <= 1'b1;
  else
    ts4 <= 1'b0;
end
assign ts4_ = ~ts4;
always @(posedge iop1_clr, negedge initialize_, negedge iop1_set_) begin
  if (~initialize_)
    iop1 <= 1'b0;
  else
  if (~iop1_set_)
    iop1 <= 1'b1;
  else
    iop1 <= 1'b0;
end
assign iop1_ = ~iop1;
always @(posedge iop2_clr, negedge initialize_, negedge iop2_set_) begin
  if (~initialize_)
    iop2 <= 1'b0;
  else
  if (~iop2_set_)
    iop2 <= 1'b1;
  else
    iop2 <= 1'b0;
end
assign iop2_ = ~iop2;
always @(posedge iop4_clr, negedge initialize_, negedge iop4_set_) begin
  if (~initialize_)
    iop4 <= 1'b0;
  else
  if (~iop4_set_)
    iop4 <= 1'b1;
  else
    iop4 <= 1'b0;
end
assign iop4_ = ~iop4;
always @(posedge io_end, negedge manual_preset_, negedge io_start_) begin
  if (~manual_preset_)
    io_on <= 1'b0;
  else
  if (~io_start_)
    io_on <= 1'b1;
  else
    io_on <= 1'b0;
end
// TODO: n__7 should be suitably filtered.
assign mftp0 = (restart_ & n__7) | ~run_;
assign mfts0 = ~mftp0;
always @(posedge mfts0, negedge b_power_clear_, negedge mfts2_) begin
  if (~mfts2_)
    mfts1 = 1'b0;
  else if (~b_power_clear_)
    mfts1 = 1'b0;
  else
    mfts1 = 1'b1;
end
assign mfts1_ = ~mfts1;
DelayLine #(2000) m700ae2(dclk, mftp0, mftp1);
DelayLine #(2000) m700bd2(dclk, mftp1, mftp2);
always @(posedge mftp1, posedge mftp2, negedge b_power_clear_) begin
  if (~b_power_clear_)
    mfts2 = 1'b0;
  else if (mftp2)
    mfts2 = 1'b0;
  else
    mfts2 = 1'b1;
end
assign mfts2_ = ~mfts2;
assign b_mem_start = ~(n__20 & n__19);
assign btp2 = ~(n__24);
DelayLine #(400) dl_n__47(dclk, n__46, n__47);
assign io_strobe = n__47;
DelayLine #(150) dl_n__30(dclk, n__29, n__30);
DelayLine #(400) dl_n__31(dclk, n__29, n__31);
assign n__32 = n__31;
assign n__36 = n__30;
DelayLine #(350) dl_n__33(dclk, n__32, n__33);
DelayLine #(400) dl_n__34(dclk, n__32, n__34);
assign n__35 = n__34;
assign iop1_clr = n__33;
DelayLine #(150) dl_n__37(dclk, n__35, n__37);
DelayLine #(400) dl_n__38(dclk, n__35, n__38);
assign f15f1 = n__38;
assign n__39 = n__37;
DelayLine #(350) dl_n__40(dclk, f15f1, n__40);
DelayLine #(400) dl_n__41(dclk, f15f1, n__41);
assign n__42 = n__41;
assign iop2_clr = n__40;
DelayLine #(150) dl_n__43(dclk, n__42, n__43);
DelayLine #(400) dl_n__44(dclk, n__42, n__44);
assign f17f1 = n__44;
assign n__45 = n__43;
DelayLine #(350) dl_n__48(dclk, f17f1, n__48);
DelayLine #(400) dl_n__49(dclk, f17f1, n__49);
assign io_end = n__49;
assign iop4_clr = n__48;
assign slow_cycle_ = ~(n__12 & mem_ext_ & tt_inst_ & processor_iot_);
assign n__7 = ~(key_la_ & key_st_ & key_exdp_ & key_cont_);
assign iop2_set_ = ~(n__39 & mb10);
assign n__12 = ~(n__9);
assign n__9 = ~(b_fetch & iot);
assign iop1_set_ = ~(n__36 & mb11);
assign iop4_set_ = ~(n__45 & mb09);
assign initialize = ~(n__8 & b_power_clear_);
assign n__8 = ~(mftp0 & key_st);
assign key_laexdp_ = ~(key_laexdp & run_);
assign manual_preset_ = ~(mftp0);

endmodule
