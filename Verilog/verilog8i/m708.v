module ClockControl(a1, c1, d2, f2, h1, j2, k2, l1, l2, m2, n1, n2, p1, p2, r1, r2, s1, s2, t2, u2, v1, v2);

input l2, r1, f2;
assign { iop1_, iop2_, iop4_ } = { l2, r1, f2 };
input t2, s2, r2, p2, n2, m2;
assign { mb03_, mb04_, mb05, mb06_, mb07, mb08 } = { t2, s2, r2, p2, n2, m2 };
input u2, n1, l1, a1;
assign { mb09, mb09_, mb10, mb11 } = { u2, n1, l1, a1 };
input p1;
assign initialize_ = p1;
input v1;
assign overflow = v1;
input d2;
assign clock = d2;

reg clock_enable;
reg interrupt_enable;
reg flag, flag_buffer;
wire clock_p4;
wire clock_iot;
wire load_counter;
wire io_bus_in_int_;
wire io_bus_in_skip_;

output j2;
assign j2 = ~clock_enable;
output k2;
assign k2 = clock_p4;
output s1;
assign s1 = clock_iot;
output v2;
assign v2 = load_counter;
output c1;
assign c1 = io_bus_in_int_;
output h1;
assign h1 = io_bus_in_skip_;

assign clock_iot = mb03_ & mb04_ & mb05 & mb06_ & mb07 & mb08;
assign clock_p4 = ~iop4_;
assign skip_iot = clock_iot & ~iop1_ & mb09_ & mb10;
assign flagb_clear = clock_iot & ~iop2_;
assign load_counter = clock_iot & ~iop2_ & ~(mb09_ & mb11);
assign clock_setup = load_counter | ~initialize_;

assign cenable_set = load_counter & mb09;
assign ienable_set = load_counter & mb11;
always @(posedge clock_setup, posedge cenable_set) begin
  if (cenable_set)
    clock_enable = 1;
  else
    clock_enable = 0;
end
always @(posedge clock_setup, posedge ienable_set) begin
  if (ienable_set)
    interrupt_enable = 1;
  else
    interrupt_enable = 0;
end
assign flag_input = clock_enable & overflow;
assign flag_clear = clock_setup | (flag_buffer & skip_iot);
always @(posedge clock, posedge flag_clear) begin
  if (flag_clear)
    flag = 0;
  else
    flag = flag_input;
end
always @(posedge skip_iot, posedge flagb_clear) begin
  if (flagb_clear)
    flag_buffer = 0;
  else
    flag_buffer = flag;
end
assign io_bus_in_int_ = ~(interrupt_enable & flag);
assign io_bus_in_skip_ = ~(skip_iot & flag_buffer);

endmodule
