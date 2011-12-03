////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2005 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: H.38
//  \   \         Application: netgen
//  /   /         Filename: seg7_synthesis.v
// /___/   /\     Timestamp: Mon Nov 01 17:15:09 2010
// \   \  /  \ 
//  \___\/\___\
//             
// Command: -intstyle ise -w -ofmt verilog -sim seg7.ngc seg7_synthesis.v 
// Device: xc3s1000-4-ft256
// Design Name: seg7
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Development System Reference Guide, Chapter 23
//     Synthesis and Verification Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module seg7 (
in, out
);
  input [0 : 15] in;
  output [0 : 6] out;
  wire in_14_IBUF;
  wire in_15_IBUF;
  wire in_4_IBUF;
  wire in_3_IBUF;
  wire in_2_IBUF;
  wire in_1_IBUF;
  wire in_0_IBUF;
  wire out_6_OBUF;
  wire out_5_OBUF;
  wire in_5_IBUF;
  wire out_4_OBUF;
  wire in_13_IBUF;
  wire out_3_OBUF;
  wire in_6_IBUF;
  wire out_2_OBUF;
  wire out_1_OBUF;
  wire out_0_OBUF;
  wire in_10_IBUF;
  wire in_7_IBUF;
  wire in_11_IBUF;
  wire in_8_IBUF;
  wire in_12_IBUF;
  wire in_9_IBUF;
  wire N0;
  wire N1;
  wire N2;
  wire N3;
  wire N4;
  wire N15;
  wire N17;
  wire N19;
  defparam _n00221.INIT = 8'h80;
  LUT3 _n00221 (
    .I0(N2),
    .I1(in_10_IBUF),
    .I2(in_7_IBUF),
    .O(out_0_OBUF)
  );
  defparam _n0021.INIT = 16'h8000;
  LUT4 _n0021 (
    .I0(N1),
    .I1(in_7_IBUF),
    .I2(in_2_IBUF),
    .I3(N15),
    .O(out_1_OBUF)
  );
  defparam _n00201.INIT = 16'h8000;
  LUT4 _n00201 (
    .I0(N3),
    .I1(in_0_IBUF),
    .I2(in_7_IBUF),
    .I3(in_1_IBUF),
    .O(out_2_OBUF)
  );
  defparam _n00171.INIT = 8'h80;
  LUT3 _n00171 (
    .I0(N2),
    .I1(in_11_IBUF),
    .I2(in_13_IBUF),
    .O(out_3_OBUF)
  );
  defparam _n00161.INIT = 8'h80;
  LUT3 _n00161 (
    .I0(N4),
    .I1(in_13_IBUF),
    .I2(in_2_IBUF),
    .O(out_4_OBUF)
  );
  defparam _n00151.INIT = 8'h80;
  LUT3 _n00151 (
    .I0(N4),
    .I1(in_4_IBUF),
    .I2(in_5_IBUF),
    .O(out_5_OBUF)
  );
  defparam _n00121.INIT = 16'h8000;
  LUT4 _n00121 (
    .I0(in_14_IBUF),
    .I1(in_15_IBUF),
    .I2(in_2_IBUF),
    .I3(N3),
    .O(out_6_OBUF)
  );
  defparam Ker0.INIT = 16'h8000;
  LUT4 Ker0 (
    .I0(in_9_IBUF),
    .I1(in_8_IBUF),
    .I2(in_6_IBUF),
    .I3(N19),
    .O(N0)
  );
  defparam Ker1.INIT = 16'h8000;
  LUT4 Ker1 (
    .I0(in_9_IBUF),
    .I1(in_8_IBUF),
    .I2(in_4_IBUF),
    .I3(N17),
    .O(N1)
  );
  defparam Ker21.INIT = 16'h8000;
  LUT4 Ker21 (
    .I0(in_2_IBUF),
    .I1(in_5_IBUF),
    .I2(N0),
    .I3(in_3_IBUF),
    .O(N2)
  );
  defparam Ker31.INIT = 16'h8000;
  LUT4 Ker31 (
    .I0(in_5_IBUF),
    .I1(in_11_IBUF),
    .I2(in_6_IBUF),
    .I3(N1),
    .O(N3)
  );
  defparam Ker41.INIT = 8'h80;
  LUT3 Ker41 (
    .I0(N0),
    .I1(in_11_IBUF),
    .I2(in_10_IBUF),
    .O(N4)
  );
  defparam _n0021_SW0.INIT = 4'h8;
  LUT2 _n0021_SW0 (
    .I0(in_1_IBUF),
    .I1(in_0_IBUF),
    .O(N15)
  );
  defparam Ker1_SW0.INIT = 8'h80;
  LUT3 Ker1_SW0 (
    .I0(in_3_IBUF),
    .I1(in_13_IBUF),
    .I2(in_10_IBUF),
    .O(N17)
  );
  defparam Ker0_SW0.INIT = 16'h8000;
  LUT4 Ker0_SW0 (
    .I0(in_15_IBUF),
    .I1(in_14_IBUF),
    .I2(in_12_IBUF),
    .I3(in_0_IBUF),
    .O(N19)
  );
  IBUF in_0_IBUF_0 (
    .I(in[0]),
    .O(in_0_IBUF)
  );
  IBUF in_1_IBUF_1 (
    .I(in[1]),
    .O(in_1_IBUF)
  );
  IBUF in_2_IBUF_2 (
    .I(in[2]),
    .O(in_2_IBUF)
  );
  IBUF in_3_IBUF_3 (
    .I(in[3]),
    .O(in_3_IBUF)
  );
  IBUF in_4_IBUF_4 (
    .I(in[4]),
    .O(in_4_IBUF)
  );
  IBUF in_5_IBUF_5 (
    .I(in[5]),
    .O(in_5_IBUF)
  );
  IBUF in_6_IBUF_6 (
    .I(in[6]),
    .O(in_6_IBUF)
  );
  IBUF in_7_IBUF_7 (
    .I(in[7]),
    .O(in_7_IBUF)
  );
  IBUF in_8_IBUF_8 (
    .I(in[8]),
    .O(in_8_IBUF)
  );
  IBUF in_9_IBUF_9 (
    .I(in[9]),
    .O(in_9_IBUF)
  );
  IBUF in_10_IBUF_10 (
    .I(in[10]),
    .O(in_10_IBUF)
  );
  IBUF in_11_IBUF_11 (
    .I(in[11]),
    .O(in_11_IBUF)
  );
  IBUF in_12_IBUF_12 (
    .I(in[12]),
    .O(in_12_IBUF)
  );
  IBUF in_13_IBUF_13 (
    .I(in[13]),
    .O(in_13_IBUF)
  );
  IBUF in_14_IBUF_14 (
    .I(in[14]),
    .O(in_14_IBUF)
  );
  IBUF in_15_IBUF_15 (
    .I(in[15]),
    .O(in_15_IBUF)
  );
  OBUF out_0_OBUF_16 (
    .I(out_0_OBUF),
    .O(out[0])
  );
  OBUF out_1_OBUF_17 (
    .I(out_1_OBUF),
    .O(out[1])
  );
  OBUF out_2_OBUF_18 (
    .I(out_2_OBUF),
    .O(out[2])
  );
  OBUF out_3_OBUF_19 (
    .I(out_3_OBUF),
    .O(out[3])
  );
  OBUF out_4_OBUF_20 (
    .I(out_4_OBUF),
    .O(out[4])
  );
  OBUF out_5_OBUF_21 (
    .I(out_5_OBUF),
    .O(out[5])
  );
  OBUF out_6_OBUF_22 (
    .I(out_6_OBUF),
    .O(out[6])
  );
endmodule

