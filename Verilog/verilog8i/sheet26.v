module sheet26(b_ext_inst, cint_, clear_if_, cuf, cuf_, ext_go, i_iot_, ib_to_if, if_to_sf, initialize_, key_lamfts0_, mb06xmb09, mb07, mb07_, mb08, mb08_, mb09_, mb10_, mb11_, me05_, n__548, n__549, n__550, n__551, n__552, n__553, n__554, n__555, n__556, n__557, n__558, n__559, n__560, n__561, n__562, n__563, n__564, n__565, n__566, n__567, n__569, op2, pc_load_, pc_loadxsr_enable_, rib, rmf_, s_uf, sf_enable, sint, skip_, skip_or, tp2e_, tp3, ub, uf, uf_, uint, uint_, usf, usf_, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
input b_ext_inst;
inout cint_;
input clear_if_;
inout cuf;
inout cuf_;
input ext_go;
input i_iot_;
input ib_to_if;
input if_to_sf;
input initialize_;
input key_lamfts0_;
input mb06xmb09;
input mb07;
input mb07_;
input mb08;
input mb08_;
input mb09_;
input mb10_;
input mb11_;
output me05_;
inout n__548;
inout n__549;
inout n__550;
inout n__551;
inout n__552;
inout n__553;
inout n__554;
inout n__555;
inout n__556;
inout n__557;
inout n__558;
inout n__559;
inout n__560;
inout n__561;
inout n__562;
inout n__563;
inout n__564;
inout n__565;
inout n__566;
inout n__567;
inout n__569;
input op2;
input pc_load_;
input pc_loadxsr_enable_;
input rib;
input rmf_;
output reg s_uf;
input sf_enable;
inout sint;
input skip_;
output skip_or;
input tp2e_;
input tp3;
output reg ub;
output reg uf;
output uf_;
output reg uint;
output uint_;
output reg usf;
inout usf_;

// Sheet 26
assign n__550 = ~(mb10_ & mb09_);
assign n__549 = ~(n__548);
assign n__561 = ~(n__551 & i_iot_);
assign n__563 = ~(n__561 & uf);
assign n__564 = ~(n__562 & n__563);
assign n__551 = ~(n__549 & n__550);
assign me05_ = ~(rib & s_uf);
assign n__562 = ~(cint_ & uint);
assign uint_ = ~(n__566 & n__566);
assign sint = ~(n__552);
assign cint_ = ~(mb07_ & mb08_ & b_ext_inst);
assign n__552 = ~(mb08 & mb06xmb09 & mb07_);
assign n__569 = ~(tp2e_ & tp2e_ & pc_load_);
assign n__566 = ~(n__563 & n__563 & n__565);
assign n__548 = ~(mb11_ & op2);
assign n__567 = ~(uint & tp3 & sint);
assign skip_or = ~(usf_ & skip_);
always @(posedge n__558, negedge clear_if_) begin
  if (~clear_if_)
    ub <= 1'b0;
  else
    ub <= n__556;
end
always @(posedge ib_to_if, negedge clear_if_) begin
  if (~clear_if_)
    uf <= 1'b0;
  else
    uf <= n__560;
end
assign uf_ = ~uf;
always @(posedge tp3, negedge initialize_) begin
  if (~initialize_)
    uint <= 1'b0;
  else
    uint <= n__564;
end
assign n__565 = ~uint;
always @(posedge if_to_sf, negedge initialize_) begin
  if (~initialize_)
    s_uf <= 1'b0;
  else
    s_uf <= uf;
end
always @(posedge n__569, negedge initialize_, negedge n__567) begin
  if (~initialize_)
    usf <= 1'b0;
  else
  if (~n__567)
    usf <= 1'b1;
  else
    usf <= 1'b0;
end
assign usf_ = ~usf;
assign cuf_ = ~(mb07 & mb06xmb09);
assign n__553 = ~(cuf_ & rmf_);
assign n__558 = ~(pc_loadxsr_enable_ & n__557);
assign n__554 = ~(cuf & mb08);
assign n__555 = ~(s_uf & sf_enable);
assign n__557 = ~(ext_go & n__553);
assign cuf = ~(cuf_);
assign n__556 = ~(n__554 & n__555);
assign n__559 = ~(ub & key_lamfts0_);
assign n__560 = ~(n__559);

endmodule
