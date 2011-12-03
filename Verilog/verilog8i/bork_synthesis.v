////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2005 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: H.38
//  \   \         Application: netgen
//  /   /         Filename: bork_synthesis.v
// /___/   /\     Timestamp: Tue Oct 12 09:03:02 2010
// \   \  /  \ 
//  \___\/\___\
//             
// Command: -intstyle ise -w -ofmt verilog -sim bork.ngc bork_synthesis.v 
// Device: xc3s1000-4-ft256
// Design Name: bork
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

module bork (
  foo, out
);
  input foo;
  output out;
  wire foo_IBUF;
  wire out_OBUF;
  wire fie;
  INV out1_INV_0 (
    .I(foo_IBUF),
    .O(out_OBUF)
  );
  OBUF out_OBUF_0 (
    .I(out_OBUF),
    .O(out)
  );
  VCC XST_VCC (
    .P(fie)
  );
  IBUF foo_IBUF_1 (
    .I(foo),
    .O(foo_IBUF)
  );
endmodule

