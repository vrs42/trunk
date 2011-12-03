module sheet4(and_, and_h, b_execute, b_fetch, b_set, break, break_, break_ok, break_ok_, brk_rqst, brk_sync, current_address, current_address_, d_set, d_set_, dca, dca_, defer, defer_, e_set, e_set_, eae_e_set_, eae_ir_clear_, execute, execute_, f_set, f_set_, fetch, fetch_, i_iot_, int_ok, int_ok_, iot, iot_, iot_opr_, ir0, ir0_, ir1, ir1_, ir2, ir2_, isz, isz_, jmp, jmp_, jms, jms_, key_st, manual_preset_, mb03, mb03_, mem00, mem01, mem02, mftp2, n3_cycle, n__50, n__51, n__52, n__54, n__55, n__56, n__59, n__6, opr, opr_, special_cycle_, tad, tad_, tp1, tp2, tp4, tt_set_, uf_, wc_set, wc_set_, word_count, word_count_, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
inout and_;
output and_h;
output wand b_execute;
inout wand b_fetch;
inout b_set;
output reg break;
output break_;
inout break_ok;
inout break_ok_;
input brk_rqst;
output reg brk_sync;
output reg current_address;
inout current_address_;
inout d_set;
inout d_set_;
output dca;
inout dca_;
output reg defer;
output defer_;
inout e_set;
inout e_set_;
input eae_e_set_;
inout eae_ir_clear_;
output reg execute;
inout execute_;
inout f_set;
inout f_set_;
output reg fetch;
inout fetch_;
inout i_iot_;
input int_ok;
input int_ok_;
output iot;
inout iot_;
inout iot_opr_;
inout ir0;
output reg ir0_;
output reg ir1;
inout ir1_;
output reg ir2;
inout ir2_;
output isz;
inout isz_;
output jmp;
inout jmp_;
output jms;
inout jms_;
input key_st;
input manual_preset_;
input mb03;
input mb03_;
input mem00;
input mem01;
input mem02;
input mftp2;
input n3_cycle;
inout n__50;
inout n__51;
inout n__52;
inout n__54;
inout n__55;
inout n__56;
inout n__59;
inout n__6;
output opr;
inout opr_;
inout special_cycle_;
output tad;
inout tad_;
input tp1;
input tp2;
input tp4;
input tt_set_;
input uf_;
inout wc_set;
inout wc_set_;
output reg word_count;
inout word_count_;

// Sheet 4
assign iot = ~(iot_);
always @(posedge n__51, negedge n__6) begin
  if (~n__6)
    ir0_ <= 1'b0;
  else
    ir0_ <= n__50;
end
assign ir0 = ~ir0_;
always @(posedge n__51, negedge n__6) begin
  if (~n__6)
    ir1 <= 1'b0;
  else
    ir1 <= mem01;
end
assign ir1_ = ~ir1;
always @(posedge n__51, negedge n__6) begin
  if (~n__6)
    ir2 <= 1'b0;
  else
    ir2 <= mem02;
end
assign ir2_ = ~ir2;
always @(posedge tp1, negedge manual_preset_) begin
  if (~manual_preset_)
    brk_sync <= 1'b0;
  else
    brk_sync <= brk_rqst;
end
assign tad_ = ~(ir0_ & ir1_ & ir2);
assign isz_ = ~(ir0_ & ir1 & ir2_);
assign jms_ = ~(ir0 & ir1_ & ir2_);
assign jmp_ = ~(ir0 & ir1_ & ir2);
assign and_ = ~(ir0_ & ir1_ & ir2_);
assign dca_ = ~(ir0_ & ir1 & ir2);
assign i_iot_ = ~(ir0 & ir1 & ir2_);
assign opr_ = ~(ir0 & ir1 & ir2);
assign and_h = ~(and_);
assign tad = ~(tad_);
assign jms = ~(jms_);
assign eae_ir_clear_ = ~(tp2 & b_fetch);
assign n__51 = ~(eae_ir_clear_);
assign isz = ~(isz_);
assign dca = ~(dca_);
assign jmp = ~(jmp_);
assign opr = ~(opr_);
always @(posedge tp4, negedge manual_preset_, negedge n__52) begin
  if (~manual_preset_)
    fetch <= 1'b0;
  else
  if (~n__52)
    fetch <= 1'b1;
  else
    fetch <= f_set;
end
assign fetch_ = ~fetch;
always @(posedge tp4, negedge manual_preset_) begin
  if (~manual_preset_)
    defer <= 1'b0;
  else
    defer <= d_set;
end
assign defer_ = ~defer;
always @(posedge tp4, negedge manual_preset_) begin
  if (~manual_preset_)
    execute <= 1'b0;
  else
    execute <= e_set;
end
assign execute_ = ~execute;
always @(posedge tp4, negedge manual_preset_) begin
  if (~manual_preset_)
    word_count <= 1'b0;
  else
    word_count <= wc_set;
end
assign word_count_ = ~word_count;
always @(posedge tp4, negedge manual_preset_) begin
  if (~manual_preset_)
    current_address <= 1'b0;
  else
    current_address <= word_count;
end
assign current_address_ = ~current_address;
always @(posedge tp4, negedge manual_preset_) begin
  if (~manual_preset_)
    break <= 1'b0;
  else
    break <= b_set;
end
assign break_ = ~break;
assign n__54 = ~(defer & jmp_);
assign special_cycle_ = ~(n__59);
assign iot_opr_ = ~(ir0 & ir1);
assign n__6 = ~(tp4 & int_ok);
assign n__59 = ~(tt_set_ & current_address_ & word_count_);
assign d_set_ = ~(iot_opr_ & b_fetch & mb03);
assign iot_ = ~(ir0 & ir1 & ir2_ & uf_);
assign n__50 = ~(mem00);
assign f_set = ~(f_set_);
assign e_set_ = ~(e_set);
assign break_ok = ~(break_ok_);
assign n__56 = ~(break_ok & wc_set_);
assign n__52 = ~(mftp2 & key_st);
assign d_set = ~(d_set_);
assign wc_set = ~(wc_set_);
assign b_set = ~(n__56 & current_address_);
assign wc_set_ = ~(n3_cycle & break_ok);
assign n__55 = ~(iot_opr_ & b_fetch & jmp_ & mb03_);
assign f_set_ = ~(special_cycle_ & break_ok_ & e_set_ & d_set_);
assign e_set = ~(int_ok_ & n__54 & n__55 & eae_e_set_);
assign break_ok_ = ~(e_set_ & brk_sync & special_cycle_ & d_set_);
assign b_fetch = ~(fetch_);
assign b_execute = ~(execute_);

endmodule
