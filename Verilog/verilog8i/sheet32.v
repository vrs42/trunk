module sheet32(initialize_, iop2, mb03_, mb04_, mb05, mb06_, mb07_, mb08_, pwr_low_, pwr_skip_, restart, restart_, shut_down_, stop_ok, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
input initialize_;
input iop2;
input mb03_;
input mb04_;
input mb05;
input mb06_;
input mb07_;
input mb08_;
output reg pwr_low_;
output pwr_skip_;
output restart;
output restart_;
input shut_down_;
output wand stop_ok;

// Sheet 32
always @(negedge initialize_, negedge shut_down_) begin
  if (~initialize_)
    pwr_low_ <= 1;
  else
    pwr_low_ <= 0;
end
assign pwr_low = ~pwr_low_;
assign pwr_skip_ = ~(mb03_ & mb04_ & mb05 & mb06_ & mb07_ & mb08_ & iop2 & pwr_low);
Monostable #(1000000) a04a(dclk, shut_down_, stop_ok);
// TODO: kp8i_enable should be a switch, which would require
//       an input pin.
`ifdef kp8i_enable
Monostable #(200000000) a04b(dclk, stop_ok & shut_down_, a04c1);
`else
assign a04c1 = 1'b0;
`endif
Monostable #(1000000) a04c(dclk, a04c1, restart);
assign restart_ = ~restart;

endmodule
