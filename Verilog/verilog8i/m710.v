module PunchControl(dclk, ad1, ad2, ae1, ae2, af1, af2, ah1, ah2, ak1, ak2, al1, al2, am1, am2, an1, an2, ap2, ar1, ar2, as2, at2, au1, av2, bd1, bd2, be1, be2, bf1, bf2, bh2, bn2, bs2, bu2, bv1);
input dclk;

input bf2, bd1, bd2, be1, be2, bf1;
assign { mb03_, mb04_, mb05_, mb06_, mb07, mb08_ }
     = { bf2,   bd1,   bd2,   be1,   be2,  bf1 };
input ar2, ar1, ap2;
assign { iop1, iop2, iop4 } = { ar2, ar1, ap2 };
input as2;
assign initialize_ = as2;
input ah1, ah2, af1, af2, ae1, ae2, ad1, ad2;
assign { ac04, ac05, ac06, ac07, ac08, ac09, ac10, ac11 }
     = { ah1,  ah2,  af1,  af2,  ae1,  ae2,  ad1,  ad2 };
input at2;
assign pun_feed_switch_ = at2;
input av2;
assign sync_pun = av2;
input wand au1;
assign del_pun1 = au1;
input bu2;
// synthesis attribute pullup of bu2 is "yes";
// assign bu2 = 1'b1; // pull-up

reg [0:7] pb;
reg pun;
reg pun_active;
reg pun_flag;
wire pun_done_;
wire io_bus_in_skip_;
wire io_bus_in_int_;

output ak1, al1, am1, an1, ak2, al2, am2, an2;
assign { ak1, al1, am1, an1, ak2, al2, am2, an2 } = pb;
output bh2;
assign bh2 = pun_done_;
output bn2, bs2;
assign { bn2, bs2 } = { io_bus_in_skip_, io_bus_in_int_ };
output bv1;
assign bv1 = ~sync_pun;

assign pun_select = mb03_ & mb04_ & mb05_ & mb06_ & mb07 & mb08_;
assign pcf = (pun_select & iop2) | ~initialize_;
assign ppc = pun_select & iop4;

assign feed_ = pun_feed_switch_ | ~pun;

wire pun_done;

assign pun_set = ~((~feed_ | pun_active) & del_pun1);
always @(negedge sync_pun, negedge pun_done) begin
  if (~pun_done)
    pun <= 1;
  else
    pun <= pun_set;
end
`ifdef BPRE
Monostable #( 4500000) e10(dclk, ~pun, pun_done);
`else
Monostable #(10000000) e10(dclk, ~pun, pun_done);
`endif
assign pun_done_ = ~pun_done;

always @(posedge pun_done, posedge ppc) begin
  if (ppc)
    pun_active <= 1;
  else
    pun_active <= 0;
end
always @(negedge pun_active, posedge pcf) begin
  if (pcf)
    pun_flag <= 0;
  else
    pun_flag <= 1;
end
assign io_bus_in_skip_ = pun_select & iop1 & pun_flag;
assign io_bus_in_int_ = ~pun_flag;

always @(posedge ppc, negedge feed_) begin
  if (~feed_)
    pb <= 0;
  else
    pb <= { ac04, ac05, ac06, ac07, ac08, ac09, ac10, ac11 };
end

endmodule
