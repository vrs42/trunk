module sheet34(drum_down, drum_up, initialize, io_bus_in_int_, io_bus_in_skip_, iop1, iop1_, iop2, iop2_, iop4, mb03, mb04_, mb05, mb06_, mb07, mb07_, mb08, mb08_, pen_down, pen_left, pen_right, pen_up, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
output drum_down;
output drum_up;
input initialize;
output wand io_bus_in_int_;
output wand io_bus_in_skip_;
input iop1;
input iop1_;
input iop2;
input iop2_;
input iop4;
input mb03;
input mb04_;
input mb05;
input mb06_;
input mb07;
input mb07_;
input mb08;
input mb08_;
output pen_down;
output pen_left;
output pen_right;
output pen_up;

// Sheet 34
PlotterControl hj29m704(.dclk(dclk), .ad2(mb06_), .ae2(mb05), .af2(mb03), .ah2(mb04_), .aj2(pen_right), .ak2(mb08), .al2(pen_left), .an2(drum_up), .ar2(drum_down), .as2(mb07), .at2(pen_up), .av2(pen_down), .be2(io_bus_in_skip_), .bf2(io_bus_in_int_), .bh2(iop1), .bl2(iop1_), .bm2(iop2_), .bn2(initialize), .bp2(iop2), .bt2(iop4), .bu1(mb07_), .bv1(mb08_));

endmodule
