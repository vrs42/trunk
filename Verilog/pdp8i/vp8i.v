//
// VP8i -- Pen plotter control

module vp8i(Dclk, Initialize_, Mb, Iop1, Iop2, Iop4,
            Io_bus_in_int_, Io_bus_in_skip_, c2);

input wire Dclk;
input wire Initialize_;
input wire [0:11] Mb;
input wire Iop1;
input wire Iop2;
input wire Iop4;

`define p2 0
`define r2 (`p2+1)
`define s2 (`r2+1)
`define t2 (`s2+1)
`define u2 (`t2+1)
`define v2 (`u2+1)
output wire [`p2:`v2] c2;
output wand Io_bus_in_int_;
output wand Io_bus_in_skip_;

reg Pen_right;
reg Pen_left;
reg Drum_up;
reg Drum_down;
reg Pen_up;
reg Pen_down;
reg Pltr_flag;

wire Inst_50_;
wire Fast_op_done_;
wire Slow_op_done_;

assign c2 = {Pen_right, Pen_left, Drum_up, Drum_down, Pen_up, Pen_down};
assign Pltr_iot = (Mb[3:6] == 'b1010) & (Mb[7:8] != 'b11);
assign Inst_50_ = Mb[7] | Mb[8];
assign Pltr_slow = Pltr_iot &  (Iop4 & ~Mb[8]);
assign Pltr_fast = Pltr_iot & ((Iop4 & ~Mb[7]) | Iop1 | Iop2) & Inst_50_;

assign Pen_clk = Iop1 & Pltr_iot;
always @(negedge Fast_op_done_, posedge Pen_clk)
begin
    if (~Fast_op_done_) begin
        Pen_left  <= 0;
        Pen_right <= 0;
    end else begin
        Pen_left  <= Mb[7];
        Pen_right <= Mb[8];
    end
end

Monostable #(35000000) jk2(Dclk, Pltr_slow, Jk2);
Monostable #(35000000) jk2b(Dclk, Jk2, Jk2b);
assign Slow_op_done_ = Initialize_ & ~Jk2b;
assign Pltr_flag_clr = (Pltr_iot & Inst_50_ & Iop2) | ~Initialize_;
assign Pltr_flag_tmp = ~(~Pltr_flag & Jk2);
always @(posedge Jk2b, posedge Pltr_flag_clr)
begin
    if (Pltr_flag_clr)
        Pltr_flag <= 0;
    else
        Pltr_flag <= Pltr_flag_tmp;
end
assign Io_bus_in_int_  = ~Pltr_flag;  // wand
assign Io_bus_in_skip_ = ~(Pltr_flag & Pltr_iot & Inst_50_ & Iop1);

assign Drum_up_clock = Pltr_iot & Iop2;
always @(posedge Drum_up_clock, negedge Fast_op_done_)
begin
    if (~Fast_op_done_)
        Drum_up <= 0;
    else
        Drum_up <= Inst_50_;
end

assign Drum_pen_clock = Pltr_iot & Iop4;
always @(posedge Drum_pen_clock, negedge Fast_op_done_)
begin
    if (~Fast_op_done_)
        Drum_down <= 0;
    else
        Drum_down <= Mb[8];
end

always @(posedge Drum_pen_clock, negedge Slow_op_done_)
begin
    if (~Slow_op_done_)
        Pen_up <= 0;
    else
        Pen_up <= ~Inst_50_;
end

always @(posedge Drum_pen_clock, negedge Slow_op_done_)
begin
    if (~Slow_op_done_)
        Pen_down <= 0;
    else
        Pen_down <= Mb[7];
end

Monostable #(5000000) jj2(Dclk, Pltr_fast, Jj2);
assign Fast_op_done_ = Initialize_ & ~Jj2;

endmodule