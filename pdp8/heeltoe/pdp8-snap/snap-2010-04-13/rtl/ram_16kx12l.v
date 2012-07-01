module pdp8_ram(clk, reset, addr, data_out, data_in, rd, wr);
input clk;
input reset;
input [0:14]addr;
input [0:11]data_in;
output [0:11]data_out;
input rd, wr;

wire [0:11] dout0, dout1, dout2, dout3;
reg ena0, ena1, ena2, ena3;
`ifdef want32k
wire [0:11] dout4, dout5, dout6, dout7;
reg ena4, ena5, ena6, ena7;
`endif
reg [0:11]data_out;
wire we;

//
// This declares a pile of Block RAM.  Basically, 
// RAMnX are defined for X = 0, 1, 2 to be the high, 
// middle and low bits for 4K bank n.
//
// Currently I have this dumbed down to 16K to run on the 
// XC3S200.  `define want32k to get the other 16K.
//
 RAMB16_S4 #(
 ) RAM00 (
    .DO(dout0[0:3]),   // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[0:3]),   // 4-bit Data Input
    .EN(ena0),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM01 (
    .DO(dout0[4:7]),   // 4-bit Data Output
    .ADDR(addr[3:14]),  // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[4:7]),   // 4-bit Data Input
    .EN(ena0),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM02 (
    .DO(dout0[8:11]),  // 4-bit Data Output
    .ADDR(addr[3:14]),  // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[8:11]),  // 4-bit Data Input
    .EN(ena0),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM10 (
    .DO(dout1[0:3]),   // 4-bit Data Output
    .ADDR(addr[3:14]),  // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[0:3]),   // 4-bit Data Input
    .EN(ena1),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM11 (
    .DO(dout1[4:7]),   // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[4:7]),   // 4-bit Data Input
    .EN(ena1),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM12 (
    .DO(dout1[8:11]),  // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[8:11]),  // 4-bit Data Input
    .EN(ena1),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM20 (
    .DO(dout2[0:3]),   // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[0:3]),   // 4-bit Data Input
    .EN(ena2),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM21 (
    .DO(dout2[4:7]),   // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[4:7]),   // 4-bit Data Input
    .EN(ena2),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM22 (
    .DO(dout2[8:11]),  // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[8:11]),  // 4-bit Data Input
    .EN(ena2),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM30 (
    .DO(dout3[0:3]),   // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[0:3]),   // 4-bit Data Input
    .EN(ena3),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM31 (
    .DO(dout3[4:7]),   // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[4:7]),   // 4-bit Data Input
    .EN(ena3),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM32 (
    .DO(dout3[8:11]),  // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[8:11]),  // 4-bit Data Input
    .EN(ena3),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

`ifdef want32k
 RAMB16_S4 #(
 ) RAM40 (
    .DO(dout4[0:3]),   // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[0:3]),   // 4-bit Data Input
    .EN(ena4),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM41 (
    .DO(dout4[4:7]),   // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[4:7]),   // 4-bit Data Input
    .EN(ena4),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM42 (
    .DO(dout4[8:11]),  // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[8:11]),  // 4-bit Data Input
    .EN(ena4),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM50 (
    .DO(dout5[0:3]),   // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[0:3]),   // 4-bit Data Input
    .EN(ena5),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM51 (
    .DO(dout5[4:7]),   // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[4:7]),   // 4-bit Data Input
    .EN(ena5),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM52 (
    .DO(dout5[8:11]),  // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[8:11]),  // 4-bit Data Input
    .EN(ena5),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM60 (
    .DO(dout6[0:3]),   // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[0:3]),   // 4-bit Data Input
    .EN(ena6),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM61 (
    .DO(dout6[4:7]),   // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[4:7]),   // 4-bit Data Input
    .EN(ena6),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM62 (
    .DO(dout6[8:11]),  // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[8:11]),  // 4-bit Data Input
    .EN(ena6),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM70 (
    .DO(dout7[0:3]),   // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[0:3]),   // 4-bit Data Input
    .EN(ena7),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM71 (
    .DO(dout7[4:7]),   // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[4:7]),   // 4-bit Data Input
    .EN(ena7),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );

 RAMB16_S4 #(
 ) RAM72 (
    .DO(dout7[8:11]),  // 4-bit Data Output
    .ADDR(addr[3:14]), // 12-bit Address Input
    .CLK(clk),         // Clock
    .DI(data_in[8:11]),  // 4-bit Data Input
    .EN(ena7),         // RAM Enable Input
    .SSR(1'b0),        // Synchronous Set/Reset Input
    .WE(we)            // Write Enable Input
 );
`endif

 always @(reset, addr[0:2]) begin
    ena0 = 1'b0;
    ena1 = 1'b0;
    ena2 = 1'b0;
    ena3 = 1'b0;
`ifdef want32k
    ena4 = 1'b0;
    ena5 = 1'b0;
    ena6 = 1'b0;
    ena7 = 1'b0;
`endif
    if (!reset)
      case (addr[0:2])
        3'b000: ena0 = 1'b1;
        3'b001: ena1 = 1'b1;
        3'b010: ena2 = 1'b1;
        3'b011: ena3 = 1'b1;
`ifdef want32k
        3'b100: ena4 = 1'b1;
        3'b101: ena5 = 1'b1;
        3'b110: ena6 = 1'b1;
        3'b111: ena7 = 1'b1;
`endif
        default: ;
      endcase
 end

 always @(rd, wr, ena0, dout0, ena1, dout1, ena2, dout2, ena3, dout3
`ifdef want32k
          , ena4, dout4, ena5, dout5, ena6, dout6, ena7, dout7
`endif
          ) begin
    if (rd | wr) 
      data_out = 12'bz;
    else if (ena0 == 1'b1)
      data_out = dout0;
    else if (ena1 == 1'b1)
      data_out = dout1;
    else if (ena2 == 1'b1)
      data_out = dout2;
    else if (ena3 == 1'b1)
      data_out = dout3;
`ifdef want32k
    else if (ena4 == 1'b1)
      data_out = dout4;
    else if (ena5 == 1'b1)
      data_out = dout5;
    else if (ena6 == 1'b1)
      data_out = dout6;
    else if (ena7 == 1'b1)
      data_out = dout7;
`endif
    else
      data_out = 12'o7402;
 end

 assign we = reset? 1'b0 : wr;  // Don't allow writes during reset.

endmodule
