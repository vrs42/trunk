module DisplayControl(ae2, ah2, aj1, aj2, ak1, ak2, an1, an2, ap1, ap2, ar1, ar2, as1, as2, bd2, be2, bf2, bh2, bj2, bk2, bl2, bm2, bn2, bp2, br2);

input bf2, bh2, bk2, bm2, bl2, be2, bn2, bj2, ak2, an1, ap1;
assign { mb03_, mb04_, mb05_, mb06, mb07, mb07_, mb08, mb08_, mb09_, mb10, mb11}
     = { bf2,   bh2,   bk2,   bm2,  bl2,  be2,   bn2,  bj2,   ak2,   an1,  ap1};
input ar1, aj2, bd2;
assign { iop1, iop2, iop4 } = { ar1, aj2, bd2 };
input ah2;
assign initialize = ah2;
input ak1;
assign pen_strobe_in = ak1;
input an2;
assign light_pen = an2;

wire x_strobe, y_strobe;
wire z_axis;
wire pen_strobe_out;
wire clear_x_, clear_y_;
wire io_bus_in_int_, io_bus_in_skip_;

output as1, ap2;
assign { as1, ap2 } = { x_strobe, y_strobe };
output ae2;
assign ae2 = z_axis;
output aj1;
assign aj1 = pen_strobe_out;
output ar2, as2;
assign { ar2, as2 } = { clear_x_, clear_y_ };
output bp2, br2;
assign { bp2, br2 } = { io_bus_in_int_, io_bus_in_skip_ };

assign iot05 = mb03_ & mb04_ & mb05_ & mb06 & mb07_ & mb08;
assign iot06 = mb03_ & mb04_ & mb05_ & mb06 & mb07 & mb08_;
assign iot07 = mb03_ & mb04_ & mb05_ & mb06 & mb07 & mb08;

assign clear_x_ = ~(iot05 & iop1);
assign clear_y_ = ~(iot06 & iop1);

assign light_pen_req = (iot05 | iot06) & iop4;
// DelayLine #(1000) M701a(Dclk, light_pen_req, light_pen_strobe);
assign pen_strobe_out = light_pen_req;

assign light_pen_set = light_pen & pen_strobe_in;
assign light_pen_clr = iot07 & iop2 & mb05_;
reg light_pen_flag;
always @(posedge initialize, posedge light_pen_clr, posedge light_pen_set) begin
  if (light_pen_clr)
    light_pen_flag = 0;
  else if (light_pen_set)
    light_pen_flag = 1;
  else
    light_pen_flag = 0;
end
assign io_bus_in_skip_ = ~(iot07 & iop1 & mb09_ & light_pen_flag);
assign io_bus_in_int_ = ~light_pen_flag;

assign x_strobe = iot05 & iop2;
assign y_strobe = iot06 & iop2;

reg [0:1] br;
assign br_clock = iot07 & iop4;
always @(posedge br_clock, posedge initialize) begin
  if (initialize)
    br <= ~0;
  else
    br <= { mb10, mb11 };
end

// TODO: z_axis must be pulled to "middle intensity" externally.
assign z_axis = br[1]? br[0] : 1'bz;

endmodule
