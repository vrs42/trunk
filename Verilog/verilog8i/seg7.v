`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:    17:32:39 10/28/10
// Design Name:    
// Module Name:    seg7
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
module seg7(bin, out, out_);

input [0:3] bin;

wire [0:15] in;
wire [0:15] in_;
assign in_ = (bin == 4'b0000)? 16'b0111111111111111 :
             (bin == 4'b0001)? 16'b1011111111111111 :
             (bin == 4'b0010)? 16'b1101111111111111 :
             (bin == 4'b0011)? 16'b1110111111111111 :
             (bin == 4'b0100)? 16'b1111011111111111 :
             (bin == 4'b0101)? 16'b1111101111111111 :
             (bin == 4'b0110)? 16'b1111110111111111 :
             (bin == 4'b0111)? 16'b1111111011111111 :
             (bin == 4'b1000)? 16'b1111111101111111 :
             (bin == 4'b1001)? 16'b1111111110111111 :
             (bin == 4'b1010)? 16'b1111111111011111 :
             (bin == 4'b1011)? 16'b1111111111101111 :
             (bin == 4'b1100)? 16'b1111111111110111 :
             (bin == 4'b1101)? 16'b1111111111111011 :
             (bin == 4'b1110)? 16'b1111111111111101 :
                               16'b1111111111111110 ;
assign in = ~in_;

output [0:6] out;
output [0:6] out_;

////                         0123456789AbCdEF
//assign out[6] = (in == 16'b1011011111101011;
assign out[0]  = in[0] &         in[2] & in[3] &         in[5] & in[6] & in[7] & in[8] & in[9] & in[10] &          in[12] &          in[14] & in[15];
assign out_[0] =         in[1] |                 in[4] |                                                  in[11] |          in[13];
//assign out[5] = (in == 16'b1111100111100100;
assign out[1]  = in[0] & in[1] & in[2] & in[3] & in[4] &                 in[7] & in[8] & in[9] & in[10] &                   in[13];
assign out_[1] =                                        in[5] | in[6] |                                   in[11] | in[12] |          in[14] | in[15];
//assign out[4] = (in == 16'b1101111111110100;
assign out[2]  = in[0] & in[1] &         in[3] & in[4] & in[5] & in[6] & in[7] & in[8] & in[9] & in[10] & in[11] &          in[13];
assign out_[2] =                 in[2] |                                                                           in[12] |          in[14] | in[15];
////                         0123456789AbCdEF
//assign out[3] = (in == 16'b1011011011011111;
assign out[3]  = in[0] &         in[2] & in[3] &         in[5] & in[6] &         in[8] & in[9] &          in[11] & in[12] & in[13] & in[14] & in[15];
assign out_[3] =         in[1] |                 in[4] |                 in[7] |                 in[10];
////                         0123456789AbCdEF
//assign out[2] = (in == 16'b1010001011111111;
assign out[4]  = in[0] &         in[2] &                         in[6] &         in[8] & in[9] & in[10] & in[11] & in[12] & in[13] & in[14] & in[15];
assign out_[4] =         in[1] |         in[3] | in[4] | in[5] |         in[7];
////                         0123456789AbCdEF
//assign out[1] = (in == 16'b1000111011111011;
assign out[5]  = in[0] &                         in[4] & in[5] & in[6] &         in[8] & in[9] & in[10] & in[11] & in[12] &          in[14] & in[15];
assign out_[5] =         in[1] | in[2] | in[3] |                         in[7] |                                            in[13];
////                         0123456789AbCdEF
//assign out[0] = (in == 16'b0011111011110111;
assign out[6]  =                 in[2] & in[3] & in[4] & in[5] & in[6] &         in[8] & in[9] & in[10] & in[11] &          in[13] & in[14] & in[15];
assign out_[6] = in[0] | in[1] |                                         in[7] |                                   in[12];

endmodule
