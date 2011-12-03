module sheet21(b_set, b_set_, bf0, bf1, bf2, bf_enable, bf_enable__, bma00, bma01, bma02, bma03, bma04, bma05, bma06, bma07, bma08, bma09, bma10, bma11, clear_df_, clear_ib_, clear_if_, clear_ifdfbf_, defer, df0, df1, df2, df_enable, df_enable_, df_enable__, ea0, ea1, ea2, ext_data_add0, ext_data_add1, ext_data_add2, if0, if1, if2, if_enable, if_enable_, if_enable__, if_to_sf, jmp_, jms_, key_stexdp, load_bf, load_sf_, ma00_, ma01_, ma02_, ma03_, ma04_, ma05_, ma06_, ma07_, ma08_, ma09_, ma10_, ma11_, manual_preset_, mb00, mb01, mb02, mb03, mb04, mb05, mb06, mb07, mb08, mb09, mb10, mb11, mcbmb00_, mcbmb01_, mcbmb02_, mcbmb03_, mcbmb04_, mcbmb05_, mcbmb06_, mcbmb07_, mcbmb08_, mcbmb09_, mcbmb10_, mcbmb11_, mem_done_, mftp1, n__263, n__264, n__403, n__407, n__408, n__409, n__410, n__411, n__412, n__413, n__414, n__415, n__416, n__417, n__418, n__53, restart, run, sf0, sf1, sf2, sf3, sf4, sf5, strobe_, tp3, ts4_, wc_set_, word_count_, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
input b_set;
inout b_set_;
output reg bf0;
output reg bf1;
output reg bf2;
inout bf_enable;
output reg bf_enable__;
output wand bma00;
output wand bma01;
output wand bma02;
output wand bma03;
output wand bma04;
output wand bma05;
output wand bma06;
output wand bma07;
output wand bma08;
output wand bma09;
output wand bma10;
output wand bma11;
output clear_df_;
output clear_ib_;
output clear_if_;
input clear_ifdfbf_;
input defer;
input df0;
input df1;
input df2;
inout df_enable;
inout df_enable_;
output reg df_enable__;
output wand ea0;
output wand ea1;
output wand ea2;
input ext_data_add0;
input ext_data_add1;
input ext_data_add2;
input if0;
input if1;
input if2;
inout if_enable;
inout if_enable_;
output reg if_enable__;
inout if_to_sf;
input jmp_;
input jms_;
input key_stexdp;
inout load_bf;
input load_sf_;
input ma00_;
input ma01_;
input ma02_;
input ma03_;
input ma04_;
input ma05_;
input ma06_;
input ma07_;
input ma08_;
input ma09_;
input ma10_;
input ma11_;
input manual_preset_;
input mb00;
input mb01;
input mb02;
input mb03;
input mb04;
input mb05;
input mb06;
input mb07;
input mb08;
input mb09;
input mb10;
input mb11;
output wand mcbmb00_;
output wand mcbmb01_;
output wand mcbmb02_;
output wand mcbmb03_;
output wand mcbmb04_;
output wand mcbmb05_;
output wand mcbmb06_;
output wand mcbmb07_;
output wand mcbmb08_;
output wand mcbmb09_;
output wand mcbmb10_;
output wand mcbmb11_;
output wand mem_done_;
input mftp1;
inout n__263;
inout n__264;
inout n__403;
inout n__407;
inout n__408;
inout n__409;
inout n__410;
inout n__411;
inout n__412;
inout n__413;
inout n__414;
inout n__415;
inout n__416;
inout n__417;
inout n__418;
inout n__53;
input restart;
input run;
output reg sf0;
output reg sf1;
output reg sf2;
output reg sf3;
output reg sf4;
output reg sf5;
output wand strobe_;
input tp3;
input ts4_;
input wc_set_;
input word_count_;

// Sheet 21
assign n__411 = ~(if_enable & if0);
assign n__410 = ~(df_enable & df0);
assign n__413 = ~(if_enable & if1);
assign n__415 = ~(bf_enable & bf1);
assign n__417 = ~(df_enable & df2);
assign n__409 = ~(bf_enable & bf0);
assign n__414 = ~(df_enable & df1);
assign n__416 = ~(if_enable & if2);
assign n__418 = ~(bf_enable & bf2);
assign n__263 = ~(wc_set_ & word_count_);
assign n__403 = ~(n__263);
assign n__412 = ~(n__408 & ts4_);
assign n__407 = ~(tp3 & b_set);
assign if_to_sf = ~(n__53 & load_sf_);
assign b_set_ = ~(b_set);
assign n__408 = ~(key_stexdp & mftp1);
assign load_bf = ~(n__407);
assign n__264 = ~(n__53 & load_sf_);
Monostable #(35000) b10e2(dclk, run & tp3, strobe___);
assign strobe_ = strobe___;
Monostable #(40000) b10d2(dclk, run & tp3, mem_done_);
always @(posedge n__412, negedge manual_preset_) begin
  if (~manual_preset_)
    if_enable__ <= 1'b1;
  else
    if_enable__ <= if_enable_;
end
assign if_enable = ~if_enable__;
always @(posedge n__412, negedge manual_preset_) begin
  if (~manual_preset_)
    df_enable__ <= 1'b1;
  else
    df_enable__ <= df_enable_;
end
assign df_enable = ~df_enable__;
always @(posedge n__412, negedge manual_preset_) begin
  if (~manual_preset_)
    bf_enable__ <= 1'b1;
  else
    bf_enable__ <= b_set_;
end
assign bf_enable = ~bf_enable__;
assign mcbmb00_ = ~(mb00);
assign mcbmb02_ = ~(mb02);
assign mcbmb04_ = ~(mb04);
assign mcbmb01_ = ~(mb01);
assign mcbmb03_ = ~(mb03);
assign mcbmb05_ = ~(mb05);
assign mcbmb06_ = ~(mb06);
assign mcbmb08_ = ~(mb08);
assign mcbmb10_ = ~(mb10);
assign mcbmb07_ = ~(mb07);
assign mcbmb09_ = ~(mb09);
assign mcbmb11_ = ~(mb11);
assign bma00 = ~(ma00_);
assign bma02 = ~(ma02_);
assign bma04 = ~(ma04_);
assign bma01 = ~(ma01_);
assign bma03 = ~(ma03_);
assign bma05 = ~(ma05_);
assign bma06 = ~(ma06_);
assign bma08 = ~(ma08_);
assign bma10 = ~(ma10_);
assign bma07 = ~(ma07_);
assign bma09 = ~(ma09_);
assign bma11 = ~(ma11_);
assign ea0 = ~(n__411 & n__410 & n__409);
assign ea2 = ~(n__416 & n__417 & n__418);
assign ea1 = ~(n__413 & n__414 & n__415);
always @(posedge load_bf) begin
    bf0 <= ext_data_add0;
end
always @(posedge load_bf) begin
    bf1 <= ext_data_add1;
end
always @(posedge load_bf) begin
    bf2 <= ext_data_add2;
end
always @(posedge if_to_sf) begin
    sf0 <= if0;
end
always @(posedge if_to_sf) begin
    sf1 <= if1;
end
always @(posedge n__264) begin
    sf2 <= if2;
end
always @(posedge n__264) begin
    sf3 <= df0;
end
always @(posedge n__264) begin
    sf4 <= df1;
end
always @(posedge n__264) begin
    sf5 <= df2;
end
assign df_enable_ = ~(jmp_ & jms_ & defer);
assign if_enable_ = ~(df_enable_ & n__403 & b_set_);
assign clear_if_ = ~(clear_ifdfbf_ & if_to_sf);
assign clear_ib_ = ~(clear_ifdfbf_ & if_to_sf);
assign clear_df_ = ~(clear_ifdfbf_ & if_to_sf);
assign n__53 = ~(restart & mftp1);

endmodule
