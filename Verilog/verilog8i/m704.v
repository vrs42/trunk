module PlotterControl(dclk, ad2, ae2, af2, ah2, aj2, ak2, al2, an2, ar2, as2, at2, av2, be2, bf2, bh2, bl2, bm2, bn2, bp2, bt2, bu1, bv1);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";

input af2, ah2, ae2, ad2, as2, bu1, ak2, bv1;
assign { mb03, mb04_, mb05, mb06_, mb07, mb07_, mb08, mb08_ }
     = { af2,  ah2,   ae2,  ad2,   as2,  bu1,   ak2,  bv1 };
input bh2, bl2, bp2, bm2, bt2;
assign { iop1, iop2, iop4 } = { bh2, bp2, bt2 };
// synthesis attribute CLOCK_SIGNAL of iop1 is "yes";
// synthesis attribute CLOCK_SIGNAL of iop2 is "yes";
// synthesis attribute CLOCK_SIGNAL of iop4 is "yes";
assign { iop1_, iop2_ } = { bl2, bm2 };
input bn2;
assign initialize = bn2;

reg pen_right, pen_left;
reg drum_up, drum_down;
reg pen_up, pen_down;
wire io_bus_in_skip_, io_bus_in_int_;

output aj2, al2;
assign { aj2, al2 } = { pen_right, pen_left };
output an2, ar2;
assign { an2, ar2 } = { drum_up, drum_down };
output at2, av2;
assign { at2, av2 } = { pen_up, pen_down };
output be2, bf2;
assign { be2, bf2 } = { io_bus_in_skip_, io_bus_in_int_ };

wire fast_op_done_, slow_op_done_;
reg pltr_flag;

assign pltr_iot = mb03 & mb04_ & mb05 & mb06_ & (mb07_ | mb08_);
assign pltr_iop1 = pltr_iot & iop1;
always @(posedge pltr_iop1, negedge fast_op_done_) begin
  if (~fast_op_done_) begin
    pen_right <= 0;
    pen_left <= 0;
  end else begin
    pen_right <= mb08;
    pen_left <= mb07;
  end
end
assign pltr_iop2 = pltr_iot & iop2;
assign inst50_ = mb07 | mb08;
always @(posedge pltr_iop2, negedge fast_op_done_) begin
  if (!fast_op_done_)
    drum_up <= 0;
  else
    drum_up <= inst50_;
end
assign pltr_iop4 = pltr_iot & iop4;
always @(posedge pltr_iop2, negedge fast_op_done_) begin
  if (~fast_op_done_)
    drum_down <= 0;
  else
    drum_down <= mb08;
end
always @(posedge pltr_iop4, negedge slow_op_done_) begin
  if (~slow_op_done_) begin
    pen_up <= 0;
    pen_down <= 0;
  end else begin
    pen_up <= ~inst50_;
    pen_down <= mb07;
  end
end

assign fast_op_start = pltr_iot & inst50_ & (~iop1_ | (iop4 & mb07_) | ~iop2_);
assign slow_op_start = pltr_iot & mb08_ & iop4;

Monostable #(3500000) m704slow1(dclk, slow_op_start, m704jk2);
Monostable #(3500000) m704slow2(dclk, m704jk2, slow_op_done);
Monostable #(250000) m704fast1(dclk, fast_op_start, m704jj2);
Monostable #(250000) m704fast2(dclk, m704jj2, fast_op_done);

assign slow_op_done_ = ~(slow_op_done | initialize);
assign fast_op_done_ = ~(fast_op_done | initialize);

assign pltr_flag_clr = (pltr_iot & iop2 & ~inst50_) | initialize;
assign pltr_flag_clock = fast_op_done | slow_op_done;
assign pltr_flag_set = ~m704jk2 | pltr_flag;
always @(posedge pltr_flag_clock, posedge pltr_flag_clr) begin
  if (pltr_flag_clr)
    pltr_flag <= 0;
  else
    pltr_flag <= pltr_flag_set;
end

assign io_bus_in_int_ = pltr_flag;
assign io_bus_in_skip_ = pltr_flag & pltr_iot & iop1 & ~inst50_;

endmodule
