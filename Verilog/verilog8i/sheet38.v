module sheet38(biop1, biop2, biop4, c_i_r, cr_read, cr_ready, i_m_d, index_markers, initialize_, io_bus_in_int_, io_bus_in_skip_, iot632, iot634, mb03, mb04, mb05_, mb06, mb06_, mb07, mb08, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
input biop1;
input biop2;
input biop4;
input c_i_r;
output cr_read;
input cr_ready;
input i_m_d;
input index_markers;
input initialize_;
output wand io_bus_in_int_;
output wand io_bus_in_skip_;
output iot632;
output iot634;
input mb03;
input mb04;
input mb05_;
input mb06;
input mb06_;
input mb07;
input mb08;

// Sheet 38
CardReaderControl j33m714(.a1(mb07), .b1(mb05_), .c1(mb03), .d1(mb06), .d2(mb04), .e1(mb08), .e2(mb06_), .f1(biop4), .f2(biop1), .h2(biop2), .j1(index_markers), .k1(i_m_d), .n1(initialize_), .n2(io_bus_in_int_), .p1(iot632), .p2(io_bus_in_skip_), .r1(iot634), .r2(cr_ready), .s2(cr_read), .u2(c_i_r));

endmodule
