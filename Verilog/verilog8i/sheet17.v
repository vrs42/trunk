module sheet17(b_power_clear_, m30v, n__270, power_clear_, power_ok_, shut_down_, stop_ok, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
output wand b_power_clear_;
input m30v;
inout n__270;
input power_clear_;
input power_ok_;
output wand shut_down_;
input stop_ok;

// Sheet 17
// ab02: G826 Regulator Control
// not implemented (power supply)
assign n__270 = ~(power_clear_ & power_clear_);
assign b_power_clear_ = ~(n__270 & n__270 & n__270 & n__270);

endmodule
