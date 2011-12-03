module PowerFail(d2, e2, f2, h2, j2, k2, l2, m2, n2, p2, r2, s2, t1, u1, u2);

input d2, e2, f2, h2, j2, k2;
assign { mb03_, mb04_, mb05, mb06_, mb07_, mb08_ } = { d2, e2, f2, h2, j2, k2 };
input m2;
assign iop2 = m2;
input u2;
assign shut_down_ = u2;
input s2;
assign initialize_ = s2;

reg pwr_low;
wire pwr_skip;

output p2;
assign p2 = stop_ok;
output r2;
assign r2 = ~pwr_low;
output l2;
assign l2 = ~pwr_skip;
output n2, u1;
assign { n2, u1 } = { restart, ~restart };

assign pwr_skip = mb03_ & mb04_ & mb05 & mb06_ & mb07_ & mb08_ & iop2 & pwr_low;

always @(negedge initialize_, negedge shutdown_) begin
  if (~initialize_)
    pwr_low <= 0;
  else
    pwr_low <= 1;
end

Monostable #(1000000) m703a(Dclk, shut_down_, stop_ok);
Monostable #(200000000) m703b(Dclk, stop_ok & shut_down_, M701c1);
Monostable #(1000000) m703c(Dclk, M701c1, restart);

endmodule
