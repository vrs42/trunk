`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:    15:58:02 08/31/10
// Design Name:    KT8I Timeshare Option
// Module Name:    kt8i
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
module kt8i(Mb, Op2, Rmf, I_iot, Ib_to_if, Ext_inst, Ext_go, Pc_load_Sr_enable, Pc_load,
            Clear_if, Key_la_mfts0_, Tp3, Sf_enable, If_to_sf, Initialize_, Tp2e, Rib, Skip, Mb06xmb09,
            Me5_, U_int_, Skip_or, Uf);

input [0:11] Mb;
input Op2;
input Rmf;
input Rib;
input I_iot;
input Ib_to_if;
input Ext_inst;
input Ext_go;
input Pc_load;
input Pc_load_Sr_enable;
input Clear_if;
input Key_la_mfts0_;
input Tp2e;
input Tp3;
input Sf_enable;
input If_to_sf;
input Initialize_;
input Skip;
input Mb06xmb09;

output wand Me5_;
output wand U_int_;
output wand Skip_or;
output reg Uf;

reg Ub;
reg S_uf;   // UF bit in SF
reg Uint;
reg Usf;

wire Cint = Ext_inst & (Mb[7:8] == 2'b00);  // 62[4567]4
wire Sint = Mb06xmb09 & (Mb[7:8] == 2'b01);   // 6x54
wire Cuf = Mb06xmb09 & Mb[7];   // 6x[67]4

wire Ub_set = (S_uf & Sf_enable)
            | (Cuf & Mb[8]);
wire Ub_clock = ((Rmf | Cuf) & Ext_go)
            | Pc_load_Sr_enable;
always @(posedge Clear_if, posedge Ub_clock)
begin
    if (Clear_if)
        Ub = 0;
    else
        Ub = Ub_set;
end

wire Uf_set = (Ub & Key_la_mfts0_);
always @(posedge Clear_if, posedge Ib_to_if)
begin
    if (Clear_if)
        Uf = 0;
    else
        Uf = Uf_set;
end

always @(negedge Initialize_, posedge If_to_sf)
begin
    if (~Initialize_)
        S_uf = 0;
    else
        S_uf = Uf;
end

assign A05k1 = I_iot // Any Iot
             | ((Op2 & Mb[11]) & (Mb[9] | Mb[10])); // or HLT or OSR
assign A05n1_ = Uf & A05k1; // User mode and priviledged instruction.

assign Uint_set = A05n1_ | (~Cint & Uint);
always @(negedge Initialize_, posedge Tp3)
begin
    if (~Initialize_)
        Uint = 0;
    else
        Uint = Uint_set;
end

assign Usf_set = Uint & Sint & Tp3;
assign Usf_clock = Tp2e | Pc_load;
always @(negedge Initialize_, posedge Usf_set, posedge Usf_clock)
begin
    if (~Initialize_)
        Usf = 0;
    else if (Usf_set)
        Usf = 1;
    else
        Usf = 0;
end

assign Me5_ = ~(Rib & S_uf);
assign U_int_ = ~(Uint | A05n1_);
assign Skip_or = Usf | Skip;

endmodule
