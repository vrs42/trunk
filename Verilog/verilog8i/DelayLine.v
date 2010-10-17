`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:   Vincent Slyngstad
//
// Create Date:    08:47:07 08/06/10
// Design Name:    
// Module Name:    DelayLine
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
module DelayLine(Dclk, In, Out);
parameter Ns = 100;
input wire Dclk;   // Delay clock (10ns)
input wire In;      // Data to be delayed
output wire Out;   // Delayed data

reg [1:Ns/10] Bits;
reg Edge;

assign Out = Bits[Ns/10];

// Remember the previous value so we can detect an edge.
// This allows us to generate a fixed-period pulse, no 
// matter how long the input is asserted.
always @(posedge Dclk) begin
  Edge = ~In;
end
always @(posedge Dclk) begin
  Bits = {In & Edge, Bits[1:Ns/10-1]};
end
endmodule
