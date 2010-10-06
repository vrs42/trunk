module ReaderControl(ad1, ad2, ae1, ae2, af1, af2, ah1, ah2, ak1, ak2, al2, an1, an2, ap1, ap2, ar1, ar2, as1, as2, au2, av2, bd1, bd2, be1, be2, bf1, bf2, bh2, bj1, bk1, bk2, bm1, bm2, bn2, bp1, bp2, br1, br2, bs1, bs2, bu2);

input bd2, be2, be1, bf2, bf1, bh2;
assign { mb03_, mb04_, mb05_, mb06_, mb07_, mb08 }
     = { bd2,   be2,   be1,   bf2,   bf1,   bh2 };
input au2, av2, bk1;
assign { iop1, iop2, iop4 } = { au2, av2, bk1 };
input ad2, ad1, ae2, ae1, ah2, ah1, af2, af1;
wire [1:8] rd_hole;
assign rd_hole = { af1, af2, ah1, ah2, ae1, ae2, ad1, ad2 };

input bm1;
assign rdr_feed_switch_ = bm1;
input bm2;
assign s_feed_hole = bm2;
input bs2;
assign clock1 = bs2;
input bj1;
assign rdr_shift = bj1;
input bd1;
assign rdr_shift_ = bd1;
input bn2;
assign stop_complete = bn2;
input bp1;
assign initialize_ = bp1;

wire io_bus_in_skip_;
wire io_bus_in_int_;
wire [4:11] io_bus_in_;
reg a, b, power, rdr_enable;
reg rdr_flag, rdr_run;
reg [0:7] rd;

output ak2;
assign ak2 = io_bus_in_skip_;
output al2;
assign al2 = io_bus_in_int_;
output ap2, as2, ar1, an2, as1, ap1, ar2, an1;
assign { ap2, as2, ar1, an2, as1, ap1, ar2, an1 } = io_bus_in_;
output bp2;
assign bp2 = a;
output bs1;
assign bs1 = ~a;
output bu2;
assign bu2 = b;
output br1;
assign br1 = ~b;
output ak1;
assign ak1 = ~rdr_run;
output bk2;
assign bk2 = ~rdr_enable;
output br2;
assign br2 = power;

assign rdr_select = mb03_ & mb04_ & mb05_ & mb06_ & mb07_ & mb08;
assign rsf = rdr_select & iop1;
assign rrb = rdr_select & iop2;
assign rfc = rdr_select & iop4;

wire rdr_strobe;

assign rdr_run_set = rfc & s_feed_hole;
assign rdr_flag_clr = ~initialize_ | rrb | rdr_run_set;
always @(posedge rdr_strobe, posedge rdr_flag_clr) begin
  if (rdr_flag_clr)
    rdr_flag <= 0;
  else
    rdr_flag <= 1;
end
assign io_bus_in_int_ = ~rdr_flag;
assign io_bus_in_skip_ = ~(rsf & rdr_flag);

always @(posedge rdr_strobe, negedge initialize_, posedge rdr_run_set) begin
  if (~initialize_)
    rdr_run <= 0;
  else if (rdr_run_set)
    rdr_run <= 1;
  else
    rdr_run <= 0;
end

always @(posedge rdr_shift) begin
  { a, b } = { ~b, a };
end
assign stop_enable = (a & b) | (~a & ~b);
assign rdr_strobe = stop_enable & clock1;

always @(posedge rdr_strobe, posedge rdr_run_set) begin
  if (rdr_run_set)
    rd <= 0;
  else
    rd <= rd_hole;
end
assign io_bus_in_ = rrb? ~rd : ~0;

assign power_set = rdr_run | stop_enable | ~rdr_feed_switch_;
always @(posedge stop_complete, negedge initialize_, negedge rdr_shift_) begin
  if (~rdr_shift_)
    power <= 1;
  else if (~initialize_)
    power <= 0;
  else
    power <= power_set;
end
assign enable_set = power_set & stop_complete;
always @(posedge clock1, negedge initialize_, posedge enable_set) begin 
  if (enable_set)
    rdr_enable <= 1;
  else if (~initialize_)
    rdr_enable <= 0;
  else
    rdr_enable <= power_set;
end

endmodule
