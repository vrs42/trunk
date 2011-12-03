`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:    Vincent Slyngstad
//
// Create Date:    09:22:45 08/19/10
// Design Name:    
// Module Name:    kw8i
// Project Name:   
// Target Device:  
// Tool versions:  
// Description:
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module kw8i(Dclk, Mb, Iop1, Iop2, Iop4, Initialize_, Ac,
            Io_bus_in_skip_, Io_bus_in_int_, Io_bus_in_,
            Clock_enable_, Clock_ac_clr_);

parameter frequency = 60;   // Hz
`define ticks (1000000000/frequency)

input wire Dclk;
input wire [0:11] Mb;
input wire Iop1;
input wire Iop2;
input wire Iop4;
input wire Initialize_;
input wire [0:11] Ac;

output wand Io_bus_in_skip_;
output wand Io_bus_in_int_;
output wand [0:11] Io_bus_in_;
output wire Clock_enable_;
output wire Clock_ac_clr_;

integer Dcount;

wire Clock_read;
wire Iot_clr;
reg Clock_flag;
reg Clock_enable;
reg Interrupt_enable;
reg Flag_buffer;
reg Clock;
reg [0:12] Count;
wire [0:12] Ncount;
reg [0:11] Clock_out;
reg Gate;

assign Clock_iot = (Mb[3:8] == 6'b001011);
assign Iot_clr = Clock_iot & Iop2;
assign Iot_check = Clock_iot & Iop1 & ~Mb[9] & Mb[10];
// Mb[9] enables the clock, Mb[11] the interrupt.
// It is not permitted to enable the interrupt, but not the clock.
assign Mb911 = ~Mb[9] & Mb[11];
assign Iot_load = Clock_iot & Iop2 & ~Mb911;
assign Enable_iot = ~Initialize_ | Iot_load;

assign Load_counter = Mb[9] & Iot_load;
always @(posedge Enable_iot, posedge Load_counter)
begin
    if (Load_counter)
        Clock_enable <= 1;
    else
        Clock_enable <= 0;
end
assign Clock_enable_ = ~Clock_enable;

assign Set_intr_enable = Mb[11] & Iot_load;
always @(posedge Enable_iot, posedge Set_intr_enable)
begin
    if (Set_intr_enable)
        Interrupt_enable <= 1;
    else
        Interrupt_enable <= 0;
end

// There are two counters here.  Count is used as 
// a prescaler to set the desired frequency for Clock.
always @(posedge Dclk)
begin
    Dcount = Dcount + 1;
    if (Dcount == `ticks) begin
        Clock = 1;
        Dcount = 0;
    end else
        Clock = 0;
end

assign Iot_load_done = Clock_iot & Mb[10] & Iop4;
always @(posedge Load_counter, posedge Iot_load_done)
begin
    if (Load_counter)
        Gate <= 1;
    else
        Gate <= 0;
end

assign Count_clock = (~Gate & Clock) | Iot_load_done;
assign Ncount = Gate? {1'b0, ~Ac} : Count + 1;
always @(posedge Load_counter, posedge Count_clock)
begin
    if (Load_counter)
        Count <= 13'b0111111111111;
    else
        Count <= Ncount;
end
assign Overflow = Count[0];

assign Flag_clr = (Iot_check & Flag_buffer) | Enable_iot;
always @(posedge Flag_clr, posedge Clock)
begin
    if (Flag_clr)
        Clock_flag = 0;
    else
        Clock_flag = Overflow;
end

always @(posedge Iot_clr, posedge Iot_check)
begin
    if (Iot_clr)
        Flag_buffer <= 0;
    else
        Flag_buffer <= Clock_flag;
end

assign Io_bus_in_skip_ = ~(Flag_buffer & Iot_check);
assign Io_bus_in_int_ = ~(Clock_flag & Interrupt_enable);

assign Clock_read = Clock_iot & Iop4 & ~Mb[10];
assign Clock_ac_clr_ = ~Clock_read;
assign Io_bus_in_ = Clock_read? Clock_out : 12'bZ;
assign Transfer = Clock_read & ~Count_clock;
DelayLine #(100) delay(Dclk, Transfer, Load_clock_out);

always @(posedge Load_clock_out)
begin
    Clock_out <= Count[1:12];
end

endmodule
