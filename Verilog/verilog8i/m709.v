module ClockCounter(dclk, ae1, af1, af2, ah1, aj1, aj2, ak1, al1, am1, am2, an2, ap1, ap2, ar1, ar2, as1, at2, au1, au2, av1, av2, ba1, bb1, bd1, bj1, bj2, bk1, bl1, bm2, bn1, bp1, bs1);
input dclk;

wire [0:11] ac;
input ae1, ba1, av1, ah1, au2, ak1, at2, al1, ar1, an2, ar2, ap1;
assign ac = { ae1, ba1, av1, ah1, au2, ak1, at2, al1, ar1, an2, ar2, ap1 };
input bl1;
assign clock_iot = bl1;
input bk1;
assign clock_p4 = bk1;
input bj1;
assign mb10 = bj1;
input bp1;
assign mb10_ = bp1;
input bn1;
assign load_counter = bn1;
input bj2;
assign clock = bj2;

wire [0:11] io_bus_in_;
wire clock_ac_clr_;
reg overflow;

output af2, bd1, af1, bb1, aj2, au1, aj1, av2, am1, ap2, am2, as1;
assign { af2, bd1, af1, bb1, aj2, au1, aj1, av2, am1, ap2, am2, as1 } = io_bus_in_;
output bm2;
assign bm2 = clock_ac_clr_;
output bs1;
assign bs1 = overflow;

assign mb10_iot = clock_iot & clock_p4 & mb10;
assign mb10bar_iot = clock_iot & clock_p4 & mb10_;

reg gate;
always @(posedge load_counter, posedge mb10_iot) begin
  if (load_counter)
    gate <= 0;
  else
    gate <= 1;
end
assign clock_to_counter = (gate & clock) | mb10_iot;
assign clock_ac_clr_ = ~mb10bar_iot;
DelayLine #(100) clockxfer(dclk, load_counter & mb10bar_iot, transfer);

reg [0:11] count;
wire [0:11] count_new;
assign count_edge = clock_to_counter | ~gate;
assign count_new = gate? ac : count + 1;
always @(posedge count_edge, posedge load_counter) begin
  if (load_counter)
    count <= ~0;
  else
    count <= count_new;
end
always @(negedge count[0], negedge gate) begin
  if (~gate)
    overflow <= 0;
  else
    overflow <= ~overflow;
end

reg [0:11] clockreg;
always @(posedge transfer) begin
  clockreg <= count;
end
assign io_bus_in_ = mb10bar_iot? clockreg: ~0;

endmodule
