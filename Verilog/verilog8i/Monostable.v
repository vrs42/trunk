`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:   Vincent Slyngstad
//
// Create Date:    08:47:07 08/06/10
// Design Name:    
// Module Name:    Monostable
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
module Monostable(Dclk, In, Out);
parameter Ns = 100;
input wire Dclk;   // Delay clock (10ns)
input wire In;     // Data to be delayed
output reg Out;    // Output

integer Count;

always @(posedge Dclk)
begin
    if (In) begin
        Out <= 1;
        Count <= 0;
    end else begin
        Count <= Count + 1;
        if (Count == Ns/10) Out <= 0;
    end
end
endmodule
