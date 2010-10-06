module CardReaderControl(a1, b1, c1, d1, d2, e1, e2, f1, f2, h2, j1, k1, n1, n2, p1, p2, r1, r2, s2, u2);

input c1, d2, b1, d1, e2, a1, e1;
assign { mb03, mb04, mb05_, mb06, mb06_, mb07, mb08 } 
     = { c1,   d2,   b1,    d1,   e2,    a1,   e1 };
input f2, h2, f1;
assign { iop1, iop2, iop4 } = { f2, h2, f1 };
input j1;
assign index_markers = j1;
input k1;
assign i_m_d = k1;
input n1;
assign initialize_ = n1;
input r2;
assign cr_ready = r2;
input u2;
assign c_i_r = u2;

wire io_bus_in_int_;
wire io_bus_in_skip_;
wire iot632, iot634;
reg cr_read;

output n2;
assign n2 = io_bus_in_int_;
output p2;
assign p2 = io_bus_in_skip_;
output p1;
assign p1 = iot632;
output r1;
assign r1 = iot634;
output s2;
assign s2 = cr_read;

assign iot67x = mb03 & mb04 & mb05_ & mb06 & mb07 & mb08;
assign iot63x = mb03 & mb04 & mb05_ & mb06_ & mb07 & mb08;
assign iot671 = iot67x & iop1;
assign iot672 = iot67x & iop2;
assign iot674 = iot67x & iop4;
assign iot631 = iot63x & iop1;
assign iot632 = iot63x & iop2;
assign iot634 = iot63x & iop4;

assign done_clear = ~initialize_ | iot674 | iot672;

reg card_done;
always @(posedge done_clear, posedge c_i_r) begin
  if (done_clear)
    card_done = 0;
  else
    card_done = 1;
end

assign wtf = c_i_r | ~cr_ready | ~initialize_;
always @(posedge wtf, posedge iot672) begin
  if (iot672)
    cr_read = 1;
  else
    cr_read = 0;
end

reg data_ready;
assign dr_clear = ~initialize_ | iot632 | iot634;
always @(posedge i_m_d, posedge dr_clear) begin
  if (dr_clear)
    data_ready = 0;
  else
    data_ready = index_markers;
end

assign io_bus_in_skip_ = ~((cr_ready & iot672) | (card_done & iot671) | (data_ready & iot631));
assign io_bus_in_int_ = ~card_done & ~data_ready;

endmodule
