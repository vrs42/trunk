module sheet8(add_accepted_, b_fetch, break, break_ok_, carry_out0, clear_ifdfbf_, f_set, int_delay, int_delay__, int_enable, int_enable_, int_inhibit_, int_ok, int_ok_, int_rqst, int_strobe, int_strobe_, int_sync, int_sync__, iot, key_laexdp_, key_st, load_sf_, manual_preset_, mb03_, mb04_, mb05_, mb06_, mb07_, mb08_, mb10, mb10_, mb11_, memory_increment, mftp2, n0_to_int_enab_, n__114, n__116, n__117, n__118, n__119, n__121, n__122, n__123, n__124, n__125, n__126, n__127, n__134, n__135, n__23, processor_iot_, strobe_, tp1, tp2, tp4, ts4, wc_overflow_, word_count_, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
output reg add_accepted_;
input b_fetch;
input break;
input break_ok_;
input carry_out0;
output clear_ifdfbf_;
input f_set;
inout int_delay;
output reg int_delay__;
inout int_enable;
output reg int_enable_;
input int_inhibit_;
inout int_ok;
inout int_ok_;
input int_rqst;
input int_strobe;
input int_strobe_;
inout int_sync;
output reg int_sync__;
input iot;
input key_laexdp_;
input key_st;
output wand load_sf_;
input manual_preset_;
input mb03_;
input mb04_;
input mb05_;
input mb06_;
input mb07_;
input mb08_;
input mb10;
input mb10_;
input mb11_;
input memory_increment;
input mftp2;
inout n0_to_int_enab_;
inout n__114;
inout n__116;
inout n__117;
inout n__118;
inout n__119;
inout n__121;
inout n__122;
inout n__123;
inout n__124;
inout n__125;
inout n__126;
inout n__127;
inout n__134;
inout n__135;
inout n__23;
output processor_iot_;
input strobe_;
input tp1;
input tp2;
input tp4;
input ts4;
output reg wc_overflow_;
input word_count_;

// Sheet 8
assign load_sf_ = ~(int_ok & ts4 & int_strobe_);
assign n__117 = ~(break & memory_increment);
assign n__118 = ~(word_count_ & n__117);
assign clear_ifdfbf_ = ~(n__135 & n__125 & mb10);
assign int_ok_ = ~(int_sync & int_inhibit_ & int_delay);
assign n0_to_int_enab_ = (tp1 & int_ok) | (mftp2 & key_st);
always @(posedge tp4, negedge n__116) begin
  if (~n__116)
    add_accepted_ <= 1'b1;
  else
    add_accepted_ <= break_ok_;
end
always @(posedge tp2) begin
    wc_overflow_ <= n__119;
end
always @(posedge int_strobe, negedge manual_preset_) begin
  if (~manual_preset_)
    int_sync__ <= 1'b1;
  else
    int_sync__ <= n__23;
end
assign int_sync = ~int_sync__;
always @(posedge n__122, negedge int_enable) begin
  if (~int_enable)
    int_delay__ <= 1'b1;
  else
    int_delay__ <= int_enable_;
end
assign int_delay = ~int_delay__;
always @(posedge n__123, negedge n0_to_int_enab_) begin
  if (~n0_to_int_enab_)
    int_enable_ <= 1'b1;
  else
    int_enable_ <= mb11_;
end
assign int_enable = ~int_enable_;
assign n__23 = ~(int_rqst & key_laexdp_ & f_set);
assign n__127 = ~(int_strobe & n__124 & n__125 & n__135);
assign n__126 = ~(iot & b_fetch & mb03_ & mb04_);
assign n__116 = ~(n__114);
assign n__114 = ~(strobe_ & manual_preset_);
assign n__119 = ~(n__118 & carry_out0);
assign n__121 = ~(int_strobe & b_fetch);
assign int_ok = ~(int_ok_);
assign n__125 = ~(n__126);
assign n__122 = ~(n__121);
assign n__123 = ~(n__127);
assign n__124 = ~(mb10_ & mb11_);
assign n__135 = ~(n__134);
assign processor_iot_ = ~(n__125 & n__135);
assign n__134 = ~(mb05_ & mb06_ & mb07_ & mb08_);

endmodule
