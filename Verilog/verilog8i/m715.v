module ReaderClock(dclk, ak2, as2, at2, au2, bp2, br2, bs2, bt2);
input dclk;

input ak2;
assign rdr_enable_ = ak2;
input bp2;
assign rdr_feed_switch = bp2;
input bt2;
assign initialize = bt2;
input bs2;
assign rdr_run_ = bs2;

wire rdr_shift, rdr_shift_;
wire stop_complete;
wire clock1;
reg stop;

output as2;
assign as2 = rdr_shift;
output at2;
assign at2 = rdr_shift_;
output br2;
assign br2 = stop_complete;
output au2;
assign au2 = clock1;

assign enable = ~rdr_enable_;
Monostable #(40000000) rdrdelay(dclk, enable, stop_delay);
Monostable #(4000000) rdrspulse(dclk, enable, stop_pulse);

Oscillator #(3330000) rdr_clock(dclk, enable, clock1);
DelayLine #(1000) rdrclk2(dclk, clock1, clock2);
assign rdr_shift_ = enable & clock2;
assign rdr_shift = ~(rdr_shift_ & stop_pulse);

always @(posedge initialize, negedge rdr_run_, negedge stop_pulse) begin
  if (~rdr_run_)
    stop = 0;
  else if (~stop_pulse)
    stop = 1;
  else
    stop = 0;
end

assign stop_complete = ~rdr_feed_switch | (stop_delay & ~stop); 

endmodule

