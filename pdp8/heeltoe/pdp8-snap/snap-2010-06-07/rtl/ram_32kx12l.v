module pdp8_ram(clk, reset, addr, data_out, data_in, rd, wr);
parameter TopBank = 7;
input clk;
input reset;
input [0:14]addr;
input [0:11]data_in;
output [0:11]data_out;
input rd, wr;

`ifdef use_sim_ram_model
   ram_32kx12 ram(.A(addr),
                  .DI(data_in),
                  .DO(data_out),
                  .CE_N(1'b0),
                  .WE_N(~wr));
`else

   //
   wire          rom_decode;
   wire [11:0]   rom_data;

   bootrom rom(.clk(clk),
               .reset(reset),
               .addr(addr),
               .data_out(rom_data),
               .rd(rd),
               .selected(rom_decode));

wire [0:11] dout[TopBank:0];
reg ena[TopBank:0];
wand [0:11]data_o;
wire we;

genvar bank;

//
// This declares a pile of Block RAM.  Basically, 
// RAMxN are defined for N = 0, 1, 2 to be the high, 
// middle and low bits for a 4K bank.
//
generate
for (bank = 0; bank <= TopBank; bank = bank + 1)
begin:corebank
     RAMB16_S4 #(
     ) RAMx0 (
        .DO(dout[bank][0:3]),   // 4-bit Data Output
        .ADDR(addr[3:14]),      // 12-bit Address Input
        .CLK(clk),              // Clock
        .DI(data_in[0:3]),      // 4-bit Data Input
        .EN(ena[bank]),         // RAM Enable Input
        .SSR(1'b0),             // Synchronous Set/Reset Input
        .WE(we)                 // Write Enable Input
     );

     RAMB16_S4 #(
     ) RAMx1 (
        .DO(dout[bank][4:7]),   // 4-bit Data Output
        .ADDR(addr[3:14]),      // 12-bit Address Input
        .CLK(clk),              // Clock
        .DI(data_in[4:7]),      // 4-bit Data Input
        .EN(ena[bank]),         // RAM Enable Input
        .SSR(1'b0),             // Synchronous Set/Reset Input
        .WE(we)                 // Write Enable Input
     );

     RAMB16_S4 #(
     ) RAMx2 (
        .DO(dout[bank][8:11]),  // 4-bit Data Output
        .ADDR(addr[3:14]),      // 12-bit Address Input
        .CLK(clk),              // Clock
        .DI(data_in[8:11]),     // 4-bit Data Input
        .EN(ena[bank]),         // RAM Enable Input
        .SSR(1'b0),             // Synchronous Set/Reset Input
        .WE(we)                 // Write Enable Input
     );
end
endgenerate

generate
for (bank = 0; bank <= TopBank; bank = bank + 1)
begin:enable
    always @(reset, addr[0:2]) begin
        ena[bank] = 1'b0;
        if (!reset && addr[0:2] == bank)
            ena[bank] = 1'b1;
    end
    assign data_o = (rd & ena[bank])? dout[bank] : 12'bz;
end
endgenerate

 assign we = reset? 1'b0 : wr;  // Don't allow writes during reset.

 assign data_out = rom_decode? rom_data: data_o;

`endif

endmodule
