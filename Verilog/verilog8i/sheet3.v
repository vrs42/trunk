module sheet3(e09f1, lh_to_hs, mem_to_lsr_, n__1, n__2, n__3, n__4, n__5, s, s_, tp1, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
output e09f1;
inout lh_to_hs;
output mem_to_lsr_;
inout n__1;
inout n__2;
inout n__3;
inout n__4;
inout n__5;
input s;
input s_;
input tp1;

// Sheet 3
DelayLine #(300) dl_n__4(dclk, n__3, n__4);
assign lh_to_hs = n__4;
assign mem_to_lsr_ = ~(n__3);
assign n__5 = ~(lh_to_hs);
assign n__3 = ~(n__2);
assign n__2 = ~(s & tp1);
assign n__1 = ~(s_ & tp1);
assign e09f1 = ~(n__5 & n__1);

endmodule
