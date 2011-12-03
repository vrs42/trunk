module sheet33(ac02, ac03, ac04, ac05, ac06, ac07, ac08, ac09, ac10, ac11, clear_x_, clear_y_, initialize, io_bus_in_int_, io_bus_in_skip_, iop1, iop2, iop4, light_pen, m15v, mb03_, mb04_, mb05_, mb06, mb07, mb07_, mb08, mb08_, mb09_, mb10, mb11, pen_strobe, x_axis, x_strobe, y_axis, y_strobe, z_axis, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
input ac02;
input ac03;
input ac04;
input ac05;
input ac06;
input ac07;
input ac08;
input ac09;
input ac10;
input ac11;
output clear_x_;
output clear_y_;
input initialize;
output wand io_bus_in_int_;
output wand io_bus_in_skip_;
input iop1;
input iop2;
input iop4;
input light_pen;
input m15v;
input mb03_;
input mb04_;
input mb05_;
input mb06;
input mb07;
input mb07_;
input mb08;
input mb08_;
input mb09_;
input mb10;
input mb11;
inout pen_strobe;
output x_axis;
output x_strobe;
output y_axis;
output y_strobe;
output z_axis;

// Sheet 33
DisplayControl hj23m701(.ae2(z_axis), .ah2(initialize), .aj1(pen_strobe), .aj2(iop2), .ak1(pen_strobe), .ak2(mb09_), .an1(mb10), .an2(light_pen), .ap1(mb11), .ap2(y_strobe), .ar1(iop1), .ar2(clear_y_), .as1(x_strobe), .as2(clear_x_), .bd2(iop4), .be2(mb07_), .bf2(mb03_), .bh2(mb04_), .bj2(mb08_), .bk2(mb05_), .bl2(mb07), .bm2(mb06), .bn2(mb08), .bp2(io_bus_in_int_), .br2(io_bus_in_skip_));
// hj24: A607 D-A Converter
// implement externally (analog)
// hj25: A607 D-A Converter
// implement externally (analog)

endmodule
