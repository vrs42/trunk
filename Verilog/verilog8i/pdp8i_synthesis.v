////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2005 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: H.38
//  \   \         Application: netgen
//  /   /         Filename: pdp8i_synthesis.v
// /___/   /\     Timestamp: Tue Oct 19 10:46:57 2010
// \   \  /  \ 
//  \___\/\___\
//             
// Command: -intstyle ise -w -ofmt verilog -sim pdp8i.ngc pdp8i_synthesis.v 
// Device: xc3s1000-4-ft256
// Design Name: pdp8i
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

module Monostable_2_1 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire N0;
  wire \Count<0> ;
  wire \Count<31> ;
  wire \Count<30> ;
  wire \Count<24> ;
  wire \Count<29> ;
  wire \Count<23> ;
  wire \Count<28> ;
  wire \Count<22> ;
  wire \Count<27> ;
  wire \Count<21> ;
  wire \Count<26> ;
  wire \Count<20> ;
  wire \Count<25> ;
  wire \Count<14> ;
  wire \Count<19> ;
  wire \Count<13> ;
  wire \Count<18> ;
  wire \Count<12> ;
  wire \Count<17> ;
  wire \Count<11> ;
  wire \Count<16> ;
  wire \Count<10> ;
  wire \Count<15> ;
  wire \Count<4> ;
  wire \Count<9> ;
  wire \Count<3> ;
  wire \Count<8> ;
  wire \Count<2> ;
  wire \Count<7> ;
  wire \Count<1> ;
  wire \Count<6> ;
  wire \Count<5> ;
  wire \Count__n0000<2> ;
  wire CHOICE1989;
  wire \Count__n0000<3> ;
  wire \Count__n0000<1> ;
  wire \Count__n0000<4> ;
  wire \Count__n0000<5> ;
  wire \Count__n0000<6> ;
  wire \Count__n0000<7> ;
  wire \Count__n0000<8> ;
  wire \Count__n0000<9> ;
  wire \Count__n0000<10> ;
  wire \Count__n0000<11> ;
  wire \Count__n0000<12> ;
  wire \Count__n0000<13> ;
  wire \Count__n0000<14> ;
  wire \Count__n0000<15> ;
  wire \Count__n0000<16> ;
  wire \Count__n0000<17> ;
  wire \Count__n0000<18> ;
  wire \Count__n0000<19> ;
  wire \Count__n0000<20> ;
  wire \Count__n0000<21> ;
  wire \Count__n0000<22> ;
  wire \Count__n0000<23> ;
  wire \Count__n0000<24> ;
  wire \Count__n0000<25> ;
  wire \Count__n0000<26> ;
  wire \Count__n0000<27> ;
  wire \Count__n0000<28> ;
  wire \Count__n0000<29> ;
  wire \Count__n0000<30> ;
  wire \Count__n0000<31> ;
  wire N1;
  wire \Monostable_2_Count__n0000<30>_cyo ;
  wire N3;
  wire \Monostable_2_Count__n0000<0>_cyo ;
  wire \Monostable_2_Count__n0000<1>_cyo ;
  wire \Monostable_2_Count__n0000<2>_cyo ;
  wire \Monostable_2_Count__n0000<3>_cyo ;
  wire \Monostable_2_Count__n0000<4>_cyo ;
  wire \Monostable_2_Count__n0000<5>_cyo ;
  wire \Monostable_2_Count__n0000<6>_cyo ;
  wire \Monostable_2_Count__n0000<7>_cyo ;
  wire \Monostable_2_Count__n0000<8>_cyo ;
  wire \Monostable_2_Count__n0000<9>_cyo ;
  wire \Monostable_2_Count__n0000<10>_cyo ;
  wire \Monostable_2_Count__n0000<11>_cyo ;
  wire \Monostable_2_Count__n0000<12>_cyo ;
  wire \Monostable_2_Count__n0000<13>_cyo ;
  wire \Monostable_2_Count__n0000<14>_cyo ;
  wire \Monostable_2_Count__n0000<15>_cyo ;
  wire \Monostable_2_Count__n0000<16>_cyo ;
  wire \Monostable_2_Count__n0000<17>_cyo ;
  wire \Monostable_2_Count__n0000<18>_cyo ;
  wire \Monostable_2_Count__n0000<19>_cyo ;
  wire \Monostable_2_Count__n0000<20>_cyo ;
  wire \Monostable_2_Count__n0000<21>_cyo ;
  wire \Monostable_2_Count__n0000<22>_cyo ;
  wire \Monostable_2_Count__n0000<23>_cyo ;
  wire \Monostable_2_Count__n0000<24>_cyo ;
  wire \Monostable_2_Count__n0000<25>_cyo ;
  wire \Monostable_2_Count__n0000<26>_cyo ;
  wire \Monostable_2_Count__n0000<27>_cyo ;
  wire \Monostable_2_Count__n0000<28>_cyo ;
  wire \Monostable_2_Count__n0000<29>_cyo ;
  wire N7;
  wire N31;
  wire CHOICE1993;
  wire CHOICE2410;
  wire CHOICE2381;
  wire CHOICE2404;
  wire CHOICE2394;
  wire CHOICE2387;
  wire CHOICE2401;
  wire Count_1_rt;
  wire Count_2_rt;
  wire Count_3_rt;
  wire Count_4_rt;
  wire Count_5_rt;
  wire Count_6_rt;
  wire Count_7_rt;
  wire Count_8_rt;
  wire Count_9_rt;
  wire Count_10_rt;
  wire Count_11_rt;
  wire Count_12_rt;
  wire Count_13_rt;
  wire Count_14_rt;
  wire Count_15_rt;
  wire Count_16_rt;
  wire Count_17_rt;
  wire Count_18_rt;
  wire Count_19_rt;
  wire Count_20_rt;
  wire Count_21_rt;
  wire Count_22_rt;
  wire Count_23_rt;
  wire Count_24_rt;
  wire Count_25_rt;
  wire Count_26_rt;
  wire Count_27_rt;
  wire Count_28_rt;
  wire Count_29_rt;
  wire Count_30_rt;
  wire Count_31_rt;
  GND XST_GND (
    .G(N0)
  );
  defparam _n0000915.INIT = 16'hFFEF;
  LUT4 _n0000915 (
    .I0(\Count<29> ),
    .I1(\Count<19> ),
    .I2(\Count<9> ),
    .I3(\Count<8> ),
    .O(CHOICE1993)
  );
  FDR Count_30 (
    .D(\Count__n0000<30> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<30> )
  );
  FDSE Out_0 (
    .D(N0),
    .S(In),
    .CE(_n0000),
    .C(Dclk),
    .Q(Out)
  );
  FDR Count_31 (
    .D(\Count__n0000<31> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<31> )
  );
  XORCY \Monostable_2_Count__n0000<31>_xor  (
    .CI(\Monostable_2_Count__n0000<30>_cyo ),
    .LI(Count_31_rt),
    .O(\Count__n0000<31> )
  );
  FDR Count_0 (
    .D(N3),
    .R(In),
    .C(Dclk),
    .Q(\Count<0> )
  );
  FDR Count_1 (
    .D(\Count__n0000<1> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<1> )
  );
  FDR Count_2 (
    .D(\Count__n0000<2> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<2> )
  );
  FDR Count_3 (
    .D(\Count__n0000<3> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<3> )
  );
  FDR Count_4 (
    .D(\Count__n0000<4> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<4> )
  );
  FDR Count_5 (
    .D(\Count__n0000<5> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<5> )
  );
  FDR Count_6 (
    .D(\Count__n0000<6> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<6> )
  );
  FDR Count_7 (
    .D(\Count__n0000<7> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<7> )
  );
  FDR Count_8 (
    .D(\Count__n0000<8> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<8> )
  );
  FDR Count_9 (
    .D(\Count__n0000<9> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<9> )
  );
  FDR Count_10 (
    .D(\Count__n0000<10> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<10> )
  );
  FDR Count_11 (
    .D(\Count__n0000<11> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<11> )
  );
  FDR Count_12 (
    .D(\Count__n0000<12> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<12> )
  );
  FDR Count_13 (
    .D(\Count__n0000<13> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<13> )
  );
  FDR Count_14 (
    .D(\Count__n0000<14> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<14> )
  );
  FDR Count_15 (
    .D(\Count__n0000<15> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<15> )
  );
  FDR Count_16 (
    .D(\Count__n0000<16> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<16> )
  );
  FDR Count_17 (
    .D(\Count__n0000<17> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<17> )
  );
  FDR Count_18 (
    .D(\Count__n0000<18> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<18> )
  );
  FDR Count_19 (
    .D(\Count__n0000<19> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<19> )
  );
  FDR Count_20 (
    .D(\Count__n0000<20> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<20> )
  );
  FDR Count_21 (
    .D(\Count__n0000<21> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<21> )
  );
  FDR Count_22 (
    .D(\Count__n0000<22> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<22> )
  );
  FDR Count_23 (
    .D(\Count__n0000<23> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<23> )
  );
  FDR Count_24 (
    .D(\Count__n0000<24> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<24> )
  );
  FDR Count_25 (
    .D(\Count__n0000<25> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<25> )
  );
  FDR Count_26 (
    .D(\Count__n0000<26> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<26> )
  );
  FDR Count_27 (
    .D(\Count__n0000<27> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<27> )
  );
  FDR Count_28 (
    .D(\Count__n0000<28> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<28> )
  );
  FDR Count_29 (
    .D(\Count__n0000<29> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<29> )
  );
  VCC XST_VCC (
    .P(N1)
  );
  defparam \Monostable_2_Count__n0000<0>lut .INIT = 4'h1;
  LUT1 \Monostable_2_Count__n0000<0>lut  (
    .I0(\Count<0> ),
    .O(N3)
  );
  MUXCY \Monostable_2_Count__n0000<0>cy  (
    .CI(N0),
    .DI(N1),
    .S(N3),
    .O(\Monostable_2_Count__n0000<0>_cyo )
  );
  defparam _n0000531.INIT = 16'hEFFF;
  LUT4 _n0000531 (
    .I0(\Count<25> ),
    .I1(\Count<4> ),
    .I2(\Count<15> ),
    .I3(\Count<5> ),
    .O(CHOICE2410)
  );
  MUXCY \Monostable_2_Count__n0000<1>cy  (
    .CI(\Monostable_2_Count__n0000<0>_cyo ),
    .DI(N0),
    .S(Count_1_rt),
    .O(\Monostable_2_Count__n0000<1>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<1>_xor  (
    .CI(\Monostable_2_Count__n0000<0>_cyo ),
    .LI(Count_1_rt),
    .O(\Count__n0000<1> )
  );
  MUXCY \Monostable_2_Count__n0000<2>cy  (
    .CI(\Monostable_2_Count__n0000<1>_cyo ),
    .DI(N0),
    .S(Count_2_rt),
    .O(\Monostable_2_Count__n0000<2>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<2>_xor  (
    .CI(\Monostable_2_Count__n0000<1>_cyo ),
    .LI(Count_2_rt),
    .O(\Count__n0000<2> )
  );
  MUXCY \Monostable_2_Count__n0000<3>cy  (
    .CI(\Monostable_2_Count__n0000<2>_cyo ),
    .DI(N0),
    .S(Count_3_rt),
    .O(\Monostable_2_Count__n0000<3>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<3>_xor  (
    .CI(\Monostable_2_Count__n0000<2>_cyo ),
    .LI(Count_3_rt),
    .O(\Count__n0000<3> )
  );
  MUXCY \Monostable_2_Count__n0000<4>cy  (
    .CI(\Monostable_2_Count__n0000<3>_cyo ),
    .DI(N0),
    .S(Count_4_rt),
    .O(\Monostable_2_Count__n0000<4>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<4>_xor  (
    .CI(\Monostable_2_Count__n0000<3>_cyo ),
    .LI(Count_4_rt),
    .O(\Count__n0000<4> )
  );
  MUXCY \Monostable_2_Count__n0000<5>cy  (
    .CI(\Monostable_2_Count__n0000<4>_cyo ),
    .DI(N0),
    .S(Count_5_rt),
    .O(\Monostable_2_Count__n0000<5>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<5>_xor  (
    .CI(\Monostable_2_Count__n0000<4>_cyo ),
    .LI(Count_5_rt),
    .O(\Count__n0000<5> )
  );
  MUXCY \Monostable_2_Count__n0000<6>cy  (
    .CI(\Monostable_2_Count__n0000<5>_cyo ),
    .DI(N0),
    .S(Count_6_rt),
    .O(\Monostable_2_Count__n0000<6>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<6>_xor  (
    .CI(\Monostable_2_Count__n0000<5>_cyo ),
    .LI(Count_6_rt),
    .O(\Count__n0000<6> )
  );
  MUXCY \Monostable_2_Count__n0000<7>cy  (
    .CI(\Monostable_2_Count__n0000<6>_cyo ),
    .DI(N0),
    .S(Count_7_rt),
    .O(\Monostable_2_Count__n0000<7>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<7>_xor  (
    .CI(\Monostable_2_Count__n0000<6>_cyo ),
    .LI(Count_7_rt),
    .O(\Count__n0000<7> )
  );
  MUXCY \Monostable_2_Count__n0000<8>cy  (
    .CI(\Monostable_2_Count__n0000<7>_cyo ),
    .DI(N0),
    .S(Count_8_rt),
    .O(\Monostable_2_Count__n0000<8>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<8>_xor  (
    .CI(\Monostable_2_Count__n0000<7>_cyo ),
    .LI(Count_8_rt),
    .O(\Count__n0000<8> )
  );
  MUXCY \Monostable_2_Count__n0000<9>cy  (
    .CI(\Monostable_2_Count__n0000<8>_cyo ),
    .DI(N0),
    .S(Count_9_rt),
    .O(\Monostable_2_Count__n0000<9>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<9>_xor  (
    .CI(\Monostable_2_Count__n0000<8>_cyo ),
    .LI(Count_9_rt),
    .O(\Count__n0000<9> )
  );
  MUXCY \Monostable_2_Count__n0000<10>cy  (
    .CI(\Monostable_2_Count__n0000<9>_cyo ),
    .DI(N0),
    .S(Count_10_rt),
    .O(\Monostable_2_Count__n0000<10>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<10>_xor  (
    .CI(\Monostable_2_Count__n0000<9>_cyo ),
    .LI(Count_10_rt),
    .O(\Count__n0000<10> )
  );
  MUXCY \Monostable_2_Count__n0000<11>cy  (
    .CI(\Monostable_2_Count__n0000<10>_cyo ),
    .DI(N0),
    .S(Count_11_rt),
    .O(\Monostable_2_Count__n0000<11>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<11>_xor  (
    .CI(\Monostable_2_Count__n0000<10>_cyo ),
    .LI(Count_11_rt),
    .O(\Count__n0000<11> )
  );
  MUXCY \Monostable_2_Count__n0000<12>cy  (
    .CI(\Monostable_2_Count__n0000<11>_cyo ),
    .DI(N0),
    .S(Count_12_rt),
    .O(\Monostable_2_Count__n0000<12>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<12>_xor  (
    .CI(\Monostable_2_Count__n0000<11>_cyo ),
    .LI(Count_12_rt),
    .O(\Count__n0000<12> )
  );
  MUXCY \Monostable_2_Count__n0000<13>cy  (
    .CI(\Monostable_2_Count__n0000<12>_cyo ),
    .DI(N0),
    .S(Count_13_rt),
    .O(\Monostable_2_Count__n0000<13>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<13>_xor  (
    .CI(\Monostable_2_Count__n0000<12>_cyo ),
    .LI(Count_13_rt),
    .O(\Count__n0000<13> )
  );
  MUXCY \Monostable_2_Count__n0000<14>cy  (
    .CI(\Monostable_2_Count__n0000<13>_cyo ),
    .DI(N0),
    .S(Count_14_rt),
    .O(\Monostable_2_Count__n0000<14>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<14>_xor  (
    .CI(\Monostable_2_Count__n0000<13>_cyo ),
    .LI(Count_14_rt),
    .O(\Count__n0000<14> )
  );
  MUXCY \Monostable_2_Count__n0000<15>cy  (
    .CI(\Monostable_2_Count__n0000<14>_cyo ),
    .DI(N0),
    .S(Count_15_rt),
    .O(\Monostable_2_Count__n0000<15>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<15>_xor  (
    .CI(\Monostable_2_Count__n0000<14>_cyo ),
    .LI(Count_15_rt),
    .O(\Count__n0000<15> )
  );
  MUXCY \Monostable_2_Count__n0000<16>cy  (
    .CI(\Monostable_2_Count__n0000<15>_cyo ),
    .DI(N0),
    .S(Count_16_rt),
    .O(\Monostable_2_Count__n0000<16>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<16>_xor  (
    .CI(\Monostable_2_Count__n0000<15>_cyo ),
    .LI(Count_16_rt),
    .O(\Count__n0000<16> )
  );
  MUXCY \Monostable_2_Count__n0000<17>cy  (
    .CI(\Monostable_2_Count__n0000<16>_cyo ),
    .DI(N0),
    .S(Count_17_rt),
    .O(\Monostable_2_Count__n0000<17>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<17>_xor  (
    .CI(\Monostable_2_Count__n0000<16>_cyo ),
    .LI(Count_17_rt),
    .O(\Count__n0000<17> )
  );
  MUXCY \Monostable_2_Count__n0000<18>cy  (
    .CI(\Monostable_2_Count__n0000<17>_cyo ),
    .DI(N0),
    .S(Count_18_rt),
    .O(\Monostable_2_Count__n0000<18>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<18>_xor  (
    .CI(\Monostable_2_Count__n0000<17>_cyo ),
    .LI(Count_18_rt),
    .O(\Count__n0000<18> )
  );
  MUXCY \Monostable_2_Count__n0000<19>cy  (
    .CI(\Monostable_2_Count__n0000<18>_cyo ),
    .DI(N0),
    .S(Count_19_rt),
    .O(\Monostable_2_Count__n0000<19>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<19>_xor  (
    .CI(\Monostable_2_Count__n0000<18>_cyo ),
    .LI(Count_19_rt),
    .O(\Count__n0000<19> )
  );
  MUXCY \Monostable_2_Count__n0000<20>cy  (
    .CI(\Monostable_2_Count__n0000<19>_cyo ),
    .DI(N0),
    .S(Count_20_rt),
    .O(\Monostable_2_Count__n0000<20>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<20>_xor  (
    .CI(\Monostable_2_Count__n0000<19>_cyo ),
    .LI(Count_20_rt),
    .O(\Count__n0000<20> )
  );
  MUXCY \Monostable_2_Count__n0000<21>cy  (
    .CI(\Monostable_2_Count__n0000<20>_cyo ),
    .DI(N0),
    .S(Count_21_rt),
    .O(\Monostable_2_Count__n0000<21>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<21>_xor  (
    .CI(\Monostable_2_Count__n0000<20>_cyo ),
    .LI(Count_21_rt),
    .O(\Count__n0000<21> )
  );
  MUXCY \Monostable_2_Count__n0000<22>cy  (
    .CI(\Monostable_2_Count__n0000<21>_cyo ),
    .DI(N0),
    .S(Count_22_rt),
    .O(\Monostable_2_Count__n0000<22>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<22>_xor  (
    .CI(\Monostable_2_Count__n0000<21>_cyo ),
    .LI(Count_22_rt),
    .O(\Count__n0000<22> )
  );
  MUXCY \Monostable_2_Count__n0000<23>cy  (
    .CI(\Monostable_2_Count__n0000<22>_cyo ),
    .DI(N0),
    .S(Count_23_rt),
    .O(\Monostable_2_Count__n0000<23>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<23>_xor  (
    .CI(\Monostable_2_Count__n0000<22>_cyo ),
    .LI(Count_23_rt),
    .O(\Count__n0000<23> )
  );
  MUXCY \Monostable_2_Count__n0000<24>cy  (
    .CI(\Monostable_2_Count__n0000<23>_cyo ),
    .DI(N0),
    .S(Count_24_rt),
    .O(\Monostable_2_Count__n0000<24>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<24>_xor  (
    .CI(\Monostable_2_Count__n0000<23>_cyo ),
    .LI(Count_24_rt),
    .O(\Count__n0000<24> )
  );
  MUXCY \Monostable_2_Count__n0000<25>cy  (
    .CI(\Monostable_2_Count__n0000<24>_cyo ),
    .DI(N0),
    .S(Count_25_rt),
    .O(\Monostable_2_Count__n0000<25>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<25>_xor  (
    .CI(\Monostable_2_Count__n0000<24>_cyo ),
    .LI(Count_25_rt),
    .O(\Count__n0000<25> )
  );
  MUXCY \Monostable_2_Count__n0000<26>cy  (
    .CI(\Monostable_2_Count__n0000<25>_cyo ),
    .DI(N0),
    .S(Count_26_rt),
    .O(\Monostable_2_Count__n0000<26>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<26>_xor  (
    .CI(\Monostable_2_Count__n0000<25>_cyo ),
    .LI(Count_26_rt),
    .O(\Count__n0000<26> )
  );
  MUXCY \Monostable_2_Count__n0000<27>cy  (
    .CI(\Monostable_2_Count__n0000<26>_cyo ),
    .DI(N0),
    .S(Count_27_rt),
    .O(\Monostable_2_Count__n0000<27>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<27>_xor  (
    .CI(\Monostable_2_Count__n0000<26>_cyo ),
    .LI(Count_27_rt),
    .O(\Count__n0000<27> )
  );
  MUXCY \Monostable_2_Count__n0000<28>cy  (
    .CI(\Monostable_2_Count__n0000<27>_cyo ),
    .DI(N0),
    .S(Count_28_rt),
    .O(\Monostable_2_Count__n0000<28>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<28>_xor  (
    .CI(\Monostable_2_Count__n0000<27>_cyo ),
    .LI(Count_28_rt),
    .O(\Count__n0000<28> )
  );
  MUXCY \Monostable_2_Count__n0000<29>cy  (
    .CI(\Monostable_2_Count__n0000<28>_cyo ),
    .DI(N0),
    .S(Count_29_rt),
    .O(\Monostable_2_Count__n0000<29>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<29>_xor  (
    .CI(\Monostable_2_Count__n0000<28>_cyo ),
    .LI(Count_29_rt),
    .O(\Count__n0000<29> )
  );
  MUXCY \Monostable_2_Count__n0000<30>cy  (
    .CI(\Monostable_2_Count__n0000<29>_cyo ),
    .DI(N0),
    .S(Count_30_rt),
    .O(\Monostable_2_Count__n0000<30>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<30>_xor  (
    .CI(\Monostable_2_Count__n0000<29>_cyo ),
    .LI(Count_30_rt),
    .O(\Count__n0000<30> )
  );
  defparam _n0000540.INIT = 16'hFFFE;
  LUT4 _n0000540 (
    .I0(CHOICE2401),
    .I1(CHOICE2404),
    .I2(CHOICE2410),
    .I3(N7),
    .O(N31)
  );
  defparam _n0000170.INIT = 16'h4000;
  LUT4 _n0000170 (
    .I0(N31),
    .I1(CHOICE2381),
    .I2(CHOICE2387),
    .I3(CHOICE2394),
    .O(_n0000)
  );
  defparam _n0000512.INIT = 16'hFFFE;
  LUT4 _n0000512 (
    .I0(\Count<23> ),
    .I1(\Count<3> ),
    .I2(\Count<14> ),
    .I3(\Count<24> ),
    .O(CHOICE2404)
  );
  defparam _n0000916.INIT = 4'hE;
  LUT2 _n0000916 (
    .I0(CHOICE1989),
    .I1(CHOICE1993),
    .O(N7)
  );
  defparam _n000097.INIT = 16'hFFEF;
  LUT4 _n000097 (
    .I0(\Count<27> ),
    .I1(\Count<28> ),
    .I2(\Count<7> ),
    .I3(\Count<18> ),
    .O(CHOICE1989)
  );
  defparam _n0000113.INIT = 16'h0001;
  LUT4 _n0000113 (
    .I0(\Count<12> ),
    .I1(\Count<22> ),
    .I2(\Count<2> ),
    .I3(\Count<13> ),
    .O(CHOICE2381)
  );
  defparam _n0000125.INIT = 16'h0002;
  LUT4 _n0000125 (
    .I0(\Count<10> ),
    .I1(\Count<20> ),
    .I2(\Count<30> ),
    .I3(\Count<0> ),
    .O(CHOICE2387)
  );
  defparam _n0000138.INIT = 16'h0001;
  LUT4 _n0000138 (
    .I0(\Count<11> ),
    .I1(\Count<21> ),
    .I2(\Count<31> ),
    .I3(\Count<1> ),
    .O(CHOICE2394)
  );
  defparam _n000057.INIT = 16'hFFEF;
  LUT4 _n000057 (
    .I0(\Count<26> ),
    .I1(\Count<17> ),
    .I2(\Count<16> ),
    .I3(\Count<6> ),
    .O(CHOICE2401)
  );
  defparam Count_1_rt_1.INIT = 4'h2;
  LUT1 Count_1_rt_1 (
    .I0(\Count<1> ),
    .O(Count_1_rt)
  );
  defparam Count_2_rt_2.INIT = 4'h2;
  LUT1 Count_2_rt_2 (
    .I0(\Count<2> ),
    .O(Count_2_rt)
  );
  defparam Count_3_rt_3.INIT = 4'h2;
  LUT1 Count_3_rt_3 (
    .I0(\Count<3> ),
    .O(Count_3_rt)
  );
  defparam Count_4_rt_4.INIT = 4'h2;
  LUT1 Count_4_rt_4 (
    .I0(\Count<4> ),
    .O(Count_4_rt)
  );
  defparam Count_5_rt_5.INIT = 4'h2;
  LUT1 Count_5_rt_5 (
    .I0(\Count<5> ),
    .O(Count_5_rt)
  );
  defparam Count_6_rt_6.INIT = 4'h2;
  LUT1 Count_6_rt_6 (
    .I0(\Count<6> ),
    .O(Count_6_rt)
  );
  defparam Count_7_rt_7.INIT = 4'h2;
  LUT1 Count_7_rt_7 (
    .I0(\Count<7> ),
    .O(Count_7_rt)
  );
  defparam Count_8_rt_8.INIT = 4'h2;
  LUT1 Count_8_rt_8 (
    .I0(\Count<8> ),
    .O(Count_8_rt)
  );
  defparam Count_9_rt_9.INIT = 4'h2;
  LUT1 Count_9_rt_9 (
    .I0(\Count<9> ),
    .O(Count_9_rt)
  );
  defparam Count_10_rt_10.INIT = 4'h2;
  LUT1 Count_10_rt_10 (
    .I0(\Count<10> ),
    .O(Count_10_rt)
  );
  defparam Count_11_rt_11.INIT = 4'h2;
  LUT1 Count_11_rt_11 (
    .I0(\Count<11> ),
    .O(Count_11_rt)
  );
  defparam Count_12_rt_12.INIT = 4'h2;
  LUT1 Count_12_rt_12 (
    .I0(\Count<12> ),
    .O(Count_12_rt)
  );
  defparam Count_13_rt_13.INIT = 4'h2;
  LUT1 Count_13_rt_13 (
    .I0(\Count<13> ),
    .O(Count_13_rt)
  );
  defparam Count_14_rt_14.INIT = 4'h2;
  LUT1 Count_14_rt_14 (
    .I0(\Count<14> ),
    .O(Count_14_rt)
  );
  defparam Count_15_rt_15.INIT = 4'h2;
  LUT1 Count_15_rt_15 (
    .I0(\Count<15> ),
    .O(Count_15_rt)
  );
  defparam Count_16_rt_16.INIT = 4'h2;
  LUT1 Count_16_rt_16 (
    .I0(\Count<16> ),
    .O(Count_16_rt)
  );
  defparam Count_17_rt_17.INIT = 4'h2;
  LUT1 Count_17_rt_17 (
    .I0(\Count<17> ),
    .O(Count_17_rt)
  );
  defparam Count_18_rt_18.INIT = 4'h2;
  LUT1 Count_18_rt_18 (
    .I0(\Count<18> ),
    .O(Count_18_rt)
  );
  defparam Count_19_rt_19.INIT = 4'h2;
  LUT1 Count_19_rt_19 (
    .I0(\Count<19> ),
    .O(Count_19_rt)
  );
  defparam Count_20_rt_20.INIT = 4'h2;
  LUT1 Count_20_rt_20 (
    .I0(\Count<20> ),
    .O(Count_20_rt)
  );
  defparam Count_21_rt_21.INIT = 4'h2;
  LUT1 Count_21_rt_21 (
    .I0(\Count<21> ),
    .O(Count_21_rt)
  );
  defparam Count_22_rt_22.INIT = 4'h2;
  LUT1 Count_22_rt_22 (
    .I0(\Count<22> ),
    .O(Count_22_rt)
  );
  defparam Count_23_rt_23.INIT = 4'h2;
  LUT1 Count_23_rt_23 (
    .I0(\Count<23> ),
    .O(Count_23_rt)
  );
  defparam Count_24_rt_24.INIT = 4'h2;
  LUT1 Count_24_rt_24 (
    .I0(\Count<24> ),
    .O(Count_24_rt)
  );
  defparam Count_25_rt_25.INIT = 4'h2;
  LUT1 Count_25_rt_25 (
    .I0(\Count<25> ),
    .O(Count_25_rt)
  );
  defparam Count_26_rt_26.INIT = 4'h2;
  LUT1 Count_26_rt_26 (
    .I0(\Count<26> ),
    .O(Count_26_rt)
  );
  defparam Count_27_rt_27.INIT = 4'h2;
  LUT1 Count_27_rt_27 (
    .I0(\Count<27> ),
    .O(Count_27_rt)
  );
  defparam Count_28_rt_28.INIT = 4'h2;
  LUT1 Count_28_rt_28 (
    .I0(\Count<28> ),
    .O(Count_28_rt)
  );
  defparam Count_29_rt_29.INIT = 4'h2;
  LUT1 Count_29_rt_29 (
    .I0(\Count<29> ),
    .O(Count_29_rt)
  );
  defparam Count_30_rt_30.INIT = 4'h2;
  LUT1 Count_30_rt_30 (
    .I0(\Count<30> ),
    .O(Count_30_rt)
  );
  defparam Count_31_rt_31.INIT = 4'h2;
  LUT1 Count_31_rt_31 (
    .I0(\Count<31> ),
    .O(Count_31_rt)
  );
endmodule

module DelayLine_4_6 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<40>__net44 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<40>__net42 ;
  wire \Mshreg_Bits<40>__net45 ;
  wire \NLW_Mshreg_Bits<40>_srl_21_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<40>_srl_19_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<40>_srl_20_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<40>_srl_21  (
    .A0(N1),
    .A1(N0),
    .A2(N0),
    .A3(N1),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<40>__net44 ),
    .Q(\Mshreg_Bits<40>__net45 ),
    .Q15(\NLW_Mshreg_Bits<40>_srl_21_Q15_UNCONNECTED )
  );
  FDR Edge_32 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<40>_0  (
    .D(\Mshreg_Bits<40>__net45 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<40>_srl_19  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<40>_srl_19_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<40>__net42 )
  );
  SRLC16E \Mshreg_Bits<40>_srl_20  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<40>__net42 ),
    .Q(\NLW_Mshreg_Bits<40>_srl_20_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<40>__net44 )
  );
endmodule

module Monostable_1 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire N0;
  wire \Count<0> ;
  wire \Count<31> ;
  wire \Count<30> ;
  wire \Count<24> ;
  wire \Count<29> ;
  wire \Count<23> ;
  wire \Count<28> ;
  wire \Count<22> ;
  wire \Count<27> ;
  wire \Count<21> ;
  wire \Count<26> ;
  wire \Count<20> ;
  wire \Count<25> ;
  wire \Count<14> ;
  wire \Count<19> ;
  wire \Count<13> ;
  wire \Count<18> ;
  wire \Count<12> ;
  wire \Count<17> ;
  wire \Count<11> ;
  wire \Count<16> ;
  wire \Count<10> ;
  wire \Count<15> ;
  wire \Count<4> ;
  wire \Count<9> ;
  wire \Count<3> ;
  wire \Count<8> ;
  wire \Count<2> ;
  wire \Count<7> ;
  wire \Count<1> ;
  wire \Count<6> ;
  wire \Count<5> ;
  wire \Count__n0000<2> ;
  wire CHOICE1979;
  wire \Count__n0000<3> ;
  wire \Count__n0000<1> ;
  wire \Count__n0000<4> ;
  wire \Count__n0000<5> ;
  wire \Count__n0000<6> ;
  wire \Count__n0000<7> ;
  wire \Count__n0000<8> ;
  wire \Count__n0000<9> ;
  wire \Count__n0000<10> ;
  wire \Count__n0000<11> ;
  wire \Count__n0000<12> ;
  wire \Count__n0000<13> ;
  wire \Count__n0000<14> ;
  wire \Count__n0000<15> ;
  wire \Count__n0000<16> ;
  wire \Count__n0000<17> ;
  wire \Count__n0000<18> ;
  wire \Count__n0000<19> ;
  wire \Count__n0000<20> ;
  wire \Count__n0000<21> ;
  wire \Count__n0000<22> ;
  wire \Count__n0000<23> ;
  wire \Count__n0000<24> ;
  wire \Count__n0000<25> ;
  wire \Count__n0000<26> ;
  wire \Count__n0000<27> ;
  wire \Count__n0000<28> ;
  wire \Count__n0000<29> ;
  wire \Count__n0000<30> ;
  wire \Count__n0000<31> ;
  wire N1;
  wire \Monostable_1_Count__n0000<30>_cyo ;
  wire N3;
  wire \Monostable_1_Count__n0000<0>_cyo ;
  wire \Monostable_1_Count__n0000<1>_cyo ;
  wire \Monostable_1_Count__n0000<2>_cyo ;
  wire \Monostable_1_Count__n0000<3>_cyo ;
  wire \Monostable_1_Count__n0000<4>_cyo ;
  wire \Monostable_1_Count__n0000<5>_cyo ;
  wire \Monostable_1_Count__n0000<6>_cyo ;
  wire \Monostable_1_Count__n0000<7>_cyo ;
  wire \Monostable_1_Count__n0000<8>_cyo ;
  wire \Monostable_1_Count__n0000<9>_cyo ;
  wire \Monostable_1_Count__n0000<10>_cyo ;
  wire \Monostable_1_Count__n0000<11>_cyo ;
  wire \Monostable_1_Count__n0000<12>_cyo ;
  wire \Monostable_1_Count__n0000<13>_cyo ;
  wire \Monostable_1_Count__n0000<14>_cyo ;
  wire \Monostable_1_Count__n0000<15>_cyo ;
  wire \Monostable_1_Count__n0000<16>_cyo ;
  wire \Monostable_1_Count__n0000<17>_cyo ;
  wire \Monostable_1_Count__n0000<18>_cyo ;
  wire \Monostable_1_Count__n0000<19>_cyo ;
  wire \Monostable_1_Count__n0000<20>_cyo ;
  wire \Monostable_1_Count__n0000<21>_cyo ;
  wire \Monostable_1_Count__n0000<22>_cyo ;
  wire \Monostable_1_Count__n0000<23>_cyo ;
  wire \Monostable_1_Count__n0000<24>_cyo ;
  wire \Monostable_1_Count__n0000<25>_cyo ;
  wire \Monostable_1_Count__n0000<26>_cyo ;
  wire \Monostable_1_Count__n0000<27>_cyo ;
  wire \Monostable_1_Count__n0000<28>_cyo ;
  wire \Monostable_1_Count__n0000<29>_cyo ;
  wire N7;
  wire N31;
  wire CHOICE2348;
  wire CHOICE2364;
  wire CHOICE2343;
  wire CHOICE2358;
  wire CHOICE1984;
  wire CHOICE2370;
  wire CHOICE2340;
  wire Count_1_rt;
  wire Count_2_rt;
  wire Count_3_rt;
  wire Count_4_rt;
  wire Count_5_rt;
  wire Count_6_rt;
  wire Count_7_rt;
  wire Count_8_rt;
  wire Count_9_rt;
  wire Count_10_rt;
  wire Count_11_rt;
  wire Count_12_rt;
  wire Count_13_rt;
  wire Count_14_rt;
  wire Count_15_rt;
  wire Count_16_rt;
  wire Count_17_rt;
  wire Count_18_rt;
  wire Count_19_rt;
  wire Count_20_rt;
  wire Count_21_rt;
  wire Count_22_rt;
  wire Count_23_rt;
  wire Count_24_rt;
  wire Count_25_rt;
  wire Count_26_rt;
  wire Count_27_rt;
  wire Count_28_rt;
  wire Count_29_rt;
  wire Count_30_rt;
  wire Count_31_rt;
  GND XST_GND (
    .G(N0)
  );
  defparam _n000059.INIT = 16'hFFFE;
  LUT4 _n000059 (
    .I0(\Count<23> ),
    .I1(\Count<3> ),
    .I2(\Count<14> ),
    .I3(\Count<24> ),
    .O(CHOICE2343)
  );
  FDR Count_30 (
    .D(\Count__n0000<30> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<30> )
  );
  FDSE Out_33 (
    .D(N0),
    .S(In),
    .CE(_n0000),
    .C(Dclk),
    .Q(Out)
  );
  FDR Count_31 (
    .D(\Count__n0000<31> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<31> )
  );
  XORCY \Monostable_1_Count__n0000<31>_xor  (
    .CI(\Monostable_1_Count__n0000<30>_cyo ),
    .LI(Count_31_rt),
    .O(\Count__n0000<31> )
  );
  FDR Count_0 (
    .D(N3),
    .R(In),
    .C(Dclk),
    .Q(\Count<0> )
  );
  FDR Count_1 (
    .D(\Count__n0000<1> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<1> )
  );
  FDR Count_2 (
    .D(\Count__n0000<2> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<2> )
  );
  FDR Count_3 (
    .D(\Count__n0000<3> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<3> )
  );
  FDR Count_4 (
    .D(\Count__n0000<4> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<4> )
  );
  FDR Count_5 (
    .D(\Count__n0000<5> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<5> )
  );
  FDR Count_6 (
    .D(\Count__n0000<6> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<6> )
  );
  FDR Count_7 (
    .D(\Count__n0000<7> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<7> )
  );
  FDR Count_8 (
    .D(\Count__n0000<8> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<8> )
  );
  FDR Count_9 (
    .D(\Count__n0000<9> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<9> )
  );
  FDR Count_10 (
    .D(\Count__n0000<10> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<10> )
  );
  FDR Count_11 (
    .D(\Count__n0000<11> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<11> )
  );
  FDR Count_12 (
    .D(\Count__n0000<12> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<12> )
  );
  FDR Count_13 (
    .D(\Count__n0000<13> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<13> )
  );
  FDR Count_14 (
    .D(\Count__n0000<14> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<14> )
  );
  FDR Count_15 (
    .D(\Count__n0000<15> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<15> )
  );
  FDR Count_16 (
    .D(\Count__n0000<16> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<16> )
  );
  FDR Count_17 (
    .D(\Count__n0000<17> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<17> )
  );
  FDR Count_18 (
    .D(\Count__n0000<18> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<18> )
  );
  FDR Count_19 (
    .D(\Count__n0000<19> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<19> )
  );
  FDR Count_20 (
    .D(\Count__n0000<20> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<20> )
  );
  FDR Count_21 (
    .D(\Count__n0000<21> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<21> )
  );
  FDR Count_22 (
    .D(\Count__n0000<22> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<22> )
  );
  FDR Count_23 (
    .D(\Count__n0000<23> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<23> )
  );
  FDR Count_24 (
    .D(\Count__n0000<24> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<24> )
  );
  FDR Count_25 (
    .D(\Count__n0000<25> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<25> )
  );
  FDR Count_26 (
    .D(\Count__n0000<26> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<26> )
  );
  FDR Count_27 (
    .D(\Count__n0000<27> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<27> )
  );
  FDR Count_28 (
    .D(\Count__n0000<28> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<28> )
  );
  FDR Count_29 (
    .D(\Count__n0000<29> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<29> )
  );
  VCC XST_VCC (
    .P(N1)
  );
  defparam \Monostable_1_Count__n0000<0>lut .INIT = 4'h1;
  LUT1 \Monostable_1_Count__n0000<0>lut  (
    .I0(\Count<0> ),
    .O(N3)
  );
  MUXCY \Monostable_1_Count__n0000<0>cy  (
    .CI(N0),
    .DI(N1),
    .S(N3),
    .O(\Monostable_1_Count__n0000<0>_cyo )
  );
  defparam _n0000524.INIT = 16'hFFEF;
  LUT4 _n0000524 (
    .I0(\Count<25> ),
    .I1(\Count<15> ),
    .I2(\Count<5> ),
    .I3(\Count<4> ),
    .O(CHOICE2348)
  );
  MUXCY \Monostable_1_Count__n0000<1>cy  (
    .CI(\Monostable_1_Count__n0000<0>_cyo ),
    .DI(N0),
    .S(Count_1_rt),
    .O(\Monostable_1_Count__n0000<1>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<1>_xor  (
    .CI(\Monostable_1_Count__n0000<0>_cyo ),
    .LI(Count_1_rt),
    .O(\Count__n0000<1> )
  );
  MUXCY \Monostable_1_Count__n0000<2>cy  (
    .CI(\Monostable_1_Count__n0000<1>_cyo ),
    .DI(N0),
    .S(Count_2_rt),
    .O(\Monostable_1_Count__n0000<2>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<2>_xor  (
    .CI(\Monostable_1_Count__n0000<1>_cyo ),
    .LI(Count_2_rt),
    .O(\Count__n0000<2> )
  );
  MUXCY \Monostable_1_Count__n0000<3>cy  (
    .CI(\Monostable_1_Count__n0000<2>_cyo ),
    .DI(N0),
    .S(Count_3_rt),
    .O(\Monostable_1_Count__n0000<3>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<3>_xor  (
    .CI(\Monostable_1_Count__n0000<2>_cyo ),
    .LI(Count_3_rt),
    .O(\Count__n0000<3> )
  );
  MUXCY \Monostable_1_Count__n0000<4>cy  (
    .CI(\Monostable_1_Count__n0000<3>_cyo ),
    .DI(N0),
    .S(Count_4_rt),
    .O(\Monostable_1_Count__n0000<4>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<4>_xor  (
    .CI(\Monostable_1_Count__n0000<3>_cyo ),
    .LI(Count_4_rt),
    .O(\Count__n0000<4> )
  );
  MUXCY \Monostable_1_Count__n0000<5>cy  (
    .CI(\Monostable_1_Count__n0000<4>_cyo ),
    .DI(N0),
    .S(Count_5_rt),
    .O(\Monostable_1_Count__n0000<5>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<5>_xor  (
    .CI(\Monostable_1_Count__n0000<4>_cyo ),
    .LI(Count_5_rt),
    .O(\Count__n0000<5> )
  );
  MUXCY \Monostable_1_Count__n0000<6>cy  (
    .CI(\Monostable_1_Count__n0000<5>_cyo ),
    .DI(N0),
    .S(Count_6_rt),
    .O(\Monostable_1_Count__n0000<6>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<6>_xor  (
    .CI(\Monostable_1_Count__n0000<5>_cyo ),
    .LI(Count_6_rt),
    .O(\Count__n0000<6> )
  );
  MUXCY \Monostable_1_Count__n0000<7>cy  (
    .CI(\Monostable_1_Count__n0000<6>_cyo ),
    .DI(N0),
    .S(Count_7_rt),
    .O(\Monostable_1_Count__n0000<7>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<7>_xor  (
    .CI(\Monostable_1_Count__n0000<6>_cyo ),
    .LI(Count_7_rt),
    .O(\Count__n0000<7> )
  );
  MUXCY \Monostable_1_Count__n0000<8>cy  (
    .CI(\Monostable_1_Count__n0000<7>_cyo ),
    .DI(N0),
    .S(Count_8_rt),
    .O(\Monostable_1_Count__n0000<8>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<8>_xor  (
    .CI(\Monostable_1_Count__n0000<7>_cyo ),
    .LI(Count_8_rt),
    .O(\Count__n0000<8> )
  );
  MUXCY \Monostable_1_Count__n0000<9>cy  (
    .CI(\Monostable_1_Count__n0000<8>_cyo ),
    .DI(N0),
    .S(Count_9_rt),
    .O(\Monostable_1_Count__n0000<9>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<9>_xor  (
    .CI(\Monostable_1_Count__n0000<8>_cyo ),
    .LI(Count_9_rt),
    .O(\Count__n0000<9> )
  );
  MUXCY \Monostable_1_Count__n0000<10>cy  (
    .CI(\Monostable_1_Count__n0000<9>_cyo ),
    .DI(N0),
    .S(Count_10_rt),
    .O(\Monostable_1_Count__n0000<10>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<10>_xor  (
    .CI(\Monostable_1_Count__n0000<9>_cyo ),
    .LI(Count_10_rt),
    .O(\Count__n0000<10> )
  );
  MUXCY \Monostable_1_Count__n0000<11>cy  (
    .CI(\Monostable_1_Count__n0000<10>_cyo ),
    .DI(N0),
    .S(Count_11_rt),
    .O(\Monostable_1_Count__n0000<11>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<11>_xor  (
    .CI(\Monostable_1_Count__n0000<10>_cyo ),
    .LI(Count_11_rt),
    .O(\Count__n0000<11> )
  );
  MUXCY \Monostable_1_Count__n0000<12>cy  (
    .CI(\Monostable_1_Count__n0000<11>_cyo ),
    .DI(N0),
    .S(Count_12_rt),
    .O(\Monostable_1_Count__n0000<12>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<12>_xor  (
    .CI(\Monostable_1_Count__n0000<11>_cyo ),
    .LI(Count_12_rt),
    .O(\Count__n0000<12> )
  );
  MUXCY \Monostable_1_Count__n0000<13>cy  (
    .CI(\Monostable_1_Count__n0000<12>_cyo ),
    .DI(N0),
    .S(Count_13_rt),
    .O(\Monostable_1_Count__n0000<13>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<13>_xor  (
    .CI(\Monostable_1_Count__n0000<12>_cyo ),
    .LI(Count_13_rt),
    .O(\Count__n0000<13> )
  );
  MUXCY \Monostable_1_Count__n0000<14>cy  (
    .CI(\Monostable_1_Count__n0000<13>_cyo ),
    .DI(N0),
    .S(Count_14_rt),
    .O(\Monostable_1_Count__n0000<14>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<14>_xor  (
    .CI(\Monostable_1_Count__n0000<13>_cyo ),
    .LI(Count_14_rt),
    .O(\Count__n0000<14> )
  );
  MUXCY \Monostable_1_Count__n0000<15>cy  (
    .CI(\Monostable_1_Count__n0000<14>_cyo ),
    .DI(N0),
    .S(Count_15_rt),
    .O(\Monostable_1_Count__n0000<15>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<15>_xor  (
    .CI(\Monostable_1_Count__n0000<14>_cyo ),
    .LI(Count_15_rt),
    .O(\Count__n0000<15> )
  );
  MUXCY \Monostable_1_Count__n0000<16>cy  (
    .CI(\Monostable_1_Count__n0000<15>_cyo ),
    .DI(N0),
    .S(Count_16_rt),
    .O(\Monostable_1_Count__n0000<16>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<16>_xor  (
    .CI(\Monostable_1_Count__n0000<15>_cyo ),
    .LI(Count_16_rt),
    .O(\Count__n0000<16> )
  );
  MUXCY \Monostable_1_Count__n0000<17>cy  (
    .CI(\Monostable_1_Count__n0000<16>_cyo ),
    .DI(N0),
    .S(Count_17_rt),
    .O(\Monostable_1_Count__n0000<17>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<17>_xor  (
    .CI(\Monostable_1_Count__n0000<16>_cyo ),
    .LI(Count_17_rt),
    .O(\Count__n0000<17> )
  );
  MUXCY \Monostable_1_Count__n0000<18>cy  (
    .CI(\Monostable_1_Count__n0000<17>_cyo ),
    .DI(N0),
    .S(Count_18_rt),
    .O(\Monostable_1_Count__n0000<18>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<18>_xor  (
    .CI(\Monostable_1_Count__n0000<17>_cyo ),
    .LI(Count_18_rt),
    .O(\Count__n0000<18> )
  );
  MUXCY \Monostable_1_Count__n0000<19>cy  (
    .CI(\Monostable_1_Count__n0000<18>_cyo ),
    .DI(N0),
    .S(Count_19_rt),
    .O(\Monostable_1_Count__n0000<19>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<19>_xor  (
    .CI(\Monostable_1_Count__n0000<18>_cyo ),
    .LI(Count_19_rt),
    .O(\Count__n0000<19> )
  );
  MUXCY \Monostable_1_Count__n0000<20>cy  (
    .CI(\Monostable_1_Count__n0000<19>_cyo ),
    .DI(N0),
    .S(Count_20_rt),
    .O(\Monostable_1_Count__n0000<20>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<20>_xor  (
    .CI(\Monostable_1_Count__n0000<19>_cyo ),
    .LI(Count_20_rt),
    .O(\Count__n0000<20> )
  );
  MUXCY \Monostable_1_Count__n0000<21>cy  (
    .CI(\Monostable_1_Count__n0000<20>_cyo ),
    .DI(N0),
    .S(Count_21_rt),
    .O(\Monostable_1_Count__n0000<21>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<21>_xor  (
    .CI(\Monostable_1_Count__n0000<20>_cyo ),
    .LI(Count_21_rt),
    .O(\Count__n0000<21> )
  );
  MUXCY \Monostable_1_Count__n0000<22>cy  (
    .CI(\Monostable_1_Count__n0000<21>_cyo ),
    .DI(N0),
    .S(Count_22_rt),
    .O(\Monostable_1_Count__n0000<22>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<22>_xor  (
    .CI(\Monostable_1_Count__n0000<21>_cyo ),
    .LI(Count_22_rt),
    .O(\Count__n0000<22> )
  );
  MUXCY \Monostable_1_Count__n0000<23>cy  (
    .CI(\Monostable_1_Count__n0000<22>_cyo ),
    .DI(N0),
    .S(Count_23_rt),
    .O(\Monostable_1_Count__n0000<23>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<23>_xor  (
    .CI(\Monostable_1_Count__n0000<22>_cyo ),
    .LI(Count_23_rt),
    .O(\Count__n0000<23> )
  );
  MUXCY \Monostable_1_Count__n0000<24>cy  (
    .CI(\Monostable_1_Count__n0000<23>_cyo ),
    .DI(N0),
    .S(Count_24_rt),
    .O(\Monostable_1_Count__n0000<24>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<24>_xor  (
    .CI(\Monostable_1_Count__n0000<23>_cyo ),
    .LI(Count_24_rt),
    .O(\Count__n0000<24> )
  );
  MUXCY \Monostable_1_Count__n0000<25>cy  (
    .CI(\Monostable_1_Count__n0000<24>_cyo ),
    .DI(N0),
    .S(Count_25_rt),
    .O(\Monostable_1_Count__n0000<25>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<25>_xor  (
    .CI(\Monostable_1_Count__n0000<24>_cyo ),
    .LI(Count_25_rt),
    .O(\Count__n0000<25> )
  );
  MUXCY \Monostable_1_Count__n0000<26>cy  (
    .CI(\Monostable_1_Count__n0000<25>_cyo ),
    .DI(N0),
    .S(Count_26_rt),
    .O(\Monostable_1_Count__n0000<26>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<26>_xor  (
    .CI(\Monostable_1_Count__n0000<25>_cyo ),
    .LI(Count_26_rt),
    .O(\Count__n0000<26> )
  );
  MUXCY \Monostable_1_Count__n0000<27>cy  (
    .CI(\Monostable_1_Count__n0000<26>_cyo ),
    .DI(N0),
    .S(Count_27_rt),
    .O(\Monostable_1_Count__n0000<27>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<27>_xor  (
    .CI(\Monostable_1_Count__n0000<26>_cyo ),
    .LI(Count_27_rt),
    .O(\Count__n0000<27> )
  );
  MUXCY \Monostable_1_Count__n0000<28>cy  (
    .CI(\Monostable_1_Count__n0000<27>_cyo ),
    .DI(N0),
    .S(Count_28_rt),
    .O(\Monostable_1_Count__n0000<28>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<28>_xor  (
    .CI(\Monostable_1_Count__n0000<27>_cyo ),
    .LI(Count_28_rt),
    .O(\Count__n0000<28> )
  );
  MUXCY \Monostable_1_Count__n0000<29>cy  (
    .CI(\Monostable_1_Count__n0000<28>_cyo ),
    .DI(N0),
    .S(Count_29_rt),
    .O(\Monostable_1_Count__n0000<29>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<29>_xor  (
    .CI(\Monostable_1_Count__n0000<28>_cyo ),
    .LI(Count_29_rt),
    .O(\Count__n0000<29> )
  );
  MUXCY \Monostable_1_Count__n0000<30>cy  (
    .CI(\Monostable_1_Count__n0000<29>_cyo ),
    .DI(N0),
    .S(Count_30_rt),
    .O(\Monostable_1_Count__n0000<30>_cyo )
  );
  XORCY \Monostable_1_Count__n0000<30>_xor  (
    .CI(\Monostable_1_Count__n0000<29>_cyo ),
    .LI(Count_30_rt),
    .O(\Count__n0000<30> )
  );
  defparam _n0000532.INIT = 16'hFFFE;
  LUT4 _n0000532 (
    .I0(CHOICE2340),
    .I1(CHOICE2343),
    .I2(CHOICE2348),
    .I3(N7),
    .O(N31)
  );
  defparam _n0000169.INIT = 16'h4000;
  LUT4 _n0000169 (
    .I0(N31),
    .I1(CHOICE2358),
    .I2(CHOICE2364),
    .I3(CHOICE2370),
    .O(_n0000)
  );
  defparam _n0000113.INIT = 16'h0001;
  LUT4 _n0000113 (
    .I0(\Count<12> ),
    .I1(\Count<22> ),
    .I2(\Count<2> ),
    .I3(\Count<13> ),
    .O(CHOICE2358)
  );
  defparam _n0000125.INIT = 16'h0002;
  LUT4 _n0000125 (
    .I0(\Count<10> ),
    .I1(\Count<20> ),
    .I2(\Count<30> ),
    .I3(\Count<0> ),
    .O(CHOICE2364)
  );
  defparam _n000097.INIT = 16'hFFEF;
  LUT4 _n000097 (
    .I0(\Count<27> ),
    .I1(\Count<28> ),
    .I2(\Count<7> ),
    .I3(\Count<18> ),
    .O(CHOICE1979)
  );
  defparam _n0000918.INIT = 16'hEFFF;
  LUT4 _n0000918 (
    .I0(\Count<29> ),
    .I1(\Count<19> ),
    .I2(\Count<8> ),
    .I3(\Count<9> ),
    .O(CHOICE1984)
  );
  defparam _n0000137.INIT = 16'h0002;
  LUT4 _n0000137 (
    .I0(\Count<11> ),
    .I1(\Count<21> ),
    .I2(\Count<31> ),
    .I3(\Count<1> ),
    .O(CHOICE2370)
  );
  defparam _n000054.INIT = 16'hFFFE;
  LUT4 _n000054 (
    .I0(\Count<16> ),
    .I1(\Count<26> ),
    .I2(\Count<6> ),
    .I3(\Count<17> ),
    .O(CHOICE2340)
  );
  defparam _n0000919.INIT = 4'hE;
  LUT2 _n0000919 (
    .I0(CHOICE1979),
    .I1(CHOICE1984),
    .O(N7)
  );
  defparam Count_1_rt_34.INIT = 4'h2;
  LUT1 Count_1_rt_34 (
    .I0(\Count<1> ),
    .O(Count_1_rt)
  );
  defparam Count_2_rt_35.INIT = 4'h2;
  LUT1 Count_2_rt_35 (
    .I0(\Count<2> ),
    .O(Count_2_rt)
  );
  defparam Count_3_rt_36.INIT = 4'h2;
  LUT1 Count_3_rt_36 (
    .I0(\Count<3> ),
    .O(Count_3_rt)
  );
  defparam Count_4_rt_37.INIT = 4'h2;
  LUT1 Count_4_rt_37 (
    .I0(\Count<4> ),
    .O(Count_4_rt)
  );
  defparam Count_5_rt_38.INIT = 4'h2;
  LUT1 Count_5_rt_38 (
    .I0(\Count<5> ),
    .O(Count_5_rt)
  );
  defparam Count_6_rt_39.INIT = 4'h2;
  LUT1 Count_6_rt_39 (
    .I0(\Count<6> ),
    .O(Count_6_rt)
  );
  defparam Count_7_rt_40.INIT = 4'h2;
  LUT1 Count_7_rt_40 (
    .I0(\Count<7> ),
    .O(Count_7_rt)
  );
  defparam Count_8_rt_41.INIT = 4'h2;
  LUT1 Count_8_rt_41 (
    .I0(\Count<8> ),
    .O(Count_8_rt)
  );
  defparam Count_9_rt_42.INIT = 4'h2;
  LUT1 Count_9_rt_42 (
    .I0(\Count<9> ),
    .O(Count_9_rt)
  );
  defparam Count_10_rt_43.INIT = 4'h2;
  LUT1 Count_10_rt_43 (
    .I0(\Count<10> ),
    .O(Count_10_rt)
  );
  defparam Count_11_rt_44.INIT = 4'h2;
  LUT1 Count_11_rt_44 (
    .I0(\Count<11> ),
    .O(Count_11_rt)
  );
  defparam Count_12_rt_45.INIT = 4'h2;
  LUT1 Count_12_rt_45 (
    .I0(\Count<12> ),
    .O(Count_12_rt)
  );
  defparam Count_13_rt_46.INIT = 4'h2;
  LUT1 Count_13_rt_46 (
    .I0(\Count<13> ),
    .O(Count_13_rt)
  );
  defparam Count_14_rt_47.INIT = 4'h2;
  LUT1 Count_14_rt_47 (
    .I0(\Count<14> ),
    .O(Count_14_rt)
  );
  defparam Count_15_rt_48.INIT = 4'h2;
  LUT1 Count_15_rt_48 (
    .I0(\Count<15> ),
    .O(Count_15_rt)
  );
  defparam Count_16_rt_49.INIT = 4'h2;
  LUT1 Count_16_rt_49 (
    .I0(\Count<16> ),
    .O(Count_16_rt)
  );
  defparam Count_17_rt_50.INIT = 4'h2;
  LUT1 Count_17_rt_50 (
    .I0(\Count<17> ),
    .O(Count_17_rt)
  );
  defparam Count_18_rt_51.INIT = 4'h2;
  LUT1 Count_18_rt_51 (
    .I0(\Count<18> ),
    .O(Count_18_rt)
  );
  defparam Count_19_rt_52.INIT = 4'h2;
  LUT1 Count_19_rt_52 (
    .I0(\Count<19> ),
    .O(Count_19_rt)
  );
  defparam Count_20_rt_53.INIT = 4'h2;
  LUT1 Count_20_rt_53 (
    .I0(\Count<20> ),
    .O(Count_20_rt)
  );
  defparam Count_21_rt_54.INIT = 4'h2;
  LUT1 Count_21_rt_54 (
    .I0(\Count<21> ),
    .O(Count_21_rt)
  );
  defparam Count_22_rt_55.INIT = 4'h2;
  LUT1 Count_22_rt_55 (
    .I0(\Count<22> ),
    .O(Count_22_rt)
  );
  defparam Count_23_rt_56.INIT = 4'h2;
  LUT1 Count_23_rt_56 (
    .I0(\Count<23> ),
    .O(Count_23_rt)
  );
  defparam Count_24_rt_57.INIT = 4'h2;
  LUT1 Count_24_rt_57 (
    .I0(\Count<24> ),
    .O(Count_24_rt)
  );
  defparam Count_25_rt_58.INIT = 4'h2;
  LUT1 Count_25_rt_58 (
    .I0(\Count<25> ),
    .O(Count_25_rt)
  );
  defparam Count_26_rt_59.INIT = 4'h2;
  LUT1 Count_26_rt_59 (
    .I0(\Count<26> ),
    .O(Count_26_rt)
  );
  defparam Count_27_rt_60.INIT = 4'h2;
  LUT1 Count_27_rt_60 (
    .I0(\Count<27> ),
    .O(Count_27_rt)
  );
  defparam Count_28_rt_61.INIT = 4'h2;
  LUT1 Count_28_rt_61 (
    .I0(\Count<28> ),
    .O(Count_28_rt)
  );
  defparam Count_29_rt_62.INIT = 4'h2;
  LUT1 Count_29_rt_62 (
    .I0(\Count<29> ),
    .O(Count_29_rt)
  );
  defparam Count_30_rt_63.INIT = 4'h2;
  LUT1 Count_30_rt_63 (
    .I0(\Count<30> ),
    .O(Count_30_rt)
  );
  defparam Count_31_rt_64.INIT = 4'h2;
  LUT1 Count_31_rt_64 (
    .I0(\Count<31> ),
    .O(Count_31_rt)
  );
endmodule

module DelayLine_3_1 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<200>__net23 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<200>__net27 ;
  wire \Mshreg_Bits<200>__net38 ;
  wire \Mshreg_Bits<200>__net37 ;
  wire \Mshreg_Bits<200>__net35 ;
  wire \Mshreg_Bits<200>__net15 ;
  wire \Mshreg_Bits<200>__net25 ;
  wire \Mshreg_Bits<200>__net17 ;
  wire \Mshreg_Bits<200>__net33 ;
  wire \Mshreg_Bits<200>__net19 ;
  wire \Mshreg_Bits<200>__net29 ;
  wire \Mshreg_Bits<200>__net21 ;
  wire \Mshreg_Bits<200>__net31 ;
  wire \NLW_Mshreg_Bits<200>_srl_18_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_6_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_7_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_8_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_9_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_10_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_11_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_12_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_13_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_14_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_15_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_16_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_17_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<200>_srl_18  (
    .A0(N1),
    .A1(N0),
    .A2(N0),
    .A3(N1),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net37 ),
    .Q(\Mshreg_Bits<200>__net38 ),
    .Q15(\NLW_Mshreg_Bits<200>_srl_18_Q15_UNCONNECTED )
  );
  FDR Edge_65 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<200>_0  (
    .D(\Mshreg_Bits<200>__net38 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<200>_srl_6  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<200>_srl_6_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net15 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_7  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net15 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_7_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net17 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_8  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net17 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_8_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net19 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_9  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net19 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_9_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net21 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_10  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net21 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_10_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net23 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_11  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net23 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_11_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net25 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_12  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net25 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_12_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net27 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_13  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net27 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_13_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net29 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_14  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net29 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_14_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net31 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_15  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net31 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_15_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net33 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_16  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net33 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_16_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net35 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_17  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net35 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_17_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net37 )
  );
endmodule

module DelayLine_4_5 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<40>__net44 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<40>__net42 ;
  wire \Mshreg_Bits<40>__net45 ;
  wire \NLW_Mshreg_Bits<40>_srl_21_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<40>_srl_19_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<40>_srl_20_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<40>_srl_21  (
    .A0(N1),
    .A1(N0),
    .A2(N0),
    .A3(N1),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<40>__net44 ),
    .Q(\Mshreg_Bits<40>__net45 ),
    .Q15(\NLW_Mshreg_Bits<40>_srl_21_Q15_UNCONNECTED )
  );
  FDR Edge_66 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<40>_0  (
    .D(\Mshreg_Bits<40>__net45 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<40>_srl_19  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<40>_srl_19_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<40>__net42 )
  );
  SRLC16E \Mshreg_Bits<40>_srl_20  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<40>__net42 ),
    .Q(\NLW_Mshreg_Bits<40>_srl_20_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<40>__net44 )
  );
endmodule

module DelayLine_1_3 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<15>__net5 ;
  wire N1;
  wire N0;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRL16E \Mshreg_Bits<15>_srl_2  (
    .A0(N0),
    .A1(N1),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\Mshreg_Bits<15>__net5 )
  );
  FDR Edge_67 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<15>_0  (
    .D(\Mshreg_Bits<15>__net5 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
endmodule

module DelayLine_3 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<200>__net23 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<200>__net27 ;
  wire \Mshreg_Bits<200>__net38 ;
  wire \Mshreg_Bits<200>__net37 ;
  wire \Mshreg_Bits<200>__net35 ;
  wire \Mshreg_Bits<200>__net15 ;
  wire \Mshreg_Bits<200>__net25 ;
  wire \Mshreg_Bits<200>__net17 ;
  wire \Mshreg_Bits<200>__net33 ;
  wire \Mshreg_Bits<200>__net19 ;
  wire \Mshreg_Bits<200>__net29 ;
  wire \Mshreg_Bits<200>__net21 ;
  wire \Mshreg_Bits<200>__net31 ;
  wire \NLW_Mshreg_Bits<200>_srl_18_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_6_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_7_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_8_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_9_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_10_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_11_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_12_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_13_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_14_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_15_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_16_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<200>_srl_17_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<200>_srl_18  (
    .A0(N1),
    .A1(N0),
    .A2(N0),
    .A3(N1),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net37 ),
    .Q(\Mshreg_Bits<200>__net38 ),
    .Q15(\NLW_Mshreg_Bits<200>_srl_18_Q15_UNCONNECTED )
  );
  FDR Edge_68 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<200>_0  (
    .D(\Mshreg_Bits<200>__net38 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<200>_srl_6  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<200>_srl_6_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net15 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_7  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net15 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_7_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net17 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_8  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net17 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_8_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net19 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_9  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net19 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_9_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net21 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_10  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net21 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_10_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net23 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_11  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net23 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_11_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net25 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_12  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net25 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_12_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net27 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_13  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net27 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_13_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net29 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_14  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net29 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_14_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net31 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_15  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net31 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_15_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net33 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_16  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net33 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_16_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net35 )
  );
  SRLC16E \Mshreg_Bits<200>_srl_17  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<200>__net35 ),
    .Q(\NLW_Mshreg_Bits<200>_srl_17_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<200>__net37 )
  );
endmodule

module DelayLine_1_2 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<15>__net5 ;
  wire N1;
  wire N0;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRL16E \Mshreg_Bits<15>_srl_2  (
    .A0(N0),
    .A1(N1),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\Mshreg_Bits<15>__net5 )
  );
  FDR Edge_69 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<15>_0  (
    .D(\Mshreg_Bits<15>__net5 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
endmodule

module DelayLine_2 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<45>__net10 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<45>__net8 ;
  wire \Mshreg_Bits<45>__net11 ;
  wire \Mshreg_Bits<45>_01 ;
  wire \NLW_Mshreg_Bits<45>_srl_5_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<45>_srl_3_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<45>_srl_4_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<45>_srl_5  (
    .A0(N0),
    .A1(N0),
    .A2(N1),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<45>__net10 ),
    .Q(\Mshreg_Bits<45>__net11 ),
    .Q15(\NLW_Mshreg_Bits<45>_srl_5_Q15_UNCONNECTED )
  );
  FDR Edge_70 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<45>_0  (
    .D(\Mshreg_Bits<45>__net11 ),
    .CE(N0),
    .C(Dclk),
    .Q(\Mshreg_Bits<45>_01 )
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<45>_srl_3  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<45>_srl_3_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<45>__net8 )
  );
  SRLC16E \Mshreg_Bits<45>_srl_4  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<45>__net8 ),
    .Q(\NLW_Mshreg_Bits<45>_srl_4_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<45>__net10 )
  );
  BUFG \Mshreg_Bits<45>_0_BUFG  (
    .I(\Mshreg_Bits<45>_01 ),
    .O(Out)
  );
endmodule

module DelayLine_5_3 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<35>__net51 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<35>__net49 ;
  wire \Mshreg_Bits<35>__net52 ;
  wire \NLW_Mshreg_Bits<35>_srl_24_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<35>_srl_22_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<35>_srl_23_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<35>_srl_24  (
    .A0(N0),
    .A1(N1),
    .A2(N1),
    .A3(N1),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<35>__net51 ),
    .Q(\Mshreg_Bits<35>__net52 ),
    .Q15(\NLW_Mshreg_Bits<35>_srl_24_Q15_UNCONNECTED )
  );
  FDR Edge_71 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<35>_0  (
    .D(\Mshreg_Bits<35>__net52 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<35>_srl_22  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<35>_srl_22_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<35>__net49 )
  );
  SRLC16E \Mshreg_Bits<35>_srl_23  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<35>__net49 ),
    .Q(\NLW_Mshreg_Bits<35>_srl_23_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<35>__net51 )
  );
endmodule

module Oscillator_1 (
  Dclk, Enable, Out
);
  input Dclk;
  input Enable;
  output Out;
  wire \_old_Count_95<1> ;
  wire NlwRenamedSig_OI_Out;
  wire _n0000;
  wire _n0002;
  wire \_old_Count_95<0> ;
  wire \Count<31> ;
  wire \Count<25> ;
  wire \Count<30> ;
  wire \Count<24> ;
  wire \Count<29> ;
  wire \Count<23> ;
  wire \Count<28> ;
  wire \Count<22> ;
  wire \Count<27> ;
  wire \Count<21> ;
  wire \Count<26> ;
  wire \Count<15> ;
  wire \Count<20> ;
  wire \Count<14> ;
  wire \Count<19> ;
  wire \Count<13> ;
  wire \Count<18> ;
  wire \Count<12> ;
  wire \Count<17> ;
  wire \Count<11> ;
  wire \Count<16> ;
  wire \Count<5> ;
  wire \Count<10> ;
  wire \Count<4> ;
  wire \Count<9> ;
  wire \Count<3> ;
  wire \Count<8> ;
  wire \Count<2> ;
  wire \Count<7> ;
  wire \Count<1> ;
  wire \Count<6> ;
  wire \Count<0> ;
  wire \_old_Count_95<31> ;
  wire \_old_Count_95<30> ;
  wire \_old_Count_95<29> ;
  wire \_old_Count_95<28> ;
  wire \_old_Count_95<27> ;
  wire \_old_Count_95<26> ;
  wire \_old_Count_95<25> ;
  wire \_old_Count_95<24> ;
  wire \_old_Count_95<23> ;
  wire \_old_Count_95<22> ;
  wire \_old_Count_95<21> ;
  wire \_old_Count_95<20> ;
  wire \_old_Count_95<19> ;
  wire \_old_Count_95<18> ;
  wire \_old_Count_95<17> ;
  wire \_old_Count_95<16> ;
  wire \_old_Count_95<15> ;
  wire \_old_Count_95<14> ;
  wire \_old_Count_95<13> ;
  wire \_old_Count_95<12> ;
  wire \_old_Count_95<11> ;
  wire \_old_Count_95<10> ;
  wire \_old_Count_95<9> ;
  wire \_old_Count_95<8> ;
  wire \_old_Count_95<7> ;
  wire \_old_Count_95<6> ;
  wire \_old_Count_95<5> ;
  wire \_old_Count_95<4> ;
  wire \_old_Count_95<3> ;
  wire \_old_Count_95<2> ;
  wire N0;
  wire N1;
  wire \Oscillator_1__old_Count_95<30>_cyo ;
  wire CHOICE2504;
  wire \Oscillator_1__old_Count_95<0>_cyo ;
  wire \Oscillator_1__old_Count_95<1>_cyo ;
  wire \Oscillator_1__old_Count_95<2>_cyo ;
  wire \Oscillator_1__old_Count_95<3>_cyo ;
  wire \Oscillator_1__old_Count_95<4>_cyo ;
  wire \Oscillator_1__old_Count_95<5>_cyo ;
  wire \Oscillator_1__old_Count_95<6>_cyo ;
  wire \Oscillator_1__old_Count_95<7>_cyo ;
  wire \Oscillator_1__old_Count_95<8>_cyo ;
  wire \Oscillator_1__old_Count_95<9>_cyo ;
  wire \Oscillator_1__old_Count_95<10>_cyo ;
  wire \Oscillator_1__old_Count_95<11>_cyo ;
  wire \Oscillator_1__old_Count_95<12>_cyo ;
  wire \Oscillator_1__old_Count_95<13>_cyo ;
  wire \Oscillator_1__old_Count_95<14>_cyo ;
  wire \Oscillator_1__old_Count_95<15>_cyo ;
  wire \Oscillator_1__old_Count_95<16>_cyo ;
  wire \Oscillator_1__old_Count_95<17>_cyo ;
  wire \Oscillator_1__old_Count_95<18>_cyo ;
  wire \Oscillator_1__old_Count_95<19>_cyo ;
  wire \Oscillator_1__old_Count_95<20>_cyo ;
  wire \Oscillator_1__old_Count_95<21>_cyo ;
  wire \Oscillator_1__old_Count_95<22>_cyo ;
  wire \Oscillator_1__old_Count_95<23>_cyo ;
  wire \Oscillator_1__old_Count_95<24>_cyo ;
  wire \Oscillator_1__old_Count_95<25>_cyo ;
  wire \Oscillator_1__old_Count_95<26>_cyo ;
  wire \Oscillator_1__old_Count_95<27>_cyo ;
  wire \Oscillator_1__old_Count_95<28>_cyo ;
  wire \Oscillator_1__old_Count_95<29>_cyo ;
  wire N136;
  wire CHOICE2494;
  wire CHOICE2488;
  wire CHOICE2529;
  wire CHOICE2501;
  wire CHOICE2520;
  wire CHOICE2514;
  wire Count_30_rt;
  wire CHOICE2523;
  wire CHOICE2485;
  wire Count_1_rt;
  wire Count_2_rt;
  wire Count_3_rt;
  wire Count_4_rt;
  wire Count_5_rt;
  wire Count_6_rt;
  wire Count_7_rt;
  wire Count_8_rt;
  wire Count_9_rt;
  wire Count_10_rt;
  wire Count_11_rt;
  wire Count_12_rt;
  wire Count_13_rt;
  wire Count_14_rt;
  wire Count_15_rt;
  wire Count_16_rt;
  wire Count_17_rt;
  wire Count_18_rt;
  wire Count_19_rt;
  wire Count_20_rt;
  wire Count_21_rt;
  wire Count_22_rt;
  wire Count_23_rt;
  wire Count_24_rt;
  wire Count_25_rt;
  wire Count_26_rt;
  wire Count_27_rt;
  wire Count_28_rt;
  wire Count_29_rt;
  assign
    Out = NlwRenamedSig_OI_Out;
  defparam _n00021.INIT = 4'h1;
  LUT1 _n00021 (
    .I0(NlwRenamedSig_OI_Out),
    .O(_n0002)
  );
  defparam _n0000199.INIT = 16'h8000;
  LUT4 _n0000199 (
    .I0(CHOICE2504),
    .I1(CHOICE2514),
    .I2(CHOICE2523),
    .I3(CHOICE2529),
    .O(_n0000)
  );
  XORCY \Oscillator_1__old_Count_95<31>_xor  (
    .CI(\Oscillator_1__old_Count_95<30>_cyo ),
    .LI(\Count<31> ),
    .O(\_old_Count_95<31> )
  );
  FDR Count_31 (
    .D(\_old_Count_95<31> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<31> )
  );
  FDE Out_72 (
    .D(_n0002),
    .CE(_n0000),
    .C(Dclk),
    .Q(NlwRenamedSig_OI_Out)
  );
  FDR Count_0 (
    .D(\_old_Count_95<0> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<0> )
  );
  FDR Count_1 (
    .D(\_old_Count_95<1> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<1> )
  );
  FDR Count_2 (
    .D(\_old_Count_95<2> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<2> )
  );
  FDR Count_3 (
    .D(\_old_Count_95<3> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<3> )
  );
  FDR Count_4 (
    .D(\_old_Count_95<4> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<4> )
  );
  FDR Count_5 (
    .D(\_old_Count_95<5> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<5> )
  );
  FDR Count_6 (
    .D(\_old_Count_95<6> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<6> )
  );
  FDR Count_7 (
    .D(\_old_Count_95<7> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<7> )
  );
  FDR Count_8 (
    .D(\_old_Count_95<8> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<8> )
  );
  FDR Count_9 (
    .D(\_old_Count_95<9> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<9> )
  );
  FDR Count_10 (
    .D(\_old_Count_95<10> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<10> )
  );
  FDR Count_11 (
    .D(\_old_Count_95<11> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<11> )
  );
  FDR Count_12 (
    .D(\_old_Count_95<12> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<12> )
  );
  FDR Count_13 (
    .D(\_old_Count_95<13> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<13> )
  );
  FDR Count_14 (
    .D(\_old_Count_95<14> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<14> )
  );
  FDR Count_15 (
    .D(\_old_Count_95<15> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<15> )
  );
  FDR Count_16 (
    .D(\_old_Count_95<16> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<16> )
  );
  FDR Count_17 (
    .D(\_old_Count_95<17> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<17> )
  );
  FDR Count_18 (
    .D(\_old_Count_95<18> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<18> )
  );
  FDR Count_19 (
    .D(\_old_Count_95<19> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<19> )
  );
  FDR Count_20 (
    .D(\_old_Count_95<20> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<20> )
  );
  FDR Count_21 (
    .D(\_old_Count_95<21> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<21> )
  );
  FDR Count_22 (
    .D(\_old_Count_95<22> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<22> )
  );
  FDR Count_23 (
    .D(\_old_Count_95<23> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<23> )
  );
  FDR Count_24 (
    .D(\_old_Count_95<24> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<24> )
  );
  FDR Count_25 (
    .D(\_old_Count_95<25> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<25> )
  );
  FDR Count_26 (
    .D(\_old_Count_95<26> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<26> )
  );
  FDR Count_27 (
    .D(\_old_Count_95<27> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<27> )
  );
  FDR Count_28 (
    .D(\_old_Count_95<28> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<28> )
  );
  FDR Count_29 (
    .D(\_old_Count_95<29> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<29> )
  );
  FDR Count_30 (
    .D(\_old_Count_95<30> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<30> )
  );
  VCC XST_VCC (
    .P(N0)
  );
  GND XST_GND (
    .G(N1)
  );
  defparam \Oscillator_1__old_Count_95<0>lut .INIT = 4'h1;
  LUT1 \Oscillator_1__old_Count_95<0>lut  (
    .I0(\Count<0> ),
    .O(\_old_Count_95<0> )
  );
  MUXCY \Oscillator_1__old_Count_95<0>cy  (
    .CI(N1),
    .DI(N0),
    .S(\_old_Count_95<0> ),
    .O(\Oscillator_1__old_Count_95<0>_cyo )
  );
  defparam _n0000145.INIT = 8'h10;
  LUT3 _n0000145 (
    .I0(\_old_Count_95<21> ),
    .I1(\_old_Count_95<29> ),
    .I2(CHOICE2520),
    .O(CHOICE2523)
  );
  MUXCY \Oscillator_1__old_Count_95<1>cy  (
    .CI(\Oscillator_1__old_Count_95<0>_cyo ),
    .DI(N1),
    .S(Count_1_rt),
    .O(\Oscillator_1__old_Count_95<1>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<1>_xor  (
    .CI(\Oscillator_1__old_Count_95<0>_cyo ),
    .LI(Count_1_rt),
    .O(\_old_Count_95<1> )
  );
  MUXCY \Oscillator_1__old_Count_95<2>cy  (
    .CI(\Oscillator_1__old_Count_95<1>_cyo ),
    .DI(N1),
    .S(Count_2_rt),
    .O(\Oscillator_1__old_Count_95<2>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<2>_xor  (
    .CI(\Oscillator_1__old_Count_95<1>_cyo ),
    .LI(Count_2_rt),
    .O(\_old_Count_95<2> )
  );
  MUXCY \Oscillator_1__old_Count_95<3>cy  (
    .CI(\Oscillator_1__old_Count_95<2>_cyo ),
    .DI(N1),
    .S(Count_3_rt),
    .O(\Oscillator_1__old_Count_95<3>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<3>_xor  (
    .CI(\Oscillator_1__old_Count_95<2>_cyo ),
    .LI(Count_3_rt),
    .O(\_old_Count_95<3> )
  );
  MUXCY \Oscillator_1__old_Count_95<4>cy  (
    .CI(\Oscillator_1__old_Count_95<3>_cyo ),
    .DI(N1),
    .S(Count_4_rt),
    .O(\Oscillator_1__old_Count_95<4>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<4>_xor  (
    .CI(\Oscillator_1__old_Count_95<3>_cyo ),
    .LI(Count_4_rt),
    .O(\_old_Count_95<4> )
  );
  MUXCY \Oscillator_1__old_Count_95<5>cy  (
    .CI(\Oscillator_1__old_Count_95<4>_cyo ),
    .DI(N1),
    .S(Count_5_rt),
    .O(\Oscillator_1__old_Count_95<5>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<5>_xor  (
    .CI(\Oscillator_1__old_Count_95<4>_cyo ),
    .LI(Count_5_rt),
    .O(\_old_Count_95<5> )
  );
  MUXCY \Oscillator_1__old_Count_95<6>cy  (
    .CI(\Oscillator_1__old_Count_95<5>_cyo ),
    .DI(N1),
    .S(Count_6_rt),
    .O(\Oscillator_1__old_Count_95<6>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<6>_xor  (
    .CI(\Oscillator_1__old_Count_95<5>_cyo ),
    .LI(Count_6_rt),
    .O(\_old_Count_95<6> )
  );
  MUXCY \Oscillator_1__old_Count_95<7>cy  (
    .CI(\Oscillator_1__old_Count_95<6>_cyo ),
    .DI(N1),
    .S(Count_7_rt),
    .O(\Oscillator_1__old_Count_95<7>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<7>_xor  (
    .CI(\Oscillator_1__old_Count_95<6>_cyo ),
    .LI(Count_7_rt),
    .O(\_old_Count_95<7> )
  );
  MUXCY \Oscillator_1__old_Count_95<8>cy  (
    .CI(\Oscillator_1__old_Count_95<7>_cyo ),
    .DI(N1),
    .S(Count_8_rt),
    .O(\Oscillator_1__old_Count_95<8>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<8>_xor  (
    .CI(\Oscillator_1__old_Count_95<7>_cyo ),
    .LI(Count_8_rt),
    .O(\_old_Count_95<8> )
  );
  MUXCY \Oscillator_1__old_Count_95<9>cy  (
    .CI(\Oscillator_1__old_Count_95<8>_cyo ),
    .DI(N1),
    .S(Count_9_rt),
    .O(\Oscillator_1__old_Count_95<9>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<9>_xor  (
    .CI(\Oscillator_1__old_Count_95<8>_cyo ),
    .LI(Count_9_rt),
    .O(\_old_Count_95<9> )
  );
  MUXCY \Oscillator_1__old_Count_95<10>cy  (
    .CI(\Oscillator_1__old_Count_95<9>_cyo ),
    .DI(N1),
    .S(Count_10_rt),
    .O(\Oscillator_1__old_Count_95<10>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<10>_xor  (
    .CI(\Oscillator_1__old_Count_95<9>_cyo ),
    .LI(Count_10_rt),
    .O(\_old_Count_95<10> )
  );
  MUXCY \Oscillator_1__old_Count_95<11>cy  (
    .CI(\Oscillator_1__old_Count_95<10>_cyo ),
    .DI(N1),
    .S(Count_11_rt),
    .O(\Oscillator_1__old_Count_95<11>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<11>_xor  (
    .CI(\Oscillator_1__old_Count_95<10>_cyo ),
    .LI(Count_11_rt),
    .O(\_old_Count_95<11> )
  );
  MUXCY \Oscillator_1__old_Count_95<12>cy  (
    .CI(\Oscillator_1__old_Count_95<11>_cyo ),
    .DI(N1),
    .S(Count_12_rt),
    .O(\Oscillator_1__old_Count_95<12>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<12>_xor  (
    .CI(\Oscillator_1__old_Count_95<11>_cyo ),
    .LI(Count_12_rt),
    .O(\_old_Count_95<12> )
  );
  MUXCY \Oscillator_1__old_Count_95<13>cy  (
    .CI(\Oscillator_1__old_Count_95<12>_cyo ),
    .DI(N1),
    .S(Count_13_rt),
    .O(\Oscillator_1__old_Count_95<13>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<13>_xor  (
    .CI(\Oscillator_1__old_Count_95<12>_cyo ),
    .LI(Count_13_rt),
    .O(\_old_Count_95<13> )
  );
  MUXCY \Oscillator_1__old_Count_95<14>cy  (
    .CI(\Oscillator_1__old_Count_95<13>_cyo ),
    .DI(N1),
    .S(Count_14_rt),
    .O(\Oscillator_1__old_Count_95<14>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<14>_xor  (
    .CI(\Oscillator_1__old_Count_95<13>_cyo ),
    .LI(Count_14_rt),
    .O(\_old_Count_95<14> )
  );
  MUXCY \Oscillator_1__old_Count_95<15>cy  (
    .CI(\Oscillator_1__old_Count_95<14>_cyo ),
    .DI(N1),
    .S(Count_15_rt),
    .O(\Oscillator_1__old_Count_95<15>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<15>_xor  (
    .CI(\Oscillator_1__old_Count_95<14>_cyo ),
    .LI(Count_15_rt),
    .O(\_old_Count_95<15> )
  );
  MUXCY \Oscillator_1__old_Count_95<16>cy  (
    .CI(\Oscillator_1__old_Count_95<15>_cyo ),
    .DI(N1),
    .S(Count_16_rt),
    .O(\Oscillator_1__old_Count_95<16>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<16>_xor  (
    .CI(\Oscillator_1__old_Count_95<15>_cyo ),
    .LI(Count_16_rt),
    .O(\_old_Count_95<16> )
  );
  MUXCY \Oscillator_1__old_Count_95<17>cy  (
    .CI(\Oscillator_1__old_Count_95<16>_cyo ),
    .DI(N1),
    .S(Count_17_rt),
    .O(\Oscillator_1__old_Count_95<17>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<17>_xor  (
    .CI(\Oscillator_1__old_Count_95<16>_cyo ),
    .LI(Count_17_rt),
    .O(\_old_Count_95<17> )
  );
  MUXCY \Oscillator_1__old_Count_95<18>cy  (
    .CI(\Oscillator_1__old_Count_95<17>_cyo ),
    .DI(N1),
    .S(Count_18_rt),
    .O(\Oscillator_1__old_Count_95<18>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<18>_xor  (
    .CI(\Oscillator_1__old_Count_95<17>_cyo ),
    .LI(Count_18_rt),
    .O(\_old_Count_95<18> )
  );
  MUXCY \Oscillator_1__old_Count_95<19>cy  (
    .CI(\Oscillator_1__old_Count_95<18>_cyo ),
    .DI(N1),
    .S(Count_19_rt),
    .O(\Oscillator_1__old_Count_95<19>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<19>_xor  (
    .CI(\Oscillator_1__old_Count_95<18>_cyo ),
    .LI(Count_19_rt),
    .O(\_old_Count_95<19> )
  );
  MUXCY \Oscillator_1__old_Count_95<20>cy  (
    .CI(\Oscillator_1__old_Count_95<19>_cyo ),
    .DI(N1),
    .S(Count_20_rt),
    .O(\Oscillator_1__old_Count_95<20>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<20>_xor  (
    .CI(\Oscillator_1__old_Count_95<19>_cyo ),
    .LI(Count_20_rt),
    .O(\_old_Count_95<20> )
  );
  MUXCY \Oscillator_1__old_Count_95<21>cy  (
    .CI(\Oscillator_1__old_Count_95<20>_cyo ),
    .DI(N1),
    .S(Count_21_rt),
    .O(\Oscillator_1__old_Count_95<21>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<21>_xor  (
    .CI(\Oscillator_1__old_Count_95<20>_cyo ),
    .LI(Count_21_rt),
    .O(\_old_Count_95<21> )
  );
  MUXCY \Oscillator_1__old_Count_95<22>cy  (
    .CI(\Oscillator_1__old_Count_95<21>_cyo ),
    .DI(N1),
    .S(Count_22_rt),
    .O(\Oscillator_1__old_Count_95<22>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<22>_xor  (
    .CI(\Oscillator_1__old_Count_95<21>_cyo ),
    .LI(Count_22_rt),
    .O(\_old_Count_95<22> )
  );
  MUXCY \Oscillator_1__old_Count_95<23>cy  (
    .CI(\Oscillator_1__old_Count_95<22>_cyo ),
    .DI(N1),
    .S(Count_23_rt),
    .O(\Oscillator_1__old_Count_95<23>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<23>_xor  (
    .CI(\Oscillator_1__old_Count_95<22>_cyo ),
    .LI(Count_23_rt),
    .O(\_old_Count_95<23> )
  );
  MUXCY \Oscillator_1__old_Count_95<24>cy  (
    .CI(\Oscillator_1__old_Count_95<23>_cyo ),
    .DI(N1),
    .S(Count_24_rt),
    .O(\Oscillator_1__old_Count_95<24>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<24>_xor  (
    .CI(\Oscillator_1__old_Count_95<23>_cyo ),
    .LI(Count_24_rt),
    .O(\_old_Count_95<24> )
  );
  MUXCY \Oscillator_1__old_Count_95<25>cy  (
    .CI(\Oscillator_1__old_Count_95<24>_cyo ),
    .DI(N1),
    .S(Count_25_rt),
    .O(\Oscillator_1__old_Count_95<25>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<25>_xor  (
    .CI(\Oscillator_1__old_Count_95<24>_cyo ),
    .LI(Count_25_rt),
    .O(\_old_Count_95<25> )
  );
  MUXCY \Oscillator_1__old_Count_95<26>cy  (
    .CI(\Oscillator_1__old_Count_95<25>_cyo ),
    .DI(N1),
    .S(Count_26_rt),
    .O(\Oscillator_1__old_Count_95<26>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<26>_xor  (
    .CI(\Oscillator_1__old_Count_95<25>_cyo ),
    .LI(Count_26_rt),
    .O(\_old_Count_95<26> )
  );
  MUXCY \Oscillator_1__old_Count_95<27>cy  (
    .CI(\Oscillator_1__old_Count_95<26>_cyo ),
    .DI(N1),
    .S(Count_27_rt),
    .O(\Oscillator_1__old_Count_95<27>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<27>_xor  (
    .CI(\Oscillator_1__old_Count_95<26>_cyo ),
    .LI(Count_27_rt),
    .O(\_old_Count_95<27> )
  );
  MUXCY \Oscillator_1__old_Count_95<28>cy  (
    .CI(\Oscillator_1__old_Count_95<27>_cyo ),
    .DI(N1),
    .S(Count_28_rt),
    .O(\Oscillator_1__old_Count_95<28>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<28>_xor  (
    .CI(\Oscillator_1__old_Count_95<27>_cyo ),
    .LI(Count_28_rt),
    .O(\_old_Count_95<28> )
  );
  MUXCY \Oscillator_1__old_Count_95<29>cy  (
    .CI(\Oscillator_1__old_Count_95<28>_cyo ),
    .DI(N1),
    .S(Count_29_rt),
    .O(\Oscillator_1__old_Count_95<29>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<29>_xor  (
    .CI(\Oscillator_1__old_Count_95<28>_cyo ),
    .LI(Count_29_rt),
    .O(\_old_Count_95<29> )
  );
  MUXCY \Oscillator_1__old_Count_95<30>cy  (
    .CI(\Oscillator_1__old_Count_95<29>_cyo ),
    .DI(N1),
    .S(Count_30_rt),
    .O(\Oscillator_1__old_Count_95<30>_cyo )
  );
  XORCY \Oscillator_1__old_Count_95<30>_xor  (
    .CI(\Oscillator_1__old_Count_95<29>_cyo ),
    .LI(Count_30_rt),
    .O(\_old_Count_95<30> )
  );
  defparam _n0000118_SW0.INIT = 16'hFF7F;
  LUT4 _n0000118_SW0 (
    .I0(\_old_Count_95<13> ),
    .I1(\_old_Count_95<7> ),
    .I2(\_old_Count_95<6> ),
    .I3(\_old_Count_95<20> ),
    .O(N136)
  );
  defparam _n0000118.INIT = 16'h0001;
  LUT4 _n0000118 (
    .I0(\_old_Count_95<28> ),
    .I1(\_old_Count_95<27> ),
    .I2(\_old_Count_95<26> ),
    .I3(N136),
    .O(CHOICE2514)
  );
  defparam _n000054.INIT = 16'h0002;
  LUT4 _n000054 (
    .I0(\_old_Count_95<12> ),
    .I1(\_old_Count_95<4> ),
    .I2(\_old_Count_95<5> ),
    .I3(\_old_Count_95<19> ),
    .O(CHOICE2501)
  );
  defparam _n0000164.INIT = 16'h0002;
  LUT4 _n0000164 (
    .I0(\_old_Count_95<16> ),
    .I1(\_old_Count_95<22> ),
    .I2(\_old_Count_95<15> ),
    .I3(\_old_Count_95<30> ),
    .O(CHOICE2529)
  );
  defparam _n000010.INIT = 16'h4000;
  LUT4 _n000010 (
    .I0(\_old_Count_95<2> ),
    .I1(\_old_Count_95<9> ),
    .I2(\_old_Count_95<3> ),
    .I3(\_old_Count_95<17> ),
    .O(CHOICE2485)
  );
  defparam _n000040.INIT = 16'h0002;
  LUT4 _n000040 (
    .I0(\_old_Count_95<10> ),
    .I1(\_old_Count_95<24> ),
    .I2(\_old_Count_95<11> ),
    .I3(\_old_Count_95<18> ),
    .O(CHOICE2494)
  );
  defparam Count_30_rt_73.INIT = 4'h2;
  LUT1 Count_30_rt_73 (
    .I0(\Count<30> ),
    .O(Count_30_rt)
  );
  defparam _n000021.INIT = 8'h10;
  LUT3 _n000021 (
    .I0(\_old_Count_95<23> ),
    .I1(\_old_Count_95<31> ),
    .I2(CHOICE2485),
    .O(CHOICE2488)
  );
  defparam Count_29_rt_74.INIT = 4'h2;
  LUT1 Count_29_rt_74 (
    .I0(\Count<29> ),
    .O(Count_29_rt)
  );
  defparam _n000079.INIT = 16'h4000;
  LUT4 _n000079 (
    .I0(\_old_Count_95<25> ),
    .I1(CHOICE2494),
    .I2(CHOICE2488),
    .I3(CHOICE2501),
    .O(CHOICE2504)
  );
  defparam Count_1_rt_75.INIT = 4'h2;
  LUT1 Count_1_rt_75 (
    .I0(\Count<1> ),
    .O(Count_1_rt)
  );
  defparam Count_2_rt_76.INIT = 4'h2;
  LUT1 Count_2_rt_76 (
    .I0(\Count<2> ),
    .O(Count_2_rt)
  );
  defparam Count_3_rt_77.INIT = 4'h2;
  LUT1 Count_3_rt_77 (
    .I0(\Count<3> ),
    .O(Count_3_rt)
  );
  defparam Count_4_rt_78.INIT = 4'h2;
  LUT1 Count_4_rt_78 (
    .I0(\Count<4> ),
    .O(Count_4_rt)
  );
  defparam Count_5_rt_79.INIT = 4'h2;
  LUT1 Count_5_rt_79 (
    .I0(\Count<5> ),
    .O(Count_5_rt)
  );
  defparam Count_6_rt_80.INIT = 4'h2;
  LUT1 Count_6_rt_80 (
    .I0(\Count<6> ),
    .O(Count_6_rt)
  );
  defparam Count_7_rt_81.INIT = 4'h2;
  LUT1 Count_7_rt_81 (
    .I0(\Count<7> ),
    .O(Count_7_rt)
  );
  defparam Count_8_rt_82.INIT = 4'h2;
  LUT1 Count_8_rt_82 (
    .I0(\Count<8> ),
    .O(Count_8_rt)
  );
  defparam Count_9_rt_83.INIT = 4'h2;
  LUT1 Count_9_rt_83 (
    .I0(\Count<9> ),
    .O(Count_9_rt)
  );
  defparam Count_10_rt_84.INIT = 4'h2;
  LUT1 Count_10_rt_84 (
    .I0(\Count<10> ),
    .O(Count_10_rt)
  );
  defparam Count_11_rt_85.INIT = 4'h2;
  LUT1 Count_11_rt_85 (
    .I0(\Count<11> ),
    .O(Count_11_rt)
  );
  defparam Count_12_rt_86.INIT = 4'h2;
  LUT1 Count_12_rt_86 (
    .I0(\Count<12> ),
    .O(Count_12_rt)
  );
  defparam Count_13_rt_87.INIT = 4'h2;
  LUT1 Count_13_rt_87 (
    .I0(\Count<13> ),
    .O(Count_13_rt)
  );
  defparam Count_14_rt_88.INIT = 4'h2;
  LUT1 Count_14_rt_88 (
    .I0(\Count<14> ),
    .O(Count_14_rt)
  );
  defparam Count_15_rt_89.INIT = 4'h2;
  LUT1 Count_15_rt_89 (
    .I0(\Count<15> ),
    .O(Count_15_rt)
  );
  defparam Count_16_rt_90.INIT = 4'h2;
  LUT1 Count_16_rt_90 (
    .I0(\Count<16> ),
    .O(Count_16_rt)
  );
  defparam Count_17_rt_91.INIT = 4'h2;
  LUT1 Count_17_rt_91 (
    .I0(\Count<17> ),
    .O(Count_17_rt)
  );
  defparam Count_18_rt_92.INIT = 4'h2;
  LUT1 Count_18_rt_92 (
    .I0(\Count<18> ),
    .O(Count_18_rt)
  );
  defparam Count_19_rt_93.INIT = 4'h2;
  LUT1 Count_19_rt_93 (
    .I0(\Count<19> ),
    .O(Count_19_rt)
  );
  defparam Count_20_rt_94.INIT = 4'h2;
  LUT1 Count_20_rt_94 (
    .I0(\Count<20> ),
    .O(Count_20_rt)
  );
  defparam Count_21_rt_95.INIT = 4'h2;
  LUT1 Count_21_rt_95 (
    .I0(\Count<21> ),
    .O(Count_21_rt)
  );
  defparam Count_22_rt_96.INIT = 4'h2;
  LUT1 Count_22_rt_96 (
    .I0(\Count<22> ),
    .O(Count_22_rt)
  );
  defparam Count_23_rt_97.INIT = 4'h2;
  LUT1 Count_23_rt_97 (
    .I0(\Count<23> ),
    .O(Count_23_rt)
  );
  defparam Count_24_rt_98.INIT = 4'h2;
  LUT1 Count_24_rt_98 (
    .I0(\Count<24> ),
    .O(Count_24_rt)
  );
  defparam Count_25_rt_99.INIT = 4'h2;
  LUT1 Count_25_rt_99 (
    .I0(\Count<25> ),
    .O(Count_25_rt)
  );
  defparam Count_26_rt_100.INIT = 4'h2;
  LUT1 Count_26_rt_100 (
    .I0(\Count<26> ),
    .O(Count_26_rt)
  );
  defparam Count_27_rt_101.INIT = 4'h2;
  LUT1 Count_27_rt_101 (
    .I0(\Count<27> ),
    .O(Count_27_rt)
  );
  defparam Count_28_rt_102.INIT = 4'h2;
  LUT1 Count_28_rt_102 (
    .I0(\Count<28> ),
    .O(Count_28_rt)
  );
  defparam _n0000134.INIT = 16'h4000;
  LUT4 _n0000134 (
    .I0(\_old_Count_95<1> ),
    .I1(\Count<0> ),
    .I2(\_old_Count_95<14> ),
    .I3(\_old_Count_95<8> ),
    .O(CHOICE2520)
  );
endmodule

module Monostable (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire N0;
  wire \Count<0> ;
  wire \Count<31> ;
  wire \Count<30> ;
  wire \Count<24> ;
  wire \Count<29> ;
  wire \Count<23> ;
  wire \Count<28> ;
  wire \Count<22> ;
  wire \Count<27> ;
  wire \Count<21> ;
  wire \Count<26> ;
  wire \Count<20> ;
  wire \Count<25> ;
  wire \Count<14> ;
  wire \Count<19> ;
  wire \Count<13> ;
  wire \Count<18> ;
  wire \Count<12> ;
  wire \Count<17> ;
  wire \Count<11> ;
  wire \Count<16> ;
  wire \Count<10> ;
  wire \Count<15> ;
  wire \Count<4> ;
  wire \Count<9> ;
  wire \Count<3> ;
  wire \Count<8> ;
  wire \Count<2> ;
  wire \Count<7> ;
  wire \Count<1> ;
  wire \Count<6> ;
  wire \Count<5> ;
  wire \Count__n0000<2> ;
  wire CHOICE1970;
  wire \Count__n0000<3> ;
  wire \Count__n0000<1> ;
  wire \Count__n0000<4> ;
  wire \Count__n0000<5> ;
  wire \Count__n0000<6> ;
  wire \Count__n0000<7> ;
  wire \Count__n0000<8> ;
  wire \Count__n0000<9> ;
  wire \Count__n0000<10> ;
  wire \Count__n0000<11> ;
  wire \Count__n0000<12> ;
  wire \Count__n0000<13> ;
  wire \Count__n0000<14> ;
  wire \Count__n0000<15> ;
  wire \Count__n0000<16> ;
  wire \Count__n0000<17> ;
  wire \Count__n0000<18> ;
  wire \Count__n0000<19> ;
  wire \Count__n0000<20> ;
  wire \Count__n0000<21> ;
  wire \Count__n0000<22> ;
  wire \Count__n0000<23> ;
  wire \Count__n0000<24> ;
  wire \Count__n0000<25> ;
  wire \Count__n0000<26> ;
  wire \Count__n0000<27> ;
  wire \Count__n0000<28> ;
  wire \Count__n0000<29> ;
  wire \Count__n0000<30> ;
  wire \Count__n0000<31> ;
  wire N1;
  wire \Monostable_Count__n0000<30>_cyo ;
  wire N3;
  wire \Monostable_Count__n0000<0>_cyo ;
  wire \Monostable_Count__n0000<1>_cyo ;
  wire \Monostable_Count__n0000<2>_cyo ;
  wire \Monostable_Count__n0000<3>_cyo ;
  wire \Monostable_Count__n0000<4>_cyo ;
  wire \Monostable_Count__n0000<5>_cyo ;
  wire \Monostable_Count__n0000<6>_cyo ;
  wire \Monostable_Count__n0000<7>_cyo ;
  wire \Monostable_Count__n0000<8>_cyo ;
  wire \Monostable_Count__n0000<9>_cyo ;
  wire \Monostable_Count__n0000<10>_cyo ;
  wire \Monostable_Count__n0000<11>_cyo ;
  wire \Monostable_Count__n0000<12>_cyo ;
  wire \Monostable_Count__n0000<13>_cyo ;
  wire \Monostable_Count__n0000<14>_cyo ;
  wire \Monostable_Count__n0000<15>_cyo ;
  wire \Monostable_Count__n0000<16>_cyo ;
  wire \Monostable_Count__n0000<17>_cyo ;
  wire \Monostable_Count__n0000<18>_cyo ;
  wire \Monostable_Count__n0000<19>_cyo ;
  wire \Monostable_Count__n0000<20>_cyo ;
  wire \Monostable_Count__n0000<21>_cyo ;
  wire \Monostable_Count__n0000<22>_cyo ;
  wire \Monostable_Count__n0000<23>_cyo ;
  wire \Monostable_Count__n0000<24>_cyo ;
  wire \Monostable_Count__n0000<25>_cyo ;
  wire \Monostable_Count__n0000<26>_cyo ;
  wire \Monostable_Count__n0000<27>_cyo ;
  wire \Monostable_Count__n0000<28>_cyo ;
  wire \Monostable_Count__n0000<29>_cyo ;
  wire N7;
  wire N31;
  wire CHOICE2322;
  wire CHOICE2304;
  wire CHOICE1974;
  wire CHOICE2313;
  wire CHOICE2328;
  wire CHOICE2334;
  wire CHOICE2308;
  wire Count_1_rt;
  wire Count_2_rt;
  wire Count_3_rt;
  wire Count_4_rt;
  wire Count_5_rt;
  wire Count_6_rt;
  wire Count_7_rt;
  wire Count_8_rt;
  wire Count_9_rt;
  wire Count_10_rt;
  wire Count_11_rt;
  wire Count_12_rt;
  wire Count_13_rt;
  wire Count_14_rt;
  wire Count_15_rt;
  wire Count_16_rt;
  wire Count_17_rt;
  wire Count_18_rt;
  wire Count_19_rt;
  wire Count_20_rt;
  wire Count_21_rt;
  wire Count_22_rt;
  wire Count_23_rt;
  wire Count_24_rt;
  wire Count_25_rt;
  wire Count_26_rt;
  wire Count_27_rt;
  wire Count_28_rt;
  wire Count_29_rt;
  wire Count_30_rt;
  wire Count_31_rt;
  GND XST_GND (
    .G(N0)
  );
  defparam _n0000112.INIT = 16'h0002;
  LUT4 _n0000112 (
    .I0(\Count<11> ),
    .I1(\Count<21> ),
    .I2(\Count<31> ),
    .I3(\Count<1> ),
    .O(CHOICE2322)
  );
  FDR Count_30 (
    .D(\Count__n0000<30> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<30> )
  );
  FDSE Out_103 (
    .D(N0),
    .S(In),
    .CE(_n0000),
    .C(Dclk),
    .Q(Out)
  );
  FDR Count_31 (
    .D(\Count__n0000<31> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<31> )
  );
  XORCY \Monostable_Count__n0000<31>_xor  (
    .CI(\Monostable_Count__n0000<30>_cyo ),
    .LI(Count_31_rt),
    .O(\Count__n0000<31> )
  );
  FDR Count_0 (
    .D(N3),
    .R(In),
    .C(Dclk),
    .Q(\Count<0> )
  );
  FDR Count_1 (
    .D(\Count__n0000<1> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<1> )
  );
  FDR Count_2 (
    .D(\Count__n0000<2> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<2> )
  );
  FDR Count_3 (
    .D(\Count__n0000<3> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<3> )
  );
  FDR Count_4 (
    .D(\Count__n0000<4> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<4> )
  );
  FDR Count_5 (
    .D(\Count__n0000<5> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<5> )
  );
  FDR Count_6 (
    .D(\Count__n0000<6> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<6> )
  );
  FDR Count_7 (
    .D(\Count__n0000<7> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<7> )
  );
  FDR Count_8 (
    .D(\Count__n0000<8> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<8> )
  );
  FDR Count_9 (
    .D(\Count__n0000<9> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<9> )
  );
  FDR Count_10 (
    .D(\Count__n0000<10> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<10> )
  );
  FDR Count_11 (
    .D(\Count__n0000<11> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<11> )
  );
  FDR Count_12 (
    .D(\Count__n0000<12> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<12> )
  );
  FDR Count_13 (
    .D(\Count__n0000<13> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<13> )
  );
  FDR Count_14 (
    .D(\Count__n0000<14> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<14> )
  );
  FDR Count_15 (
    .D(\Count__n0000<15> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<15> )
  );
  FDR Count_16 (
    .D(\Count__n0000<16> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<16> )
  );
  FDR Count_17 (
    .D(\Count__n0000<17> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<17> )
  );
  FDR Count_18 (
    .D(\Count__n0000<18> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<18> )
  );
  FDR Count_19 (
    .D(\Count__n0000<19> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<19> )
  );
  FDR Count_20 (
    .D(\Count__n0000<20> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<20> )
  );
  FDR Count_21 (
    .D(\Count__n0000<21> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<21> )
  );
  FDR Count_22 (
    .D(\Count__n0000<22> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<22> )
  );
  FDR Count_23 (
    .D(\Count__n0000<23> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<23> )
  );
  FDR Count_24 (
    .D(\Count__n0000<24> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<24> )
  );
  FDR Count_25 (
    .D(\Count__n0000<25> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<25> )
  );
  FDR Count_26 (
    .D(\Count__n0000<26> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<26> )
  );
  FDR Count_27 (
    .D(\Count__n0000<27> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<27> )
  );
  FDR Count_28 (
    .D(\Count__n0000<28> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<28> )
  );
  FDR Count_29 (
    .D(\Count__n0000<29> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<29> )
  );
  VCC XST_VCC (
    .P(N1)
  );
  defparam \Monostable_Count__n0000<0>lut .INIT = 4'h1;
  LUT1 \Monostable_Count__n0000<0>lut  (
    .I0(\Count<0> ),
    .O(N3)
  );
  MUXCY \Monostable_Count__n0000<0>cy  (
    .CI(N0),
    .DI(N1),
    .S(N3),
    .O(\Monostable_Count__n0000<0>_cyo )
  );
  defparam _n0000915.INIT = 16'hFFEF;
  LUT4 _n0000915 (
    .I0(\Count<19> ),
    .I1(\Count<9> ),
    .I2(\Count<8> ),
    .I3(\Count<29> ),
    .O(CHOICE1974)
  );
  MUXCY \Monostable_Count__n0000<1>cy  (
    .CI(\Monostable_Count__n0000<0>_cyo ),
    .DI(N0),
    .S(Count_1_rt),
    .O(\Monostable_Count__n0000<1>_cyo )
  );
  XORCY \Monostable_Count__n0000<1>_xor  (
    .CI(\Monostable_Count__n0000<0>_cyo ),
    .LI(Count_1_rt),
    .O(\Count__n0000<1> )
  );
  MUXCY \Monostable_Count__n0000<2>cy  (
    .CI(\Monostable_Count__n0000<1>_cyo ),
    .DI(N0),
    .S(Count_2_rt),
    .O(\Monostable_Count__n0000<2>_cyo )
  );
  XORCY \Monostable_Count__n0000<2>_xor  (
    .CI(\Monostable_Count__n0000<1>_cyo ),
    .LI(Count_2_rt),
    .O(\Count__n0000<2> )
  );
  MUXCY \Monostable_Count__n0000<3>cy  (
    .CI(\Monostable_Count__n0000<2>_cyo ),
    .DI(N0),
    .S(Count_3_rt),
    .O(\Monostable_Count__n0000<3>_cyo )
  );
  XORCY \Monostable_Count__n0000<3>_xor  (
    .CI(\Monostable_Count__n0000<2>_cyo ),
    .LI(Count_3_rt),
    .O(\Count__n0000<3> )
  );
  MUXCY \Monostable_Count__n0000<4>cy  (
    .CI(\Monostable_Count__n0000<3>_cyo ),
    .DI(N0),
    .S(Count_4_rt),
    .O(\Monostable_Count__n0000<4>_cyo )
  );
  XORCY \Monostable_Count__n0000<4>_xor  (
    .CI(\Monostable_Count__n0000<3>_cyo ),
    .LI(Count_4_rt),
    .O(\Count__n0000<4> )
  );
  MUXCY \Monostable_Count__n0000<5>cy  (
    .CI(\Monostable_Count__n0000<4>_cyo ),
    .DI(N0),
    .S(Count_5_rt),
    .O(\Monostable_Count__n0000<5>_cyo )
  );
  XORCY \Monostable_Count__n0000<5>_xor  (
    .CI(\Monostable_Count__n0000<4>_cyo ),
    .LI(Count_5_rt),
    .O(\Count__n0000<5> )
  );
  MUXCY \Monostable_Count__n0000<6>cy  (
    .CI(\Monostable_Count__n0000<5>_cyo ),
    .DI(N0),
    .S(Count_6_rt),
    .O(\Monostable_Count__n0000<6>_cyo )
  );
  XORCY \Monostable_Count__n0000<6>_xor  (
    .CI(\Monostable_Count__n0000<5>_cyo ),
    .LI(Count_6_rt),
    .O(\Count__n0000<6> )
  );
  MUXCY \Monostable_Count__n0000<7>cy  (
    .CI(\Monostable_Count__n0000<6>_cyo ),
    .DI(N0),
    .S(Count_7_rt),
    .O(\Monostable_Count__n0000<7>_cyo )
  );
  XORCY \Monostable_Count__n0000<7>_xor  (
    .CI(\Monostable_Count__n0000<6>_cyo ),
    .LI(Count_7_rt),
    .O(\Count__n0000<7> )
  );
  MUXCY \Monostable_Count__n0000<8>cy  (
    .CI(\Monostable_Count__n0000<7>_cyo ),
    .DI(N0),
    .S(Count_8_rt),
    .O(\Monostable_Count__n0000<8>_cyo )
  );
  XORCY \Monostable_Count__n0000<8>_xor  (
    .CI(\Monostable_Count__n0000<7>_cyo ),
    .LI(Count_8_rt),
    .O(\Count__n0000<8> )
  );
  MUXCY \Monostable_Count__n0000<9>cy  (
    .CI(\Monostable_Count__n0000<8>_cyo ),
    .DI(N0),
    .S(Count_9_rt),
    .O(\Monostable_Count__n0000<9>_cyo )
  );
  XORCY \Monostable_Count__n0000<9>_xor  (
    .CI(\Monostable_Count__n0000<8>_cyo ),
    .LI(Count_9_rt),
    .O(\Count__n0000<9> )
  );
  MUXCY \Monostable_Count__n0000<10>cy  (
    .CI(\Monostable_Count__n0000<9>_cyo ),
    .DI(N0),
    .S(Count_10_rt),
    .O(\Monostable_Count__n0000<10>_cyo )
  );
  XORCY \Monostable_Count__n0000<10>_xor  (
    .CI(\Monostable_Count__n0000<9>_cyo ),
    .LI(Count_10_rt),
    .O(\Count__n0000<10> )
  );
  MUXCY \Monostable_Count__n0000<11>cy  (
    .CI(\Monostable_Count__n0000<10>_cyo ),
    .DI(N0),
    .S(Count_11_rt),
    .O(\Monostable_Count__n0000<11>_cyo )
  );
  XORCY \Monostable_Count__n0000<11>_xor  (
    .CI(\Monostable_Count__n0000<10>_cyo ),
    .LI(Count_11_rt),
    .O(\Count__n0000<11> )
  );
  MUXCY \Monostable_Count__n0000<12>cy  (
    .CI(\Monostable_Count__n0000<11>_cyo ),
    .DI(N0),
    .S(Count_12_rt),
    .O(\Monostable_Count__n0000<12>_cyo )
  );
  XORCY \Monostable_Count__n0000<12>_xor  (
    .CI(\Monostable_Count__n0000<11>_cyo ),
    .LI(Count_12_rt),
    .O(\Count__n0000<12> )
  );
  MUXCY \Monostable_Count__n0000<13>cy  (
    .CI(\Monostable_Count__n0000<12>_cyo ),
    .DI(N0),
    .S(Count_13_rt),
    .O(\Monostable_Count__n0000<13>_cyo )
  );
  XORCY \Monostable_Count__n0000<13>_xor  (
    .CI(\Monostable_Count__n0000<12>_cyo ),
    .LI(Count_13_rt),
    .O(\Count__n0000<13> )
  );
  MUXCY \Monostable_Count__n0000<14>cy  (
    .CI(\Monostable_Count__n0000<13>_cyo ),
    .DI(N0),
    .S(Count_14_rt),
    .O(\Monostable_Count__n0000<14>_cyo )
  );
  XORCY \Monostable_Count__n0000<14>_xor  (
    .CI(\Monostable_Count__n0000<13>_cyo ),
    .LI(Count_14_rt),
    .O(\Count__n0000<14> )
  );
  MUXCY \Monostable_Count__n0000<15>cy  (
    .CI(\Monostable_Count__n0000<14>_cyo ),
    .DI(N0),
    .S(Count_15_rt),
    .O(\Monostable_Count__n0000<15>_cyo )
  );
  XORCY \Monostable_Count__n0000<15>_xor  (
    .CI(\Monostable_Count__n0000<14>_cyo ),
    .LI(Count_15_rt),
    .O(\Count__n0000<15> )
  );
  MUXCY \Monostable_Count__n0000<16>cy  (
    .CI(\Monostable_Count__n0000<15>_cyo ),
    .DI(N0),
    .S(Count_16_rt),
    .O(\Monostable_Count__n0000<16>_cyo )
  );
  XORCY \Monostable_Count__n0000<16>_xor  (
    .CI(\Monostable_Count__n0000<15>_cyo ),
    .LI(Count_16_rt),
    .O(\Count__n0000<16> )
  );
  MUXCY \Monostable_Count__n0000<17>cy  (
    .CI(\Monostable_Count__n0000<16>_cyo ),
    .DI(N0),
    .S(Count_17_rt),
    .O(\Monostable_Count__n0000<17>_cyo )
  );
  XORCY \Monostable_Count__n0000<17>_xor  (
    .CI(\Monostable_Count__n0000<16>_cyo ),
    .LI(Count_17_rt),
    .O(\Count__n0000<17> )
  );
  MUXCY \Monostable_Count__n0000<18>cy  (
    .CI(\Monostable_Count__n0000<17>_cyo ),
    .DI(N0),
    .S(Count_18_rt),
    .O(\Monostable_Count__n0000<18>_cyo )
  );
  XORCY \Monostable_Count__n0000<18>_xor  (
    .CI(\Monostable_Count__n0000<17>_cyo ),
    .LI(Count_18_rt),
    .O(\Count__n0000<18> )
  );
  MUXCY \Monostable_Count__n0000<19>cy  (
    .CI(\Monostable_Count__n0000<18>_cyo ),
    .DI(N0),
    .S(Count_19_rt),
    .O(\Monostable_Count__n0000<19>_cyo )
  );
  XORCY \Monostable_Count__n0000<19>_xor  (
    .CI(\Monostable_Count__n0000<18>_cyo ),
    .LI(Count_19_rt),
    .O(\Count__n0000<19> )
  );
  MUXCY \Monostable_Count__n0000<20>cy  (
    .CI(\Monostable_Count__n0000<19>_cyo ),
    .DI(N0),
    .S(Count_20_rt),
    .O(\Monostable_Count__n0000<20>_cyo )
  );
  XORCY \Monostable_Count__n0000<20>_xor  (
    .CI(\Monostable_Count__n0000<19>_cyo ),
    .LI(Count_20_rt),
    .O(\Count__n0000<20> )
  );
  MUXCY \Monostable_Count__n0000<21>cy  (
    .CI(\Monostable_Count__n0000<20>_cyo ),
    .DI(N0),
    .S(Count_21_rt),
    .O(\Monostable_Count__n0000<21>_cyo )
  );
  XORCY \Monostable_Count__n0000<21>_xor  (
    .CI(\Monostable_Count__n0000<20>_cyo ),
    .LI(Count_21_rt),
    .O(\Count__n0000<21> )
  );
  MUXCY \Monostable_Count__n0000<22>cy  (
    .CI(\Monostable_Count__n0000<21>_cyo ),
    .DI(N0),
    .S(Count_22_rt),
    .O(\Monostable_Count__n0000<22>_cyo )
  );
  XORCY \Monostable_Count__n0000<22>_xor  (
    .CI(\Monostable_Count__n0000<21>_cyo ),
    .LI(Count_22_rt),
    .O(\Count__n0000<22> )
  );
  MUXCY \Monostable_Count__n0000<23>cy  (
    .CI(\Monostable_Count__n0000<22>_cyo ),
    .DI(N0),
    .S(Count_23_rt),
    .O(\Monostable_Count__n0000<23>_cyo )
  );
  XORCY \Monostable_Count__n0000<23>_xor  (
    .CI(\Monostable_Count__n0000<22>_cyo ),
    .LI(Count_23_rt),
    .O(\Count__n0000<23> )
  );
  MUXCY \Monostable_Count__n0000<24>cy  (
    .CI(\Monostable_Count__n0000<23>_cyo ),
    .DI(N0),
    .S(Count_24_rt),
    .O(\Monostable_Count__n0000<24>_cyo )
  );
  XORCY \Monostable_Count__n0000<24>_xor  (
    .CI(\Monostable_Count__n0000<23>_cyo ),
    .LI(Count_24_rt),
    .O(\Count__n0000<24> )
  );
  MUXCY \Monostable_Count__n0000<25>cy  (
    .CI(\Monostable_Count__n0000<24>_cyo ),
    .DI(N0),
    .S(Count_25_rt),
    .O(\Monostable_Count__n0000<25>_cyo )
  );
  XORCY \Monostable_Count__n0000<25>_xor  (
    .CI(\Monostable_Count__n0000<24>_cyo ),
    .LI(Count_25_rt),
    .O(\Count__n0000<25> )
  );
  MUXCY \Monostable_Count__n0000<26>cy  (
    .CI(\Monostable_Count__n0000<25>_cyo ),
    .DI(N0),
    .S(Count_26_rt),
    .O(\Monostable_Count__n0000<26>_cyo )
  );
  XORCY \Monostable_Count__n0000<26>_xor  (
    .CI(\Monostable_Count__n0000<25>_cyo ),
    .LI(Count_26_rt),
    .O(\Count__n0000<26> )
  );
  MUXCY \Monostable_Count__n0000<27>cy  (
    .CI(\Monostable_Count__n0000<26>_cyo ),
    .DI(N0),
    .S(Count_27_rt),
    .O(\Monostable_Count__n0000<27>_cyo )
  );
  XORCY \Monostable_Count__n0000<27>_xor  (
    .CI(\Monostable_Count__n0000<26>_cyo ),
    .LI(Count_27_rt),
    .O(\Count__n0000<27> )
  );
  MUXCY \Monostable_Count__n0000<28>cy  (
    .CI(\Monostable_Count__n0000<27>_cyo ),
    .DI(N0),
    .S(Count_28_rt),
    .O(\Monostable_Count__n0000<28>_cyo )
  );
  XORCY \Monostable_Count__n0000<28>_xor  (
    .CI(\Monostable_Count__n0000<27>_cyo ),
    .LI(Count_28_rt),
    .O(\Count__n0000<28> )
  );
  MUXCY \Monostable_Count__n0000<29>cy  (
    .CI(\Monostable_Count__n0000<28>_cyo ),
    .DI(N0),
    .S(Count_29_rt),
    .O(\Monostable_Count__n0000<29>_cyo )
  );
  XORCY \Monostable_Count__n0000<29>_xor  (
    .CI(\Monostable_Count__n0000<28>_cyo ),
    .LI(Count_29_rt),
    .O(\Count__n0000<29> )
  );
  MUXCY \Monostable_Count__n0000<30>cy  (
    .CI(\Monostable_Count__n0000<29>_cyo ),
    .DI(N0),
    .S(Count_30_rt),
    .O(\Monostable_Count__n0000<30>_cyo )
  );
  XORCY \Monostable_Count__n0000<30>_xor  (
    .CI(\Monostable_Count__n0000<29>_cyo ),
    .LI(Count_30_rt),
    .O(\Count__n0000<30> )
  );
  defparam _n0000536.INIT = 16'hFFFE;
  LUT4 _n0000536 (
    .I0(CHOICE2304),
    .I1(CHOICE2308),
    .I2(CHOICE2313),
    .I3(N7),
    .O(N31)
  );
  defparam _n0000168.INIT = 16'h4000;
  LUT4 _n0000168 (
    .I0(N31),
    .I1(CHOICE2322),
    .I2(CHOICE2328),
    .I3(CHOICE2334),
    .O(_n0000)
  );
  defparam _n0000916.INIT = 4'hE;
  LUT2 _n0000916 (
    .I0(CHOICE1970),
    .I1(CHOICE1974),
    .O(N7)
  );
  defparam _n0000528.INIT = 16'hFFEF;
  LUT4 _n0000528 (
    .I0(\Count<25> ),
    .I1(\Count<15> ),
    .I2(\Count<5> ),
    .I3(\Count<4> ),
    .O(CHOICE2313)
  );
  defparam _n000097.INIT = 16'hFFEF;
  LUT4 _n000097 (
    .I0(\Count<27> ),
    .I1(\Count<28> ),
    .I2(\Count<7> ),
    .I3(\Count<18> ),
    .O(CHOICE1970)
  );
  defparam _n0000512.INIT = 16'hFFEF;
  LUT4 _n0000512 (
    .I0(\Count<23> ),
    .I1(\Count<24> ),
    .I2(\Count<3> ),
    .I3(\Count<14> ),
    .O(CHOICE2308)
  );
  defparam _n0000136.INIT = 16'h0002;
  LUT4 _n0000136 (
    .I0(\Count<10> ),
    .I1(\Count<20> ),
    .I2(\Count<30> ),
    .I3(\Count<0> ),
    .O(CHOICE2334)
  );
  defparam _n0000124.INIT = 16'h0002;
  LUT4 _n0000124 (
    .I0(\Count<2> ),
    .I1(\Count<13> ),
    .I2(\Count<12> ),
    .I3(\Count<22> ),
    .O(CHOICE2328)
  );
  defparam _n000054.INIT = 16'hFFFE;
  LUT4 _n000054 (
    .I0(\Count<16> ),
    .I1(\Count<26> ),
    .I2(\Count<6> ),
    .I3(\Count<17> ),
    .O(CHOICE2304)
  );
  defparam Count_1_rt_104.INIT = 4'h2;
  LUT1 Count_1_rt_104 (
    .I0(\Count<1> ),
    .O(Count_1_rt)
  );
  defparam Count_2_rt_105.INIT = 4'h2;
  LUT1 Count_2_rt_105 (
    .I0(\Count<2> ),
    .O(Count_2_rt)
  );
  defparam Count_3_rt_106.INIT = 4'h2;
  LUT1 Count_3_rt_106 (
    .I0(\Count<3> ),
    .O(Count_3_rt)
  );
  defparam Count_4_rt_107.INIT = 4'h2;
  LUT1 Count_4_rt_107 (
    .I0(\Count<4> ),
    .O(Count_4_rt)
  );
  defparam Count_5_rt_108.INIT = 4'h2;
  LUT1 Count_5_rt_108 (
    .I0(\Count<5> ),
    .O(Count_5_rt)
  );
  defparam Count_6_rt_109.INIT = 4'h2;
  LUT1 Count_6_rt_109 (
    .I0(\Count<6> ),
    .O(Count_6_rt)
  );
  defparam Count_7_rt_110.INIT = 4'h2;
  LUT1 Count_7_rt_110 (
    .I0(\Count<7> ),
    .O(Count_7_rt)
  );
  defparam Count_8_rt_111.INIT = 4'h2;
  LUT1 Count_8_rt_111 (
    .I0(\Count<8> ),
    .O(Count_8_rt)
  );
  defparam Count_9_rt_112.INIT = 4'h2;
  LUT1 Count_9_rt_112 (
    .I0(\Count<9> ),
    .O(Count_9_rt)
  );
  defparam Count_10_rt_113.INIT = 4'h2;
  LUT1 Count_10_rt_113 (
    .I0(\Count<10> ),
    .O(Count_10_rt)
  );
  defparam Count_11_rt_114.INIT = 4'h2;
  LUT1 Count_11_rt_114 (
    .I0(\Count<11> ),
    .O(Count_11_rt)
  );
  defparam Count_12_rt_115.INIT = 4'h2;
  LUT1 Count_12_rt_115 (
    .I0(\Count<12> ),
    .O(Count_12_rt)
  );
  defparam Count_13_rt_116.INIT = 4'h2;
  LUT1 Count_13_rt_116 (
    .I0(\Count<13> ),
    .O(Count_13_rt)
  );
  defparam Count_14_rt_117.INIT = 4'h2;
  LUT1 Count_14_rt_117 (
    .I0(\Count<14> ),
    .O(Count_14_rt)
  );
  defparam Count_15_rt_118.INIT = 4'h2;
  LUT1 Count_15_rt_118 (
    .I0(\Count<15> ),
    .O(Count_15_rt)
  );
  defparam Count_16_rt_119.INIT = 4'h2;
  LUT1 Count_16_rt_119 (
    .I0(\Count<16> ),
    .O(Count_16_rt)
  );
  defparam Count_17_rt_120.INIT = 4'h2;
  LUT1 Count_17_rt_120 (
    .I0(\Count<17> ),
    .O(Count_17_rt)
  );
  defparam Count_18_rt_121.INIT = 4'h2;
  LUT1 Count_18_rt_121 (
    .I0(\Count<18> ),
    .O(Count_18_rt)
  );
  defparam Count_19_rt_122.INIT = 4'h2;
  LUT1 Count_19_rt_122 (
    .I0(\Count<19> ),
    .O(Count_19_rt)
  );
  defparam Count_20_rt_123.INIT = 4'h2;
  LUT1 Count_20_rt_123 (
    .I0(\Count<20> ),
    .O(Count_20_rt)
  );
  defparam Count_21_rt_124.INIT = 4'h2;
  LUT1 Count_21_rt_124 (
    .I0(\Count<21> ),
    .O(Count_21_rt)
  );
  defparam Count_22_rt_125.INIT = 4'h2;
  LUT1 Count_22_rt_125 (
    .I0(\Count<22> ),
    .O(Count_22_rt)
  );
  defparam Count_23_rt_126.INIT = 4'h2;
  LUT1 Count_23_rt_126 (
    .I0(\Count<23> ),
    .O(Count_23_rt)
  );
  defparam Count_24_rt_127.INIT = 4'h2;
  LUT1 Count_24_rt_127 (
    .I0(\Count<24> ),
    .O(Count_24_rt)
  );
  defparam Count_25_rt_128.INIT = 4'h2;
  LUT1 Count_25_rt_128 (
    .I0(\Count<25> ),
    .O(Count_25_rt)
  );
  defparam Count_26_rt_129.INIT = 4'h2;
  LUT1 Count_26_rt_129 (
    .I0(\Count<26> ),
    .O(Count_26_rt)
  );
  defparam Count_27_rt_130.INIT = 4'h2;
  LUT1 Count_27_rt_130 (
    .I0(\Count<27> ),
    .O(Count_27_rt)
  );
  defparam Count_28_rt_131.INIT = 4'h2;
  LUT1 Count_28_rt_131 (
    .I0(\Count<28> ),
    .O(Count_28_rt)
  );
  defparam Count_29_rt_132.INIT = 4'h2;
  LUT1 Count_29_rt_132 (
    .I0(\Count<29> ),
    .O(Count_29_rt)
  );
  defparam Count_30_rt_133.INIT = 4'h2;
  LUT1 Count_30_rt_133 (
    .I0(\Count<30> ),
    .O(Count_30_rt)
  );
  defparam Count_31_rt_134.INIT = 4'h2;
  LUT1 Count_31_rt_134 (
    .I0(\Count<31> ),
    .O(Count_31_rt)
  );
endmodule

module DelayLine_4_4 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<40>__net44 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<40>__net42 ;
  wire \Mshreg_Bits<40>__net45 ;
  wire \NLW_Mshreg_Bits<40>_srl_21_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<40>_srl_19_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<40>_srl_20_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<40>_srl_21  (
    .A0(N1),
    .A1(N0),
    .A2(N0),
    .A3(N1),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<40>__net44 ),
    .Q(\Mshreg_Bits<40>__net45 ),
    .Q15(\NLW_Mshreg_Bits<40>_srl_21_Q15_UNCONNECTED )
  );
  FDR Edge_135 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<40>_0  (
    .D(\Mshreg_Bits<40>__net45 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<40>_srl_19  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<40>_srl_19_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<40>__net42 )
  );
  SRLC16E \Mshreg_Bits<40>_srl_20  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<40>__net42 ),
    .Q(\NLW_Mshreg_Bits<40>_srl_20_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<40>__net44 )
  );
endmodule

module CardReaderControl (
  d1, d2, e1, e2, f1, f2, h2, j1, k1, n1, r2, u2, a1, b1, c1, n2, p1, p2, r1, s2
);
  input d1;
  input d2;
  input e1;
  input e2;
  input f1;
  input f2;
  input h2;
  input j1;
  input k1;
  input n1;
  input r2;
  input u2;
  input a1;
  input b1;
  input c1;
  output n2;
  output p1;
  output p2;
  output r1;
  output s2;
  wire NlwRenamedSig_OI_p1;
  wire NlwRenamedSig_OI_r1;
  wire N5;
  wire card_done;
  wire data_ready;
  wire wtf;
  wire dr_clear;
  wire done_clear;
  wire N0;
  wire iot672;
  wire N11;
  wire N21;
  wire CHOICE1653;
  wire CHOICE1662;
  wire N56;
  wire CHOICE1661;
  wire N62;
  wire N64;
  assign
    p1 = NlwRenamedSig_OI_p1,
    r1 = NlwRenamedSig_OI_r1;
  defparam dr_clear1.INIT = 8'hFD;
  LUT3 dr_clear1 (
    .I0(n1),
    .I1(NlwRenamedSig_OI_r1),
    .I2(NlwRenamedSig_OI_p1),
    .O(dr_clear)
  );
  defparam io_bus_in_int_1.INIT = 4'h1;
  LUT2 io_bus_in_int_1 (
    .I0(card_done),
    .I1(data_ready),
    .O(n2)
  );
  defparam done_clear_136.INIT = 16'h80FF;
  LUT4 done_clear_136 (
    .I0(N21),
    .I1(N5),
    .I2(d1),
    .I3(n1),
    .O(done_clear)
  );
  FDC card_done_137 (
    .D(N0),
    .CLR(done_clear),
    .C(u2),
    .Q(card_done)
  );
  VCC XST_VCC (
    .P(N0)
  );
  GND XST_GND (
    .G(N11)
  );
  defparam iot6721.INIT = 8'h80;
  LUT3 iot6721 (
    .I0(N5),
    .I1(h2),
    .I2(d1),
    .O(iot672)
  );
  defparam iot6321.INIT = 16'h8000;
  LUT4 iot6321 (
    .I0(e1),
    .I1(N62),
    .I2(b1),
    .I3(e2),
    .O(NlwRenamedSig_OI_p1)
  );
  defparam wtf1.INIT = 8'hF7;
  LUT3 wtf1 (
    .I0(n1),
    .I1(r2),
    .I2(u2),
    .O(wtf)
  );
  FDP cr_read (
    .D(N11),
    .PRE(iot672),
    .C(wtf),
    .Q(s2)
  );
  defparam iot6341.INIT = 16'h8000;
  LUT4 iot6341 (
    .I0(e1),
    .I1(N64),
    .I2(b1),
    .I3(e2),
    .O(NlwRenamedSig_OI_r1)
  );
  defparam Ker5_SW0.INIT = 4'h8;
  LUT2 Ker5_SW0 (
    .I0(c1),
    .I1(a1),
    .O(N56)
  );
  defparam Ker5.INIT = 16'h8000;
  LUT4 Ker5 (
    .I0(b1),
    .I1(e1),
    .I2(d2),
    .I3(N56),
    .O(N5)
  );
  FDC data_ready_138 (
    .D(j1),
    .CLR(dr_clear),
    .C(k1),
    .Q(data_ready)
  );
  defparam done_clear_SW0.INIT = 4'hE;
  LUT2 done_clear_SW0 (
    .I0(h2),
    .I1(f1),
    .O(N21)
  );
  defparam io_bus_in_skip_49.INIT = 16'hFF4C;
  LUT4 io_bus_in_skip_49 (
    .I0(h2),
    .I1(CHOICE1653),
    .I2(r2),
    .I3(CHOICE1661),
    .O(CHOICE1662)
  );
  defparam io_bus_in_skip_63.INIT = 4'hD;
  LUT2 io_bus_in_skip_63 (
    .I0(N5),
    .I1(CHOICE1662),
    .O(p2)
  );
  defparam io_bus_in_skip_45.INIT = 16'h1333;
  LUT4 io_bus_in_skip_45 (
    .I0(f2),
    .I1(d1),
    .I2(data_ready),
    .I3(e2),
    .O(CHOICE1661)
  );
  defparam io_bus_in_skip_20.INIT = 16'h1F3F;
  LUT4 io_bus_in_skip_20 (
    .I0(e2),
    .I1(card_done),
    .I2(f2),
    .I3(data_ready),
    .O(CHOICE1653)
  );
  defparam iot6321_SW0.INIT = 16'h8000;
  LUT4_L iot6321_SW0 (
    .I0(h2),
    .I1(d2),
    .I2(c1),
    .I3(a1),
    .LO(N62)
  );
  defparam iot6341_SW0.INIT = 16'h8000;
  LUT4_L iot6341_SW0 (
    .I0(f1),
    .I1(d2),
    .I2(c1),
    .I3(a1),
    .LO(N64)
  );
endmodule

module ReaderControl (
  ad1, ad2, ae1, ae2, af1, af2, ah1, ah2, bd1, bd2, be1, be2, bf1, bf2, bh2, bj1, bk1, bm1, bm2, bn2, bp1, au2, av2, bs2, bu2, ak1, ak2, al2, an1, an2
, ap1, bk2, ap2, ar1, ar2, as1, as2, bp2, br1, br2, bs1
);
  input ad1;
  input ad2;
  input ae1;
  input ae2;
  input af1;
  input af2;
  input ah1;
  input ah2;
  input bd1;
  input bd2;
  input be1;
  input be2;
  input bf1;
  input bf2;
  input bh2;
  input bj1;
  input bk1;
  input bm1;
  input bm2;
  input bn2;
  input bp1;
  input au2;
  input av2;
  input bs2;
  output bu2;
  output ak1;
  output ak2;
  output al2;
  output an1;
  output an2;
  output ap1;
  output bk2;
  output ap2;
  output ar1;
  output ar2;
  output as1;
  output as2;
  output bp2;
  output br1;
  output br2;
  output bs1;
  wire NlwRenamedSig_OI_bu2;
  wire NlwRenamedSig_OI_bp2;
  wire NlwRenamedSig_OI_br1;
  wire rdr_flag;
  wire rdr_flag_clr;
  wire \rd<1> ;
  wire rdr_strobe;
  wire N20;
  wire rdr_run_set;
  wire power_N0;
  wire \rd<0> ;
  wire rdr_enable;
  wire enable_set;
  wire power_set;
  wire rdr_select;
  wire \rd<3> ;
  wire _n0002;
  wire N2;
  wire \rd<5> ;
  wire rdr_run;
  wire \rd<6> ;
  wire \rd<7> ;
  wire rdr_run_N0;
  wire _n0007;
  wire \rd<4> ;
  wire N0;
  wire \rd<2> ;
  wire N1;
  wire N13;
  wire N16;
  wire N18;
  wire N22;
  wire N23;
  assign
    bu2 = NlwRenamedSig_OI_bu2,
    bp2 = NlwRenamedSig_OI_bp2,
    br1 = NlwRenamedSig_OI_br1;
  VCC XST_VCC (
    .P(N0)
  );
  defparam rdr_run_Aclr_INV1.INIT = 4'h1;
  LUT1 rdr_run_Aclr_INV1 (
    .I0(bp1),
    .O(rdr_run_N0)
  );
  FDC rd_5 (
    .D(ae2),
    .CLR(rdr_run_set),
    .C(rdr_strobe),
    .Q(\rd<5> )
  );
  FDC rd_7 (
    .D(ad2),
    .CLR(rdr_run_set),
    .C(rdr_strobe),
    .Q(\rd<7> )
  );
  FDC rd_6 (
    .D(ad1),
    .CLR(rdr_run_set),
    .C(rdr_strobe),
    .Q(\rd<6> )
  );
  defparam power_Aset_INV1.INIT = 4'h1;
  LUT1 power_Aset_INV1 (
    .I0(bd1),
    .O(power_N0)
  );
  GND XST_GND (
    .G(N1)
  );
  FDC rd_1 (
    .D(af2),
    .CLR(rdr_run_set),
    .C(rdr_strobe),
    .Q(\rd<1> )
  );
  FDC rd_3 (
    .D(ah2),
    .CLR(rdr_run_set),
    .C(rdr_strobe),
    .Q(\rd<3> )
  );
  defparam rdr_select_SW2.INIT = 8'h80;
  LUT3_L rdr_select_SW2 (
    .I0(\rd<6> ),
    .I1(av2),
    .I2(be2),
    .LO(N18)
  );
  FDC rd_4 (
    .D(ae1),
    .CLR(rdr_run_set),
    .C(rdr_strobe),
    .Q(\rd<4> )
  );
  defparam rdr_run_set1.INIT = 8'h80;
  LUT3 rdr_run_set1 (
    .I0(bk1),
    .I1(bm2),
    .I2(rdr_select),
    .O(rdr_run_set)
  );
  defparam \io_bus_in_<4>1 .INIT = 8'h7F;
  LUT3 \io_bus_in_<4>1  (
    .I0(\rd<0> ),
    .I1(rdr_select),
    .I2(av2),
    .O(ap2)
  );
  defparam bk21.INIT = 4'h1;
  LUT1 bk21 (
    .I0(rdr_enable),
    .O(bk2)
  );
  defparam io_bus_in_skip_1.INIT = 8'h7F;
  LUT3 io_bus_in_skip_1 (
    .I0(rdr_select),
    .I1(au2),
    .I2(rdr_flag),
    .O(ak2)
  );
  FDCP rdr_enable_139 (
    .D(power_set),
    .CLR(_n0007),
    .PRE(enable_set),
    .C(bs2),
    .Q(rdr_enable)
  );
  defparam _n00071.INIT = 8'hF9;
  LUT3 _n00071 (
    .I0(NlwRenamedSig_OI_bu2),
    .I1(NlwRenamedSig_OI_bp2),
    .I2(rdr_run),
    .O(N2)
  );
  defparam ak11.INIT = 4'h1;
  LUT1 ak11 (
    .I0(rdr_run),
    .O(ak1)
  );
  defparam rdr_select_SW0.INIT = 8'h80;
  LUT3_D rdr_select_SW0 (
    .I0(bh2),
    .I1(be1),
    .I2(bd2),
    .LO(N22),
    .O(N13)
  );
  FDCP power (
    .D(power_set),
    .CLR(_n0002),
    .PRE(power_N0),
    .C(bn2),
    .Q(br2)
  );
  defparam \io_bus_in_<11>1 .INIT = 16'h7FFF;
  LUT4 \io_bus_in_<11>1  (
    .I0(bf1),
    .I1(bf2),
    .I2(N22),
    .I3(N16),
    .O(an1)
  );
  FDC rd_0 (
    .D(af1),
    .CLR(rdr_run_set),
    .C(rdr_strobe),
    .Q(\rd<0> )
  );
  FD a (
    .D(NlwRenamedSig_OI_br1),
    .C(bj1),
    .Q(NlwRenamedSig_OI_bp2)
  );
  defparam \io_bus_in_<10>1 .INIT = 16'h7FFF;
  LUT4 \io_bus_in_<10>1  (
    .I0(bf1),
    .I1(bf2),
    .I2(N13),
    .I3(N18),
    .O(ar2)
  );
  FD b (
    .D(NlwRenamedSig_OI_bp2),
    .C(bj1),
    .Q(NlwRenamedSig_OI_bu2)
  );
  FDCP rdr_run_140 (
    .D(N1),
    .CLR(rdr_run_N0),
    .PRE(rdr_run_set),
    .C(rdr_strobe),
    .Q(rdr_run)
  );
  FDC rdr_flag_141 (
    .D(N0),
    .CLR(rdr_flag_clr),
    .C(rdr_strobe),
    .Q(rdr_flag)
  );
  defparam \io_bus_in_<9>1 .INIT = 16'h7FFF;
  LUT4 \io_bus_in_<9>1  (
    .I0(bf1),
    .I1(bf2),
    .I2(N13),
    .I3(N20),
    .O(ap1)
  );
  defparam \io_bus_in_<8>1 .INIT = 8'h7F;
  LUT3 \io_bus_in_<8>1  (
    .I0(av2),
    .I1(\rd<4> ),
    .I2(N23),
    .O(as1)
  );
  defparam rdr_select_SW3.INIT = 8'h80;
  LUT3_L rdr_select_SW3 (
    .I0(\rd<5> ),
    .I1(av2),
    .I2(be2),
    .LO(N20)
  );
  defparam \io_bus_in_<6>1 .INIT = 8'h7F;
  LUT3 \io_bus_in_<6>1  (
    .I0(av2),
    .I1(\rd<2> ),
    .I2(rdr_select),
    .O(ar1)
  );
  defparam \io_bus_in_<5>1 .INIT = 8'h7F;
  LUT3 \io_bus_in_<5>1  (
    .I0(av2),
    .I1(\rd<1> ),
    .I2(rdr_select),
    .O(as2)
  );
  defparam br11.INIT = 4'h1;
  LUT1 br11 (
    .I0(NlwRenamedSig_OI_bu2),
    .O(NlwRenamedSig_OI_br1)
  );
  defparam bs11.INIT = 4'h1;
  LUT1 bs11 (
    .I0(NlwRenamedSig_OI_bp2),
    .O(bs1)
  );
  defparam rdr_strobe1.INIT = 8'h84;
  LUT3 rdr_strobe1 (
    .I0(NlwRenamedSig_OI_bp2),
    .I1(bs2),
    .I2(NlwRenamedSig_OI_bu2),
    .O(rdr_strobe)
  );
  defparam io_bus_in_int_1.INIT = 4'h1;
  LUT1 io_bus_in_int_1 (
    .I0(rdr_flag),
    .O(al2)
  );
  defparam rdr_select_142.INIT = 16'h8000;
  LUT4_D rdr_select_142 (
    .I0(bf2),
    .I1(bf1),
    .I2(be2),
    .I3(N13),
    .LO(N23),
    .O(rdr_select)
  );
  defparam enable_set1.INIT = 4'h8;
  LUT2 enable_set1 (
    .I0(power_set),
    .I1(bn2),
    .O(enable_set)
  );
  defparam power_set1.INIT = 16'hEBFF;
  LUT4 power_set1 (
    .I0(rdr_run),
    .I1(NlwRenamedSig_OI_bu2),
    .I2(NlwRenamedSig_OI_bp2),
    .I3(bm1),
    .O(power_set)
  );
  defparam _n00021.INIT = 4'h4;
  LUT2 _n00021 (
    .I0(bp1),
    .I1(bd1),
    .O(_n0002)
  );
  FDC rd_2 (
    .D(ah1),
    .CLR(rdr_run_set),
    .C(rdr_strobe),
    .Q(\rd<2> )
  );
  defparam _n00072.INIT = 16'h0455;
  LUT4 _n00072 (
    .I0(bp1),
    .I1(bm1),
    .I2(N2),
    .I3(bn2),
    .O(_n0007)
  );
  defparam \io_bus_in_<7>1 .INIT = 8'h7F;
  LUT3 \io_bus_in_<7>1  (
    .I0(av2),
    .I1(\rd<3> ),
    .I2(rdr_select),
    .O(an2)
  );
  defparam rdr_select_SW1.INIT = 8'h80;
  LUT3 rdr_select_SW1 (
    .I0(\rd<7> ),
    .I1(av2),
    .I2(be2),
    .O(N16)
  );
  defparam rdr_flag_clr1.INIT = 16'hF8FF;
  LUT4 rdr_flag_clr1 (
    .I0(av2),
    .I1(rdr_select),
    .I2(rdr_run_set),
    .I3(bp1),
    .O(rdr_flag_clr)
  );
endmodule

module Oscillator (
  Dclk, Enable, Out
);
  input Dclk;
  input Enable;
  output Out;
  wire \_old_Count_94<1> ;
  wire NlwRenamedSig_OI_Out;
  wire _n0000;
  wire _n0002;
  wire \_old_Count_94<0> ;
  wire \Count<31> ;
  wire \Count<25> ;
  wire \Count<30> ;
  wire \Count<24> ;
  wire \Count<29> ;
  wire \Count<23> ;
  wire \Count<28> ;
  wire \Count<22> ;
  wire \Count<27> ;
  wire \Count<21> ;
  wire \Count<26> ;
  wire \Count<15> ;
  wire \Count<20> ;
  wire \Count<14> ;
  wire \Count<19> ;
  wire \Count<13> ;
  wire \Count<18> ;
  wire \Count<12> ;
  wire \Count<17> ;
  wire \Count<11> ;
  wire \Count<16> ;
  wire \Count<5> ;
  wire \Count<10> ;
  wire \Count<4> ;
  wire \Count<9> ;
  wire \Count<3> ;
  wire \Count<8> ;
  wire \Count<2> ;
  wire \Count<7> ;
  wire \Count<1> ;
  wire \Count<6> ;
  wire \Count<0> ;
  wire \_old_Count_94<31> ;
  wire \_old_Count_94<30> ;
  wire \_old_Count_94<29> ;
  wire \_old_Count_94<28> ;
  wire \_old_Count_94<27> ;
  wire \_old_Count_94<26> ;
  wire \_old_Count_94<25> ;
  wire \_old_Count_94<24> ;
  wire \_old_Count_94<23> ;
  wire \_old_Count_94<22> ;
  wire \_old_Count_94<21> ;
  wire \_old_Count_94<20> ;
  wire \_old_Count_94<19> ;
  wire \_old_Count_94<18> ;
  wire \_old_Count_94<17> ;
  wire \_old_Count_94<16> ;
  wire \_old_Count_94<15> ;
  wire \_old_Count_94<14> ;
  wire \_old_Count_94<13> ;
  wire \_old_Count_94<12> ;
  wire \_old_Count_94<11> ;
  wire \_old_Count_94<10> ;
  wire \_old_Count_94<9> ;
  wire \_old_Count_94<8> ;
  wire \_old_Count_94<7> ;
  wire \_old_Count_94<6> ;
  wire \_old_Count_94<5> ;
  wire \_old_Count_94<4> ;
  wire \_old_Count_94<3> ;
  wire \_old_Count_94<2> ;
  wire N0;
  wire N1;
  wire \Oscillator__old_Count_94<30>_cyo ;
  wire CHOICE2447;
  wire \Oscillator__old_Count_94<0>_cyo ;
  wire \Oscillator__old_Count_94<1>_cyo ;
  wire \Oscillator__old_Count_94<2>_cyo ;
  wire \Oscillator__old_Count_94<3>_cyo ;
  wire \Oscillator__old_Count_94<4>_cyo ;
  wire \Oscillator__old_Count_94<5>_cyo ;
  wire \Oscillator__old_Count_94<6>_cyo ;
  wire \Oscillator__old_Count_94<7>_cyo ;
  wire \Oscillator__old_Count_94<8>_cyo ;
  wire \Oscillator__old_Count_94<9>_cyo ;
  wire \Oscillator__old_Count_94<10>_cyo ;
  wire \Oscillator__old_Count_94<11>_cyo ;
  wire \Oscillator__old_Count_94<12>_cyo ;
  wire \Oscillator__old_Count_94<13>_cyo ;
  wire \Oscillator__old_Count_94<14>_cyo ;
  wire \Oscillator__old_Count_94<15>_cyo ;
  wire \Oscillator__old_Count_94<16>_cyo ;
  wire \Oscillator__old_Count_94<17>_cyo ;
  wire \Oscillator__old_Count_94<18>_cyo ;
  wire \Oscillator__old_Count_94<19>_cyo ;
  wire \Oscillator__old_Count_94<20>_cyo ;
  wire \Oscillator__old_Count_94<21>_cyo ;
  wire \Oscillator__old_Count_94<22>_cyo ;
  wire \Oscillator__old_Count_94<23>_cyo ;
  wire \Oscillator__old_Count_94<24>_cyo ;
  wire \Oscillator__old_Count_94<25>_cyo ;
  wire \Oscillator__old_Count_94<26>_cyo ;
  wire \Oscillator__old_Count_94<27>_cyo ;
  wire \Oscillator__old_Count_94<28>_cyo ;
  wire \Oscillator__old_Count_94<29>_cyo ;
  wire Count_29_rt;
  wire CHOICE2463;
  wire CHOICE2471;
  wire CHOICE2477;
  wire CHOICE2452;
  wire Count_30_rt;
  wire CHOICE2444;
  wire N141;
  wire CHOICE2436;
  wire CHOICE2468;
  wire N139;
  wire Count_1_rt;
  wire Count_2_rt;
  wire Count_3_rt;
  wire Count_4_rt;
  wire Count_5_rt;
  wire Count_6_rt;
  wire Count_7_rt;
  wire Count_8_rt;
  wire Count_9_rt;
  wire Count_10_rt;
  wire Count_11_rt;
  wire Count_12_rt;
  wire Count_13_rt;
  wire Count_14_rt;
  wire Count_15_rt;
  wire Count_16_rt;
  wire Count_17_rt;
  wire Count_18_rt;
  wire Count_19_rt;
  wire Count_20_rt;
  wire Count_21_rt;
  wire Count_22_rt;
  wire Count_23_rt;
  wire Count_24_rt;
  wire Count_25_rt;
  wire Count_26_rt;
  wire Count_27_rt;
  wire Count_28_rt;
  assign
    Out = NlwRenamedSig_OI_Out;
  defparam _n00021.INIT = 4'h1;
  LUT1 _n00021 (
    .I0(NlwRenamedSig_OI_Out),
    .O(_n0002)
  );
  defparam _n0000199.INIT = 16'h8000;
  LUT4 _n0000199 (
    .I0(CHOICE2452),
    .I1(CHOICE2463),
    .I2(CHOICE2471),
    .I3(CHOICE2477),
    .O(_n0000)
  );
  XORCY \Oscillator__old_Count_94<31>_xor  (
    .CI(\Oscillator__old_Count_94<30>_cyo ),
    .LI(\Count<31> ),
    .O(\_old_Count_94<31> )
  );
  FDR Count_31 (
    .D(\_old_Count_94<31> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<31> )
  );
  FDE Out_143 (
    .D(_n0002),
    .CE(_n0000),
    .C(Dclk),
    .Q(NlwRenamedSig_OI_Out)
  );
  FDR Count_0 (
    .D(\_old_Count_94<0> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<0> )
  );
  FDR Count_1 (
    .D(\_old_Count_94<1> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<1> )
  );
  FDR Count_2 (
    .D(\_old_Count_94<2> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<2> )
  );
  FDR Count_3 (
    .D(\_old_Count_94<3> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<3> )
  );
  FDR Count_4 (
    .D(\_old_Count_94<4> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<4> )
  );
  FDR Count_5 (
    .D(\_old_Count_94<5> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<5> )
  );
  FDR Count_6 (
    .D(\_old_Count_94<6> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<6> )
  );
  FDR Count_7 (
    .D(\_old_Count_94<7> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<7> )
  );
  FDR Count_8 (
    .D(\_old_Count_94<8> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<8> )
  );
  FDR Count_9 (
    .D(\_old_Count_94<9> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<9> )
  );
  FDR Count_10 (
    .D(\_old_Count_94<10> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<10> )
  );
  FDR Count_11 (
    .D(\_old_Count_94<11> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<11> )
  );
  FDR Count_12 (
    .D(\_old_Count_94<12> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<12> )
  );
  FDR Count_13 (
    .D(\_old_Count_94<13> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<13> )
  );
  FDR Count_14 (
    .D(\_old_Count_94<14> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<14> )
  );
  FDR Count_15 (
    .D(\_old_Count_94<15> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<15> )
  );
  FDR Count_16 (
    .D(\_old_Count_94<16> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<16> )
  );
  FDR Count_17 (
    .D(\_old_Count_94<17> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<17> )
  );
  FDR Count_18 (
    .D(\_old_Count_94<18> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<18> )
  );
  FDR Count_19 (
    .D(\_old_Count_94<19> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<19> )
  );
  FDR Count_20 (
    .D(\_old_Count_94<20> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<20> )
  );
  FDR Count_21 (
    .D(\_old_Count_94<21> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<21> )
  );
  FDR Count_22 (
    .D(\_old_Count_94<22> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<22> )
  );
  FDR Count_23 (
    .D(\_old_Count_94<23> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<23> )
  );
  FDR Count_24 (
    .D(\_old_Count_94<24> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<24> )
  );
  FDR Count_25 (
    .D(\_old_Count_94<25> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<25> )
  );
  FDR Count_26 (
    .D(\_old_Count_94<26> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<26> )
  );
  FDR Count_27 (
    .D(\_old_Count_94<27> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<27> )
  );
  FDR Count_28 (
    .D(\_old_Count_94<28> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<28> )
  );
  FDR Count_29 (
    .D(\_old_Count_94<29> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<29> )
  );
  FDR Count_30 (
    .D(\_old_Count_94<30> ),
    .R(_n0000),
    .C(Dclk),
    .Q(\Count<30> )
  );
  VCC XST_VCC (
    .P(N0)
  );
  GND XST_GND (
    .G(N1)
  );
  defparam \Oscillator__old_Count_94<0>lut .INIT = 4'h1;
  LUT1 \Oscillator__old_Count_94<0>lut  (
    .I0(\Count<0> ),
    .O(\_old_Count_94<0> )
  );
  MUXCY \Oscillator__old_Count_94<0>cy  (
    .CI(N1),
    .DI(N0),
    .S(\_old_Count_94<0> ),
    .O(\Oscillator__old_Count_94<0>_cyo )
  );
  defparam _n0000116.INIT = 16'h0001;
  LUT4 _n0000116 (
    .I0(\_old_Count_94<28> ),
    .I1(\_old_Count_94<27> ),
    .I2(\_old_Count_94<26> ),
    .I3(N141),
    .O(CHOICE2463)
  );
  MUXCY \Oscillator__old_Count_94<1>cy  (
    .CI(\Oscillator__old_Count_94<0>_cyo ),
    .DI(N1),
    .S(Count_1_rt),
    .O(\Oscillator__old_Count_94<1>_cyo )
  );
  XORCY \Oscillator__old_Count_94<1>_xor  (
    .CI(\Oscillator__old_Count_94<0>_cyo ),
    .LI(Count_1_rt),
    .O(\_old_Count_94<1> )
  );
  MUXCY \Oscillator__old_Count_94<2>cy  (
    .CI(\Oscillator__old_Count_94<1>_cyo ),
    .DI(N1),
    .S(Count_2_rt),
    .O(\Oscillator__old_Count_94<2>_cyo )
  );
  XORCY \Oscillator__old_Count_94<2>_xor  (
    .CI(\Oscillator__old_Count_94<1>_cyo ),
    .LI(Count_2_rt),
    .O(\_old_Count_94<2> )
  );
  MUXCY \Oscillator__old_Count_94<3>cy  (
    .CI(\Oscillator__old_Count_94<2>_cyo ),
    .DI(N1),
    .S(Count_3_rt),
    .O(\Oscillator__old_Count_94<3>_cyo )
  );
  XORCY \Oscillator__old_Count_94<3>_xor  (
    .CI(\Oscillator__old_Count_94<2>_cyo ),
    .LI(Count_3_rt),
    .O(\_old_Count_94<3> )
  );
  MUXCY \Oscillator__old_Count_94<4>cy  (
    .CI(\Oscillator__old_Count_94<3>_cyo ),
    .DI(N1),
    .S(Count_4_rt),
    .O(\Oscillator__old_Count_94<4>_cyo )
  );
  XORCY \Oscillator__old_Count_94<4>_xor  (
    .CI(\Oscillator__old_Count_94<3>_cyo ),
    .LI(Count_4_rt),
    .O(\_old_Count_94<4> )
  );
  MUXCY \Oscillator__old_Count_94<5>cy  (
    .CI(\Oscillator__old_Count_94<4>_cyo ),
    .DI(N1),
    .S(Count_5_rt),
    .O(\Oscillator__old_Count_94<5>_cyo )
  );
  XORCY \Oscillator__old_Count_94<5>_xor  (
    .CI(\Oscillator__old_Count_94<4>_cyo ),
    .LI(Count_5_rt),
    .O(\_old_Count_94<5> )
  );
  MUXCY \Oscillator__old_Count_94<6>cy  (
    .CI(\Oscillator__old_Count_94<5>_cyo ),
    .DI(N1),
    .S(Count_6_rt),
    .O(\Oscillator__old_Count_94<6>_cyo )
  );
  XORCY \Oscillator__old_Count_94<6>_xor  (
    .CI(\Oscillator__old_Count_94<5>_cyo ),
    .LI(Count_6_rt),
    .O(\_old_Count_94<6> )
  );
  MUXCY \Oscillator__old_Count_94<7>cy  (
    .CI(\Oscillator__old_Count_94<6>_cyo ),
    .DI(N1),
    .S(Count_7_rt),
    .O(\Oscillator__old_Count_94<7>_cyo )
  );
  XORCY \Oscillator__old_Count_94<7>_xor  (
    .CI(\Oscillator__old_Count_94<6>_cyo ),
    .LI(Count_7_rt),
    .O(\_old_Count_94<7> )
  );
  MUXCY \Oscillator__old_Count_94<8>cy  (
    .CI(\Oscillator__old_Count_94<7>_cyo ),
    .DI(N1),
    .S(Count_8_rt),
    .O(\Oscillator__old_Count_94<8>_cyo )
  );
  XORCY \Oscillator__old_Count_94<8>_xor  (
    .CI(\Oscillator__old_Count_94<7>_cyo ),
    .LI(Count_8_rt),
    .O(\_old_Count_94<8> )
  );
  MUXCY \Oscillator__old_Count_94<9>cy  (
    .CI(\Oscillator__old_Count_94<8>_cyo ),
    .DI(N1),
    .S(Count_9_rt),
    .O(\Oscillator__old_Count_94<9>_cyo )
  );
  XORCY \Oscillator__old_Count_94<9>_xor  (
    .CI(\Oscillator__old_Count_94<8>_cyo ),
    .LI(Count_9_rt),
    .O(\_old_Count_94<9> )
  );
  MUXCY \Oscillator__old_Count_94<10>cy  (
    .CI(\Oscillator__old_Count_94<9>_cyo ),
    .DI(N1),
    .S(Count_10_rt),
    .O(\Oscillator__old_Count_94<10>_cyo )
  );
  XORCY \Oscillator__old_Count_94<10>_xor  (
    .CI(\Oscillator__old_Count_94<9>_cyo ),
    .LI(Count_10_rt),
    .O(\_old_Count_94<10> )
  );
  MUXCY \Oscillator__old_Count_94<11>cy  (
    .CI(\Oscillator__old_Count_94<10>_cyo ),
    .DI(N1),
    .S(Count_11_rt),
    .O(\Oscillator__old_Count_94<11>_cyo )
  );
  XORCY \Oscillator__old_Count_94<11>_xor  (
    .CI(\Oscillator__old_Count_94<10>_cyo ),
    .LI(Count_11_rt),
    .O(\_old_Count_94<11> )
  );
  MUXCY \Oscillator__old_Count_94<12>cy  (
    .CI(\Oscillator__old_Count_94<11>_cyo ),
    .DI(N1),
    .S(Count_12_rt),
    .O(\Oscillator__old_Count_94<12>_cyo )
  );
  XORCY \Oscillator__old_Count_94<12>_xor  (
    .CI(\Oscillator__old_Count_94<11>_cyo ),
    .LI(Count_12_rt),
    .O(\_old_Count_94<12> )
  );
  MUXCY \Oscillator__old_Count_94<13>cy  (
    .CI(\Oscillator__old_Count_94<12>_cyo ),
    .DI(N1),
    .S(Count_13_rt),
    .O(\Oscillator__old_Count_94<13>_cyo )
  );
  XORCY \Oscillator__old_Count_94<13>_xor  (
    .CI(\Oscillator__old_Count_94<12>_cyo ),
    .LI(Count_13_rt),
    .O(\_old_Count_94<13> )
  );
  MUXCY \Oscillator__old_Count_94<14>cy  (
    .CI(\Oscillator__old_Count_94<13>_cyo ),
    .DI(N1),
    .S(Count_14_rt),
    .O(\Oscillator__old_Count_94<14>_cyo )
  );
  XORCY \Oscillator__old_Count_94<14>_xor  (
    .CI(\Oscillator__old_Count_94<13>_cyo ),
    .LI(Count_14_rt),
    .O(\_old_Count_94<14> )
  );
  MUXCY \Oscillator__old_Count_94<15>cy  (
    .CI(\Oscillator__old_Count_94<14>_cyo ),
    .DI(N1),
    .S(Count_15_rt),
    .O(\Oscillator__old_Count_94<15>_cyo )
  );
  XORCY \Oscillator__old_Count_94<15>_xor  (
    .CI(\Oscillator__old_Count_94<14>_cyo ),
    .LI(Count_15_rt),
    .O(\_old_Count_94<15> )
  );
  MUXCY \Oscillator__old_Count_94<16>cy  (
    .CI(\Oscillator__old_Count_94<15>_cyo ),
    .DI(N1),
    .S(Count_16_rt),
    .O(\Oscillator__old_Count_94<16>_cyo )
  );
  XORCY \Oscillator__old_Count_94<16>_xor  (
    .CI(\Oscillator__old_Count_94<15>_cyo ),
    .LI(Count_16_rt),
    .O(\_old_Count_94<16> )
  );
  MUXCY \Oscillator__old_Count_94<17>cy  (
    .CI(\Oscillator__old_Count_94<16>_cyo ),
    .DI(N1),
    .S(Count_17_rt),
    .O(\Oscillator__old_Count_94<17>_cyo )
  );
  XORCY \Oscillator__old_Count_94<17>_xor  (
    .CI(\Oscillator__old_Count_94<16>_cyo ),
    .LI(Count_17_rt),
    .O(\_old_Count_94<17> )
  );
  MUXCY \Oscillator__old_Count_94<18>cy  (
    .CI(\Oscillator__old_Count_94<17>_cyo ),
    .DI(N1),
    .S(Count_18_rt),
    .O(\Oscillator__old_Count_94<18>_cyo )
  );
  XORCY \Oscillator__old_Count_94<18>_xor  (
    .CI(\Oscillator__old_Count_94<17>_cyo ),
    .LI(Count_18_rt),
    .O(\_old_Count_94<18> )
  );
  MUXCY \Oscillator__old_Count_94<19>cy  (
    .CI(\Oscillator__old_Count_94<18>_cyo ),
    .DI(N1),
    .S(Count_19_rt),
    .O(\Oscillator__old_Count_94<19>_cyo )
  );
  XORCY \Oscillator__old_Count_94<19>_xor  (
    .CI(\Oscillator__old_Count_94<18>_cyo ),
    .LI(Count_19_rt),
    .O(\_old_Count_94<19> )
  );
  MUXCY \Oscillator__old_Count_94<20>cy  (
    .CI(\Oscillator__old_Count_94<19>_cyo ),
    .DI(N1),
    .S(Count_20_rt),
    .O(\Oscillator__old_Count_94<20>_cyo )
  );
  XORCY \Oscillator__old_Count_94<20>_xor  (
    .CI(\Oscillator__old_Count_94<19>_cyo ),
    .LI(Count_20_rt),
    .O(\_old_Count_94<20> )
  );
  MUXCY \Oscillator__old_Count_94<21>cy  (
    .CI(\Oscillator__old_Count_94<20>_cyo ),
    .DI(N1),
    .S(Count_21_rt),
    .O(\Oscillator__old_Count_94<21>_cyo )
  );
  XORCY \Oscillator__old_Count_94<21>_xor  (
    .CI(\Oscillator__old_Count_94<20>_cyo ),
    .LI(Count_21_rt),
    .O(\_old_Count_94<21> )
  );
  MUXCY \Oscillator__old_Count_94<22>cy  (
    .CI(\Oscillator__old_Count_94<21>_cyo ),
    .DI(N1),
    .S(Count_22_rt),
    .O(\Oscillator__old_Count_94<22>_cyo )
  );
  XORCY \Oscillator__old_Count_94<22>_xor  (
    .CI(\Oscillator__old_Count_94<21>_cyo ),
    .LI(Count_22_rt),
    .O(\_old_Count_94<22> )
  );
  MUXCY \Oscillator__old_Count_94<23>cy  (
    .CI(\Oscillator__old_Count_94<22>_cyo ),
    .DI(N1),
    .S(Count_23_rt),
    .O(\Oscillator__old_Count_94<23>_cyo )
  );
  XORCY \Oscillator__old_Count_94<23>_xor  (
    .CI(\Oscillator__old_Count_94<22>_cyo ),
    .LI(Count_23_rt),
    .O(\_old_Count_94<23> )
  );
  MUXCY \Oscillator__old_Count_94<24>cy  (
    .CI(\Oscillator__old_Count_94<23>_cyo ),
    .DI(N1),
    .S(Count_24_rt),
    .O(\Oscillator__old_Count_94<24>_cyo )
  );
  XORCY \Oscillator__old_Count_94<24>_xor  (
    .CI(\Oscillator__old_Count_94<23>_cyo ),
    .LI(Count_24_rt),
    .O(\_old_Count_94<24> )
  );
  MUXCY \Oscillator__old_Count_94<25>cy  (
    .CI(\Oscillator__old_Count_94<24>_cyo ),
    .DI(N1),
    .S(Count_25_rt),
    .O(\Oscillator__old_Count_94<25>_cyo )
  );
  XORCY \Oscillator__old_Count_94<25>_xor  (
    .CI(\Oscillator__old_Count_94<24>_cyo ),
    .LI(Count_25_rt),
    .O(\_old_Count_94<25> )
  );
  MUXCY \Oscillator__old_Count_94<26>cy  (
    .CI(\Oscillator__old_Count_94<25>_cyo ),
    .DI(N1),
    .S(Count_26_rt),
    .O(\Oscillator__old_Count_94<26>_cyo )
  );
  XORCY \Oscillator__old_Count_94<26>_xor  (
    .CI(\Oscillator__old_Count_94<25>_cyo ),
    .LI(Count_26_rt),
    .O(\_old_Count_94<26> )
  );
  MUXCY \Oscillator__old_Count_94<27>cy  (
    .CI(\Oscillator__old_Count_94<26>_cyo ),
    .DI(N1),
    .S(Count_27_rt),
    .O(\Oscillator__old_Count_94<27>_cyo )
  );
  XORCY \Oscillator__old_Count_94<27>_xor  (
    .CI(\Oscillator__old_Count_94<26>_cyo ),
    .LI(Count_27_rt),
    .O(\_old_Count_94<27> )
  );
  MUXCY \Oscillator__old_Count_94<28>cy  (
    .CI(\Oscillator__old_Count_94<27>_cyo ),
    .DI(N1),
    .S(Count_28_rt),
    .O(\Oscillator__old_Count_94<28>_cyo )
  );
  XORCY \Oscillator__old_Count_94<28>_xor  (
    .CI(\Oscillator__old_Count_94<27>_cyo ),
    .LI(Count_28_rt),
    .O(\_old_Count_94<28> )
  );
  MUXCY \Oscillator__old_Count_94<29>cy  (
    .CI(\Oscillator__old_Count_94<28>_cyo ),
    .DI(N1),
    .S(Count_29_rt),
    .O(\Oscillator__old_Count_94<29>_cyo )
  );
  XORCY \Oscillator__old_Count_94<29>_xor  (
    .CI(\Oscillator__old_Count_94<28>_cyo ),
    .LI(Count_29_rt),
    .O(\_old_Count_94<29> )
  );
  MUXCY \Oscillator__old_Count_94<30>cy  (
    .CI(\Oscillator__old_Count_94<29>_cyo ),
    .DI(N1),
    .S(Count_30_rt),
    .O(\Oscillator__old_Count_94<30>_cyo )
  );
  XORCY \Oscillator__old_Count_94<30>_xor  (
    .CI(\Oscillator__old_Count_94<29>_cyo ),
    .LI(Count_30_rt),
    .O(\_old_Count_94<30> )
  );
  defparam _n000016.INIT = 16'h0001;
  LUT4 _n000016 (
    .I0(\_old_Count_94<9> ),
    .I1(\_old_Count_94<2> ),
    .I2(\_old_Count_94<3> ),
    .I3(\_old_Count_94<17> ),
    .O(CHOICE2436)
  );
  defparam Count_29_rt_144.INIT = 4'h2;
  LUT1 Count_29_rt_144 (
    .I0(\Count<29> ),
    .O(Count_29_rt)
  );
  defparam _n0000164.INIT = 16'h0002;
  LUT4 _n0000164 (
    .I0(\_old_Count_94<15> ),
    .I1(\_old_Count_94<22> ),
    .I2(\_old_Count_94<16> ),
    .I3(\_old_Count_94<30> ),
    .O(CHOICE2477)
  );
  defparam _n000074.INIT = 16'h1000;
  LUT4 _n000074 (
    .I0(\_old_Count_94<31> ),
    .I1(N139),
    .I2(CHOICE2436),
    .I3(CHOICE2444),
    .O(CHOICE2452)
  );
  defparam _n0000145.INIT = 8'h10;
  LUT3 _n0000145 (
    .I0(\_old_Count_94<21> ),
    .I1(\_old_Count_94<29> ),
    .I2(CHOICE2468),
    .O(CHOICE2471)
  );
  defparam _n000074_SW0.INIT = 16'hFFEF;
  LUT4 _n000074_SW0 (
    .I0(\_old_Count_94<23> ),
    .I1(\_old_Count_94<25> ),
    .I2(CHOICE2447),
    .I3(\_old_Count_94<19> ),
    .O(N139)
  );
  defparam _n0000116_SW0.INIT = 16'hEFFF;
  LUT4 _n0000116_SW0 (
    .I0(\_old_Count_94<20> ),
    .I1(\_old_Count_94<13> ),
    .I2(\_old_Count_94<7> ),
    .I3(\_old_Count_94<6> ),
    .O(N141)
  );
  defparam _n000046.INIT = 16'h1000;
  LUT4 _n000046 (
    .I0(\_old_Count_94<24> ),
    .I1(\_old_Count_94<18> ),
    .I2(\_old_Count_94<11> ),
    .I3(\_old_Count_94<10> ),
    .O(CHOICE2444)
  );
  defparam _n000050.INIT = 8'h80;
  LUT3 _n000050 (
    .I0(\_old_Count_94<4> ),
    .I1(\_old_Count_94<5> ),
    .I2(\_old_Count_94<12> ),
    .O(CHOICE2447)
  );
  defparam Count_28_rt_145.INIT = 4'h2;
  LUT1 Count_28_rt_145 (
    .I0(\Count<28> ),
    .O(Count_28_rt)
  );
  defparam Count_30_rt_146.INIT = 4'h2;
  LUT1 Count_30_rt_146 (
    .I0(\Count<30> ),
    .O(Count_30_rt)
  );
  defparam Count_1_rt_147.INIT = 4'h2;
  LUT1 Count_1_rt_147 (
    .I0(\Count<1> ),
    .O(Count_1_rt)
  );
  defparam Count_2_rt_148.INIT = 4'h2;
  LUT1 Count_2_rt_148 (
    .I0(\Count<2> ),
    .O(Count_2_rt)
  );
  defparam Count_3_rt_149.INIT = 4'h2;
  LUT1 Count_3_rt_149 (
    .I0(\Count<3> ),
    .O(Count_3_rt)
  );
  defparam Count_4_rt_150.INIT = 4'h2;
  LUT1 Count_4_rt_150 (
    .I0(\Count<4> ),
    .O(Count_4_rt)
  );
  defparam Count_5_rt_151.INIT = 4'h2;
  LUT1 Count_5_rt_151 (
    .I0(\Count<5> ),
    .O(Count_5_rt)
  );
  defparam Count_6_rt_152.INIT = 4'h2;
  LUT1 Count_6_rt_152 (
    .I0(\Count<6> ),
    .O(Count_6_rt)
  );
  defparam Count_7_rt_153.INIT = 4'h2;
  LUT1 Count_7_rt_153 (
    .I0(\Count<7> ),
    .O(Count_7_rt)
  );
  defparam Count_8_rt_154.INIT = 4'h2;
  LUT1 Count_8_rt_154 (
    .I0(\Count<8> ),
    .O(Count_8_rt)
  );
  defparam Count_9_rt_155.INIT = 4'h2;
  LUT1 Count_9_rt_155 (
    .I0(\Count<9> ),
    .O(Count_9_rt)
  );
  defparam Count_10_rt_156.INIT = 4'h2;
  LUT1 Count_10_rt_156 (
    .I0(\Count<10> ),
    .O(Count_10_rt)
  );
  defparam Count_11_rt_157.INIT = 4'h2;
  LUT1 Count_11_rt_157 (
    .I0(\Count<11> ),
    .O(Count_11_rt)
  );
  defparam Count_12_rt_158.INIT = 4'h2;
  LUT1 Count_12_rt_158 (
    .I0(\Count<12> ),
    .O(Count_12_rt)
  );
  defparam Count_13_rt_159.INIT = 4'h2;
  LUT1 Count_13_rt_159 (
    .I0(\Count<13> ),
    .O(Count_13_rt)
  );
  defparam Count_14_rt_160.INIT = 4'h2;
  LUT1 Count_14_rt_160 (
    .I0(\Count<14> ),
    .O(Count_14_rt)
  );
  defparam Count_15_rt_161.INIT = 4'h2;
  LUT1 Count_15_rt_161 (
    .I0(\Count<15> ),
    .O(Count_15_rt)
  );
  defparam Count_16_rt_162.INIT = 4'h2;
  LUT1 Count_16_rt_162 (
    .I0(\Count<16> ),
    .O(Count_16_rt)
  );
  defparam Count_17_rt_163.INIT = 4'h2;
  LUT1 Count_17_rt_163 (
    .I0(\Count<17> ),
    .O(Count_17_rt)
  );
  defparam Count_18_rt_164.INIT = 4'h2;
  LUT1 Count_18_rt_164 (
    .I0(\Count<18> ),
    .O(Count_18_rt)
  );
  defparam Count_19_rt_165.INIT = 4'h2;
  LUT1 Count_19_rt_165 (
    .I0(\Count<19> ),
    .O(Count_19_rt)
  );
  defparam Count_20_rt_166.INIT = 4'h2;
  LUT1 Count_20_rt_166 (
    .I0(\Count<20> ),
    .O(Count_20_rt)
  );
  defparam Count_21_rt_167.INIT = 4'h2;
  LUT1 Count_21_rt_167 (
    .I0(\Count<21> ),
    .O(Count_21_rt)
  );
  defparam Count_22_rt_168.INIT = 4'h2;
  LUT1 Count_22_rt_168 (
    .I0(\Count<22> ),
    .O(Count_22_rt)
  );
  defparam Count_23_rt_169.INIT = 4'h2;
  LUT1 Count_23_rt_169 (
    .I0(\Count<23> ),
    .O(Count_23_rt)
  );
  defparam Count_24_rt_170.INIT = 4'h2;
  LUT1 Count_24_rt_170 (
    .I0(\Count<24> ),
    .O(Count_24_rt)
  );
  defparam Count_25_rt_171.INIT = 4'h2;
  LUT1 Count_25_rt_171 (
    .I0(\Count<25> ),
    .O(Count_25_rt)
  );
  defparam Count_26_rt_172.INIT = 4'h2;
  LUT1 Count_26_rt_172 (
    .I0(\Count<26> ),
    .O(Count_26_rt)
  );
  defparam Count_27_rt_173.INIT = 4'h2;
  LUT1 Count_27_rt_173 (
    .I0(\Count<27> ),
    .O(Count_27_rt)
  );
  defparam _n0000134.INIT = 16'h8000;
  LUT4 _n0000134 (
    .I0(\Count<0> ),
    .I1(\_old_Count_94<14> ),
    .I2(\_old_Count_94<1> ),
    .I3(\_old_Count_94<8> ),
    .O(CHOICE2468)
  );
endmodule

module DelayLine_5_2 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<35>__net51 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<35>__net49 ;
  wire \Mshreg_Bits<35>__net52 ;
  wire \NLW_Mshreg_Bits<35>_srl_24_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<35>_srl_22_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<35>_srl_23_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<35>_srl_24  (
    .A0(N0),
    .A1(N1),
    .A2(N1),
    .A3(N1),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<35>__net51 ),
    .Q(\Mshreg_Bits<35>__net52 ),
    .Q15(\NLW_Mshreg_Bits<35>_srl_24_Q15_UNCONNECTED )
  );
  FDR Edge_174 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<35>_0  (
    .D(\Mshreg_Bits<35>__net52 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<35>_srl_22  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<35>_srl_22_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<35>__net49 )
  );
  SRLC16E \Mshreg_Bits<35>_srl_23  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<35>__net49 ),
    .Q(\NLW_Mshreg_Bits<35>_srl_23_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<35>__net51 )
  );
endmodule

module DelayLine_4_3 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<40>__net44 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<40>__net42 ;
  wire \Mshreg_Bits<40>__net45 ;
  wire \NLW_Mshreg_Bits<40>_srl_21_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<40>_srl_19_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<40>_srl_20_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<40>_srl_21  (
    .A0(N1),
    .A1(N0),
    .A2(N0),
    .A3(N1),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<40>__net44 ),
    .Q(\Mshreg_Bits<40>__net45 ),
    .Q15(\NLW_Mshreg_Bits<40>_srl_21_Q15_UNCONNECTED )
  );
  FDR Edge_175 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<40>_0  (
    .D(\Mshreg_Bits<40>__net45 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<40>_srl_19  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<40>_srl_19_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<40>__net42 )
  );
  SRLC16E \Mshreg_Bits<40>_srl_20  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<40>__net42 ),
    .Q(\NLW_Mshreg_Bits<40>_srl_20_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<40>__net44 )
  );
endmodule

module DelayLine_5_1 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<35>__net51 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<35>__net49 ;
  wire \Mshreg_Bits<35>__net52 ;
  wire \NLW_Mshreg_Bits<35>_srl_24_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<35>_srl_22_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<35>_srl_23_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<35>_srl_24  (
    .A0(N0),
    .A1(N1),
    .A2(N1),
    .A3(N1),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<35>__net51 ),
    .Q(\Mshreg_Bits<35>__net52 ),
    .Q15(\NLW_Mshreg_Bits<35>_srl_24_Q15_UNCONNECTED )
  );
  FDR Edge_176 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<35>_0  (
    .D(\Mshreg_Bits<35>__net52 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<35>_srl_22  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<35>_srl_22_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<35>__net49 )
  );
  SRLC16E \Mshreg_Bits<35>_srl_23  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<35>__net49 ),
    .Q(\NLW_Mshreg_Bits<35>_srl_23_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<35>__net51 )
  );
endmodule

module DelayLine_1 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<30>__net2 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<30>__net1 ;
  wire \NLW_Mshreg_Bits<30>_srl_1_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<30>_srl_0_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<30>_srl_1  (
    .A0(N1),
    .A1(N1),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<30>__net1 ),
    .Q(\Mshreg_Bits<30>__net2 ),
    .Q15(\NLW_Mshreg_Bits<30>_srl_1_Q15_UNCONNECTED )
  );
  FDR Edge_177 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<30>_0  (
    .D(\Mshreg_Bits<30>__net2 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<30>_srl_0  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<30>_srl_0_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<30>__net1 )
  );
endmodule

module DelayLine_4_2 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<40>__net44 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<40>__net42 ;
  wire \Mshreg_Bits<40>__net45 ;
  wire \NLW_Mshreg_Bits<40>_srl_21_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<40>_srl_19_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<40>_srl_20_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<40>_srl_21  (
    .A0(N1),
    .A1(N0),
    .A2(N0),
    .A3(N1),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<40>__net44 ),
    .Q(\Mshreg_Bits<40>__net45 ),
    .Q15(\NLW_Mshreg_Bits<40>_srl_21_Q15_UNCONNECTED )
  );
  FDR Edge_178 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<40>_0  (
    .D(\Mshreg_Bits<40>__net45 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<40>_srl_19  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<40>_srl_19_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<40>__net42 )
  );
  SRLC16E \Mshreg_Bits<40>_srl_20  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<40>__net42 ),
    .Q(\NLW_Mshreg_Bits<40>_srl_20_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<40>__net44 )
  );
endmodule

module DelayLine_6 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<25>__net57 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<25>__net56 ;
  wire \NLW_Mshreg_Bits<25>_srl_26_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<25>_srl_25_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<25>_srl_26  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N1),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<25>__net56 ),
    .Q(\Mshreg_Bits<25>__net57 ),
    .Q15(\NLW_Mshreg_Bits<25>_srl_26_Q15_UNCONNECTED )
  );
  FDR Edge_179 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<25>_0  (
    .D(\Mshreg_Bits<25>__net57 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<25>_srl_25  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<25>_srl_25_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<25>__net56 )
  );
endmodule

module DelayLine_4_1 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<40>__net44 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<40>__net42 ;
  wire \Mshreg_Bits<40>__net45 ;
  wire \NLW_Mshreg_Bits<40>_srl_21_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<40>_srl_19_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<40>_srl_20_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<40>_srl_21  (
    .A0(N1),
    .A1(N0),
    .A2(N0),
    .A3(N1),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<40>__net44 ),
    .Q(\Mshreg_Bits<40>__net45 ),
    .Q15(\NLW_Mshreg_Bits<40>_srl_21_Q15_UNCONNECTED )
  );
  FDR Edge_180 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<40>_0  (
    .D(\Mshreg_Bits<40>__net45 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<40>_srl_19  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<40>_srl_19_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<40>__net42 )
  );
  SRLC16E \Mshreg_Bits<40>_srl_20  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<40>__net42 ),
    .Q(\NLW_Mshreg_Bits<40>_srl_20_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<40>__net44 )
  );
endmodule

module DelayLine (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<30>__net2 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<30>__net1 ;
  wire \NLW_Mshreg_Bits<30>_srl_1_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<30>_srl_0_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<30>_srl_1  (
    .A0(N1),
    .A1(N1),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<30>__net1 ),
    .Q(\Mshreg_Bits<30>__net2 ),
    .Q15(\NLW_Mshreg_Bits<30>_srl_1_Q15_UNCONNECTED )
  );
  FDR Edge_181 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<30>_0  (
    .D(\Mshreg_Bits<30>__net2 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<30>_srl_0  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<30>_srl_0_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<30>__net1 )
  );
endmodule

module Monostable_3_1 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire N0;
  wire \Count<0> ;
  wire \Count<31> ;
  wire \Count<30> ;
  wire \Count<24> ;
  wire \Count<29> ;
  wire \Count<23> ;
  wire \Count<28> ;
  wire \Count<22> ;
  wire \Count<27> ;
  wire \Count<21> ;
  wire \Count<26> ;
  wire \Count<20> ;
  wire \Count<25> ;
  wire \Count<14> ;
  wire \Count<19> ;
  wire \Count<13> ;
  wire \Count<18> ;
  wire \Count<12> ;
  wire \Count<17> ;
  wire \Count<11> ;
  wire \Count<16> ;
  wire \Count<10> ;
  wire \Count<15> ;
  wire \Count<4> ;
  wire \Count<9> ;
  wire \Count<3> ;
  wire \Count<8> ;
  wire \Count<2> ;
  wire \Count<7> ;
  wire \Count<1> ;
  wire \Count<6> ;
  wire \Count<5> ;
  wire \Count__n0000<2> ;
  wire CHOICE1960;
  wire \Count__n0000<3> ;
  wire \Count__n0000<1> ;
  wire \Count__n0000<4> ;
  wire \Count__n0000<5> ;
  wire \Count__n0000<6> ;
  wire \Count__n0000<7> ;
  wire \Count__n0000<8> ;
  wire \Count__n0000<9> ;
  wire \Count__n0000<10> ;
  wire \Count__n0000<11> ;
  wire \Count__n0000<12> ;
  wire \Count__n0000<13> ;
  wire \Count__n0000<14> ;
  wire \Count__n0000<15> ;
  wire \Count__n0000<16> ;
  wire \Count__n0000<17> ;
  wire \Count__n0000<18> ;
  wire \Count__n0000<19> ;
  wire \Count__n0000<20> ;
  wire \Count__n0000<21> ;
  wire \Count__n0000<22> ;
  wire \Count__n0000<23> ;
  wire \Count__n0000<24> ;
  wire \Count__n0000<25> ;
  wire \Count__n0000<26> ;
  wire \Count__n0000<27> ;
  wire \Count__n0000<28> ;
  wire \Count__n0000<29> ;
  wire \Count__n0000<30> ;
  wire \Count__n0000<31> ;
  wire N1;
  wire \Monostable_3_Count__n0000<30>_cyo ;
  wire N3;
  wire \Monostable_3_Count__n0000<0>_cyo ;
  wire \Monostable_3_Count__n0000<1>_cyo ;
  wire \Monostable_3_Count__n0000<2>_cyo ;
  wire \Monostable_3_Count__n0000<3>_cyo ;
  wire \Monostable_3_Count__n0000<4>_cyo ;
  wire \Monostable_3_Count__n0000<5>_cyo ;
  wire \Monostable_3_Count__n0000<6>_cyo ;
  wire \Monostable_3_Count__n0000<7>_cyo ;
  wire \Monostable_3_Count__n0000<8>_cyo ;
  wire \Monostable_3_Count__n0000<9>_cyo ;
  wire \Monostable_3_Count__n0000<10>_cyo ;
  wire \Monostable_3_Count__n0000<11>_cyo ;
  wire \Monostable_3_Count__n0000<12>_cyo ;
  wire \Monostable_3_Count__n0000<13>_cyo ;
  wire \Monostable_3_Count__n0000<14>_cyo ;
  wire \Monostable_3_Count__n0000<15>_cyo ;
  wire \Monostable_3_Count__n0000<16>_cyo ;
  wire \Monostable_3_Count__n0000<17>_cyo ;
  wire \Monostable_3_Count__n0000<18>_cyo ;
  wire \Monostable_3_Count__n0000<19>_cyo ;
  wire \Monostable_3_Count__n0000<20>_cyo ;
  wire \Monostable_3_Count__n0000<21>_cyo ;
  wire \Monostable_3_Count__n0000<22>_cyo ;
  wire \Monostable_3_Count__n0000<23>_cyo ;
  wire \Monostable_3_Count__n0000<24>_cyo ;
  wire \Monostable_3_Count__n0000<25>_cyo ;
  wire \Monostable_3_Count__n0000<26>_cyo ;
  wire \Monostable_3_Count__n0000<27>_cyo ;
  wire \Monostable_3_Count__n0000<28>_cyo ;
  wire \Monostable_3_Count__n0000<29>_cyo ;
  wire N7;
  wire N31;
  wire CHOICE2293;
  wire CHOICE2299;
  wire CHOICE1965;
  wire CHOICE2276;
  wire CHOICE2282;
  wire CHOICE2289;
  wire CHOICE2270;
  wire Count_1_rt;
  wire Count_2_rt;
  wire Count_3_rt;
  wire Count_4_rt;
  wire Count_5_rt;
  wire Count_6_rt;
  wire Count_7_rt;
  wire Count_8_rt;
  wire Count_9_rt;
  wire Count_10_rt;
  wire Count_11_rt;
  wire Count_12_rt;
  wire Count_13_rt;
  wire Count_14_rt;
  wire Count_15_rt;
  wire Count_16_rt;
  wire Count_17_rt;
  wire Count_18_rt;
  wire Count_19_rt;
  wire Count_20_rt;
  wire Count_21_rt;
  wire Count_22_rt;
  wire Count_23_rt;
  wire Count_24_rt;
  wire Count_25_rt;
  wire Count_26_rt;
  wire Count_27_rt;
  wire Count_28_rt;
  wire Count_29_rt;
  wire Count_30_rt;
  wire Count_31_rt;
  GND XST_GND (
    .G(N0)
  );
  defparam _n0000515.INIT = 16'hFFEF;
  LUT4 _n0000515 (
    .I0(\Count<24> ),
    .I1(\Count<3> ),
    .I2(\Count<14> ),
    .I3(\Count<23> ),
    .O(CHOICE2293)
  );
  FDR Count_30 (
    .D(\Count__n0000<30> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<30> )
  );
  FDSE Out_182 (
    .D(N0),
    .S(In),
    .CE(_n0000),
    .C(Dclk),
    .Q(Out)
  );
  FDR Count_31 (
    .D(\Count__n0000<31> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<31> )
  );
  XORCY \Monostable_3_Count__n0000<31>_xor  (
    .CI(\Monostable_3_Count__n0000<30>_cyo ),
    .LI(Count_31_rt),
    .O(\Count__n0000<31> )
  );
  FDR Count_0 (
    .D(N3),
    .R(In),
    .C(Dclk),
    .Q(\Count<0> )
  );
  FDR Count_1 (
    .D(\Count__n0000<1> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<1> )
  );
  FDR Count_2 (
    .D(\Count__n0000<2> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<2> )
  );
  FDR Count_3 (
    .D(\Count__n0000<3> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<3> )
  );
  FDR Count_4 (
    .D(\Count__n0000<4> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<4> )
  );
  FDR Count_5 (
    .D(\Count__n0000<5> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<5> )
  );
  FDR Count_6 (
    .D(\Count__n0000<6> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<6> )
  );
  FDR Count_7 (
    .D(\Count__n0000<7> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<7> )
  );
  FDR Count_8 (
    .D(\Count__n0000<8> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<8> )
  );
  FDR Count_9 (
    .D(\Count__n0000<9> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<9> )
  );
  FDR Count_10 (
    .D(\Count__n0000<10> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<10> )
  );
  FDR Count_11 (
    .D(\Count__n0000<11> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<11> )
  );
  FDR Count_12 (
    .D(\Count__n0000<12> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<12> )
  );
  FDR Count_13 (
    .D(\Count__n0000<13> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<13> )
  );
  FDR Count_14 (
    .D(\Count__n0000<14> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<14> )
  );
  FDR Count_15 (
    .D(\Count__n0000<15> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<15> )
  );
  FDR Count_16 (
    .D(\Count__n0000<16> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<16> )
  );
  FDR Count_17 (
    .D(\Count__n0000<17> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<17> )
  );
  FDR Count_18 (
    .D(\Count__n0000<18> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<18> )
  );
  FDR Count_19 (
    .D(\Count__n0000<19> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<19> )
  );
  FDR Count_20 (
    .D(\Count__n0000<20> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<20> )
  );
  FDR Count_21 (
    .D(\Count__n0000<21> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<21> )
  );
  FDR Count_22 (
    .D(\Count__n0000<22> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<22> )
  );
  FDR Count_23 (
    .D(\Count__n0000<23> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<23> )
  );
  FDR Count_24 (
    .D(\Count__n0000<24> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<24> )
  );
  FDR Count_25 (
    .D(\Count__n0000<25> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<25> )
  );
  FDR Count_26 (
    .D(\Count__n0000<26> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<26> )
  );
  FDR Count_27 (
    .D(\Count__n0000<27> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<27> )
  );
  FDR Count_28 (
    .D(\Count__n0000<28> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<28> )
  );
  FDR Count_29 (
    .D(\Count__n0000<29> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<29> )
  );
  VCC XST_VCC (
    .P(N1)
  );
  defparam \Monostable_3_Count__n0000<0>lut .INIT = 4'h1;
  LUT1 \Monostable_3_Count__n0000<0>lut  (
    .I0(\Count<0> ),
    .O(N3)
  );
  MUXCY \Monostable_3_Count__n0000<0>cy  (
    .CI(N0),
    .DI(N1),
    .S(N3),
    .O(\Monostable_3_Count__n0000<0>_cyo )
  );
  defparam _n0000535.INIT = 16'hEFFF;
  LUT4 _n0000535 (
    .I0(\Count<25> ),
    .I1(\Count<15> ),
    .I2(\Count<4> ),
    .I3(\Count<5> ),
    .O(CHOICE2299)
  );
  MUXCY \Monostable_3_Count__n0000<1>cy  (
    .CI(\Monostable_3_Count__n0000<0>_cyo ),
    .DI(N0),
    .S(Count_1_rt),
    .O(\Monostable_3_Count__n0000<1>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<1>_xor  (
    .CI(\Monostable_3_Count__n0000<0>_cyo ),
    .LI(Count_1_rt),
    .O(\Count__n0000<1> )
  );
  MUXCY \Monostable_3_Count__n0000<2>cy  (
    .CI(\Monostable_3_Count__n0000<1>_cyo ),
    .DI(N0),
    .S(Count_2_rt),
    .O(\Monostable_3_Count__n0000<2>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<2>_xor  (
    .CI(\Monostable_3_Count__n0000<1>_cyo ),
    .LI(Count_2_rt),
    .O(\Count__n0000<2> )
  );
  MUXCY \Monostable_3_Count__n0000<3>cy  (
    .CI(\Monostable_3_Count__n0000<2>_cyo ),
    .DI(N0),
    .S(Count_3_rt),
    .O(\Monostable_3_Count__n0000<3>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<3>_xor  (
    .CI(\Monostable_3_Count__n0000<2>_cyo ),
    .LI(Count_3_rt),
    .O(\Count__n0000<3> )
  );
  MUXCY \Monostable_3_Count__n0000<4>cy  (
    .CI(\Monostable_3_Count__n0000<3>_cyo ),
    .DI(N0),
    .S(Count_4_rt),
    .O(\Monostable_3_Count__n0000<4>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<4>_xor  (
    .CI(\Monostable_3_Count__n0000<3>_cyo ),
    .LI(Count_4_rt),
    .O(\Count__n0000<4> )
  );
  MUXCY \Monostable_3_Count__n0000<5>cy  (
    .CI(\Monostable_3_Count__n0000<4>_cyo ),
    .DI(N0),
    .S(Count_5_rt),
    .O(\Monostable_3_Count__n0000<5>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<5>_xor  (
    .CI(\Monostable_3_Count__n0000<4>_cyo ),
    .LI(Count_5_rt),
    .O(\Count__n0000<5> )
  );
  MUXCY \Monostable_3_Count__n0000<6>cy  (
    .CI(\Monostable_3_Count__n0000<5>_cyo ),
    .DI(N0),
    .S(Count_6_rt),
    .O(\Monostable_3_Count__n0000<6>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<6>_xor  (
    .CI(\Monostable_3_Count__n0000<5>_cyo ),
    .LI(Count_6_rt),
    .O(\Count__n0000<6> )
  );
  MUXCY \Monostable_3_Count__n0000<7>cy  (
    .CI(\Monostable_3_Count__n0000<6>_cyo ),
    .DI(N0),
    .S(Count_7_rt),
    .O(\Monostable_3_Count__n0000<7>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<7>_xor  (
    .CI(\Monostable_3_Count__n0000<6>_cyo ),
    .LI(Count_7_rt),
    .O(\Count__n0000<7> )
  );
  MUXCY \Monostable_3_Count__n0000<8>cy  (
    .CI(\Monostable_3_Count__n0000<7>_cyo ),
    .DI(N0),
    .S(Count_8_rt),
    .O(\Monostable_3_Count__n0000<8>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<8>_xor  (
    .CI(\Monostable_3_Count__n0000<7>_cyo ),
    .LI(Count_8_rt),
    .O(\Count__n0000<8> )
  );
  MUXCY \Monostable_3_Count__n0000<9>cy  (
    .CI(\Monostable_3_Count__n0000<8>_cyo ),
    .DI(N0),
    .S(Count_9_rt),
    .O(\Monostable_3_Count__n0000<9>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<9>_xor  (
    .CI(\Monostable_3_Count__n0000<8>_cyo ),
    .LI(Count_9_rt),
    .O(\Count__n0000<9> )
  );
  MUXCY \Monostable_3_Count__n0000<10>cy  (
    .CI(\Monostable_3_Count__n0000<9>_cyo ),
    .DI(N0),
    .S(Count_10_rt),
    .O(\Monostable_3_Count__n0000<10>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<10>_xor  (
    .CI(\Monostable_3_Count__n0000<9>_cyo ),
    .LI(Count_10_rt),
    .O(\Count__n0000<10> )
  );
  MUXCY \Monostable_3_Count__n0000<11>cy  (
    .CI(\Monostable_3_Count__n0000<10>_cyo ),
    .DI(N0),
    .S(Count_11_rt),
    .O(\Monostable_3_Count__n0000<11>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<11>_xor  (
    .CI(\Monostable_3_Count__n0000<10>_cyo ),
    .LI(Count_11_rt),
    .O(\Count__n0000<11> )
  );
  MUXCY \Monostable_3_Count__n0000<12>cy  (
    .CI(\Monostable_3_Count__n0000<11>_cyo ),
    .DI(N0),
    .S(Count_12_rt),
    .O(\Monostable_3_Count__n0000<12>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<12>_xor  (
    .CI(\Monostable_3_Count__n0000<11>_cyo ),
    .LI(Count_12_rt),
    .O(\Count__n0000<12> )
  );
  MUXCY \Monostable_3_Count__n0000<13>cy  (
    .CI(\Monostable_3_Count__n0000<12>_cyo ),
    .DI(N0),
    .S(Count_13_rt),
    .O(\Monostable_3_Count__n0000<13>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<13>_xor  (
    .CI(\Monostable_3_Count__n0000<12>_cyo ),
    .LI(Count_13_rt),
    .O(\Count__n0000<13> )
  );
  MUXCY \Monostable_3_Count__n0000<14>cy  (
    .CI(\Monostable_3_Count__n0000<13>_cyo ),
    .DI(N0),
    .S(Count_14_rt),
    .O(\Monostable_3_Count__n0000<14>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<14>_xor  (
    .CI(\Monostable_3_Count__n0000<13>_cyo ),
    .LI(Count_14_rt),
    .O(\Count__n0000<14> )
  );
  MUXCY \Monostable_3_Count__n0000<15>cy  (
    .CI(\Monostable_3_Count__n0000<14>_cyo ),
    .DI(N0),
    .S(Count_15_rt),
    .O(\Monostable_3_Count__n0000<15>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<15>_xor  (
    .CI(\Monostable_3_Count__n0000<14>_cyo ),
    .LI(Count_15_rt),
    .O(\Count__n0000<15> )
  );
  MUXCY \Monostable_3_Count__n0000<16>cy  (
    .CI(\Monostable_3_Count__n0000<15>_cyo ),
    .DI(N0),
    .S(Count_16_rt),
    .O(\Monostable_3_Count__n0000<16>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<16>_xor  (
    .CI(\Monostable_3_Count__n0000<15>_cyo ),
    .LI(Count_16_rt),
    .O(\Count__n0000<16> )
  );
  MUXCY \Monostable_3_Count__n0000<17>cy  (
    .CI(\Monostable_3_Count__n0000<16>_cyo ),
    .DI(N0),
    .S(Count_17_rt),
    .O(\Monostable_3_Count__n0000<17>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<17>_xor  (
    .CI(\Monostable_3_Count__n0000<16>_cyo ),
    .LI(Count_17_rt),
    .O(\Count__n0000<17> )
  );
  MUXCY \Monostable_3_Count__n0000<18>cy  (
    .CI(\Monostable_3_Count__n0000<17>_cyo ),
    .DI(N0),
    .S(Count_18_rt),
    .O(\Monostable_3_Count__n0000<18>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<18>_xor  (
    .CI(\Monostable_3_Count__n0000<17>_cyo ),
    .LI(Count_18_rt),
    .O(\Count__n0000<18> )
  );
  MUXCY \Monostable_3_Count__n0000<19>cy  (
    .CI(\Monostable_3_Count__n0000<18>_cyo ),
    .DI(N0),
    .S(Count_19_rt),
    .O(\Monostable_3_Count__n0000<19>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<19>_xor  (
    .CI(\Monostable_3_Count__n0000<18>_cyo ),
    .LI(Count_19_rt),
    .O(\Count__n0000<19> )
  );
  MUXCY \Monostable_3_Count__n0000<20>cy  (
    .CI(\Monostable_3_Count__n0000<19>_cyo ),
    .DI(N0),
    .S(Count_20_rt),
    .O(\Monostable_3_Count__n0000<20>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<20>_xor  (
    .CI(\Monostable_3_Count__n0000<19>_cyo ),
    .LI(Count_20_rt),
    .O(\Count__n0000<20> )
  );
  MUXCY \Monostable_3_Count__n0000<21>cy  (
    .CI(\Monostable_3_Count__n0000<20>_cyo ),
    .DI(N0),
    .S(Count_21_rt),
    .O(\Monostable_3_Count__n0000<21>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<21>_xor  (
    .CI(\Monostable_3_Count__n0000<20>_cyo ),
    .LI(Count_21_rt),
    .O(\Count__n0000<21> )
  );
  MUXCY \Monostable_3_Count__n0000<22>cy  (
    .CI(\Monostable_3_Count__n0000<21>_cyo ),
    .DI(N0),
    .S(Count_22_rt),
    .O(\Monostable_3_Count__n0000<22>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<22>_xor  (
    .CI(\Monostable_3_Count__n0000<21>_cyo ),
    .LI(Count_22_rt),
    .O(\Count__n0000<22> )
  );
  MUXCY \Monostable_3_Count__n0000<23>cy  (
    .CI(\Monostable_3_Count__n0000<22>_cyo ),
    .DI(N0),
    .S(Count_23_rt),
    .O(\Monostable_3_Count__n0000<23>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<23>_xor  (
    .CI(\Monostable_3_Count__n0000<22>_cyo ),
    .LI(Count_23_rt),
    .O(\Count__n0000<23> )
  );
  MUXCY \Monostable_3_Count__n0000<24>cy  (
    .CI(\Monostable_3_Count__n0000<23>_cyo ),
    .DI(N0),
    .S(Count_24_rt),
    .O(\Monostable_3_Count__n0000<24>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<24>_xor  (
    .CI(\Monostable_3_Count__n0000<23>_cyo ),
    .LI(Count_24_rt),
    .O(\Count__n0000<24> )
  );
  MUXCY \Monostable_3_Count__n0000<25>cy  (
    .CI(\Monostable_3_Count__n0000<24>_cyo ),
    .DI(N0),
    .S(Count_25_rt),
    .O(\Monostable_3_Count__n0000<25>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<25>_xor  (
    .CI(\Monostable_3_Count__n0000<24>_cyo ),
    .LI(Count_25_rt),
    .O(\Count__n0000<25> )
  );
  MUXCY \Monostable_3_Count__n0000<26>cy  (
    .CI(\Monostable_3_Count__n0000<25>_cyo ),
    .DI(N0),
    .S(Count_26_rt),
    .O(\Monostable_3_Count__n0000<26>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<26>_xor  (
    .CI(\Monostable_3_Count__n0000<25>_cyo ),
    .LI(Count_26_rt),
    .O(\Count__n0000<26> )
  );
  MUXCY \Monostable_3_Count__n0000<27>cy  (
    .CI(\Monostable_3_Count__n0000<26>_cyo ),
    .DI(N0),
    .S(Count_27_rt),
    .O(\Monostable_3_Count__n0000<27>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<27>_xor  (
    .CI(\Monostable_3_Count__n0000<26>_cyo ),
    .LI(Count_27_rt),
    .O(\Count__n0000<27> )
  );
  MUXCY \Monostable_3_Count__n0000<28>cy  (
    .CI(\Monostable_3_Count__n0000<27>_cyo ),
    .DI(N0),
    .S(Count_28_rt),
    .O(\Monostable_3_Count__n0000<28>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<28>_xor  (
    .CI(\Monostable_3_Count__n0000<27>_cyo ),
    .LI(Count_28_rt),
    .O(\Count__n0000<28> )
  );
  MUXCY \Monostable_3_Count__n0000<29>cy  (
    .CI(\Monostable_3_Count__n0000<28>_cyo ),
    .DI(N0),
    .S(Count_29_rt),
    .O(\Monostable_3_Count__n0000<29>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<29>_xor  (
    .CI(\Monostable_3_Count__n0000<28>_cyo ),
    .LI(Count_29_rt),
    .O(\Count__n0000<29> )
  );
  MUXCY \Monostable_3_Count__n0000<30>cy  (
    .CI(\Monostable_3_Count__n0000<29>_cyo ),
    .DI(N0),
    .S(Count_30_rt),
    .O(\Monostable_3_Count__n0000<30>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<30>_xor  (
    .CI(\Monostable_3_Count__n0000<29>_cyo ),
    .LI(Count_30_rt),
    .O(\Count__n0000<30> )
  );
  defparam _n0000544.INIT = 16'hFFFE;
  LUT4 _n0000544 (
    .I0(CHOICE2289),
    .I1(CHOICE2293),
    .I2(CHOICE2299),
    .I3(N7),
    .O(N31)
  );
  defparam _n0000169.INIT = 16'h4000;
  LUT4 _n0000169 (
    .I0(N31),
    .I1(CHOICE2270),
    .I2(CHOICE2276),
    .I3(CHOICE2282),
    .O(_n0000)
  );
  defparam _n0000113.INIT = 16'h0001;
  LUT4 _n0000113 (
    .I0(\Count<11> ),
    .I1(\Count<21> ),
    .I2(\Count<31> ),
    .I3(\Count<1> ),
    .O(CHOICE2270)
  );
  defparam _n0000125.INIT = 16'h0002;
  LUT4 _n0000125 (
    .I0(\Count<12> ),
    .I1(\Count<22> ),
    .I2(\Count<2> ),
    .I3(\Count<13> ),
    .O(CHOICE2276)
  );
  defparam _n000097.INIT = 16'hFFEF;
  LUT4 _n000097 (
    .I0(\Count<28> ),
    .I1(\Count<7> ),
    .I2(\Count<18> ),
    .I3(\Count<27> ),
    .O(CHOICE1960)
  );
  defparam _n0000137.INIT = 16'h0002;
  LUT4 _n0000137 (
    .I0(\Count<10> ),
    .I1(\Count<20> ),
    .I2(\Count<30> ),
    .I3(\Count<0> ),
    .O(CHOICE2282)
  );
  defparam _n0000918.INIT = 16'hEFFF;
  LUT4 _n0000918 (
    .I0(\Count<29> ),
    .I1(\Count<19> ),
    .I2(\Count<8> ),
    .I3(\Count<9> ),
    .O(CHOICE1965)
  );
  defparam _n000057.INIT = 16'hFFEF;
  LUT4 _n000057 (
    .I0(\Count<26> ),
    .I1(\Count<17> ),
    .I2(\Count<16> ),
    .I3(\Count<6> ),
    .O(CHOICE2289)
  );
  defparam _n0000919.INIT = 4'hE;
  LUT2 _n0000919 (
    .I0(CHOICE1960),
    .I1(CHOICE1965),
    .O(N7)
  );
  defparam Count_1_rt_183.INIT = 4'h2;
  LUT1 Count_1_rt_183 (
    .I0(\Count<1> ),
    .O(Count_1_rt)
  );
  defparam Count_2_rt_184.INIT = 4'h2;
  LUT1 Count_2_rt_184 (
    .I0(\Count<2> ),
    .O(Count_2_rt)
  );
  defparam Count_3_rt_185.INIT = 4'h2;
  LUT1 Count_3_rt_185 (
    .I0(\Count<3> ),
    .O(Count_3_rt)
  );
  defparam Count_4_rt_186.INIT = 4'h2;
  LUT1 Count_4_rt_186 (
    .I0(\Count<4> ),
    .O(Count_4_rt)
  );
  defparam Count_5_rt_187.INIT = 4'h2;
  LUT1 Count_5_rt_187 (
    .I0(\Count<5> ),
    .O(Count_5_rt)
  );
  defparam Count_6_rt_188.INIT = 4'h2;
  LUT1 Count_6_rt_188 (
    .I0(\Count<6> ),
    .O(Count_6_rt)
  );
  defparam Count_7_rt_189.INIT = 4'h2;
  LUT1 Count_7_rt_189 (
    .I0(\Count<7> ),
    .O(Count_7_rt)
  );
  defparam Count_8_rt_190.INIT = 4'h2;
  LUT1 Count_8_rt_190 (
    .I0(\Count<8> ),
    .O(Count_8_rt)
  );
  defparam Count_9_rt_191.INIT = 4'h2;
  LUT1 Count_9_rt_191 (
    .I0(\Count<9> ),
    .O(Count_9_rt)
  );
  defparam Count_10_rt_192.INIT = 4'h2;
  LUT1 Count_10_rt_192 (
    .I0(\Count<10> ),
    .O(Count_10_rt)
  );
  defparam Count_11_rt_193.INIT = 4'h2;
  LUT1 Count_11_rt_193 (
    .I0(\Count<11> ),
    .O(Count_11_rt)
  );
  defparam Count_12_rt_194.INIT = 4'h2;
  LUT1 Count_12_rt_194 (
    .I0(\Count<12> ),
    .O(Count_12_rt)
  );
  defparam Count_13_rt_195.INIT = 4'h2;
  LUT1 Count_13_rt_195 (
    .I0(\Count<13> ),
    .O(Count_13_rt)
  );
  defparam Count_14_rt_196.INIT = 4'h2;
  LUT1 Count_14_rt_196 (
    .I0(\Count<14> ),
    .O(Count_14_rt)
  );
  defparam Count_15_rt_197.INIT = 4'h2;
  LUT1 Count_15_rt_197 (
    .I0(\Count<15> ),
    .O(Count_15_rt)
  );
  defparam Count_16_rt_198.INIT = 4'h2;
  LUT1 Count_16_rt_198 (
    .I0(\Count<16> ),
    .O(Count_16_rt)
  );
  defparam Count_17_rt_199.INIT = 4'h2;
  LUT1 Count_17_rt_199 (
    .I0(\Count<17> ),
    .O(Count_17_rt)
  );
  defparam Count_18_rt_200.INIT = 4'h2;
  LUT1 Count_18_rt_200 (
    .I0(\Count<18> ),
    .O(Count_18_rt)
  );
  defparam Count_19_rt_201.INIT = 4'h2;
  LUT1 Count_19_rt_201 (
    .I0(\Count<19> ),
    .O(Count_19_rt)
  );
  defparam Count_20_rt_202.INIT = 4'h2;
  LUT1 Count_20_rt_202 (
    .I0(\Count<20> ),
    .O(Count_20_rt)
  );
  defparam Count_21_rt_203.INIT = 4'h2;
  LUT1 Count_21_rt_203 (
    .I0(\Count<21> ),
    .O(Count_21_rt)
  );
  defparam Count_22_rt_204.INIT = 4'h2;
  LUT1 Count_22_rt_204 (
    .I0(\Count<22> ),
    .O(Count_22_rt)
  );
  defparam Count_23_rt_205.INIT = 4'h2;
  LUT1 Count_23_rt_205 (
    .I0(\Count<23> ),
    .O(Count_23_rt)
  );
  defparam Count_24_rt_206.INIT = 4'h2;
  LUT1 Count_24_rt_206 (
    .I0(\Count<24> ),
    .O(Count_24_rt)
  );
  defparam Count_25_rt_207.INIT = 4'h2;
  LUT1 Count_25_rt_207 (
    .I0(\Count<25> ),
    .O(Count_25_rt)
  );
  defparam Count_26_rt_208.INIT = 4'h2;
  LUT1 Count_26_rt_208 (
    .I0(\Count<26> ),
    .O(Count_26_rt)
  );
  defparam Count_27_rt_209.INIT = 4'h2;
  LUT1 Count_27_rt_209 (
    .I0(\Count<27> ),
    .O(Count_27_rt)
  );
  defparam Count_28_rt_210.INIT = 4'h2;
  LUT1 Count_28_rt_210 (
    .I0(\Count<28> ),
    .O(Count_28_rt)
  );
  defparam Count_29_rt_211.INIT = 4'h2;
  LUT1 Count_29_rt_211 (
    .I0(\Count<29> ),
    .O(Count_29_rt)
  );
  defparam Count_30_rt_212.INIT = 4'h2;
  LUT1 Count_30_rt_212 (
    .I0(\Count<30> ),
    .O(Count_30_rt)
  );
  defparam Count_31_rt_213.INIT = 4'h2;
  LUT1 Count_31_rt_213 (
    .I0(\Count<31> ),
    .O(Count_31_rt)
  );
endmodule

module Monostable_3 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire N0;
  wire \Count<0> ;
  wire \Count<31> ;
  wire \Count<30> ;
  wire \Count<24> ;
  wire \Count<29> ;
  wire \Count<23> ;
  wire \Count<28> ;
  wire \Count<22> ;
  wire \Count<27> ;
  wire \Count<21> ;
  wire \Count<26> ;
  wire \Count<20> ;
  wire \Count<25> ;
  wire \Count<14> ;
  wire \Count<19> ;
  wire \Count<13> ;
  wire \Count<18> ;
  wire \Count<12> ;
  wire \Count<17> ;
  wire \Count<11> ;
  wire \Count<16> ;
  wire \Count<10> ;
  wire \Count<15> ;
  wire \Count<4> ;
  wire \Count<9> ;
  wire \Count<3> ;
  wire \Count<8> ;
  wire \Count<2> ;
  wire \Count<7> ;
  wire \Count<1> ;
  wire \Count<6> ;
  wire \Count<5> ;
  wire \Count__n0000<2> ;
  wire CHOICE1950;
  wire \Count__n0000<3> ;
  wire \Count__n0000<1> ;
  wire \Count__n0000<4> ;
  wire \Count__n0000<5> ;
  wire \Count__n0000<6> ;
  wire \Count__n0000<7> ;
  wire \Count__n0000<8> ;
  wire \Count__n0000<9> ;
  wire \Count__n0000<10> ;
  wire \Count__n0000<11> ;
  wire \Count__n0000<12> ;
  wire \Count__n0000<13> ;
  wire \Count__n0000<14> ;
  wire \Count__n0000<15> ;
  wire \Count__n0000<16> ;
  wire \Count__n0000<17> ;
  wire \Count__n0000<18> ;
  wire \Count__n0000<19> ;
  wire \Count__n0000<20> ;
  wire \Count__n0000<21> ;
  wire \Count__n0000<22> ;
  wire \Count__n0000<23> ;
  wire \Count__n0000<24> ;
  wire \Count__n0000<25> ;
  wire \Count__n0000<26> ;
  wire \Count__n0000<27> ;
  wire \Count__n0000<28> ;
  wire \Count__n0000<29> ;
  wire \Count__n0000<30> ;
  wire \Count__n0000<31> ;
  wire N1;
  wire \Monostable_3_Count__n0000<30>_cyo ;
  wire N3;
  wire \Monostable_3_Count__n0000<0>_cyo ;
  wire \Monostable_3_Count__n0000<1>_cyo ;
  wire \Monostable_3_Count__n0000<2>_cyo ;
  wire \Monostable_3_Count__n0000<3>_cyo ;
  wire \Monostable_3_Count__n0000<4>_cyo ;
  wire \Monostable_3_Count__n0000<5>_cyo ;
  wire \Monostable_3_Count__n0000<6>_cyo ;
  wire \Monostable_3_Count__n0000<7>_cyo ;
  wire \Monostable_3_Count__n0000<8>_cyo ;
  wire \Monostable_3_Count__n0000<9>_cyo ;
  wire \Monostable_3_Count__n0000<10>_cyo ;
  wire \Monostable_3_Count__n0000<11>_cyo ;
  wire \Monostable_3_Count__n0000<12>_cyo ;
  wire \Monostable_3_Count__n0000<13>_cyo ;
  wire \Monostable_3_Count__n0000<14>_cyo ;
  wire \Monostable_3_Count__n0000<15>_cyo ;
  wire \Monostable_3_Count__n0000<16>_cyo ;
  wire \Monostable_3_Count__n0000<17>_cyo ;
  wire \Monostable_3_Count__n0000<18>_cyo ;
  wire \Monostable_3_Count__n0000<19>_cyo ;
  wire \Monostable_3_Count__n0000<20>_cyo ;
  wire \Monostable_3_Count__n0000<21>_cyo ;
  wire \Monostable_3_Count__n0000<22>_cyo ;
  wire \Monostable_3_Count__n0000<23>_cyo ;
  wire \Monostable_3_Count__n0000<24>_cyo ;
  wire \Monostable_3_Count__n0000<25>_cyo ;
  wire \Monostable_3_Count__n0000<26>_cyo ;
  wire \Monostable_3_Count__n0000<27>_cyo ;
  wire \Monostable_3_Count__n0000<28>_cyo ;
  wire \Monostable_3_Count__n0000<29>_cyo ;
  wire N7;
  wire N31;
  wire CHOICE2254;
  wire CHOICE2260;
  wire CHOICE1955;
  wire CHOICE2237;
  wire CHOICE2243;
  wire CHOICE2250;
  wire CHOICE2231;
  wire Count_1_rt;
  wire Count_2_rt;
  wire Count_3_rt;
  wire Count_4_rt;
  wire Count_5_rt;
  wire Count_6_rt;
  wire Count_7_rt;
  wire Count_8_rt;
  wire Count_9_rt;
  wire Count_10_rt;
  wire Count_11_rt;
  wire Count_12_rt;
  wire Count_13_rt;
  wire Count_14_rt;
  wire Count_15_rt;
  wire Count_16_rt;
  wire Count_17_rt;
  wire Count_18_rt;
  wire Count_19_rt;
  wire Count_20_rt;
  wire Count_21_rt;
  wire Count_22_rt;
  wire Count_23_rt;
  wire Count_24_rt;
  wire Count_25_rt;
  wire Count_26_rt;
  wire Count_27_rt;
  wire Count_28_rt;
  wire Count_29_rt;
  wire Count_30_rt;
  wire Count_31_rt;
  GND XST_GND (
    .G(N0)
  );
  defparam _n0000515.INIT = 16'hFFEF;
  LUT4 _n0000515 (
    .I0(\Count<24> ),
    .I1(\Count<3> ),
    .I2(\Count<14> ),
    .I3(\Count<23> ),
    .O(CHOICE2254)
  );
  FDR Count_30 (
    .D(\Count__n0000<30> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<30> )
  );
  FDSE Out_214 (
    .D(N0),
    .S(In),
    .CE(_n0000),
    .C(Dclk),
    .Q(Out)
  );
  FDR Count_31 (
    .D(\Count__n0000<31> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<31> )
  );
  XORCY \Monostable_3_Count__n0000<31>_xor  (
    .CI(\Monostable_3_Count__n0000<30>_cyo ),
    .LI(Count_31_rt),
    .O(\Count__n0000<31> )
  );
  FDR Count_0 (
    .D(N3),
    .R(In),
    .C(Dclk),
    .Q(\Count<0> )
  );
  FDR Count_1 (
    .D(\Count__n0000<1> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<1> )
  );
  FDR Count_2 (
    .D(\Count__n0000<2> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<2> )
  );
  FDR Count_3 (
    .D(\Count__n0000<3> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<3> )
  );
  FDR Count_4 (
    .D(\Count__n0000<4> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<4> )
  );
  FDR Count_5 (
    .D(\Count__n0000<5> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<5> )
  );
  FDR Count_6 (
    .D(\Count__n0000<6> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<6> )
  );
  FDR Count_7 (
    .D(\Count__n0000<7> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<7> )
  );
  FDR Count_8 (
    .D(\Count__n0000<8> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<8> )
  );
  FDR Count_9 (
    .D(\Count__n0000<9> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<9> )
  );
  FDR Count_10 (
    .D(\Count__n0000<10> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<10> )
  );
  FDR Count_11 (
    .D(\Count__n0000<11> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<11> )
  );
  FDR Count_12 (
    .D(\Count__n0000<12> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<12> )
  );
  FDR Count_13 (
    .D(\Count__n0000<13> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<13> )
  );
  FDR Count_14 (
    .D(\Count__n0000<14> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<14> )
  );
  FDR Count_15 (
    .D(\Count__n0000<15> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<15> )
  );
  FDR Count_16 (
    .D(\Count__n0000<16> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<16> )
  );
  FDR Count_17 (
    .D(\Count__n0000<17> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<17> )
  );
  FDR Count_18 (
    .D(\Count__n0000<18> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<18> )
  );
  FDR Count_19 (
    .D(\Count__n0000<19> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<19> )
  );
  FDR Count_20 (
    .D(\Count__n0000<20> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<20> )
  );
  FDR Count_21 (
    .D(\Count__n0000<21> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<21> )
  );
  FDR Count_22 (
    .D(\Count__n0000<22> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<22> )
  );
  FDR Count_23 (
    .D(\Count__n0000<23> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<23> )
  );
  FDR Count_24 (
    .D(\Count__n0000<24> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<24> )
  );
  FDR Count_25 (
    .D(\Count__n0000<25> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<25> )
  );
  FDR Count_26 (
    .D(\Count__n0000<26> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<26> )
  );
  FDR Count_27 (
    .D(\Count__n0000<27> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<27> )
  );
  FDR Count_28 (
    .D(\Count__n0000<28> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<28> )
  );
  FDR Count_29 (
    .D(\Count__n0000<29> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<29> )
  );
  VCC XST_VCC (
    .P(N1)
  );
  defparam \Monostable_3_Count__n0000<0>lut .INIT = 4'h1;
  LUT1 \Monostable_3_Count__n0000<0>lut  (
    .I0(\Count<0> ),
    .O(N3)
  );
  MUXCY \Monostable_3_Count__n0000<0>cy  (
    .CI(N0),
    .DI(N1),
    .S(N3),
    .O(\Monostable_3_Count__n0000<0>_cyo )
  );
  defparam _n0000535.INIT = 16'hEFFF;
  LUT4 _n0000535 (
    .I0(\Count<25> ),
    .I1(\Count<15> ),
    .I2(\Count<4> ),
    .I3(\Count<5> ),
    .O(CHOICE2260)
  );
  MUXCY \Monostable_3_Count__n0000<1>cy  (
    .CI(\Monostable_3_Count__n0000<0>_cyo ),
    .DI(N0),
    .S(Count_1_rt),
    .O(\Monostable_3_Count__n0000<1>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<1>_xor  (
    .CI(\Monostable_3_Count__n0000<0>_cyo ),
    .LI(Count_1_rt),
    .O(\Count__n0000<1> )
  );
  MUXCY \Monostable_3_Count__n0000<2>cy  (
    .CI(\Monostable_3_Count__n0000<1>_cyo ),
    .DI(N0),
    .S(Count_2_rt),
    .O(\Monostable_3_Count__n0000<2>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<2>_xor  (
    .CI(\Monostable_3_Count__n0000<1>_cyo ),
    .LI(Count_2_rt),
    .O(\Count__n0000<2> )
  );
  MUXCY \Monostable_3_Count__n0000<3>cy  (
    .CI(\Monostable_3_Count__n0000<2>_cyo ),
    .DI(N0),
    .S(Count_3_rt),
    .O(\Monostable_3_Count__n0000<3>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<3>_xor  (
    .CI(\Monostable_3_Count__n0000<2>_cyo ),
    .LI(Count_3_rt),
    .O(\Count__n0000<3> )
  );
  MUXCY \Monostable_3_Count__n0000<4>cy  (
    .CI(\Monostable_3_Count__n0000<3>_cyo ),
    .DI(N0),
    .S(Count_4_rt),
    .O(\Monostable_3_Count__n0000<4>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<4>_xor  (
    .CI(\Monostable_3_Count__n0000<3>_cyo ),
    .LI(Count_4_rt),
    .O(\Count__n0000<4> )
  );
  MUXCY \Monostable_3_Count__n0000<5>cy  (
    .CI(\Monostable_3_Count__n0000<4>_cyo ),
    .DI(N0),
    .S(Count_5_rt),
    .O(\Monostable_3_Count__n0000<5>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<5>_xor  (
    .CI(\Monostable_3_Count__n0000<4>_cyo ),
    .LI(Count_5_rt),
    .O(\Count__n0000<5> )
  );
  MUXCY \Monostable_3_Count__n0000<6>cy  (
    .CI(\Monostable_3_Count__n0000<5>_cyo ),
    .DI(N0),
    .S(Count_6_rt),
    .O(\Monostable_3_Count__n0000<6>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<6>_xor  (
    .CI(\Monostable_3_Count__n0000<5>_cyo ),
    .LI(Count_6_rt),
    .O(\Count__n0000<6> )
  );
  MUXCY \Monostable_3_Count__n0000<7>cy  (
    .CI(\Monostable_3_Count__n0000<6>_cyo ),
    .DI(N0),
    .S(Count_7_rt),
    .O(\Monostable_3_Count__n0000<7>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<7>_xor  (
    .CI(\Monostable_3_Count__n0000<6>_cyo ),
    .LI(Count_7_rt),
    .O(\Count__n0000<7> )
  );
  MUXCY \Monostable_3_Count__n0000<8>cy  (
    .CI(\Monostable_3_Count__n0000<7>_cyo ),
    .DI(N0),
    .S(Count_8_rt),
    .O(\Monostable_3_Count__n0000<8>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<8>_xor  (
    .CI(\Monostable_3_Count__n0000<7>_cyo ),
    .LI(Count_8_rt),
    .O(\Count__n0000<8> )
  );
  MUXCY \Monostable_3_Count__n0000<9>cy  (
    .CI(\Monostable_3_Count__n0000<8>_cyo ),
    .DI(N0),
    .S(Count_9_rt),
    .O(\Monostable_3_Count__n0000<9>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<9>_xor  (
    .CI(\Monostable_3_Count__n0000<8>_cyo ),
    .LI(Count_9_rt),
    .O(\Count__n0000<9> )
  );
  MUXCY \Monostable_3_Count__n0000<10>cy  (
    .CI(\Monostable_3_Count__n0000<9>_cyo ),
    .DI(N0),
    .S(Count_10_rt),
    .O(\Monostable_3_Count__n0000<10>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<10>_xor  (
    .CI(\Monostable_3_Count__n0000<9>_cyo ),
    .LI(Count_10_rt),
    .O(\Count__n0000<10> )
  );
  MUXCY \Monostable_3_Count__n0000<11>cy  (
    .CI(\Monostable_3_Count__n0000<10>_cyo ),
    .DI(N0),
    .S(Count_11_rt),
    .O(\Monostable_3_Count__n0000<11>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<11>_xor  (
    .CI(\Monostable_3_Count__n0000<10>_cyo ),
    .LI(Count_11_rt),
    .O(\Count__n0000<11> )
  );
  MUXCY \Monostable_3_Count__n0000<12>cy  (
    .CI(\Monostable_3_Count__n0000<11>_cyo ),
    .DI(N0),
    .S(Count_12_rt),
    .O(\Monostable_3_Count__n0000<12>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<12>_xor  (
    .CI(\Monostable_3_Count__n0000<11>_cyo ),
    .LI(Count_12_rt),
    .O(\Count__n0000<12> )
  );
  MUXCY \Monostable_3_Count__n0000<13>cy  (
    .CI(\Monostable_3_Count__n0000<12>_cyo ),
    .DI(N0),
    .S(Count_13_rt),
    .O(\Monostable_3_Count__n0000<13>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<13>_xor  (
    .CI(\Monostable_3_Count__n0000<12>_cyo ),
    .LI(Count_13_rt),
    .O(\Count__n0000<13> )
  );
  MUXCY \Monostable_3_Count__n0000<14>cy  (
    .CI(\Monostable_3_Count__n0000<13>_cyo ),
    .DI(N0),
    .S(Count_14_rt),
    .O(\Monostable_3_Count__n0000<14>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<14>_xor  (
    .CI(\Monostable_3_Count__n0000<13>_cyo ),
    .LI(Count_14_rt),
    .O(\Count__n0000<14> )
  );
  MUXCY \Monostable_3_Count__n0000<15>cy  (
    .CI(\Monostable_3_Count__n0000<14>_cyo ),
    .DI(N0),
    .S(Count_15_rt),
    .O(\Monostable_3_Count__n0000<15>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<15>_xor  (
    .CI(\Monostable_3_Count__n0000<14>_cyo ),
    .LI(Count_15_rt),
    .O(\Count__n0000<15> )
  );
  MUXCY \Monostable_3_Count__n0000<16>cy  (
    .CI(\Monostable_3_Count__n0000<15>_cyo ),
    .DI(N0),
    .S(Count_16_rt),
    .O(\Monostable_3_Count__n0000<16>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<16>_xor  (
    .CI(\Monostable_3_Count__n0000<15>_cyo ),
    .LI(Count_16_rt),
    .O(\Count__n0000<16> )
  );
  MUXCY \Monostable_3_Count__n0000<17>cy  (
    .CI(\Monostable_3_Count__n0000<16>_cyo ),
    .DI(N0),
    .S(Count_17_rt),
    .O(\Monostable_3_Count__n0000<17>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<17>_xor  (
    .CI(\Monostable_3_Count__n0000<16>_cyo ),
    .LI(Count_17_rt),
    .O(\Count__n0000<17> )
  );
  MUXCY \Monostable_3_Count__n0000<18>cy  (
    .CI(\Monostable_3_Count__n0000<17>_cyo ),
    .DI(N0),
    .S(Count_18_rt),
    .O(\Monostable_3_Count__n0000<18>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<18>_xor  (
    .CI(\Monostable_3_Count__n0000<17>_cyo ),
    .LI(Count_18_rt),
    .O(\Count__n0000<18> )
  );
  MUXCY \Monostable_3_Count__n0000<19>cy  (
    .CI(\Monostable_3_Count__n0000<18>_cyo ),
    .DI(N0),
    .S(Count_19_rt),
    .O(\Monostable_3_Count__n0000<19>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<19>_xor  (
    .CI(\Monostable_3_Count__n0000<18>_cyo ),
    .LI(Count_19_rt),
    .O(\Count__n0000<19> )
  );
  MUXCY \Monostable_3_Count__n0000<20>cy  (
    .CI(\Monostable_3_Count__n0000<19>_cyo ),
    .DI(N0),
    .S(Count_20_rt),
    .O(\Monostable_3_Count__n0000<20>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<20>_xor  (
    .CI(\Monostable_3_Count__n0000<19>_cyo ),
    .LI(Count_20_rt),
    .O(\Count__n0000<20> )
  );
  MUXCY \Monostable_3_Count__n0000<21>cy  (
    .CI(\Monostable_3_Count__n0000<20>_cyo ),
    .DI(N0),
    .S(Count_21_rt),
    .O(\Monostable_3_Count__n0000<21>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<21>_xor  (
    .CI(\Monostable_3_Count__n0000<20>_cyo ),
    .LI(Count_21_rt),
    .O(\Count__n0000<21> )
  );
  MUXCY \Monostable_3_Count__n0000<22>cy  (
    .CI(\Monostable_3_Count__n0000<21>_cyo ),
    .DI(N0),
    .S(Count_22_rt),
    .O(\Monostable_3_Count__n0000<22>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<22>_xor  (
    .CI(\Monostable_3_Count__n0000<21>_cyo ),
    .LI(Count_22_rt),
    .O(\Count__n0000<22> )
  );
  MUXCY \Monostable_3_Count__n0000<23>cy  (
    .CI(\Monostable_3_Count__n0000<22>_cyo ),
    .DI(N0),
    .S(Count_23_rt),
    .O(\Monostable_3_Count__n0000<23>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<23>_xor  (
    .CI(\Monostable_3_Count__n0000<22>_cyo ),
    .LI(Count_23_rt),
    .O(\Count__n0000<23> )
  );
  MUXCY \Monostable_3_Count__n0000<24>cy  (
    .CI(\Monostable_3_Count__n0000<23>_cyo ),
    .DI(N0),
    .S(Count_24_rt),
    .O(\Monostable_3_Count__n0000<24>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<24>_xor  (
    .CI(\Monostable_3_Count__n0000<23>_cyo ),
    .LI(Count_24_rt),
    .O(\Count__n0000<24> )
  );
  MUXCY \Monostable_3_Count__n0000<25>cy  (
    .CI(\Monostable_3_Count__n0000<24>_cyo ),
    .DI(N0),
    .S(Count_25_rt),
    .O(\Monostable_3_Count__n0000<25>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<25>_xor  (
    .CI(\Monostable_3_Count__n0000<24>_cyo ),
    .LI(Count_25_rt),
    .O(\Count__n0000<25> )
  );
  MUXCY \Monostable_3_Count__n0000<26>cy  (
    .CI(\Monostable_3_Count__n0000<25>_cyo ),
    .DI(N0),
    .S(Count_26_rt),
    .O(\Monostable_3_Count__n0000<26>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<26>_xor  (
    .CI(\Monostable_3_Count__n0000<25>_cyo ),
    .LI(Count_26_rt),
    .O(\Count__n0000<26> )
  );
  MUXCY \Monostable_3_Count__n0000<27>cy  (
    .CI(\Monostable_3_Count__n0000<26>_cyo ),
    .DI(N0),
    .S(Count_27_rt),
    .O(\Monostable_3_Count__n0000<27>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<27>_xor  (
    .CI(\Monostable_3_Count__n0000<26>_cyo ),
    .LI(Count_27_rt),
    .O(\Count__n0000<27> )
  );
  MUXCY \Monostable_3_Count__n0000<28>cy  (
    .CI(\Monostable_3_Count__n0000<27>_cyo ),
    .DI(N0),
    .S(Count_28_rt),
    .O(\Monostable_3_Count__n0000<28>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<28>_xor  (
    .CI(\Monostable_3_Count__n0000<27>_cyo ),
    .LI(Count_28_rt),
    .O(\Count__n0000<28> )
  );
  MUXCY \Monostable_3_Count__n0000<29>cy  (
    .CI(\Monostable_3_Count__n0000<28>_cyo ),
    .DI(N0),
    .S(Count_29_rt),
    .O(\Monostable_3_Count__n0000<29>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<29>_xor  (
    .CI(\Monostable_3_Count__n0000<28>_cyo ),
    .LI(Count_29_rt),
    .O(\Count__n0000<29> )
  );
  MUXCY \Monostable_3_Count__n0000<30>cy  (
    .CI(\Monostable_3_Count__n0000<29>_cyo ),
    .DI(N0),
    .S(Count_30_rt),
    .O(\Monostable_3_Count__n0000<30>_cyo )
  );
  XORCY \Monostable_3_Count__n0000<30>_xor  (
    .CI(\Monostable_3_Count__n0000<29>_cyo ),
    .LI(Count_30_rt),
    .O(\Count__n0000<30> )
  );
  defparam _n0000544.INIT = 16'hFFFE;
  LUT4 _n0000544 (
    .I0(CHOICE2250),
    .I1(CHOICE2254),
    .I2(CHOICE2260),
    .I3(N7),
    .O(N31)
  );
  defparam _n0000169.INIT = 16'h4000;
  LUT4 _n0000169 (
    .I0(N31),
    .I1(CHOICE2231),
    .I2(CHOICE2237),
    .I3(CHOICE2243),
    .O(_n0000)
  );
  defparam _n0000113.INIT = 16'h0001;
  LUT4 _n0000113 (
    .I0(\Count<11> ),
    .I1(\Count<21> ),
    .I2(\Count<31> ),
    .I3(\Count<1> ),
    .O(CHOICE2231)
  );
  defparam _n0000125.INIT = 16'h0002;
  LUT4 _n0000125 (
    .I0(\Count<12> ),
    .I1(\Count<22> ),
    .I2(\Count<2> ),
    .I3(\Count<13> ),
    .O(CHOICE2237)
  );
  defparam _n000097.INIT = 16'hFFEF;
  LUT4 _n000097 (
    .I0(\Count<28> ),
    .I1(\Count<7> ),
    .I2(\Count<18> ),
    .I3(\Count<27> ),
    .O(CHOICE1950)
  );
  defparam _n0000137.INIT = 16'h0002;
  LUT4 _n0000137 (
    .I0(\Count<10> ),
    .I1(\Count<20> ),
    .I2(\Count<30> ),
    .I3(\Count<0> ),
    .O(CHOICE2243)
  );
  defparam _n0000918.INIT = 16'hEFFF;
  LUT4 _n0000918 (
    .I0(\Count<29> ),
    .I1(\Count<19> ),
    .I2(\Count<8> ),
    .I3(\Count<9> ),
    .O(CHOICE1955)
  );
  defparam _n000057.INIT = 16'hFFEF;
  LUT4 _n000057 (
    .I0(\Count<26> ),
    .I1(\Count<17> ),
    .I2(\Count<16> ),
    .I3(\Count<6> ),
    .O(CHOICE2250)
  );
  defparam _n0000919.INIT = 4'hE;
  LUT2 _n0000919 (
    .I0(CHOICE1950),
    .I1(CHOICE1955),
    .O(N7)
  );
  defparam Count_1_rt_215.INIT = 4'h2;
  LUT1 Count_1_rt_215 (
    .I0(\Count<1> ),
    .O(Count_1_rt)
  );
  defparam Count_2_rt_216.INIT = 4'h2;
  LUT1 Count_2_rt_216 (
    .I0(\Count<2> ),
    .O(Count_2_rt)
  );
  defparam Count_3_rt_217.INIT = 4'h2;
  LUT1 Count_3_rt_217 (
    .I0(\Count<3> ),
    .O(Count_3_rt)
  );
  defparam Count_4_rt_218.INIT = 4'h2;
  LUT1 Count_4_rt_218 (
    .I0(\Count<4> ),
    .O(Count_4_rt)
  );
  defparam Count_5_rt_219.INIT = 4'h2;
  LUT1 Count_5_rt_219 (
    .I0(\Count<5> ),
    .O(Count_5_rt)
  );
  defparam Count_6_rt_220.INIT = 4'h2;
  LUT1 Count_6_rt_220 (
    .I0(\Count<6> ),
    .O(Count_6_rt)
  );
  defparam Count_7_rt_221.INIT = 4'h2;
  LUT1 Count_7_rt_221 (
    .I0(\Count<7> ),
    .O(Count_7_rt)
  );
  defparam Count_8_rt_222.INIT = 4'h2;
  LUT1 Count_8_rt_222 (
    .I0(\Count<8> ),
    .O(Count_8_rt)
  );
  defparam Count_9_rt_223.INIT = 4'h2;
  LUT1 Count_9_rt_223 (
    .I0(\Count<9> ),
    .O(Count_9_rt)
  );
  defparam Count_10_rt_224.INIT = 4'h2;
  LUT1 Count_10_rt_224 (
    .I0(\Count<10> ),
    .O(Count_10_rt)
  );
  defparam Count_11_rt_225.INIT = 4'h2;
  LUT1 Count_11_rt_225 (
    .I0(\Count<11> ),
    .O(Count_11_rt)
  );
  defparam Count_12_rt_226.INIT = 4'h2;
  LUT1 Count_12_rt_226 (
    .I0(\Count<12> ),
    .O(Count_12_rt)
  );
  defparam Count_13_rt_227.INIT = 4'h2;
  LUT1 Count_13_rt_227 (
    .I0(\Count<13> ),
    .O(Count_13_rt)
  );
  defparam Count_14_rt_228.INIT = 4'h2;
  LUT1 Count_14_rt_228 (
    .I0(\Count<14> ),
    .O(Count_14_rt)
  );
  defparam Count_15_rt_229.INIT = 4'h2;
  LUT1 Count_15_rt_229 (
    .I0(\Count<15> ),
    .O(Count_15_rt)
  );
  defparam Count_16_rt_230.INIT = 4'h2;
  LUT1 Count_16_rt_230 (
    .I0(\Count<16> ),
    .O(Count_16_rt)
  );
  defparam Count_17_rt_231.INIT = 4'h2;
  LUT1 Count_17_rt_231 (
    .I0(\Count<17> ),
    .O(Count_17_rt)
  );
  defparam Count_18_rt_232.INIT = 4'h2;
  LUT1 Count_18_rt_232 (
    .I0(\Count<18> ),
    .O(Count_18_rt)
  );
  defparam Count_19_rt_233.INIT = 4'h2;
  LUT1 Count_19_rt_233 (
    .I0(\Count<19> ),
    .O(Count_19_rt)
  );
  defparam Count_20_rt_234.INIT = 4'h2;
  LUT1 Count_20_rt_234 (
    .I0(\Count<20> ),
    .O(Count_20_rt)
  );
  defparam Count_21_rt_235.INIT = 4'h2;
  LUT1 Count_21_rt_235 (
    .I0(\Count<21> ),
    .O(Count_21_rt)
  );
  defparam Count_22_rt_236.INIT = 4'h2;
  LUT1 Count_22_rt_236 (
    .I0(\Count<22> ),
    .O(Count_22_rt)
  );
  defparam Count_23_rt_237.INIT = 4'h2;
  LUT1 Count_23_rt_237 (
    .I0(\Count<23> ),
    .O(Count_23_rt)
  );
  defparam Count_24_rt_238.INIT = 4'h2;
  LUT1 Count_24_rt_238 (
    .I0(\Count<24> ),
    .O(Count_24_rt)
  );
  defparam Count_25_rt_239.INIT = 4'h2;
  LUT1 Count_25_rt_239 (
    .I0(\Count<25> ),
    .O(Count_25_rt)
  );
  defparam Count_26_rt_240.INIT = 4'h2;
  LUT1 Count_26_rt_240 (
    .I0(\Count<26> ),
    .O(Count_26_rt)
  );
  defparam Count_27_rt_241.INIT = 4'h2;
  LUT1 Count_27_rt_241 (
    .I0(\Count<27> ),
    .O(Count_27_rt)
  );
  defparam Count_28_rt_242.INIT = 4'h2;
  LUT1 Count_28_rt_242 (
    .I0(\Count<28> ),
    .O(Count_28_rt)
  );
  defparam Count_29_rt_243.INIT = 4'h2;
  LUT1 Count_29_rt_243 (
    .I0(\Count<29> ),
    .O(Count_29_rt)
  );
  defparam Count_30_rt_244.INIT = 4'h2;
  LUT1 Count_30_rt_244 (
    .I0(\Count<30> ),
    .O(Count_30_rt)
  );
  defparam Count_31_rt_245.INIT = 4'h2;
  LUT1 Count_31_rt_245 (
    .I0(\Count<31> ),
    .O(Count_31_rt)
  );
endmodule

module Monostable_4_1 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire N0;
  wire \Count<0> ;
  wire \Count<31> ;
  wire \Count<30> ;
  wire \Count<24> ;
  wire \Count<29> ;
  wire \Count<23> ;
  wire \Count<28> ;
  wire \Count<22> ;
  wire \Count<27> ;
  wire \Count<21> ;
  wire \Count<26> ;
  wire \Count<20> ;
  wire \Count<25> ;
  wire \Count<14> ;
  wire \Count<19> ;
  wire \Count<13> ;
  wire \Count<18> ;
  wire \Count<12> ;
  wire \Count<17> ;
  wire \Count<11> ;
  wire \Count<16> ;
  wire \Count<10> ;
  wire \Count<15> ;
  wire \Count<4> ;
  wire \Count<9> ;
  wire \Count<3> ;
  wire \Count<8> ;
  wire \Count<2> ;
  wire \Count<7> ;
  wire \Count<1> ;
  wire \Count<6> ;
  wire \Count<5> ;
  wire \Count__n0000<2> ;
  wire CHOICE1941;
  wire \Count__n0000<3> ;
  wire \Count__n0000<1> ;
  wire \Count__n0000<4> ;
  wire \Count__n0000<5> ;
  wire \Count__n0000<6> ;
  wire \Count__n0000<7> ;
  wire \Count__n0000<8> ;
  wire \Count__n0000<9> ;
  wire \Count__n0000<10> ;
  wire \Count__n0000<11> ;
  wire \Count__n0000<12> ;
  wire \Count__n0000<13> ;
  wire \Count__n0000<14> ;
  wire \Count__n0000<15> ;
  wire \Count__n0000<16> ;
  wire \Count__n0000<17> ;
  wire \Count__n0000<18> ;
  wire \Count__n0000<19> ;
  wire \Count__n0000<20> ;
  wire \Count__n0000<21> ;
  wire \Count__n0000<22> ;
  wire \Count__n0000<23> ;
  wire \Count__n0000<24> ;
  wire \Count__n0000<25> ;
  wire \Count__n0000<26> ;
  wire \Count__n0000<27> ;
  wire \Count__n0000<28> ;
  wire \Count__n0000<29> ;
  wire \Count__n0000<30> ;
  wire \Count__n0000<31> ;
  wire N1;
  wire \Monostable_4_Count__n0000<30>_cyo ;
  wire N3;
  wire \Monostable_4_Count__n0000<0>_cyo ;
  wire \Monostable_4_Count__n0000<1>_cyo ;
  wire \Monostable_4_Count__n0000<2>_cyo ;
  wire \Monostable_4_Count__n0000<3>_cyo ;
  wire \Monostable_4_Count__n0000<4>_cyo ;
  wire \Monostable_4_Count__n0000<5>_cyo ;
  wire \Monostable_4_Count__n0000<6>_cyo ;
  wire \Monostable_4_Count__n0000<7>_cyo ;
  wire \Monostable_4_Count__n0000<8>_cyo ;
  wire \Monostable_4_Count__n0000<9>_cyo ;
  wire \Monostable_4_Count__n0000<10>_cyo ;
  wire \Monostable_4_Count__n0000<11>_cyo ;
  wire \Monostable_4_Count__n0000<12>_cyo ;
  wire \Monostable_4_Count__n0000<13>_cyo ;
  wire \Monostable_4_Count__n0000<14>_cyo ;
  wire \Monostable_4_Count__n0000<15>_cyo ;
  wire \Monostable_4_Count__n0000<16>_cyo ;
  wire \Monostable_4_Count__n0000<17>_cyo ;
  wire \Monostable_4_Count__n0000<18>_cyo ;
  wire \Monostable_4_Count__n0000<19>_cyo ;
  wire \Monostable_4_Count__n0000<20>_cyo ;
  wire \Monostable_4_Count__n0000<21>_cyo ;
  wire \Monostable_4_Count__n0000<22>_cyo ;
  wire \Monostable_4_Count__n0000<23>_cyo ;
  wire \Monostable_4_Count__n0000<24>_cyo ;
  wire \Monostable_4_Count__n0000<25>_cyo ;
  wire \Monostable_4_Count__n0000<26>_cyo ;
  wire \Monostable_4_Count__n0000<27>_cyo ;
  wire \Monostable_4_Count__n0000<28>_cyo ;
  wire \Monostable_4_Count__n0000<29>_cyo ;
  wire N7;
  wire N31;
  wire CHOICE2205;
  wire CHOICE2211;
  wire CHOICE2221;
  wire CHOICE2198;
  wire CHOICE1945;
  wire CHOICE2192;
  wire CHOICE2215;
  wire Count_1_rt;
  wire Count_2_rt;
  wire Count_3_rt;
  wire Count_4_rt;
  wire Count_5_rt;
  wire Count_6_rt;
  wire Count_7_rt;
  wire Count_8_rt;
  wire Count_9_rt;
  wire Count_10_rt;
  wire Count_11_rt;
  wire Count_12_rt;
  wire Count_13_rt;
  wire Count_14_rt;
  wire Count_15_rt;
  wire Count_16_rt;
  wire Count_17_rt;
  wire Count_18_rt;
  wire Count_19_rt;
  wire Count_20_rt;
  wire Count_21_rt;
  wire Count_22_rt;
  wire Count_23_rt;
  wire Count_24_rt;
  wire Count_25_rt;
  wire Count_26_rt;
  wire Count_27_rt;
  wire Count_28_rt;
  wire Count_29_rt;
  wire Count_30_rt;
  wire Count_31_rt;
  GND XST_GND (
    .G(N0)
  );
  defparam _n0000915.INIT = 16'hFFEF;
  LUT4 _n0000915 (
    .I0(\Count<19> ),
    .I1(\Count<9> ),
    .I2(\Count<8> ),
    .I3(\Count<29> ),
    .O(CHOICE1945)
  );
  FDR Count_30 (
    .D(\Count__n0000<30> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<30> )
  );
  FDSE Out_246 (
    .D(N0),
    .S(In),
    .CE(_n0000),
    .C(Dclk),
    .Q(Out)
  );
  FDR Count_31 (
    .D(\Count__n0000<31> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<31> )
  );
  XORCY \Monostable_4_Count__n0000<31>_xor  (
    .CI(\Monostable_4_Count__n0000<30>_cyo ),
    .LI(Count_31_rt),
    .O(\Count__n0000<31> )
  );
  FDR Count_0 (
    .D(N3),
    .R(In),
    .C(Dclk),
    .Q(\Count<0> )
  );
  FDR Count_1 (
    .D(\Count__n0000<1> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<1> )
  );
  FDR Count_2 (
    .D(\Count__n0000<2> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<2> )
  );
  FDR Count_3 (
    .D(\Count__n0000<3> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<3> )
  );
  FDR Count_4 (
    .D(\Count__n0000<4> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<4> )
  );
  FDR Count_5 (
    .D(\Count__n0000<5> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<5> )
  );
  FDR Count_6 (
    .D(\Count__n0000<6> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<6> )
  );
  FDR Count_7 (
    .D(\Count__n0000<7> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<7> )
  );
  FDR Count_8 (
    .D(\Count__n0000<8> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<8> )
  );
  FDR Count_9 (
    .D(\Count__n0000<9> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<9> )
  );
  FDR Count_10 (
    .D(\Count__n0000<10> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<10> )
  );
  FDR Count_11 (
    .D(\Count__n0000<11> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<11> )
  );
  FDR Count_12 (
    .D(\Count__n0000<12> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<12> )
  );
  FDR Count_13 (
    .D(\Count__n0000<13> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<13> )
  );
  FDR Count_14 (
    .D(\Count__n0000<14> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<14> )
  );
  FDR Count_15 (
    .D(\Count__n0000<15> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<15> )
  );
  FDR Count_16 (
    .D(\Count__n0000<16> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<16> )
  );
  FDR Count_17 (
    .D(\Count__n0000<17> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<17> )
  );
  FDR Count_18 (
    .D(\Count__n0000<18> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<18> )
  );
  FDR Count_19 (
    .D(\Count__n0000<19> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<19> )
  );
  FDR Count_20 (
    .D(\Count__n0000<20> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<20> )
  );
  FDR Count_21 (
    .D(\Count__n0000<21> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<21> )
  );
  FDR Count_22 (
    .D(\Count__n0000<22> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<22> )
  );
  FDR Count_23 (
    .D(\Count__n0000<23> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<23> )
  );
  FDR Count_24 (
    .D(\Count__n0000<24> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<24> )
  );
  FDR Count_25 (
    .D(\Count__n0000<25> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<25> )
  );
  FDR Count_26 (
    .D(\Count__n0000<26> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<26> )
  );
  FDR Count_27 (
    .D(\Count__n0000<27> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<27> )
  );
  FDR Count_28 (
    .D(\Count__n0000<28> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<28> )
  );
  FDR Count_29 (
    .D(\Count__n0000<29> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<29> )
  );
  VCC XST_VCC (
    .P(N1)
  );
  defparam \Monostable_4_Count__n0000<0>lut .INIT = 4'h1;
  LUT1 \Monostable_4_Count__n0000<0>lut  (
    .I0(\Count<0> ),
    .O(N3)
  );
  MUXCY \Monostable_4_Count__n0000<0>cy  (
    .CI(N0),
    .DI(N1),
    .S(N3),
    .O(\Monostable_4_Count__n0000<0>_cyo )
  );
  defparam _n0000531.INIT = 16'hEFFF;
  LUT4 _n0000531 (
    .I0(\Count<24> ),
    .I1(\Count<23> ),
    .I2(\Count<3> ),
    .I3(\Count<14> ),
    .O(CHOICE2221)
  );
  MUXCY \Monostable_4_Count__n0000<1>cy  (
    .CI(\Monostable_4_Count__n0000<0>_cyo ),
    .DI(N0),
    .S(Count_1_rt),
    .O(\Monostable_4_Count__n0000<1>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<1>_xor  (
    .CI(\Monostable_4_Count__n0000<0>_cyo ),
    .LI(Count_1_rt),
    .O(\Count__n0000<1> )
  );
  MUXCY \Monostable_4_Count__n0000<2>cy  (
    .CI(\Monostable_4_Count__n0000<1>_cyo ),
    .DI(N0),
    .S(Count_2_rt),
    .O(\Monostable_4_Count__n0000<2>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<2>_xor  (
    .CI(\Monostable_4_Count__n0000<1>_cyo ),
    .LI(Count_2_rt),
    .O(\Count__n0000<2> )
  );
  MUXCY \Monostable_4_Count__n0000<3>cy  (
    .CI(\Monostable_4_Count__n0000<2>_cyo ),
    .DI(N0),
    .S(Count_3_rt),
    .O(\Monostable_4_Count__n0000<3>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<3>_xor  (
    .CI(\Monostable_4_Count__n0000<2>_cyo ),
    .LI(Count_3_rt),
    .O(\Count__n0000<3> )
  );
  MUXCY \Monostable_4_Count__n0000<4>cy  (
    .CI(\Monostable_4_Count__n0000<3>_cyo ),
    .DI(N0),
    .S(Count_4_rt),
    .O(\Monostable_4_Count__n0000<4>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<4>_xor  (
    .CI(\Monostable_4_Count__n0000<3>_cyo ),
    .LI(Count_4_rt),
    .O(\Count__n0000<4> )
  );
  MUXCY \Monostable_4_Count__n0000<5>cy  (
    .CI(\Monostable_4_Count__n0000<4>_cyo ),
    .DI(N0),
    .S(Count_5_rt),
    .O(\Monostable_4_Count__n0000<5>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<5>_xor  (
    .CI(\Monostable_4_Count__n0000<4>_cyo ),
    .LI(Count_5_rt),
    .O(\Count__n0000<5> )
  );
  MUXCY \Monostable_4_Count__n0000<6>cy  (
    .CI(\Monostable_4_Count__n0000<5>_cyo ),
    .DI(N0),
    .S(Count_6_rt),
    .O(\Monostable_4_Count__n0000<6>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<6>_xor  (
    .CI(\Monostable_4_Count__n0000<5>_cyo ),
    .LI(Count_6_rt),
    .O(\Count__n0000<6> )
  );
  MUXCY \Monostable_4_Count__n0000<7>cy  (
    .CI(\Monostable_4_Count__n0000<6>_cyo ),
    .DI(N0),
    .S(Count_7_rt),
    .O(\Monostable_4_Count__n0000<7>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<7>_xor  (
    .CI(\Monostable_4_Count__n0000<6>_cyo ),
    .LI(Count_7_rt),
    .O(\Count__n0000<7> )
  );
  MUXCY \Monostable_4_Count__n0000<8>cy  (
    .CI(\Monostable_4_Count__n0000<7>_cyo ),
    .DI(N0),
    .S(Count_8_rt),
    .O(\Monostable_4_Count__n0000<8>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<8>_xor  (
    .CI(\Monostable_4_Count__n0000<7>_cyo ),
    .LI(Count_8_rt),
    .O(\Count__n0000<8> )
  );
  MUXCY \Monostable_4_Count__n0000<9>cy  (
    .CI(\Monostable_4_Count__n0000<8>_cyo ),
    .DI(N0),
    .S(Count_9_rt),
    .O(\Monostable_4_Count__n0000<9>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<9>_xor  (
    .CI(\Monostable_4_Count__n0000<8>_cyo ),
    .LI(Count_9_rt),
    .O(\Count__n0000<9> )
  );
  MUXCY \Monostable_4_Count__n0000<10>cy  (
    .CI(\Monostable_4_Count__n0000<9>_cyo ),
    .DI(N0),
    .S(Count_10_rt),
    .O(\Monostable_4_Count__n0000<10>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<10>_xor  (
    .CI(\Monostable_4_Count__n0000<9>_cyo ),
    .LI(Count_10_rt),
    .O(\Count__n0000<10> )
  );
  MUXCY \Monostable_4_Count__n0000<11>cy  (
    .CI(\Monostable_4_Count__n0000<10>_cyo ),
    .DI(N0),
    .S(Count_11_rt),
    .O(\Monostable_4_Count__n0000<11>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<11>_xor  (
    .CI(\Monostable_4_Count__n0000<10>_cyo ),
    .LI(Count_11_rt),
    .O(\Count__n0000<11> )
  );
  MUXCY \Monostable_4_Count__n0000<12>cy  (
    .CI(\Monostable_4_Count__n0000<11>_cyo ),
    .DI(N0),
    .S(Count_12_rt),
    .O(\Monostable_4_Count__n0000<12>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<12>_xor  (
    .CI(\Monostable_4_Count__n0000<11>_cyo ),
    .LI(Count_12_rt),
    .O(\Count__n0000<12> )
  );
  MUXCY \Monostable_4_Count__n0000<13>cy  (
    .CI(\Monostable_4_Count__n0000<12>_cyo ),
    .DI(N0),
    .S(Count_13_rt),
    .O(\Monostable_4_Count__n0000<13>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<13>_xor  (
    .CI(\Monostable_4_Count__n0000<12>_cyo ),
    .LI(Count_13_rt),
    .O(\Count__n0000<13> )
  );
  MUXCY \Monostable_4_Count__n0000<14>cy  (
    .CI(\Monostable_4_Count__n0000<13>_cyo ),
    .DI(N0),
    .S(Count_14_rt),
    .O(\Monostable_4_Count__n0000<14>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<14>_xor  (
    .CI(\Monostable_4_Count__n0000<13>_cyo ),
    .LI(Count_14_rt),
    .O(\Count__n0000<14> )
  );
  MUXCY \Monostable_4_Count__n0000<15>cy  (
    .CI(\Monostable_4_Count__n0000<14>_cyo ),
    .DI(N0),
    .S(Count_15_rt),
    .O(\Monostable_4_Count__n0000<15>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<15>_xor  (
    .CI(\Monostable_4_Count__n0000<14>_cyo ),
    .LI(Count_15_rt),
    .O(\Count__n0000<15> )
  );
  MUXCY \Monostable_4_Count__n0000<16>cy  (
    .CI(\Monostable_4_Count__n0000<15>_cyo ),
    .DI(N0),
    .S(Count_16_rt),
    .O(\Monostable_4_Count__n0000<16>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<16>_xor  (
    .CI(\Monostable_4_Count__n0000<15>_cyo ),
    .LI(Count_16_rt),
    .O(\Count__n0000<16> )
  );
  MUXCY \Monostable_4_Count__n0000<17>cy  (
    .CI(\Monostable_4_Count__n0000<16>_cyo ),
    .DI(N0),
    .S(Count_17_rt),
    .O(\Monostable_4_Count__n0000<17>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<17>_xor  (
    .CI(\Monostable_4_Count__n0000<16>_cyo ),
    .LI(Count_17_rt),
    .O(\Count__n0000<17> )
  );
  MUXCY \Monostable_4_Count__n0000<18>cy  (
    .CI(\Monostable_4_Count__n0000<17>_cyo ),
    .DI(N0),
    .S(Count_18_rt),
    .O(\Monostable_4_Count__n0000<18>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<18>_xor  (
    .CI(\Monostable_4_Count__n0000<17>_cyo ),
    .LI(Count_18_rt),
    .O(\Count__n0000<18> )
  );
  MUXCY \Monostable_4_Count__n0000<19>cy  (
    .CI(\Monostable_4_Count__n0000<18>_cyo ),
    .DI(N0),
    .S(Count_19_rt),
    .O(\Monostable_4_Count__n0000<19>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<19>_xor  (
    .CI(\Monostable_4_Count__n0000<18>_cyo ),
    .LI(Count_19_rt),
    .O(\Count__n0000<19> )
  );
  MUXCY \Monostable_4_Count__n0000<20>cy  (
    .CI(\Monostable_4_Count__n0000<19>_cyo ),
    .DI(N0),
    .S(Count_20_rt),
    .O(\Monostable_4_Count__n0000<20>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<20>_xor  (
    .CI(\Monostable_4_Count__n0000<19>_cyo ),
    .LI(Count_20_rt),
    .O(\Count__n0000<20> )
  );
  MUXCY \Monostable_4_Count__n0000<21>cy  (
    .CI(\Monostable_4_Count__n0000<20>_cyo ),
    .DI(N0),
    .S(Count_21_rt),
    .O(\Monostable_4_Count__n0000<21>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<21>_xor  (
    .CI(\Monostable_4_Count__n0000<20>_cyo ),
    .LI(Count_21_rt),
    .O(\Count__n0000<21> )
  );
  MUXCY \Monostable_4_Count__n0000<22>cy  (
    .CI(\Monostable_4_Count__n0000<21>_cyo ),
    .DI(N0),
    .S(Count_22_rt),
    .O(\Monostable_4_Count__n0000<22>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<22>_xor  (
    .CI(\Monostable_4_Count__n0000<21>_cyo ),
    .LI(Count_22_rt),
    .O(\Count__n0000<22> )
  );
  MUXCY \Monostable_4_Count__n0000<23>cy  (
    .CI(\Monostable_4_Count__n0000<22>_cyo ),
    .DI(N0),
    .S(Count_23_rt),
    .O(\Monostable_4_Count__n0000<23>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<23>_xor  (
    .CI(\Monostable_4_Count__n0000<22>_cyo ),
    .LI(Count_23_rt),
    .O(\Count__n0000<23> )
  );
  MUXCY \Monostable_4_Count__n0000<24>cy  (
    .CI(\Monostable_4_Count__n0000<23>_cyo ),
    .DI(N0),
    .S(Count_24_rt),
    .O(\Monostable_4_Count__n0000<24>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<24>_xor  (
    .CI(\Monostable_4_Count__n0000<23>_cyo ),
    .LI(Count_24_rt),
    .O(\Count__n0000<24> )
  );
  MUXCY \Monostable_4_Count__n0000<25>cy  (
    .CI(\Monostable_4_Count__n0000<24>_cyo ),
    .DI(N0),
    .S(Count_25_rt),
    .O(\Monostable_4_Count__n0000<25>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<25>_xor  (
    .CI(\Monostable_4_Count__n0000<24>_cyo ),
    .LI(Count_25_rt),
    .O(\Count__n0000<25> )
  );
  MUXCY \Monostable_4_Count__n0000<26>cy  (
    .CI(\Monostable_4_Count__n0000<25>_cyo ),
    .DI(N0),
    .S(Count_26_rt),
    .O(\Monostable_4_Count__n0000<26>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<26>_xor  (
    .CI(\Monostable_4_Count__n0000<25>_cyo ),
    .LI(Count_26_rt),
    .O(\Count__n0000<26> )
  );
  MUXCY \Monostable_4_Count__n0000<27>cy  (
    .CI(\Monostable_4_Count__n0000<26>_cyo ),
    .DI(N0),
    .S(Count_27_rt),
    .O(\Monostable_4_Count__n0000<27>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<27>_xor  (
    .CI(\Monostable_4_Count__n0000<26>_cyo ),
    .LI(Count_27_rt),
    .O(\Count__n0000<27> )
  );
  MUXCY \Monostable_4_Count__n0000<28>cy  (
    .CI(\Monostable_4_Count__n0000<27>_cyo ),
    .DI(N0),
    .S(Count_28_rt),
    .O(\Monostable_4_Count__n0000<28>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<28>_xor  (
    .CI(\Monostable_4_Count__n0000<27>_cyo ),
    .LI(Count_28_rt),
    .O(\Count__n0000<28> )
  );
  MUXCY \Monostable_4_Count__n0000<29>cy  (
    .CI(\Monostable_4_Count__n0000<28>_cyo ),
    .DI(N0),
    .S(Count_29_rt),
    .O(\Monostable_4_Count__n0000<29>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<29>_xor  (
    .CI(\Monostable_4_Count__n0000<28>_cyo ),
    .LI(Count_29_rt),
    .O(\Count__n0000<29> )
  );
  MUXCY \Monostable_4_Count__n0000<30>cy  (
    .CI(\Monostable_4_Count__n0000<29>_cyo ),
    .DI(N0),
    .S(Count_30_rt),
    .O(\Monostable_4_Count__n0000<30>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<30>_xor  (
    .CI(\Monostable_4_Count__n0000<29>_cyo ),
    .LI(Count_30_rt),
    .O(\Count__n0000<30> )
  );
  defparam _n0000540.INIT = 16'hFFFE;
  LUT4 _n0000540 (
    .I0(CHOICE2211),
    .I1(CHOICE2215),
    .I2(CHOICE2221),
    .I3(N7),
    .O(N31)
  );
  defparam _n0000170.INIT = 16'h4000;
  LUT4 _n0000170 (
    .I0(N31),
    .I1(CHOICE2192),
    .I2(CHOICE2198),
    .I3(CHOICE2205),
    .O(_n0000)
  );
  defparam _n0000512.INIT = 16'hFFEF;
  LUT4 _n0000512 (
    .I0(\Count<25> ),
    .I1(\Count<15> ),
    .I2(\Count<5> ),
    .I3(\Count<4> ),
    .O(CHOICE2215)
  );
  defparam _n0000916.INIT = 4'hE;
  LUT2 _n0000916 (
    .I0(CHOICE1941),
    .I1(CHOICE1945),
    .O(N7)
  );
  defparam _n000097.INIT = 16'hFFEF;
  LUT4 _n000097 (
    .I0(\Count<27> ),
    .I1(\Count<28> ),
    .I2(\Count<7> ),
    .I3(\Count<18> ),
    .O(CHOICE1941)
  );
  defparam _n0000125.INIT = 16'h0002;
  LUT4 _n0000125 (
    .I0(\Count<13> ),
    .I1(\Count<2> ),
    .I2(\Count<12> ),
    .I3(\Count<22> ),
    .O(CHOICE2198)
  );
  defparam _n0000138.INIT = 16'h0001;
  LUT4 _n0000138 (
    .I0(\Count<10> ),
    .I1(\Count<20> ),
    .I2(\Count<30> ),
    .I3(\Count<0> ),
    .O(CHOICE2205)
  );
  defparam _n0000113.INIT = 16'h0001;
  LUT4 _n0000113 (
    .I0(\Count<11> ),
    .I1(\Count<21> ),
    .I2(\Count<31> ),
    .I3(\Count<1> ),
    .O(CHOICE2192)
  );
  defparam _n000054.INIT = 16'hFFFE;
  LUT4 _n000054 (
    .I0(\Count<16> ),
    .I1(\Count<26> ),
    .I2(\Count<6> ),
    .I3(\Count<17> ),
    .O(CHOICE2211)
  );
  defparam Count_1_rt_247.INIT = 4'h2;
  LUT1 Count_1_rt_247 (
    .I0(\Count<1> ),
    .O(Count_1_rt)
  );
  defparam Count_2_rt_248.INIT = 4'h2;
  LUT1 Count_2_rt_248 (
    .I0(\Count<2> ),
    .O(Count_2_rt)
  );
  defparam Count_3_rt_249.INIT = 4'h2;
  LUT1 Count_3_rt_249 (
    .I0(\Count<3> ),
    .O(Count_3_rt)
  );
  defparam Count_4_rt_250.INIT = 4'h2;
  LUT1 Count_4_rt_250 (
    .I0(\Count<4> ),
    .O(Count_4_rt)
  );
  defparam Count_5_rt_251.INIT = 4'h2;
  LUT1 Count_5_rt_251 (
    .I0(\Count<5> ),
    .O(Count_5_rt)
  );
  defparam Count_6_rt_252.INIT = 4'h2;
  LUT1 Count_6_rt_252 (
    .I0(\Count<6> ),
    .O(Count_6_rt)
  );
  defparam Count_7_rt_253.INIT = 4'h2;
  LUT1 Count_7_rt_253 (
    .I0(\Count<7> ),
    .O(Count_7_rt)
  );
  defparam Count_8_rt_254.INIT = 4'h2;
  LUT1 Count_8_rt_254 (
    .I0(\Count<8> ),
    .O(Count_8_rt)
  );
  defparam Count_9_rt_255.INIT = 4'h2;
  LUT1 Count_9_rt_255 (
    .I0(\Count<9> ),
    .O(Count_9_rt)
  );
  defparam Count_10_rt_256.INIT = 4'h2;
  LUT1 Count_10_rt_256 (
    .I0(\Count<10> ),
    .O(Count_10_rt)
  );
  defparam Count_11_rt_257.INIT = 4'h2;
  LUT1 Count_11_rt_257 (
    .I0(\Count<11> ),
    .O(Count_11_rt)
  );
  defparam Count_12_rt_258.INIT = 4'h2;
  LUT1 Count_12_rt_258 (
    .I0(\Count<12> ),
    .O(Count_12_rt)
  );
  defparam Count_13_rt_259.INIT = 4'h2;
  LUT1 Count_13_rt_259 (
    .I0(\Count<13> ),
    .O(Count_13_rt)
  );
  defparam Count_14_rt_260.INIT = 4'h2;
  LUT1 Count_14_rt_260 (
    .I0(\Count<14> ),
    .O(Count_14_rt)
  );
  defparam Count_15_rt_261.INIT = 4'h2;
  LUT1 Count_15_rt_261 (
    .I0(\Count<15> ),
    .O(Count_15_rt)
  );
  defparam Count_16_rt_262.INIT = 4'h2;
  LUT1 Count_16_rt_262 (
    .I0(\Count<16> ),
    .O(Count_16_rt)
  );
  defparam Count_17_rt_263.INIT = 4'h2;
  LUT1 Count_17_rt_263 (
    .I0(\Count<17> ),
    .O(Count_17_rt)
  );
  defparam Count_18_rt_264.INIT = 4'h2;
  LUT1 Count_18_rt_264 (
    .I0(\Count<18> ),
    .O(Count_18_rt)
  );
  defparam Count_19_rt_265.INIT = 4'h2;
  LUT1 Count_19_rt_265 (
    .I0(\Count<19> ),
    .O(Count_19_rt)
  );
  defparam Count_20_rt_266.INIT = 4'h2;
  LUT1 Count_20_rt_266 (
    .I0(\Count<20> ),
    .O(Count_20_rt)
  );
  defparam Count_21_rt_267.INIT = 4'h2;
  LUT1 Count_21_rt_267 (
    .I0(\Count<21> ),
    .O(Count_21_rt)
  );
  defparam Count_22_rt_268.INIT = 4'h2;
  LUT1 Count_22_rt_268 (
    .I0(\Count<22> ),
    .O(Count_22_rt)
  );
  defparam Count_23_rt_269.INIT = 4'h2;
  LUT1 Count_23_rt_269 (
    .I0(\Count<23> ),
    .O(Count_23_rt)
  );
  defparam Count_24_rt_270.INIT = 4'h2;
  LUT1 Count_24_rt_270 (
    .I0(\Count<24> ),
    .O(Count_24_rt)
  );
  defparam Count_25_rt_271.INIT = 4'h2;
  LUT1 Count_25_rt_271 (
    .I0(\Count<25> ),
    .O(Count_25_rt)
  );
  defparam Count_26_rt_272.INIT = 4'h2;
  LUT1 Count_26_rt_272 (
    .I0(\Count<26> ),
    .O(Count_26_rt)
  );
  defparam Count_27_rt_273.INIT = 4'h2;
  LUT1 Count_27_rt_273 (
    .I0(\Count<27> ),
    .O(Count_27_rt)
  );
  defparam Count_28_rt_274.INIT = 4'h2;
  LUT1 Count_28_rt_274 (
    .I0(\Count<28> ),
    .O(Count_28_rt)
  );
  defparam Count_29_rt_275.INIT = 4'h2;
  LUT1 Count_29_rt_275 (
    .I0(\Count<29> ),
    .O(Count_29_rt)
  );
  defparam Count_30_rt_276.INIT = 4'h2;
  LUT1 Count_30_rt_276 (
    .I0(\Count<30> ),
    .O(Count_30_rt)
  );
  defparam Count_31_rt_277.INIT = 4'h2;
  LUT1 Count_31_rt_277 (
    .I0(\Count<31> ),
    .O(Count_31_rt)
  );
endmodule

module Monostable_4 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire N0;
  wire \Count<0> ;
  wire \Count<31> ;
  wire \Count<30> ;
  wire \Count<24> ;
  wire \Count<29> ;
  wire \Count<23> ;
  wire \Count<28> ;
  wire \Count<22> ;
  wire \Count<27> ;
  wire \Count<21> ;
  wire \Count<26> ;
  wire \Count<20> ;
  wire \Count<25> ;
  wire \Count<14> ;
  wire \Count<19> ;
  wire \Count<13> ;
  wire \Count<18> ;
  wire \Count<12> ;
  wire \Count<17> ;
  wire \Count<11> ;
  wire \Count<16> ;
  wire \Count<10> ;
  wire \Count<15> ;
  wire \Count<4> ;
  wire \Count<9> ;
  wire \Count<3> ;
  wire \Count<8> ;
  wire \Count<2> ;
  wire \Count<7> ;
  wire \Count<1> ;
  wire \Count<6> ;
  wire \Count<5> ;
  wire \Count__n0000<2> ;
  wire CHOICE1932;
  wire \Count__n0000<3> ;
  wire \Count__n0000<1> ;
  wire \Count__n0000<4> ;
  wire \Count__n0000<5> ;
  wire \Count__n0000<6> ;
  wire \Count__n0000<7> ;
  wire \Count__n0000<8> ;
  wire \Count__n0000<9> ;
  wire \Count__n0000<10> ;
  wire \Count__n0000<11> ;
  wire \Count__n0000<12> ;
  wire \Count__n0000<13> ;
  wire \Count__n0000<14> ;
  wire \Count__n0000<15> ;
  wire \Count__n0000<16> ;
  wire \Count__n0000<17> ;
  wire \Count__n0000<18> ;
  wire \Count__n0000<19> ;
  wire \Count__n0000<20> ;
  wire \Count__n0000<21> ;
  wire \Count__n0000<22> ;
  wire \Count__n0000<23> ;
  wire \Count__n0000<24> ;
  wire \Count__n0000<25> ;
  wire \Count__n0000<26> ;
  wire \Count__n0000<27> ;
  wire \Count__n0000<28> ;
  wire \Count__n0000<29> ;
  wire \Count__n0000<30> ;
  wire \Count__n0000<31> ;
  wire N1;
  wire \Monostable_4_Count__n0000<30>_cyo ;
  wire N3;
  wire \Monostable_4_Count__n0000<0>_cyo ;
  wire \Monostable_4_Count__n0000<1>_cyo ;
  wire \Monostable_4_Count__n0000<2>_cyo ;
  wire \Monostable_4_Count__n0000<3>_cyo ;
  wire \Monostable_4_Count__n0000<4>_cyo ;
  wire \Monostable_4_Count__n0000<5>_cyo ;
  wire \Monostable_4_Count__n0000<6>_cyo ;
  wire \Monostable_4_Count__n0000<7>_cyo ;
  wire \Monostable_4_Count__n0000<8>_cyo ;
  wire \Monostable_4_Count__n0000<9>_cyo ;
  wire \Monostable_4_Count__n0000<10>_cyo ;
  wire \Monostable_4_Count__n0000<11>_cyo ;
  wire \Monostable_4_Count__n0000<12>_cyo ;
  wire \Monostable_4_Count__n0000<13>_cyo ;
  wire \Monostable_4_Count__n0000<14>_cyo ;
  wire \Monostable_4_Count__n0000<15>_cyo ;
  wire \Monostable_4_Count__n0000<16>_cyo ;
  wire \Monostable_4_Count__n0000<17>_cyo ;
  wire \Monostable_4_Count__n0000<18>_cyo ;
  wire \Monostable_4_Count__n0000<19>_cyo ;
  wire \Monostable_4_Count__n0000<20>_cyo ;
  wire \Monostable_4_Count__n0000<21>_cyo ;
  wire \Monostable_4_Count__n0000<22>_cyo ;
  wire \Monostable_4_Count__n0000<23>_cyo ;
  wire \Monostable_4_Count__n0000<24>_cyo ;
  wire \Monostable_4_Count__n0000<25>_cyo ;
  wire \Monostable_4_Count__n0000<26>_cyo ;
  wire \Monostable_4_Count__n0000<27>_cyo ;
  wire \Monostable_4_Count__n0000<28>_cyo ;
  wire \Monostable_4_Count__n0000<29>_cyo ;
  wire N7;
  wire N31;
  wire CHOICE2166;
  wire CHOICE2172;
  wire CHOICE2182;
  wire CHOICE2159;
  wire CHOICE1936;
  wire CHOICE2153;
  wire CHOICE2176;
  wire Count_1_rt;
  wire Count_2_rt;
  wire Count_3_rt;
  wire Count_4_rt;
  wire Count_5_rt;
  wire Count_6_rt;
  wire Count_7_rt;
  wire Count_8_rt;
  wire Count_9_rt;
  wire Count_10_rt;
  wire Count_11_rt;
  wire Count_12_rt;
  wire Count_13_rt;
  wire Count_14_rt;
  wire Count_15_rt;
  wire Count_16_rt;
  wire Count_17_rt;
  wire Count_18_rt;
  wire Count_19_rt;
  wire Count_20_rt;
  wire Count_21_rt;
  wire Count_22_rt;
  wire Count_23_rt;
  wire Count_24_rt;
  wire Count_25_rt;
  wire Count_26_rt;
  wire Count_27_rt;
  wire Count_28_rt;
  wire Count_29_rt;
  wire Count_30_rt;
  wire Count_31_rt;
  GND XST_GND (
    .G(N0)
  );
  defparam _n0000915.INIT = 16'hFFEF;
  LUT4 _n0000915 (
    .I0(\Count<19> ),
    .I1(\Count<9> ),
    .I2(\Count<8> ),
    .I3(\Count<29> ),
    .O(CHOICE1936)
  );
  FDR Count_30 (
    .D(\Count__n0000<30> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<30> )
  );
  FDSE Out_278 (
    .D(N0),
    .S(In),
    .CE(_n0000),
    .C(Dclk),
    .Q(Out)
  );
  FDR Count_31 (
    .D(\Count__n0000<31> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<31> )
  );
  XORCY \Monostable_4_Count__n0000<31>_xor  (
    .CI(\Monostable_4_Count__n0000<30>_cyo ),
    .LI(Count_31_rt),
    .O(\Count__n0000<31> )
  );
  FDR Count_0 (
    .D(N3),
    .R(In),
    .C(Dclk),
    .Q(\Count<0> )
  );
  FDR Count_1 (
    .D(\Count__n0000<1> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<1> )
  );
  FDR Count_2 (
    .D(\Count__n0000<2> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<2> )
  );
  FDR Count_3 (
    .D(\Count__n0000<3> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<3> )
  );
  FDR Count_4 (
    .D(\Count__n0000<4> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<4> )
  );
  FDR Count_5 (
    .D(\Count__n0000<5> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<5> )
  );
  FDR Count_6 (
    .D(\Count__n0000<6> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<6> )
  );
  FDR Count_7 (
    .D(\Count__n0000<7> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<7> )
  );
  FDR Count_8 (
    .D(\Count__n0000<8> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<8> )
  );
  FDR Count_9 (
    .D(\Count__n0000<9> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<9> )
  );
  FDR Count_10 (
    .D(\Count__n0000<10> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<10> )
  );
  FDR Count_11 (
    .D(\Count__n0000<11> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<11> )
  );
  FDR Count_12 (
    .D(\Count__n0000<12> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<12> )
  );
  FDR Count_13 (
    .D(\Count__n0000<13> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<13> )
  );
  FDR Count_14 (
    .D(\Count__n0000<14> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<14> )
  );
  FDR Count_15 (
    .D(\Count__n0000<15> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<15> )
  );
  FDR Count_16 (
    .D(\Count__n0000<16> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<16> )
  );
  FDR Count_17 (
    .D(\Count__n0000<17> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<17> )
  );
  FDR Count_18 (
    .D(\Count__n0000<18> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<18> )
  );
  FDR Count_19 (
    .D(\Count__n0000<19> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<19> )
  );
  FDR Count_20 (
    .D(\Count__n0000<20> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<20> )
  );
  FDR Count_21 (
    .D(\Count__n0000<21> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<21> )
  );
  FDR Count_22 (
    .D(\Count__n0000<22> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<22> )
  );
  FDR Count_23 (
    .D(\Count__n0000<23> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<23> )
  );
  FDR Count_24 (
    .D(\Count__n0000<24> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<24> )
  );
  FDR Count_25 (
    .D(\Count__n0000<25> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<25> )
  );
  FDR Count_26 (
    .D(\Count__n0000<26> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<26> )
  );
  FDR Count_27 (
    .D(\Count__n0000<27> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<27> )
  );
  FDR Count_28 (
    .D(\Count__n0000<28> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<28> )
  );
  FDR Count_29 (
    .D(\Count__n0000<29> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<29> )
  );
  VCC XST_VCC (
    .P(N1)
  );
  defparam \Monostable_4_Count__n0000<0>lut .INIT = 4'h1;
  LUT1 \Monostable_4_Count__n0000<0>lut  (
    .I0(\Count<0> ),
    .O(N3)
  );
  MUXCY \Monostable_4_Count__n0000<0>cy  (
    .CI(N0),
    .DI(N1),
    .S(N3),
    .O(\Monostable_4_Count__n0000<0>_cyo )
  );
  defparam _n0000531.INIT = 16'hEFFF;
  LUT4 _n0000531 (
    .I0(\Count<24> ),
    .I1(\Count<23> ),
    .I2(\Count<3> ),
    .I3(\Count<14> ),
    .O(CHOICE2182)
  );
  MUXCY \Monostable_4_Count__n0000<1>cy  (
    .CI(\Monostable_4_Count__n0000<0>_cyo ),
    .DI(N0),
    .S(Count_1_rt),
    .O(\Monostable_4_Count__n0000<1>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<1>_xor  (
    .CI(\Monostable_4_Count__n0000<0>_cyo ),
    .LI(Count_1_rt),
    .O(\Count__n0000<1> )
  );
  MUXCY \Monostable_4_Count__n0000<2>cy  (
    .CI(\Monostable_4_Count__n0000<1>_cyo ),
    .DI(N0),
    .S(Count_2_rt),
    .O(\Monostable_4_Count__n0000<2>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<2>_xor  (
    .CI(\Monostable_4_Count__n0000<1>_cyo ),
    .LI(Count_2_rt),
    .O(\Count__n0000<2> )
  );
  MUXCY \Monostable_4_Count__n0000<3>cy  (
    .CI(\Monostable_4_Count__n0000<2>_cyo ),
    .DI(N0),
    .S(Count_3_rt),
    .O(\Monostable_4_Count__n0000<3>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<3>_xor  (
    .CI(\Monostable_4_Count__n0000<2>_cyo ),
    .LI(Count_3_rt),
    .O(\Count__n0000<3> )
  );
  MUXCY \Monostable_4_Count__n0000<4>cy  (
    .CI(\Monostable_4_Count__n0000<3>_cyo ),
    .DI(N0),
    .S(Count_4_rt),
    .O(\Monostable_4_Count__n0000<4>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<4>_xor  (
    .CI(\Monostable_4_Count__n0000<3>_cyo ),
    .LI(Count_4_rt),
    .O(\Count__n0000<4> )
  );
  MUXCY \Monostable_4_Count__n0000<5>cy  (
    .CI(\Monostable_4_Count__n0000<4>_cyo ),
    .DI(N0),
    .S(Count_5_rt),
    .O(\Monostable_4_Count__n0000<5>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<5>_xor  (
    .CI(\Monostable_4_Count__n0000<4>_cyo ),
    .LI(Count_5_rt),
    .O(\Count__n0000<5> )
  );
  MUXCY \Monostable_4_Count__n0000<6>cy  (
    .CI(\Monostable_4_Count__n0000<5>_cyo ),
    .DI(N0),
    .S(Count_6_rt),
    .O(\Monostable_4_Count__n0000<6>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<6>_xor  (
    .CI(\Monostable_4_Count__n0000<5>_cyo ),
    .LI(Count_6_rt),
    .O(\Count__n0000<6> )
  );
  MUXCY \Monostable_4_Count__n0000<7>cy  (
    .CI(\Monostable_4_Count__n0000<6>_cyo ),
    .DI(N0),
    .S(Count_7_rt),
    .O(\Monostable_4_Count__n0000<7>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<7>_xor  (
    .CI(\Monostable_4_Count__n0000<6>_cyo ),
    .LI(Count_7_rt),
    .O(\Count__n0000<7> )
  );
  MUXCY \Monostable_4_Count__n0000<8>cy  (
    .CI(\Monostable_4_Count__n0000<7>_cyo ),
    .DI(N0),
    .S(Count_8_rt),
    .O(\Monostable_4_Count__n0000<8>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<8>_xor  (
    .CI(\Monostable_4_Count__n0000<7>_cyo ),
    .LI(Count_8_rt),
    .O(\Count__n0000<8> )
  );
  MUXCY \Monostable_4_Count__n0000<9>cy  (
    .CI(\Monostable_4_Count__n0000<8>_cyo ),
    .DI(N0),
    .S(Count_9_rt),
    .O(\Monostable_4_Count__n0000<9>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<9>_xor  (
    .CI(\Monostable_4_Count__n0000<8>_cyo ),
    .LI(Count_9_rt),
    .O(\Count__n0000<9> )
  );
  MUXCY \Monostable_4_Count__n0000<10>cy  (
    .CI(\Monostable_4_Count__n0000<9>_cyo ),
    .DI(N0),
    .S(Count_10_rt),
    .O(\Monostable_4_Count__n0000<10>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<10>_xor  (
    .CI(\Monostable_4_Count__n0000<9>_cyo ),
    .LI(Count_10_rt),
    .O(\Count__n0000<10> )
  );
  MUXCY \Monostable_4_Count__n0000<11>cy  (
    .CI(\Monostable_4_Count__n0000<10>_cyo ),
    .DI(N0),
    .S(Count_11_rt),
    .O(\Monostable_4_Count__n0000<11>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<11>_xor  (
    .CI(\Monostable_4_Count__n0000<10>_cyo ),
    .LI(Count_11_rt),
    .O(\Count__n0000<11> )
  );
  MUXCY \Monostable_4_Count__n0000<12>cy  (
    .CI(\Monostable_4_Count__n0000<11>_cyo ),
    .DI(N0),
    .S(Count_12_rt),
    .O(\Monostable_4_Count__n0000<12>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<12>_xor  (
    .CI(\Monostable_4_Count__n0000<11>_cyo ),
    .LI(Count_12_rt),
    .O(\Count__n0000<12> )
  );
  MUXCY \Monostable_4_Count__n0000<13>cy  (
    .CI(\Monostable_4_Count__n0000<12>_cyo ),
    .DI(N0),
    .S(Count_13_rt),
    .O(\Monostable_4_Count__n0000<13>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<13>_xor  (
    .CI(\Monostable_4_Count__n0000<12>_cyo ),
    .LI(Count_13_rt),
    .O(\Count__n0000<13> )
  );
  MUXCY \Monostable_4_Count__n0000<14>cy  (
    .CI(\Monostable_4_Count__n0000<13>_cyo ),
    .DI(N0),
    .S(Count_14_rt),
    .O(\Monostable_4_Count__n0000<14>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<14>_xor  (
    .CI(\Monostable_4_Count__n0000<13>_cyo ),
    .LI(Count_14_rt),
    .O(\Count__n0000<14> )
  );
  MUXCY \Monostable_4_Count__n0000<15>cy  (
    .CI(\Monostable_4_Count__n0000<14>_cyo ),
    .DI(N0),
    .S(Count_15_rt),
    .O(\Monostable_4_Count__n0000<15>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<15>_xor  (
    .CI(\Monostable_4_Count__n0000<14>_cyo ),
    .LI(Count_15_rt),
    .O(\Count__n0000<15> )
  );
  MUXCY \Monostable_4_Count__n0000<16>cy  (
    .CI(\Monostable_4_Count__n0000<15>_cyo ),
    .DI(N0),
    .S(Count_16_rt),
    .O(\Monostable_4_Count__n0000<16>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<16>_xor  (
    .CI(\Monostable_4_Count__n0000<15>_cyo ),
    .LI(Count_16_rt),
    .O(\Count__n0000<16> )
  );
  MUXCY \Monostable_4_Count__n0000<17>cy  (
    .CI(\Monostable_4_Count__n0000<16>_cyo ),
    .DI(N0),
    .S(Count_17_rt),
    .O(\Monostable_4_Count__n0000<17>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<17>_xor  (
    .CI(\Monostable_4_Count__n0000<16>_cyo ),
    .LI(Count_17_rt),
    .O(\Count__n0000<17> )
  );
  MUXCY \Monostable_4_Count__n0000<18>cy  (
    .CI(\Monostable_4_Count__n0000<17>_cyo ),
    .DI(N0),
    .S(Count_18_rt),
    .O(\Monostable_4_Count__n0000<18>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<18>_xor  (
    .CI(\Monostable_4_Count__n0000<17>_cyo ),
    .LI(Count_18_rt),
    .O(\Count__n0000<18> )
  );
  MUXCY \Monostable_4_Count__n0000<19>cy  (
    .CI(\Monostable_4_Count__n0000<18>_cyo ),
    .DI(N0),
    .S(Count_19_rt),
    .O(\Monostable_4_Count__n0000<19>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<19>_xor  (
    .CI(\Monostable_4_Count__n0000<18>_cyo ),
    .LI(Count_19_rt),
    .O(\Count__n0000<19> )
  );
  MUXCY \Monostable_4_Count__n0000<20>cy  (
    .CI(\Monostable_4_Count__n0000<19>_cyo ),
    .DI(N0),
    .S(Count_20_rt),
    .O(\Monostable_4_Count__n0000<20>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<20>_xor  (
    .CI(\Monostable_4_Count__n0000<19>_cyo ),
    .LI(Count_20_rt),
    .O(\Count__n0000<20> )
  );
  MUXCY \Monostable_4_Count__n0000<21>cy  (
    .CI(\Monostable_4_Count__n0000<20>_cyo ),
    .DI(N0),
    .S(Count_21_rt),
    .O(\Monostable_4_Count__n0000<21>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<21>_xor  (
    .CI(\Monostable_4_Count__n0000<20>_cyo ),
    .LI(Count_21_rt),
    .O(\Count__n0000<21> )
  );
  MUXCY \Monostable_4_Count__n0000<22>cy  (
    .CI(\Monostable_4_Count__n0000<21>_cyo ),
    .DI(N0),
    .S(Count_22_rt),
    .O(\Monostable_4_Count__n0000<22>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<22>_xor  (
    .CI(\Monostable_4_Count__n0000<21>_cyo ),
    .LI(Count_22_rt),
    .O(\Count__n0000<22> )
  );
  MUXCY \Monostable_4_Count__n0000<23>cy  (
    .CI(\Monostable_4_Count__n0000<22>_cyo ),
    .DI(N0),
    .S(Count_23_rt),
    .O(\Monostable_4_Count__n0000<23>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<23>_xor  (
    .CI(\Monostable_4_Count__n0000<22>_cyo ),
    .LI(Count_23_rt),
    .O(\Count__n0000<23> )
  );
  MUXCY \Monostable_4_Count__n0000<24>cy  (
    .CI(\Monostable_4_Count__n0000<23>_cyo ),
    .DI(N0),
    .S(Count_24_rt),
    .O(\Monostable_4_Count__n0000<24>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<24>_xor  (
    .CI(\Monostable_4_Count__n0000<23>_cyo ),
    .LI(Count_24_rt),
    .O(\Count__n0000<24> )
  );
  MUXCY \Monostable_4_Count__n0000<25>cy  (
    .CI(\Monostable_4_Count__n0000<24>_cyo ),
    .DI(N0),
    .S(Count_25_rt),
    .O(\Monostable_4_Count__n0000<25>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<25>_xor  (
    .CI(\Monostable_4_Count__n0000<24>_cyo ),
    .LI(Count_25_rt),
    .O(\Count__n0000<25> )
  );
  MUXCY \Monostable_4_Count__n0000<26>cy  (
    .CI(\Monostable_4_Count__n0000<25>_cyo ),
    .DI(N0),
    .S(Count_26_rt),
    .O(\Monostable_4_Count__n0000<26>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<26>_xor  (
    .CI(\Monostable_4_Count__n0000<25>_cyo ),
    .LI(Count_26_rt),
    .O(\Count__n0000<26> )
  );
  MUXCY \Monostable_4_Count__n0000<27>cy  (
    .CI(\Monostable_4_Count__n0000<26>_cyo ),
    .DI(N0),
    .S(Count_27_rt),
    .O(\Monostable_4_Count__n0000<27>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<27>_xor  (
    .CI(\Monostable_4_Count__n0000<26>_cyo ),
    .LI(Count_27_rt),
    .O(\Count__n0000<27> )
  );
  MUXCY \Monostable_4_Count__n0000<28>cy  (
    .CI(\Monostable_4_Count__n0000<27>_cyo ),
    .DI(N0),
    .S(Count_28_rt),
    .O(\Monostable_4_Count__n0000<28>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<28>_xor  (
    .CI(\Monostable_4_Count__n0000<27>_cyo ),
    .LI(Count_28_rt),
    .O(\Count__n0000<28> )
  );
  MUXCY \Monostable_4_Count__n0000<29>cy  (
    .CI(\Monostable_4_Count__n0000<28>_cyo ),
    .DI(N0),
    .S(Count_29_rt),
    .O(\Monostable_4_Count__n0000<29>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<29>_xor  (
    .CI(\Monostable_4_Count__n0000<28>_cyo ),
    .LI(Count_29_rt),
    .O(\Count__n0000<29> )
  );
  MUXCY \Monostable_4_Count__n0000<30>cy  (
    .CI(\Monostable_4_Count__n0000<29>_cyo ),
    .DI(N0),
    .S(Count_30_rt),
    .O(\Monostable_4_Count__n0000<30>_cyo )
  );
  XORCY \Monostable_4_Count__n0000<30>_xor  (
    .CI(\Monostable_4_Count__n0000<29>_cyo ),
    .LI(Count_30_rt),
    .O(\Count__n0000<30> )
  );
  defparam _n0000540.INIT = 16'hFFFE;
  LUT4 _n0000540 (
    .I0(CHOICE2172),
    .I1(CHOICE2176),
    .I2(CHOICE2182),
    .I3(N7),
    .O(N31)
  );
  defparam _n0000170.INIT = 16'h4000;
  LUT4 _n0000170 (
    .I0(N31),
    .I1(CHOICE2153),
    .I2(CHOICE2159),
    .I3(CHOICE2166),
    .O(_n0000)
  );
  defparam _n0000512.INIT = 16'hFFEF;
  LUT4 _n0000512 (
    .I0(\Count<25> ),
    .I1(\Count<15> ),
    .I2(\Count<5> ),
    .I3(\Count<4> ),
    .O(CHOICE2176)
  );
  defparam _n0000916.INIT = 4'hE;
  LUT2 _n0000916 (
    .I0(CHOICE1932),
    .I1(CHOICE1936),
    .O(N7)
  );
  defparam _n000097.INIT = 16'hFFEF;
  LUT4 _n000097 (
    .I0(\Count<27> ),
    .I1(\Count<28> ),
    .I2(\Count<7> ),
    .I3(\Count<18> ),
    .O(CHOICE1932)
  );
  defparam _n0000125.INIT = 16'h0002;
  LUT4 _n0000125 (
    .I0(\Count<13> ),
    .I1(\Count<2> ),
    .I2(\Count<12> ),
    .I3(\Count<22> ),
    .O(CHOICE2159)
  );
  defparam _n0000138.INIT = 16'h0001;
  LUT4 _n0000138 (
    .I0(\Count<10> ),
    .I1(\Count<20> ),
    .I2(\Count<30> ),
    .I3(\Count<0> ),
    .O(CHOICE2166)
  );
  defparam _n0000113.INIT = 16'h0001;
  LUT4 _n0000113 (
    .I0(\Count<11> ),
    .I1(\Count<21> ),
    .I2(\Count<31> ),
    .I3(\Count<1> ),
    .O(CHOICE2153)
  );
  defparam _n000054.INIT = 16'hFFFE;
  LUT4 _n000054 (
    .I0(\Count<16> ),
    .I1(\Count<26> ),
    .I2(\Count<6> ),
    .I3(\Count<17> ),
    .O(CHOICE2172)
  );
  defparam Count_1_rt_279.INIT = 4'h2;
  LUT1 Count_1_rt_279 (
    .I0(\Count<1> ),
    .O(Count_1_rt)
  );
  defparam Count_2_rt_280.INIT = 4'h2;
  LUT1 Count_2_rt_280 (
    .I0(\Count<2> ),
    .O(Count_2_rt)
  );
  defparam Count_3_rt_281.INIT = 4'h2;
  LUT1 Count_3_rt_281 (
    .I0(\Count<3> ),
    .O(Count_3_rt)
  );
  defparam Count_4_rt_282.INIT = 4'h2;
  LUT1 Count_4_rt_282 (
    .I0(\Count<4> ),
    .O(Count_4_rt)
  );
  defparam Count_5_rt_283.INIT = 4'h2;
  LUT1 Count_5_rt_283 (
    .I0(\Count<5> ),
    .O(Count_5_rt)
  );
  defparam Count_6_rt_284.INIT = 4'h2;
  LUT1 Count_6_rt_284 (
    .I0(\Count<6> ),
    .O(Count_6_rt)
  );
  defparam Count_7_rt_285.INIT = 4'h2;
  LUT1 Count_7_rt_285 (
    .I0(\Count<7> ),
    .O(Count_7_rt)
  );
  defparam Count_8_rt_286.INIT = 4'h2;
  LUT1 Count_8_rt_286 (
    .I0(\Count<8> ),
    .O(Count_8_rt)
  );
  defparam Count_9_rt_287.INIT = 4'h2;
  LUT1 Count_9_rt_287 (
    .I0(\Count<9> ),
    .O(Count_9_rt)
  );
  defparam Count_10_rt_288.INIT = 4'h2;
  LUT1 Count_10_rt_288 (
    .I0(\Count<10> ),
    .O(Count_10_rt)
  );
  defparam Count_11_rt_289.INIT = 4'h2;
  LUT1 Count_11_rt_289 (
    .I0(\Count<11> ),
    .O(Count_11_rt)
  );
  defparam Count_12_rt_290.INIT = 4'h2;
  LUT1 Count_12_rt_290 (
    .I0(\Count<12> ),
    .O(Count_12_rt)
  );
  defparam Count_13_rt_291.INIT = 4'h2;
  LUT1 Count_13_rt_291 (
    .I0(\Count<13> ),
    .O(Count_13_rt)
  );
  defparam Count_14_rt_292.INIT = 4'h2;
  LUT1 Count_14_rt_292 (
    .I0(\Count<14> ),
    .O(Count_14_rt)
  );
  defparam Count_15_rt_293.INIT = 4'h2;
  LUT1 Count_15_rt_293 (
    .I0(\Count<15> ),
    .O(Count_15_rt)
  );
  defparam Count_16_rt_294.INIT = 4'h2;
  LUT1 Count_16_rt_294 (
    .I0(\Count<16> ),
    .O(Count_16_rt)
  );
  defparam Count_17_rt_295.INIT = 4'h2;
  LUT1 Count_17_rt_295 (
    .I0(\Count<17> ),
    .O(Count_17_rt)
  );
  defparam Count_18_rt_296.INIT = 4'h2;
  LUT1 Count_18_rt_296 (
    .I0(\Count<18> ),
    .O(Count_18_rt)
  );
  defparam Count_19_rt_297.INIT = 4'h2;
  LUT1 Count_19_rt_297 (
    .I0(\Count<19> ),
    .O(Count_19_rt)
  );
  defparam Count_20_rt_298.INIT = 4'h2;
  LUT1 Count_20_rt_298 (
    .I0(\Count<20> ),
    .O(Count_20_rt)
  );
  defparam Count_21_rt_299.INIT = 4'h2;
  LUT1 Count_21_rt_299 (
    .I0(\Count<21> ),
    .O(Count_21_rt)
  );
  defparam Count_22_rt_300.INIT = 4'h2;
  LUT1 Count_22_rt_300 (
    .I0(\Count<22> ),
    .O(Count_22_rt)
  );
  defparam Count_23_rt_301.INIT = 4'h2;
  LUT1 Count_23_rt_301 (
    .I0(\Count<23> ),
    .O(Count_23_rt)
  );
  defparam Count_24_rt_302.INIT = 4'h2;
  LUT1 Count_24_rt_302 (
    .I0(\Count<24> ),
    .O(Count_24_rt)
  );
  defparam Count_25_rt_303.INIT = 4'h2;
  LUT1 Count_25_rt_303 (
    .I0(\Count<25> ),
    .O(Count_25_rt)
  );
  defparam Count_26_rt_304.INIT = 4'h2;
  LUT1 Count_26_rt_304 (
    .I0(\Count<26> ),
    .O(Count_26_rt)
  );
  defparam Count_27_rt_305.INIT = 4'h2;
  LUT1 Count_27_rt_305 (
    .I0(\Count<27> ),
    .O(Count_27_rt)
  );
  defparam Count_28_rt_306.INIT = 4'h2;
  LUT1 Count_28_rt_306 (
    .I0(\Count<28> ),
    .O(Count_28_rt)
  );
  defparam Count_29_rt_307.INIT = 4'h2;
  LUT1 Count_29_rt_307 (
    .I0(\Count<29> ),
    .O(Count_29_rt)
  );
  defparam Count_30_rt_308.INIT = 4'h2;
  LUT1 Count_30_rt_308 (
    .I0(\Count<30> ),
    .O(Count_30_rt)
  );
  defparam Count_31_rt_309.INIT = 4'h2;
  LUT1 Count_31_rt_309 (
    .I0(\Count<31> ),
    .O(Count_31_rt)
  );
endmodule

module PlotterControl (
  bu1, bv1, dclk, ad2, ae2, af2, ah2, ak2, bh2, bl2, bm2, bn2, as2, bp2, bt2, be2, aj2, bf2, al2, an2, ar2, at2, av2
);
  input bu1;
  input bv1;
  input dclk;
  input ad2;
  input ae2;
  input af2;
  input ah2;
  input ak2;
  input bh2;
  input bl2;
  input bm2;
  input bn2;
  input as2;
  input bp2;
  input bt2;
  output be2;
  output aj2;
  output bf2;
  output al2;
  output an2;
  output ar2;
  output at2;
  output av2;
  wire NlwRenamedSig_OI_bf2;
  wire slow_op_start;
  wire pltr_flag_clr;
  wire fast_op_start;
  wire pltr_iop1;
  wire pltr_iop2;
  wire pltr_iop4;
  wire inst50_;
  wire slow_op_done;
  wire fast_op_done;
  wire pltr_flag_clock;
  wire _n0003;
  wire pltr_iot;
  wire pltr_flag_set;
  wire m704jj2;
  wire _n0007;
  wire _n0002;
  wire m704jk2;
  wire N3;
  wire N5;
  wire N7;
  wire N9;
  wire N31;
  wire N71;
  assign
    bf2 = NlwRenamedSig_OI_bf2;
  defparam fast_op_start_SW1.INIT = 16'hD5FF;
  LUT4 fast_op_start_SW1 (
    .I0(bm2),
    .I1(bt2),
    .I2(bu1),
    .I3(bl2),
    .O(N71)
  );
  FDC pltr_flag (
    .D(pltr_flag_set),
    .CLR(pltr_flag_clr),
    .C(pltr_flag_clock),
    .Q(NlwRenamedSig_OI_bf2)
  );
  Monostable_4 m704fast2 (
    .Dclk(dclk),
    .In(m704jj2),
    .Out(fast_op_done)
  );
  FDC pen_right (
    .D(ak2),
    .CLR(_n0002),
    .C(pltr_iop1),
    .Q(aj2)
  );
  Monostable_4_1 m704fast1 (
    .Dclk(dclk),
    .In(fast_op_start),
    .Out(m704jj2)
  );
  defparam pltr_iot_SW0.INIT = 8'h80;
  LUT3 pltr_iot_SW0 (
    .I0(af2),
    .I1(ae2),
    .I2(ad2),
    .O(N31)
  );
  defparam pltr_flag_set1.INIT = 4'hD;
  LUT2 pltr_flag_set1 (
    .I0(m704jk2),
    .I1(NlwRenamedSig_OI_bf2),
    .O(pltr_flag_set)
  );
  FDC pen_left (
    .D(as2),
    .CLR(_n0002),
    .C(pltr_iop1),
    .Q(al2)
  );
  defparam pltr_iot_310.INIT = 16'h8880;
  LUT4 pltr_iot_310 (
    .I0(N31),
    .I1(ah2),
    .I2(bv1),
    .I3(bu1),
    .O(pltr_iot)
  );
  defparam pltr_flag_clock1.INIT = 4'hE;
  LUT2 pltr_flag_clock1 (
    .I0(fast_op_done),
    .I1(slow_op_done),
    .O(pltr_flag_clock)
  );
  defparam slow_op_start2.INIT = 8'h80;
  LUT3 slow_op_start2 (
    .I0(ad2),
    .I1(ae2),
    .I2(N9),
    .O(slow_op_start)
  );
  defparam inst50_1.INIT = 4'hE;
  LUT2 inst50_1 (
    .I0(as2),
    .I1(ak2),
    .O(inst50_)
  );
  defparam slow_op_start1.INIT = 16'h8000;
  LUT4 slow_op_start1 (
    .I0(af2),
    .I1(ah2),
    .I2(bt2),
    .I3(bv1),
    .O(N9)
  );
  defparam fast_op_start_311.INIT = 16'h8880;
  LUT4 fast_op_start_311 (
    .I0(N71),
    .I1(pltr_iot),
    .I2(as2),
    .I3(ak2),
    .O(fast_op_start)
  );
  defparam pltr_iop42.INIT = 16'h8000;
  LUT4 pltr_iop42 (
    .I0(ad2),
    .I1(ae2),
    .I2(af2),
    .I3(N7),
    .O(pltr_iop4)
  );
  Monostable_3 m704slow2 (
    .Dclk(dclk),
    .In(m704jk2),
    .Out(slow_op_done)
  );
  Monostable_3_1 m704slow1 (
    .Dclk(dclk),
    .In(slow_op_start),
    .Out(m704jk2)
  );
  defparam pltr_flag_clr1.INIT = 16'hBAAA;
  LUT4 pltr_flag_clr1 (
    .I0(bn2),
    .I1(inst50_),
    .I2(pltr_iot),
    .I3(bp2),
    .O(pltr_flag_clr)
  );
  defparam pltr_iop41.INIT = 16'h8880;
  LUT4 pltr_iop41 (
    .I0(ah2),
    .I1(bt2),
    .I2(bu1),
    .I3(bv1),
    .O(N7)
  );
  defparam pltr_iop22.INIT = 16'h8000;
  LUT4 pltr_iop22 (
    .I0(ad2),
    .I1(ae2),
    .I2(af2),
    .I3(N5),
    .O(pltr_iop2)
  );
  defparam io_bus_in_skip_1.INIT = 16'h4000;
  LUT4 io_bus_in_skip_1 (
    .I0(inst50_),
    .I1(pltr_iot),
    .I2(bh2),
    .I3(NlwRenamedSig_OI_bf2),
    .O(be2)
  );
  FDC pen_up (
    .D(_n0007),
    .CLR(_n0003),
    .C(pltr_iop4),
    .Q(at2)
  );
  FDC pen_down (
    .D(as2),
    .CLR(_n0003),
    .C(pltr_iop4),
    .Q(av2)
  );
  FDC drum_down (
    .D(ak2),
    .CLR(_n0002),
    .C(pltr_iop2),
    .Q(ar2)
  );
  FDC drum_up (
    .D(inst50_),
    .CLR(_n0002),
    .C(pltr_iop2),
    .Q(an2)
  );
  defparam _n00071.INIT = 4'h1;
  LUT2 _n00071 (
    .I0(ak2),
    .I1(as2),
    .O(_n0007)
  );
  defparam _n00031.INIT = 4'hE;
  LUT2 _n00031 (
    .I0(bn2),
    .I1(slow_op_done),
    .O(_n0003)
  );
  defparam _n00021.INIT = 4'hE;
  LUT2 _n00021 (
    .I0(bn2),
    .I1(fast_op_done),
    .O(_n0002)
  );
  defparam pltr_iop11.INIT = 16'h8880;
  LUT4 pltr_iop11 (
    .I0(ah2),
    .I1(bh2),
    .I2(bu1),
    .I3(bv1),
    .O(N3)
  );
  defparam pltr_iop12.INIT = 16'h8000;
  LUT4 pltr_iop12 (
    .I0(ad2),
    .I1(ae2),
    .I2(af2),
    .I3(N3),
    .O(pltr_iop1)
  );
  defparam pltr_iop21.INIT = 16'h8880;
  LUT4 pltr_iop21 (
    .I0(ah2),
    .I1(bp2),
    .I2(bu1),
    .I3(bv1),
    .O(N5)
  );
endmodule

module Monostable_2 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire N0;
  wire \Count<0> ;
  wire \Count<31> ;
  wire \Count<30> ;
  wire \Count<24> ;
  wire \Count<29> ;
  wire \Count<23> ;
  wire \Count<28> ;
  wire \Count<22> ;
  wire \Count<27> ;
  wire \Count<21> ;
  wire \Count<26> ;
  wire \Count<20> ;
  wire \Count<25> ;
  wire \Count<14> ;
  wire \Count<19> ;
  wire \Count<13> ;
  wire \Count<18> ;
  wire \Count<12> ;
  wire \Count<17> ;
  wire \Count<11> ;
  wire \Count<16> ;
  wire \Count<10> ;
  wire \Count<15> ;
  wire \Count<4> ;
  wire \Count<9> ;
  wire \Count<3> ;
  wire \Count<8> ;
  wire \Count<2> ;
  wire \Count<7> ;
  wire \Count<1> ;
  wire \Count<6> ;
  wire \Count<5> ;
  wire \Count__n0000<2> ;
  wire CHOICE1923;
  wire \Count__n0000<3> ;
  wire \Count__n0000<1> ;
  wire \Count__n0000<4> ;
  wire \Count__n0000<5> ;
  wire \Count__n0000<6> ;
  wire \Count__n0000<7> ;
  wire \Count__n0000<8> ;
  wire \Count__n0000<9> ;
  wire \Count__n0000<10> ;
  wire \Count__n0000<11> ;
  wire \Count__n0000<12> ;
  wire \Count__n0000<13> ;
  wire \Count__n0000<14> ;
  wire \Count__n0000<15> ;
  wire \Count__n0000<16> ;
  wire \Count__n0000<17> ;
  wire \Count__n0000<18> ;
  wire \Count__n0000<19> ;
  wire \Count__n0000<20> ;
  wire \Count__n0000<21> ;
  wire \Count__n0000<22> ;
  wire \Count__n0000<23> ;
  wire \Count__n0000<24> ;
  wire \Count__n0000<25> ;
  wire \Count__n0000<26> ;
  wire \Count__n0000<27> ;
  wire \Count__n0000<28> ;
  wire \Count__n0000<29> ;
  wire \Count__n0000<30> ;
  wire \Count__n0000<31> ;
  wire N1;
  wire \Monostable_2_Count__n0000<30>_cyo ;
  wire N3;
  wire \Monostable_2_Count__n0000<0>_cyo ;
  wire \Monostable_2_Count__n0000<1>_cyo ;
  wire \Monostable_2_Count__n0000<2>_cyo ;
  wire \Monostable_2_Count__n0000<3>_cyo ;
  wire \Monostable_2_Count__n0000<4>_cyo ;
  wire \Monostable_2_Count__n0000<5>_cyo ;
  wire \Monostable_2_Count__n0000<6>_cyo ;
  wire \Monostable_2_Count__n0000<7>_cyo ;
  wire \Monostable_2_Count__n0000<8>_cyo ;
  wire \Monostable_2_Count__n0000<9>_cyo ;
  wire \Monostable_2_Count__n0000<10>_cyo ;
  wire \Monostable_2_Count__n0000<11>_cyo ;
  wire \Monostable_2_Count__n0000<12>_cyo ;
  wire \Monostable_2_Count__n0000<13>_cyo ;
  wire \Monostable_2_Count__n0000<14>_cyo ;
  wire \Monostable_2_Count__n0000<15>_cyo ;
  wire \Monostable_2_Count__n0000<16>_cyo ;
  wire \Monostable_2_Count__n0000<17>_cyo ;
  wire \Monostable_2_Count__n0000<18>_cyo ;
  wire \Monostable_2_Count__n0000<19>_cyo ;
  wire \Monostable_2_Count__n0000<20>_cyo ;
  wire \Monostable_2_Count__n0000<21>_cyo ;
  wire \Monostable_2_Count__n0000<22>_cyo ;
  wire \Monostable_2_Count__n0000<23>_cyo ;
  wire \Monostable_2_Count__n0000<24>_cyo ;
  wire \Monostable_2_Count__n0000<25>_cyo ;
  wire \Monostable_2_Count__n0000<26>_cyo ;
  wire \Monostable_2_Count__n0000<27>_cyo ;
  wire \Monostable_2_Count__n0000<28>_cyo ;
  wire \Monostable_2_Count__n0000<29>_cyo ;
  wire N7;
  wire N31;
  wire CHOICE2119;
  wire CHOICE2142;
  wire CHOICE2110;
  wire CHOICE2113;
  wire CHOICE2135;
  wire CHOICE2129;
  wire CHOICE1927;
  wire Count_1_rt;
  wire Count_2_rt;
  wire Count_3_rt;
  wire Count_4_rt;
  wire Count_5_rt;
  wire Count_6_rt;
  wire Count_7_rt;
  wire Count_8_rt;
  wire Count_9_rt;
  wire Count_10_rt;
  wire Count_11_rt;
  wire Count_12_rt;
  wire Count_13_rt;
  wire Count_14_rt;
  wire Count_15_rt;
  wire Count_16_rt;
  wire Count_17_rt;
  wire Count_18_rt;
  wire Count_19_rt;
  wire Count_20_rt;
  wire Count_21_rt;
  wire Count_22_rt;
  wire Count_23_rt;
  wire Count_24_rt;
  wire Count_25_rt;
  wire Count_26_rt;
  wire Count_27_rt;
  wire Count_28_rt;
  wire Count_29_rt;
  wire Count_30_rt;
  wire Count_31_rt;
  GND XST_GND (
    .G(N0)
  );
  defparam _n0000125.INIT = 16'h0002;
  LUT4 _n0000125 (
    .I0(\Count<10> ),
    .I1(\Count<20> ),
    .I2(\Count<30> ),
    .I3(\Count<0> ),
    .O(CHOICE2135)
  );
  FDR Count_30 (
    .D(\Count__n0000<30> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<30> )
  );
  FDSE Out_312 (
    .D(N0),
    .S(In),
    .CE(_n0000),
    .C(Dclk),
    .Q(Out)
  );
  FDR Count_31 (
    .D(\Count__n0000<31> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<31> )
  );
  XORCY \Monostable_2_Count__n0000<31>_xor  (
    .CI(\Monostable_2_Count__n0000<30>_cyo ),
    .LI(Count_31_rt),
    .O(\Count__n0000<31> )
  );
  FDR Count_0 (
    .D(N3),
    .R(In),
    .C(Dclk),
    .Q(\Count<0> )
  );
  FDR Count_1 (
    .D(\Count__n0000<1> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<1> )
  );
  FDR Count_2 (
    .D(\Count__n0000<2> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<2> )
  );
  FDR Count_3 (
    .D(\Count__n0000<3> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<3> )
  );
  FDR Count_4 (
    .D(\Count__n0000<4> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<4> )
  );
  FDR Count_5 (
    .D(\Count__n0000<5> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<5> )
  );
  FDR Count_6 (
    .D(\Count__n0000<6> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<6> )
  );
  FDR Count_7 (
    .D(\Count__n0000<7> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<7> )
  );
  FDR Count_8 (
    .D(\Count__n0000<8> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<8> )
  );
  FDR Count_9 (
    .D(\Count__n0000<9> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<9> )
  );
  FDR Count_10 (
    .D(\Count__n0000<10> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<10> )
  );
  FDR Count_11 (
    .D(\Count__n0000<11> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<11> )
  );
  FDR Count_12 (
    .D(\Count__n0000<12> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<12> )
  );
  FDR Count_13 (
    .D(\Count__n0000<13> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<13> )
  );
  FDR Count_14 (
    .D(\Count__n0000<14> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<14> )
  );
  FDR Count_15 (
    .D(\Count__n0000<15> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<15> )
  );
  FDR Count_16 (
    .D(\Count__n0000<16> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<16> )
  );
  FDR Count_17 (
    .D(\Count__n0000<17> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<17> )
  );
  FDR Count_18 (
    .D(\Count__n0000<18> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<18> )
  );
  FDR Count_19 (
    .D(\Count__n0000<19> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<19> )
  );
  FDR Count_20 (
    .D(\Count__n0000<20> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<20> )
  );
  FDR Count_21 (
    .D(\Count__n0000<21> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<21> )
  );
  FDR Count_22 (
    .D(\Count__n0000<22> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<22> )
  );
  FDR Count_23 (
    .D(\Count__n0000<23> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<23> )
  );
  FDR Count_24 (
    .D(\Count__n0000<24> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<24> )
  );
  FDR Count_25 (
    .D(\Count__n0000<25> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<25> )
  );
  FDR Count_26 (
    .D(\Count__n0000<26> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<26> )
  );
  FDR Count_27 (
    .D(\Count__n0000<27> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<27> )
  );
  FDR Count_28 (
    .D(\Count__n0000<28> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<28> )
  );
  FDR Count_29 (
    .D(\Count__n0000<29> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<29> )
  );
  VCC XST_VCC (
    .P(N1)
  );
  defparam \Monostable_2_Count__n0000<0>lut .INIT = 4'h1;
  LUT1 \Monostable_2_Count__n0000<0>lut  (
    .I0(\Count<0> ),
    .O(N3)
  );
  MUXCY \Monostable_2_Count__n0000<0>cy  (
    .CI(N0),
    .DI(N1),
    .S(N3),
    .O(\Monostable_2_Count__n0000<0>_cyo )
  );
  defparam _n0000915.INIT = 16'hFFEF;
  LUT4 _n0000915 (
    .I0(\Count<29> ),
    .I1(\Count<19> ),
    .I2(\Count<9> ),
    .I3(\Count<8> ),
    .O(CHOICE1927)
  );
  MUXCY \Monostable_2_Count__n0000<1>cy  (
    .CI(\Monostable_2_Count__n0000<0>_cyo ),
    .DI(N0),
    .S(Count_1_rt),
    .O(\Monostable_2_Count__n0000<1>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<1>_xor  (
    .CI(\Monostable_2_Count__n0000<0>_cyo ),
    .LI(Count_1_rt),
    .O(\Count__n0000<1> )
  );
  MUXCY \Monostable_2_Count__n0000<2>cy  (
    .CI(\Monostable_2_Count__n0000<1>_cyo ),
    .DI(N0),
    .S(Count_2_rt),
    .O(\Monostable_2_Count__n0000<2>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<2>_xor  (
    .CI(\Monostable_2_Count__n0000<1>_cyo ),
    .LI(Count_2_rt),
    .O(\Count__n0000<2> )
  );
  MUXCY \Monostable_2_Count__n0000<3>cy  (
    .CI(\Monostable_2_Count__n0000<2>_cyo ),
    .DI(N0),
    .S(Count_3_rt),
    .O(\Monostable_2_Count__n0000<3>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<3>_xor  (
    .CI(\Monostable_2_Count__n0000<2>_cyo ),
    .LI(Count_3_rt),
    .O(\Count__n0000<3> )
  );
  MUXCY \Monostable_2_Count__n0000<4>cy  (
    .CI(\Monostable_2_Count__n0000<3>_cyo ),
    .DI(N0),
    .S(Count_4_rt),
    .O(\Monostable_2_Count__n0000<4>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<4>_xor  (
    .CI(\Monostable_2_Count__n0000<3>_cyo ),
    .LI(Count_4_rt),
    .O(\Count__n0000<4> )
  );
  MUXCY \Monostable_2_Count__n0000<5>cy  (
    .CI(\Monostable_2_Count__n0000<4>_cyo ),
    .DI(N0),
    .S(Count_5_rt),
    .O(\Monostable_2_Count__n0000<5>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<5>_xor  (
    .CI(\Monostable_2_Count__n0000<4>_cyo ),
    .LI(Count_5_rt),
    .O(\Count__n0000<5> )
  );
  MUXCY \Monostable_2_Count__n0000<6>cy  (
    .CI(\Monostable_2_Count__n0000<5>_cyo ),
    .DI(N0),
    .S(Count_6_rt),
    .O(\Monostable_2_Count__n0000<6>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<6>_xor  (
    .CI(\Monostable_2_Count__n0000<5>_cyo ),
    .LI(Count_6_rt),
    .O(\Count__n0000<6> )
  );
  MUXCY \Monostable_2_Count__n0000<7>cy  (
    .CI(\Monostable_2_Count__n0000<6>_cyo ),
    .DI(N0),
    .S(Count_7_rt),
    .O(\Monostable_2_Count__n0000<7>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<7>_xor  (
    .CI(\Monostable_2_Count__n0000<6>_cyo ),
    .LI(Count_7_rt),
    .O(\Count__n0000<7> )
  );
  MUXCY \Monostable_2_Count__n0000<8>cy  (
    .CI(\Monostable_2_Count__n0000<7>_cyo ),
    .DI(N0),
    .S(Count_8_rt),
    .O(\Monostable_2_Count__n0000<8>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<8>_xor  (
    .CI(\Monostable_2_Count__n0000<7>_cyo ),
    .LI(Count_8_rt),
    .O(\Count__n0000<8> )
  );
  MUXCY \Monostable_2_Count__n0000<9>cy  (
    .CI(\Monostable_2_Count__n0000<8>_cyo ),
    .DI(N0),
    .S(Count_9_rt),
    .O(\Monostable_2_Count__n0000<9>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<9>_xor  (
    .CI(\Monostable_2_Count__n0000<8>_cyo ),
    .LI(Count_9_rt),
    .O(\Count__n0000<9> )
  );
  MUXCY \Monostable_2_Count__n0000<10>cy  (
    .CI(\Monostable_2_Count__n0000<9>_cyo ),
    .DI(N0),
    .S(Count_10_rt),
    .O(\Monostable_2_Count__n0000<10>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<10>_xor  (
    .CI(\Monostable_2_Count__n0000<9>_cyo ),
    .LI(Count_10_rt),
    .O(\Count__n0000<10> )
  );
  MUXCY \Monostable_2_Count__n0000<11>cy  (
    .CI(\Monostable_2_Count__n0000<10>_cyo ),
    .DI(N0),
    .S(Count_11_rt),
    .O(\Monostable_2_Count__n0000<11>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<11>_xor  (
    .CI(\Monostable_2_Count__n0000<10>_cyo ),
    .LI(Count_11_rt),
    .O(\Count__n0000<11> )
  );
  MUXCY \Monostable_2_Count__n0000<12>cy  (
    .CI(\Monostable_2_Count__n0000<11>_cyo ),
    .DI(N0),
    .S(Count_12_rt),
    .O(\Monostable_2_Count__n0000<12>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<12>_xor  (
    .CI(\Monostable_2_Count__n0000<11>_cyo ),
    .LI(Count_12_rt),
    .O(\Count__n0000<12> )
  );
  MUXCY \Monostable_2_Count__n0000<13>cy  (
    .CI(\Monostable_2_Count__n0000<12>_cyo ),
    .DI(N0),
    .S(Count_13_rt),
    .O(\Monostable_2_Count__n0000<13>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<13>_xor  (
    .CI(\Monostable_2_Count__n0000<12>_cyo ),
    .LI(Count_13_rt),
    .O(\Count__n0000<13> )
  );
  MUXCY \Monostable_2_Count__n0000<14>cy  (
    .CI(\Monostable_2_Count__n0000<13>_cyo ),
    .DI(N0),
    .S(Count_14_rt),
    .O(\Monostable_2_Count__n0000<14>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<14>_xor  (
    .CI(\Monostable_2_Count__n0000<13>_cyo ),
    .LI(Count_14_rt),
    .O(\Count__n0000<14> )
  );
  MUXCY \Monostable_2_Count__n0000<15>cy  (
    .CI(\Monostable_2_Count__n0000<14>_cyo ),
    .DI(N0),
    .S(Count_15_rt),
    .O(\Monostable_2_Count__n0000<15>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<15>_xor  (
    .CI(\Monostable_2_Count__n0000<14>_cyo ),
    .LI(Count_15_rt),
    .O(\Count__n0000<15> )
  );
  MUXCY \Monostable_2_Count__n0000<16>cy  (
    .CI(\Monostable_2_Count__n0000<15>_cyo ),
    .DI(N0),
    .S(Count_16_rt),
    .O(\Monostable_2_Count__n0000<16>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<16>_xor  (
    .CI(\Monostable_2_Count__n0000<15>_cyo ),
    .LI(Count_16_rt),
    .O(\Count__n0000<16> )
  );
  MUXCY \Monostable_2_Count__n0000<17>cy  (
    .CI(\Monostable_2_Count__n0000<16>_cyo ),
    .DI(N0),
    .S(Count_17_rt),
    .O(\Monostable_2_Count__n0000<17>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<17>_xor  (
    .CI(\Monostable_2_Count__n0000<16>_cyo ),
    .LI(Count_17_rt),
    .O(\Count__n0000<17> )
  );
  MUXCY \Monostable_2_Count__n0000<18>cy  (
    .CI(\Monostable_2_Count__n0000<17>_cyo ),
    .DI(N0),
    .S(Count_18_rt),
    .O(\Monostable_2_Count__n0000<18>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<18>_xor  (
    .CI(\Monostable_2_Count__n0000<17>_cyo ),
    .LI(Count_18_rt),
    .O(\Count__n0000<18> )
  );
  MUXCY \Monostable_2_Count__n0000<19>cy  (
    .CI(\Monostable_2_Count__n0000<18>_cyo ),
    .DI(N0),
    .S(Count_19_rt),
    .O(\Monostable_2_Count__n0000<19>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<19>_xor  (
    .CI(\Monostable_2_Count__n0000<18>_cyo ),
    .LI(Count_19_rt),
    .O(\Count__n0000<19> )
  );
  MUXCY \Monostable_2_Count__n0000<20>cy  (
    .CI(\Monostable_2_Count__n0000<19>_cyo ),
    .DI(N0),
    .S(Count_20_rt),
    .O(\Monostable_2_Count__n0000<20>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<20>_xor  (
    .CI(\Monostable_2_Count__n0000<19>_cyo ),
    .LI(Count_20_rt),
    .O(\Count__n0000<20> )
  );
  MUXCY \Monostable_2_Count__n0000<21>cy  (
    .CI(\Monostable_2_Count__n0000<20>_cyo ),
    .DI(N0),
    .S(Count_21_rt),
    .O(\Monostable_2_Count__n0000<21>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<21>_xor  (
    .CI(\Monostable_2_Count__n0000<20>_cyo ),
    .LI(Count_21_rt),
    .O(\Count__n0000<21> )
  );
  MUXCY \Monostable_2_Count__n0000<22>cy  (
    .CI(\Monostable_2_Count__n0000<21>_cyo ),
    .DI(N0),
    .S(Count_22_rt),
    .O(\Monostable_2_Count__n0000<22>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<22>_xor  (
    .CI(\Monostable_2_Count__n0000<21>_cyo ),
    .LI(Count_22_rt),
    .O(\Count__n0000<22> )
  );
  MUXCY \Monostable_2_Count__n0000<23>cy  (
    .CI(\Monostable_2_Count__n0000<22>_cyo ),
    .DI(N0),
    .S(Count_23_rt),
    .O(\Monostable_2_Count__n0000<23>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<23>_xor  (
    .CI(\Monostable_2_Count__n0000<22>_cyo ),
    .LI(Count_23_rt),
    .O(\Count__n0000<23> )
  );
  MUXCY \Monostable_2_Count__n0000<24>cy  (
    .CI(\Monostable_2_Count__n0000<23>_cyo ),
    .DI(N0),
    .S(Count_24_rt),
    .O(\Monostable_2_Count__n0000<24>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<24>_xor  (
    .CI(\Monostable_2_Count__n0000<23>_cyo ),
    .LI(Count_24_rt),
    .O(\Count__n0000<24> )
  );
  MUXCY \Monostable_2_Count__n0000<25>cy  (
    .CI(\Monostable_2_Count__n0000<24>_cyo ),
    .DI(N0),
    .S(Count_25_rt),
    .O(\Monostable_2_Count__n0000<25>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<25>_xor  (
    .CI(\Monostable_2_Count__n0000<24>_cyo ),
    .LI(Count_25_rt),
    .O(\Count__n0000<25> )
  );
  MUXCY \Monostable_2_Count__n0000<26>cy  (
    .CI(\Monostable_2_Count__n0000<25>_cyo ),
    .DI(N0),
    .S(Count_26_rt),
    .O(\Monostable_2_Count__n0000<26>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<26>_xor  (
    .CI(\Monostable_2_Count__n0000<25>_cyo ),
    .LI(Count_26_rt),
    .O(\Count__n0000<26> )
  );
  MUXCY \Monostable_2_Count__n0000<27>cy  (
    .CI(\Monostable_2_Count__n0000<26>_cyo ),
    .DI(N0),
    .S(Count_27_rt),
    .O(\Monostable_2_Count__n0000<27>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<27>_xor  (
    .CI(\Monostable_2_Count__n0000<26>_cyo ),
    .LI(Count_27_rt),
    .O(\Count__n0000<27> )
  );
  MUXCY \Monostable_2_Count__n0000<28>cy  (
    .CI(\Monostable_2_Count__n0000<27>_cyo ),
    .DI(N0),
    .S(Count_28_rt),
    .O(\Monostable_2_Count__n0000<28>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<28>_xor  (
    .CI(\Monostable_2_Count__n0000<27>_cyo ),
    .LI(Count_28_rt),
    .O(\Count__n0000<28> )
  );
  MUXCY \Monostable_2_Count__n0000<29>cy  (
    .CI(\Monostable_2_Count__n0000<28>_cyo ),
    .DI(N0),
    .S(Count_29_rt),
    .O(\Monostable_2_Count__n0000<29>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<29>_xor  (
    .CI(\Monostable_2_Count__n0000<28>_cyo ),
    .LI(Count_29_rt),
    .O(\Count__n0000<29> )
  );
  MUXCY \Monostable_2_Count__n0000<30>cy  (
    .CI(\Monostable_2_Count__n0000<29>_cyo ),
    .DI(N0),
    .S(Count_30_rt),
    .O(\Monostable_2_Count__n0000<30>_cyo )
  );
  XORCY \Monostable_2_Count__n0000<30>_xor  (
    .CI(\Monostable_2_Count__n0000<29>_cyo ),
    .LI(Count_30_rt),
    .O(\Count__n0000<30> )
  );
  defparam _n0000540.INIT = 16'hFFFE;
  LUT4 _n0000540 (
    .I0(CHOICE2110),
    .I1(CHOICE2113),
    .I2(CHOICE2119),
    .I3(N7),
    .O(N31)
  );
  defparam _n0000170.INIT = 16'h4000;
  LUT4 _n0000170 (
    .I0(N31),
    .I1(CHOICE2129),
    .I2(CHOICE2135),
    .I3(CHOICE2142),
    .O(_n0000)
  );
  defparam _n0000916.INIT = 4'hE;
  LUT2 _n0000916 (
    .I0(CHOICE1923),
    .I1(CHOICE1927),
    .O(N7)
  );
  defparam _n0000512.INIT = 16'hFFFE;
  LUT4 _n0000512 (
    .I0(\Count<23> ),
    .I1(\Count<3> ),
    .I2(\Count<14> ),
    .I3(\Count<24> ),
    .O(CHOICE2113)
  );
  defparam _n000097.INIT = 16'hFFEF;
  LUT4 _n000097 (
    .I0(\Count<27> ),
    .I1(\Count<28> ),
    .I2(\Count<7> ),
    .I3(\Count<18> ),
    .O(CHOICE1923)
  );
  defparam _n0000113.INIT = 16'h0001;
  LUT4 _n0000113 (
    .I0(\Count<12> ),
    .I1(\Count<22> ),
    .I2(\Count<2> ),
    .I3(\Count<13> ),
    .O(CHOICE2129)
  );
  defparam _n0000138.INIT = 16'h0001;
  LUT4 _n0000138 (
    .I0(\Count<11> ),
    .I1(\Count<21> ),
    .I2(\Count<31> ),
    .I3(\Count<1> ),
    .O(CHOICE2142)
  );
  defparam _n000057.INIT = 16'hFFEF;
  LUT4 _n000057 (
    .I0(\Count<26> ),
    .I1(\Count<17> ),
    .I2(\Count<16> ),
    .I3(\Count<6> ),
    .O(CHOICE2110)
  );
  defparam _n0000531.INIT = 16'hEFFF;
  LUT4 _n0000531 (
    .I0(\Count<25> ),
    .I1(\Count<4> ),
    .I2(\Count<15> ),
    .I3(\Count<5> ),
    .O(CHOICE2119)
  );
  defparam Count_1_rt_313.INIT = 4'h2;
  LUT1 Count_1_rt_313 (
    .I0(\Count<1> ),
    .O(Count_1_rt)
  );
  defparam Count_2_rt_314.INIT = 4'h2;
  LUT1 Count_2_rt_314 (
    .I0(\Count<2> ),
    .O(Count_2_rt)
  );
  defparam Count_3_rt_315.INIT = 4'h2;
  LUT1 Count_3_rt_315 (
    .I0(\Count<3> ),
    .O(Count_3_rt)
  );
  defparam Count_4_rt_316.INIT = 4'h2;
  LUT1 Count_4_rt_316 (
    .I0(\Count<4> ),
    .O(Count_4_rt)
  );
  defparam Count_5_rt_317.INIT = 4'h2;
  LUT1 Count_5_rt_317 (
    .I0(\Count<5> ),
    .O(Count_5_rt)
  );
  defparam Count_6_rt_318.INIT = 4'h2;
  LUT1 Count_6_rt_318 (
    .I0(\Count<6> ),
    .O(Count_6_rt)
  );
  defparam Count_7_rt_319.INIT = 4'h2;
  LUT1 Count_7_rt_319 (
    .I0(\Count<7> ),
    .O(Count_7_rt)
  );
  defparam Count_8_rt_320.INIT = 4'h2;
  LUT1 Count_8_rt_320 (
    .I0(\Count<8> ),
    .O(Count_8_rt)
  );
  defparam Count_9_rt_321.INIT = 4'h2;
  LUT1 Count_9_rt_321 (
    .I0(\Count<9> ),
    .O(Count_9_rt)
  );
  defparam Count_10_rt_322.INIT = 4'h2;
  LUT1 Count_10_rt_322 (
    .I0(\Count<10> ),
    .O(Count_10_rt)
  );
  defparam Count_11_rt_323.INIT = 4'h2;
  LUT1 Count_11_rt_323 (
    .I0(\Count<11> ),
    .O(Count_11_rt)
  );
  defparam Count_12_rt_324.INIT = 4'h2;
  LUT1 Count_12_rt_324 (
    .I0(\Count<12> ),
    .O(Count_12_rt)
  );
  defparam Count_13_rt_325.INIT = 4'h2;
  LUT1 Count_13_rt_325 (
    .I0(\Count<13> ),
    .O(Count_13_rt)
  );
  defparam Count_14_rt_326.INIT = 4'h2;
  LUT1 Count_14_rt_326 (
    .I0(\Count<14> ),
    .O(Count_14_rt)
  );
  defparam Count_15_rt_327.INIT = 4'h2;
  LUT1 Count_15_rt_327 (
    .I0(\Count<15> ),
    .O(Count_15_rt)
  );
  defparam Count_16_rt_328.INIT = 4'h2;
  LUT1 Count_16_rt_328 (
    .I0(\Count<16> ),
    .O(Count_16_rt)
  );
  defparam Count_17_rt_329.INIT = 4'h2;
  LUT1 Count_17_rt_329 (
    .I0(\Count<17> ),
    .O(Count_17_rt)
  );
  defparam Count_18_rt_330.INIT = 4'h2;
  LUT1 Count_18_rt_330 (
    .I0(\Count<18> ),
    .O(Count_18_rt)
  );
  defparam Count_19_rt_331.INIT = 4'h2;
  LUT1 Count_19_rt_331 (
    .I0(\Count<19> ),
    .O(Count_19_rt)
  );
  defparam Count_20_rt_332.INIT = 4'h2;
  LUT1 Count_20_rt_332 (
    .I0(\Count<20> ),
    .O(Count_20_rt)
  );
  defparam Count_21_rt_333.INIT = 4'h2;
  LUT1 Count_21_rt_333 (
    .I0(\Count<21> ),
    .O(Count_21_rt)
  );
  defparam Count_22_rt_334.INIT = 4'h2;
  LUT1 Count_22_rt_334 (
    .I0(\Count<22> ),
    .O(Count_22_rt)
  );
  defparam Count_23_rt_335.INIT = 4'h2;
  LUT1 Count_23_rt_335 (
    .I0(\Count<23> ),
    .O(Count_23_rt)
  );
  defparam Count_24_rt_336.INIT = 4'h2;
  LUT1 Count_24_rt_336 (
    .I0(\Count<24> ),
    .O(Count_24_rt)
  );
  defparam Count_25_rt_337.INIT = 4'h2;
  LUT1 Count_25_rt_337 (
    .I0(\Count<25> ),
    .O(Count_25_rt)
  );
  defparam Count_26_rt_338.INIT = 4'h2;
  LUT1 Count_26_rt_338 (
    .I0(\Count<26> ),
    .O(Count_26_rt)
  );
  defparam Count_27_rt_339.INIT = 4'h2;
  LUT1 Count_27_rt_339 (
    .I0(\Count<27> ),
    .O(Count_27_rt)
  );
  defparam Count_28_rt_340.INIT = 4'h2;
  LUT1 Count_28_rt_340 (
    .I0(\Count<28> ),
    .O(Count_28_rt)
  );
  defparam Count_29_rt_341.INIT = 4'h2;
  LUT1 Count_29_rt_341 (
    .I0(\Count<29> ),
    .O(Count_29_rt)
  );
  defparam Count_30_rt_342.INIT = 4'h2;
  LUT1 Count_30_rt_342 (
    .I0(\Count<30> ),
    .O(Count_30_rt)
  );
  defparam Count_31_rt_343.INIT = 4'h2;
  LUT1 Count_31_rt_343 (
    .I0(\Count<31> ),
    .O(Count_31_rt)
  );
endmodule

module Monostable_6 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire N0;
  wire \Count<0> ;
  wire \Count<31> ;
  wire \Count<30> ;
  wire \Count<24> ;
  wire \Count<29> ;
  wire \Count<23> ;
  wire \Count<28> ;
  wire \Count<22> ;
  wire \Count<27> ;
  wire \Count<21> ;
  wire \Count<26> ;
  wire \Count<20> ;
  wire \Count<25> ;
  wire \Count<14> ;
  wire \Count<19> ;
  wire \Count<13> ;
  wire \Count<18> ;
  wire \Count<12> ;
  wire \Count<17> ;
  wire \Count<11> ;
  wire \Count<16> ;
  wire \Count<10> ;
  wire \Count<15> ;
  wire \Count<4> ;
  wire \Count<9> ;
  wire \Count<3> ;
  wire \Count<8> ;
  wire \Count<2> ;
  wire \Count<7> ;
  wire \Count<1> ;
  wire \Count<6> ;
  wire \Count<5> ;
  wire \Count__n0000<2> ;
  wire CHOICE1913;
  wire \Count__n0000<3> ;
  wire \Count__n0000<1> ;
  wire \Count__n0000<4> ;
  wire \Count__n0000<5> ;
  wire \Count__n0000<6> ;
  wire \Count__n0000<7> ;
  wire \Count__n0000<8> ;
  wire \Count__n0000<9> ;
  wire \Count__n0000<10> ;
  wire \Count__n0000<11> ;
  wire \Count__n0000<12> ;
  wire \Count__n0000<13> ;
  wire \Count__n0000<14> ;
  wire \Count__n0000<15> ;
  wire \Count__n0000<16> ;
  wire \Count__n0000<17> ;
  wire \Count__n0000<18> ;
  wire \Count__n0000<19> ;
  wire \Count__n0000<20> ;
  wire \Count__n0000<21> ;
  wire \Count__n0000<22> ;
  wire \Count__n0000<23> ;
  wire \Count__n0000<24> ;
  wire \Count__n0000<25> ;
  wire \Count__n0000<26> ;
  wire \Count__n0000<27> ;
  wire \Count__n0000<28> ;
  wire \Count__n0000<29> ;
  wire \Count__n0000<30> ;
  wire \Count__n0000<31> ;
  wire N1;
  wire \Monostable_6_Count__n0000<30>_cyo ;
  wire N3;
  wire \Monostable_6_Count__n0000<0>_cyo ;
  wire \Monostable_6_Count__n0000<1>_cyo ;
  wire \Monostable_6_Count__n0000<2>_cyo ;
  wire \Monostable_6_Count__n0000<3>_cyo ;
  wire \Monostable_6_Count__n0000<4>_cyo ;
  wire \Monostable_6_Count__n0000<5>_cyo ;
  wire \Monostable_6_Count__n0000<6>_cyo ;
  wire \Monostable_6_Count__n0000<7>_cyo ;
  wire \Monostable_6_Count__n0000<8>_cyo ;
  wire \Monostable_6_Count__n0000<9>_cyo ;
  wire \Monostable_6_Count__n0000<10>_cyo ;
  wire \Monostable_6_Count__n0000<11>_cyo ;
  wire \Monostable_6_Count__n0000<12>_cyo ;
  wire \Monostable_6_Count__n0000<13>_cyo ;
  wire \Monostable_6_Count__n0000<14>_cyo ;
  wire \Monostable_6_Count__n0000<15>_cyo ;
  wire \Monostable_6_Count__n0000<16>_cyo ;
  wire \Monostable_6_Count__n0000<17>_cyo ;
  wire \Monostable_6_Count__n0000<18>_cyo ;
  wire \Monostable_6_Count__n0000<19>_cyo ;
  wire \Monostable_6_Count__n0000<20>_cyo ;
  wire \Monostable_6_Count__n0000<21>_cyo ;
  wire \Monostable_6_Count__n0000<22>_cyo ;
  wire \Monostable_6_Count__n0000<23>_cyo ;
  wire \Monostable_6_Count__n0000<24>_cyo ;
  wire \Monostable_6_Count__n0000<25>_cyo ;
  wire \Monostable_6_Count__n0000<26>_cyo ;
  wire \Monostable_6_Count__n0000<27>_cyo ;
  wire \Monostable_6_Count__n0000<28>_cyo ;
  wire \Monostable_6_Count__n0000<29>_cyo ;
  wire N7;
  wire N31;
  wire CHOICE2084;
  wire CHOICE2104;
  wire CHOICE2090;
  wire CHOICE1918;
  wire CHOICE2079;
  wire CHOICE2097;
  wire CHOICE2100;
  wire Count_1_rt;
  wire Count_2_rt;
  wire Count_3_rt;
  wire Count_4_rt;
  wire Count_5_rt;
  wire Count_6_rt;
  wire Count_7_rt;
  wire Count_8_rt;
  wire Count_9_rt;
  wire Count_10_rt;
  wire Count_11_rt;
  wire Count_12_rt;
  wire Count_13_rt;
  wire Count_14_rt;
  wire Count_15_rt;
  wire Count_16_rt;
  wire Count_17_rt;
  wire Count_18_rt;
  wire Count_19_rt;
  wire Count_20_rt;
  wire Count_21_rt;
  wire Count_22_rt;
  wire Count_23_rt;
  wire Count_24_rt;
  wire Count_25_rt;
  wire Count_26_rt;
  wire Count_27_rt;
  wire Count_28_rt;
  wire Count_29_rt;
  wire Count_30_rt;
  wire Count_31_rt;
  GND XST_GND (
    .G(N0)
  );
  defparam _n000057.INIT = 16'hFFEF;
  LUT4 _n000057 (
    .I0(\Count<26> ),
    .I1(\Count<17> ),
    .I2(\Count<16> ),
    .I3(\Count<6> ),
    .O(CHOICE2097)
  );
  FDR Count_30 (
    .D(\Count__n0000<30> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<30> )
  );
  FDSE Out_344 (
    .D(N0),
    .S(In),
    .CE(_n0000),
    .C(Dclk),
    .Q(Out)
  );
  FDR Count_31 (
    .D(\Count__n0000<31> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<31> )
  );
  XORCY \Monostable_6_Count__n0000<31>_xor  (
    .CI(\Monostable_6_Count__n0000<30>_cyo ),
    .LI(Count_31_rt),
    .O(\Count__n0000<31> )
  );
  FDR Count_0 (
    .D(N3),
    .R(In),
    .C(Dclk),
    .Q(\Count<0> )
  );
  FDR Count_1 (
    .D(\Count__n0000<1> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<1> )
  );
  FDR Count_2 (
    .D(\Count__n0000<2> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<2> )
  );
  FDR Count_3 (
    .D(\Count__n0000<3> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<3> )
  );
  FDR Count_4 (
    .D(\Count__n0000<4> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<4> )
  );
  FDR Count_5 (
    .D(\Count__n0000<5> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<5> )
  );
  FDR Count_6 (
    .D(\Count__n0000<6> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<6> )
  );
  FDR Count_7 (
    .D(\Count__n0000<7> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<7> )
  );
  FDR Count_8 (
    .D(\Count__n0000<8> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<8> )
  );
  FDR Count_9 (
    .D(\Count__n0000<9> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<9> )
  );
  FDR Count_10 (
    .D(\Count__n0000<10> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<10> )
  );
  FDR Count_11 (
    .D(\Count__n0000<11> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<11> )
  );
  FDR Count_12 (
    .D(\Count__n0000<12> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<12> )
  );
  FDR Count_13 (
    .D(\Count__n0000<13> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<13> )
  );
  FDR Count_14 (
    .D(\Count__n0000<14> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<14> )
  );
  FDR Count_15 (
    .D(\Count__n0000<15> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<15> )
  );
  FDR Count_16 (
    .D(\Count__n0000<16> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<16> )
  );
  FDR Count_17 (
    .D(\Count__n0000<17> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<17> )
  );
  FDR Count_18 (
    .D(\Count__n0000<18> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<18> )
  );
  FDR Count_19 (
    .D(\Count__n0000<19> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<19> )
  );
  FDR Count_20 (
    .D(\Count__n0000<20> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<20> )
  );
  FDR Count_21 (
    .D(\Count__n0000<21> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<21> )
  );
  FDR Count_22 (
    .D(\Count__n0000<22> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<22> )
  );
  FDR Count_23 (
    .D(\Count__n0000<23> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<23> )
  );
  FDR Count_24 (
    .D(\Count__n0000<24> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<24> )
  );
  FDR Count_25 (
    .D(\Count__n0000<25> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<25> )
  );
  FDR Count_26 (
    .D(\Count__n0000<26> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<26> )
  );
  FDR Count_27 (
    .D(\Count__n0000<27> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<27> )
  );
  FDR Count_28 (
    .D(\Count__n0000<28> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<28> )
  );
  FDR Count_29 (
    .D(\Count__n0000<29> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<29> )
  );
  VCC XST_VCC (
    .P(N1)
  );
  defparam \Monostable_6_Count__n0000<0>lut .INIT = 4'h1;
  LUT1 \Monostable_6_Count__n0000<0>lut  (
    .I0(\Count<0> ),
    .O(N3)
  );
  MUXCY \Monostable_6_Count__n0000<0>cy  (
    .CI(N0),
    .DI(N1),
    .S(N3),
    .O(\Monostable_6_Count__n0000<0>_cyo )
  );
  defparam _n0000113.INIT = 16'h0001;
  LUT4 _n0000113 (
    .I0(\Count<12> ),
    .I1(\Count<22> ),
    .I2(\Count<2> ),
    .I3(\Count<13> ),
    .O(CHOICE2079)
  );
  MUXCY \Monostable_6_Count__n0000<1>cy  (
    .CI(\Monostable_6_Count__n0000<0>_cyo ),
    .DI(N0),
    .S(Count_1_rt),
    .O(\Monostable_6_Count__n0000<1>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<1>_xor  (
    .CI(\Monostable_6_Count__n0000<0>_cyo ),
    .LI(Count_1_rt),
    .O(\Count__n0000<1> )
  );
  MUXCY \Monostable_6_Count__n0000<2>cy  (
    .CI(\Monostable_6_Count__n0000<1>_cyo ),
    .DI(N0),
    .S(Count_2_rt),
    .O(\Monostable_6_Count__n0000<2>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<2>_xor  (
    .CI(\Monostable_6_Count__n0000<1>_cyo ),
    .LI(Count_2_rt),
    .O(\Count__n0000<2> )
  );
  MUXCY \Monostable_6_Count__n0000<3>cy  (
    .CI(\Monostable_6_Count__n0000<2>_cyo ),
    .DI(N0),
    .S(Count_3_rt),
    .O(\Monostable_6_Count__n0000<3>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<3>_xor  (
    .CI(\Monostable_6_Count__n0000<2>_cyo ),
    .LI(Count_3_rt),
    .O(\Count__n0000<3> )
  );
  MUXCY \Monostable_6_Count__n0000<4>cy  (
    .CI(\Monostable_6_Count__n0000<3>_cyo ),
    .DI(N0),
    .S(Count_4_rt),
    .O(\Monostable_6_Count__n0000<4>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<4>_xor  (
    .CI(\Monostable_6_Count__n0000<3>_cyo ),
    .LI(Count_4_rt),
    .O(\Count__n0000<4> )
  );
  MUXCY \Monostable_6_Count__n0000<5>cy  (
    .CI(\Monostable_6_Count__n0000<4>_cyo ),
    .DI(N0),
    .S(Count_5_rt),
    .O(\Monostable_6_Count__n0000<5>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<5>_xor  (
    .CI(\Monostable_6_Count__n0000<4>_cyo ),
    .LI(Count_5_rt),
    .O(\Count__n0000<5> )
  );
  MUXCY \Monostable_6_Count__n0000<6>cy  (
    .CI(\Monostable_6_Count__n0000<5>_cyo ),
    .DI(N0),
    .S(Count_6_rt),
    .O(\Monostable_6_Count__n0000<6>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<6>_xor  (
    .CI(\Monostable_6_Count__n0000<5>_cyo ),
    .LI(Count_6_rt),
    .O(\Count__n0000<6> )
  );
  MUXCY \Monostable_6_Count__n0000<7>cy  (
    .CI(\Monostable_6_Count__n0000<6>_cyo ),
    .DI(N0),
    .S(Count_7_rt),
    .O(\Monostable_6_Count__n0000<7>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<7>_xor  (
    .CI(\Monostable_6_Count__n0000<6>_cyo ),
    .LI(Count_7_rt),
    .O(\Count__n0000<7> )
  );
  MUXCY \Monostable_6_Count__n0000<8>cy  (
    .CI(\Monostable_6_Count__n0000<7>_cyo ),
    .DI(N0),
    .S(Count_8_rt),
    .O(\Monostable_6_Count__n0000<8>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<8>_xor  (
    .CI(\Monostable_6_Count__n0000<7>_cyo ),
    .LI(Count_8_rt),
    .O(\Count__n0000<8> )
  );
  MUXCY \Monostable_6_Count__n0000<9>cy  (
    .CI(\Monostable_6_Count__n0000<8>_cyo ),
    .DI(N0),
    .S(Count_9_rt),
    .O(\Monostable_6_Count__n0000<9>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<9>_xor  (
    .CI(\Monostable_6_Count__n0000<8>_cyo ),
    .LI(Count_9_rt),
    .O(\Count__n0000<9> )
  );
  MUXCY \Monostable_6_Count__n0000<10>cy  (
    .CI(\Monostable_6_Count__n0000<9>_cyo ),
    .DI(N0),
    .S(Count_10_rt),
    .O(\Monostable_6_Count__n0000<10>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<10>_xor  (
    .CI(\Monostable_6_Count__n0000<9>_cyo ),
    .LI(Count_10_rt),
    .O(\Count__n0000<10> )
  );
  MUXCY \Monostable_6_Count__n0000<11>cy  (
    .CI(\Monostable_6_Count__n0000<10>_cyo ),
    .DI(N0),
    .S(Count_11_rt),
    .O(\Monostable_6_Count__n0000<11>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<11>_xor  (
    .CI(\Monostable_6_Count__n0000<10>_cyo ),
    .LI(Count_11_rt),
    .O(\Count__n0000<11> )
  );
  MUXCY \Monostable_6_Count__n0000<12>cy  (
    .CI(\Monostable_6_Count__n0000<11>_cyo ),
    .DI(N0),
    .S(Count_12_rt),
    .O(\Monostable_6_Count__n0000<12>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<12>_xor  (
    .CI(\Monostable_6_Count__n0000<11>_cyo ),
    .LI(Count_12_rt),
    .O(\Count__n0000<12> )
  );
  MUXCY \Monostable_6_Count__n0000<13>cy  (
    .CI(\Monostable_6_Count__n0000<12>_cyo ),
    .DI(N0),
    .S(Count_13_rt),
    .O(\Monostable_6_Count__n0000<13>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<13>_xor  (
    .CI(\Monostable_6_Count__n0000<12>_cyo ),
    .LI(Count_13_rt),
    .O(\Count__n0000<13> )
  );
  MUXCY \Monostable_6_Count__n0000<14>cy  (
    .CI(\Monostable_6_Count__n0000<13>_cyo ),
    .DI(N0),
    .S(Count_14_rt),
    .O(\Monostable_6_Count__n0000<14>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<14>_xor  (
    .CI(\Monostable_6_Count__n0000<13>_cyo ),
    .LI(Count_14_rt),
    .O(\Count__n0000<14> )
  );
  MUXCY \Monostable_6_Count__n0000<15>cy  (
    .CI(\Monostable_6_Count__n0000<14>_cyo ),
    .DI(N0),
    .S(Count_15_rt),
    .O(\Monostable_6_Count__n0000<15>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<15>_xor  (
    .CI(\Monostable_6_Count__n0000<14>_cyo ),
    .LI(Count_15_rt),
    .O(\Count__n0000<15> )
  );
  MUXCY \Monostable_6_Count__n0000<16>cy  (
    .CI(\Monostable_6_Count__n0000<15>_cyo ),
    .DI(N0),
    .S(Count_16_rt),
    .O(\Monostable_6_Count__n0000<16>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<16>_xor  (
    .CI(\Monostable_6_Count__n0000<15>_cyo ),
    .LI(Count_16_rt),
    .O(\Count__n0000<16> )
  );
  MUXCY \Monostable_6_Count__n0000<17>cy  (
    .CI(\Monostable_6_Count__n0000<16>_cyo ),
    .DI(N0),
    .S(Count_17_rt),
    .O(\Monostable_6_Count__n0000<17>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<17>_xor  (
    .CI(\Monostable_6_Count__n0000<16>_cyo ),
    .LI(Count_17_rt),
    .O(\Count__n0000<17> )
  );
  MUXCY \Monostable_6_Count__n0000<18>cy  (
    .CI(\Monostable_6_Count__n0000<17>_cyo ),
    .DI(N0),
    .S(Count_18_rt),
    .O(\Monostable_6_Count__n0000<18>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<18>_xor  (
    .CI(\Monostable_6_Count__n0000<17>_cyo ),
    .LI(Count_18_rt),
    .O(\Count__n0000<18> )
  );
  MUXCY \Monostable_6_Count__n0000<19>cy  (
    .CI(\Monostable_6_Count__n0000<18>_cyo ),
    .DI(N0),
    .S(Count_19_rt),
    .O(\Monostable_6_Count__n0000<19>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<19>_xor  (
    .CI(\Monostable_6_Count__n0000<18>_cyo ),
    .LI(Count_19_rt),
    .O(\Count__n0000<19> )
  );
  MUXCY \Monostable_6_Count__n0000<20>cy  (
    .CI(\Monostable_6_Count__n0000<19>_cyo ),
    .DI(N0),
    .S(Count_20_rt),
    .O(\Monostable_6_Count__n0000<20>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<20>_xor  (
    .CI(\Monostable_6_Count__n0000<19>_cyo ),
    .LI(Count_20_rt),
    .O(\Count__n0000<20> )
  );
  MUXCY \Monostable_6_Count__n0000<21>cy  (
    .CI(\Monostable_6_Count__n0000<20>_cyo ),
    .DI(N0),
    .S(Count_21_rt),
    .O(\Monostable_6_Count__n0000<21>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<21>_xor  (
    .CI(\Monostable_6_Count__n0000<20>_cyo ),
    .LI(Count_21_rt),
    .O(\Count__n0000<21> )
  );
  MUXCY \Monostable_6_Count__n0000<22>cy  (
    .CI(\Monostable_6_Count__n0000<21>_cyo ),
    .DI(N0),
    .S(Count_22_rt),
    .O(\Monostable_6_Count__n0000<22>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<22>_xor  (
    .CI(\Monostable_6_Count__n0000<21>_cyo ),
    .LI(Count_22_rt),
    .O(\Count__n0000<22> )
  );
  MUXCY \Monostable_6_Count__n0000<23>cy  (
    .CI(\Monostable_6_Count__n0000<22>_cyo ),
    .DI(N0),
    .S(Count_23_rt),
    .O(\Monostable_6_Count__n0000<23>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<23>_xor  (
    .CI(\Monostable_6_Count__n0000<22>_cyo ),
    .LI(Count_23_rt),
    .O(\Count__n0000<23> )
  );
  MUXCY \Monostable_6_Count__n0000<24>cy  (
    .CI(\Monostable_6_Count__n0000<23>_cyo ),
    .DI(N0),
    .S(Count_24_rt),
    .O(\Monostable_6_Count__n0000<24>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<24>_xor  (
    .CI(\Monostable_6_Count__n0000<23>_cyo ),
    .LI(Count_24_rt),
    .O(\Count__n0000<24> )
  );
  MUXCY \Monostable_6_Count__n0000<25>cy  (
    .CI(\Monostable_6_Count__n0000<24>_cyo ),
    .DI(N0),
    .S(Count_25_rt),
    .O(\Monostable_6_Count__n0000<25>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<25>_xor  (
    .CI(\Monostable_6_Count__n0000<24>_cyo ),
    .LI(Count_25_rt),
    .O(\Count__n0000<25> )
  );
  MUXCY \Monostable_6_Count__n0000<26>cy  (
    .CI(\Monostable_6_Count__n0000<25>_cyo ),
    .DI(N0),
    .S(Count_26_rt),
    .O(\Monostable_6_Count__n0000<26>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<26>_xor  (
    .CI(\Monostable_6_Count__n0000<25>_cyo ),
    .LI(Count_26_rt),
    .O(\Count__n0000<26> )
  );
  MUXCY \Monostable_6_Count__n0000<27>cy  (
    .CI(\Monostable_6_Count__n0000<26>_cyo ),
    .DI(N0),
    .S(Count_27_rt),
    .O(\Monostable_6_Count__n0000<27>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<27>_xor  (
    .CI(\Monostable_6_Count__n0000<26>_cyo ),
    .LI(Count_27_rt),
    .O(\Count__n0000<27> )
  );
  MUXCY \Monostable_6_Count__n0000<28>cy  (
    .CI(\Monostable_6_Count__n0000<27>_cyo ),
    .DI(N0),
    .S(Count_28_rt),
    .O(\Monostable_6_Count__n0000<28>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<28>_xor  (
    .CI(\Monostable_6_Count__n0000<27>_cyo ),
    .LI(Count_28_rt),
    .O(\Count__n0000<28> )
  );
  MUXCY \Monostable_6_Count__n0000<29>cy  (
    .CI(\Monostable_6_Count__n0000<28>_cyo ),
    .DI(N0),
    .S(Count_29_rt),
    .O(\Monostable_6_Count__n0000<29>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<29>_xor  (
    .CI(\Monostable_6_Count__n0000<28>_cyo ),
    .LI(Count_29_rt),
    .O(\Count__n0000<29> )
  );
  MUXCY \Monostable_6_Count__n0000<30>cy  (
    .CI(\Monostable_6_Count__n0000<29>_cyo ),
    .DI(N0),
    .S(Count_30_rt),
    .O(\Monostable_6_Count__n0000<30>_cyo )
  );
  XORCY \Monostable_6_Count__n0000<30>_xor  (
    .CI(\Monostable_6_Count__n0000<29>_cyo ),
    .LI(Count_30_rt),
    .O(\Count__n0000<30> )
  );
  defparam _n0000532.INIT = 16'hFFFE;
  LUT4 _n0000532 (
    .I0(CHOICE2097),
    .I1(CHOICE2100),
    .I2(CHOICE2104),
    .I3(N7),
    .O(N31)
  );
  defparam _n0000164.INIT = 16'h4000;
  LUT4 _n0000164 (
    .I0(N31),
    .I1(CHOICE2079),
    .I2(CHOICE2084),
    .I3(CHOICE2090),
    .O(_n0000)
  );
  defparam _n0000122.INIT = 16'h1000;
  LUT4 _n0000122 (
    .I0(\Count<31> ),
    .I1(\Count<1> ),
    .I2(\Count<11> ),
    .I3(\Count<21> ),
    .O(CHOICE2084)
  );
  defparam _n0000916.INIT = 16'hEFFF;
  LUT4 _n0000916 (
    .I0(\Count<29> ),
    .I1(\Count<9> ),
    .I2(\Count<8> ),
    .I3(\Count<19> ),
    .O(CHOICE1918)
  );
  defparam _n000097.INIT = 16'hFFEF;
  LUT4 _n000097 (
    .I0(\Count<28> ),
    .I1(\Count<7> ),
    .I2(\Count<18> ),
    .I3(\Count<27> ),
    .O(CHOICE1913)
  );
  defparam _n0000512.INIT = 16'hFFFE;
  LUT4 _n0000512 (
    .I0(\Count<23> ),
    .I1(\Count<3> ),
    .I2(\Count<14> ),
    .I3(\Count<24> ),
    .O(CHOICE2100)
  );
  defparam _n0000134.INIT = 16'h0002;
  LUT4 _n0000134 (
    .I0(\Count<20> ),
    .I1(\Count<10> ),
    .I2(\Count<30> ),
    .I3(\Count<0> ),
    .O(CHOICE2090)
  );
  defparam _n0000917.INIT = 4'hE;
  LUT2 _n0000917 (
    .I0(CHOICE1913),
    .I1(CHOICE1918),
    .O(N7)
  );
  defparam _n0000525.INIT = 16'hFFFE;
  LUT4 _n0000525 (
    .I0(\Count<4> ),
    .I1(\Count<15> ),
    .I2(\Count<25> ),
    .I3(\Count<5> ),
    .O(CHOICE2104)
  );
  defparam Count_1_rt_345.INIT = 4'h2;
  LUT1 Count_1_rt_345 (
    .I0(\Count<1> ),
    .O(Count_1_rt)
  );
  defparam Count_2_rt_346.INIT = 4'h2;
  LUT1 Count_2_rt_346 (
    .I0(\Count<2> ),
    .O(Count_2_rt)
  );
  defparam Count_3_rt_347.INIT = 4'h2;
  LUT1 Count_3_rt_347 (
    .I0(\Count<3> ),
    .O(Count_3_rt)
  );
  defparam Count_4_rt_348.INIT = 4'h2;
  LUT1 Count_4_rt_348 (
    .I0(\Count<4> ),
    .O(Count_4_rt)
  );
  defparam Count_5_rt_349.INIT = 4'h2;
  LUT1 Count_5_rt_349 (
    .I0(\Count<5> ),
    .O(Count_5_rt)
  );
  defparam Count_6_rt_350.INIT = 4'h2;
  LUT1 Count_6_rt_350 (
    .I0(\Count<6> ),
    .O(Count_6_rt)
  );
  defparam Count_7_rt_351.INIT = 4'h2;
  LUT1 Count_7_rt_351 (
    .I0(\Count<7> ),
    .O(Count_7_rt)
  );
  defparam Count_8_rt_352.INIT = 4'h2;
  LUT1 Count_8_rt_352 (
    .I0(\Count<8> ),
    .O(Count_8_rt)
  );
  defparam Count_9_rt_353.INIT = 4'h2;
  LUT1 Count_9_rt_353 (
    .I0(\Count<9> ),
    .O(Count_9_rt)
  );
  defparam Count_10_rt_354.INIT = 4'h2;
  LUT1 Count_10_rt_354 (
    .I0(\Count<10> ),
    .O(Count_10_rt)
  );
  defparam Count_11_rt_355.INIT = 4'h2;
  LUT1 Count_11_rt_355 (
    .I0(\Count<11> ),
    .O(Count_11_rt)
  );
  defparam Count_12_rt_356.INIT = 4'h2;
  LUT1 Count_12_rt_356 (
    .I0(\Count<12> ),
    .O(Count_12_rt)
  );
  defparam Count_13_rt_357.INIT = 4'h2;
  LUT1 Count_13_rt_357 (
    .I0(\Count<13> ),
    .O(Count_13_rt)
  );
  defparam Count_14_rt_358.INIT = 4'h2;
  LUT1 Count_14_rt_358 (
    .I0(\Count<14> ),
    .O(Count_14_rt)
  );
  defparam Count_15_rt_359.INIT = 4'h2;
  LUT1 Count_15_rt_359 (
    .I0(\Count<15> ),
    .O(Count_15_rt)
  );
  defparam Count_16_rt_360.INIT = 4'h2;
  LUT1 Count_16_rt_360 (
    .I0(\Count<16> ),
    .O(Count_16_rt)
  );
  defparam Count_17_rt_361.INIT = 4'h2;
  LUT1 Count_17_rt_361 (
    .I0(\Count<17> ),
    .O(Count_17_rt)
  );
  defparam Count_18_rt_362.INIT = 4'h2;
  LUT1 Count_18_rt_362 (
    .I0(\Count<18> ),
    .O(Count_18_rt)
  );
  defparam Count_19_rt_363.INIT = 4'h2;
  LUT1 Count_19_rt_363 (
    .I0(\Count<19> ),
    .O(Count_19_rt)
  );
  defparam Count_20_rt_364.INIT = 4'h2;
  LUT1 Count_20_rt_364 (
    .I0(\Count<20> ),
    .O(Count_20_rt)
  );
  defparam Count_21_rt_365.INIT = 4'h2;
  LUT1 Count_21_rt_365 (
    .I0(\Count<21> ),
    .O(Count_21_rt)
  );
  defparam Count_22_rt_366.INIT = 4'h2;
  LUT1 Count_22_rt_366 (
    .I0(\Count<22> ),
    .O(Count_22_rt)
  );
  defparam Count_23_rt_367.INIT = 4'h2;
  LUT1 Count_23_rt_367 (
    .I0(\Count<23> ),
    .O(Count_23_rt)
  );
  defparam Count_24_rt_368.INIT = 4'h2;
  LUT1 Count_24_rt_368 (
    .I0(\Count<24> ),
    .O(Count_24_rt)
  );
  defparam Count_25_rt_369.INIT = 4'h2;
  LUT1 Count_25_rt_369 (
    .I0(\Count<25> ),
    .O(Count_25_rt)
  );
  defparam Count_26_rt_370.INIT = 4'h2;
  LUT1 Count_26_rt_370 (
    .I0(\Count<26> ),
    .O(Count_26_rt)
  );
  defparam Count_27_rt_371.INIT = 4'h2;
  LUT1 Count_27_rt_371 (
    .I0(\Count<27> ),
    .O(Count_27_rt)
  );
  defparam Count_28_rt_372.INIT = 4'h2;
  LUT1 Count_28_rt_372 (
    .I0(\Count<28> ),
    .O(Count_28_rt)
  );
  defparam Count_29_rt_373.INIT = 4'h2;
  LUT1 Count_29_rt_373 (
    .I0(\Count<29> ),
    .O(Count_29_rt)
  );
  defparam Count_30_rt_374.INIT = 4'h2;
  LUT1 Count_30_rt_374 (
    .I0(\Count<30> ),
    .O(Count_30_rt)
  );
  defparam Count_31_rt_375.INIT = 4'h2;
  LUT1 Count_31_rt_375 (
    .I0(\Count<31> ),
    .O(Count_31_rt)
  );
endmodule

module Monostable_7 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire N0;
  wire \Count<0> ;
  wire \Count<31> ;
  wire \Count<30> ;
  wire \Count<24> ;
  wire \Count<29> ;
  wire \Count<23> ;
  wire \Count<28> ;
  wire \Count<22> ;
  wire \Count<27> ;
  wire \Count<21> ;
  wire \Count<26> ;
  wire \Count<20> ;
  wire \Count<25> ;
  wire \Count<14> ;
  wire \Count<19> ;
  wire \Count<13> ;
  wire \Count<18> ;
  wire \Count<12> ;
  wire \Count<17> ;
  wire \Count<11> ;
  wire \Count<16> ;
  wire \Count<10> ;
  wire \Count<15> ;
  wire \Count<4> ;
  wire \Count<9> ;
  wire \Count<3> ;
  wire \Count<8> ;
  wire \Count<2> ;
  wire \Count<7> ;
  wire \Count<1> ;
  wire \Count<6> ;
  wire \Count<5> ;
  wire \Count__n0000<2> ;
  wire CHOICE1903;
  wire \Count__n0000<3> ;
  wire \Count__n0000<1> ;
  wire \Count__n0000<4> ;
  wire \Count__n0000<5> ;
  wire \Count__n0000<6> ;
  wire \Count__n0000<7> ;
  wire \Count__n0000<8> ;
  wire \Count__n0000<9> ;
  wire \Count__n0000<10> ;
  wire \Count__n0000<11> ;
  wire \Count__n0000<12> ;
  wire \Count__n0000<13> ;
  wire \Count__n0000<14> ;
  wire \Count__n0000<15> ;
  wire \Count__n0000<16> ;
  wire \Count__n0000<17> ;
  wire \Count__n0000<18> ;
  wire \Count__n0000<19> ;
  wire \Count__n0000<20> ;
  wire \Count__n0000<21> ;
  wire \Count__n0000<22> ;
  wire \Count__n0000<23> ;
  wire \Count__n0000<24> ;
  wire \Count__n0000<25> ;
  wire \Count__n0000<26> ;
  wire \Count__n0000<27> ;
  wire \Count__n0000<28> ;
  wire \Count__n0000<29> ;
  wire \Count__n0000<30> ;
  wire \Count__n0000<31> ;
  wire N1;
  wire \Monostable_7_Count__n0000<30>_cyo ;
  wire N3;
  wire \Monostable_7_Count__n0000<0>_cyo ;
  wire \Monostable_7_Count__n0000<1>_cyo ;
  wire \Monostable_7_Count__n0000<2>_cyo ;
  wire \Monostable_7_Count__n0000<3>_cyo ;
  wire \Monostable_7_Count__n0000<4>_cyo ;
  wire \Monostable_7_Count__n0000<5>_cyo ;
  wire \Monostable_7_Count__n0000<6>_cyo ;
  wire \Monostable_7_Count__n0000<7>_cyo ;
  wire \Monostable_7_Count__n0000<8>_cyo ;
  wire \Monostable_7_Count__n0000<9>_cyo ;
  wire \Monostable_7_Count__n0000<10>_cyo ;
  wire \Monostable_7_Count__n0000<11>_cyo ;
  wire \Monostable_7_Count__n0000<12>_cyo ;
  wire \Monostable_7_Count__n0000<13>_cyo ;
  wire \Monostable_7_Count__n0000<14>_cyo ;
  wire \Monostable_7_Count__n0000<15>_cyo ;
  wire \Monostable_7_Count__n0000<16>_cyo ;
  wire \Monostable_7_Count__n0000<17>_cyo ;
  wire \Monostable_7_Count__n0000<18>_cyo ;
  wire \Monostable_7_Count__n0000<19>_cyo ;
  wire \Monostable_7_Count__n0000<20>_cyo ;
  wire \Monostable_7_Count__n0000<21>_cyo ;
  wire \Monostable_7_Count__n0000<22>_cyo ;
  wire \Monostable_7_Count__n0000<23>_cyo ;
  wire \Monostable_7_Count__n0000<24>_cyo ;
  wire \Monostable_7_Count__n0000<25>_cyo ;
  wire \Monostable_7_Count__n0000<26>_cyo ;
  wire \Monostable_7_Count__n0000<27>_cyo ;
  wire \Monostable_7_Count__n0000<28>_cyo ;
  wire \Monostable_7_Count__n0000<29>_cyo ;
  wire N7;
  wire N31;
  wire CHOICE2049;
  wire CHOICE2043;
  wire CHOICE2065;
  wire CHOICE2069;
  wire CHOICE2062;
  wire CHOICE2055;
  wire CHOICE1908;
  wire Count_1_rt;
  wire Count_2_rt;
  wire Count_3_rt;
  wire Count_4_rt;
  wire Count_5_rt;
  wire Count_6_rt;
  wire Count_7_rt;
  wire Count_8_rt;
  wire Count_9_rt;
  wire Count_10_rt;
  wire Count_11_rt;
  wire Count_12_rt;
  wire Count_13_rt;
  wire Count_14_rt;
  wire Count_15_rt;
  wire Count_16_rt;
  wire Count_17_rt;
  wire Count_18_rt;
  wire Count_19_rt;
  wire Count_20_rt;
  wire Count_21_rt;
  wire Count_22_rt;
  wire Count_23_rt;
  wire Count_24_rt;
  wire Count_25_rt;
  wire Count_26_rt;
  wire Count_27_rt;
  wire Count_28_rt;
  wire Count_29_rt;
  wire Count_30_rt;
  wire Count_31_rt;
  GND XST_GND (
    .G(N0)
  );
  defparam _n0000919.INIT = 4'hE;
  LUT2 _n0000919 (
    .I0(CHOICE1903),
    .I1(CHOICE1908),
    .O(N7)
  );
  FDR Count_30 (
    .D(\Count__n0000<30> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<30> )
  );
  FDSE Out_376 (
    .D(N0),
    .S(In),
    .CE(_n0000),
    .C(Dclk),
    .Q(Out)
  );
  FDR Count_31 (
    .D(\Count__n0000<31> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<31> )
  );
  XORCY \Monostable_7_Count__n0000<31>_xor  (
    .CI(\Monostable_7_Count__n0000<30>_cyo ),
    .LI(Count_31_rt),
    .O(\Count__n0000<31> )
  );
  FDR Count_0 (
    .D(N3),
    .R(In),
    .C(Dclk),
    .Q(\Count<0> )
  );
  FDR Count_1 (
    .D(\Count__n0000<1> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<1> )
  );
  FDR Count_2 (
    .D(\Count__n0000<2> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<2> )
  );
  FDR Count_3 (
    .D(\Count__n0000<3> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<3> )
  );
  FDR Count_4 (
    .D(\Count__n0000<4> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<4> )
  );
  FDR Count_5 (
    .D(\Count__n0000<5> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<5> )
  );
  FDR Count_6 (
    .D(\Count__n0000<6> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<6> )
  );
  FDR Count_7 (
    .D(\Count__n0000<7> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<7> )
  );
  FDR Count_8 (
    .D(\Count__n0000<8> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<8> )
  );
  FDR Count_9 (
    .D(\Count__n0000<9> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<9> )
  );
  FDR Count_10 (
    .D(\Count__n0000<10> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<10> )
  );
  FDR Count_11 (
    .D(\Count__n0000<11> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<11> )
  );
  FDR Count_12 (
    .D(\Count__n0000<12> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<12> )
  );
  FDR Count_13 (
    .D(\Count__n0000<13> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<13> )
  );
  FDR Count_14 (
    .D(\Count__n0000<14> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<14> )
  );
  FDR Count_15 (
    .D(\Count__n0000<15> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<15> )
  );
  FDR Count_16 (
    .D(\Count__n0000<16> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<16> )
  );
  FDR Count_17 (
    .D(\Count__n0000<17> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<17> )
  );
  FDR Count_18 (
    .D(\Count__n0000<18> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<18> )
  );
  FDR Count_19 (
    .D(\Count__n0000<19> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<19> )
  );
  FDR Count_20 (
    .D(\Count__n0000<20> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<20> )
  );
  FDR Count_21 (
    .D(\Count__n0000<21> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<21> )
  );
  FDR Count_22 (
    .D(\Count__n0000<22> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<22> )
  );
  FDR Count_23 (
    .D(\Count__n0000<23> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<23> )
  );
  FDR Count_24 (
    .D(\Count__n0000<24> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<24> )
  );
  FDR Count_25 (
    .D(\Count__n0000<25> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<25> )
  );
  FDR Count_26 (
    .D(\Count__n0000<26> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<26> )
  );
  FDR Count_27 (
    .D(\Count__n0000<27> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<27> )
  );
  FDR Count_28 (
    .D(\Count__n0000<28> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<28> )
  );
  FDR Count_29 (
    .D(\Count__n0000<29> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<29> )
  );
  VCC XST_VCC (
    .P(N1)
  );
  defparam \Monostable_7_Count__n0000<0>lut .INIT = 4'h1;
  LUT1 \Monostable_7_Count__n0000<0>lut  (
    .I0(\Count<0> ),
    .O(N3)
  );
  MUXCY \Monostable_7_Count__n0000<0>cy  (
    .CI(N0),
    .DI(N1),
    .S(N3),
    .O(\Monostable_7_Count__n0000<0>_cyo )
  );
  defparam _n000057.INIT = 16'hFFEF;
  LUT4 _n000057 (
    .I0(\Count<6> ),
    .I1(\Count<26> ),
    .I2(\Count<17> ),
    .I3(\Count<16> ),
    .O(CHOICE2062)
  );
  MUXCY \Monostable_7_Count__n0000<1>cy  (
    .CI(\Monostable_7_Count__n0000<0>_cyo ),
    .DI(N0),
    .S(Count_1_rt),
    .O(\Monostable_7_Count__n0000<1>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<1>_xor  (
    .CI(\Monostable_7_Count__n0000<0>_cyo ),
    .LI(Count_1_rt),
    .O(\Count__n0000<1> )
  );
  MUXCY \Monostable_7_Count__n0000<2>cy  (
    .CI(\Monostable_7_Count__n0000<1>_cyo ),
    .DI(N0),
    .S(Count_2_rt),
    .O(\Monostable_7_Count__n0000<2>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<2>_xor  (
    .CI(\Monostable_7_Count__n0000<1>_cyo ),
    .LI(Count_2_rt),
    .O(\Count__n0000<2> )
  );
  MUXCY \Monostable_7_Count__n0000<3>cy  (
    .CI(\Monostable_7_Count__n0000<2>_cyo ),
    .DI(N0),
    .S(Count_3_rt),
    .O(\Monostable_7_Count__n0000<3>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<3>_xor  (
    .CI(\Monostable_7_Count__n0000<2>_cyo ),
    .LI(Count_3_rt),
    .O(\Count__n0000<3> )
  );
  MUXCY \Monostable_7_Count__n0000<4>cy  (
    .CI(\Monostable_7_Count__n0000<3>_cyo ),
    .DI(N0),
    .S(Count_4_rt),
    .O(\Monostable_7_Count__n0000<4>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<4>_xor  (
    .CI(\Monostable_7_Count__n0000<3>_cyo ),
    .LI(Count_4_rt),
    .O(\Count__n0000<4> )
  );
  MUXCY \Monostable_7_Count__n0000<5>cy  (
    .CI(\Monostable_7_Count__n0000<4>_cyo ),
    .DI(N0),
    .S(Count_5_rt),
    .O(\Monostable_7_Count__n0000<5>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<5>_xor  (
    .CI(\Monostable_7_Count__n0000<4>_cyo ),
    .LI(Count_5_rt),
    .O(\Count__n0000<5> )
  );
  MUXCY \Monostable_7_Count__n0000<6>cy  (
    .CI(\Monostable_7_Count__n0000<5>_cyo ),
    .DI(N0),
    .S(Count_6_rt),
    .O(\Monostable_7_Count__n0000<6>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<6>_xor  (
    .CI(\Monostable_7_Count__n0000<5>_cyo ),
    .LI(Count_6_rt),
    .O(\Count__n0000<6> )
  );
  MUXCY \Monostable_7_Count__n0000<7>cy  (
    .CI(\Monostable_7_Count__n0000<6>_cyo ),
    .DI(N0),
    .S(Count_7_rt),
    .O(\Monostable_7_Count__n0000<7>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<7>_xor  (
    .CI(\Monostable_7_Count__n0000<6>_cyo ),
    .LI(Count_7_rt),
    .O(\Count__n0000<7> )
  );
  MUXCY \Monostable_7_Count__n0000<8>cy  (
    .CI(\Monostable_7_Count__n0000<7>_cyo ),
    .DI(N0),
    .S(Count_8_rt),
    .O(\Monostable_7_Count__n0000<8>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<8>_xor  (
    .CI(\Monostable_7_Count__n0000<7>_cyo ),
    .LI(Count_8_rt),
    .O(\Count__n0000<8> )
  );
  MUXCY \Monostable_7_Count__n0000<9>cy  (
    .CI(\Monostable_7_Count__n0000<8>_cyo ),
    .DI(N0),
    .S(Count_9_rt),
    .O(\Monostable_7_Count__n0000<9>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<9>_xor  (
    .CI(\Monostable_7_Count__n0000<8>_cyo ),
    .LI(Count_9_rt),
    .O(\Count__n0000<9> )
  );
  MUXCY \Monostable_7_Count__n0000<10>cy  (
    .CI(\Monostable_7_Count__n0000<9>_cyo ),
    .DI(N0),
    .S(Count_10_rt),
    .O(\Monostable_7_Count__n0000<10>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<10>_xor  (
    .CI(\Monostable_7_Count__n0000<9>_cyo ),
    .LI(Count_10_rt),
    .O(\Count__n0000<10> )
  );
  MUXCY \Monostable_7_Count__n0000<11>cy  (
    .CI(\Monostable_7_Count__n0000<10>_cyo ),
    .DI(N0),
    .S(Count_11_rt),
    .O(\Monostable_7_Count__n0000<11>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<11>_xor  (
    .CI(\Monostable_7_Count__n0000<10>_cyo ),
    .LI(Count_11_rt),
    .O(\Count__n0000<11> )
  );
  MUXCY \Monostable_7_Count__n0000<12>cy  (
    .CI(\Monostable_7_Count__n0000<11>_cyo ),
    .DI(N0),
    .S(Count_12_rt),
    .O(\Monostable_7_Count__n0000<12>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<12>_xor  (
    .CI(\Monostable_7_Count__n0000<11>_cyo ),
    .LI(Count_12_rt),
    .O(\Count__n0000<12> )
  );
  MUXCY \Monostable_7_Count__n0000<13>cy  (
    .CI(\Monostable_7_Count__n0000<12>_cyo ),
    .DI(N0),
    .S(Count_13_rt),
    .O(\Monostable_7_Count__n0000<13>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<13>_xor  (
    .CI(\Monostable_7_Count__n0000<12>_cyo ),
    .LI(Count_13_rt),
    .O(\Count__n0000<13> )
  );
  MUXCY \Monostable_7_Count__n0000<14>cy  (
    .CI(\Monostable_7_Count__n0000<13>_cyo ),
    .DI(N0),
    .S(Count_14_rt),
    .O(\Monostable_7_Count__n0000<14>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<14>_xor  (
    .CI(\Monostable_7_Count__n0000<13>_cyo ),
    .LI(Count_14_rt),
    .O(\Count__n0000<14> )
  );
  MUXCY \Monostable_7_Count__n0000<15>cy  (
    .CI(\Monostable_7_Count__n0000<14>_cyo ),
    .DI(N0),
    .S(Count_15_rt),
    .O(\Monostable_7_Count__n0000<15>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<15>_xor  (
    .CI(\Monostable_7_Count__n0000<14>_cyo ),
    .LI(Count_15_rt),
    .O(\Count__n0000<15> )
  );
  MUXCY \Monostable_7_Count__n0000<16>cy  (
    .CI(\Monostable_7_Count__n0000<15>_cyo ),
    .DI(N0),
    .S(Count_16_rt),
    .O(\Monostable_7_Count__n0000<16>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<16>_xor  (
    .CI(\Monostable_7_Count__n0000<15>_cyo ),
    .LI(Count_16_rt),
    .O(\Count__n0000<16> )
  );
  MUXCY \Monostable_7_Count__n0000<17>cy  (
    .CI(\Monostable_7_Count__n0000<16>_cyo ),
    .DI(N0),
    .S(Count_17_rt),
    .O(\Monostable_7_Count__n0000<17>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<17>_xor  (
    .CI(\Monostable_7_Count__n0000<16>_cyo ),
    .LI(Count_17_rt),
    .O(\Count__n0000<17> )
  );
  MUXCY \Monostable_7_Count__n0000<18>cy  (
    .CI(\Monostable_7_Count__n0000<17>_cyo ),
    .DI(N0),
    .S(Count_18_rt),
    .O(\Monostable_7_Count__n0000<18>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<18>_xor  (
    .CI(\Monostable_7_Count__n0000<17>_cyo ),
    .LI(Count_18_rt),
    .O(\Count__n0000<18> )
  );
  MUXCY \Monostable_7_Count__n0000<19>cy  (
    .CI(\Monostable_7_Count__n0000<18>_cyo ),
    .DI(N0),
    .S(Count_19_rt),
    .O(\Monostable_7_Count__n0000<19>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<19>_xor  (
    .CI(\Monostable_7_Count__n0000<18>_cyo ),
    .LI(Count_19_rt),
    .O(\Count__n0000<19> )
  );
  MUXCY \Monostable_7_Count__n0000<20>cy  (
    .CI(\Monostable_7_Count__n0000<19>_cyo ),
    .DI(N0),
    .S(Count_20_rt),
    .O(\Monostable_7_Count__n0000<20>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<20>_xor  (
    .CI(\Monostable_7_Count__n0000<19>_cyo ),
    .LI(Count_20_rt),
    .O(\Count__n0000<20> )
  );
  MUXCY \Monostable_7_Count__n0000<21>cy  (
    .CI(\Monostable_7_Count__n0000<20>_cyo ),
    .DI(N0),
    .S(Count_21_rt),
    .O(\Monostable_7_Count__n0000<21>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<21>_xor  (
    .CI(\Monostable_7_Count__n0000<20>_cyo ),
    .LI(Count_21_rt),
    .O(\Count__n0000<21> )
  );
  MUXCY \Monostable_7_Count__n0000<22>cy  (
    .CI(\Monostable_7_Count__n0000<21>_cyo ),
    .DI(N0),
    .S(Count_22_rt),
    .O(\Monostable_7_Count__n0000<22>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<22>_xor  (
    .CI(\Monostable_7_Count__n0000<21>_cyo ),
    .LI(Count_22_rt),
    .O(\Count__n0000<22> )
  );
  MUXCY \Monostable_7_Count__n0000<23>cy  (
    .CI(\Monostable_7_Count__n0000<22>_cyo ),
    .DI(N0),
    .S(Count_23_rt),
    .O(\Monostable_7_Count__n0000<23>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<23>_xor  (
    .CI(\Monostable_7_Count__n0000<22>_cyo ),
    .LI(Count_23_rt),
    .O(\Count__n0000<23> )
  );
  MUXCY \Monostable_7_Count__n0000<24>cy  (
    .CI(\Monostable_7_Count__n0000<23>_cyo ),
    .DI(N0),
    .S(Count_24_rt),
    .O(\Monostable_7_Count__n0000<24>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<24>_xor  (
    .CI(\Monostable_7_Count__n0000<23>_cyo ),
    .LI(Count_24_rt),
    .O(\Count__n0000<24> )
  );
  MUXCY \Monostable_7_Count__n0000<25>cy  (
    .CI(\Monostable_7_Count__n0000<24>_cyo ),
    .DI(N0),
    .S(Count_25_rt),
    .O(\Monostable_7_Count__n0000<25>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<25>_xor  (
    .CI(\Monostable_7_Count__n0000<24>_cyo ),
    .LI(Count_25_rt),
    .O(\Count__n0000<25> )
  );
  MUXCY \Monostable_7_Count__n0000<26>cy  (
    .CI(\Monostable_7_Count__n0000<25>_cyo ),
    .DI(N0),
    .S(Count_26_rt),
    .O(\Monostable_7_Count__n0000<26>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<26>_xor  (
    .CI(\Monostable_7_Count__n0000<25>_cyo ),
    .LI(Count_26_rt),
    .O(\Count__n0000<26> )
  );
  MUXCY \Monostable_7_Count__n0000<27>cy  (
    .CI(\Monostable_7_Count__n0000<26>_cyo ),
    .DI(N0),
    .S(Count_27_rt),
    .O(\Monostable_7_Count__n0000<27>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<27>_xor  (
    .CI(\Monostable_7_Count__n0000<26>_cyo ),
    .LI(Count_27_rt),
    .O(\Count__n0000<27> )
  );
  MUXCY \Monostable_7_Count__n0000<28>cy  (
    .CI(\Monostable_7_Count__n0000<27>_cyo ),
    .DI(N0),
    .S(Count_28_rt),
    .O(\Monostable_7_Count__n0000<28>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<28>_xor  (
    .CI(\Monostable_7_Count__n0000<27>_cyo ),
    .LI(Count_28_rt),
    .O(\Count__n0000<28> )
  );
  MUXCY \Monostable_7_Count__n0000<29>cy  (
    .CI(\Monostable_7_Count__n0000<28>_cyo ),
    .DI(N0),
    .S(Count_29_rt),
    .O(\Monostable_7_Count__n0000<29>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<29>_xor  (
    .CI(\Monostable_7_Count__n0000<28>_cyo ),
    .LI(Count_29_rt),
    .O(\Count__n0000<29> )
  );
  MUXCY \Monostable_7_Count__n0000<30>cy  (
    .CI(\Monostable_7_Count__n0000<29>_cyo ),
    .DI(N0),
    .S(Count_30_rt),
    .O(\Monostable_7_Count__n0000<30>_cyo )
  );
  XORCY \Monostable_7_Count__n0000<30>_xor  (
    .CI(\Monostable_7_Count__n0000<29>_cyo ),
    .LI(Count_30_rt),
    .O(\Count__n0000<30> )
  );
  defparam _n0000532.INIT = 16'hFFFE;
  LUT4 _n0000532 (
    .I0(CHOICE2062),
    .I1(CHOICE2065),
    .I2(CHOICE2069),
    .I3(N7),
    .O(N31)
  );
  defparam _n0000169.INIT = 16'h4000;
  LUT4 _n0000169 (
    .I0(N31),
    .I1(CHOICE2043),
    .I2(CHOICE2049),
    .I3(CHOICE2055),
    .O(_n0000)
  );
  defparam _n0000125.INIT = 16'h0002;
  LUT4 _n0000125 (
    .I0(\Count<12> ),
    .I1(\Count<22> ),
    .I2(\Count<2> ),
    .I3(\Count<13> ),
    .O(CHOICE2049)
  );
  defparam _n0000113.INIT = 16'h0001;
  LUT4 _n0000113 (
    .I0(\Count<10> ),
    .I1(\Count<20> ),
    .I2(\Count<30> ),
    .I3(\Count<0> ),
    .O(CHOICE2043)
  );
  defparam _n000097.INIT = 16'hFFEF;
  LUT4 _n000097 (
    .I0(\Count<29> ),
    .I1(\Count<19> ),
    .I2(\Count<9> ),
    .I3(\Count<8> ),
    .O(CHOICE1903)
  );
  defparam _n0000512.INIT = 16'hFFFE;
  LUT4 _n0000512 (
    .I0(\Count<23> ),
    .I1(\Count<3> ),
    .I2(\Count<14> ),
    .I3(\Count<24> ),
    .O(CHOICE2065)
  );
  defparam _n0000137.INIT = 16'h0002;
  LUT4 _n0000137 (
    .I0(\Count<11> ),
    .I1(\Count<21> ),
    .I2(\Count<31> ),
    .I3(\Count<1> ),
    .O(CHOICE2055)
  );
  defparam _n0000918.INIT = 16'hEFFF;
  LUT4 _n0000918 (
    .I0(\Count<28> ),
    .I1(\Count<27> ),
    .I2(\Count<7> ),
    .I3(\Count<18> ),
    .O(CHOICE1908)
  );
  defparam _n0000525.INIT = 16'hFFFE;
  LUT4 _n0000525 (
    .I0(\Count<4> ),
    .I1(\Count<15> ),
    .I2(\Count<25> ),
    .I3(\Count<5> ),
    .O(CHOICE2069)
  );
  defparam Count_1_rt_377.INIT = 4'h2;
  LUT1 Count_1_rt_377 (
    .I0(\Count<1> ),
    .O(Count_1_rt)
  );
  defparam Count_2_rt_378.INIT = 4'h2;
  LUT1 Count_2_rt_378 (
    .I0(\Count<2> ),
    .O(Count_2_rt)
  );
  defparam Count_3_rt_379.INIT = 4'h2;
  LUT1 Count_3_rt_379 (
    .I0(\Count<3> ),
    .O(Count_3_rt)
  );
  defparam Count_4_rt_380.INIT = 4'h2;
  LUT1 Count_4_rt_380 (
    .I0(\Count<4> ),
    .O(Count_4_rt)
  );
  defparam Count_5_rt_381.INIT = 4'h2;
  LUT1 Count_5_rt_381 (
    .I0(\Count<5> ),
    .O(Count_5_rt)
  );
  defparam Count_6_rt_382.INIT = 4'h2;
  LUT1 Count_6_rt_382 (
    .I0(\Count<6> ),
    .O(Count_6_rt)
  );
  defparam Count_7_rt_383.INIT = 4'h2;
  LUT1 Count_7_rt_383 (
    .I0(\Count<7> ),
    .O(Count_7_rt)
  );
  defparam Count_8_rt_384.INIT = 4'h2;
  LUT1 Count_8_rt_384 (
    .I0(\Count<8> ),
    .O(Count_8_rt)
  );
  defparam Count_9_rt_385.INIT = 4'h2;
  LUT1 Count_9_rt_385 (
    .I0(\Count<9> ),
    .O(Count_9_rt)
  );
  defparam Count_10_rt_386.INIT = 4'h2;
  LUT1 Count_10_rt_386 (
    .I0(\Count<10> ),
    .O(Count_10_rt)
  );
  defparam Count_11_rt_387.INIT = 4'h2;
  LUT1 Count_11_rt_387 (
    .I0(\Count<11> ),
    .O(Count_11_rt)
  );
  defparam Count_12_rt_388.INIT = 4'h2;
  LUT1 Count_12_rt_388 (
    .I0(\Count<12> ),
    .O(Count_12_rt)
  );
  defparam Count_13_rt_389.INIT = 4'h2;
  LUT1 Count_13_rt_389 (
    .I0(\Count<13> ),
    .O(Count_13_rt)
  );
  defparam Count_14_rt_390.INIT = 4'h2;
  LUT1 Count_14_rt_390 (
    .I0(\Count<14> ),
    .O(Count_14_rt)
  );
  defparam Count_15_rt_391.INIT = 4'h2;
  LUT1 Count_15_rt_391 (
    .I0(\Count<15> ),
    .O(Count_15_rt)
  );
  defparam Count_16_rt_392.INIT = 4'h2;
  LUT1 Count_16_rt_392 (
    .I0(\Count<16> ),
    .O(Count_16_rt)
  );
  defparam Count_17_rt_393.INIT = 4'h2;
  LUT1 Count_17_rt_393 (
    .I0(\Count<17> ),
    .O(Count_17_rt)
  );
  defparam Count_18_rt_394.INIT = 4'h2;
  LUT1 Count_18_rt_394 (
    .I0(\Count<18> ),
    .O(Count_18_rt)
  );
  defparam Count_19_rt_395.INIT = 4'h2;
  LUT1 Count_19_rt_395 (
    .I0(\Count<19> ),
    .O(Count_19_rt)
  );
  defparam Count_20_rt_396.INIT = 4'h2;
  LUT1 Count_20_rt_396 (
    .I0(\Count<20> ),
    .O(Count_20_rt)
  );
  defparam Count_21_rt_397.INIT = 4'h2;
  LUT1 Count_21_rt_397 (
    .I0(\Count<21> ),
    .O(Count_21_rt)
  );
  defparam Count_22_rt_398.INIT = 4'h2;
  LUT1 Count_22_rt_398 (
    .I0(\Count<22> ),
    .O(Count_22_rt)
  );
  defparam Count_23_rt_399.INIT = 4'h2;
  LUT1 Count_23_rt_399 (
    .I0(\Count<23> ),
    .O(Count_23_rt)
  );
  defparam Count_24_rt_400.INIT = 4'h2;
  LUT1 Count_24_rt_400 (
    .I0(\Count<24> ),
    .O(Count_24_rt)
  );
  defparam Count_25_rt_401.INIT = 4'h2;
  LUT1 Count_25_rt_401 (
    .I0(\Count<25> ),
    .O(Count_25_rt)
  );
  defparam Count_26_rt_402.INIT = 4'h2;
  LUT1 Count_26_rt_402 (
    .I0(\Count<26> ),
    .O(Count_26_rt)
  );
  defparam Count_27_rt_403.INIT = 4'h2;
  LUT1 Count_27_rt_403 (
    .I0(\Count<27> ),
    .O(Count_27_rt)
  );
  defparam Count_28_rt_404.INIT = 4'h2;
  LUT1 Count_28_rt_404 (
    .I0(\Count<28> ),
    .O(Count_28_rt)
  );
  defparam Count_29_rt_405.INIT = 4'h2;
  LUT1 Count_29_rt_405 (
    .I0(\Count<29> ),
    .O(Count_29_rt)
  );
  defparam Count_30_rt_406.INIT = 4'h2;
  LUT1 Count_30_rt_406 (
    .I0(\Count<30> ),
    .O(Count_30_rt)
  );
  defparam Count_31_rt_407.INIT = 4'h2;
  LUT1 Count_31_rt_407 (
    .I0(\Count<31> ),
    .O(Count_31_rt)
  );
endmodule

module Oscillator_3 (
  Dclk, Enable, Out
);
  input Dclk;
  input Enable;
  output Out;
  wire NlwRenamedSig_OI_Out;
  wire Count_30_rt;
  wire _n0000;
  wire Count_20_rt;
  wire _n0003;
  wire \Count<2> ;
  wire Count_2_rt;
  wire \Count<1> ;
  wire Count_19_rt;
  wire \Count<0> ;
  wire N208;
  wire Count_15_rt;
  wire \_old_Count_117<25> ;
  wire Count_28_rt;
  wire Count_14_rt;
  wire Count_17_rt;
  wire Count_22_rt;
  wire Count_16_rt;
  wire Count_3_rt;
  wire Count_8_rt;
  wire Count_29_rt;
  wire Count_18_rt;
  wire Count_7_rt;
  wire Count_12_rt;
  wire Count_6_rt;
  wire Count_24_rt;
  wire Count_5_rt;
  wire Count_11_rt;
  wire Count_26_rt;
  wire Count_25_rt;
  wire Count_27_rt;
  wire Count_23_rt;
  wire Count_9_rt;
  wire Count_13_rt;
  wire Count_10_rt;
  wire Count_4_rt;
  wire Count_31_rt;
  wire Count_21_rt;
  wire \_n0002<31> ;
  wire \_n0002<30> ;
  wire \_n0002<29> ;
  wire \_n0002<28> ;
  wire \_n0002<27> ;
  wire \_n0002<26> ;
  wire \_n0002<25> ;
  wire \_n0002<24> ;
  wire \_n0002<23> ;
  wire \_n0002<22> ;
  wire \_n0002<21> ;
  wire \_n0002<20> ;
  wire \_n0002<19> ;
  wire \_n0002<18> ;
  wire \_n0002<17> ;
  wire \_n0002<16> ;
  wire \_n0002<15> ;
  wire \_n0002<14> ;
  wire \_n0002<13> ;
  wire \_n0002<12> ;
  wire \_n0002<11> ;
  wire \_n0002<10> ;
  wire \_n0002<9> ;
  wire \_n0002<8> ;
  wire \_n0002<7> ;
  wire \_n0002<6> ;
  wire \_n0002<5> ;
  wire \_n0002<4> ;
  wire \_n0002<3> ;
  wire \_n0002<2> ;
  wire \_n0002<1> ;
  wire CHOICE2629;
  wire \Count<31> ;
  wire \Count<30> ;
  wire \Count<29> ;
  wire \Count<28> ;
  wire \Count<27> ;
  wire \Count<26> ;
  wire \Count<25> ;
  wire \Count<24> ;
  wire \Count<23> ;
  wire \Count<22> ;
  wire \Count<21> ;
  wire \Count<20> ;
  wire \Count<19> ;
  wire \Count<18> ;
  wire \Count<17> ;
  wire \Count<16> ;
  wire \Count<15> ;
  wire \Count<14> ;
  wire \Count<13> ;
  wire \Count<12> ;
  wire \Count<11> ;
  wire \Count<10> ;
  wire \Count<9> ;
  wire \Count<8> ;
  wire \Count<7> ;
  wire \Count<6> ;
  wire \Count<5> ;
  wire \Count<4> ;
  wire \Count<3> ;
  wire N0;
  wire N1;
  wire \Oscillator_3__n0002<30>_cyo ;
  wire N3;
  wire \Oscillator_3__n0002<0>_cyo ;
  wire \Oscillator_3__n0002<1>_cyo ;
  wire \Oscillator_3__n0002<2>_cyo ;
  wire \Oscillator_3__n0002<3>_cyo ;
  wire \Oscillator_3__n0002<4>_cyo ;
  wire \Oscillator_3__n0002<5>_cyo ;
  wire \Oscillator_3__n0002<6>_cyo ;
  wire \Oscillator_3__n0002<7>_cyo ;
  wire \Oscillator_3__n0002<8>_cyo ;
  wire \Oscillator_3__n0002<9>_cyo ;
  wire \Oscillator_3__n0002<10>_cyo ;
  wire \Oscillator_3__n0002<11>_cyo ;
  wire \Oscillator_3__n0002<12>_cyo ;
  wire \Oscillator_3__n0002<13>_cyo ;
  wire \Oscillator_3__n0002<14>_cyo ;
  wire \Oscillator_3__n0002<15>_cyo ;
  wire \Oscillator_3__n0002<16>_cyo ;
  wire \Oscillator_3__n0002<17>_cyo ;
  wire \Oscillator_3__n0002<18>_cyo ;
  wire \Oscillator_3__n0002<19>_cyo ;
  wire \Oscillator_3__n0002<20>_cyo ;
  wire \Oscillator_3__n0002<21>_cyo ;
  wire \Oscillator_3__n0002<22>_cyo ;
  wire \Oscillator_3__n0002<23>_cyo ;
  wire \Oscillator_3__n0002<24>_cyo ;
  wire \Oscillator_3__n0002<25>_cyo ;
  wire \Oscillator_3__n0002<26>_cyo ;
  wire \Oscillator_3__n0002<27>_cyo ;
  wire \Oscillator_3__n0002<28>_cyo ;
  wire \Oscillator_3__n0002<29>_cyo ;
  wire CHOICE2623;
  wire CHOICE2599;
  wire CHOICE2620;
  wire CHOICE2607;
  wire CHOICE2639;
  wire CHOICE2589;
  wire CHOICE2610;
  wire CHOICE2592;
  wire Count_1_rt;
  wire CHOICE2632;
  wire N210;
  wire N211;
  wire N212;
  wire N213;
  wire N214;
  wire N215;
  wire N216;
  wire N217;
  wire N218;
  wire N219;
  wire N220;
  wire N221;
  wire N222;
  wire N223;
  wire N224;
  wire N225;
  wire N226;
  wire N227;
  assign
    Out = NlwRenamedSig_OI_Out;
  defparam _n00031.INIT = 4'h1;
  LUT1 _n00031 (
    .I0(NlwRenamedSig_OI_Out),
    .O(_n0003)
  );
  defparam _n0000226.INIT = 16'h8000;
  LUT4 _n0000226 (
    .I0(CHOICE2610),
    .I1(CHOICE2623),
    .I2(CHOICE2632),
    .I3(CHOICE2639),
    .O(_n0000)
  );
  defparam Count_20_rt_408.INIT = 4'h2;
  LUT1 Count_20_rt_408 (
    .I0(\Count<20> ),
    .O(Count_20_rt)
  );
  defparam Count_21_rt_409.INIT = 4'h2;
  LUT1 Count_21_rt_409 (
    .I0(\Count<21> ),
    .O(Count_21_rt)
  );
  FDRE Count_31 (
    .D(\_n0002<31> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<31> )
  );
  FDE Out_410 (
    .D(_n0003),
    .CE(_n0000),
    .C(Dclk),
    .Q(NlwRenamedSig_OI_Out)
  );
  XORCY \Oscillator_3__n0002<31>_xor  (
    .CI(\Oscillator_3__n0002<30>_cyo ),
    .LI(Count_31_rt),
    .O(\_n0002<31> )
  );
  defparam Count_15_rt_411.INIT = 4'h2;
  LUT1 Count_15_rt_411 (
    .I0(\Count<15> ),
    .O(Count_15_rt)
  );
  defparam Count_28_rt_412.INIT = 4'h2;
  LUT1 Count_28_rt_412 (
    .I0(\Count<28> ),
    .O(Count_28_rt)
  );
  defparam Count_17_rt_413.INIT = 4'h2;
  LUT1 Count_17_rt_413 (
    .I0(\Count<17> ),
    .O(Count_17_rt)
  );
  defparam _n000011_G.INIT = 16'h1000;
  LUT4 _n000011_G (
    .I0(\_n0002<9> ),
    .I1(\_n0002<17> ),
    .I2(\_n0002<3> ),
    .I3(\_n0002<2> ),
    .O(N211)
  );
  defparam Count_19_rt_414.INIT = 4'h2;
  LUT1 Count_19_rt_414 (
    .I0(\Count<19> ),
    .O(Count_19_rt)
  );
  defparam _n0000108_SW0.INIT = 4'h1;
  LUT2 _n0000108_SW0 (
    .I0(\Count<26> ),
    .I1(\Count<27> ),
    .O(N208)
  );
  defparam \_old_Count_117<25>1 .INIT = 8'hE4;
  LUT3 \_old_Count_117<25>1  (
    .I0(Enable),
    .I1(\Count<25> ),
    .I2(\_n0002<25> ),
    .O(\_old_Count_117<25> )
  );
  defparam _n000023_G.INIT = 8'h10;
  LUT3 _n000023_G (
    .I0(\_n0002<23> ),
    .I1(\_n0002<31> ),
    .I2(CHOICE2589),
    .O(N213)
  );
  defparam _n0000168_G.INIT = 8'h10;
  LUT3 _n0000168_G (
    .I0(\_n0002<21> ),
    .I1(\_n0002<29> ),
    .I2(CHOICE2629),
    .O(N215)
  );
  defparam _n000061_G.INIT = 16'h0001;
  LUT4 _n000061_G (
    .I0(\_n0002<12> ),
    .I1(\_n0002<5> ),
    .I2(\_n0002<4> ),
    .I3(\_n0002<19> ),
    .O(N217)
  );
  defparam Count_18_rt_415.INIT = 4'h2;
  LUT1 Count_18_rt_415 (
    .I0(\Count<18> ),
    .O(Count_18_rt)
  );
  defparam _n000044_G.INIT = 16'h0001;
  LUT4 _n000044_G (
    .I0(\_n0002<18> ),
    .I1(\_n0002<11> ),
    .I2(\_n0002<10> ),
    .I3(\_n0002<24> ),
    .O(N219)
  );
  defparam Count_24_rt_416.INIT = 4'h2;
  LUT1 Count_24_rt_416 (
    .I0(\Count<24> ),
    .O(Count_24_rt)
  );
  defparam Count_22_rt_417.INIT = 4'h2;
  LUT1 Count_22_rt_417 (
    .I0(\Count<22> ),
    .O(Count_22_rt)
  );
  defparam Count_3_rt_418.INIT = 4'h2;
  LUT1 Count_3_rt_418 (
    .I0(\Count<3> ),
    .O(Count_3_rt)
  );
  defparam Count_29_rt_419.INIT = 4'h2;
  LUT1 Count_29_rt_419 (
    .I0(\Count<29> ),
    .O(Count_29_rt)
  );
  defparam Count_7_rt_420.INIT = 4'h2;
  LUT1 Count_7_rt_420 (
    .I0(\Count<7> ),
    .O(Count_7_rt)
  );
  defparam _n0000189_G.INIT = 16'h0001;
  LUT4 _n0000189_G (
    .I0(\_n0002<22> ),
    .I1(\_n0002<16> ),
    .I2(\_n0002<15> ),
    .I3(\_n0002<30> ),
    .O(N221)
  );
  defparam Count_11_rt_421.INIT = 4'h2;
  LUT1 Count_11_rt_421 (
    .I0(\Count<11> ),
    .O(Count_11_rt)
  );
  defparam Count_25_rt_422.INIT = 4'h2;
  LUT1 Count_25_rt_422 (
    .I0(\Count<25> ),
    .O(Count_25_rt)
  );
  defparam Count_23_rt_423.INIT = 4'h2;
  LUT1 Count_23_rt_423 (
    .I0(\Count<23> ),
    .O(Count_23_rt)
  );
  defparam Count_13_rt_424.INIT = 4'h2;
  LUT1 Count_13_rt_424 (
    .I0(\Count<13> ),
    .O(Count_13_rt)
  );
  defparam _n0000156_G.INIT = 16'h1000;
  LUT4 _n0000156_G (
    .I0(\_n0002<8> ),
    .I1(\_n0002<14> ),
    .I2(\_n0002<1> ),
    .I3(N3),
    .O(N223)
  );
  defparam Count_5_rt_425.INIT = 4'h2;
  LUT1 Count_5_rt_425 (
    .I0(\Count<5> ),
    .O(Count_5_rt)
  );
  defparam Count_26_rt_426.INIT = 4'h2;
  LUT1 Count_26_rt_426 (
    .I0(\Count<26> ),
    .O(Count_26_rt)
  );
  defparam Count_27_rt_427.INIT = 4'h2;
  LUT1 Count_27_rt_427 (
    .I0(\Count<27> ),
    .O(Count_27_rt)
  );
  defparam Count_9_rt_428.INIT = 4'h2;
  LUT1 Count_9_rt_428 (
    .I0(\Count<9> ),
    .O(Count_9_rt)
  );
  defparam _n0000124_G.INIT = 16'h0001;
  LUT4 _n0000124_G (
    .I0(\_n0002<13> ),
    .I1(\_n0002<7> ),
    .I2(\_n0002<6> ),
    .I3(\_n0002<20> ),
    .O(N225)
  );
  defparam Count_31_rt_429.INIT = 4'h2;
  LUT1 Count_31_rt_429 (
    .I0(\Count<31> ),
    .O(Count_31_rt)
  );
  defparam Count_30_rt_430.INIT = 4'h2;
  LUT1 Count_30_rt_430 (
    .I0(\Count<30> ),
    .O(Count_30_rt)
  );
  FDRE Count_0 (
    .D(N3),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<0> )
  );
  FDRE Count_1 (
    .D(\_n0002<1> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<1> )
  );
  FDRE Count_2 (
    .D(\_n0002<2> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<2> )
  );
  FDRE Count_3 (
    .D(\_n0002<3> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<3> )
  );
  FDRE Count_4 (
    .D(\_n0002<4> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<4> )
  );
  FDRE Count_5 (
    .D(\_n0002<5> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<5> )
  );
  FDRE Count_6 (
    .D(\_n0002<6> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<6> )
  );
  FDRE Count_7 (
    .D(\_n0002<7> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<7> )
  );
  FDRE Count_8 (
    .D(\_n0002<8> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<8> )
  );
  FDRE Count_9 (
    .D(\_n0002<9> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<9> )
  );
  FDRE Count_10 (
    .D(\_n0002<10> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<10> )
  );
  FDRE Count_11 (
    .D(\_n0002<11> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<11> )
  );
  FDRE Count_12 (
    .D(\_n0002<12> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<12> )
  );
  FDRE Count_13 (
    .D(\_n0002<13> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<13> )
  );
  FDRE Count_14 (
    .D(\_n0002<14> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<14> )
  );
  FDRE Count_15 (
    .D(\_n0002<15> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<15> )
  );
  FDRE Count_16 (
    .D(\_n0002<16> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<16> )
  );
  FDRE Count_17 (
    .D(\_n0002<17> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<17> )
  );
  FDRE Count_18 (
    .D(\_n0002<18> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<18> )
  );
  FDRE Count_19 (
    .D(\_n0002<19> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<19> )
  );
  FDRE Count_20 (
    .D(\_n0002<20> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<20> )
  );
  FDRE Count_21 (
    .D(\_n0002<21> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<21> )
  );
  FDRE Count_22 (
    .D(\_n0002<22> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<22> )
  );
  FDRE Count_23 (
    .D(\_n0002<23> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<23> )
  );
  FDRE Count_24 (
    .D(\_n0002<24> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<24> )
  );
  FDRE Count_25 (
    .D(\_n0002<25> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<25> )
  );
  FDRE Count_26 (
    .D(\_n0002<26> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<26> )
  );
  FDRE Count_27 (
    .D(\_n0002<27> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<27> )
  );
  FDRE Count_28 (
    .D(\_n0002<28> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<28> )
  );
  FDRE Count_29 (
    .D(\_n0002<29> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<29> )
  );
  FDRE Count_30 (
    .D(\_n0002<30> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<30> )
  );
  VCC XST_VCC (
    .P(N0)
  );
  GND XST_GND (
    .G(N1)
  );
  defparam \Oscillator_3__n0002<0>lut .INIT = 4'h1;
  LUT1 \Oscillator_3__n0002<0>lut  (
    .I0(\Count<0> ),
    .O(N3)
  );
  MUXCY \Oscillator_3__n0002<0>cy  (
    .CI(N1),
    .DI(N0),
    .S(N3),
    .O(\Oscillator_3__n0002<0>_cyo )
  );
  defparam Count_10_rt_431.INIT = 4'h2;
  LUT1 Count_10_rt_431 (
    .I0(\Count<10> ),
    .O(Count_10_rt)
  );
  MUXCY \Oscillator_3__n0002<1>cy  (
    .CI(\Oscillator_3__n0002<0>_cyo ),
    .DI(N1),
    .S(Count_1_rt),
    .O(\Oscillator_3__n0002<1>_cyo )
  );
  XORCY \Oscillator_3__n0002<1>_xor  (
    .CI(\Oscillator_3__n0002<0>_cyo ),
    .LI(Count_1_rt),
    .O(\_n0002<1> )
  );
  MUXCY \Oscillator_3__n0002<2>cy  (
    .CI(\Oscillator_3__n0002<1>_cyo ),
    .DI(N1),
    .S(Count_2_rt),
    .O(\Oscillator_3__n0002<2>_cyo )
  );
  XORCY \Oscillator_3__n0002<2>_xor  (
    .CI(\Oscillator_3__n0002<1>_cyo ),
    .LI(Count_2_rt),
    .O(\_n0002<2> )
  );
  MUXCY \Oscillator_3__n0002<3>cy  (
    .CI(\Oscillator_3__n0002<2>_cyo ),
    .DI(N1),
    .S(Count_3_rt),
    .O(\Oscillator_3__n0002<3>_cyo )
  );
  XORCY \Oscillator_3__n0002<3>_xor  (
    .CI(\Oscillator_3__n0002<2>_cyo ),
    .LI(Count_3_rt),
    .O(\_n0002<3> )
  );
  MUXCY \Oscillator_3__n0002<4>cy  (
    .CI(\Oscillator_3__n0002<3>_cyo ),
    .DI(N1),
    .S(Count_4_rt),
    .O(\Oscillator_3__n0002<4>_cyo )
  );
  XORCY \Oscillator_3__n0002<4>_xor  (
    .CI(\Oscillator_3__n0002<3>_cyo ),
    .LI(Count_4_rt),
    .O(\_n0002<4> )
  );
  MUXCY \Oscillator_3__n0002<5>cy  (
    .CI(\Oscillator_3__n0002<4>_cyo ),
    .DI(N1),
    .S(Count_5_rt),
    .O(\Oscillator_3__n0002<5>_cyo )
  );
  XORCY \Oscillator_3__n0002<5>_xor  (
    .CI(\Oscillator_3__n0002<4>_cyo ),
    .LI(Count_5_rt),
    .O(\_n0002<5> )
  );
  MUXCY \Oscillator_3__n0002<6>cy  (
    .CI(\Oscillator_3__n0002<5>_cyo ),
    .DI(N1),
    .S(Count_6_rt),
    .O(\Oscillator_3__n0002<6>_cyo )
  );
  XORCY \Oscillator_3__n0002<6>_xor  (
    .CI(\Oscillator_3__n0002<5>_cyo ),
    .LI(Count_6_rt),
    .O(\_n0002<6> )
  );
  MUXCY \Oscillator_3__n0002<7>cy  (
    .CI(\Oscillator_3__n0002<6>_cyo ),
    .DI(N1),
    .S(Count_7_rt),
    .O(\Oscillator_3__n0002<7>_cyo )
  );
  XORCY \Oscillator_3__n0002<7>_xor  (
    .CI(\Oscillator_3__n0002<6>_cyo ),
    .LI(Count_7_rt),
    .O(\_n0002<7> )
  );
  MUXCY \Oscillator_3__n0002<8>cy  (
    .CI(\Oscillator_3__n0002<7>_cyo ),
    .DI(N1),
    .S(Count_8_rt),
    .O(\Oscillator_3__n0002<8>_cyo )
  );
  XORCY \Oscillator_3__n0002<8>_xor  (
    .CI(\Oscillator_3__n0002<7>_cyo ),
    .LI(Count_8_rt),
    .O(\_n0002<8> )
  );
  MUXCY \Oscillator_3__n0002<9>cy  (
    .CI(\Oscillator_3__n0002<8>_cyo ),
    .DI(N1),
    .S(Count_9_rt),
    .O(\Oscillator_3__n0002<9>_cyo )
  );
  XORCY \Oscillator_3__n0002<9>_xor  (
    .CI(\Oscillator_3__n0002<8>_cyo ),
    .LI(Count_9_rt),
    .O(\_n0002<9> )
  );
  MUXCY \Oscillator_3__n0002<10>cy  (
    .CI(\Oscillator_3__n0002<9>_cyo ),
    .DI(N1),
    .S(Count_10_rt),
    .O(\Oscillator_3__n0002<10>_cyo )
  );
  XORCY \Oscillator_3__n0002<10>_xor  (
    .CI(\Oscillator_3__n0002<9>_cyo ),
    .LI(Count_10_rt),
    .O(\_n0002<10> )
  );
  MUXCY \Oscillator_3__n0002<11>cy  (
    .CI(\Oscillator_3__n0002<10>_cyo ),
    .DI(N1),
    .S(Count_11_rt),
    .O(\Oscillator_3__n0002<11>_cyo )
  );
  XORCY \Oscillator_3__n0002<11>_xor  (
    .CI(\Oscillator_3__n0002<10>_cyo ),
    .LI(Count_11_rt),
    .O(\_n0002<11> )
  );
  MUXCY \Oscillator_3__n0002<12>cy  (
    .CI(\Oscillator_3__n0002<11>_cyo ),
    .DI(N1),
    .S(Count_12_rt),
    .O(\Oscillator_3__n0002<12>_cyo )
  );
  XORCY \Oscillator_3__n0002<12>_xor  (
    .CI(\Oscillator_3__n0002<11>_cyo ),
    .LI(Count_12_rt),
    .O(\_n0002<12> )
  );
  MUXCY \Oscillator_3__n0002<13>cy  (
    .CI(\Oscillator_3__n0002<12>_cyo ),
    .DI(N1),
    .S(Count_13_rt),
    .O(\Oscillator_3__n0002<13>_cyo )
  );
  XORCY \Oscillator_3__n0002<13>_xor  (
    .CI(\Oscillator_3__n0002<12>_cyo ),
    .LI(Count_13_rt),
    .O(\_n0002<13> )
  );
  MUXCY \Oscillator_3__n0002<14>cy  (
    .CI(\Oscillator_3__n0002<13>_cyo ),
    .DI(N1),
    .S(Count_14_rt),
    .O(\Oscillator_3__n0002<14>_cyo )
  );
  XORCY \Oscillator_3__n0002<14>_xor  (
    .CI(\Oscillator_3__n0002<13>_cyo ),
    .LI(Count_14_rt),
    .O(\_n0002<14> )
  );
  MUXCY \Oscillator_3__n0002<15>cy  (
    .CI(\Oscillator_3__n0002<14>_cyo ),
    .DI(N1),
    .S(Count_15_rt),
    .O(\Oscillator_3__n0002<15>_cyo )
  );
  XORCY \Oscillator_3__n0002<15>_xor  (
    .CI(\Oscillator_3__n0002<14>_cyo ),
    .LI(Count_15_rt),
    .O(\_n0002<15> )
  );
  MUXCY \Oscillator_3__n0002<16>cy  (
    .CI(\Oscillator_3__n0002<15>_cyo ),
    .DI(N1),
    .S(Count_16_rt),
    .O(\Oscillator_3__n0002<16>_cyo )
  );
  XORCY \Oscillator_3__n0002<16>_xor  (
    .CI(\Oscillator_3__n0002<15>_cyo ),
    .LI(Count_16_rt),
    .O(\_n0002<16> )
  );
  MUXCY \Oscillator_3__n0002<17>cy  (
    .CI(\Oscillator_3__n0002<16>_cyo ),
    .DI(N1),
    .S(Count_17_rt),
    .O(\Oscillator_3__n0002<17>_cyo )
  );
  XORCY \Oscillator_3__n0002<17>_xor  (
    .CI(\Oscillator_3__n0002<16>_cyo ),
    .LI(Count_17_rt),
    .O(\_n0002<17> )
  );
  MUXCY \Oscillator_3__n0002<18>cy  (
    .CI(\Oscillator_3__n0002<17>_cyo ),
    .DI(N1),
    .S(Count_18_rt),
    .O(\Oscillator_3__n0002<18>_cyo )
  );
  XORCY \Oscillator_3__n0002<18>_xor  (
    .CI(\Oscillator_3__n0002<17>_cyo ),
    .LI(Count_18_rt),
    .O(\_n0002<18> )
  );
  MUXCY \Oscillator_3__n0002<19>cy  (
    .CI(\Oscillator_3__n0002<18>_cyo ),
    .DI(N1),
    .S(Count_19_rt),
    .O(\Oscillator_3__n0002<19>_cyo )
  );
  XORCY \Oscillator_3__n0002<19>_xor  (
    .CI(\Oscillator_3__n0002<18>_cyo ),
    .LI(Count_19_rt),
    .O(\_n0002<19> )
  );
  MUXCY \Oscillator_3__n0002<20>cy  (
    .CI(\Oscillator_3__n0002<19>_cyo ),
    .DI(N1),
    .S(Count_20_rt),
    .O(\Oscillator_3__n0002<20>_cyo )
  );
  XORCY \Oscillator_3__n0002<20>_xor  (
    .CI(\Oscillator_3__n0002<19>_cyo ),
    .LI(Count_20_rt),
    .O(\_n0002<20> )
  );
  MUXCY \Oscillator_3__n0002<21>cy  (
    .CI(\Oscillator_3__n0002<20>_cyo ),
    .DI(N1),
    .S(Count_21_rt),
    .O(\Oscillator_3__n0002<21>_cyo )
  );
  XORCY \Oscillator_3__n0002<21>_xor  (
    .CI(\Oscillator_3__n0002<20>_cyo ),
    .LI(Count_21_rt),
    .O(\_n0002<21> )
  );
  MUXCY \Oscillator_3__n0002<22>cy  (
    .CI(\Oscillator_3__n0002<21>_cyo ),
    .DI(N1),
    .S(Count_22_rt),
    .O(\Oscillator_3__n0002<22>_cyo )
  );
  XORCY \Oscillator_3__n0002<22>_xor  (
    .CI(\Oscillator_3__n0002<21>_cyo ),
    .LI(Count_22_rt),
    .O(\_n0002<22> )
  );
  MUXCY \Oscillator_3__n0002<23>cy  (
    .CI(\Oscillator_3__n0002<22>_cyo ),
    .DI(N1),
    .S(Count_23_rt),
    .O(\Oscillator_3__n0002<23>_cyo )
  );
  XORCY \Oscillator_3__n0002<23>_xor  (
    .CI(\Oscillator_3__n0002<22>_cyo ),
    .LI(Count_23_rt),
    .O(\_n0002<23> )
  );
  MUXCY \Oscillator_3__n0002<24>cy  (
    .CI(\Oscillator_3__n0002<23>_cyo ),
    .DI(N1),
    .S(Count_24_rt),
    .O(\Oscillator_3__n0002<24>_cyo )
  );
  XORCY \Oscillator_3__n0002<24>_xor  (
    .CI(\Oscillator_3__n0002<23>_cyo ),
    .LI(Count_24_rt),
    .O(\_n0002<24> )
  );
  MUXCY \Oscillator_3__n0002<25>cy  (
    .CI(\Oscillator_3__n0002<24>_cyo ),
    .DI(N1),
    .S(Count_25_rt),
    .O(\Oscillator_3__n0002<25>_cyo )
  );
  XORCY \Oscillator_3__n0002<25>_xor  (
    .CI(\Oscillator_3__n0002<24>_cyo ),
    .LI(Count_25_rt),
    .O(\_n0002<25> )
  );
  MUXCY \Oscillator_3__n0002<26>cy  (
    .CI(\Oscillator_3__n0002<25>_cyo ),
    .DI(N1),
    .S(Count_26_rt),
    .O(\Oscillator_3__n0002<26>_cyo )
  );
  XORCY \Oscillator_3__n0002<26>_xor  (
    .CI(\Oscillator_3__n0002<25>_cyo ),
    .LI(Count_26_rt),
    .O(\_n0002<26> )
  );
  MUXCY \Oscillator_3__n0002<27>cy  (
    .CI(\Oscillator_3__n0002<26>_cyo ),
    .DI(N1),
    .S(Count_27_rt),
    .O(\Oscillator_3__n0002<27>_cyo )
  );
  XORCY \Oscillator_3__n0002<27>_xor  (
    .CI(\Oscillator_3__n0002<26>_cyo ),
    .LI(Count_27_rt),
    .O(\_n0002<27> )
  );
  MUXCY \Oscillator_3__n0002<28>cy  (
    .CI(\Oscillator_3__n0002<27>_cyo ),
    .DI(N1),
    .S(Count_28_rt),
    .O(\Oscillator_3__n0002<28>_cyo )
  );
  XORCY \Oscillator_3__n0002<28>_xor  (
    .CI(\Oscillator_3__n0002<27>_cyo ),
    .LI(Count_28_rt),
    .O(\_n0002<28> )
  );
  MUXCY \Oscillator_3__n0002<29>cy  (
    .CI(\Oscillator_3__n0002<28>_cyo ),
    .DI(N1),
    .S(Count_29_rt),
    .O(\Oscillator_3__n0002<29>_cyo )
  );
  XORCY \Oscillator_3__n0002<29>_xor  (
    .CI(\Oscillator_3__n0002<28>_cyo ),
    .LI(Count_29_rt),
    .O(\_n0002<29> )
  );
  MUXCY \Oscillator_3__n0002<30>cy  (
    .CI(\Oscillator_3__n0002<29>_cyo ),
    .DI(N1),
    .S(Count_30_rt),
    .O(\Oscillator_3__n0002<30>_cyo )
  );
  XORCY \Oscillator_3__n0002<30>_xor  (
    .CI(\Oscillator_3__n0002<29>_cyo ),
    .LI(Count_30_rt),
    .O(\_n0002<30> )
  );
  defparam Count_14_rt_432.INIT = 4'h2;
  LUT1 Count_14_rt_432 (
    .I0(\Count<14> ),
    .O(Count_14_rt)
  );
  defparam Count_4_rt_433.INIT = 4'h2;
  LUT1 Count_4_rt_433 (
    .I0(\Count<4> ),
    .O(Count_4_rt)
  );
  defparam Count_16_rt_434.INIT = 4'h2;
  LUT1 Count_16_rt_434 (
    .I0(\Count<16> ),
    .O(Count_16_rt)
  );
  defparam Count_6_rt_435.INIT = 4'h2;
  LUT1 Count_6_rt_435 (
    .I0(\Count<6> ),
    .O(Count_6_rt)
  );
  defparam Count_12_rt_436.INIT = 4'h2;
  LUT1 Count_12_rt_436 (
    .I0(\Count<12> ),
    .O(Count_12_rt)
  );
  defparam Count_8_rt_437.INIT = 4'h2;
  LUT1 Count_8_rt_437 (
    .I0(\Count<8> ),
    .O(Count_8_rt)
  );
  defparam Count_2_rt_438.INIT = 4'h2;
  LUT1 Count_2_rt_438 (
    .I0(\Count<2> ),
    .O(Count_2_rt)
  );
  defparam _n000088.INIT = 16'h4000;
  LUT4 _n000088 (
    .I0(\_old_Count_117<25> ),
    .I1(CHOICE2599),
    .I2(CHOICE2592),
    .I3(CHOICE2607),
    .O(CHOICE2610)
  );
  defparam Count_1_rt_439.INIT = 4'h2;
  LUT1 Count_1_rt_439 (
    .I0(\Count<1> ),
    .O(Count_1_rt)
  );
  defparam _n0000136_G.INIT = 16'h0002;
  LUT4 _n0000136_G (
    .I0(CHOICE2620),
    .I1(\_n0002<28> ),
    .I2(\_n0002<27> ),
    .I3(\_n0002<26> ),
    .O(N227)
  );
  MUXF5 _n000011 (
    .I0(N210),
    .I1(N211),
    .S(Enable),
    .O(CHOICE2589)
  );
  defparam _n000011_F.INIT = 16'h1000;
  LUT4 _n000011_F (
    .I0(\Count<9> ),
    .I1(\Count<17> ),
    .I2(\Count<2> ),
    .I3(\Count<3> ),
    .O(N210)
  );
  MUXF5 _n000023 (
    .I0(N212),
    .I1(N213),
    .S(Enable),
    .O(CHOICE2592)
  );
  defparam _n000023_F.INIT = 8'h10;
  LUT3 _n000023_F (
    .I0(\Count<23> ),
    .I1(\Count<31> ),
    .I2(CHOICE2589),
    .O(N212)
  );
  MUXF5 _n0000168 (
    .I0(N214),
    .I1(N215),
    .S(Enable),
    .O(CHOICE2632)
  );
  defparam _n0000168_F.INIT = 8'h10;
  LUT3 _n0000168_F (
    .I0(\Count<21> ),
    .I1(\Count<29> ),
    .I2(CHOICE2629),
    .O(N214)
  );
  MUXF5 _n000061 (
    .I0(N216),
    .I1(N217),
    .S(Enable),
    .O(CHOICE2607)
  );
  defparam _n000061_F.INIT = 16'h0001;
  LUT4 _n000061_F (
    .I0(\Count<4> ),
    .I1(\Count<5> ),
    .I2(\Count<12> ),
    .I3(\Count<19> ),
    .O(N216)
  );
  MUXF5 _n000044 (
    .I0(N218),
    .I1(N219),
    .S(Enable),
    .O(CHOICE2599)
  );
  defparam _n000044_F.INIT = 16'h0001;
  LUT4 _n000044_F (
    .I0(\Count<10> ),
    .I1(\Count<11> ),
    .I2(\Count<18> ),
    .I3(\Count<24> ),
    .O(N218)
  );
  MUXF5 _n0000189 (
    .I0(N220),
    .I1(N221),
    .S(Enable),
    .O(CHOICE2639)
  );
  defparam _n0000189_F.INIT = 16'h0001;
  LUT4 _n0000189_F (
    .I0(\Count<15> ),
    .I1(\Count<16> ),
    .I2(\Count<22> ),
    .I3(\Count<30> ),
    .O(N220)
  );
  MUXF5 _n0000156 (
    .I0(N222),
    .I1(N223),
    .S(Enable),
    .O(CHOICE2629)
  );
  defparam _n0000156_F.INIT = 16'h1000;
  LUT4 _n0000156_F (
    .I0(\Count<8> ),
    .I1(\Count<14> ),
    .I2(\Count<0> ),
    .I3(\Count<1> ),
    .O(N222)
  );
  MUXF5 _n0000124 (
    .I0(N224),
    .I1(N225),
    .S(Enable),
    .O(CHOICE2620)
  );
  defparam _n0000124_F.INIT = 16'h0001;
  LUT4 _n0000124_F (
    .I0(\Count<6> ),
    .I1(\Count<7> ),
    .I2(\Count<13> ),
    .I3(\Count<20> ),
    .O(N224)
  );
  MUXF5 _n0000136 (
    .I0(N226),
    .I1(N227),
    .S(Enable),
    .O(CHOICE2623)
  );
  defparam _n0000136_F.INIT = 8'h20;
  LUT3 _n0000136_F (
    .I0(CHOICE2620),
    .I1(\Count<28> ),
    .I2(N208),
    .O(N226)
  );
endmodule

module DelayLine_7_1 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<100>__net63 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<100>__net67 ;
  wire \Mshreg_Bits<100>__net72 ;
  wire \Mshreg_Bits<100>__net71 ;
  wire \Mshreg_Bits<100>__net69 ;
  wire \Mshreg_Bits<100>__net61 ;
  wire \Mshreg_Bits<100>__net65 ;
  wire \NLW_Mshreg_Bits<100>_srl_33_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<100>_srl_27_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<100>_srl_28_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<100>_srl_29_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<100>_srl_30_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<100>_srl_31_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<100>_srl_32_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<100>_srl_33  (
    .A0(N1),
    .A1(N0),
    .A2(N1),
    .A3(N1),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<100>__net71 ),
    .Q(\Mshreg_Bits<100>__net72 ),
    .Q15(\NLW_Mshreg_Bits<100>_srl_33_Q15_UNCONNECTED )
  );
  FDR Edge_440 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<100>_0  (
    .D(\Mshreg_Bits<100>__net72 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<100>_srl_27  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<100>_srl_27_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<100>__net61 )
  );
  SRLC16E \Mshreg_Bits<100>_srl_28  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<100>__net61 ),
    .Q(\NLW_Mshreg_Bits<100>_srl_28_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<100>__net63 )
  );
  SRLC16E \Mshreg_Bits<100>_srl_29  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<100>__net63 ),
    .Q(\NLW_Mshreg_Bits<100>_srl_29_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<100>__net65 )
  );
  SRLC16E \Mshreg_Bits<100>_srl_30  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<100>__net65 ),
    .Q(\NLW_Mshreg_Bits<100>_srl_30_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<100>__net67 )
  );
  SRLC16E \Mshreg_Bits<100>_srl_31  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<100>__net67 ),
    .Q(\NLW_Mshreg_Bits<100>_srl_31_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<100>__net69 )
  );
  SRLC16E \Mshreg_Bits<100>_srl_32  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<100>__net69 ),
    .Q(\NLW_Mshreg_Bits<100>_srl_32_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<100>__net71 )
  );
endmodule

module ReaderClock (
  dclk, ak2, bp2, bs2, bt2, as2, at2, au2, br2
);
  input dclk;
  input ak2;
  input bp2;
  input bs2;
  input bt2;
  output as2;
  output at2;
  output au2;
  output br2;
  wire NlwRenamedSig_OI_au2;
  wire stop_pulse;
  wire clock2;
  wire stop;
  wire N0;
  wire stop_delay;
  wire enable;
  wire stop_N0;
  wire stop_N1;
  assign
    au2 = NlwRenamedSig_OI_au2;
  defparam stop_Aclr_INV1.INIT = 4'h1;
  LUT1 stop_Aclr_INV1 (
    .I0(bs2),
    .O(stop_N0)
  );
  defparam stop_complete1.INIT = 8'h4F;
  LUT3 stop_complete1 (
    .I0(stop),
    .I1(stop_delay),
    .I2(bp2),
    .O(br2)
  );
  GND XST_GND (
    .G(N0)
  );
  defparam rdr_shift1.INIT = 8'hF7;
  LUT3 rdr_shift1 (
    .I0(clock2),
    .I1(stop_pulse),
    .I2(ak2),
    .O(as2)
  );
  FDCP stop_441 (
    .D(N0),
    .CLR(stop_N0),
    .PRE(stop_N1),
    .C(bt2),
    .Q(stop)
  );
  DelayLine_7_1 rdrclk2 (
    .Dclk(dclk),
    .In(NlwRenamedSig_OI_au2),
    .Out(clock2)
  );
  Oscillator_3 rdr_clock (
    .Dclk(dclk),
    .Enable(enable),
    .Out(NlwRenamedSig_OI_au2)
  );
  Monostable_7 rdrspulse (
    .Dclk(dclk),
    .In(enable),
    .Out(stop_pulse)
  );
  Monostable_6 rdrdelay (
    .Dclk(dclk),
    .In(enable),
    .Out(stop_delay)
  );
  defparam rdr_shift_1.INIT = 4'h4;
  LUT2 rdr_shift_1 (
    .I0(ak2),
    .I1(clock2),
    .O(at2)
  );
  defparam enable1.INIT = 4'h1;
  LUT1 enable1 (
    .I0(ak2),
    .O(enable)
  );
  defparam stop_Aset_INV1.INIT = 4'h1;
  LUT1 stop_Aset_INV1 (
    .I0(stop_pulse),
    .O(stop_N1)
  );
endmodule

module DelayLine_8 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<10>__net75 ;
  wire N1;
  wire N0;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRL16E \Mshreg_Bits<10>_srl_34  (
    .A0(N1),
    .A1(N1),
    .A2(N1),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\Mshreg_Bits<10>__net75 )
  );
  FDR Edge_442 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<10>_0  (
    .D(\Mshreg_Bits<10>__net75 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
endmodule

module ClockCounter (
  dclk, ae1, ba1, ah1, ak1, al1, an2, bj1, bj2, bk1, ap1, bl1, ar1, ar2, bn1, at2, bp1, au2, av1, af1, af2, bb1, bd1, aj1, aj2, am1, am2, ap2, bm2, 
as1, au1, av2, bs1
);
  input dclk;
  input ae1;
  input ba1;
  input ah1;
  input ak1;
  input al1;
  input an2;
  input bj1;
  input bj2;
  input bk1;
  input ap1;
  input bl1;
  input ar1;
  input ar2;
  input bn1;
  input at2;
  input bp1;
  input au2;
  input av1;
  output af1;
  output af2;
  output bb1;
  output bd1;
  output aj1;
  output aj2;
  output am1;
  output am2;
  output ap2;
  output bm2;
  output as1;
  output au1;
  output av2;
  output bs1;
  wire _n0000;
  wire \clockreg<11> ;
  wire transfer;
  wire clock;
  wire NlwRenamedSignal_av2;
  assign
    af1 = NlwRenamedSignal_av2,
    af2 = NlwRenamedSignal_av2,
    bb1 = NlwRenamedSignal_av2,
    bd1 = NlwRenamedSignal_av2,
    aj1 = NlwRenamedSignal_av2,
    aj2 = NlwRenamedSignal_av2,
    am1 = NlwRenamedSignal_av2,
    am2 = NlwRenamedSignal_av2,
    ap2 = NlwRenamedSignal_av2,
    as1 = NlwRenamedSignal_av2,
    au1 = NlwRenamedSignal_av2,
    av2 = NlwRenamedSignal_av2;
  defparam _n00001.INIT = 16'h8000;
  LUT4 _n00001 (
    .I0(bk1),
    .I1(bl1),
    .I2(bn1),
    .I3(bp1),
    .O(_n0000)
  );
  FD clockreg_11 (
    .D(clock),
    .C(transfer),
    .Q(\clockreg<11> )
  );
  DelayLine_8 clockxfer (
    .Dclk(dclk),
    .In(_n0000),
    .Out(transfer)
  );
  defparam clock_ac_clr_1.INIT = 8'h7F;
  LUT3 clock_ac_clr_1 (
    .I0(bk1),
    .I1(bp1),
    .I2(bl1),
    .O(bm2)
  );
  defparam aj11.INIT = 16'hBFFF;
  LUT4 aj11 (
    .I0(\clockreg<11> ),
    .I1(bk1),
    .I2(bp1),
    .I3(bl1),
    .O(NlwRenamedSignal_av2)
  );
  VCC XST_VCC (
    .P(clock)
  );
endmodule

module ClockControl (
  d2, f2, l1, l2, m2, n1, n2, p1, p2, r1, r2, s2, t2, u2, v1, a1, h1, j2, k2, s1, v2, c1
);
  input d2;
  input f2;
  input l1;
  input l2;
  input m2;
  input n1;
  input n2;
  input p1;
  input p2;
  input r1;
  input r2;
  input s2;
  input t2;
  input u2;
  input v1;
  input a1;
  output h1;
  output j2;
  output k2;
  output s1;
  output v2;
  output c1;
  wire cenable_set;
  wire flag;
  wire clock_enable;
  wire clock_setup;
  wire NlwRenamedSig_OI_s1;
  wire N3;
  wire NlwRenamedSig_OI_v2;
  assign
    s1 = NlwRenamedSig_OI_s1,
    v2 = NlwRenamedSig_OI_v2;
  FDP clock_enable_443 (
    .D(flag),
    .PRE(cenable_set),
    .C(clock_setup),
    .Q(clock_enable)
  );
  defparam j21.INIT = 4'h1;
  LUT1 j21 (
    .I0(clock_enable),
    .O(j2)
  );
  defparam clock_iot_SW0.INIT = 8'h80;
  LUT3_L clock_iot_SW0 (
    .I0(r2),
    .I1(n2),
    .I2(m2),
    .LO(N3)
  );
  defparam load_counter1.INIT = 16'h020A;
  LUT4 load_counter1 (
    .I0(NlwRenamedSig_OI_s1),
    .I1(n1),
    .I2(r1),
    .I3(a1),
    .O(NlwRenamedSig_OI_v2)
  );
  GND XST_GND (
    .G(flag)
  );
  defparam clock_iot.INIT = 16'h8000;
  LUT4 clock_iot (
    .I0(N3),
    .I1(p2),
    .I2(s2),
    .I3(t2),
    .O(NlwRenamedSig_OI_s1)
  );
  defparam cenable_set1.INIT = 4'h8;
  LUT2 cenable_set1 (
    .I0(NlwRenamedSig_OI_v2),
    .I1(u2),
    .O(cenable_set)
  );
  defparam clock_setup1.INIT = 4'hD;
  LUT2 clock_setup1 (
    .I0(p1),
    .I1(NlwRenamedSig_OI_v2),
    .O(clock_setup)
  );
  defparam clock_p41.INIT = 4'h1;
  LUT1 clock_p41 (
    .I0(f2),
    .O(k2)
  );
endmodule

module DisplayControl (
  ah2, bd2, aj2, be2, ak1, ak2, bf2, bh2, an1, an2, bj2, ap1, bk2, bl2, ar1, bm2, bn2, ae2, aj1, ap2, ar2, as1, as2, bp2, br2
);
  input ah2;
  input bd2;
  input aj2;
  input be2;
  input ak1;
  input ak2;
  input bf2;
  input bh2;
  input an1;
  input an2;
  input bj2;
  input ap1;
  input bk2;
  input bl2;
  input ar1;
  input bm2;
  input bn2;
  output ae2;
  output aj1;
  output ap2;
  output ar2;
  output as1;
  output as2;
  output bp2;
  output br2;
  wire \br<1> ;
  wire br_clock;
  wire N12;
  wire CHOICE1670;
  wire N0;
  wire light_pen_clr;
  wire light_pen_set;
  wire \z_axis_br<0>_N0 ;
  wire light_pen_flag;
  wire N14;
  wire \br<0> ;
  wire N51;
  wire CHOICE1686;
  wire CHOICE1666;
  wire N9;
  FDP br_1 (
    .D(ap1),
    .PRE(ah2),
    .C(br_clock),
    .Q(\br<1> )
  );
  defparam io_bus_in_skip_33.INIT = 16'hFF7F;
  LUT4 io_bus_in_skip_33 (
    .I0(bn2),
    .I1(bm2),
    .I2(N51),
    .I3(CHOICE1686),
    .O(br2)
  );
  defparam y_strobe2.INIT = 16'h8000;
  LUT4 y_strobe2 (
    .I0(aj2),
    .I1(bf2),
    .I2(bh2),
    .I3(N14),
    .O(ap2)
  );
  FDCP light_pen_flag_444 (
    .D(N0),
    .CLR(light_pen_clr),
    .PRE(light_pen_set),
    .C(ah2),
    .Q(light_pen_flag)
  );
  GND XST_GND (
    .G(N0)
  );
  defparam clear_y_2.INIT = 16'h7FFF;
  LUT4 clear_y_2 (
    .I0(ar1),
    .I1(bf2),
    .I2(bh2),
    .I3(N14),
    .O(as2)
  );
  defparam light_pen_req13.INIT = 16'h8000;
  LUT4 light_pen_req13 (
    .I0(bd2),
    .I1(bf2),
    .I2(bh2),
    .I3(bk2),
    .O(CHOICE1670)
  );
  OBUFT z_axis_OBUFT (
    .I(\br<0> ),
    .T(\z_axis_br<0>_N0 ),
    .O(ae2)
  );
  defparam light_pen_req15.INIT = 8'h80;
  LUT3 light_pen_req15 (
    .I0(bm2),
    .I1(CHOICE1666),
    .I2(CHOICE1670),
    .O(aj1)
  );
  defparam y_strobe1.INIT = 16'h8000;
  LUT4 y_strobe1 (
    .I0(bj2),
    .I1(bk2),
    .I2(bl2),
    .I3(bm2),
    .O(N14)
  );
  defparam x_strobe2.INIT = 16'h8000;
  LUT4 x_strobe2 (
    .I0(aj2),
    .I1(be2),
    .I2(bf2),
    .I3(N12),
    .O(as1)
  );
  defparam light_pen_req4.INIT = 16'hF888;
  LUT4 light_pen_req4 (
    .I0(be2),
    .I1(bn2),
    .I2(bj2),
    .I3(bl2),
    .O(CHOICE1666)
  );
  defparam x_strobe1.INIT = 16'h8000;
  LUT4 x_strobe1 (
    .I0(bh2),
    .I1(bk2),
    .I2(bm2),
    .I3(bn2),
    .O(N12)
  );
  defparam io_bus_in_int_1.INIT = 4'h1;
  LUT1 io_bus_in_int_1 (
    .I0(light_pen_flag),
    .O(bp2)
  );
  defparam clear_x_2.INIT = 16'h7FFF;
  LUT4 clear_x_2 (
    .I0(ar1),
    .I1(be2),
    .I2(bf2),
    .I3(N12),
    .O(ar2)
  );
  defparam light_pen_clr2.INIT = 16'h8000;
  LUT4 light_pen_clr2 (
    .I0(aj2),
    .I1(bf2),
    .I2(bh2),
    .I3(N9),
    .O(light_pen_clr)
  );
  defparam light_pen_clr1.INIT = 16'h8000;
  LUT4 light_pen_clr1 (
    .I0(bk2),
    .I1(bl2),
    .I2(bm2),
    .I3(bn2),
    .O(N9)
  );
  defparam light_pen_set1.INIT = 4'h8;
  LUT2 light_pen_set1 (
    .I0(ak1),
    .I1(an2),
    .O(light_pen_set)
  );
  FDP br_0 (
    .D(an1),
    .PRE(ah2),
    .C(br_clock),
    .Q(\br<0> )
  );
  defparam \z_axis_br<0>_EnableTr_INV1 .INIT = 4'h1;
  LUT1 \z_axis_br<0>_EnableTr_INV1  (
    .I0(\br<1> ),
    .O(\z_axis_br<0>_N0 )
  );
  defparam io_bus_in_skip_33_SW0.INIT = 16'h8000;
  LUT4 io_bus_in_skip_33_SW0 (
    .I0(bl2),
    .I1(bk2),
    .I2(bh2),
    .I3(bf2),
    .O(N51)
  );
  defparam br_clock2.INIT = 16'h8000;
  LUT4 br_clock2 (
    .I0(bd2),
    .I1(bf2),
    .I2(bh2),
    .I3(N9),
    .O(br_clock)
  );
  defparam io_bus_in_skip_25.INIT = 8'h7F;
  LUT3 io_bus_in_skip_25 (
    .I0(ak2),
    .I1(light_pen_flag),
    .I2(ar1),
    .O(CHOICE1686)
  );
endmodule

module DelayLine_5 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<35>__net51 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<35>__net49 ;
  wire \Mshreg_Bits<35>__net52 ;
  wire \NLW_Mshreg_Bits<35>_srl_24_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<35>_srl_22_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<35>_srl_23_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<35>_srl_24  (
    .A0(N0),
    .A1(N1),
    .A2(N1),
    .A3(N1),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<35>__net51 ),
    .Q(\Mshreg_Bits<35>__net52 ),
    .Q15(\NLW_Mshreg_Bits<35>_srl_24_Q15_UNCONNECTED )
  );
  FDR Edge_445 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<35>_0  (
    .D(\Mshreg_Bits<35>__net52 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<35>_srl_22  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<35>_srl_22_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<35>__net49 )
  );
  SRLC16E \Mshreg_Bits<35>_srl_23  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<35>__net49 ),
    .Q(\NLW_Mshreg_Bits<35>_srl_23_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<35>__net51 )
  );
endmodule

module DelayLine_4 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<40>__net44 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<40>__net42 ;
  wire \Mshreg_Bits<40>__net45 ;
  wire \NLW_Mshreg_Bits<40>_srl_21_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<40>_srl_19_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<40>_srl_20_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<40>_srl_21  (
    .A0(N1),
    .A1(N0),
    .A2(N0),
    .A3(N1),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<40>__net44 ),
    .Q(\Mshreg_Bits<40>__net45 ),
    .Q15(\NLW_Mshreg_Bits<40>_srl_21_Q15_UNCONNECTED )
  );
  FDR Edge_446 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<40>_0  (
    .D(\Mshreg_Bits<40>__net45 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<40>_srl_19  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<40>_srl_19_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<40>__net42 )
  );
  SRLC16E \Mshreg_Bits<40>_srl_20  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<40>__net42 ),
    .Q(\NLW_Mshreg_Bits<40>_srl_20_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<40>__net44 )
  );
endmodule

module Oscillator_2 (
  Dclk, Enable, Out
);
  input Dclk;
  input Enable;
  output Out;
  wire NlwRenamedSig_OI_Out;
  wire Count_30_rt;
  wire _n0000;
  wire Count_21_rt;
  wire _n0003;
  wire \Count<2> ;
  wire Count_2_rt;
  wire \Count<1> ;
  wire Count_19_rt;
  wire \Count<0> ;
  wire N186;
  wire Count_15_rt;
  wire \_old_Count_122<25> ;
  wire Count_28_rt;
  wire Count_8_rt;
  wire Count_17_rt;
  wire Count_22_rt;
  wire Count_16_rt;
  wire Count_3_rt;
  wire Count_9_rt;
  wire Count_29_rt;
  wire Count_18_rt;
  wire Count_10_rt;
  wire Count_13_rt;
  wire Count_6_rt;
  wire Count_24_rt;
  wire Count_20_rt;
  wire Count_14_rt;
  wire Count_26_rt;
  wire Count_25_rt;
  wire Count_27_rt;
  wire Count_7_rt;
  wire Count_12_rt;
  wire Count_23_rt;
  wire Count_11_rt;
  wire Count_31_rt;
  wire Count_4_rt;
  wire Count_5_rt;
  wire \_n0002<31> ;
  wire \_n0002<30> ;
  wire \_n0002<29> ;
  wire \_n0002<28> ;
  wire \_n0002<27> ;
  wire \_n0002<26> ;
  wire \_n0002<25> ;
  wire \_n0002<24> ;
  wire \_n0002<23> ;
  wire \_n0002<22> ;
  wire \_n0002<21> ;
  wire \_n0002<20> ;
  wire \_n0002<19> ;
  wire \_n0002<18> ;
  wire \_n0002<17> ;
  wire \_n0002<16> ;
  wire \_n0002<15> ;
  wire \_n0002<14> ;
  wire \_n0002<13> ;
  wire \_n0002<12> ;
  wire \_n0002<11> ;
  wire \_n0002<10> ;
  wire \_n0002<9> ;
  wire \_n0002<8> ;
  wire \_n0002<7> ;
  wire \_n0002<6> ;
  wire \_n0002<5> ;
  wire \_n0002<4> ;
  wire \_n0002<3> ;
  wire \_n0002<2> ;
  wire \_n0002<1> ;
  wire CHOICE2571;
  wire \Count<31> ;
  wire \Count<30> ;
  wire \Count<29> ;
  wire \Count<28> ;
  wire \Count<27> ;
  wire \Count<26> ;
  wire \Count<25> ;
  wire \Count<24> ;
  wire \Count<23> ;
  wire \Count<22> ;
  wire \Count<21> ;
  wire \Count<20> ;
  wire \Count<19> ;
  wire \Count<18> ;
  wire \Count<17> ;
  wire \Count<16> ;
  wire \Count<15> ;
  wire \Count<14> ;
  wire \Count<13> ;
  wire \Count<12> ;
  wire \Count<11> ;
  wire \Count<10> ;
  wire \Count<9> ;
  wire \Count<8> ;
  wire \Count<7> ;
  wire \Count<6> ;
  wire \Count<5> ;
  wire \Count<4> ;
  wire \Count<3> ;
  wire N0;
  wire N1;
  wire \Oscillator_2__n0002<30>_cyo ;
  wire N3;
  wire \Oscillator_2__n0002<0>_cyo ;
  wire \Oscillator_2__n0002<1>_cyo ;
  wire \Oscillator_2__n0002<2>_cyo ;
  wire \Oscillator_2__n0002<3>_cyo ;
  wire \Oscillator_2__n0002<4>_cyo ;
  wire \Oscillator_2__n0002<5>_cyo ;
  wire \Oscillator_2__n0002<6>_cyo ;
  wire \Oscillator_2__n0002<7>_cyo ;
  wire \Oscillator_2__n0002<8>_cyo ;
  wire \Oscillator_2__n0002<9>_cyo ;
  wire \Oscillator_2__n0002<10>_cyo ;
  wire \Oscillator_2__n0002<11>_cyo ;
  wire \Oscillator_2__n0002<12>_cyo ;
  wire \Oscillator_2__n0002<13>_cyo ;
  wire \Oscillator_2__n0002<14>_cyo ;
  wire \Oscillator_2__n0002<15>_cyo ;
  wire \Oscillator_2__n0002<16>_cyo ;
  wire \Oscillator_2__n0002<17>_cyo ;
  wire \Oscillator_2__n0002<18>_cyo ;
  wire \Oscillator_2__n0002<19>_cyo ;
  wire \Oscillator_2__n0002<20>_cyo ;
  wire \Oscillator_2__n0002<21>_cyo ;
  wire \Oscillator_2__n0002<22>_cyo ;
  wire \Oscillator_2__n0002<23>_cyo ;
  wire \Oscillator_2__n0002<24>_cyo ;
  wire \Oscillator_2__n0002<25>_cyo ;
  wire \Oscillator_2__n0002<26>_cyo ;
  wire \Oscillator_2__n0002<27>_cyo ;
  wire \Oscillator_2__n0002<28>_cyo ;
  wire \Oscillator_2__n0002<29>_cyo ;
  wire CHOICE2553;
  wire CHOICE2574;
  wire CHOICE2541;
  wire CHOICE2538;
  wire Count_1_rt;
  wire CHOICE2546;
  wire CHOICE2550;
  wire CHOICE2562;
  wire CHOICE2565;
  wire CHOICE2580;
  wire N188;
  wire N189;
  wire N190;
  wire N191;
  wire N192;
  wire N193;
  wire N194;
  wire N195;
  wire N196;
  wire N197;
  wire N198;
  wire N199;
  wire N200;
  wire N201;
  wire N202;
  wire N203;
  wire N204;
  wire N205;
  assign
    Out = NlwRenamedSig_OI_Out;
  defparam _n00031.INIT = 4'h1;
  LUT1 _n00031 (
    .I0(NlwRenamedSig_OI_Out),
    .O(_n0003)
  );
  defparam _n0000197.INIT = 16'h8000;
  LUT4 _n0000197 (
    .I0(CHOICE2553),
    .I1(CHOICE2565),
    .I2(CHOICE2574),
    .I3(CHOICE2580),
    .O(_n0000)
  );
  defparam Count_21_rt_447.INIT = 4'h2;
  LUT1 Count_21_rt_447 (
    .I0(\Count<21> ),
    .O(Count_21_rt)
  );
  defparam Count_5_rt_448.INIT = 4'h2;
  LUT1 Count_5_rt_448 (
    .I0(\Count<5> ),
    .O(Count_5_rt)
  );
  FDRE Count_31 (
    .D(\_n0002<31> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<31> )
  );
  FDE Out_449 (
    .D(_n0003),
    .CE(_n0000),
    .C(Dclk),
    .Q(NlwRenamedSig_OI_Out)
  );
  XORCY \Oscillator_2__n0002<31>_xor  (
    .CI(\Oscillator_2__n0002<30>_cyo ),
    .LI(Count_31_rt),
    .O(\_n0002<31> )
  );
  defparam Count_15_rt_450.INIT = 4'h2;
  LUT1 Count_15_rt_450 (
    .I0(\Count<15> ),
    .O(Count_15_rt)
  );
  defparam Count_28_rt_451.INIT = 4'h2;
  LUT1 Count_28_rt_451 (
    .I0(\Count<28> ),
    .O(Count_28_rt)
  );
  defparam Count_17_rt_452.INIT = 4'h2;
  LUT1 Count_17_rt_452 (
    .I0(\Count<17> ),
    .O(Count_17_rt)
  );
  defparam _n000012_G.INIT = 16'h1000;
  LUT4 _n000012_G (
    .I0(\_n0002<3> ),
    .I1(\_n0002<17> ),
    .I2(\_n0002<9> ),
    .I3(\_n0002<2> ),
    .O(N189)
  );
  defparam Count_19_rt_453.INIT = 4'h2;
  LUT1 Count_19_rt_453 (
    .I0(\Count<19> ),
    .O(Count_19_rt)
  );
  defparam _n000084_SW0.INIT = 4'h1;
  LUT2 _n000084_SW0 (
    .I0(\Count<26> ),
    .I1(\Count<27> ),
    .O(N186)
  );
  defparam \_old_Count_122<25>1 .INIT = 8'hE4;
  LUT3 \_old_Count_122<25>1  (
    .I0(Enable),
    .I1(\Count<25> ),
    .I2(\_n0002<25> ),
    .O(\_old_Count_122<25> )
  );
  defparam _n0000160_G.INIT = 16'h0002;
  LUT4 _n0000160_G (
    .I0(\_n0002<15> ),
    .I1(\_n0002<16> ),
    .I2(\_n0002<22> ),
    .I3(\_n0002<30> ),
    .O(N191)
  );
  defparam _n0000140_G.INIT = 8'h10;
  LUT3 _n0000140_G (
    .I0(\_n0002<21> ),
    .I1(\_n0002<29> ),
    .I2(CHOICE2571),
    .O(N193)
  );
  defparam Count_9_rt_454.INIT = 4'h2;
  LUT1 Count_9_rt_454 (
    .I0(\Count<9> ),
    .O(Count_9_rt)
  );
  defparam Count_18_rt_455.INIT = 4'h2;
  LUT1 Count_18_rt_455 (
    .I0(\Count<18> ),
    .O(Count_18_rt)
  );
  defparam Count_13_rt_456.INIT = 4'h2;
  LUT1 Count_13_rt_456 (
    .I0(\Count<13> ),
    .O(Count_13_rt)
  );
  defparam Count_24_rt_457.INIT = 4'h2;
  LUT1 Count_24_rt_457 (
    .I0(\Count<24> ),
    .O(Count_24_rt)
  );
  defparam Count_22_rt_458.INIT = 4'h2;
  LUT1 Count_22_rt_458 (
    .I0(\Count<22> ),
    .O(Count_22_rt)
  );
  defparam Count_3_rt_459.INIT = 4'h2;
  LUT1 Count_3_rt_459 (
    .I0(\Count<3> ),
    .O(Count_3_rt)
  );
  defparam Count_29_rt_460.INIT = 4'h2;
  LUT1 Count_29_rt_460 (
    .I0(\Count<29> ),
    .O(Count_29_rt)
  );
  defparam _n000048_G.INIT = 16'h8000;
  LUT4 _n000048_G (
    .I0(\_n0002<12> ),
    .I1(\_n0002<5> ),
    .I2(\_n0002<4> ),
    .I3(\_n0002<19> ),
    .O(N195)
  );
  defparam _n000041_G.INIT = 16'h1000;
  LUT4 _n000041_G (
    .I0(\_n0002<11> ),
    .I1(\_n0002<24> ),
    .I2(\_n0002<18> ),
    .I3(\_n0002<10> ),
    .O(N197)
  );
  defparam _n000024_G.INIT = 8'h10;
  LUT3 _n000024_G (
    .I0(\_n0002<23> ),
    .I1(\_n0002<31> ),
    .I2(CHOICE2538),
    .O(N199)
  );
  defparam Count_25_rt_461.INIT = 4'h2;
  LUT1 Count_25_rt_461 (
    .I0(\Count<25> ),
    .O(Count_25_rt)
  );
  defparam Count_7_rt_462.INIT = 4'h2;
  LUT1 Count_7_rt_462 (
    .I0(\Count<7> ),
    .O(Count_7_rt)
  );
  defparam Count_23_rt_463.INIT = 4'h2;
  LUT1 Count_23_rt_463 (
    .I0(\Count<23> ),
    .O(Count_23_rt)
  );
  defparam Count_31_rt_464.INIT = 4'h2;
  LUT1 Count_31_rt_464 (
    .I0(\Count<31> ),
    .O(Count_31_rt)
  );
  defparam Count_20_rt_465.INIT = 4'h2;
  LUT1 Count_20_rt_465 (
    .I0(\Count<20> ),
    .O(Count_20_rt)
  );
  defparam Count_26_rt_466.INIT = 4'h2;
  LUT1 Count_26_rt_466 (
    .I0(\Count<26> ),
    .O(Count_26_rt)
  );
  defparam Count_27_rt_467.INIT = 4'h2;
  LUT1 Count_27_rt_467 (
    .I0(\Count<27> ),
    .O(Count_27_rt)
  );
  defparam _n000097_G.INIT = 16'h0002;
  LUT4 _n000097_G (
    .I0(\_n0002<13> ),
    .I1(\_n0002<7> ),
    .I2(\_n0002<6> ),
    .I3(\_n0002<20> ),
    .O(N201)
  );
  defparam Count_11_rt_468.INIT = 4'h2;
  LUT1 Count_11_rt_468 (
    .I0(\Count<11> ),
    .O(Count_11_rt)
  );
  defparam _n0000128_G.INIT = 16'h1000;
  LUT4 _n0000128_G (
    .I0(\_n0002<1> ),
    .I1(\_n0002<14> ),
    .I2(\_n0002<8> ),
    .I3(N3),
    .O(N203)
  );
  defparam Count_30_rt_469.INIT = 4'h2;
  LUT1 Count_30_rt_469 (
    .I0(\Count<30> ),
    .O(Count_30_rt)
  );
  FDRE Count_0 (
    .D(N3),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<0> )
  );
  FDRE Count_1 (
    .D(\_n0002<1> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<1> )
  );
  FDRE Count_2 (
    .D(\_n0002<2> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<2> )
  );
  FDRE Count_3 (
    .D(\_n0002<3> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<3> )
  );
  FDRE Count_4 (
    .D(\_n0002<4> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<4> )
  );
  FDRE Count_5 (
    .D(\_n0002<5> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<5> )
  );
  FDRE Count_6 (
    .D(\_n0002<6> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<6> )
  );
  FDRE Count_7 (
    .D(\_n0002<7> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<7> )
  );
  FDRE Count_8 (
    .D(\_n0002<8> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<8> )
  );
  FDRE Count_9 (
    .D(\_n0002<9> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<9> )
  );
  FDRE Count_10 (
    .D(\_n0002<10> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<10> )
  );
  FDRE Count_11 (
    .D(\_n0002<11> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<11> )
  );
  FDRE Count_12 (
    .D(\_n0002<12> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<12> )
  );
  FDRE Count_13 (
    .D(\_n0002<13> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<13> )
  );
  FDRE Count_14 (
    .D(\_n0002<14> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<14> )
  );
  FDRE Count_15 (
    .D(\_n0002<15> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<15> )
  );
  FDRE Count_16 (
    .D(\_n0002<16> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<16> )
  );
  FDRE Count_17 (
    .D(\_n0002<17> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<17> )
  );
  FDRE Count_18 (
    .D(\_n0002<18> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<18> )
  );
  FDRE Count_19 (
    .D(\_n0002<19> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<19> )
  );
  FDRE Count_20 (
    .D(\_n0002<20> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<20> )
  );
  FDRE Count_21 (
    .D(\_n0002<21> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<21> )
  );
  FDRE Count_22 (
    .D(\_n0002<22> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<22> )
  );
  FDRE Count_23 (
    .D(\_n0002<23> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<23> )
  );
  FDRE Count_24 (
    .D(\_n0002<24> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<24> )
  );
  FDRE Count_25 (
    .D(\_n0002<25> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<25> )
  );
  FDRE Count_26 (
    .D(\_n0002<26> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<26> )
  );
  FDRE Count_27 (
    .D(\_n0002<27> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<27> )
  );
  FDRE Count_28 (
    .D(\_n0002<28> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<28> )
  );
  FDRE Count_29 (
    .D(\_n0002<29> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<29> )
  );
  FDRE Count_30 (
    .D(\_n0002<30> ),
    .R(_n0000),
    .CE(Enable),
    .C(Dclk),
    .Q(\Count<30> )
  );
  VCC XST_VCC (
    .P(N0)
  );
  GND XST_GND (
    .G(N1)
  );
  defparam \Oscillator_2__n0002<0>lut .INIT = 4'h1;
  LUT1 \Oscillator_2__n0002<0>lut  (
    .I0(\Count<0> ),
    .O(N3)
  );
  MUXCY \Oscillator_2__n0002<0>cy  (
    .CI(N1),
    .DI(N0),
    .S(N3),
    .O(\Oscillator_2__n0002<0>_cyo )
  );
  defparam Count_16_rt_470.INIT = 4'h2;
  LUT1 Count_16_rt_470 (
    .I0(\Count<16> ),
    .O(Count_16_rt)
  );
  MUXCY \Oscillator_2__n0002<1>cy  (
    .CI(\Oscillator_2__n0002<0>_cyo ),
    .DI(N1),
    .S(Count_1_rt),
    .O(\Oscillator_2__n0002<1>_cyo )
  );
  XORCY \Oscillator_2__n0002<1>_xor  (
    .CI(\Oscillator_2__n0002<0>_cyo ),
    .LI(Count_1_rt),
    .O(\_n0002<1> )
  );
  MUXCY \Oscillator_2__n0002<2>cy  (
    .CI(\Oscillator_2__n0002<1>_cyo ),
    .DI(N1),
    .S(Count_2_rt),
    .O(\Oscillator_2__n0002<2>_cyo )
  );
  XORCY \Oscillator_2__n0002<2>_xor  (
    .CI(\Oscillator_2__n0002<1>_cyo ),
    .LI(Count_2_rt),
    .O(\_n0002<2> )
  );
  MUXCY \Oscillator_2__n0002<3>cy  (
    .CI(\Oscillator_2__n0002<2>_cyo ),
    .DI(N1),
    .S(Count_3_rt),
    .O(\Oscillator_2__n0002<3>_cyo )
  );
  XORCY \Oscillator_2__n0002<3>_xor  (
    .CI(\Oscillator_2__n0002<2>_cyo ),
    .LI(Count_3_rt),
    .O(\_n0002<3> )
  );
  MUXCY \Oscillator_2__n0002<4>cy  (
    .CI(\Oscillator_2__n0002<3>_cyo ),
    .DI(N1),
    .S(Count_4_rt),
    .O(\Oscillator_2__n0002<4>_cyo )
  );
  XORCY \Oscillator_2__n0002<4>_xor  (
    .CI(\Oscillator_2__n0002<3>_cyo ),
    .LI(Count_4_rt),
    .O(\_n0002<4> )
  );
  MUXCY \Oscillator_2__n0002<5>cy  (
    .CI(\Oscillator_2__n0002<4>_cyo ),
    .DI(N1),
    .S(Count_5_rt),
    .O(\Oscillator_2__n0002<5>_cyo )
  );
  XORCY \Oscillator_2__n0002<5>_xor  (
    .CI(\Oscillator_2__n0002<4>_cyo ),
    .LI(Count_5_rt),
    .O(\_n0002<5> )
  );
  MUXCY \Oscillator_2__n0002<6>cy  (
    .CI(\Oscillator_2__n0002<5>_cyo ),
    .DI(N1),
    .S(Count_6_rt),
    .O(\Oscillator_2__n0002<6>_cyo )
  );
  XORCY \Oscillator_2__n0002<6>_xor  (
    .CI(\Oscillator_2__n0002<5>_cyo ),
    .LI(Count_6_rt),
    .O(\_n0002<6> )
  );
  MUXCY \Oscillator_2__n0002<7>cy  (
    .CI(\Oscillator_2__n0002<6>_cyo ),
    .DI(N1),
    .S(Count_7_rt),
    .O(\Oscillator_2__n0002<7>_cyo )
  );
  XORCY \Oscillator_2__n0002<7>_xor  (
    .CI(\Oscillator_2__n0002<6>_cyo ),
    .LI(Count_7_rt),
    .O(\_n0002<7> )
  );
  MUXCY \Oscillator_2__n0002<8>cy  (
    .CI(\Oscillator_2__n0002<7>_cyo ),
    .DI(N1),
    .S(Count_8_rt),
    .O(\Oscillator_2__n0002<8>_cyo )
  );
  XORCY \Oscillator_2__n0002<8>_xor  (
    .CI(\Oscillator_2__n0002<7>_cyo ),
    .LI(Count_8_rt),
    .O(\_n0002<8> )
  );
  MUXCY \Oscillator_2__n0002<9>cy  (
    .CI(\Oscillator_2__n0002<8>_cyo ),
    .DI(N1),
    .S(Count_9_rt),
    .O(\Oscillator_2__n0002<9>_cyo )
  );
  XORCY \Oscillator_2__n0002<9>_xor  (
    .CI(\Oscillator_2__n0002<8>_cyo ),
    .LI(Count_9_rt),
    .O(\_n0002<9> )
  );
  MUXCY \Oscillator_2__n0002<10>cy  (
    .CI(\Oscillator_2__n0002<9>_cyo ),
    .DI(N1),
    .S(Count_10_rt),
    .O(\Oscillator_2__n0002<10>_cyo )
  );
  XORCY \Oscillator_2__n0002<10>_xor  (
    .CI(\Oscillator_2__n0002<9>_cyo ),
    .LI(Count_10_rt),
    .O(\_n0002<10> )
  );
  MUXCY \Oscillator_2__n0002<11>cy  (
    .CI(\Oscillator_2__n0002<10>_cyo ),
    .DI(N1),
    .S(Count_11_rt),
    .O(\Oscillator_2__n0002<11>_cyo )
  );
  XORCY \Oscillator_2__n0002<11>_xor  (
    .CI(\Oscillator_2__n0002<10>_cyo ),
    .LI(Count_11_rt),
    .O(\_n0002<11> )
  );
  MUXCY \Oscillator_2__n0002<12>cy  (
    .CI(\Oscillator_2__n0002<11>_cyo ),
    .DI(N1),
    .S(Count_12_rt),
    .O(\Oscillator_2__n0002<12>_cyo )
  );
  XORCY \Oscillator_2__n0002<12>_xor  (
    .CI(\Oscillator_2__n0002<11>_cyo ),
    .LI(Count_12_rt),
    .O(\_n0002<12> )
  );
  MUXCY \Oscillator_2__n0002<13>cy  (
    .CI(\Oscillator_2__n0002<12>_cyo ),
    .DI(N1),
    .S(Count_13_rt),
    .O(\Oscillator_2__n0002<13>_cyo )
  );
  XORCY \Oscillator_2__n0002<13>_xor  (
    .CI(\Oscillator_2__n0002<12>_cyo ),
    .LI(Count_13_rt),
    .O(\_n0002<13> )
  );
  MUXCY \Oscillator_2__n0002<14>cy  (
    .CI(\Oscillator_2__n0002<13>_cyo ),
    .DI(N1),
    .S(Count_14_rt),
    .O(\Oscillator_2__n0002<14>_cyo )
  );
  XORCY \Oscillator_2__n0002<14>_xor  (
    .CI(\Oscillator_2__n0002<13>_cyo ),
    .LI(Count_14_rt),
    .O(\_n0002<14> )
  );
  MUXCY \Oscillator_2__n0002<15>cy  (
    .CI(\Oscillator_2__n0002<14>_cyo ),
    .DI(N1),
    .S(Count_15_rt),
    .O(\Oscillator_2__n0002<15>_cyo )
  );
  XORCY \Oscillator_2__n0002<15>_xor  (
    .CI(\Oscillator_2__n0002<14>_cyo ),
    .LI(Count_15_rt),
    .O(\_n0002<15> )
  );
  MUXCY \Oscillator_2__n0002<16>cy  (
    .CI(\Oscillator_2__n0002<15>_cyo ),
    .DI(N1),
    .S(Count_16_rt),
    .O(\Oscillator_2__n0002<16>_cyo )
  );
  XORCY \Oscillator_2__n0002<16>_xor  (
    .CI(\Oscillator_2__n0002<15>_cyo ),
    .LI(Count_16_rt),
    .O(\_n0002<16> )
  );
  MUXCY \Oscillator_2__n0002<17>cy  (
    .CI(\Oscillator_2__n0002<16>_cyo ),
    .DI(N1),
    .S(Count_17_rt),
    .O(\Oscillator_2__n0002<17>_cyo )
  );
  XORCY \Oscillator_2__n0002<17>_xor  (
    .CI(\Oscillator_2__n0002<16>_cyo ),
    .LI(Count_17_rt),
    .O(\_n0002<17> )
  );
  MUXCY \Oscillator_2__n0002<18>cy  (
    .CI(\Oscillator_2__n0002<17>_cyo ),
    .DI(N1),
    .S(Count_18_rt),
    .O(\Oscillator_2__n0002<18>_cyo )
  );
  XORCY \Oscillator_2__n0002<18>_xor  (
    .CI(\Oscillator_2__n0002<17>_cyo ),
    .LI(Count_18_rt),
    .O(\_n0002<18> )
  );
  MUXCY \Oscillator_2__n0002<19>cy  (
    .CI(\Oscillator_2__n0002<18>_cyo ),
    .DI(N1),
    .S(Count_19_rt),
    .O(\Oscillator_2__n0002<19>_cyo )
  );
  XORCY \Oscillator_2__n0002<19>_xor  (
    .CI(\Oscillator_2__n0002<18>_cyo ),
    .LI(Count_19_rt),
    .O(\_n0002<19> )
  );
  MUXCY \Oscillator_2__n0002<20>cy  (
    .CI(\Oscillator_2__n0002<19>_cyo ),
    .DI(N1),
    .S(Count_20_rt),
    .O(\Oscillator_2__n0002<20>_cyo )
  );
  XORCY \Oscillator_2__n0002<20>_xor  (
    .CI(\Oscillator_2__n0002<19>_cyo ),
    .LI(Count_20_rt),
    .O(\_n0002<20> )
  );
  MUXCY \Oscillator_2__n0002<21>cy  (
    .CI(\Oscillator_2__n0002<20>_cyo ),
    .DI(N1),
    .S(Count_21_rt),
    .O(\Oscillator_2__n0002<21>_cyo )
  );
  XORCY \Oscillator_2__n0002<21>_xor  (
    .CI(\Oscillator_2__n0002<20>_cyo ),
    .LI(Count_21_rt),
    .O(\_n0002<21> )
  );
  MUXCY \Oscillator_2__n0002<22>cy  (
    .CI(\Oscillator_2__n0002<21>_cyo ),
    .DI(N1),
    .S(Count_22_rt),
    .O(\Oscillator_2__n0002<22>_cyo )
  );
  XORCY \Oscillator_2__n0002<22>_xor  (
    .CI(\Oscillator_2__n0002<21>_cyo ),
    .LI(Count_22_rt),
    .O(\_n0002<22> )
  );
  MUXCY \Oscillator_2__n0002<23>cy  (
    .CI(\Oscillator_2__n0002<22>_cyo ),
    .DI(N1),
    .S(Count_23_rt),
    .O(\Oscillator_2__n0002<23>_cyo )
  );
  XORCY \Oscillator_2__n0002<23>_xor  (
    .CI(\Oscillator_2__n0002<22>_cyo ),
    .LI(Count_23_rt),
    .O(\_n0002<23> )
  );
  MUXCY \Oscillator_2__n0002<24>cy  (
    .CI(\Oscillator_2__n0002<23>_cyo ),
    .DI(N1),
    .S(Count_24_rt),
    .O(\Oscillator_2__n0002<24>_cyo )
  );
  XORCY \Oscillator_2__n0002<24>_xor  (
    .CI(\Oscillator_2__n0002<23>_cyo ),
    .LI(Count_24_rt),
    .O(\_n0002<24> )
  );
  MUXCY \Oscillator_2__n0002<25>cy  (
    .CI(\Oscillator_2__n0002<24>_cyo ),
    .DI(N1),
    .S(Count_25_rt),
    .O(\Oscillator_2__n0002<25>_cyo )
  );
  XORCY \Oscillator_2__n0002<25>_xor  (
    .CI(\Oscillator_2__n0002<24>_cyo ),
    .LI(Count_25_rt),
    .O(\_n0002<25> )
  );
  MUXCY \Oscillator_2__n0002<26>cy  (
    .CI(\Oscillator_2__n0002<25>_cyo ),
    .DI(N1),
    .S(Count_26_rt),
    .O(\Oscillator_2__n0002<26>_cyo )
  );
  XORCY \Oscillator_2__n0002<26>_xor  (
    .CI(\Oscillator_2__n0002<25>_cyo ),
    .LI(Count_26_rt),
    .O(\_n0002<26> )
  );
  MUXCY \Oscillator_2__n0002<27>cy  (
    .CI(\Oscillator_2__n0002<26>_cyo ),
    .DI(N1),
    .S(Count_27_rt),
    .O(\Oscillator_2__n0002<27>_cyo )
  );
  XORCY \Oscillator_2__n0002<27>_xor  (
    .CI(\Oscillator_2__n0002<26>_cyo ),
    .LI(Count_27_rt),
    .O(\_n0002<27> )
  );
  MUXCY \Oscillator_2__n0002<28>cy  (
    .CI(\Oscillator_2__n0002<27>_cyo ),
    .DI(N1),
    .S(Count_28_rt),
    .O(\Oscillator_2__n0002<28>_cyo )
  );
  XORCY \Oscillator_2__n0002<28>_xor  (
    .CI(\Oscillator_2__n0002<27>_cyo ),
    .LI(Count_28_rt),
    .O(\_n0002<28> )
  );
  MUXCY \Oscillator_2__n0002<29>cy  (
    .CI(\Oscillator_2__n0002<28>_cyo ),
    .DI(N1),
    .S(Count_29_rt),
    .O(\Oscillator_2__n0002<29>_cyo )
  );
  XORCY \Oscillator_2__n0002<29>_xor  (
    .CI(\Oscillator_2__n0002<28>_cyo ),
    .LI(Count_29_rt),
    .O(\_n0002<29> )
  );
  MUXCY \Oscillator_2__n0002<30>cy  (
    .CI(\Oscillator_2__n0002<29>_cyo ),
    .DI(N1),
    .S(Count_30_rt),
    .O(\Oscillator_2__n0002<30>_cyo )
  );
  XORCY \Oscillator_2__n0002<30>_xor  (
    .CI(\Oscillator_2__n0002<29>_cyo ),
    .LI(Count_30_rt),
    .O(\_n0002<30> )
  );
  defparam Count_14_rt_471.INIT = 4'h2;
  LUT1 Count_14_rt_471 (
    .I0(\Count<14> ),
    .O(Count_14_rt)
  );
  defparam _n000068.INIT = 16'h4000;
  LUT4 _n000068 (
    .I0(\_old_Count_122<25> ),
    .I1(CHOICE2546),
    .I2(CHOICE2541),
    .I3(CHOICE2550),
    .O(CHOICE2553)
  );
  defparam Count_1_rt_472.INIT = 4'h2;
  LUT1 Count_1_rt_472 (
    .I0(\Count<1> ),
    .O(Count_1_rt)
  );
  defparam Count_8_rt_473.INIT = 4'h2;
  LUT1 Count_8_rt_473 (
    .I0(\Count<8> ),
    .O(Count_8_rt)
  );
  defparam Count_10_rt_474.INIT = 4'h2;
  LUT1 Count_10_rt_474 (
    .I0(\Count<10> ),
    .O(Count_10_rt)
  );
  defparam Count_6_rt_475.INIT = 4'h2;
  LUT1 Count_6_rt_475 (
    .I0(\Count<6> ),
    .O(Count_6_rt)
  );
  defparam Count_12_rt_476.INIT = 4'h2;
  LUT1 Count_12_rt_476 (
    .I0(\Count<12> ),
    .O(Count_12_rt)
  );
  defparam Count_2_rt_477.INIT = 4'h2;
  LUT1 Count_2_rt_477 (
    .I0(\Count<2> ),
    .O(Count_2_rt)
  );
  defparam Count_4_rt_478.INIT = 4'h2;
  LUT1 Count_4_rt_478 (
    .I0(\Count<4> ),
    .O(Count_4_rt)
  );
  defparam _n0000108_G.INIT = 16'h0002;
  LUT4 _n0000108_G (
    .I0(CHOICE2562),
    .I1(\_n0002<28> ),
    .I2(\_n0002<27> ),
    .I3(\_n0002<26> ),
    .O(N205)
  );
  MUXF5 _n000012 (
    .I0(N188),
    .I1(N189),
    .S(Enable),
    .O(CHOICE2538)
  );
  defparam _n000012_F.INIT = 16'h1000;
  LUT4 _n000012_F (
    .I0(\Count<3> ),
    .I1(\Count<17> ),
    .I2(\Count<2> ),
    .I3(\Count<9> ),
    .O(N188)
  );
  MUXF5 _n0000160 (
    .I0(N190),
    .I1(N191),
    .S(Enable),
    .O(CHOICE2580)
  );
  defparam _n0000160_F.INIT = 16'h0002;
  LUT4 _n0000160_F (
    .I0(\Count<15> ),
    .I1(\Count<22> ),
    .I2(\Count<16> ),
    .I3(\Count<30> ),
    .O(N190)
  );
  MUXF5 _n0000140 (
    .I0(N192),
    .I1(N193),
    .S(Enable),
    .O(CHOICE2574)
  );
  defparam _n0000140_F.INIT = 8'h10;
  LUT3 _n0000140_F (
    .I0(\Count<21> ),
    .I1(\Count<29> ),
    .I2(CHOICE2571),
    .O(N192)
  );
  MUXF5 _n000048 (
    .I0(N194),
    .I1(N195),
    .S(Enable),
    .O(CHOICE2550)
  );
  defparam _n000048_F.INIT = 16'h8000;
  LUT4 _n000048_F (
    .I0(\Count<4> ),
    .I1(\Count<5> ),
    .I2(\Count<12> ),
    .I3(\Count<19> ),
    .O(N194)
  );
  MUXF5 _n000041 (
    .I0(N196),
    .I1(N197),
    .S(Enable),
    .O(CHOICE2546)
  );
  defparam _n000041_F.INIT = 16'h1000;
  LUT4 _n000041_F (
    .I0(\Count<11> ),
    .I1(\Count<24> ),
    .I2(\Count<10> ),
    .I3(\Count<18> ),
    .O(N196)
  );
  MUXF5 _n000024 (
    .I0(N198),
    .I1(N199),
    .S(Enable),
    .O(CHOICE2541)
  );
  defparam _n000024_F.INIT = 8'h10;
  LUT3 _n000024_F (
    .I0(\Count<23> ),
    .I1(\Count<31> ),
    .I2(CHOICE2538),
    .O(N198)
  );
  MUXF5 _n000097 (
    .I0(N200),
    .I1(N201),
    .S(Enable),
    .O(CHOICE2562)
  );
  defparam _n000097_F.INIT = 16'h0002;
  LUT4 _n000097_F (
    .I0(\Count<13> ),
    .I1(\Count<6> ),
    .I2(\Count<7> ),
    .I3(\Count<20> ),
    .O(N200)
  );
  MUXF5 _n0000128 (
    .I0(N202),
    .I1(N203),
    .S(Enable),
    .O(CHOICE2571)
  );
  defparam _n0000128_F.INIT = 16'h1000;
  LUT4 _n0000128_F (
    .I0(\Count<1> ),
    .I1(\Count<14> ),
    .I2(\Count<0> ),
    .I3(\Count<8> ),
    .O(N202)
  );
  MUXF5 _n0000108 (
    .I0(N204),
    .I1(N205),
    .S(Enable),
    .O(CHOICE2565)
  );
  defparam _n0000108_F.INIT = 8'h20;
  LUT3 _n0000108_F (
    .I0(CHOICE2562),
    .I1(\Count<28> ),
    .I2(N186),
    .O(N204)
  );
endmodule

module Monostable_5 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire N0;
  wire \Count<0> ;
  wire \Count<31> ;
  wire \Count<30> ;
  wire \Count<24> ;
  wire \Count<29> ;
  wire \Count<23> ;
  wire \Count<28> ;
  wire \Count<22> ;
  wire \Count<27> ;
  wire \Count<21> ;
  wire \Count<26> ;
  wire \Count<20> ;
  wire \Count<25> ;
  wire \Count<14> ;
  wire \Count<19> ;
  wire \Count<13> ;
  wire \Count<18> ;
  wire \Count<12> ;
  wire \Count<17> ;
  wire \Count<11> ;
  wire \Count<16> ;
  wire \Count<10> ;
  wire \Count<15> ;
  wire \Count<4> ;
  wire \Count<9> ;
  wire \Count<3> ;
  wire \Count<8> ;
  wire \Count<2> ;
  wire \Count<7> ;
  wire \Count<1> ;
  wire \Count<6> ;
  wire \Count<5> ;
  wire \Count__n0000<2> ;
  wire CHOICE1893;
  wire \Count__n0000<3> ;
  wire \Count__n0000<1> ;
  wire \Count__n0000<4> ;
  wire \Count__n0000<5> ;
  wire \Count__n0000<6> ;
  wire \Count__n0000<7> ;
  wire \Count__n0000<8> ;
  wire \Count__n0000<9> ;
  wire \Count__n0000<10> ;
  wire \Count__n0000<11> ;
  wire \Count__n0000<12> ;
  wire \Count__n0000<13> ;
  wire \Count__n0000<14> ;
  wire \Count__n0000<15> ;
  wire \Count__n0000<16> ;
  wire \Count__n0000<17> ;
  wire \Count__n0000<18> ;
  wire \Count__n0000<19> ;
  wire \Count__n0000<20> ;
  wire \Count__n0000<21> ;
  wire \Count__n0000<22> ;
  wire \Count__n0000<23> ;
  wire \Count__n0000<24> ;
  wire \Count__n0000<25> ;
  wire \Count__n0000<26> ;
  wire \Count__n0000<27> ;
  wire \Count__n0000<28> ;
  wire \Count__n0000<29> ;
  wire \Count__n0000<30> ;
  wire \Count__n0000<31> ;
  wire N1;
  wire \Monostable_5_Count__n0000<30>_cyo ;
  wire N3;
  wire \Monostable_5_Count__n0000<0>_cyo ;
  wire \Monostable_5_Count__n0000<1>_cyo ;
  wire \Monostable_5_Count__n0000<2>_cyo ;
  wire \Monostable_5_Count__n0000<3>_cyo ;
  wire \Monostable_5_Count__n0000<4>_cyo ;
  wire \Monostable_5_Count__n0000<5>_cyo ;
  wire \Monostable_5_Count__n0000<6>_cyo ;
  wire \Monostable_5_Count__n0000<7>_cyo ;
  wire \Monostable_5_Count__n0000<8>_cyo ;
  wire \Monostable_5_Count__n0000<9>_cyo ;
  wire \Monostable_5_Count__n0000<10>_cyo ;
  wire \Monostable_5_Count__n0000<11>_cyo ;
  wire \Monostable_5_Count__n0000<12>_cyo ;
  wire \Monostable_5_Count__n0000<13>_cyo ;
  wire \Monostable_5_Count__n0000<14>_cyo ;
  wire \Monostable_5_Count__n0000<15>_cyo ;
  wire \Monostable_5_Count__n0000<16>_cyo ;
  wire \Monostable_5_Count__n0000<17>_cyo ;
  wire \Monostable_5_Count__n0000<18>_cyo ;
  wire \Monostable_5_Count__n0000<19>_cyo ;
  wire \Monostable_5_Count__n0000<20>_cyo ;
  wire \Monostable_5_Count__n0000<21>_cyo ;
  wire \Monostable_5_Count__n0000<22>_cyo ;
  wire \Monostable_5_Count__n0000<23>_cyo ;
  wire \Monostable_5_Count__n0000<24>_cyo ;
  wire \Monostable_5_Count__n0000<25>_cyo ;
  wire \Monostable_5_Count__n0000<26>_cyo ;
  wire \Monostable_5_Count__n0000<27>_cyo ;
  wire \Monostable_5_Count__n0000<28>_cyo ;
  wire \Monostable_5_Count__n0000<29>_cyo ;
  wire N7;
  wire N31;
  wire CHOICE2000;
  wire CHOICE2003;
  wire CHOICE1898;
  wire CHOICE2025;
  wire CHOICE2018;
  wire CHOICE2008;
  wire CHOICE2032;
  wire Count_1_rt;
  wire Count_2_rt;
  wire Count_3_rt;
  wire Count_4_rt;
  wire Count_5_rt;
  wire Count_6_rt;
  wire Count_7_rt;
  wire Count_8_rt;
  wire Count_9_rt;
  wire Count_10_rt;
  wire Count_11_rt;
  wire Count_12_rt;
  wire Count_13_rt;
  wire Count_14_rt;
  wire Count_15_rt;
  wire Count_16_rt;
  wire Count_17_rt;
  wire Count_18_rt;
  wire Count_19_rt;
  wire Count_20_rt;
  wire Count_21_rt;
  wire Count_22_rt;
  wire Count_23_rt;
  wire Count_24_rt;
  wire Count_25_rt;
  wire Count_26_rt;
  wire Count_27_rt;
  wire Count_28_rt;
  wire Count_29_rt;
  wire Count_30_rt;
  wire Count_31_rt;
  GND XST_GND (
    .G(N0)
  );
  defparam _n0000511.INIT = 16'hFF7F;
  LUT4 _n0000511 (
    .I0(\Count<16> ),
    .I1(\Count<6> ),
    .I2(\Count<17> ),
    .I3(\Count<26> ),
    .O(CHOICE2000)
  );
  FDR Count_30 (
    .D(\Count__n0000<30> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<30> )
  );
  FDSE Out_479 (
    .D(N0),
    .S(In),
    .CE(_n0000),
    .C(Dclk),
    .Q(Out)
  );
  FDR Count_31 (
    .D(\Count__n0000<31> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<31> )
  );
  XORCY \Monostable_5_Count__n0000<31>_xor  (
    .CI(\Monostable_5_Count__n0000<30>_cyo ),
    .LI(Count_31_rt),
    .O(\Count__n0000<31> )
  );
  FDR Count_0 (
    .D(N3),
    .R(In),
    .C(Dclk),
    .Q(\Count<0> )
  );
  FDR Count_1 (
    .D(\Count__n0000<1> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<1> )
  );
  FDR Count_2 (
    .D(\Count__n0000<2> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<2> )
  );
  FDR Count_3 (
    .D(\Count__n0000<3> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<3> )
  );
  FDR Count_4 (
    .D(\Count__n0000<4> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<4> )
  );
  FDR Count_5 (
    .D(\Count__n0000<5> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<5> )
  );
  FDR Count_6 (
    .D(\Count__n0000<6> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<6> )
  );
  FDR Count_7 (
    .D(\Count__n0000<7> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<7> )
  );
  FDR Count_8 (
    .D(\Count__n0000<8> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<8> )
  );
  FDR Count_9 (
    .D(\Count__n0000<9> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<9> )
  );
  FDR Count_10 (
    .D(\Count__n0000<10> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<10> )
  );
  FDR Count_11 (
    .D(\Count__n0000<11> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<11> )
  );
  FDR Count_12 (
    .D(\Count__n0000<12> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<12> )
  );
  FDR Count_13 (
    .D(\Count__n0000<13> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<13> )
  );
  FDR Count_14 (
    .D(\Count__n0000<14> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<14> )
  );
  FDR Count_15 (
    .D(\Count__n0000<15> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<15> )
  );
  FDR Count_16 (
    .D(\Count__n0000<16> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<16> )
  );
  FDR Count_17 (
    .D(\Count__n0000<17> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<17> )
  );
  FDR Count_18 (
    .D(\Count__n0000<18> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<18> )
  );
  FDR Count_19 (
    .D(\Count__n0000<19> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<19> )
  );
  FDR Count_20 (
    .D(\Count__n0000<20> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<20> )
  );
  FDR Count_21 (
    .D(\Count__n0000<21> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<21> )
  );
  FDR Count_22 (
    .D(\Count__n0000<22> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<22> )
  );
  FDR Count_23 (
    .D(\Count__n0000<23> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<23> )
  );
  FDR Count_24 (
    .D(\Count__n0000<24> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<24> )
  );
  FDR Count_25 (
    .D(\Count__n0000<25> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<25> )
  );
  FDR Count_26 (
    .D(\Count__n0000<26> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<26> )
  );
  FDR Count_27 (
    .D(\Count__n0000<27> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<27> )
  );
  FDR Count_28 (
    .D(\Count__n0000<28> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<28> )
  );
  FDR Count_29 (
    .D(\Count__n0000<29> ),
    .R(In),
    .C(Dclk),
    .Q(\Count<29> )
  );
  VCC XST_VCC (
    .P(N1)
  );
  defparam \Monostable_5_Count__n0000<0>lut .INIT = 4'h1;
  LUT1 \Monostable_5_Count__n0000<0>lut  (
    .I0(\Count<0> ),
    .O(N3)
  );
  MUXCY \Monostable_5_Count__n0000<0>cy  (
    .CI(N0),
    .DI(N1),
    .S(N3),
    .O(\Monostable_5_Count__n0000<0>_cyo )
  );
  defparam _n0000126.INIT = 16'h0001;
  LUT4 _n0000126 (
    .I0(\Count<10> ),
    .I1(\Count<20> ),
    .I2(\Count<30> ),
    .I3(\Count<0> ),
    .O(CHOICE2025)
  );
  MUXCY \Monostable_5_Count__n0000<1>cy  (
    .CI(\Monostable_5_Count__n0000<0>_cyo ),
    .DI(N0),
    .S(Count_1_rt),
    .O(\Monostable_5_Count__n0000<1>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<1>_xor  (
    .CI(\Monostable_5_Count__n0000<0>_cyo ),
    .LI(Count_1_rt),
    .O(\Count__n0000<1> )
  );
  MUXCY \Monostable_5_Count__n0000<2>cy  (
    .CI(\Monostable_5_Count__n0000<1>_cyo ),
    .DI(N0),
    .S(Count_2_rt),
    .O(\Monostable_5_Count__n0000<2>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<2>_xor  (
    .CI(\Monostable_5_Count__n0000<1>_cyo ),
    .LI(Count_2_rt),
    .O(\Count__n0000<2> )
  );
  MUXCY \Monostable_5_Count__n0000<3>cy  (
    .CI(\Monostable_5_Count__n0000<2>_cyo ),
    .DI(N0),
    .S(Count_3_rt),
    .O(\Monostable_5_Count__n0000<3>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<3>_xor  (
    .CI(\Monostable_5_Count__n0000<2>_cyo ),
    .LI(Count_3_rt),
    .O(\Count__n0000<3> )
  );
  MUXCY \Monostable_5_Count__n0000<4>cy  (
    .CI(\Monostable_5_Count__n0000<3>_cyo ),
    .DI(N0),
    .S(Count_4_rt),
    .O(\Monostable_5_Count__n0000<4>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<4>_xor  (
    .CI(\Monostable_5_Count__n0000<3>_cyo ),
    .LI(Count_4_rt),
    .O(\Count__n0000<4> )
  );
  MUXCY \Monostable_5_Count__n0000<5>cy  (
    .CI(\Monostable_5_Count__n0000<4>_cyo ),
    .DI(N0),
    .S(Count_5_rt),
    .O(\Monostable_5_Count__n0000<5>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<5>_xor  (
    .CI(\Monostable_5_Count__n0000<4>_cyo ),
    .LI(Count_5_rt),
    .O(\Count__n0000<5> )
  );
  MUXCY \Monostable_5_Count__n0000<6>cy  (
    .CI(\Monostable_5_Count__n0000<5>_cyo ),
    .DI(N0),
    .S(Count_6_rt),
    .O(\Monostable_5_Count__n0000<6>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<6>_xor  (
    .CI(\Monostable_5_Count__n0000<5>_cyo ),
    .LI(Count_6_rt),
    .O(\Count__n0000<6> )
  );
  MUXCY \Monostable_5_Count__n0000<7>cy  (
    .CI(\Monostable_5_Count__n0000<6>_cyo ),
    .DI(N0),
    .S(Count_7_rt),
    .O(\Monostable_5_Count__n0000<7>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<7>_xor  (
    .CI(\Monostable_5_Count__n0000<6>_cyo ),
    .LI(Count_7_rt),
    .O(\Count__n0000<7> )
  );
  MUXCY \Monostable_5_Count__n0000<8>cy  (
    .CI(\Monostable_5_Count__n0000<7>_cyo ),
    .DI(N0),
    .S(Count_8_rt),
    .O(\Monostable_5_Count__n0000<8>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<8>_xor  (
    .CI(\Monostable_5_Count__n0000<7>_cyo ),
    .LI(Count_8_rt),
    .O(\Count__n0000<8> )
  );
  MUXCY \Monostable_5_Count__n0000<9>cy  (
    .CI(\Monostable_5_Count__n0000<8>_cyo ),
    .DI(N0),
    .S(Count_9_rt),
    .O(\Monostable_5_Count__n0000<9>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<9>_xor  (
    .CI(\Monostable_5_Count__n0000<8>_cyo ),
    .LI(Count_9_rt),
    .O(\Count__n0000<9> )
  );
  MUXCY \Monostable_5_Count__n0000<10>cy  (
    .CI(\Monostable_5_Count__n0000<9>_cyo ),
    .DI(N0),
    .S(Count_10_rt),
    .O(\Monostable_5_Count__n0000<10>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<10>_xor  (
    .CI(\Monostable_5_Count__n0000<9>_cyo ),
    .LI(Count_10_rt),
    .O(\Count__n0000<10> )
  );
  MUXCY \Monostable_5_Count__n0000<11>cy  (
    .CI(\Monostable_5_Count__n0000<10>_cyo ),
    .DI(N0),
    .S(Count_11_rt),
    .O(\Monostable_5_Count__n0000<11>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<11>_xor  (
    .CI(\Monostable_5_Count__n0000<10>_cyo ),
    .LI(Count_11_rt),
    .O(\Count__n0000<11> )
  );
  MUXCY \Monostable_5_Count__n0000<12>cy  (
    .CI(\Monostable_5_Count__n0000<11>_cyo ),
    .DI(N0),
    .S(Count_12_rt),
    .O(\Monostable_5_Count__n0000<12>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<12>_xor  (
    .CI(\Monostable_5_Count__n0000<11>_cyo ),
    .LI(Count_12_rt),
    .O(\Count__n0000<12> )
  );
  MUXCY \Monostable_5_Count__n0000<13>cy  (
    .CI(\Monostable_5_Count__n0000<12>_cyo ),
    .DI(N0),
    .S(Count_13_rt),
    .O(\Monostable_5_Count__n0000<13>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<13>_xor  (
    .CI(\Monostable_5_Count__n0000<12>_cyo ),
    .LI(Count_13_rt),
    .O(\Count__n0000<13> )
  );
  MUXCY \Monostable_5_Count__n0000<14>cy  (
    .CI(\Monostable_5_Count__n0000<13>_cyo ),
    .DI(N0),
    .S(Count_14_rt),
    .O(\Monostable_5_Count__n0000<14>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<14>_xor  (
    .CI(\Monostable_5_Count__n0000<13>_cyo ),
    .LI(Count_14_rt),
    .O(\Count__n0000<14> )
  );
  MUXCY \Monostable_5_Count__n0000<15>cy  (
    .CI(\Monostable_5_Count__n0000<14>_cyo ),
    .DI(N0),
    .S(Count_15_rt),
    .O(\Monostable_5_Count__n0000<15>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<15>_xor  (
    .CI(\Monostable_5_Count__n0000<14>_cyo ),
    .LI(Count_15_rt),
    .O(\Count__n0000<15> )
  );
  MUXCY \Monostable_5_Count__n0000<16>cy  (
    .CI(\Monostable_5_Count__n0000<15>_cyo ),
    .DI(N0),
    .S(Count_16_rt),
    .O(\Monostable_5_Count__n0000<16>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<16>_xor  (
    .CI(\Monostable_5_Count__n0000<15>_cyo ),
    .LI(Count_16_rt),
    .O(\Count__n0000<16> )
  );
  MUXCY \Monostable_5_Count__n0000<17>cy  (
    .CI(\Monostable_5_Count__n0000<16>_cyo ),
    .DI(N0),
    .S(Count_17_rt),
    .O(\Monostable_5_Count__n0000<17>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<17>_xor  (
    .CI(\Monostable_5_Count__n0000<16>_cyo ),
    .LI(Count_17_rt),
    .O(\Count__n0000<17> )
  );
  MUXCY \Monostable_5_Count__n0000<18>cy  (
    .CI(\Monostable_5_Count__n0000<17>_cyo ),
    .DI(N0),
    .S(Count_18_rt),
    .O(\Monostable_5_Count__n0000<18>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<18>_xor  (
    .CI(\Monostable_5_Count__n0000<17>_cyo ),
    .LI(Count_18_rt),
    .O(\Count__n0000<18> )
  );
  MUXCY \Monostable_5_Count__n0000<19>cy  (
    .CI(\Monostable_5_Count__n0000<18>_cyo ),
    .DI(N0),
    .S(Count_19_rt),
    .O(\Monostable_5_Count__n0000<19>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<19>_xor  (
    .CI(\Monostable_5_Count__n0000<18>_cyo ),
    .LI(Count_19_rt),
    .O(\Count__n0000<19> )
  );
  MUXCY \Monostable_5_Count__n0000<20>cy  (
    .CI(\Monostable_5_Count__n0000<19>_cyo ),
    .DI(N0),
    .S(Count_20_rt),
    .O(\Monostable_5_Count__n0000<20>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<20>_xor  (
    .CI(\Monostable_5_Count__n0000<19>_cyo ),
    .LI(Count_20_rt),
    .O(\Count__n0000<20> )
  );
  MUXCY \Monostable_5_Count__n0000<21>cy  (
    .CI(\Monostable_5_Count__n0000<20>_cyo ),
    .DI(N0),
    .S(Count_21_rt),
    .O(\Monostable_5_Count__n0000<21>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<21>_xor  (
    .CI(\Monostable_5_Count__n0000<20>_cyo ),
    .LI(Count_21_rt),
    .O(\Count__n0000<21> )
  );
  MUXCY \Monostable_5_Count__n0000<22>cy  (
    .CI(\Monostable_5_Count__n0000<21>_cyo ),
    .DI(N0),
    .S(Count_22_rt),
    .O(\Monostable_5_Count__n0000<22>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<22>_xor  (
    .CI(\Monostable_5_Count__n0000<21>_cyo ),
    .LI(Count_22_rt),
    .O(\Count__n0000<22> )
  );
  MUXCY \Monostable_5_Count__n0000<23>cy  (
    .CI(\Monostable_5_Count__n0000<22>_cyo ),
    .DI(N0),
    .S(Count_23_rt),
    .O(\Monostable_5_Count__n0000<23>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<23>_xor  (
    .CI(\Monostable_5_Count__n0000<22>_cyo ),
    .LI(Count_23_rt),
    .O(\Count__n0000<23> )
  );
  MUXCY \Monostable_5_Count__n0000<24>cy  (
    .CI(\Monostable_5_Count__n0000<23>_cyo ),
    .DI(N0),
    .S(Count_24_rt),
    .O(\Monostable_5_Count__n0000<24>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<24>_xor  (
    .CI(\Monostable_5_Count__n0000<23>_cyo ),
    .LI(Count_24_rt),
    .O(\Count__n0000<24> )
  );
  MUXCY \Monostable_5_Count__n0000<25>cy  (
    .CI(\Monostable_5_Count__n0000<24>_cyo ),
    .DI(N0),
    .S(Count_25_rt),
    .O(\Monostable_5_Count__n0000<25>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<25>_xor  (
    .CI(\Monostable_5_Count__n0000<24>_cyo ),
    .LI(Count_25_rt),
    .O(\Count__n0000<25> )
  );
  MUXCY \Monostable_5_Count__n0000<26>cy  (
    .CI(\Monostable_5_Count__n0000<25>_cyo ),
    .DI(N0),
    .S(Count_26_rt),
    .O(\Monostable_5_Count__n0000<26>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<26>_xor  (
    .CI(\Monostable_5_Count__n0000<25>_cyo ),
    .LI(Count_26_rt),
    .O(\Count__n0000<26> )
  );
  MUXCY \Monostable_5_Count__n0000<27>cy  (
    .CI(\Monostable_5_Count__n0000<26>_cyo ),
    .DI(N0),
    .S(Count_27_rt),
    .O(\Monostable_5_Count__n0000<27>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<27>_xor  (
    .CI(\Monostable_5_Count__n0000<26>_cyo ),
    .LI(Count_27_rt),
    .O(\Count__n0000<27> )
  );
  MUXCY \Monostable_5_Count__n0000<28>cy  (
    .CI(\Monostable_5_Count__n0000<27>_cyo ),
    .DI(N0),
    .S(Count_28_rt),
    .O(\Monostable_5_Count__n0000<28>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<28>_xor  (
    .CI(\Monostable_5_Count__n0000<27>_cyo ),
    .LI(Count_28_rt),
    .O(\Count__n0000<28> )
  );
  MUXCY \Monostable_5_Count__n0000<29>cy  (
    .CI(\Monostable_5_Count__n0000<28>_cyo ),
    .DI(N0),
    .S(Count_29_rt),
    .O(\Monostable_5_Count__n0000<29>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<29>_xor  (
    .CI(\Monostable_5_Count__n0000<28>_cyo ),
    .LI(Count_29_rt),
    .O(\Count__n0000<29> )
  );
  MUXCY \Monostable_5_Count__n0000<30>cy  (
    .CI(\Monostable_5_Count__n0000<29>_cyo ),
    .DI(N0),
    .S(Count_30_rt),
    .O(\Monostable_5_Count__n0000<30>_cyo )
  );
  XORCY \Monostable_5_Count__n0000<30>_xor  (
    .CI(\Monostable_5_Count__n0000<29>_cyo ),
    .LI(Count_30_rt),
    .O(\Count__n0000<30> )
  );
  defparam _n0000541.INIT = 16'hFFFE;
  LUT4 _n0000541 (
    .I0(CHOICE2000),
    .I1(CHOICE2003),
    .I2(CHOICE2008),
    .I3(N7),
    .O(N31)
  );
  defparam _n0000171.INIT = 16'h4000;
  LUT4 _n0000171 (
    .I0(N31),
    .I1(CHOICE2018),
    .I2(CHOICE2025),
    .I3(CHOICE2032),
    .O(_n0000)
  );
  defparam _n0000533.INIT = 16'hFFEF;
  LUT4 _n0000533 (
    .I0(\Count<24> ),
    .I1(\Count<3> ),
    .I2(\Count<14> ),
    .I3(\Count<23> ),
    .O(CHOICE2008)
  );
  defparam _n0000516.INIT = 16'hFFFE;
  LUT4 _n0000516 (
    .I0(\Count<4> ),
    .I1(\Count<15> ),
    .I2(\Count<25> ),
    .I3(\Count<5> ),
    .O(CHOICE2003)
  );
  defparam _n000097.INIT = 16'hFFEF;
  LUT4 _n000097 (
    .I0(\Count<28> ),
    .I1(\Count<7> ),
    .I2(\Count<18> ),
    .I3(\Count<27> ),
    .O(CHOICE1893)
  );
  defparam _n0000918.INIT = 16'hEFFF;
  LUT4 _n0000918 (
    .I0(\Count<29> ),
    .I1(\Count<8> ),
    .I2(\Count<19> ),
    .I3(\Count<9> ),
    .O(CHOICE1898)
  );
  defparam _n0000139.INIT = 16'h0001;
  LUT4 _n0000139 (
    .I0(\Count<11> ),
    .I1(\Count<21> ),
    .I2(\Count<31> ),
    .I3(\Count<1> ),
    .O(CHOICE2032)
  );
  defparam _n0000113.INIT = 16'h0001;
  LUT4 _n0000113 (
    .I0(\Count<12> ),
    .I1(\Count<22> ),
    .I2(\Count<2> ),
    .I3(\Count<13> ),
    .O(CHOICE2018)
  );
  defparam _n0000919.INIT = 4'hE;
  LUT2 _n0000919 (
    .I0(CHOICE1893),
    .I1(CHOICE1898),
    .O(N7)
  );
  defparam Count_1_rt_480.INIT = 4'h2;
  LUT1 Count_1_rt_480 (
    .I0(\Count<1> ),
    .O(Count_1_rt)
  );
  defparam Count_2_rt_481.INIT = 4'h2;
  LUT1 Count_2_rt_481 (
    .I0(\Count<2> ),
    .O(Count_2_rt)
  );
  defparam Count_3_rt_482.INIT = 4'h2;
  LUT1 Count_3_rt_482 (
    .I0(\Count<3> ),
    .O(Count_3_rt)
  );
  defparam Count_4_rt_483.INIT = 4'h2;
  LUT1 Count_4_rt_483 (
    .I0(\Count<4> ),
    .O(Count_4_rt)
  );
  defparam Count_5_rt_484.INIT = 4'h2;
  LUT1 Count_5_rt_484 (
    .I0(\Count<5> ),
    .O(Count_5_rt)
  );
  defparam Count_6_rt_485.INIT = 4'h2;
  LUT1 Count_6_rt_485 (
    .I0(\Count<6> ),
    .O(Count_6_rt)
  );
  defparam Count_7_rt_486.INIT = 4'h2;
  LUT1 Count_7_rt_486 (
    .I0(\Count<7> ),
    .O(Count_7_rt)
  );
  defparam Count_8_rt_487.INIT = 4'h2;
  LUT1 Count_8_rt_487 (
    .I0(\Count<8> ),
    .O(Count_8_rt)
  );
  defparam Count_9_rt_488.INIT = 4'h2;
  LUT1 Count_9_rt_488 (
    .I0(\Count<9> ),
    .O(Count_9_rt)
  );
  defparam Count_10_rt_489.INIT = 4'h2;
  LUT1 Count_10_rt_489 (
    .I0(\Count<10> ),
    .O(Count_10_rt)
  );
  defparam Count_11_rt_490.INIT = 4'h2;
  LUT1 Count_11_rt_490 (
    .I0(\Count<11> ),
    .O(Count_11_rt)
  );
  defparam Count_12_rt_491.INIT = 4'h2;
  LUT1 Count_12_rt_491 (
    .I0(\Count<12> ),
    .O(Count_12_rt)
  );
  defparam Count_13_rt_492.INIT = 4'h2;
  LUT1 Count_13_rt_492 (
    .I0(\Count<13> ),
    .O(Count_13_rt)
  );
  defparam Count_14_rt_493.INIT = 4'h2;
  LUT1 Count_14_rt_493 (
    .I0(\Count<14> ),
    .O(Count_14_rt)
  );
  defparam Count_15_rt_494.INIT = 4'h2;
  LUT1 Count_15_rt_494 (
    .I0(\Count<15> ),
    .O(Count_15_rt)
  );
  defparam Count_16_rt_495.INIT = 4'h2;
  LUT1 Count_16_rt_495 (
    .I0(\Count<16> ),
    .O(Count_16_rt)
  );
  defparam Count_17_rt_496.INIT = 4'h2;
  LUT1 Count_17_rt_496 (
    .I0(\Count<17> ),
    .O(Count_17_rt)
  );
  defparam Count_18_rt_497.INIT = 4'h2;
  LUT1 Count_18_rt_497 (
    .I0(\Count<18> ),
    .O(Count_18_rt)
  );
  defparam Count_19_rt_498.INIT = 4'h2;
  LUT1 Count_19_rt_498 (
    .I0(\Count<19> ),
    .O(Count_19_rt)
  );
  defparam Count_20_rt_499.INIT = 4'h2;
  LUT1 Count_20_rt_499 (
    .I0(\Count<20> ),
    .O(Count_20_rt)
  );
  defparam Count_21_rt_500.INIT = 4'h2;
  LUT1 Count_21_rt_500 (
    .I0(\Count<21> ),
    .O(Count_21_rt)
  );
  defparam Count_22_rt_501.INIT = 4'h2;
  LUT1 Count_22_rt_501 (
    .I0(\Count<22> ),
    .O(Count_22_rt)
  );
  defparam Count_23_rt_502.INIT = 4'h2;
  LUT1 Count_23_rt_502 (
    .I0(\Count<23> ),
    .O(Count_23_rt)
  );
  defparam Count_24_rt_503.INIT = 4'h2;
  LUT1 Count_24_rt_503 (
    .I0(\Count<24> ),
    .O(Count_24_rt)
  );
  defparam Count_25_rt_504.INIT = 4'h2;
  LUT1 Count_25_rt_504 (
    .I0(\Count<25> ),
    .O(Count_25_rt)
  );
  defparam Count_26_rt_505.INIT = 4'h2;
  LUT1 Count_26_rt_505 (
    .I0(\Count<26> ),
    .O(Count_26_rt)
  );
  defparam Count_27_rt_506.INIT = 4'h2;
  LUT1 Count_27_rt_506 (
    .I0(\Count<27> ),
    .O(Count_27_rt)
  );
  defparam Count_28_rt_507.INIT = 4'h2;
  LUT1 Count_28_rt_507 (
    .I0(\Count<28> ),
    .O(Count_28_rt)
  );
  defparam Count_29_rt_508.INIT = 4'h2;
  LUT1 Count_29_rt_508 (
    .I0(\Count<29> ),
    .O(Count_29_rt)
  );
  defparam Count_30_rt_509.INIT = 4'h2;
  LUT1 Count_30_rt_509 (
    .I0(\Count<30> ),
    .O(Count_30_rt)
  );
  defparam Count_31_rt_510.INIT = 4'h2;
  LUT1 Count_31_rt_510 (
    .I0(\Count<31> ),
    .O(Count_31_rt)
  );
endmodule

module PunchControl (
  bu2, dclk, ad1, ad2, ae1, ae2, af1, af2, ah1, ah2, bd1, bd2, be1, be2, bf1, bf2, ap2, ar1, ar2, as2, at2, au1, av2, bv1, ak1, ak2, al1, al2, am1, 
bh2, am2, an1, an2, bn2, bs2
);
  input bu2;
  input dclk;
  input ad1;
  input ad2;
  input ae1;
  input ae2;
  input af1;
  input af2;
  input ah1;
  input ah2;
  input bd1;
  input bd2;
  input be1;
  input be2;
  input bf1;
  input bf2;
  input ap2;
  input ar1;
  input ar2;
  input as2;
  input at2;
  input au1;
  input av2;
  output bv1;
  output ak1;
  output ak2;
  output al1;
  output al2;
  output am1;
  output bh2;
  output am2;
  output an1;
  output an2;
  output bn2;
  output bs2;
  wire pcf;
  wire NlwRenamedSig_OI_bh2;
  wire pun_set;
  wire _n0004;
  wire pun_done;
  wire pb_N0;
  wire pun_active;
  wire N1;
  wire ppc;
  wire pun_select;
  wire N0;
  wire pun;
  wire pun_flag;
  wire N4;
  wire N2;
  assign
    bh2 = NlwRenamedSig_OI_bh2;
  VCC XST_VCC (
    .P(N0)
  );
  GND XST_GND (
    .G(N1)
  );
  defparam pb_Aclr_INV1.INIT = 4'h4;
  LUT2 pb_Aclr_INV1 (
    .I0(at2),
    .I1(pun),
    .O(pb_N0)
  );
  FDC pb_3 (
    .D(af2),
    .CLR(pb_N0),
    .C(ppc),
    .Q(an1)
  );
  FDC pb_4 (
    .D(ae1),
    .CLR(pb_N0),
    .C(ppc),
    .Q(ak2)
  );
  FDC pb_2 (
    .D(af1),
    .CLR(pb_N0),
    .C(ppc),
    .Q(am1)
  );
  defparam io_bus_in_int_1.INIT = 4'h1;
  LUT1 io_bus_in_int_1 (
    .I0(pun_flag),
    .O(bs2)
  );
  defparam pun_select_511.INIT = 16'h8000;
  LUT4 pun_select_511 (
    .I0(bf2),
    .I1(bf1),
    .I2(be2),
    .I3(N2),
    .O(pun_select)
  );
  defparam pcf1.INIT = 8'hD5;
  LUT3 pcf1 (
    .I0(as2),
    .I1(ar1),
    .I2(pun_select),
    .O(pcf)
  );
  defparam bh21.INIT = 4'h1;
  LUT1 bh21 (
    .I0(pun_done),
    .O(NlwRenamedSig_OI_bh2)
  );
  FDC pb_5 (
    .D(ae2),
    .CLR(pb_N0),
    .C(ppc),
    .Q(al2)
  );
  FDC pb_0 (
    .D(ah1),
    .CLR(pb_N0),
    .C(ppc),
    .Q(ak1)
  );
  FDC_1 pun_flag_512 (
    .D(N0),
    .CLR(pcf),
    .C(pun_active),
    .Q(pun_flag)
  );
  defparam pun_set1.INIT = 16'h5D5F;
  LUT4 pun_set1 (
    .I0(au1),
    .I1(at2),
    .I2(pun_active),
    .I3(pun),
    .O(pun_set)
  );
  FDP pun_active_513 (
    .D(N1),
    .PRE(ppc),
    .C(pun_done),
    .Q(pun_active)
  );
  FDP_1 pun_514 (
    .D(pun_set),
    .PRE(NlwRenamedSig_OI_bh2),
    .C(av2),
    .Q(pun)
  );
  Monostable_5 e10 (
    .Dclk(dclk),
    .In(_n0004),
    .Out(pun_done)
  );
  defparam ppc2.INIT = 16'h8000;
  LUT4 ppc2 (
    .I0(ap2),
    .I1(bd1),
    .I2(bd2),
    .I3(N4),
    .O(ppc)
  );
  defparam io_bus_in_skip_1.INIT = 8'h80;
  LUT3 io_bus_in_skip_1 (
    .I0(pun_flag),
    .I1(pun_select),
    .I2(ar2),
    .O(bn2)
  );
  defparam ppc1.INIT = 16'h8000;
  LUT4 ppc1 (
    .I0(be1),
    .I1(be2),
    .I2(bf1),
    .I3(bf2),
    .O(N4)
  );
  FDC pb_1 (
    .D(ah2),
    .CLR(pb_N0),
    .C(ppc),
    .Q(al1)
  );
  defparam bv11.INIT = 4'h1;
  LUT1 bv11 (
    .I0(av2),
    .O(bv1)
  );
  FDC pb_7 (
    .D(ad2),
    .CLR(pb_N0),
    .C(ppc),
    .Q(an2)
  );
  FDC pb_6 (
    .D(ad1),
    .CLR(pb_N0),
    .C(ppc),
    .Q(am2)
  );
  defparam _n00041.INIT = 4'h1;
  LUT1 _n00041 (
    .I0(pun),
    .O(_n0004)
  );
  defparam pun_select_SW0.INIT = 8'h80;
  LUT3 pun_select_SW0 (
    .I0(be1),
    .I1(bd2),
    .I2(bd1),
    .O(N2)
  );
endmodule

module TTYTransmitter (
  ae1, ae2, af1, af2, ah1, ah2, bd2, be2, aj2, ak1, bf2, al2, am2, bh2, an1, an2, bj1, ap2, ar2, as1, bn2, as2, at2, au1, bp2, au2, bs2, aj1, ak2, al1
, bj2, bk2, ar1, bn1, bp1, av2, br2
);
  input ae1;
  input ae2;
  input af1;
  input af2;
  input ah1;
  input ah2;
  input bd2;
  input be2;
  input aj2;
  input ak1;
  input bf2;
  input al2;
  input am2;
  input bh2;
  input an1;
  input an2;
  input bj1;
  input ap2;
  input ar2;
  input as1;
  input bn2;
  input as2;
  input at2;
  input au1;
  input bp2;
  input au2;
  input bs2;
  output aj1;
  output ak2;
  output al1;
  output bj2;
  output bk2;
  output ar1;
  output bn1;
  output bp1;
  output av2;
  output br2;
  wire NlwRenamedSig_OI_aj1;
  wire NlwRenamedSig_OI_ak2;
  wire tto_shift;
  wire _n0016;
  wire \tto<11> ;
  wire \tto_set<7> ;
  wire N32;
  wire tcf;
  wire _n0007;
  wire N0;
  wire out_stop_2_N0;
  wire start_bit;
  wire line;
  wire tto_select;
  wire out_active;
  wire \out_stop<2> ;
  wire \tto_set<4> ;
  wire \tto<9> ;
  wire \tto<8> ;
  wire \tto_set<9> ;
  wire \tto<7> ;
  wire \tto<5> ;
  wire \tto_set<10> ;
  wire \tto_set<11> ;
  wire \tto<4> ;
  wire \tto_set<5> ;
  wire \tto_set<6> ;
  wire tpc;
  wire _n0003;
  wire \tto<10> ;
  wire \out_stop<1> ;
  wire \out_stop<0> ;
  wire teleprinter_flag;
  wire \tto_set<8> ;
  wire N111;
  wire CHOICE1836;
  assign
    aj1 = NlwRenamedSig_OI_aj1,
    ak2 = NlwRenamedSig_OI_ak2;
  defparam \tto_set<5>1 .INIT = 8'h80;
  LUT3 \tto_set<5>1  (
    .I0(tto_select),
    .I1(as1),
    .I2(ar2),
    .O(\tto_set<5> )
  );
  FDCP tto_3 (
    .D(N0),
    .CLR(be2),
    .PRE(tpc),
    .C(tto_shift),
    .Q(NlwRenamedSig_OI_ak2)
  );
  GND XST_GND (
    .G(N0)
  );
  defparam _n00161.INIT = 4'h7;
  LUT2 _n00161 (
    .I0(out_active),
    .I1(tto_shift),
    .O(_n0016)
  );
  defparam tto_skip_1.INIT = 8'h7F;
  LUT3 tto_skip_1 (
    .I0(tto_select),
    .I1(bh2),
    .I2(teleprinter_flag),
    .O(bj2)
  );
  defparam _n00451.INIT = 4'h1;
  LUT1 _n00451 (
    .I0(NlwRenamedSig_OI_ak2),
    .O(al1)
  );
  defparam _n0008.INIT = 16'h8000;
  LUT4 _n0008 (
    .I0(aj2),
    .I1(ah2),
    .I2(af2),
    .I3(N111),
    .O(tto_select)
  );
  defparam _n000710.INIT = 16'h8000;
  LUT4 _n000710 (
    .I0(NlwRenamedSig_OI_ak2),
    .I1(\tto<11> ),
    .I2(\tto<10> ),
    .I3(\tto<9> ),
    .O(CHOICE1836)
  );
  defparam tcf1.INIT = 8'hF8;
  LUT3 tcf1 (
    .I0(tto_select),
    .I1(bd2),
    .I2(be2),
    .O(tcf)
  );
  defparam start_bit1.INIT = 4'h8;
  LUT2 start_bit1 (
    .I0(bn2),
    .I1(ak1),
    .O(start_bit)
  );
  defparam _n000717_SW0.INIT = 16'h8000;
  LUT4 _n000717_SW0 (
    .I0(\tto<7> ),
    .I1(NlwRenamedSig_OI_aj1),
    .I2(\tto<5> ),
    .I3(\tto<4> ),
    .O(N32)
  );
  FDP out_stop_1 (
    .D(\out_stop<0> ),
    .PRE(out_stop_2_N0),
    .C(bp2),
    .Q(\out_stop<1> )
  );
  FDC out_active_515 (
    .D(_n0003),
    .CLR(be2),
    .C(bp2),
    .Q(out_active)
  );
  defparam _n00031.INIT = 16'h8F88;
  LUT4 _n00031 (
    .I0(bn2),
    .I1(ak1),
    .I2(_n0007),
    .I3(out_active),
    .O(_n0003)
  );
  FDC teleprinter_flag_516 (
    .D(_n0007),
    .CLR(tcf),
    .C(tto_shift),
    .Q(teleprinter_flag)
  );
  defparam \_AUX_90<0>1 .INIT = 4'h1;
  LUT1 \_AUX_90<0>1  (
    .I0(\out_stop<2> ),
    .O(bn1)
  );
  defparam bk21.INIT = 4'h1;
  LUT1 bk21 (
    .I0(teleprinter_flag),
    .O(bk2)
  );
  defparam av21.INIT = 4'h4;
  LUT2 av21 (
    .I0(line),
    .I1(out_active),
    .O(av2)
  );
  FDC line_517 (
    .D(\tto<11> ),
    .CLR(start_bit),
    .C(tto_shift),
    .Q(line)
  );
  FDCP tto_11 (
    .D(\tto<10> ),
    .CLR(be2),
    .PRE(\tto_set<11> ),
    .C(tto_shift),
    .Q(\tto<11> )
  );
  defparam out_stop_2_N01.INIT = 4'h1;
  LUT1 out_stop_2_N01 (
    .I0(tto_shift),
    .O(out_stop_2_N0)
  );
  FDCP tto_7 (
    .D(NlwRenamedSig_OI_aj1),
    .CLR(be2),
    .PRE(\tto_set<7> ),
    .C(tto_shift),
    .Q(\tto<7> )
  );
  FDCP tto_6 (
    .D(\tto<5> ),
    .CLR(be2),
    .PRE(\tto_set<6> ),
    .C(tto_shift),
    .Q(NlwRenamedSig_OI_aj1)
  );
  FDCP tto_5 (
    .D(\tto<4> ),
    .CLR(be2),
    .PRE(\tto_set<5> ),
    .C(tto_shift),
    .Q(\tto<5> )
  );
  FDCP tto_4 (
    .D(NlwRenamedSig_OI_ak2),
    .CLR(be2),
    .PRE(\tto_set<4> ),
    .C(tto_shift),
    .Q(\tto<4> )
  );
  FDCP tto_10 (
    .D(\tto<9> ),
    .CLR(be2),
    .PRE(\tto_set<10> ),
    .C(tto_shift),
    .Q(\tto<10> )
  );
  FDCP tto_9 (
    .D(\tto<8> ),
    .CLR(be2),
    .PRE(\tto_set<9> ),
    .C(tto_shift),
    .Q(\tto<9> )
  );
  FDP out_stop_0 (
    .D(out_active),
    .PRE(out_stop_2_N0),
    .C(bp2),
    .Q(\out_stop<0> )
  );
  FDCP tto_8 (
    .D(\tto<7> ),
    .CLR(be2),
    .PRE(\tto_set<8> ),
    .C(tto_shift),
    .Q(\tto<8> )
  );
  FDP out_stop_2 (
    .D(\out_stop<1> ),
    .PRE(out_stop_2_N0),
    .C(bp2),
    .Q(\out_stop<2> )
  );
  defparam tpc1.INIT = 4'h8;
  LUT2 tpc1 (
    .I0(tto_select),
    .I1(as1),
    .O(tpc)
  );
  FD tto_shift_518 (
    .D(_n0016),
    .C(bp2),
    .Q(tto_shift)
  );
  defparam \tto_set<4>1 .INIT = 8'h80;
  LUT3 \tto_set<4>1  (
    .I0(tto_select),
    .I1(as1),
    .I2(ap2),
    .O(\tto_set<4> )
  );
  defparam \tto_set<11>1 .INIT = 8'h80;
  LUT3 \tto_set<11>1  (
    .I0(tto_select),
    .I1(as1),
    .I2(au1),
    .O(\tto_set<11> )
  );
  defparam \tto_set<10>1 .INIT = 8'h80;
  LUT3 \tto_set<10>1  (
    .I0(tto_select),
    .I1(as1),
    .I2(at2),
    .O(\tto_set<10> )
  );
  defparam \tto_set<9>1 .INIT = 8'h80;
  LUT3 \tto_set<9>1  (
    .I0(tto_select),
    .I1(as1),
    .I2(as2),
    .O(\tto_set<9> )
  );
  defparam \tto_set<8>1 .INIT = 8'h80;
  LUT3 \tto_set<8>1  (
    .I0(tto_select),
    .I1(as1),
    .I2(au2),
    .O(\tto_set<8> )
  );
  defparam \tto_set<7>1 .INIT = 8'h80;
  LUT3 \tto_set<7>1  (
    .I0(tto_select),
    .I1(as1),
    .I2(am2),
    .O(\tto_set<7> )
  );
  defparam \tto_set<6>1 .INIT = 8'h80;
  LUT3 \tto_set<6>1  (
    .I0(tto_select),
    .I1(as1),
    .I2(al2),
    .O(\tto_set<6> )
  );
  defparam _n0008_SW0.INIT = 8'h80;
  LUT3 _n0008_SW0 (
    .I0(af1),
    .I1(ae2),
    .I2(ae1),
    .O(N111)
  );
  defparam _n000717.INIT = 16'h8000;
  LUT4 _n000717 (
    .I0(CHOICE1836),
    .I1(ah1),
    .I2(\tto<8> ),
    .I3(N32),
    .O(_n0007)
  );
endmodule

module DelayLine_7 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<100>__net63 ;
  wire N1;
  wire N0;
  wire \Mshreg_Bits<100>__net67 ;
  wire \Mshreg_Bits<100>__net72 ;
  wire \Mshreg_Bits<100>__net71 ;
  wire \Mshreg_Bits<100>__net69 ;
  wire \Mshreg_Bits<100>__net61 ;
  wire \Mshreg_Bits<100>__net65 ;
  wire \NLW_Mshreg_Bits<100>_srl_33_Q15_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<100>_srl_27_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<100>_srl_28_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<100>_srl_29_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<100>_srl_30_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<100>_srl_31_Q_UNCONNECTED ;
  wire \NLW_Mshreg_Bits<100>_srl_32_Q_UNCONNECTED ;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRLC16E \Mshreg_Bits<100>_srl_33  (
    .A0(N1),
    .A1(N0),
    .A2(N1),
    .A3(N1),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<100>__net71 ),
    .Q(\Mshreg_Bits<100>__net72 ),
    .Q15(\NLW_Mshreg_Bits<100>_srl_33_Q15_UNCONNECTED )
  );
  FDR Edge_519 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<100>_0  (
    .D(\Mshreg_Bits<100>__net72 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
  SRLC16E \Mshreg_Bits<100>_srl_27  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\NLW_Mshreg_Bits<100>_srl_27_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<100>__net61 )
  );
  SRLC16E \Mshreg_Bits<100>_srl_28  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<100>__net61 ),
    .Q(\NLW_Mshreg_Bits<100>_srl_28_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<100>__net63 )
  );
  SRLC16E \Mshreg_Bits<100>_srl_29  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<100>__net63 ),
    .Q(\NLW_Mshreg_Bits<100>_srl_29_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<100>__net65 )
  );
  SRLC16E \Mshreg_Bits<100>_srl_30  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<100>__net65 ),
    .Q(\NLW_Mshreg_Bits<100>_srl_30_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<100>__net67 )
  );
  SRLC16E \Mshreg_Bits<100>_srl_31  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<100>__net67 ),
    .Q(\NLW_Mshreg_Bits<100>_srl_31_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<100>__net69 )
  );
  SRLC16E \Mshreg_Bits<100>_srl_32  (
    .A0(N0),
    .A1(N0),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(\Mshreg_Bits<100>__net69 ),
    .Q(\NLW_Mshreg_Bits<100>_srl_32_Q_UNCONNECTED ),
    .Q15(\Mshreg_Bits<100>__net71 )
  );
endmodule

module CardReaderBuffer (
  dclk, ad2, ae1, ae2, ah1, be2, ak2, al2, bk2, ap2, bl2, bm2, ar2, as2, br1, bs1, bs2, bu1, af1, af2, ah2, aj2, bh2, am2, an2, bj2, bn2, bp2, au2, 
av2
);
  input dclk;
  input ad2;
  input ae1;
  input ae2;
  input ah1;
  input be2;
  input ak2;
  input al2;
  input bk2;
  input ap2;
  input bl2;
  input bm2;
  input ar2;
  input as2;
  input br1;
  input bs1;
  input bs2;
  output bu1;
  output af1;
  output af2;
  output ah2;
  output aj2;
  output bh2;
  output am2;
  output an2;
  output bj2;
  output bn2;
  output bp2;
  output au2;
  output av2;
  wire NlwRenamedSig_OI_bu1;
  wire \zone<4> ;
  wire zone_clear;
  wire \zone<10> ;
  wire \zone<11> ;
  wire \zone<1> ;
  wire \zone<9> ;
  wire N2;
  wire \zone<2> ;
  wire \zone<12> ;
  wire \zone<5> ;
  wire \zone<7> ;
  wire \zone<8> ;
  wire N01;
  wire \zone<6> ;
  wire \zone<3> ;
  wire N8;
  wire N6;
  wire N4;
  wire N81;
  assign
    bu1 = NlwRenamedSig_OI_bu1;
  defparam av21.INIT = 16'hAACF;
  LUT4 av21 (
    .I0(\zone<5> ),
    .I1(N81),
    .I2(bm2),
    .I3(ah1),
    .O(av2)
  );
  defparam av21_SW0.INIT = 4'hE;
  LUT2 av21_SW0 (
    .I0(\zone<12> ),
    .I1(\zone<10> ),
    .O(N81)
  );
  defparam bj2_520.INIT = 16'hAACF;
  LUT4 bj2_520 (
    .I0(\zone<8> ),
    .I1(N2),
    .I2(bm2),
    .I3(ah1),
    .O(bj2)
  );
  FDC zone_1 (
    .D(ak2),
    .CLR(zone_clear),
    .C(NlwRenamedSig_OI_bu1),
    .Q(\zone<1> )
  );
  defparam au21.INIT = 16'hAACF;
  LUT4 au21 (
    .I0(\zone<4> ),
    .I1(N6),
    .I2(bm2),
    .I3(ah1),
    .O(au2)
  );
  DelayLine_7 imd (
    .Dclk(dclk),
    .In(ad2),
    .Out(NlwRenamedSig_OI_bu1)
  );
  defparam bh2_521.INIT = 16'hAAEF;
  LUT4 bh2_521 (
    .I0(\zone<9> ),
    .I1(N4),
    .I2(bm2),
    .I3(ah1),
    .O(bh2)
  );
  defparam au21_SW0.INIT = 4'hE;
  LUT2 au21_SW0 (
    .I0(\zone<12> ),
    .I1(\zone<11> ),
    .O(N6)
  );
  defparam ah21.INIT = 4'hD;
  LUT2 ah21 (
    .I0(ah1),
    .I1(\zone<10> ),
    .O(ah2)
  );
  defparam bn2_SW0.INIT = 8'hFE;
  LUT3 bn2_SW0 (
    .I0(\zone<6> ),
    .I1(\zone<5> ),
    .I2(\zone<4> ),
    .O(N01)
  );
  defparam af21.INIT = 4'hD;
  LUT2 af21 (
    .I0(ah1),
    .I1(\zone<11> ),
    .O(af2)
  );
  FDC zone_12 (
    .D(ae2),
    .CLR(zone_clear),
    .C(NlwRenamedSig_OI_bu1),
    .Q(\zone<12> )
  );
  FDC zone_11 (
    .D(ae1),
    .CLR(zone_clear),
    .C(NlwRenamedSig_OI_bu1),
    .Q(\zone<11> )
  );
  FDC zone_10 (
    .D(al2),
    .CLR(zone_clear),
    .C(NlwRenamedSig_OI_bu1),
    .Q(\zone<10> )
  );
  FDC zone_9 (
    .D(bl2),
    .CLR(zone_clear),
    .C(NlwRenamedSig_OI_bu1),
    .Q(\zone<9> )
  );
  FDC zone_8 (
    .D(bk2),
    .CLR(zone_clear),
    .C(NlwRenamedSig_OI_bu1),
    .Q(\zone<8> )
  );
  FDC zone_7 (
    .D(br1),
    .CLR(zone_clear),
    .C(NlwRenamedSig_OI_bu1),
    .Q(\zone<7> )
  );
  FDC zone_6 (
    .D(bs1),
    .CLR(zone_clear),
    .C(NlwRenamedSig_OI_bu1),
    .Q(\zone<6> )
  );
  FDC zone_5 (
    .D(as2),
    .CLR(zone_clear),
    .C(NlwRenamedSig_OI_bu1),
    .Q(\zone<5> )
  );
  FDC zone_4 (
    .D(be2),
    .CLR(zone_clear),
    .C(NlwRenamedSig_OI_bu1),
    .Q(\zone<4> )
  );
  FDC zone_3 (
    .D(ap2),
    .CLR(zone_clear),
    .C(NlwRenamedSig_OI_bu1),
    .Q(\zone<3> )
  );
  FDC zone_2 (
    .D(ar2),
    .CLR(zone_clear),
    .C(NlwRenamedSig_OI_bu1),
    .Q(\zone<2> )
  );
  defparam an21.INIT = 4'hD;
  LUT2 an21 (
    .I0(ah1),
    .I1(\zone<3> ),
    .O(an2)
  );
  defparam af11.INIT = 4'hD;
  LUT2 af11 (
    .I0(ah1),
    .I1(\zone<12> ),
    .O(af1)
  );
  defparam bn2_522.INIT = 16'hAAEF;
  LUT4 bn2_522 (
    .I0(\zone<7> ),
    .I1(N01),
    .I2(bm2),
    .I3(ah1),
    .O(bn2)
  );
  defparam bp22.INIT = 16'hAACF;
  LUT4 bp22 (
    .I0(\zone<6> ),
    .I1(N8),
    .I2(bm2),
    .I3(ah1),
    .O(bp2)
  );
  defparam bp21.INIT = 4'hE;
  LUT2 bp21 (
    .I0(\zone<8> ),
    .I1(\zone<9> ),
    .O(N8)
  );
  defparam zone_clear1.INIT = 4'hD;
  LUT2 zone_clear1 (
    .I0(bs2),
    .I1(ad2),
    .O(zone_clear)
  );
  defparam am21.INIT = 4'hD;
  LUT2 am21 (
    .I0(ah1),
    .I1(\zone<2> ),
    .O(am2)
  );
  defparam bh2_SW0.INIT = 16'hFFFE;
  LUT4 bh2_SW0 (
    .I0(\zone<7> ),
    .I1(\zone<5> ),
    .I2(\zone<3> ),
    .I3(\zone<1> ),
    .O(N4)
  );
  defparam bj2_SW0.INIT = 16'hFFFE;
  LUT4 bj2_SW0 (
    .I0(\zone<7> ),
    .I1(\zone<6> ),
    .I2(\zone<3> ),
    .I3(\zone<2> ),
    .O(N2)
  );
  defparam aj21.INIT = 4'hD;
  LUT2 aj21 (
    .I0(ah1),
    .I1(\zone<1> ),
    .O(aj2)
  );
endmodule

module TTYReceiver (
  bu1, ad2, ae1, af1, ah1, ah2, bd1, bd2, aj1, aj2, bf2, al2, an1, bj2, ar1, bm2, av2, br1, br2, bu2, bv2, ae2, af2, be2, ak1, ak2, al1, am1, am2, bh2
, an2, ap2, ar2, bn2, as2, at2, au2, bs1, bt2
);
  input bu1;
  input ad2;
  input ae1;
  input af1;
  input ah1;
  input ah2;
  input bd1;
  input bd2;
  input aj1;
  input aj2;
  input bf2;
  input al2;
  input an1;
  input bj2;
  input ar1;
  input bm2;
  input av2;
  input br1;
  input br2;
  output bu2;
  output bv2;
  output ae2;
  output af2;
  output be2;
  output ak1;
  output ak2;
  output al1;
  output am1;
  output am2;
  output bh2;
  output an2;
  output ap2;
  output ar2;
  output bn2;
  output as2;
  output at2;
  output au2;
  output bs1;
  output bt2;
  wire \tti02<0> ;
  wire N14;
  wire NlwRenamedSig_OI_af2;
  wire tti_shift_;
  wire NlwRenamedSig_OI_be2;
  wire NlwRenamedSig_OI_ak1;
  wire \tti02<1> ;
  wire \clock_scale<0> ;
  wire \in_stop<2> ;
  wire \clock_scale__n0000<1> ;
  wire NlwRenamedSig_OI_bt2;
  wire tti_clock_in;
  wire tti_shift;
  wire in_last_unit;
  wire start_enable;
  wire \tti37<3> ;
  wire in_active;
  wire _n0017;
  wire \tti37<7> ;
  wire active_clock;
  wire clock_scale_in;
  wire \tti37<6> ;
  wire \tti37<5> ;
  wire preset_;
  wire keyboard_select;
  wire clr_flag;
  wire \in_stop<1> ;
  wire _n0006;
  wire reader_run;
  wire \tti37<4> ;
  wire N28;
  wire reader_run_N0;
  wire in_active_N0;
  wire spike_detector;
  wire in_last_unit_N0;
  wire \clock_scale<1> ;
  wire \clock_scale__n0000<2> ;
  wire \clock_scale__n0000<0> ;
  wire N141;
  wire N24;
  wire N181;
  wire N20;
  wire N22;
  wire N26;
  wire N30;
  wire N31;
  assign
    clock_scale_in = bu1,
    tti_clock_in = an1,
    af2 = NlwRenamedSig_OI_af2,
    be2 = NlwRenamedSig_OI_be2,
    ak1 = NlwRenamedSig_OI_ak1,
    bt2 = NlwRenamedSig_OI_bt2;
  defparam _n00061.INIT = 16'h1000;
  LUT4 _n00061 (
    .I0(in_active),
    .I1(in_last_unit),
    .I2(bm2),
    .I3(tti_clock_in),
    .O(_n0006)
  );
  defparam clock_scale_Madd__n0000__n00061.INIT = 4'h1;
  LUT1 clock_scale_Madd__n0000__n00061 (
    .I0(\clock_scale<0> ),
    .O(\clock_scale__n0000<0> )
  );
  defparam keyboard_select_SW5.INIT = 8'h80;
  LUT3_L keyboard_select_SW5 (
    .I0(\tti37<3> ),
    .I1(al2),
    .I2(ae1),
    .LO(N28)
  );
  FDP tti37_7 (
    .D(\tti37<6> ),
    .PRE(_n0006),
    .C(tti_shift),
    .Q(\tti37<7> )
  );
  defparam \clock_scale_Madd__n0000_Mxor_Result<1>_Result1 .INIT = 4'h6;
  LUT2 \clock_scale_Madd__n0000_Mxor_Result<1>_Result1  (
    .I0(\clock_scale<0> ),
    .I1(\clock_scale<1> ),
    .O(\clock_scale__n0000<1> )
  );
  defparam \tt_<0>1 .INIT = 8'h7F;
  LUT3 \tt_<0>1  (
    .I0(\tti02<0> ),
    .I1(keyboard_select),
    .I2(al2),
    .O(ak2)
  );
  defparam \tt_<1>1 .INIT = 8'h7F;
  LUT3 \tt_<1>1  (
    .I0(\tti02<1> ),
    .I1(keyboard_select),
    .I2(al2),
    .O(ar2)
  );
  defparam \tt_<2>1 .INIT = 8'h7F;
  LUT3 \tt_<2>1  (
    .I0(al2),
    .I1(NlwRenamedSig_OI_ak1),
    .I2(N30),
    .O(as2)
  );
  defparam \tt_<3>1 .INIT = 16'h7FFF;
  LUT4 \tt_<3>1  (
    .I0(af1),
    .I1(ah1),
    .I2(N141),
    .I3(N28),
    .O(al1)
  );
  defparam \tt_<4>1 .INIT = 16'h7FFF;
  LUT4 \tt_<4>1  (
    .I0(af1),
    .I1(ah1),
    .I2(N141),
    .I3(N26),
    .O(am1)
  );
  GND XST_GND (
    .G(clr_flag)
  );
  defparam \tt_<5>1 .INIT = 16'h7FFF;
  LUT4 \tt_<5>1  (
    .I0(af1),
    .I1(ah1),
    .I2(N141),
    .I3(N20),
    .O(ap2)
  );
  defparam _n00171.INIT = 4'h1;
  LUT1 _n00171 (
    .I0(\tti37<7> ),
    .O(_n0017)
  );
  defparam \tt_<7>1 .INIT = 16'h7FFF;
  LUT4 \tt_<7>1  (
    .I0(af1),
    .I1(ah1),
    .I2(N31),
    .I3(N181),
    .O(an2)
  );
  defparam in_active_Aclr_INV2.INIT = 4'hE;
  LUT2 in_active_Aclr_INV2 (
    .I0(bf2),
    .I1(N14),
    .O(in_active_N0)
  );
  defparam in_active_Aclr_INV1.INIT = 16'h4000;
  LUT4 in_active_Aclr_INV1 (
    .I0(bm2),
    .I1(clock_scale_in),
    .I2(in_active),
    .I3(spike_detector),
    .O(N14)
  );
  defparam reader_run_Aset_INV1.INIT = 4'h1;
  LUT1 reader_run_Aset_INV1 (
    .I0(av2),
    .O(reader_run_N0)
  );
  defparam active_clock1.INIT = 8'h4C;
  LUT3 active_clock1 (
    .I0(clock_scale_in),
    .I1(in_last_unit),
    .I2(in_active),
    .O(active_clock)
  );
  defparam preset_1.INIT = 16'hEFFF;
  LUT4 preset_1 (
    .I0(in_last_unit),
    .I1(in_active),
    .I2(bm2),
    .I3(tti_clock_in),
    .O(preset_)
  );
  defparam keyboard_select_523.INIT = 16'h8000;
  LUT4_D keyboard_select_523 (
    .I0(ah1),
    .I1(af1),
    .I2(ae1),
    .I3(N141),
    .LO(N30),
    .O(keyboard_select)
  );
  FDC in_last_unit_524 (
    .D(_n0017),
    .CLR(in_last_unit_N0),
    .C(tti_shift),
    .Q(in_last_unit)
  );
  FDE keyboard_flag (
    .D(\tti37<7> ),
    .CE(preset_),
    .C(tti_shift),
    .Q(NlwRenamedSig_OI_af2)
  );
  defparam tt_ac_clr_1.INIT = 16'h8000;
  LUT4 tt_ac_clr_1 (
    .I0(ah1),
    .I1(af1),
    .I2(ae1),
    .I3(N24),
    .O(NlwRenamedSig_OI_be2)
  );
  FDP tti37_3 (
    .D(aj2),
    .PRE(_n0006),
    .C(tti_shift),
    .Q(\tti37<3> )
  );
  defparam kcc_1.INIT = 4'h4;
  LUT2 kcc_1 (
    .I0(bf2),
    .I1(NlwRenamedSig_OI_be2),
    .O(ae2)
  );
  defparam tti_shift1.INIT = 4'h8;
  LUT2 tti_shift1 (
    .I0(in_active),
    .I1(clock_scale_in),
    .O(tti_shift)
  );
  FDP_1 reader_run_525 (
    .D(clr_flag),
    .PRE(reader_run_N0),
    .C(preset_),
    .Q(reader_run)
  );
  FDCP spike_detector_526 (
    .D(clr_flag),
    .CLR(bf2),
    .PRE(_n0006),
    .C(tti_shift_),
    .Q(spike_detector)
  );
  FDCP in_active_527 (
    .D(clr_flag),
    .CLR(in_active_N0),
    .PRE(_n0006),
    .C(active_clock),
    .Q(in_active)
  );
  defparam tti_shift_1.INIT = 4'h7;
  LUT2 tti_shift_1 (
    .I0(clock_scale_in),
    .I1(in_active),
    .O(tti_shift_)
  );
  defparam \clock_scale_Madd__n0000_Mxor_Result<2>_Result1 .INIT = 8'h6A;
  LUT3 \clock_scale_Madd__n0000_Mxor_Result<2>_Result1  (
    .I0(NlwRenamedSig_OI_bt2),
    .I1(\clock_scale<0> ),
    .I2(\clock_scale<1> ),
    .O(\clock_scale__n0000<2> )
  );
  defparam start_enable1.INIT = 4'h1;
  LUT2 start_enable1 (
    .I0(in_active),
    .I1(in_last_unit),
    .O(start_enable)
  );
  FDP tti02_2 (
    .D(\tti02<1> ),
    .PRE(_n0006),
    .C(tti_shift),
    .Q(NlwRenamedSig_OI_ak1)
  );
  FDP tti02_1 (
    .D(\tti02<0> ),
    .PRE(_n0006),
    .C(tti_shift),
    .Q(\tti02<1> )
  );
  FDP tti02_0 (
    .D(ar1),
    .PRE(_n0006),
    .C(tti_shift),
    .Q(\tti02<0> )
  );
  FDC in_stop_2 (
    .D(\in_stop<1> ),
    .CLR(_n0006),
    .C(clock_scale_in),
    .Q(\in_stop<2> )
  );
  FDC in_stop_1 (
    .D(in_active),
    .CLR(_n0006),
    .C(clock_scale_in),
    .Q(\in_stop<1> )
  );
  FDC clock_scale_1 (
    .D(\clock_scale__n0000<1> ),
    .CLR(start_enable),
    .C(tti_clock_in),
    .Q(\clock_scale<1> )
  );
  defparam \tt_<6>1 .INIT = 16'h7FFF;
  LUT4 \tt_<6>1  (
    .I0(af1),
    .I1(ah1),
    .I2(N141),
    .I3(N22),
    .O(at2)
  );
  FDP tti37_6 (
    .D(\tti37<5> ),
    .PRE(_n0006),
    .C(tti_shift),
    .Q(\tti37<6> )
  );
  defparam in_last_unit_Aclr_INV1.INIT = 4'h1;
  LUT1 in_last_unit_Aclr_INV1 (
    .I0(br2),
    .O(in_last_unit_N0)
  );
  defparam tti_skip_1.INIT = 8'h7F;
  LUT3 tti_skip_1 (
    .I0(bd2),
    .I1(NlwRenamedSig_OI_af2),
    .I2(keyboard_select),
    .O(bh2)
  );
  defparam \_AUX_85<0>1 .INIT = 4'h1;
  LUT1 \_AUX_85<0>1  (
    .I0(\in_stop<2> ),
    .O(bv2)
  );
  FDP tti37_4 (
    .D(\tti37<3> ),
    .PRE(_n0006),
    .C(tti_shift),
    .Q(\tti37<4> )
  );
  FDP tti37_5 (
    .D(\tti37<4> ),
    .PRE(_n0006),
    .C(tti_shift),
    .Q(\tti37<5> )
  );
  defparam am21.INIT = 4'h1;
  LUT1 am21 (
    .I0(bm2),
    .O(am2)
  );
  FDC clock_scale_2 (
    .D(\clock_scale__n0000<2> ),
    .CLR(start_enable),
    .C(tti_clock_in),
    .Q(NlwRenamedSig_OI_bt2)
  );
  defparam au21.INIT = 4'h1;
  LUT1 au21 (
    .I0(reader_run),
    .O(au2)
  );
  FDC clock_scale_0 (
    .D(\clock_scale__n0000<0> ),
    .CLR(start_enable),
    .C(tti_clock_in),
    .Q(\clock_scale<0> )
  );
  defparam keyboard_select_SW0.INIT = 8'h80;
  LUT3_D keyboard_select_SW0 (
    .I0(aj1),
    .I1(ah2),
    .I2(ad2),
    .LO(N31),
    .O(N141)
  );
  defparam tt_ac_clr_1_SW0.INIT = 16'h8000;
  LUT4_L tt_ac_clr_1_SW0 (
    .I0(bj2),
    .I1(aj1),
    .I2(ah2),
    .I3(ad2),
    .LO(N24)
  );
  defparam keyboard_select_SW2.INIT = 8'h80;
  LUT3 keyboard_select_SW2 (
    .I0(\tti37<7> ),
    .I1(al2),
    .I2(ae1),
    .O(N181)
  );
  defparam keyboard_select_SW3.INIT = 8'h80;
  LUT3_L keyboard_select_SW3 (
    .I0(\tti37<5> ),
    .I1(al2),
    .I2(ae1),
    .LO(N20)
  );
  defparam keyboard_select_SW4.INIT = 8'h80;
  LUT3_L keyboard_select_SW4 (
    .I0(\tti37<6> ),
    .I1(al2),
    .I2(ae1),
    .LO(N22)
  );
  defparam keyboard_select_SW1.INIT = 8'h80;
  LUT3_L keyboard_select_SW1 (
    .I0(\tti37<4> ),
    .I1(al2),
    .I2(ae1),
    .LO(N26)
  );
endmodule

module DelayLine_1_1 (
  Dclk, In, Out
);
  input Dclk;
  input In;
  output Out;
  wire _n0000;
  wire Edge;
  wire \Mshreg_Bits<15>__net5 ;
  wire N1;
  wire N0;
  defparam _n00001.INIT = 4'h8;
  LUT2 _n00001 (
    .I0(Edge),
    .I1(In),
    .O(_n0000)
  );
  SRL16E \Mshreg_Bits<15>_srl_2  (
    .A0(N0),
    .A1(N1),
    .A2(N0),
    .A3(N0),
    .CE(N0),
    .CLK(Dclk),
    .D(_n0000),
    .Q(\Mshreg_Bits<15>__net5 )
  );
  FDR Edge_528 (
    .D(N0),
    .R(In),
    .C(Dclk),
    .Q(Edge)
  );
  FDE \Mshreg_Bits<15>_0  (
    .D(\Mshreg_Bits<15>__net5 ),
    .CE(N0),
    .C(Dclk),
    .Q(Out)
  );
  GND XST_GND (
    .G(N1)
  );
  VCC XST_VCC (
    .P(N0)
  );
endmodule

module pdp8i (
  key_dp_, key_ss_, zone04_index, rd_hole1, rd_hole2, rd_hole3, rd_hole4, key_st_, rd_hole5, rd_hole6, rd_hole7, rd_hole8, cr_ready, d00, d01, d02, 
d03, d04, d05, d10, d06, d11, d07, d08, d09, key_ex_, zone10_index, zone05_index, s_feed_hole, in00, in01, in02, in03, in04, in05, in10, in06, in11, 
in07, in08, in09, dfsr0, mem_p, dfsr1, dfsr2, ifsr0, ifsr1, ifsr2, c_i_r, key_la_, dclk, zone11_index, zone06_index, skipb, lhs_, key_cont_, sync_pun
, index_markers, n3cycle, acclr, light_pen, rdr_feed_switch, eda0, eda1, brq, zone01_index, eda2, zone12_index, zone07_index, rx_data, mem00, mem01, 
mem02, mem03, mem04, mem10, mem05, mem11, mem06, mem07, power_ok_, mem08, mem09, mem_incr, zone02_index, zone08_index, sr00, sr01, sr02, sr03, sr04, 
sr10, sr05, key_stop_, sr11, sr06, sr07, b_r0_, sr08, sr09, d_in_, pun_feed_switch_, da00, da01, da02, da03, da04, da05, da10, da06, da11, da07, da08
, da09, zone03_index, zone09_index, power_clear_, key_si_, io_pc_load, line_in, irq, ca_incr_, mem_done_, strobe_, jmp_, ac07_, pen_up, pc00_, ac08_, 
ba, and_, bb, pc01_, ac09_, pc02_, jms_, pc03_, run_, bbreak, pc04_, b_dc_inst, b_mem_start, pc10_, pc05_, pc11_, pc06_, pc07_, brun_, btt_inst_, 
pc08_, bmb03_, reader_run_, pc09_, bmb04_, bmb05_, execute_, bmb06_, bmb07_, bmb08_, isz_, df0_, df1_, drum_down, dca_, df2_, binitialize_, clear_x_, 
clear_y_, x_axis, tad_, bstlr, y_axis, ba_, bb_, z_axis, defer_, cr_read, ea0, ea1, ea2, y_strobe, b_c_, mb_parity_odd, pwr, bwc_overflow, break_, 
ma00_, ma01_, ma02_, pen_left, x_strobe, ma03_, ma04_, mcbmb00_, ma05_, ma10_, mcbmb01_, ma06_, ma11_, mcbmb02_, ma07_, mcbmb03_, ma08_, mcbmb04_, 
ma09_, mcbmb10_, mcbmb05_, fetch_, mcbmb11_, mcbmb06_, mq00_, mcbmb07_, mq01_, bma00, mcbmb08_, bma01, bma02, bma03, bma04, mq02_, bma05, bma10, 
mcbmb09_, bma06, bma11, bma07, bma08, bma09, mq03_, mq04_, mq10_, mq05_, btp2, mq11_, mq06_, btp3, bmb00, b_mem_to_lsr, bmb01, bmb02, bmb03, bmb04, 
mq07_, bmb05, bmb10, bmb06, bmb11, bmb07, link_, bmb08, bmb09, mq08_, bts1, mq09_, bts3, drum_up, if0_, opr_, if1_, sc0_, if2_, sc1_, pen_down, 
current_address_, iot_, sc2_, feed_hole, mb00_, sc3_, mb01_, tx_data, pause_, sc4_, mb02_, biop1_, b_line_hold_, mb03_, biop2_, word_count_, ac00_, 
mb04_, ac01_, mb10_, mb05_, biop4_, ac02_, mb11_, mb06_, ac03_, pen_right, int_enable_, mb07_, ac04_, hole1, hole2, hole3, mb08_, hole4, ac05_, ac10_
, hole5, bac00, hole6, bac01, hole7, bac02, hole8, bac03, mb09_, bac04, ac06_, ac11_, bac05, bac10, bac06, bac11, bac07, badd_accepted_, bac08, bac09
);
  input key_dp_;
  input key_ss_;
  input zone04_index;
  input rd_hole1;
  input rd_hole2;
  input rd_hole3;
  input rd_hole4;
  input key_st_;
  input rd_hole5;
  input rd_hole6;
  input rd_hole7;
  input rd_hole8;
  input cr_ready;
  input d00;
  input d01;
  input d02;
  input d03;
  input d04;
  input d05;
  input d10;
  input d06;
  input d11;
  input d07;
  input d08;
  input d09;
  input key_ex_;
  input zone10_index;
  input zone05_index;
  input s_feed_hole;
  input in00;
  input in01;
  input in02;
  input in03;
  input in04;
  input in05;
  input in10;
  input in06;
  input in11;
  input in07;
  input in08;
  input in09;
  input dfsr0;
  input mem_p;
  input dfsr1;
  input dfsr2;
  input ifsr0;
  input ifsr1;
  input ifsr2;
  input c_i_r;
  input key_la_;
  input dclk;
  input zone11_index;
  input zone06_index;
  input skipb;
  input lhs_;
  input key_cont_;
  input sync_pun;
  input index_markers;
  input n3cycle;
  input acclr;
  input light_pen;
  input rdr_feed_switch;
  input eda0;
  input eda1;
  input brq;
  input zone01_index;
  input eda2;
  input zone12_index;
  input zone07_index;
  input rx_data;
  input mem00;
  input mem01;
  input mem02;
  input mem03;
  input mem04;
  input mem10;
  input mem05;
  input mem11;
  input mem06;
  input mem07;
  input power_ok_;
  input mem08;
  input mem09;
  input mem_incr;
  input zone02_index;
  input zone08_index;
  input sr00;
  input sr01;
  input sr02;
  input sr03;
  input sr04;
  input sr10;
  input sr05;
  input key_stop_;
  input sr11;
  input sr06;
  input sr07;
  input b_r0_;
  input sr08;
  input sr09;
  input d_in_;
  input pun_feed_switch_;
  input da00;
  input da01;
  input da02;
  input da03;
  input da04;
  input da05;
  input da10;
  input da06;
  input da11;
  input da07;
  input da08;
  input da09;
  input zone03_index;
  input zone09_index;
  input power_clear_;
  input key_si_;
  input io_pc_load;
  input line_in;
  input irq;
  input ca_incr_;
  inout mem_done_;
  inout strobe_;
  output jmp_;
  output ac07_;
  output pen_up;
  output pc00_;
  output ac08_;
  output ba;
  output and_;
  output bb;
  output pc01_;
  output ac09_;
  output pc02_;
  output jms_;
  output pc03_;
  output run_;
  output bbreak;
  output pc04_;
  output b_dc_inst;
  output b_mem_start;
  output pc10_;
  output pc05_;
  output pc11_;
  output pc06_;
  output pc07_;
  output brun_;
  output btt_inst_;
  output pc08_;
  output bmb03_;
  output reader_run_;
  output pc09_;
  output bmb04_;
  output bmb05_;
  output execute_;
  output bmb06_;
  output bmb07_;
  output bmb08_;
  output isz_;
  output df0_;
  output df1_;
  output drum_down;
  output dca_;
  output df2_;
  output binitialize_;
  output clear_x_;
  output clear_y_;
  output x_axis;
  output tad_;
  output bstlr;
  output y_axis;
  output ba_;
  output bb_;
  output z_axis;
  output defer_;
  output cr_read;
  output ea0;
  output ea1;
  output ea2;
  output y_strobe;
  output b_c_;
  output mb_parity_odd;
  output pwr;
  output bwc_overflow;
  output break_;
  output ma00_;
  output ma01_;
  output ma02_;
  output pen_left;
  output x_strobe;
  output ma03_;
  output ma04_;
  output mcbmb00_;
  output ma05_;
  output ma10_;
  output mcbmb01_;
  output ma06_;
  output ma11_;
  output mcbmb02_;
  output ma07_;
  output mcbmb03_;
  output ma08_;
  output mcbmb04_;
  output ma09_;
  output mcbmb10_;
  output mcbmb05_;
  output fetch_;
  output mcbmb11_;
  output mcbmb06_;
  output mq00_;
  output mcbmb07_;
  output mq01_;
  output bma00;
  output mcbmb08_;
  output bma01;
  output bma02;
  output bma03;
  output bma04;
  output mq02_;
  output bma05;
  output bma10;
  output mcbmb09_;
  output bma06;
  output bma11;
  output bma07;
  output bma08;
  output bma09;
  output mq03_;
  output mq04_;
  output mq10_;
  output mq05_;
  output btp2;
  output mq11_;
  output mq06_;
  output btp3;
  output bmb00;
  output b_mem_to_lsr;
  output bmb01;
  output bmb02;
  output bmb03;
  output bmb04;
  output mq07_;
  output bmb05;
  output bmb10;
  output bmb06;
  output bmb11;
  output bmb07;
  output link_;
  output bmb08;
  output bmb09;
  output mq08_;
  output bts1;
  output mq09_;
  output bts3;
  output drum_up;
  output if0_;
  output opr_;
  output if1_;
  output sc0_;
  output if2_;
  output sc1_;
  output pen_down;
  output current_address_;
  output iot_;
  output sc2_;
  output feed_hole;
  output mb00_;
  output sc3_;
  output mb01_;
  output tx_data;
  output pause_;
  output sc4_;
  output mb02_;
  output biop1_;
  output b_line_hold_;
  output mb03_;
  output biop2_;
  output word_count_;
  output ac00_;
  output mb04_;
  output ac01_;
  output mb10_;
  output mb05_;
  output biop4_;
  output ac02_;
  output mb11_;
  output mb06_;
  output ac03_;
  output pen_right;
  output int_enable_;
  output mb07_;
  output ac04_;
  output hole1;
  output hole2;
  output hole3;
  output mb08_;
  output hole4;
  output ac05_;
  output ac10_;
  output hole5;
  output bac00;
  output hole6;
  output bac01;
  output hole7;
  output bac02;
  output hole8;
  output bac03;
  output mb09_;
  output bac04;
  output ac06_;
  output ac11_;
  output bac05;
  output bac10;
  output bac06;
  output bac11;
  output bac07;
  output badd_accepted_;
  output bac08;
  output bac09;
  wire mem_done__OBUF;
  wire strobe__OBUF;
  wire jmp__OBUF;
  wire ac07__OBUF;
  wire pen_up_OBUF;
  wire key_dp__IBUF;
  wire key_ss__IBUF;
  wire zone04_index_IBUF;
  wire rd_hole1_IBUF;
  wire pc00__OBUF;
  wire rd_hole2_IBUF;
  wire ac08__OBUF;
  wire rd_hole3_IBUF;
  wire ba_OBUF;
  wire rd_hole4_IBUF;
  wire and__OBUF;
  wire key_st__IBUF;
  wire bb_OBUF;
  wire rd_hole5_IBUF;
  wire rd_hole6_IBUF;
  wire pc01__OBUF;
  wire rd_hole7_IBUF;
  wire ac09__OBUF;
  wire rd_hole8_IBUF;
  wire pc02__OBUF;
  wire jms__OBUF;
  wire pc03__OBUF;
  wire cr_ready_IBUF;
  wire pc04;
  wire bbreak_OBUF;
  wire pc04__OBUF;
  wire b_dc_inst_OBUF;
  wire b_mem_start_OBUF;
  wire pc10__OBUF;
  wire pc05__OBUF;
  wire pc11__OBUF;
  wire pc06__OBUF;
  wire pc07__OBUF;
  wire brun__OBUF;
  wire btt_inst__OBUF;
  wire d00_IBUF;
  wire pc08__OBUF;
  wire bmb03__OBUF;
  wire d01_IBUF;
  wire d02_IBUF;
  wire d03_IBUF;
  wire d04_IBUF;
  wire d05_IBUF;
  wire d10_IBUF;
  wire reader_run__OBUF;
  wire pc09__OBUF;
  wire bmb04__OBUF;
  wire d06_IBUF;
  wire d11_IBUF;
  wire d07_IBUF;
  wire d08_IBUF;
  wire d09_IBUF;
  wire bmb05__OBUF;
  wire execute__OBUF;
  wire bmb06__OBUF;
  wire bmb07__OBUF;
  wire key_ex__IBUF;
  wire zone10_index_IBUF;
  wire zone05_index_IBUF;
  wire bmb08__OBUF;
  wire s_feed_hole_IBUF;
  wire isz__OBUF;
  wire in00_IBUF;
  wire df0__OBUF;
  wire in01_IBUF;
  wire in02_IBUF;
  wire in03_IBUF;
  wire in04_IBUF;
  wire in05_IBUF;
  wire in10_IBUF;
  wire df1__OBUF;
  wire in06_IBUF;
  wire in11_IBUF;
  wire in07_IBUF;
  wire drum_down_OBUF;
  wire in08_IBUF;
  wire in09_IBUF;
  wire dca__OBUF;
  wire df2__OBUF;
  wire N35;
  wire clear_x__OBUF;
  wire clear_y__OBUF;
  wire dfsr0_IBUF;
  wire dfsr1_IBUF;
  wire dfsr2_IBUF;
  wire N55;
  wire tad__OBUF;
  wire ifsr0_IBUF;
  wire ifsr1_IBUF;
  wire ifsr2_IBUF;
  wire c_i_r_BUFGP;
  wire bstlr_OBUF;
  wire if_enable__;
  wire ba__OBUF;
  wire key_la__IBUF;
  wire dclk_BUFGP;
  wire bb__OBUF;
  wire zone11_index_IBUF;
  wire zone06_index_IBUF;
  wire skipb_IBUF;
  wire defer__OBUF;
  wire lhs__IBUF;
  wire cr_read_OBUF;
  wire key_cont__IBUF;
  wire ea0_OBUF;
  wire ea1_OBUF;
  wire ea2_OBUF;
  wire y_strobe_OBUF;
  wire c_;
  wire N521;
  wire sync_pun_BUFGP;
  wire index_markers_IBUF;
  wire n3cycle_IBUF;
  wire acclr_IBUF;
  wire light_pen_IBUF;
  wire pwr_OBUF;
  wire wc_overflow_;
  wire rdr_feed_switch_IBUF;
  wire eda0_IBUF;
  wire eda1_IBUF;
  wire brq_IBUF;
  wire zone01_index_IBUF;
  wire eda2_IBUF;
  wire zone12_index_IBUF;
  wire zone07_index_IBUF;
  wire N57;
  wire ma00__OBUF;
  wire rx_data_IBUF;
  wire ma01__OBUF;
  wire ma02__OBUF;
  wire mem00_IBUF;
  wire mem01_IBUF;
  wire pen_left_OBUF;
  wire mem02_IBUF;
  wire x_strobe_OBUF;
  wire mem03_IBUF;
  wire mem04_IBUF;
  wire ma03__OBUF;
  wire mem10_IBUF;
  wire mem05_IBUF;
  wire mem11_IBUF;
  wire mem06_IBUF;
  wire mem07_IBUF;
  wire power_ok__IBUF;
  wire mem08_IBUF;
  wire mem09_IBUF;
  wire ma04__OBUF;
  wire mcbmb00__OBUF;
  wire mem_incr_IBUF;
  wire ma05__OBUF;
  wire ma10__OBUF;
  wire mcbmb01__OBUF;
  wire ma06__OBUF;
  wire ma11__OBUF;
  wire mcbmb02__OBUF;
  wire ma07__OBUF;
  wire int_enable__N0;
  wire ma08__OBUF;
  wire N3980;
  wire ma09__OBUF;
  wire mcbmb10__OBUF;
  wire pc10;
  wire fetch__OBUF;
  wire zone02_index_IBUF;
  wire zone08_index_IBUF;
  wire mcbmb11__OBUF;
  wire N511;
  wire sr00_IBUF;
  wire sr01_IBUF;
  wire sr02_IBUF;
  wire sr03_IBUF;
  wire mq00__OBUF;
  wire sr04_IBUF;
  wire n__484;
  wire sr10_IBUF;
  wire sr05_IBUF;
  wire key_stop__IBUF;
  wire sr11_IBUF;
  wire sr06_IBUF;
  wire sr07_IBUF;
  wire b_r0__IBUF;
  wire sr08_IBUF;
  wire mq01__OBUF;
  wire ma00;
  wire sr09_IBUF;
  wire N44;
  wire ma01;
  wire ma02;
  wire ma03;
  wire ma04;
  wire mq02__OBUF;
  wire ma05;
  wire ma10;
  wire mcbmb09__OBUF;
  wire ma06;
  wire ma11;
  wire d_in__IBUF;
  wire ma07;
  wire ma08;
  wire ma09;
  wire mq03__OBUF;
  wire mq04__OBUF;
  wire pun_feed_switch__IBUF;
  wire mq10__OBUF;
  wire mq05__OBUF;
  wire N32;
  wire mq11__OBUF;
  wire mq06__OBUF;
  wire btp3_OBUF;
  wire mb00;
  wire b_mem_to_lsr_OBUF;
  wire da00_IBUF;
  wire mb01;
  wire da01_IBUF;
  wire mb02;
  wire da02_IBUF;
  wire mb03;
  wire da03_IBUF;
  wire mb04;
  wire mq07__OBUF;
  wire da04_IBUF;
  wire mb05;
  wire mb10;
  wire da05_IBUF;
  wire da10_IBUF;
  wire mb06;
  wire mb11;
  wire da06_IBUF;
  wire da11_IBUF;
  wire mb07;
  wire da07_IBUF;
  wire link__OBUF;
  wire mb08;
  wire da08_IBUF;
  wire mb09;
  wire mq08__OBUF;
  wire da09_IBUF;
  wire bts1_OBUF;
  wire mq09__OBUF;
  wire bts3_OBUF;
  wire drum_up_OBUF;
  wire if0__OBUF;
  wire opr__OBUF;
  wire if1__OBUF;
  wire sc0__OBUF;
  wire zone03_index_IBUF;
  wire zone09_index_IBUF;
  wire power_clear__IBUF;
  wire if2__OBUF;
  wire sc1__OBUF;
  wire pen_down_OBUF;
  wire current_address__OBUF;
  wire iot__OBUF;
  wire sc2__OBUF;
  wire feed_hole_OBUF;
  wire n__664;
  wire sc3__OBUF;
  wire key_si__IBUF;
  wire io_pc_load_IBUF;
  wire line_in_IBUF;
  wire _n0683;
  wire tx_data_OBUF;
  wire pause__OBUF;
  wire sc4__OBUF;
  wire n__483;
  wire biop1__OBUF;
  wire b_line_hold__OBUF;
  wire N39;
  wire biop2__OBUF;
  wire word_count__OBUF;
  wire ac00__OBUF;
  wire N41;
  wire ac01__OBUF;
  wire n__485;
  wire N43;
  wire biop4__OBUF;
  wire ac02__OBUF;
  wire n__132;
  wire N45;
  wire ac03__OBUF;
  wire irq_IBUF;
  wire pen_right_OBUF;
  wire int_enable__OBUF;
  wire N47;
  wire ac04__OBUF;
  wire hole1_OBUF;
  wire hole2_OBUF;
  wire ca_incr__IBUF;
  wire hole3_OBUF;
  wire N49;
  wire hole4_OBUF;
  wire ac05__OBUF;
  wire ac10__OBUF;
  wire hole5_OBUF;
  wire ac00;
  wire hole6_OBUF;
  wire ac01;
  wire hole7_OBUF;
  wire ac02;
  wire hole8_OBUF;
  wire ac03;
  wire N36;
  wire ac04;
  wire ac06__OBUF;
  wire ac11__OBUF;
  wire ac05;
  wire ac10;
  wire ac06;
  wire ac11;
  wire ac07;
  wire badd_accepted__OBUF;
  wire ac08;
  wire ac09;
  wire sc3;
  wire n__740;
  wire initialize;
  wire N51;
  wire ib_to_if;
  wire eae_run;
  wire n__667;
  wire _n0189;
  wire n__603;
  wire N3835;
  wire iop1;
  wire int_strobe_;
  wire N442;
  wire N12;
  wire b_set;
  wire \_n0794<1> ;
  wire \_n0798<1> ;
  wire N3836;
  wire \_n0800<1> ;
  wire \_n0804<1> ;
  wire iot632;
  wire iot634;
  wire N423;
  wire N1011;
  wire N50;
  wire b_execute;
  wire sf2;
  wire carry_insert_;
  wire data_enable;
  wire carry_out6_;
  wire N400;
  wire mq_load;
  wire if_to_sf;
  wire restart;
  wire df_enable_;
  wire pc11;
  wire \_n0795<1> ;
  wire n__739;
  wire n__4;
  wire N13;
  wire n__600;
  wire acbar_enable;
  wire N3827;
  wire _n0788;
  wire io_enable;
  wire pc_load;
  wire n__596;
  wire sf1;
  wire N3831;
  wire out_stop2_;
  wire ma_enable0_4;
  wire n__136;
  wire ts4;
  wire hs;
  wire mp_int_;
  wire _n0259;
  wire N3900;
  wire N420;
  wire N3965;
  wire tp4;
  wire N3961;
  wire tto_clock_;
  wire N4191;
  wire int_strobe;
  wire ub;
  wire uf;
  wire clock_ac_clr_;
  wire N3834;
  wire usf;
  wire s_;
  wire pc01;
  wire b_fetch;
  wire N3833;
  wire enable;
  wire bf_enable__;
  wire teleprinter_flag_;
  wire N2311;
  wire io_bus_in_int_;
  wire io_bus_in_skip_;
  wire pc03;
  wire _n0703;
  wire uint;
  wire N33;
  wire n__556;
  wire mb_load;
  wire ac_load;
  wire tt0_;
  wire tt1_;
  wire tt2_;
  wire tt3_;
  wire tt4_;
  wire tt5_;
  wire tto_skip_;
  wire tt6_;
  wire tt7_;
  wire N435;
  wire sc0;
  wire overflow;
  wire tti2;
  wire adder00;
  wire adder01;
  wire adder02;
  wire adder03;
  wire adder04;
  wire adder10;
  wire adder05;
  wire N3983;
  wire adder06;
  wire adder07;
  wire adder08;
  wire adder09;
  wire clock_iot;
  wire if_enable_;
  wire n__133;
  wire N491;
  wire \_n0807<1> ;
  wire \_n0797<1> ;
  wire N60;
  wire add_accepted_;
  wire \_n0798<0> ;
  wire _n0656;
  wire n__735;
  wire _n0707;
  wire \_n0797<0> ;
  wire _n0688;
  wire N324;
  wire int_ok;
  wire N418;
  wire pc00;
  wire tti_skip_;
  wire _n0061;
  wire mq10;
  wire _n0024;
  wire ma_enable5_11;
  wire N19;
  wire _n0706;
  wire N20;
  wire and_enable;
  wire pc09;
  wire N22;
  wire N23;
  wire N28;
  wire N4311;
  wire pc08;
  wire N29;
  wire N25;
  wire N26;
  wire pc07;
  wire N363;
  wire f_set;
  wire N3837;
  wire mftp0;
  wire mftp1;
  wire mftp2;
  wire N219;
  wire s_uf;
  wire N3829;
  wire n__722;
  wire mfts1;
  wire mfts2;
  wire n__741;
  wire sc_enable;
  wire n__123;
  wire N347;
  wire defer;
  wire \_n0806<1> ;
  wire clock1;
  wire _n0742;
  wire N4;
  wire N3838;
  wire sf0;
  wire brk_rqst;
  wire eae_tg;
  wire mq_enable;
  wire \_n0807<0> ;
  wire run_N0;
  wire tt_ac_clr_;
  wire sc_load;
  wire double_right_rotate;
  wire \_n0791<1> ;
  wire N4055;
  wire n__737;
  wire b_set_;
  wire N110;
  wire N440;
  wire c_set_;
  wire \_n0806<0> ;
  wire N3832;
  wire N56;
  wire rdr_run_;
  wire N168;
  wire in_stop_2_;
  wire n__661;
  wire n__260;
  wire N398;
  wire N53;
  wire break;
  wire brk_sync;
  wire n__666;
  wire pc06;
  wire N429;
  wire enable_;
  wire N52;
  wire clock_p4;
  wire mq03;
  wire sc1;
  wire link;
  wire N61;
  wire regbus00;
  wire regbus01;
  wire regbus02;
  wire regbus03;
  wire regbus04;
  wire regbus05;
  wire regbus10;
  wire regbus06;
  wire regbus11;
  wire regbus07;
  wire regbus08;
  wire clock;
  wire regbus09;
  wire _n0070;
  wire sr_enable;
  wire tti_data;
  wire pen_strobe;
  wire d_set;
  wire clock_enable_;
  wire load_counter;
  wire i_m_d;
  wire n__442;
  wire _n0233;
  wire stop_complete;
  wire mq05;
  wire n__748;
  wire _n0761;
  wire _n0260;
  wire mq06;
  wire io_bus_in00_;
  wire io_bus_in01_;
  wire n__605;
  wire io_bus_in02_;
  wire N146;
  wire io_bus_in03_;
  wire io_bus_in04_;
  wire io_bus_in10_;
  wire io_bus_in05_;
  wire io_bus_in11_;
  wire io_bus_in06_;
  wire io_bus_in07_;
  wire io_bus_in08_;
  wire n__609;
  wire io_bus_in09_;
  wire N37;
  wire N3902;
  wire int_inhibit_;
  wire current_address;
  wire N59;
  wire e09f1;
  wire tp1;
  wire n__558;
  wire eae_on;
  wire n__736;
  wire io_on;
  wire ts3;
  wire n__11;
  wire n__738;
  wire mq02;
  wire n__14;
  wire mq11;
  wire mq01;
  wire N4411;
  wire mq00;
  wire n__17;
  wire N4119;
  wire N105;
  wire n__23;
  wire mq04;
  wire left_shift;
  wire initialize_;
  wire n__30;
  wire N438;
  wire n__31;
  wire n__27;
  wire N5;
  wire n__33;
  wire n__29;
  wire n__34;
  wire N541;
  wire n__40;
  wire N6;
  wire n__41;
  wire df_enable__;
  wire n__37;
  wire N11;
  wire n__43;
  wire n__38;
  wire n__44;
  wire N10;
  wire n__50;
  wire N120;
  wire n__51;
  wire n__46;
  wire mp_int__N0;
  wire n__47;
  wire N40;
  wire n__48;
  wire _n0194;
  wire n__49;
  wire N437;
  wire N424;
  wire n__564;
  wire N353;
  wire N551;
  wire n__569;
  wire \_n0792<1> ;
  wire N3828;
  wire N419;
  wire _n0208;
  wire _n0027;
  wire \_n0803<0> ;
  wire \_n0803<1> ;
  wire _n0173;
  wire \_n0804<0> ;
  wire pc02;
  wire \_n0792<0> ;
  wire pause_N1;
  wire \_n0794<0> ;
  wire N3826;
  wire N31;
  wire sc0_3_0_;
  wire _n0621;
  wire sc2;
  wire N3;
  wire iop4;
  wire N354;
  wire N416;
  wire n__489;
  wire _n0760;
  wire \_n0801<0> ;
  wire N4511;
  wire wc_set;
  wire rdr_enable_;
  wire N427;
  wire \_n0801<1> ;
  wire n__412;
  wire N3830;
  wire n__721;
  wire n__560;
  wire _n0256;
  wire sf3;
  wire iop2;
  wire _n0763;
  wire pc05;
  wire \_n0800<0> ;
  wire N3971;
  wire _n0655;
  wire rdr_shift;
  wire n__452;
  wire N531;
  wire n__137;
  wire sf4;
  wire n__607;
  wire _n0054;
  wire n__438;
  wire N439;
  wire n__677;
  wire _n0320;
  wire N357;
  wire N434;
  wire N433;
  wire N428;
  wire add_accepted__N0;
  wire N154;
  wire N436;
  wire double_left_rotate;
  wire s_set_;
  wire N448;
  wire n__437;
  wire mem_enable0_4;
  wire adder_l_;
  wire N90;
  wire n__443;
  wire skip_;
  wire mq09;
  wire N3839;
  wire keyboard_flag_;
  wire rdr_shift_;
  wire stop_ok;
  wire bf0;
  wire bf1;
  wire bf2;
  wire sc4;
  wire word_count;
  wire n__597;
  wire right_shift;
  wire mem_enable5_8;
  wire data_add_enable;
  wire run;
  wire mq08;
  wire break_ok_;
  wire e_set;
  wire sf5;
  wire ts1;
  wire N430;
  wire df0;
  wire df1;
  wire isz;
  wire df2;
  wire n__160;
  wire N232;
  wire a04c1;
  wire ac_enable;
  wire N15;
  wire eae_end_N0;
  wire eae_end;
  wire N449;
  wire n__734;
  wire pc_enable;
  wire pwr_low_;
  wire \_n0791<0> ;
  wire load_bf;
  wire n__111;
  wire ma_load;
  wire int_sync__;
  wire ib0;
  wire ib1;
  wire ib2;
  wire if0;
  wire if1;
  wire if2;
  wire load_ib;
  wire mem_ext_io_enable_;
  wire op2;
  wire pause;
  wire n__122;
  wire kcc_;
  wire eae_ir0;
  wire eae_ir1;
  wire eae_ir2;
  wire n__444;
  wire clock_scale_2;
  wire ts1_N0;
  wire load_sf_;
  wire manual_preset_;
  wire ir0_;
  wire \_n0795<0> ;
  wire mq07;
  wire no_shift;
  wire ir1;
  wire ir2;
  wire eae_complete_;
  wire n__108;
  wire n__665;
  wire N447;
  wire N103;
  wire N48;
  wire int_delay__;
  wire N8;
  wire N4111;
  wire n__436;
  wire _n0025;
  wire _n0741;
  wire ts2;
  wire hz880;
  wire N285;
  wire N286;
  wire N396;
  wire N3511;
  wire N601;
  wire N417;
  wire N4003;
  wire N415;
  wire N628;
  wire N630;
  wire N632;
  wire N634;
  wire N636;
  wire N640;
  wire N4165;
  wire N644;
  wire N4143;
  wire N648;
  wire N650;
  wire N652;
  wire N4147;
  wire N656;
  wire N658;
  wire N660;
  wire N662;
  wire N664;
  wire N666;
  wire N4171;
  wire N4145;
  wire N672;
  wire N674;
  wire N676;
  wire N678;
  wire N4141;
  wire N1015;
  wire N3894;
  wire N1039;
  wire N1023;
  wire N1115;
  wire N1027;
  wire N4133;
  wire N3844;
  wire N4151;
  wire N4135;
  wire N1131;
  wire N3977;
  wire N1025;
  wire CHOICE1694;
  wire N1127;
  wire N1126;
  wire N1117;
  wire eae_on_1;
  wire N1019;
  wire N4169;
  wire N1013;
  wire N1021;
  wire N1017;
  wire N1093;
  wire N1068;
  wire N3906;
  wire N10111;
  wire N1047;
  wire N1009;
  wire N4159;
  wire N4125;
  wire CHOICE1749;
  wire N3876;
  wire N4139;
  wire N4149;
  wire CHOICE1739;
  wire N4121;
  wire CHOICE1757;
  wire CHOICE1741;
  wire CHOICE1744;
  wire CHOICE1780;
  wire CHOICE1812;
  wire CHOICE1804;
  wire N4127;
  wire CHOICE1740;
  wire CHOICE1781;
  wire CHOICE1826;
  wire CHOICE1797;
  wire N4167;
  wire CHOICE1819;
  wire CHOICE1714;
  wire N3908;
  wire N4193;
  wire CHOICE1727;
  wire N3974;
  wire CHOICE1770;
  wire N4022;
  wire CHOICE2733;
  wire CHOICE2750;
  wire N4157;
  wire CHOICE1875;
  wire CHOICE2780;
  wire N4155;
  wire CHOICE2704;
  wire CHOICE2834;
  wire N3970;
  wire CHOICE2760;
  wire CHOICE2687;
  wire CHOICE2690;
  wire CHOICE1844;
  wire CHOICE2744;
  wire CHOICE2689;
  wire CHOICE2735;
  wire CHOICE2693;
  wire N3968;
  wire CHOICE2762;
  wire CHOICE2775;
  wire N3858;
  wire N4105;
  wire CHOICE1847;
  wire N4153;
  wire N4026;
  wire CHOICE1850;
  wire CHOICE1867;
  wire N3913;
  wire N3935;
  wire N4089;
  wire N4189;
  wire CHOICE2820;
  wire N4182;
  wire CHOICE2800;
  wire CHOICE1885;
  wire N4129;
  wire CHOICE1886;
  wire N4091;
  wire CHOICE2722;
  wire N3850;
  wire CHOICE1856;
  wire N3909;
  wire N4109;
  wire CHOICE2712;
  wire CHOICE2662;
  wire CHOICE2807;
  wire N4185;
  wire CHOICE2728;
  wire CHOICE2784;
  wire N4093;
  wire CHOICE2767;
  wire CHOICE2421;
  wire N4187;
  wire CHOICE2746;
  wire CHOICE2426;
  wire CHOICE2710;
  wire N4033;
  wire N4014;
  wire CHOICE1861;
  wire CHOICE1880;
  wire CHOICE2695;
  wire CHOICE2753;
  wire CHOICE1866;
  wire CHOICE2644;
  wire N1781;
  wire CHOICE3485;
  wire CHOICE3327;
  wire N4047;
  wire CHOICE2973;
  wire N2822;
  wire CHOICE3241;
  wire CHOICE2849;
  wire CHOICE3762;
  wire CHOICE3212;
  wire N3916;
  wire CHOICE3682;
  wire CHOICE3320;
  wire N2238;
  wire CHOICE3763;
  wire N4011;
  wire CHOICE3220;
  wire N4176;
  wire CHOICE3075;
  wire CHOICE3209;
  wire CHOICE2843;
  wire CHOICE3671;
  wire N3988;
  wire CHOICE3048;
  wire CHOICE3153;
  wire CHOICE3431;
  wire CHOICE2948;
  wire N3896;
  wire CHOICE3163;
  wire N4161;
  wire CHOICE3154;
  wire CHOICE3092;
  wire CHOICE3168;
  wire N3942;
  wire N3882;
  wire CHOICE3576;
  wire N3959;
  wire CHOICE3569;
  wire N4179;
  wire CHOICE3201;
  wire CHOICE2938;
  wire N3878;
  wire CHOICE3545;
  wire CHOICE3172;
  wire N3921;
  wire N4027;
  wire CHOICE2942;
  wire N3899;
  wire N4101;
  wire CHOICE3378;
  wire CHOICE3107;
  wire N4103;
  wire N3957;
  wire N3874;
  wire CHOICE3018;
  wire CHOICE3044;
  wire CHOICE3667;
  wire CHOICE3589;
  wire N3938;
  wire CHOICE3751;
  wire CHOICE3318;
  wire CHOICE3747;
  wire CHOICE2863;
  wire CHOICE3039;
  wire N3937;
  wire N4007;
  wire CHOICE3175;
  wire N4045;
  wire N3884;
  wire CHOICE3248;
  wire N3996;
  wire CHOICE2983;
  wire N3856;
  wire CHOICE3745;
  wire CHOICE2884;
  wire CHOICE3460;
  wire CHOICE3296;
  wire N4113;
  wire N3990;
  wire CHOICE3438;
  wire CHOICE3192;
  wire CHOICE3273;
  wire CHOICE3359;
  wire N4057;
  wire CHOICE3736;
  wire N4117;
  wire CHOICE3768;
  wire N4095;
  wire N3986;
  wire CHOICE3434;
  wire N3872;
  wire N4000;
  wire N4035;
  wire CHOICE3184;
  wire CHOICE3473;
  wire CHOICE3399;
  wire CHOICE3287;
  wire CHOICE3687;
  wire mb04_3;
  wire N2324;
  wire N3865;
  wire CHOICE3631;
  wire CHOICE3390;
  wire CHOICE3654;
  wire CHOICE3727;
  wire CHOICE2880;
  wire CHOICE3510;
  wire CHOICE3206;
  wire N4024;
  wire CHOICE3548;
  wire N3979;
  wire CHOICE3343;
  wire CHOICE2977;
  wire N3925;
  wire CHOICE3650;
  wire N3890;
  wire N4037;
  wire CHOICE3532;
  wire N4097;
  wire CHOICE3456;
  wire N3940;
  wire CHOICE3674;
  wire N3953;
  wire N3852;
  wire CHOICE3463;
  wire N4107;
  wire N4016;
  wire N3842;
  wire N3861;
  wire CHOICE3441;
  wire N3931;
  wire N2087;
  wire CHOICE3213;
  wire CHOICE2898;
  wire CHOICE3054;
  wire CHOICE3611;
  wire CHOICE3389;
  wire N3994;
  wire mb03_3;
  wire N3976;
  wire CHOICE3352;
  wire CHOICE3008;
  wire N4043;
  wire CHOICE3453;
  wire CHOICE2919;
  wire N3927;
  wire CHOICE3504;
  wire N4099;
  wire N4029;
  wire CHOICE3012;
  wire CHOICE3195;
  wire N3966;
  wire N3880;
  wire N4049;
  wire N4115;
  wire N3985;
  wire CHOICE3731;
  wire CHOICE3178;
  wire N3871;
  wire N3992;
  wire N4041;
  wire CHOICE3710;
  wire CHOICE2969;
  wire CHOICE3189;
  wire N4030;
  wire N3914;
  wire CHOICE3298;
  wire CHOICE3180;
  wire N4020;
  wire N4173;
  wire CHOICE3159;
  wire CHOICE3304;
  wire CHOICE3164;
  wire CHOICE3700;
  wire CHOICE2915;
  wire CHOICE3484;
  wire N3998;
  wire CHOICE3614;
  wire CHOICE3131;
  wire N3923;
  wire N4001;
  wire N4039;
  wire CHOICE3183;
  wire N3919;
  wire CHOICE3232;
  wire N4032;
  wire CHOICE3004;
  wire CHOICE2935;
  wire N4131;
  wire CHOICE3697;
  wire CHOICE3198;
  wire CHOICE3329;
  wire N3897;
  wire N3982;
  wire CHOICE3270;
  wire CHOICE3490;
  wire N3929;
  wire CHOICE3684;
  wire N4012;
  wire CHOICE3272;
  wire N41111;
  wire N3846;
  wire N4059;
  wire N4053;
  wire CHOICE3692;
  wire CHOICE2930;
  wire N3854;
  wire CHOICE3086;
  wire CHOICE3124;
  wire N3863;
  wire CHOICE3607;
  wire mb06_1;
  wire mb04_1;
  wire mb05_1;
  wire mb03_1;
  wire mb07_1;
  wire mb08_1;
  wire mb09_1;
  wire sr_enable0;
  wire bmb05_1;
  wire bmb04_1;
  wire bmb06_1;
  wire mb06_2;
  wire mb04_2;
  wire mb03_2;
  wire mb07_2;
  wire mb08_2;
  wire mb09_2;
  wire mb11_1;
  wire mb06_3;
  wire initialize_1;
  wire manual_preset_1;
  wire N4195;
  wire N4196;
  wire N4197;
  wire N4198;
  wire N4199;
  wire N4200;
  wire N4201;
  wire N4202;
  wire N4203;
  wire N4204;
  wire N4205;
  wire N4206;
  wire N4207;
  wire N4208;
  wire N4209;
  wire N4210;
  wire N4211;
  wire N4212;
  wire N4213;
  wire N4214;
  wire N4215;
  wire N4216;
  wire N4217;
  wire N4218;
  wire N4219;
  wire N4220;
  wire N4221;
  wire N4222;
  wire N4223;
  wire N4224;
  wire N4225;
  wire N4226;
  wire N4227;
  wire N4228;
  wire N4229;
  wire N4230;
  wire N4231;
  wire N4232;
  wire N4233;
  wire N4234;
  wire N4235;
  wire N4236;
  wire N4237;
  wire N4238;
  wire N4239;
  wire N4240;
  wire N4241;
  wire N4242;
  wire N4243;
  wire N4244;
  wire N4245;
  wire N4246;
  wire N4247;
  wire N4248;
  wire N4249;
  wire N4250;
  wire N4251;
  wire N4252;
  wire N4253;
  wire N4254;
  wire N4255;
  wire N4256;
  wire N4257;
  wire N4258;
  wire N4259;
  wire N4260;
  wire N4261;
  wire N4262;
  wire int_enable__1;
  wire NLW_h30m708_h1_UNCONNECTED;
  wire NLW_h30m708_c1_UNCONNECTED;
  wire NLW_ef02m707_aj1_UNCONNECTED;
  wire NLW_ef02m707_ar1_UNCONNECTED;
  wire NLW_ef02m707_bp1_UNCONNECTED;
  wire NLW_ef02m707_br2_UNCONNECTED;
  wire NLW_ef01m706_bu2_UNCONNECTED;
  wire NLW_ef01m706_bn2_UNCONNECTED;
  wire NLW_ef01m706_bs1_UNCONNECTED;
  DelayLine_1 dl_n__22 (
    .Dclk(dclk_BUFGP),
    .In(e09f1),
    .Out(mb_load)
  );
  INV sc4_1_INV_0 (
    .I(sc4),
    .O(sc4__OBUF)
  );
  defparam _n083856.INIT = 16'h084C;
  LUT4 _n083856 (
    .I0(ac02),
    .I1(CHOICE2973),
    .I2(ac_enable),
    .I3(acbar_enable),
    .O(\_n0804<1> )
  );
  defparam _n084356.INIT = 16'h084C;
  LUT4 _n084356 (
    .I0(ac01),
    .I1(CHOICE2919),
    .I2(ac_enable),
    .I3(acbar_enable),
    .O(\_n0807<0> )
  );
  defparam _n083630.INIT = 8'h4C;
  LUT3 _n083630 (
    .I0(ma02),
    .I1(CHOICE2834),
    .I2(ma_enable0_4),
    .O(\_n0803<1> )
  );
  defparam Ker3501_SW3.INIT = 16'hFDF5;
  LUT4_L Ker3501_SW3 (
    .I0(CHOICE3589),
    .I1(adder02),
    .I2(N4041),
    .I3(left_shift),
    .LO(N3880)
  );
  defparam n__56451.INIT = 8'hF8;
  LUT3 n__56451 (
    .I0(uint),
    .I1(CHOICE1856),
    .I2(CHOICE1867),
    .O(n__564)
  );
  defparam _n083956.INIT = 16'h084C;
  LUT4 _n083956 (
    .I0(ac03),
    .I1(CHOICE3008),
    .I2(ac_enable),
    .I3(acbar_enable),
    .O(\_n0804<0> )
  );
  defparam _n07102.INIT = 8'h80;
  LUT3_L _n07102 (
    .I0(acclr_IBUF),
    .I1(tt_ac_clr_),
    .I2(clock_ac_clr_),
    .LO(CHOICE3710)
  );
  defparam _n084010.INIT = 4'hD;
  LUT2 _n084010 (
    .I0(data_add_enable),
    .I1(da00_IBUF),
    .O(CHOICE2762)
  );
  defparam eae_complete_63.INIT = 16'hBAAA;
  LUT4_D eae_complete_63 (
    .I0(CHOICE2820),
    .I1(eae_ir0),
    .I2(CHOICE2807),
    .I3(eae_ir1),
    .LO(N4213),
    .O(eae_complete_)
  );
  defparam _n083575.INIT = 16'h001B;
  LUT4 _n083575 (
    .I0(ac05),
    .I1(acbar_enable),
    .I2(ac_enable),
    .I3(N4059),
    .O(\_n0801<0> )
  );
  defparam _n083331.INIT = 16'h0888;
  LUT4 _n083331 (
    .I0(CHOICE2942),
    .I1(CHOICE2948),
    .I2(mem05_IBUF),
    .I3(mem_enable5_8),
    .O(\_n0800<0> )
  );
  defparam regbus0446.INIT = 16'h69FF;
  LUT4_L regbus0446 (
    .I0(\_n0800<0> ),
    .I1(\_n0801<0> ),
    .I2(carry_out6_),
    .I3(left_shift),
    .LO(CHOICE3441)
  );
  defparam _n082758_SW0.INIT = 16'hD5FF;
  LUT4 _n082758_SW0 (
    .I0(in09_IBUF),
    .I1(sf3),
    .I2(_n0256),
    .I3(tt5_),
    .O(N3882)
  );
  defparam regbus1044_SW0.INIT = 16'h00D8;
  LUT4_L regbus1044_SW0 (
    .I0(\_n0791<1> ),
    .I1(N3897),
    .I2(N3896),
    .I3(N4193),
    .LO(N4011)
  );
  defparam _n082931.INIT = 16'h4C00;
  LUT4 _n082931 (
    .I0(mem07_IBUF),
    .I1(CHOICE3018),
    .I2(mem_enable5_8),
    .I3(CHOICE3012),
    .O(\_n0797<0> )
  );
  defparam _n082831.INIT = 16'h4C00;
  LUT4 _n082831 (
    .I0(mem06_IBUF),
    .I1(CHOICE2983),
    .I2(mem_enable5_8),
    .I3(CHOICE2977),
    .O(\_n0797<1> )
  );
  defparam _n082288.INIT = 16'h1B00;
  LUT4 _n082288 (
    .I0(ac10),
    .I1(acbar_enable),
    .I2(ac_enable),
    .I3(N3959),
    .O(\_n0792<1> )
  );
  defparam _n082786.INIT = 16'h1B00;
  LUT4 _n082786 (
    .I0(ac09),
    .I1(acbar_enable),
    .I2(ac_enable),
    .I3(CHOICE3399),
    .O(\_n0795<0> )
  );
  defparam regbus0322.INIT = 8'h4C;
  LUT3 regbus0322 (
    .I0(double_right_rotate),
    .I1(CHOICE3650),
    .I2(adder01),
    .O(CHOICE3654)
  );
  defparam _n082431.INIT = 16'h4C00;
  LUT4 _n082431 (
    .I0(mem08_IBUF),
    .I1(CHOICE3054),
    .I2(mem_enable5_8),
    .I3(CHOICE3048),
    .O(\_n0794<1> )
  );
  defparam ac_enable1.INIT = 16'h1F3F;
  LUT4 ac_enable1 (
    .I0(io_enable),
    .I1(CHOICE3727),
    .I2(CHOICE3736),
    .I3(CHOICE3710),
    .O(ac_enable)
  );
  defparam _n0823119.INIT = 16'h1B00;
  LUT4_D _n0823119 (
    .I0(ac11),
    .I1(acbar_enable),
    .I2(ac_enable),
    .I3(N3957),
    .LO(N4214),
    .O(\_n0792<0> )
  );
  defparam _n068854.INIT = 16'hF3F2;
  LUT4 _n068854 (
    .I0(CHOICE3198),
    .I1(N110),
    .I2(CHOICE3212),
    .I3(CHOICE3201),
    .O(CHOICE3213)
  );
  defparam _n0823104_SW0_SW0.INIT = 16'hC444;
  LUT4 _n0823104_SW0_SW0 (
    .I0(io_enable),
    .I1(CHOICE3763),
    .I2(io_bus_in11_),
    .I3(CHOICE3768),
    .O(N3957)
  );
  defparam ts1_N01.INIT = 4'h1;
  LUT1 ts1_N01 (
    .I0(manual_preset_),
    .O(ts1_N0)
  );
  defparam _n07881.INIT = 4'hD;
  LUT2 _n07881 (
    .I0(power_clear__IBUF),
    .I1(mfts2),
    .O(_n0788)
  );
  defparam Ker511.INIT = 8'hE8;
  LUT3 Ker511 (
    .I0(\_n0804<0> ),
    .I1(N4249),
    .I2(\_n0803<0> ),
    .O(N511)
  );
  defparam n__4121.INIT = 16'hFAF8;
  LUT4 n__4121 (
    .I0(mftp1),
    .I1(N90),
    .I2(ts4),
    .I3(restart),
    .O(n__412)
  );
  FDS mq04_530 (
    .D(N3839),
    .S(N1023),
    .C(mq_load),
    .Q(mq04)
  );
  defparam n__6031.INIT = 16'h20FF;
  LUT4 n__6031 (
    .I0(N232),
    .I1(N105),
    .I2(eae_ir1),
    .I3(eae_run),
    .O(n__603)
  );
  FDCP fetch (
    .D(f_set),
    .CLR(ts1_N0),
    .PRE(_n0621),
    .C(tp4),
    .Q(b_fetch)
  );
  defparam io_bus_in_int__531.INIT = 16'h8000;
  LUT4 io_bus_in_int__531 (
    .I0(N6),
    .I1(N8),
    .I2(N5),
    .I3(N628),
    .O(io_bus_in_int_)
  );
  FDC word_count_532 (
    .D(wc_set),
    .CLR(ts1_N0),
    .C(tp4),
    .Q(word_count)
  );
  FDC execute (
    .D(e_set),
    .CLR(ts1_N0),
    .C(tp4),
    .Q(b_execute)
  );
  defparam Ker491.INIT = 8'hE8;
  LUT3 Ker491 (
    .I0(\_n0801<0> ),
    .I1(N4250),
    .I2(\_n0800<0> ),
    .O(N491)
  );
  FDC defer_533 (
    .D(d_set),
    .CLR(ts1_N0),
    .C(tp4),
    .Q(defer)
  );
  defparam b_mem_start_534.INIT = 16'hF888;
  LUT4 b_mem_start_534 (
    .I0(key_la__IBUF),
    .I1(mftp2),
    .I2(N656),
    .I3(run),
    .O(b_mem_start_OBUF)
  );
  defparam _n067429.INIT = 8'hA8;
  LUT3 _n067429 (
    .I0(_n0656),
    .I1(mb08),
    .I2(mb09),
    .O(CHOICE3687)
  );
  INV mq10_1_INV_0 (
    .I(mq10),
    .O(mq10__OBUF)
  );
  defparam Ker1201.INIT = 4'h7;
  LUT2 Ker1201 (
    .I0(eae_run),
    .I1(n__597),
    .O(N120)
  );
  defparam _n0773.INIT = 16'h4044;
  LUT4 _n0773 (
    .I0(n__49),
    .I1(eae_end),
    .I2(N658),
    .I3(n__748),
    .O(int_strobe_)
  );
  FDS mq05_535 (
    .D(N3838),
    .S(N1027),
    .C(mq_load),
    .Q(mq05)
  );
  defparam n__5691.INIT = 8'hF8;
  LUT3 n__5691 (
    .I0(mb_load),
    .I1(b_execute),
    .I2(pc_load),
    .O(n__569)
  );
  defparam n__6051.INIT = 8'hF8;
  LUT3 n__6051 (
    .I0(eae_run),
    .I1(n__597),
    .I2(mfts2),
    .O(n__605)
  );
  DelayLine_1_1 dl_n__30 (
    .Dclk(dclk_BUFGP),
    .In(n__29),
    .Out(n__30)
  );
  defparam pause_Aset_INV1.INIT = 8'hF8;
  LUT3 pause_Aset_INV1 (
    .I0(n__748),
    .I1(N439),
    .I2(_n0189),
    .O(pause_N1)
  );
  FDC current_address_536 (
    .D(word_count),
    .CLR(ts1_N0),
    .C(tp4),
    .Q(current_address)
  );
  FDC break_537 (
    .D(b_set),
    .CLR(ts1_N0),
    .C(tp4),
    .Q(break)
  );
  defparam _n07691.INIT = 4'h8;
  LUT2 _n07691 (
    .I0(n__748),
    .I1(N439),
    .O(n__29)
  );
  defparam io_bus_in06_1.INIT = 8'h80;
  LUT3 io_bus_in06_1 (
    .I0(N48),
    .I1(N49),
    .I2(N47),
    .O(io_bus_in06_)
  );
  defparam _n07631.INIT = 4'h8;
  LUT2 _n07631 (
    .I0(n__37),
    .I1(mb10),
    .O(_n0763)
  );
  INV mq04_1_INV_0 (
    .I(mq04),
    .O(mq04__OBUF)
  );
  defparam _n07611.INIT = 4'h8;
  LUT2 _n07611 (
    .I0(n__30),
    .I1(mb11),
    .O(_n0761)
  );
  defparam _n07601.INIT = 4'h8;
  LUT2 _n07601 (
    .I0(n__43),
    .I1(mb09),
    .O(_n0760)
  );
  FDS mq06_538 (
    .D(N3837),
    .S(N1017),
    .C(mq_load),
    .Q(mq06)
  );
  defparam _n07421.INIT = 16'h1000;
  LUT4 _n07421 (
    .I0(int_delay__),
    .I1(int_sync__),
    .I2(int_inhibit_),
    .I3(tp4),
    .O(_n0742)
  );
  defparam regbus0555.INIT = 16'h0037;
  LUT4_D regbus0555 (
    .I0(N428),
    .I1(adder05),
    .I2(no_shift),
    .I3(N3874),
    .LO(N4215),
    .O(regbus05)
  );
  defparam _n07561.INIT = 4'h1;
  LUT2 _n07561 (
    .I0(s_),
    .I1(strobe__OBUF),
    .O(b_mem_to_lsr_OBUF)
  );
  defparam _n067414.INIT = 16'hFAD8;
  LUT4 _n067414 (
    .I0(_n0656),
    .I1(mb08),
    .I2(N347),
    .I3(mb09),
    .O(CHOICE3682)
  );
  defparam Ker3241.INIT = 4'h1;
  LUT2 Ker3241 (
    .I0(sc0_3_0_),
    .I1(sc4),
    .O(N324)
  );
  defparam tad_1.INIT = 8'hF7;
  LUT3 tad_1 (
    .I0(ir0_),
    .I1(ir2),
    .I2(ir1),
    .O(tad__OBUF)
  );
  defparam _n07521.INIT = 8'h20;
  LUT3 _n07521 (
    .I0(ir0_),
    .I1(ir2),
    .I2(ir1),
    .O(isz)
  );
  defparam Ker1461.INIT = 8'hFD;
  LUT3 Ker1461 (
    .I0(ir1),
    .I1(ir2),
    .I2(ir0_),
    .O(N146)
  );
  defparam jms_1.INIT = 8'hFE;
  LUT3 jms_1 (
    .I0(ir2),
    .I1(ir0_),
    .I2(ir1),
    .O(jms__OBUF)
  );
  defparam and_1.INIT = 8'hFD;
  LUT3 and_1 (
    .I0(ir0_),
    .I1(ir1),
    .I2(ir2),
    .O(and__OBUF)
  );
  defparam dca_1.INIT = 8'h7F;
  LUT3 dca_1 (
    .I0(ir0_),
    .I1(ir1),
    .I2(ir2),
    .O(dca__OBUF)
  );
  FD ma10_539 (
    .D(N4241),
    .C(ma_load),
    .Q(ma10)
  );
  defparam jmp_1.INIT = 8'hFD;
  LUT3 jmp_1 (
    .I0(ir2),
    .I1(ir0_),
    .I2(ir1),
    .O(jmp__OBUF)
  );
  defparam _n07451.INIT = 4'h8;
  LUT2 _n07451 (
    .I0(mb_load),
    .I1(b_fetch),
    .O(n__51)
  );
  defparam Ker2861.INIT = 16'h8000;
  LUT4 Ker2861 (
    .I0(ir1),
    .I1(ir2),
    .I2(ts2),
    .I3(N447),
    .O(N286)
  );
  defparam n__6671.INIT = 16'h4F44;
  LUT4 n__6671 (
    .I0(sc4),
    .I1(eae_on),
    .I2(mb11),
    .I3(N435),
    .O(n__667)
  );
  defparam n__1148.INIT = 16'hFEEE;
  LUT4 n__1148 (
    .I0(CHOICE2421),
    .I1(CHOICE2426),
    .I2(N1011),
    .I3(N442),
    .O(n__11)
  );
  defparam _n0194_540.INIT = 16'h4000;
  LUT4 _n0194_540 (
    .I0(N105),
    .I1(eae_on),
    .I2(eae_ir1),
    .I3(N1781),
    .O(_n0194)
  );
  defparam Ker3991_SW3.INIT = 16'hF8FF;
  LUT4 Ker3991_SW3 (
    .I0(double_right_rotate),
    .I1(adder07),
    .I2(adder09),
    .I3(CHOICE3667),
    .O(N3971)
  );
  defparam opr_1.INIT = 8'hF7;
  LUT3 opr_1 (
    .I0(ir2),
    .I1(ir1),
    .I2(ir0_),
    .O(opr__OBUF)
  );
  FDS mq07_541 (
    .D(N3836),
    .S(N1019),
    .C(mq_load),
    .Q(mq07)
  );
  defparam _n07371.INIT = 16'h1333;
  LUT4 _n07371 (
    .I0(n3cycle_IBUF),
    .I1(current_address),
    .I2(brk_sync),
    .I3(N429),
    .O(b_set_)
  );
  defparam _n07361.INIT = 8'h20;
  LUT3 _n07361 (
    .I0(N429),
    .I1(n3cycle_IBUF),
    .I2(brk_sync),
    .O(wc_set)
  );
  FDC eae_ir0_542 (
    .D(mb08),
    .CLR(n__51),
    .C(n__600),
    .Q(eae_ir0)
  );
  defparam _n07341.INIT = 4'h4;
  LUT2 _n07341 (
    .I0(brk_sync),
    .I1(N429),
    .O(f_set)
  );
  defparam break_ok_1.INIT = 4'h7;
  LUT2 break_ok_1 (
    .I0(N429),
    .I1(brk_sync),
    .O(break_ok_)
  );
  TTYReceiver ef01m706 (
    .bu1(clock_scale_2),
    .ad2(bmb03__OBUF),
    .ae1(bmb04_1),
    .af1(bmb05_1),
    .ah1(bmb06_1),
    .ah2(mb07_1),
    .bd1(a04c1),
    .bd2(iop1),
    .aj1(mb08_1),
    .aj2(tti2),
    .bf2(initialize),
    .al2(iop4),
    .an1(hz880),
    .bj2(iop2),
    .ar1(tti_data),
    .bm2(rx_data_IBUF),
    .av2(kcc_),
    .br1(stop_ok),
    .br2(in_stop_2_),
    .bu2(NLW_ef01m706_bu2_UNCONNECTED),
    .bv2(in_stop_2_),
    .ae2(kcc_),
    .af2(keyboard_flag_),
    .be2(tt_ac_clr_),
    .ak1(tti2),
    .ak2(tt0_),
    .al1(tt3_),
    .am1(tt4_),
    .am2(tti_data),
    .bh2(tti_skip_),
    .an2(tt7_),
    .ap2(tt5_),
    .ar2(tt1_),
    .bn2(NLW_ef01m706_bn2_UNCONNECTED),
    .as2(tt2_),
    .at2(tt6_),
    .au2(reader_run__OBUF),
    .bs1(NLW_ef01m706_bs1_UNCONNECTED),
    .bt2(clock_scale_2)
  );
  defparam n__661_543.INIT = 16'hE44E;
  LUT4 n__661_543 (
    .I0(eae_on),
    .I1(N4133),
    .I2(sc0),
    .I3(n__677),
    .O(n__661)
  );
  FDS mq08_544 (
    .D(N3835),
    .S(N10111),
    .C(mq_load),
    .Q(mq08)
  );
  CardReaderBuffer hj32m716 (
    .dclk(dclk_BUFGP),
    .ad2(index_markers_IBUF),
    .ae1(zone11_index_IBUF),
    .ae2(zone12_index_IBUF),
    .ah1(iot634),
    .be2(zone04_index_IBUF),
    .ak2(zone01_index_IBUF),
    .al2(zone10_index_IBUF),
    .bk2(zone08_index_IBUF),
    .ap2(zone03_index_IBUF),
    .bl2(zone09_index_IBUF),
    .bm2(iot632),
    .ar2(zone02_index_IBUF),
    .as2(zone05_index_IBUF),
    .br1(zone07_index_IBUF),
    .bs1(zone06_index_IBUF),
    .bs2(initialize_),
    .bu1(i_m_d),
    .af1(N20),
    .af2(N23),
    .ah2(N26),
    .aj2(N29),
    .bh2(N45),
    .am2(N41),
    .an2(N33),
    .bj2(N37),
    .bn2(N61),
    .bp2(N57),
    .au2(N49),
    .av2(N53)
  );
  FDS mq09_545 (
    .D(N3834),
    .S(N1025),
    .C(mq_load),
    .Q(mq09)
  );
  FDS mq10_546 (
    .D(N3833),
    .S(N1009),
    .C(mq_load),
    .Q(mq10)
  );
  defparam Ker42920.INIT = 8'h10;
  LUT3 Ker42920 (
    .I0(ir0_),
    .I1(defer),
    .I2(ir1),
    .O(CHOICE3153)
  );
  TTYTransmitter ef02m707 (
    .ae1(bmb04__OBUF),
    .ae2(bmb03__OBUF),
    .af1(mb06),
    .af2(bmb05__OBUF),
    .ah1(enable_),
    .ah2(bmb07__OBUF),
    .bd2(iop2),
    .be2(initialize),
    .aj2(bmb08__OBUF),
    .ak1(enable),
    .bf2(stop_ok),
    .al2(ac06),
    .am2(ac07),
    .bh2(iop1),
    .an1(stop_ok),
    .an2(stop_ok),
    .bj1(stop_ok),
    .ap2(ac04),
    .ar2(ac05),
    .as1(iop4),
    .bn2(out_stop2_),
    .as2(ac09),
    .at2(ac10),
    .au1(ac11),
    .bp2(tto_clock_),
    .au2(ac08),
    .bs2(stop_ok),
    .aj1(NLW_ef02m707_aj1_UNCONNECTED),
    .ak2(enable),
    .al1(enable_),
    .bj2(tto_skip_),
    .bk2(teleprinter_flag_),
    .ar1(NLW_ef02m707_ar1_UNCONNECTED),
    .bn1(out_stop2_),
    .bp1(NLW_ef02m707_bp1_UNCONNECTED),
    .av2(tx_data_OBUF),
    .br2(NLW_ef02m707_br2_UNCONNECTED)
  );
  FDCP ts1_547 (
    .D(stop_ok),
    .CLR(_n0025),
    .PRE(ts1_N0),
    .C(tp4),
    .Q(ts1)
  );
  FDC run_548 (
    .D(n__11),
    .CLR(run_N0),
    .C(n__748),
    .Q(run)
  );
  FDCP ts4_549 (
    .D(a04c1),
    .CLR(ts1_N0),
    .PRE(int_strobe),
    .C(tp4),
    .Q(ts4)
  );
  FDCP iop1_550 (
    .D(a04c1),
    .CLR(initialize),
    .PRE(_n0761),
    .C(n__33),
    .Q(iop1)
  );
  FD pc11_551 (
    .D(N4238),
    .C(pc_load),
    .Q(pc11)
  );
  INV break_1_INV_0 (
    .I(break),
    .O(bbreak_OBUF)
  );
  defparam regbus1118.INIT = 16'h69FF;
  LUT4 regbus1118 (
    .I0(\_n0794<0> ),
    .I1(\_n0795<0> ),
    .I2(n__136),
    .I3(double_right_rotate),
    .O(CHOICE3569)
  );
  FDP add_accepted__552 (
    .D(break_ok_),
    .PRE(add_accepted__N0),
    .C(tp4),
    .Q(add_accepted_)
  );
  INV word_count_1_INV_0 (
    .I(word_count),
    .O(word_count__OBUF)
  );
  FDCP io_on_553 (
    .D(a04c1),
    .CLR(ts1_N0),
    .PRE(n__29),
    .C(n__49),
    .Q(io_on)
  );
  defparam mem_ext_io_enable_1.INIT = 16'hFF1F;
  LUT4_L mem_ext_io_enable_1 (
    .I0(mb07_2),
    .I1(mb08_2),
    .I2(N449),
    .I3(N3988),
    .LO(mem_ext_io_enable_)
  );
  INV current_address_1_INV_0 (
    .I(current_address),
    .O(current_address__OBUF)
  );
  FDCP iop4_554 (
    .D(a04c1),
    .CLR(initialize),
    .PRE(_n0760),
    .C(n__48),
    .Q(iop4)
  );
  FDC mfts1_555 (
    .D(stop_ok),
    .CLR(_n0788),
    .C(manual_preset_),
    .Q(mfts1)
  );
  OBUF ac06__OBUF_556 (
    .I(ac06__OBUF),
    .O(ac06_)
  );
  defparam acbar_enable1.INIT = 16'hECA0;
  LUT4 acbar_enable1 (
    .I0(N3961),
    .I1(mb06),
    .I2(N1781),
    .I3(N4256),
    .O(acbar_enable)
  );
  defparam pc_enable_557.INIT = 16'hEFCF;
  LUT4 pc_enable_557 (
    .I0(ts4),
    .I1(N3861),
    .I2(_n0061),
    .I3(N4244),
    .O(pc_enable)
  );
  defparam _n00621.INIT = 16'h1000;
  LUT4 _n00621 (
    .I0(mb04),
    .I1(mb05),
    .I2(mb03),
    .I3(N415),
    .O(b_dc_inst_OBUF)
  );
  FD sf3_558 (
    .D(df0),
    .C(if_to_sf),
    .Q(sf3)
  );
  defparam mem_enable5_8_559.INIT = 16'hFFFE;
  LUT4 mem_enable5_8_559 (
    .I0(_n0173),
    .I1(N4227),
    .I2(mem_enable0_4),
    .I3(N2822),
    .O(mem_enable5_8)
  );
  defparam _n07041.INIT = 16'h8000;
  LUT4 _n07041 (
    .I0(mb03),
    .I1(N417),
    .I2(b_fetch),
    .I3(ts3),
    .O(op2)
  );
  defparam _n084331_SW0.INIT = 16'h8F88;
  LUT4_L _n084331_SW0 (
    .I0(mq01),
    .I1(mq_enable),
    .I2(d01_IBUF),
    .I3(data_enable),
    .LO(N4115)
  );
  defparam Ker3571.INIT = 16'hF888;
  LUT4 Ker3571 (
    .I0(N415),
    .I1(n__47),
    .I2(mftp2),
    .I3(N2311),
    .O(N357)
  );
  defparam Ker1031.INIT = 4'hD;
  LUT2 Ker1031 (
    .I0(ir1),
    .I1(ir0_),
    .O(N103)
  );
  defparam _n07001.INIT = 8'h80;
  LUT3_D _n07001 (
    .I0(break),
    .I1(d_in__IBUF),
    .I2(ts2),
    .LO(N4216),
    .O(data_enable)
  );
  INV brk_rqst1_INV_0 (
    .I(brq_IBUF),
    .O(brk_rqst)
  );
  defparam n__665_560.INIT = 16'hD575;
  LUT4 n__665_560 (
    .I0(N1047),
    .I1(sc2),
    .I2(eae_on),
    .I3(N219),
    .O(n__665)
  );
  FDP eae_end_561 (
    .D(N4213),
    .PRE(eae_end_N0),
    .C(n__597),
    .Q(eae_end)
  );
  FDS mq11_562 (
    .D(N3832),
    .S(CHOICE2849),
    .C(mq_load),
    .Q(mq11)
  );
  defparam _n06951.INIT = 16'h5040;
  LUT4 _n06951 (
    .I0(N3852),
    .I1(CHOICE3154),
    .I2(N4231),
    .I3(N3511),
    .O(data_add_enable)
  );
  defparam regbus1044_SW0_SW0.INIT = 4'h8;
  LUT2 regbus1044_SW0_SW0 (
    .I0(carry_insert_),
    .I1(N4219),
    .O(N4193)
  );
  defparam regbus0063.INIT = 16'h0511;
  LUT4_D regbus0063 (
    .I0(N3929),
    .I1(N3985),
    .I2(N3986),
    .I3(\_n0791<0> ),
    .LO(N4217),
    .O(regbus00)
  );
  defparam _n0655_SW2.INIT = 16'hFCF4;
  LUT4 _n0655_SW2 (
    .I0(s_),
    .I1(ts1),
    .I2(N2324),
    .I3(N4191),
    .O(N3872)
  );
  defparam sc0_3_0_1.INIT = 16'hFFEF;
  LUT4 sc0_3_0_1 (
    .I0(sc3),
    .I1(sc2),
    .I2(N120),
    .I3(sc1),
    .O(sc0_3_0_)
  );
  defparam \Madd__n0033_Mxor_Result<0>_Xo<1>1 .INIT = 8'h96;
  LUT3 \Madd__n0033_Mxor_Result<0>_Xo<1>1  (
    .I0(\_n0806<0> ),
    .I1(\_n0807<0> ),
    .I2(n__160),
    .O(adder01)
  );
  defparam io_enable1.INIT = 8'hDF;
  LUT3 io_enable1 (
    .I0(_n0707),
    .I1(_n0070),
    .I2(mem_ext_io_enable_),
    .O(io_enable)
  );
  INV iop2_1_INV_0 (
    .I(iop2),
    .O(biop2__OBUF)
  );
  defparam ma_enable0_41.INIT = 16'hBAAA;
  LUT4_D ma_enable0_41 (
    .I0(ma_enable5_11),
    .I1(mem_enable0_4),
    .I2(mb04),
    .I3(mem_enable5_8),
    .LO(N4218),
    .O(ma_enable0_4)
  );
  defparam _n0399_SW3.INIT = 4'h9;
  LUT2 _n0399_SW3 (
    .I0(mq00),
    .I1(N2238),
    .O(N4055)
  );
  defparam \Madd__n0030_Mxor_Result<0>_Xo<1>1 .INIT = 8'h96;
  LUT3 \Madd__n0030_Mxor_Result<0>_Xo<1>1  (
    .I0(\_n0797<0> ),
    .I1(\_n0798<0> ),
    .I2(n__132),
    .O(adder07)
  );
  FDS link_563 (
    .D(N3831),
    .S(CHOICE2784),
    .C(ac_load),
    .Q(link)
  );
  defparam _n06831.INIT = 4'h4;
  LUT2 _n06831 (
    .I0(N285),
    .I1(ts3),
    .O(_n0683)
  );
  defparam _n01891.INIT = 16'h5040;
  LUT4 _n01891 (
    .I0(_n0208),
    .I1(N105),
    .I2(n__748),
    .I3(eae_ir1),
    .O(_n0189)
  );
  defparam _n07071.INIT = 8'h01;
  LUT3 _n07071 (
    .I0(iop4),
    .I1(iop1),
    .I2(iop2),
    .O(_n0707)
  );
  defparam n__1132.INIT = 16'h1000;
  LUT4 n__1132 (
    .I0(uf),
    .I1(mb11),
    .I2(op2),
    .I3(mb10),
    .O(CHOICE2426)
  );
  PunchControl hj28m710 (
    .bu2(stop_ok),
    .dclk(dclk_BUFGP),
    .ad1(ac10),
    .ad2(ac11),
    .ae1(ac08),
    .ae2(ac09),
    .af1(ac06),
    .af2(ac07),
    .ah1(ac04),
    .ah2(ac05),
    .bd1(bmb04__OBUF),
    .bd2(bmb05__OBUF),
    .be1(bmb06__OBUF),
    .be2(mb07),
    .bf1(bmb08__OBUF),
    .bf2(bmb03__OBUF),
    .ap2(iop4),
    .ar1(iop2),
    .ar2(iop1),
    .as2(initialize_),
    .at2(pun_feed_switch__IBUF),
    .au1(n__721),
    .av2(sync_pun_BUFGP),
    .bv1(n__721),
    .ak1(n__734),
    .ak2(n__739),
    .al1(n__735),
    .al2(n__740),
    .am1(n__737),
    .bh2(n__722),
    .am2(n__741),
    .an1(n__738),
    .an2(n__736),
    .bn2(N12),
    .bs2(N5)
  );
  INV n__501_INV_0 (
    .I(mem00_IBUF),
    .O(n__50)
  );
  Oscillator_2 m501_clock (
    .Dclk(dclk_BUFGP),
    .Enable(clock_enable_),
    .Out(clock)
  );
  defparam iot_1.INIT = 16'hFFEF;
  LUT4 iot_1 (
    .I0(uf),
    .I1(ir2),
    .I2(ir1),
    .I3(ir0_),
    .O(iot__OBUF)
  );
  FD mb02_564 (
    .D(N4225),
    .C(mb_load),
    .Q(mb02)
  );
  defparam Ker3531.INIT = 16'h4000;
  LUT4 Ker3531 (
    .I0(N103),
    .I1(ir2),
    .I2(b_fetch),
    .I3(n__748),
    .O(N353)
  );
  defparam left_shift_565.INIT = 16'hCCD8;
  LUT4_D left_shift_565 (
    .I0(CHOICE3086),
    .I1(N3980),
    .I2(N3979),
    .I3(adder_l_),
    .LO(N4219),
    .O(left_shift)
  );
  FDS mq03_566 (
    .D(N3830),
    .S(N1021),
    .C(mq_load),
    .Q(mq03)
  );
  FDS mq00_567 (
    .D(N3829),
    .S(N1068),
    .C(mq_load),
    .Q(mq00)
  );
  defparam Ker1011.INIT = 4'h7;
  LUT2 Ker1011 (
    .I0(key_dp__IBUF),
    .I1(key_ex__IBUF),
    .O(N1011)
  );
  FD ac10_568 (
    .D(regbus10),
    .C(ac_load),
    .Q(ac10)
  );
  defparam _n02601.INIT = 16'h0020;
  LUT4 _n02601 (
    .I0(mb08),
    .I1(mb07),
    .I2(N449),
    .I3(N4262),
    .O(_n0260)
  );
  defparam io_bus_in08_1.INIT = 8'h80;
  LUT3 io_bus_in08_1 (
    .I0(N56),
    .I1(N57),
    .I2(N55),
    .O(io_bus_in08_)
  );
  defparam io_bus_in07_1.INIT = 8'h80;
  LUT3 io_bus_in07_1 (
    .I0(N52),
    .I1(N53),
    .I2(N51),
    .O(io_bus_in07_)
  );
  defparam Ker4151.INIT = 16'h0002;
  LUT4 Ker4151 (
    .I0(ir1),
    .I1(ir0_),
    .I2(ir2),
    .I3(uf),
    .O(N415)
  );
  defparam _n06641.INIT = 8'h80;
  LUT3 _n06641 (
    .I0(mb10),
    .I1(mb09),
    .I2(_n0656),
    .O(double_left_rotate)
  );
  DelayLine_4 dl_n__47 (
    .Dclk(dclk_BUFGP),
    .In(n__46),
    .Out(n__47)
  );
  DelayLine_5 dl_n__40 (
    .Dclk(dclk_BUFGP),
    .In(n__38),
    .Out(n__40)
  );
  defparam badd_accepted_1.INIT = 4'h4;
  LUT2 badd_accepted_1 (
    .I0(ts1),
    .I1(add_accepted_),
    .O(badd_accepted__OBUF)
  );
  defparam _n06601.INIT = 8'h80;
  LUT3 _n06601 (
    .I0(mb10),
    .I1(mb08),
    .I2(_n0656),
    .O(double_right_rotate)
  );
  defparam n__666_569.INIT = 16'h287D;
  LUT4 n__666_569 (
    .I0(eae_on),
    .I1(sc3),
    .I2(sc4),
    .I3(N4135),
    .O(n__666)
  );
  defparam io_bus_in05_1.INIT = 8'h80;
  LUT3 io_bus_in05_1 (
    .I0(N41),
    .I1(N40),
    .I2(N39),
    .O(io_bus_in05_)
  );
  defparam _n0657156.INIT = 16'hE0C0;
  LUT4 _n0657156 (
    .I0(CHOICE3159),
    .I1(CHOICE3168),
    .I2(CHOICE3195),
    .I3(N363),
    .O(carry_insert_)
  );
  defparam Ker2321.INIT = 16'hAAAB;
  LUT4 Ker2321 (
    .I0(N396),
    .I1(sc0_3_0_),
    .I2(sc4),
    .I3(adder_l_),
    .O(N232)
  );
  defparam _n0655_570.INIT = 16'h3237;
  LUT4 _n0655_570 (
    .I0(N400),
    .I1(N3900),
    .I2(N154),
    .I3(N3899),
    .O(_n0655)
  );
  defparam io_bus_in02_1.INIT = 4'h8;
  LUT2 io_bus_in02_1 (
    .I0(N25),
    .I1(N26),
    .O(io_bus_in02_)
  );
  defparam io_bus_in00_1.INIT = 4'h8;
  LUT2 io_bus_in00_1 (
    .I0(N19),
    .I1(N20),
    .O(io_bus_in00_)
  );
  defparam io_bus_in_skip__571.INIT = 16'h8000;
  LUT4 io_bus_in_skip__571 (
    .I0(N13),
    .I1(N15),
    .I2(N12),
    .I3(N630),
    .O(io_bus_in_skip_)
  );
  defparam initialize1.INIT = 4'h1;
  LUT1 initialize1 (
    .I0(initialize_),
    .O(initialize)
  );
  defparam _n070619.INIT = 16'h00FD;
  LUT4 _n070619 (
    .I0(b_fetch),
    .I1(CHOICE3327),
    .I2(mb03),
    .I3(N4242),
    .O(CHOICE3329)
  );
  DisplayControl hj23m701 (
    .ah2(initialize),
    .bd2(iop4),
    .aj2(iop2),
    .be2(bmb07__OBUF),
    .ak1(pen_strobe),
    .ak2(mcbmb09__OBUF),
    .bf2(bmb03__OBUF),
    .bh2(bmb04__OBUF),
    .an1(mb10),
    .an2(light_pen_IBUF),
    .bj2(bmb08__OBUF),
    .ap1(mb11),
    .bk2(bmb05__OBUF),
    .bl2(mb07),
    .ar1(iop1),
    .bm2(mb06),
    .bn2(mb08),
    .ae2(z_axis),
    .aj1(pen_strobe),
    .ap2(y_strobe_OBUF),
    .ar2(clear_y__OBUF),
    .as1(x_strobe_OBUF),
    .as2(clear_x__OBUF),
    .bp2(N3),
    .br2(N10)
  );
  defparam fetch_1.INIT = 4'h1;
  LUT1 fetch_1 (
    .I0(b_fetch),
    .O(fetch__OBUF)
  );
  ClockControl h30m708 (
    .d2(stop_ok),
    .f2(biop4__OBUF),
    .l1(mb10),
    .l2(biop1__OBUF),
    .m2(mb08_1),
    .n1(mcbmb09__OBUF),
    .n2(mb07_1),
    .p1(initialize_),
    .p2(bmb06_1),
    .r1(biop2__OBUF),
    .r2(mb05_1),
    .s2(bmb04_1),
    .t2(bmb03__OBUF),
    .u2(mb09),
    .v1(overflow),
    .a1(mb11),
    .h1(NLW_h30m708_h1_UNCONNECTED),
    .j2(clock_enable_),
    .k2(clock_p4),
    .s1(clock_iot),
    .v2(load_counter),
    .c1(NLW_h30m708_c1_UNCONNECTED)
  );
  ClockCounter hj31m709 (
    .dclk(dclk_BUFGP),
    .ae1(ac00),
    .ba1(ac01),
    .ah1(ac03),
    .ak1(ac05),
    .al1(ac07),
    .an2(ac09),
    .bj1(mb10),
    .bj2(stop_ok),
    .bk1(clock_p4),
    .ap1(ac11),
    .bl1(clock_iot),
    .ar1(ac08),
    .ar2(ac10),
    .bn1(load_counter),
    .at2(ac06),
    .bp1(mcbmb10__OBUF),
    .au2(ac04),
    .av1(ac02),
    .af1(N25),
    .af2(N19),
    .bb1(N28),
    .bd1(N22),
    .aj1(N48),
    .aj2(N32),
    .am1(N56),
    .am2(N36),
    .ap2(N60),
    .bm2(clock_ac_clr_),
    .as1(N44),
    .au1(N40),
    .av2(N52),
    .bs1(overflow)
  );
  defparam Ker1051.INIT = 4'hD;
  LUT2 Ker1051 (
    .I0(eae_ir2),
    .I1(eae_ir0),
    .O(N105)
  );
  defparam n__111_572.INIT = 16'hFEEE;
  LUT4 n__111_572 (
    .I0(N353),
    .I1(N632),
    .I2(skip_),
    .I3(n__47),
    .O(n__111)
  );
  ReaderClock hj27m715 (
    .dclk(dclk_BUFGP),
    .ak2(rdr_enable_),
    .bp2(rdr_feed_switch_IBUF),
    .bs2(rdr_run_),
    .bt2(initialize),
    .as2(rdr_shift),
    .at2(rdr_shift_),
    .au2(clock1),
    .br2(stop_complete)
  );
  Monostable_2 a04a (
    .Dclk(dclk_BUFGP),
    .In(stop_ok),
    .Out(stop_ok)
  );
  defparam _n06611.INIT = 16'h1000;
  LUT4 _n06611 (
    .I0(ir2),
    .I1(ir1),
    .I2(N447),
    .I3(ts3),
    .O(and_enable)
  );
  FDP int_delay___573 (
    .D(int_enable__OBUF),
    .PRE(int_enable__OBUF),
    .C(n__122),
    .Q(int_delay__)
  );
  FDP int_sync___574 (
    .D(n__23),
    .PRE(ts1_N0),
    .C(int_strobe),
    .Q(int_sync__)
  );
  defparam n__1191.INIT = 8'hE8;
  LUT3_L n__1191 (
    .I0(N521),
    .I1(\_n0807<1> ),
    .I2(\_n0806<1> ),
    .LO(N3826)
  );
  defparam _n083623.INIT = 8'h13;
  LUT3_L _n083623 (
    .I0(pc02),
    .I1(N4105),
    .I2(pc_enable),
    .LO(CHOICE2834)
  );
  defparam Ker363_SW0.INIT = 16'h8F88;
  LUT4_L Ker363_SW0 (
    .I0(_n0707),
    .I1(io_on),
    .I2(N285),
    .I3(ts2),
    .LO(N1131)
  );
  defparam \Madd__n0028_Mxor_Result<0>_Xo<1>1_SW2 .INIT = 16'hFF45;
  LUT4 \Madd__n0028_Mxor_Result<0>_Xo<1>1_SW2  (
    .I0(eae_on),
    .I1(carry_insert_),
    .I2(btt_inst__OBUF),
    .I3(CHOICE2775),
    .O(N3976)
  );
  defparam io_bus_in01_1.INIT = 4'h8;
  LUT2 io_bus_in01_1 (
    .I0(N22),
    .I1(N23),
    .O(io_bus_in01_)
  );
  defparam Ker1541.INIT = 4'h7;
  LUT2 Ker1541 (
    .I0(b_fetch),
    .I1(mb03_2),
    .O(N154)
  );
  PlotterControl hj29m704 (
    .bu1(bmb07__OBUF),
    .bv1(bmb08__OBUF),
    .dclk(dclk_BUFGP),
    .ad2(bmb06__OBUF),
    .ae2(mb05),
    .af2(mb03),
    .ah2(bmb04__OBUF),
    .ak2(mb08),
    .bh2(iop1),
    .bl2(biop1__OBUF),
    .bm2(biop2__OBUF),
    .bn2(initialize),
    .as2(mb07),
    .bp2(iop2),
    .bt2(iop4),
    .be2(N11),
    .aj2(pen_right_OBUF),
    .bf2(N4),
    .al2(pen_left_OBUF),
    .an2(drum_up_OBUF),
    .ar2(drum_down_OBUF),
    .at2(pen_up_OBUF),
    .av2(pen_down_OBUF)
  );
  defparam n__108153.INIT = 16'hA2AA;
  LUT4 n__108153 (
    .I0(io_enable),
    .I1(skipb_IBUF),
    .I2(CHOICE2693),
    .I3(tti_skip_),
    .O(CHOICE2695)
  );
  DelayLine dl_n__14 (
    .Dclk(dclk_BUFGP),
    .In(n__17),
    .Out(n__14)
  );
  defparam n__27_575.INIT = 16'hA888;
  LUT4 n__27_575 (
    .I0(N436),
    .I1(N640),
    .I2(mb10),
    .I3(n__748),
    .O(n__27)
  );
  defparam n__6091.INIT = 4'hE;
  LUT2_D n__6091 (
    .I0(eae_run),
    .I1(eae_complete_),
    .LO(N4220),
    .O(n__609)
  );
  defparam load_ib_576.INIT = 16'hFAF8;
  LUT4 load_ib_576 (
    .I0(N634),
    .I1(mb10),
    .I2(N168),
    .I3(N440),
    .O(load_ib)
  );
  defparam load_sf_1.INIT = 8'h7F;
  LUT3 load_sf_1 (
    .I0(int_ok),
    .I1(ts4),
    .I2(int_strobe_),
    .O(load_sf_)
  );
  defparam regbus0764.INIT = 16'h0037;
  LUT4_D regbus0764 (
    .I0(N428),
    .I1(adder07),
    .I2(no_shift),
    .I3(N3876),
    .LO(N4221),
    .O(regbus07)
  );
  defparam regbus0346.INIT = 16'h020A;
  LUT4_D regbus0346 (
    .I0(CHOICE3654),
    .I1(adder04),
    .I2(N4035),
    .I3(left_shift),
    .LO(N4222),
    .O(regbus03)
  );
  FDC ib1_577 (
    .D(n__437),
    .CLR(_n0320),
    .C(load_ib),
    .Q(ib1)
  );
  defparam _n06221.INIT = 8'h10;
  LUT3 _n06221 (
    .I0(int_delay__),
    .I1(int_sync__),
    .I2(int_inhibit_),
    .O(int_ok)
  );
  DelayLine_4_1 dl_n__31 (
    .Dclk(dclk_BUFGP),
    .In(n__29),
    .Out(n__31)
  );
  DelayLine_6 dl_n__597 (
    .Dclk(dclk_BUFGP),
    .In(n__607),
    .Out(n__597)
  );
  defparam _n07041_SW0.INIT = 16'h4000;
  LUT4 _n07041_SW0 (
    .I0(N103),
    .I1(ts3),
    .I2(b_fetch),
    .I3(ir2),
    .O(N3902)
  );
  DelayLine_4_2 dl_n__49 (
    .Dclk(dclk_BUFGP),
    .In(n__44),
    .Out(n__49)
  );
  defparam Ker4411.INIT = 4'h1;
  LUT2 Ker4411 (
    .I0(mb08),
    .I1(mb07),
    .O(N4411)
  );
  FDP int_enable__578 (
    .D(mcbmb11__OBUF),
    .PRE(int_enable__N0),
    .C(n__123),
    .Q(int_enable__OBUF)
  );
  INV iop4_1_INV_0 (
    .I(iop4),
    .O(biop4__OBUF)
  );
  defparam _n06141.INIT = 4'h4;
  LUT2 _n06141 (
    .I0(int_strobe_),
    .I1(b_fetch),
    .O(n__122)
  );
  defparam regbus0464.INIT = 16'h4C00;
  LUT4_D regbus0464 (
    .I0(adder04),
    .I1(CHOICE3438),
    .I2(no_shift),
    .I3(CHOICE3441),
    .LO(N4223),
    .O(regbus04)
  );
  FD pc02_579 (
    .D(regbus02),
    .C(pc_load),
    .Q(pc02)
  );
  defparam \Madd__n0028_Mxor_Result<1>_Xo<1>1 .INIT = 8'h96;
  LUT3_D \Madd__n0028_Mxor_Result<1>_Xo<1>1  (
    .I0(\_n0791<1> ),
    .I1(\_n0792<1> ),
    .I2(N531),
    .LO(N4224),
    .O(adder10)
  );
  defparam regbus0263.INIT = 16'h0037;
  LUT4_D regbus0263 (
    .I0(N428),
    .I1(adder02),
    .I2(no_shift),
    .I3(N3878),
    .LO(N4225),
    .O(regbus02)
  );
  INV pause_1_INV_0 (
    .I(pause),
    .O(pause__OBUF)
  );
  INV run_1_INV_0 (
    .I(run),
    .O(brun__OBUF)
  );
  INV ts3_1_INV_0 (
    .I(ts3),
    .O(bts3_OBUF)
  );
  FD ma00_580 (
    .D(regbus00),
    .C(ma_load),
    .Q(ma00)
  );
  INV iop1_1_INV_0 (
    .I(iop1),
    .O(biop1__OBUF)
  );
  FD pc01_581 (
    .D(N4235),
    .C(pc_load),
    .Q(pc01)
  );
  FD pc00_582 (
    .D(N4217),
    .C(pc_load),
    .Q(pc00)
  );
  FD ma01_583 (
    .D(regbus01),
    .C(ma_load),
    .Q(ma01)
  );
  INV ts1_1_INV_0 (
    .I(ts1),
    .O(bts1_OBUF)
  );
  defparam _n07041_SW2.INIT = 16'hFF7F;
  LUT4 _n07041_SW2 (
    .I0(b_fetch),
    .I1(ts3),
    .I2(N417),
    .I3(uf),
    .O(N3906)
  );
  INV mq08_1_INV_0 (
    .I(mq08),
    .O(mq08__OBUF)
  );
  defparam Ker501.INIT = 8'hE8;
  LUT3 Ker501 (
    .I0(\_n0798<0> ),
    .I1(N4251),
    .I2(\_n0797<0> ),
    .O(N50)
  );
  defparam Ker531.INIT = 8'hE8;
  LUT3 Ker531 (
    .I0(N4214),
    .I1(carry_insert_),
    .I2(\_n0791<0> ),
    .O(N531)
  );
  defparam Ker1101.INIT = 4'hE;
  LUT2 Ker1101 (
    .I0(ir0_),
    .I1(ir1),
    .O(N110)
  );
  defparam _n0618.INIT = 16'h1110;
  LUT4 _n0618 (
    .I0(mb08),
    .I1(N4165),
    .I2(mb11),
    .I3(mb10),
    .O(n__123)
  );
  defparam n__6481.INIT = 4'h8;
  LUT2 n__6481 (
    .I0(right_shift),
    .I1(mq01),
    .O(N3827)
  );
  defparam io_bus_in09_1.INIT = 8'h80;
  LUT3 io_bus_in09_1 (
    .I0(N61),
    .I1(N59),
    .I2(N60),
    .O(io_bus_in09_)
  );
  defparam Ker4281.INIT = 16'h4044;
  LUT4 Ker4281 (
    .I0(s_),
    .I1(ts2),
    .I2(hs),
    .I3(mem00_IBUF),
    .O(N428)
  );
  defparam n__556_SW1.INIT = 16'hFF7F;
  LUT4 n__556_SW1 (
    .I0(mb06),
    .I1(mb09),
    .I2(N415),
    .I3(n__452),
    .O(N4171)
  );
  defparam n__558_SW0.INIT = 16'hC040;
  LUT4 n__558_SW0 (
    .I0(mb08),
    .I1(n__748),
    .I2(N436),
    .I3(mb07),
    .O(N674)
  );
  defparam ma_enable5_11_584.INIT = 16'h5553;
  LUT4_D ma_enable5_11_584 (
    .I0(N3909),
    .I1(N3908),
    .I2(N154),
    .I3(N400),
    .LO(N4226),
    .O(ma_enable5_11)
  );
  FD mb11_585 (
    .D(regbus11),
    .C(mb_load),
    .Q(mb11)
  );
  FD sc0_586 (
    .D(n__661),
    .C(sc_load),
    .Q(sc0)
  );
  FDCP eae_tg_587 (
    .D(n__603),
    .CLR(run_N0),
    .PRE(n__596),
    .C(n__605),
    .Q(eae_tg)
  );
  FDCP eae_run_588 (
    .D(eae_on),
    .CLR(run_N0),
    .PRE(_n0189),
    .C(n__596),
    .Q(eae_run)
  );
  FDC eae_on_589 (
    .D(N4220),
    .CLR(run_N0),
    .C(n__607),
    .Q(eae_on)
  );
  FDC eae_ir2_590 (
    .D(mb10),
    .CLR(n__51),
    .C(n__600),
    .Q(eae_ir2)
  );
  FDC eae_ir1_591 (
    .D(mb09),
    .CLR(n__51),
    .C(n__600),
    .Q(eae_ir1)
  );
  defparam io_bus_in04_1.INIT = 8'h80;
  LUT3 io_bus_in04_1 (
    .I0(N33),
    .I1(N31),
    .I2(N32),
    .O(io_bus_in04_)
  );
  defparam n__6471.INIT = 4'h8;
  LUT2 n__6471 (
    .I0(right_shift),
    .I1(mq00),
    .O(N3828)
  );
  defparam _n070369.INIT = 16'h0020;
  LUT4_D _n070369 (
    .I0(ts4),
    .I1(int_ok),
    .I2(CHOICE3273),
    .I3(N354),
    .LO(N4227),
    .O(_n0703)
  );
  FD sc4_592 (
    .D(n__667),
    .C(sc_load),
    .Q(sc4)
  );
  FD sc3_593 (
    .D(n__666),
    .C(sc_load),
    .Q(sc3)
  );
  FD sc2_594 (
    .D(n__665),
    .C(sc_load),
    .Q(sc2)
  );
  FD sc1_595 (
    .D(n__664),
    .C(sc_load),
    .Q(sc1)
  );
  INV eae_end_Aset_INV1_INV_0 (
    .I(eae_run),
    .O(eae_end_N0)
  );
  INV mcbmb10_1_INV_0 (
    .I(mb10),
    .O(mcbmb10__OBUF)
  );
  INV mcbmb11_1_INV_0 (
    .I(mb11),
    .O(mcbmb11__OBUF)
  );
  INV ac10_1_INV_0 (
    .I(ac10),
    .O(ac10__OBUF)
  );
  INV ac11_1_INV_0 (
    .I(ac11),
    .O(ac11__OBUF)
  );
  INV sc1_1_INV_0 (
    .I(sc1),
    .O(sc1__OBUF)
  );
  INV sc0_1_INV_0 (
    .I(sc0),
    .O(sc0__OBUF)
  );
  INV mq03_1_INV_0 (
    .I(mq03),
    .O(mq03__OBUF)
  );
  INV tp11_INV_0 (
    .I(strobe__OBUF),
    .O(tp1)
  );
  INV ac08_1_INV_0 (
    .I(ac08),
    .O(ac08__OBUF)
  );
  INV ac09_1_INV_0 (
    .I(ac09),
    .O(ac09__OBUF)
  );
  INV ma10_1_INV_0 (
    .I(ma10),
    .O(ma10__OBUF)
  );
  INV ma11_1_INV_0 (
    .I(ma11),
    .O(ma11__OBUF)
  );
  INV pc10_1_INV_0 (
    .I(pc10),
    .O(pc10__OBUF)
  );
  INV pc11_1_INV_0 (
    .I(pc11),
    .O(pc11__OBUF)
  );
  INV btp31_INV_0 (
    .I(n__748),
    .O(btp3_OBUF)
  );
  FD mb07_596 (
    .D(N4221),
    .C(mb_load),
    .Q(mb07)
  );
  FD mb06_597 (
    .D(N4239),
    .C(mb_load),
    .Q(mb06)
  );
  FD pc07_598 (
    .D(regbus07),
    .C(pc_load),
    .Q(pc07)
  );
  FD pc06_599 (
    .D(regbus06),
    .C(pc_load),
    .Q(pc06)
  );
  defparam n__437_600.INIT = 16'hF888;
  LUT4 n__437_600 (
    .I0(sr_enable),
    .I1(ifsr1_IBUF),
    .I2(N436),
    .I3(N662),
    .O(n__437)
  );
  FD ma09_601 (
    .D(N4232),
    .C(ma_load),
    .Q(ma09)
  );
  FD ma08_602 (
    .D(N4243),
    .C(ma_load),
    .Q(ma08)
  );
  FD ac07_603 (
    .D(regbus07),
    .C(ac_load),
    .Q(ac07)
  );
  FD ac06_604 (
    .D(regbus06),
    .C(ac_load),
    .Q(ac06)
  );
  defparam n__483_605.INIT = 16'hF888;
  LUT4 n__483_605 (
    .I0(sr_enable),
    .I1(dfsr0_IBUF),
    .I2(mb06),
    .I3(N660),
    .O(n__483)
  );
  defparam \Madd__n0031_Mxor_Result<1>_Xo<1>1 .INIT = 8'h96;
  LUT3 \Madd__n0031_Mxor_Result<1>_Xo<1>1  (
    .I0(\_n0800<1> ),
    .I1(\_n0801<1> ),
    .I2(N491),
    .O(adder04)
  );
  defparam n__6491.INIT = 4'h8;
  LUT2 n__6491 (
    .I0(right_shift),
    .I1(mq02),
    .O(N3830)
  );
  defparam Ker42924.INIT = 16'h2AAA;
  LUT4 Ker42924 (
    .I0(CHOICE3153),
    .I1(mb03_2),
    .I2(mb11),
    .I3(N3942),
    .O(CHOICE3154)
  );
  defparam \Madd__n0028_Mxor_Result<0>_Xo<1>1_SW5 .INIT = 16'hFCF8;
  LUT4_L \Madd__n0028_Mxor_Result<0>_Xo<1>1_SW5  (
    .I0(N428),
    .I1(N4003),
    .I2(N3923),
    .I3(no_shift),
    .LO(N3983)
  );
  defparam _n07401.INIT = 16'hC040;
  LUT4 _n07401 (
    .I0(ir1),
    .I1(mb03),
    .I2(b_fetch),
    .I3(ir0_),
    .O(d_set)
  );
  defparam mp_int__Aset_INV.INIT = 16'h5755;
  LUT4 mp_int__Aset_INV (
    .I0(initialize_),
    .I1(mb06),
    .I2(N4141),
    .I3(mb05),
    .O(mp_int__N0)
  );
  defparam bstlr1.INIT = 8'h20;
  LUT3 bstlr1 (
    .I0(mem_done__OBUF),
    .I1(s_),
    .I2(ts1),
    .O(bstlr_OBUF)
  );
  FD ma07_606 (
    .D(regbus07),
    .C(ma_load),
    .Q(ma07)
  );
  FD ma06_607 (
    .D(regbus06),
    .C(ma_load),
    .Q(ma06)
  );
  FD ac05_608 (
    .D(N4215),
    .C(ac_load),
    .Q(ac05)
  );
  defparam Ker41857.INIT = 16'h0001;
  LUT4 Ker41857 (
    .I0(mq11),
    .I1(mq10),
    .I2(mq01),
    .I3(N4121),
    .O(N418)
  );
  defparam Ker4481.INIT = 4'hD;
  LUT2 Ker4481 (
    .I0(eae_ir0),
    .I1(eae_ir2),
    .O(N448)
  );
  defparam \Madd__n0032_Mxor_Result<1>_Xo<1>1 .INIT = 8'h96;
  LUT3_D \Madd__n0032_Mxor_Result<1>_Xo<1>1  (
    .I0(\_n0803<1> ),
    .I1(\_n0804<1> ),
    .I2(N511),
    .LO(N4228),
    .O(adder02)
  );
  FD mb00_609 (
    .D(regbus00),
    .C(mb_load),
    .Q(mb00)
  );
  INV bmb07_1_INV_0 (
    .I(mb07_1),
    .O(bmb07__OBUF)
  );
  INV ac06_1_INV_0 (
    .I(ac06),
    .O(ac06__OBUF)
  );
  INV ac07_1_INV_0 (
    .I(ac07),
    .O(ac07__OBUF)
  );
  INV ma08_1_INV_0 (
    .I(ma08),
    .O(ma08__OBUF)
  );
  INV ma09_1_INV_0 (
    .I(ma09),
    .O(ma09__OBUF)
  );
  INV pc08_1_INV_0 (
    .I(pc08),
    .O(pc08__OBUF)
  );
  INV pc09_1_INV_0 (
    .I(pc09),
    .O(pc09__OBUF)
  );
  FD mb01_610 (
    .D(regbus01),
    .C(mb_load),
    .Q(mb01)
  );
  INV ma06_1_INV_0 (
    .I(ma06),
    .O(ma06__OBUF)
  );
  INV ma07_1_INV_0 (
    .I(ma07),
    .O(ma07__OBUF)
  );
  INV pc06_1_INV_0 (
    .I(pc06),
    .O(pc06__OBUF)
  );
  INV pc07_1_INV_0 (
    .I(pc07),
    .O(pc07__OBUF)
  );
  INV bmb06_1_INV_0 (
    .I(mb06_1),
    .O(bmb06__OBUF)
  );
  defparam n__484_611.INIT = 16'hF888;
  LUT4 n__484_611 (
    .I0(sr_enable),
    .I1(dfsr1_IBUF),
    .I2(N436),
    .I3(N664),
    .O(n__484)
  );
  defparam hole81.INIT = 4'h7;
  LUT2 hole81 (
    .I0(n__734),
    .I1(n__722),
    .O(hole8_OBUF)
  );
  defparam hole71.INIT = 4'h7;
  LUT2 hole71 (
    .I0(n__735),
    .I1(n__722),
    .O(hole7_OBUF)
  );
  defparam hole61.INIT = 4'h7;
  LUT2 hole61 (
    .I0(n__737),
    .I1(n__722),
    .O(hole6_OBUF)
  );
  defparam hole51.INIT = 4'h7;
  LUT2 hole51 (
    .I0(n__738),
    .I1(n__722),
    .O(hole5_OBUF)
  );
  defparam n__436_612.INIT = 16'hF888;
  LUT4 n__436_612 (
    .I0(sr_enable),
    .I1(ifsr2_IBUF),
    .I2(N436),
    .I3(N666),
    .O(n__436)
  );
  defparam Ker3501_SW1.INIT = 8'hB3;
  LUT3_L Ker3501_SW1 (
    .I0(adder08),
    .I1(CHOICE3532),
    .I2(left_shift),
    .LO(N3876)
  );
  FDCP usf_613 (
    .D(a04c1),
    .CLR(initialize),
    .PRE(_n0233),
    .C(n__569),
    .Q(usf)
  );
  FDC brk_sync_614 (
    .D(brk_rqst),
    .CLR(ts1_N0),
    .C(tp1),
    .Q(brk_sync)
  );
  INV mq01_1_INV_0 (
    .I(mq01),
    .O(mq01__OBUF)
  );
  INV mq06_1_INV_0 (
    .I(mq06),
    .O(mq06__OBUF)
  );
  defparam _n00241.INIT = 4'h8;
  LUT2 _n00241 (
    .I0(run),
    .I1(n__748),
    .O(_n0024)
  );
  FD ac08_615 (
    .D(regbus08),
    .C(ac_load),
    .Q(ac08)
  );
  FD mb09_616 (
    .D(regbus09),
    .C(mb_load),
    .Q(mb09)
  );
  FD mb08_617 (
    .D(regbus08),
    .C(mb_load),
    .Q(mb08)
  );
  FD pc09_618 (
    .D(regbus09),
    .C(pc_load),
    .Q(pc09)
  );
  FD pc08_619 (
    .D(regbus08),
    .C(pc_load),
    .Q(pc08)
  );
  defparam _n0741_SW1.INIT = 16'hEEEF;
  LUT4 _n0741_SW1 (
    .I0(word_count),
    .I1(current_address),
    .I2(s_),
    .I3(mb11_1),
    .O(N1127)
  );
  defparam hole41.INIT = 4'h7;
  LUT2 hole41 (
    .I0(n__739),
    .I1(n__722),
    .O(hole4_OBUF)
  );
  defparam hole31.INIT = 4'h7;
  LUT2 hole31 (
    .I0(n__740),
    .I1(n__722),
    .O(hole3_OBUF)
  );
  defparam hole21.INIT = 4'h7;
  LUT2 hole21 (
    .I0(n__741),
    .I1(n__722),
    .O(hole2_OBUF)
  );
  defparam hole11.INIT = 4'h7;
  LUT2 hole11 (
    .I0(n__736),
    .I1(n__722),
    .O(hole1_OBUF)
  );
  defparam _n00271.INIT = 4'hD;
  LUT2 _n00271 (
    .I0(power_clear__IBUF),
    .I1(mftp2),
    .O(_n0027)
  );
  defparam _n00251.INIT = 4'h4;
  LUT2 _n00251 (
    .I0(strobe__OBUF),
    .I1(manual_preset_),
    .O(_n0025)
  );
  FD ac00_620 (
    .D(regbus00),
    .C(ac_load),
    .Q(ac00)
  );
  INV ac03_1_INV_0 (
    .I(ac03),
    .O(ac03__OBUF)
  );
  INV ma04_1_INV_0 (
    .I(ma04),
    .O(ma04__OBUF)
  );
  INV ma05_1_INV_0 (
    .I(ma05),
    .O(ma05__OBUF)
  );
  INV pc04_1_INV_0 (
    .I(pc04),
    .O(pc04__OBUF)
  );
  INV pc05_1_INV_0 (
    .I(pc05),
    .O(pc05__OBUF)
  );
  INV bmb04_1_INV_0 (
    .I(mb04_1),
    .O(bmb04__OBUF)
  );
  INV bmb05_1_INV_0 (
    .I(mb05_1),
    .O(bmb05__OBUF)
  );
  defparam Ker4371.INIT = 16'h44C4;
  LUT4 Ker4371 (
    .I0(eae_ir1),
    .I1(eae_on),
    .I2(eae_ir2),
    .I3(eae_ir0),
    .O(N437)
  );
  defparam Ker4301.INIT = 8'h01;
  LUT3 Ker4301 (
    .I0(_n0260),
    .I1(_n0256),
    .I2(_n0259),
    .O(N430)
  );
  INV pc02_1_INV_0 (
    .I(pc02),
    .O(pc02__OBUF)
  );
  INV pc03_1_INV_0 (
    .I(pc03),
    .O(pc03__OBUF)
  );
  INV mcbmb02_1_INV_0 (
    .I(mb02),
    .O(mcbmb02__OBUF)
  );
  INV bmb03_1_INV_0 (
    .I(mb03_1),
    .O(bmb03__OBUF)
  );
  INV ac02_1_INV_0 (
    .I(ac02),
    .O(ac02__OBUF)
  );
  INV df1_1_INV_0 (
    .I(df1),
    .O(df1__OBUF)
  );
  DelayLine_1 dl_n__4 (
    .Dclk(dclk_BUFGP),
    .In(b_mem_to_lsr_OBUF),
    .Out(n__4)
  );
  defparam _n070636.INIT = 16'h4044;
  LUT4_D _n070636 (
    .I0(_n0703),
    .I1(CHOICE3329),
    .I2(CHOICE3320),
    .I3(mem_enable5_8),
    .LO(N4229),
    .O(_n0706)
  );
  DelayLine_5_1 dl_n__33 (
    .Dclk(dclk_BUFGP),
    .In(n__31),
    .Out(n__33)
  );
  defparam sr_enable_1.INIT = 16'hFCF4;
  LUT4 sr_enable_1 (
    .I0(key_la__IBUF),
    .I1(N442),
    .I2(N4253),
    .I3(N4311),
    .O(sr_enable0)
  );
  INV df0_1_INV_0 (
    .I(df0),
    .O(df0__OBUF)
  );
  defparam n__137173.INIT = 8'h80;
  LUT3 n__137173 (
    .I0(eae_on),
    .I1(eae_ir0),
    .I2(eae_ir1),
    .O(CHOICE2746)
  );
  INV sc3_1_INV_0 (
    .I(sc3),
    .O(sc3__OBUF)
  );
  defparam Ker3471.INIT = 8'hF2;
  LUT3 Ker3471 (
    .I0(ts2),
    .I1(c_),
    .I2(_n0054),
    .O(N347)
  );
  INV mq00_1_INV_0 (
    .I(mq00),
    .O(mq00__OBUF)
  );
  defparam if_enable__621.INIT = 16'hFEEE;
  LUT4 if_enable__621 (
    .I0(word_count),
    .I1(N644),
    .I2(N429),
    .I3(brk_sync),
    .O(if_enable_)
  );
  defparam _n00541.INIT = 16'h4000;
  LUT4_D _n00541 (
    .I0(c_),
    .I1(b_r0__IBUF),
    .I2(ts3),
    .I3(mb11_1),
    .LO(N4230),
    .O(_n0054)
  );
  defparam _n0741_622.INIT = 16'h5547;
  LUT4_D _n0741_622 (
    .I0(N3914),
    .I1(N154),
    .I2(N3913),
    .I3(N400),
    .LO(N4231),
    .O(_n0741)
  );
  DelayLine_4_3 dl_n__44 (
    .Dclk(dclk_BUFGP),
    .In(n__41),
    .Out(n__44)
  );
  defparam line_hold_1.INIT = 16'hEFFF;
  LUT4 line_hold_1 (
    .I0(c_),
    .I1(b_r0__IBUF),
    .I2(ts3),
    .I3(mb11),
    .O(b_line_hold__OBUF)
  );
  defparam Ker551.INIT = 4'hE;
  LUT2 Ker551 (
    .I0(mb09),
    .I1(mb10),
    .O(N551)
  );
  FDC ir2_623 (
    .D(mem02_IBUF),
    .CLR(_n0742),
    .C(n__51),
    .Q(ir2)
  );
  FDCP skip__624 (
    .D(n__108),
    .CLR(run_N0),
    .PRE(pc_load),
    .C(n__111),
    .Q(skip_)
  );
  INV df2_1_INV_0 (
    .I(df2),
    .O(df2__OBUF)
  );
  DelayLine_5_2 dl_n__596 (
    .Dclk(dclk_BUFGP),
    .In(n__607),
    .Out(n__596)
  );
  FDC ir0__625 (
    .D(n__50),
    .CLR(_n0742),
    .C(n__51),
    .Q(ir0_)
  );
  defparam n__137251.INIT = 16'hFAF8;
  LUT4 n__137251 (
    .I0(btt_inst__OBUF),
    .I1(CHOICE2712),
    .I2(CHOICE2753),
    .I3(CHOICE2722),
    .O(n__137)
  );
  defparam regbus0945.INIT = 16'h5300;
  LUT4_D regbus0945 (
    .I0(N3971),
    .I1(N3970),
    .I2(no_shift),
    .I3(CHOICE3674),
    .LO(N4232),
    .O(regbus09)
  );
  defparam s_set_1.INIT = 4'hD;
  LUT2 s_set_1 (
    .I0(mb10),
    .I1(btt_inst__OBUF),
    .O(s_set_)
  );
  defparam _n0741_SW0.INIT = 4'hE;
  LUT2 _n0741_SW0 (
    .I0(word_count),
    .I1(current_address),
    .O(N1126)
  );
  FD ac01_626 (
    .D(regbus01),
    .C(ac_load),
    .Q(ac01)
  );
  INV ma01_1_INV_0 (
    .I(ma01),
    .O(ma01__OBUF)
  );
  INV pc00_1_INV_0 (
    .I(pc00),
    .O(pc00__OBUF)
  );
  INV pc01_1_INV_0 (
    .I(pc01),
    .O(pc01__OBUF)
  );
  INV mcbmb00_1_INV_0 (
    .I(mb00),
    .O(mcbmb00__OBUF)
  );
  INV mcbmb01_1_INV_0 (
    .I(mb01),
    .O(mcbmb01__OBUF)
  );
  INV ac00_1_INV_0 (
    .I(ac00),
    .O(ac00__OBUF)
  );
  INV ac01_1_INV_0 (
    .I(ac01),
    .O(ac01__OBUF)
  );
  defparam n__46_627.INIT = 8'hF8;
  LUT3 n__46_627 (
    .I0(mb09),
    .I1(n__43),
    .I2(N1039),
    .O(n__46)
  );
  defparam \Madd__n0033_Mxor_Result<1>_Xo<1>1 .INIT = 8'h96;
  LUT3_D \Madd__n0033_Mxor_Result<1>_Xo<1>1  (
    .I0(\_n0806<1> ),
    .I1(\_n0807<1> ),
    .I2(N521),
    .LO(N4233),
    .O(adder00)
  );
  INV sc2_1_INV_0 (
    .I(sc2),
    .O(sc2__OBUF)
  );
  defparam Ker435.INIT = 16'h4000;
  LUT4 Ker435 (
    .I0(eae_on),
    .I1(N417),
    .I2(b_execute),
    .I3(N636),
    .O(N435)
  );
  defparam manual_preset__628.INIT = 16'h0F08;
  LUT4 manual_preset__628 (
    .I0(N4143),
    .I1(key_st__IBUF),
    .I2(run),
    .I3(restart),
    .O(manual_preset_1)
  );
  INV link_1_INV_0 (
    .I(link),
    .O(link__OBUF)
  );
  INV ma00_1_INV_0 (
    .I(ma00),
    .O(ma00__OBUF)
  );
  INV if1_1_INV_0 (
    .I(if1),
    .O(if1__OBUF)
  );
  defparam int_strobe1.INIT = 16'hFF4F;
  LUT4 int_strobe1 (
    .I0(N658),
    .I1(n__748),
    .I2(eae_end),
    .I3(n__49),
    .O(int_strobe)
  );
  defparam io_bus_in10_1.INIT = 8'h80;
  LUT3 io_bus_in10_1 (
    .I0(N37),
    .I1(N35),
    .I2(N36),
    .O(io_bus_in10_)
  );
  defparam ma_load1.INIT = 16'hFAF8;
  LUT4 ma_load1 (
    .I0(mftp1),
    .I1(N90),
    .I2(tp4),
    .I3(restart),
    .O(ma_load)
  );
  defparam n__6771.INIT = 16'h7FFF;
  LUT4 n__6771 (
    .I0(sc1),
    .I1(sc2),
    .I2(sc3),
    .I3(sc4),
    .O(n__677)
  );
  INV mq05_1_INV_0 (
    .I(mq05),
    .O(mq05__OBUF)
  );
  INV defer_1_INV_0 (
    .I(defer),
    .O(defer__OBUF)
  );
  FDC mfts2_629 (
    .D(stop_ok),
    .CLR(_n0027),
    .C(mftp1),
    .Q(mfts2)
  );
  FDCP ts3_630 (
    .D(a04c1),
    .CLR(ts1_N0),
    .PRE(mb_load),
    .C(n__748),
    .Q(ts3)
  );
  defparam \Madd__n0031_Mxor_Result<0>_Xo<1>1 .INIT = 8'h96;
  LUT3 \Madd__n0031_Mxor_Result<0>_Xo<1>1  (
    .I0(\_n0800<0> ),
    .I1(\_n0801<0> ),
    .I2(carry_out6_),
    .O(adder05)
  );
  INV if2_1_INV_0 (
    .I(if2),
    .O(if2__OBUF)
  );
  defparam mq_load1.INIT = 16'h80FF;
  LUT4 mq_load1 (
    .I0(n__748),
    .I1(N433),
    .I2(mb07),
    .I3(eae_tg),
    .O(mq_load)
  );
  defparam Ker4331.INIT = 16'h8000;
  LUT4 Ker4331 (
    .I0(mb11),
    .I1(b_fetch),
    .I2(mb03),
    .I3(N417),
    .O(N433)
  );
  defparam Ker2311.INIT = 4'hD;
  LUT2 Ker2311 (
    .I0(key_st__IBUF),
    .I1(restart),
    .O(N2311)
  );
  Oscillator m452_hz880 (
    .Dclk(dclk_BUFGP),
    .Enable(stop_ok),
    .Out(hz880)
  );
  defparam Ker4401.INIT = 16'h1000;
  LUT4 Ker4401 (
    .I0(mb08),
    .I1(mb07),
    .I2(mb06),
    .I3(mb09),
    .O(N440)
  );
  defparam _n00701.INIT = 16'h0001;
  LUT4 _n00701 (
    .I0(mb04_2),
    .I1(N3844),
    .I2(N4014),
    .I3(N3968),
    .O(_n0070)
  );
  defparam no_shift1.INIT = 16'h775F;
  LUT4_D no_shift1 (
    .I0(_n0061),
    .I1(N4001),
    .I2(N4000),
    .I3(adder_l_),
    .LO(N4234),
    .O(no_shift)
  );
  defparam io_bus_in11_1.INIT = 8'h80;
  LUT3_L io_bus_in11_1 (
    .I0(N45),
    .I1(N43),
    .I2(N44),
    .LO(io_bus_in11_)
  );
  ReaderControl hj26m705 (
    .ad1(rd_hole2_IBUF),
    .ad2(rd_hole1_IBUF),
    .ae1(rd_hole4_IBUF),
    .ae2(rd_hole3_IBUF),
    .af1(rd_hole8_IBUF),
    .af2(rd_hole7_IBUF),
    .ah1(rd_hole6_IBUF),
    .ah2(rd_hole5_IBUF),
    .bd1(rdr_shift_),
    .bd2(bmb03__OBUF),
    .be1(bmb05_1),
    .be2(bmb04_1),
    .bf1(bmb07__OBUF),
    .bf2(bmb06_1),
    .bh2(mb08_1),
    .bj1(rdr_shift),
    .bk1(iop4),
    .bm1(rdr_feed_switch_IBUF),
    .bm2(s_feed_hole_IBUF),
    .bn2(stop_complete),
    .bp1(initialize_),
    .au2(iop1),
    .av2(iop2),
    .bs2(clock1),
    .bu2(bb_OBUF),
    .ak1(rdr_run_),
    .ak2(N13),
    .al2(N6),
    .an1(N43),
    .an2(N51),
    .ap1(N59),
    .bk2(rdr_enable_),
    .ap2(N31),
    .ar1(N47),
    .ar2(N35),
    .as1(N55),
    .as2(N39),
    .bp2(ba_OBUF),
    .br1(bb__OBUF),
    .br2(pwr_OBUF),
    .bs1(ba__OBUF)
  );
  CardReaderControl j33m714 (
    .d1(mb06),
    .d2(mb04_1),
    .e1(mb08_1),
    .e2(bmb06_1),
    .f1(iop4),
    .f2(iop1),
    .h2(iop2),
    .j1(index_markers_IBUF),
    .k1(i_m_d),
    .n1(initialize_),
    .r2(cr_ready_IBUF),
    .u2(c_i_r_BUFGP),
    .a1(mb07_1),
    .b1(bmb05_1),
    .c1(mb03_1),
    .n2(N8),
    .p1(iot632),
    .p2(N15),
    .r1(iot634),
    .s2(cr_read_OBUF)
  );
  INV mq07_1_INV_0 (
    .I(mq07),
    .O(mq07__OBUF)
  );
  defparam Ker4511.INIT = 16'h1000;
  LUT4 Ker4511 (
    .I0(eae_ir2),
    .I1(eae_ir1),
    .I2(eae_ir0),
    .I3(N433),
    .O(N4511)
  );
  defparam b_set1.INIT = 16'hFF80;
  LUT4 b_set1 (
    .I0(N429),
    .I1(n3cycle_IBUF),
    .I2(brk_sync),
    .I3(current_address),
    .O(b_set)
  );
  FDC ir1_631 (
    .D(mem01_IBUF),
    .CLR(_n0742),
    .C(n__51),
    .Q(ir1)
  );
  defparam io_bus_in03_1.INIT = 4'h8;
  LUT2 io_bus_in03_1 (
    .I0(N28),
    .I1(N29),
    .O(io_bus_in03_)
  );
  FD ma02_632 (
    .D(regbus02),
    .C(ma_load),
    .Q(ma02)
  );
  FD mb03_633 (
    .D(N4222),
    .C(mb_load),
    .Q(mb03)
  );
  INV mq02_1_INV_0 (
    .I(mq02),
    .O(mq02__OBUF)
  );
  defparam Ker2191.INIT = 4'h7;
  LUT2 Ker2191 (
    .I0(sc3),
    .I1(sc4),
    .O(N219)
  );
  FDS mq01_634 (
    .D(N3828),
    .S(N1015),
    .C(mq_load),
    .Q(mq01)
  );
  defparam Ker42955.INIT = 16'h5040;
  LUT4 Ker42955 (
    .I0(int_ok),
    .I1(N3511),
    .I2(_n0741),
    .I3(CHOICE3154),
    .O(N429)
  );
  defparam Ker4361.INIT = 4'h4;
  LUT2 Ker4361 (
    .I0(n__452),
    .I1(N415),
    .O(N436)
  );
  INV mq11_1_INV_0 (
    .I(mq11),
    .O(mq11__OBUF)
  );
  FD ma03_635 (
    .D(regbus03),
    .C(ma_load),
    .Q(ma03)
  );
  defparam isz_1.INIT = 8'hF7;
  LUT3 isz_1 (
    .I0(ir0_),
    .I1(ir1),
    .I2(ir2),
    .O(isz__OBUF)
  );
  defparam _n0655_SW2_SW0.INIT = 4'hD;
  LUT2 _n0655_SW2_SW0 (
    .I0(c_),
    .I1(N1115),
    .O(N4191)
  );
  defparam _n02241.INIT = 16'hA8AA;
  LUT4 _n02241 (
    .I0(ub),
    .I1(run),
    .I2(key_la__IBUF),
    .I3(restart),
    .O(n__560)
  );
  FD ac09_636 (
    .D(regbus09),
    .C(ac_load),
    .Q(ac09)
  );
  DelayLine_4_4 dl_n__34 (
    .Dclk(dclk_BUFGP),
    .In(n__31),
    .Out(n__34)
  );
  defparam Ker541.INIT = 8'hE8;
  LUT3 Ker541 (
    .I0(\_n0795<0> ),
    .I1(N4252),
    .I2(\_n0794<0> ),
    .O(N541)
  );
  defparam Ker4171.INIT = 8'h20;
  LUT3 Ker4171 (
    .I0(ir1),
    .I1(ir0_),
    .I2(ir2),
    .O(N417)
  );
  defparam right_shift27.INIT = 16'hEEFE;
  LUT4 right_shift27 (
    .I0(_n0070),
    .I1(N4091),
    .I2(N347),
    .I3(hs),
    .O(right_shift)
  );
  defparam _n02061.INIT = 4'h8;
  LUT2 _n02061 (
    .I0(n__748),
    .I1(N433),
    .O(n__600)
  );
  INV if0_1_INV_0 (
    .I(if0),
    .O(if0__OBUF)
  );
  defparam Ker4241.INIT = 16'h1000;
  LUT4 Ker4241 (
    .I0(s_),
    .I1(hs),
    .I2(ts2),
    .I3(mem00_IBUF),
    .O(N424)
  );
  FD ac04_637 (
    .D(N4223),
    .C(ac_load),
    .Q(ac04)
  );
  defparam run_N01.INIT = 4'h1;
  LUT1 run_N01 (
    .I0(power_clear__IBUF),
    .O(run_N0)
  );
  defparam _n06211.INIT = 8'hC4;
  LUT3 _n06211 (
    .I0(key_st__IBUF),
    .I1(mftp2),
    .I2(restart),
    .O(_n0621)
  );
  FDS mq02_638 (
    .D(N3827),
    .S(N1013),
    .C(mq_load),
    .Q(mq02)
  );
  Monostable b10e2 (
    .Dclk(dclk_BUFGP),
    .In(_n0024),
    .Out(strobe__OBUF)
  );
  Oscillator_1 m452_tto_clock_ (
    .Dclk(dclk_BUFGP),
    .Enable(stop_ok),
    .Out(tto_clock_)
  );
  defparam Ker4311.INIT = 8'h01;
  LUT3 Ker4311 (
    .I0(mfts1),
    .I1(mfts2),
    .I2(key_dp__IBUF),
    .O(N4311)
  );
  defparam Ker4341.INIT = 8'h80;
  LUT3_L Ker4341 (
    .I0(mb04_3),
    .I1(mb09_2),
    .I2(N449),
    .LO(N434)
  );
  FDS wc_overflow__639 (
    .D(N3826),
    .S(N1093),
    .C(mb_load),
    .Q(wc_overflow_)
  );
  FD ma04_640 (
    .D(regbus04),
    .C(ma_load),
    .Q(ma04)
  );
  FD ac03_641 (
    .D(regbus03),
    .C(ac_load),
    .Q(ac03)
  );
  FD ac02_642 (
    .D(regbus02),
    .C(ac_load),
    .Q(ac02)
  );
  defparam execute_1.INIT = 4'h1;
  LUT1 execute_1 (
    .I0(b_execute),
    .O(execute__OBUF)
  );
  FD mb03_3_643 (
    .D(regbus03),
    .C(mb_load),
    .Q(mb03_3)
  );
  FDCP ts2_644 (
    .D(a04c1),
    .CLR(ts1_N0),
    .PRE(tp1),
    .C(mb_load),
    .Q(ts2)
  );
  DelayLine_5_3 dl_n__48 (
    .Dclk(dclk_BUFGP),
    .In(n__44),
    .Out(n__48)
  );
  OBUF bac09_OBUF (
    .I(ac09),
    .O(bac09)
  );
  defparam tt_inst_1_SW1.INIT = 8'hF7;
  LUT3 tt_inst_1_SW1 (
    .I0(s_),
    .I1(c_),
    .I2(N1115),
    .O(N3900)
  );
  defparam _n083546_SW0.INIT = 16'hD5FF;
  LUT4 _n083546_SW0 (
    .I0(in05_IBUF),
    .I1(s_uf),
    .I2(_n0256),
    .I3(tt1_),
    .O(N4047)
  );
  FD mb05_645 (
    .D(regbus05),
    .C(mb_load),
    .Q(mb05)
  );
  FD mb04_646 (
    .D(regbus04),
    .C(mb_load),
    .Q(mb04)
  );
  FD pc05_647 (
    .D(regbus05),
    .C(pc_load),
    .Q(pc05)
  );
  FD pc04_648 (
    .D(regbus04),
    .C(pc_load),
    .Q(pc04)
  );
  FD ma05_649 (
    .D(regbus05),
    .C(ma_load),
    .Q(ma05)
  );
  defparam n__171.INIT = 4'hD;
  LUT2 n__171 (
    .I0(eae_end),
    .I1(n__49),
    .O(n__17)
  );
  defparam regbus0163.INIT = 16'h0037;
  LUT4_D regbus0163 (
    .I0(N428),
    .I1(adder01),
    .I2(no_shift),
    .I3(N3880),
    .LO(N4235),
    .O(regbus01)
  );
  defparam _n01841.INIT = 16'h8000;
  LUT4_D _n01841 (
    .I0(N3902),
    .I1(mb11_1),
    .I2(mb03_2),
    .I3(mb05),
    .LO(N4236),
    .O(mq_enable)
  );
  defparam Ker363.INIT = 8'hEC;
  LUT3 Ker363 (
    .I0(ts4),
    .I1(N1131),
    .I2(N354),
    .O(N363)
  );
  INV mq09_1_INV_0 (
    .I(mq09),
    .O(mq09__OBUF)
  );
  defparam _n01871.INIT = 16'h8000;
  LUT4_D _n01871 (
    .I0(N3902),
    .I1(mb06_2),
    .I2(mb11),
    .I3(mb03_2),
    .LO(N4237),
    .O(sc_enable)
  );
  defparam int_enable__Aset_INV1.INIT = 16'h4C5F;
  LUT4 int_enable__Aset_INV1 (
    .I0(mftp2),
    .I1(strobe__OBUF),
    .I2(N2311),
    .I3(int_ok),
    .O(int_enable__N0)
  );
  GND XST_GND (
    .G(a04c1)
  );
  FD pc03_650 (
    .D(regbus03),
    .C(pc_load),
    .Q(pc03)
  );
  defparam \Madd__n0029_Mxor_Result<1>_Xo<1>1 .INIT = 8'h96;
  LUT3 \Madd__n0029_Mxor_Result<1>_Xo<1>1  (
    .I0(\_n0794<1> ),
    .I1(\_n0795<1> ),
    .I2(N541),
    .O(adder08)
  );
  FDC s_uf_651 (
    .D(uf),
    .CLR(initialize),
    .C(if_to_sf),
    .Q(s_uf)
  );
  DelayLine_2 dl_n__748 (
    .Dclk(dclk_BUFGP),
    .In(e09f1),
    .Out(n__748)
  );
  defparam _n020862.INIT = 16'hFF32;
  LUT4 _n020862 (
    .I0(CHOICE1757),
    .I1(b_execute),
    .I2(CHOICE1749),
    .I3(opr__OBUF),
    .O(_n0208)
  );
  DelayLine_1_2 dl_n__37 (
    .Dclk(dclk_BUFGP),
    .In(n__34),
    .Out(n__37)
  );
  defparam add_accepted__Aset_INV1.INIT = 4'h7;
  LUT2 add_accepted__Aset_INV1 (
    .I0(strobe__OBUF),
    .I1(manual_preset_),
    .O(add_accepted__N0)
  );
  INV feed_hole1_INV_0 (
    .I(n__722),
    .O(feed_hole_OBUF)
  );
  defparam n__4421.INIT = 16'hF888;
  LUT4 n__4421 (
    .I0(ifsr2_IBUF),
    .I1(sr_enable),
    .I2(ib2),
    .I3(N601),
    .O(n__442)
  );
  INV bmb08_1_INV_0 (
    .I(mb08),
    .O(bmb08__OBUF)
  );
  INV ac04_1_INV_0 (
    .I(ac04),
    .O(ac04__OBUF)
  );
  OBUF bac08_OBUF (
    .I(ac08),
    .O(bac08)
  );
  INV mcbmb09_1_INV_0 (
    .I(mb09),
    .O(mcbmb09__OBUF)
  );
  INV ac05_1_INV_0 (
    .I(ac05),
    .O(ac05__OBUF)
  );
  INV ma02_1_INV_0 (
    .I(ma02),
    .O(ma02__OBUF)
  );
  defparam Ker4471.INIT = 4'h8;
  LUT2 Ker4471 (
    .I0(ir0_),
    .I1(b_execute),
    .O(N447)
  );
  OBUF badd_accepted__OBUF_652 (
    .I(badd_accepted__OBUF),
    .O(badd_accepted_)
  );
  INV ma03_1_INV_0 (
    .I(ma03),
    .O(ma03__OBUF)
  );
  defparam n__556_653.INIT = 16'h0908;
  LUT4 n__556_653 (
    .I0(mb08),
    .I1(mb07),
    .I2(N4171),
    .I3(s_uf),
    .O(n__556)
  );
  DelayLine_3 m700bd2 (
    .Dclk(dclk_BUFGP),
    .In(mftp1),
    .Out(mftp2)
  );
  defparam regbus1162.INIT = 16'h220A;
  LUT4_D regbus1162 (
    .I0(CHOICE3576),
    .I1(N3983),
    .I2(N3982),
    .I3(\_n0791<0> ),
    .LO(N4238),
    .O(regbus11)
  );
  OBUF bac07_OBUF (
    .I(ac07),
    .O(bac07)
  );
  defparam regbus0664.INIT = 16'h4C00;
  LUT4_D regbus0664 (
    .I0(adder06),
    .I1(CHOICE3460),
    .I2(no_shift),
    .I3(CHOICE3463),
    .LO(N4239),
    .O(regbus06)
  );
  FDCP pause_654 (
    .D(a04c1),
    .CLR(tp1),
    .PRE(pause_N1),
    .C(n__14),
    .Q(pause)
  );
  defparam sr_enable_655.INIT = 16'hFCF4;
  LUT4_D sr_enable_655 (
    .I0(key_la__IBUF),
    .I1(N442),
    .I2(N2087),
    .I3(N4311),
    .LO(N4240),
    .O(sr_enable)
  );
  defparam _n0233_656.INIT = 16'h4000;
  LUT4 _n0233_656 (
    .I0(mb07),
    .I1(mb08),
    .I2(mb06),
    .I3(N4145),
    .O(_n0233)
  );
  defparam regbus1062.INIT = 16'hD8E4;
  LUT4_D regbus1062 (
    .I0(\_n0792<0> ),
    .I1(N4011),
    .I2(N4012),
    .I3(\_n0791<0> ),
    .LO(N4241),
    .O(regbus10)
  );
  FDC df2_657 (
    .D(n__485),
    .CLR(_n0320),
    .C(n__489),
    .Q(df2)
  );
  FDC df0_658 (
    .D(n__483),
    .CLR(_n0320),
    .C(n__489),
    .Q(df0)
  );
  FD mb10_659 (
    .D(regbus10),
    .C(mb_load),
    .Q(mb10)
  );
  FDC uint_660 (
    .D(n__564),
    .CLR(initialize),
    .C(n__748),
    .Q(uint)
  );
  FDC df1_661 (
    .D(n__484),
    .CLR(_n0320),
    .C(n__489),
    .Q(df1)
  );
  FDC uf_662 (
    .D(n__560),
    .CLR(_n0320),
    .C(ib_to_if),
    .Q(uf)
  );
  FDC ub_663 (
    .D(n__556),
    .CLR(_n0320),
    .C(n__558),
    .Q(ub)
  );
  FDC ib2_664 (
    .D(n__436),
    .CLR(_n0320),
    .C(load_ib),
    .Q(ib2)
  );
  defparam n__6461.INIT = 16'h2882;
  LUT4 n__6461 (
    .I0(right_shift),
    .I1(carry_insert_),
    .I2(\_n0792<0> ),
    .I3(\_n0791<0> ),
    .O(N3829)
  );
  defparam _n03281.INIT = 4'h8;
  LUT2 _n03281 (
    .I0(n__748),
    .I1(b_set),
    .O(load_bf)
  );
  DelayLine_1_3 dl_n__43 (
    .Dclk(dclk_BUFGP),
    .In(n__41),
    .Out(n__43)
  );
  defparam if_to_sf1.INIT = 8'hD5;
  LUT3 if_to_sf1 (
    .I0(load_sf_),
    .I1(mftp1),
    .I2(restart),
    .O(if_to_sf)
  );
  defparam ea0_665.INIT = 8'hF2;
  LUT3 ea0_665 (
    .I0(if0),
    .I1(if_enable__),
    .I2(N648),
    .O(ea0_OBUF)
  );
  defparam ea2_666.INIT = 8'hF2;
  LUT3 ea2_666 (
    .I0(if2),
    .I1(if_enable__),
    .I2(N652),
    .O(ea2_OBUF)
  );
  defparam ea1_667.INIT = 8'hF2;
  LUT3 ea1_667 (
    .I0(if1),
    .I1(if_enable__),
    .I2(N650),
    .O(ea1_OBUF)
  );
  defparam Ker4201.INIT = 8'h10;
  LUT3 Ker4201 (
    .I0(ir0_),
    .I1(ir1),
    .I2(ir2),
    .O(N420)
  );
  defparam e09f11.INIT = 8'hF2;
  LUT3 e09f11 (
    .I0(s_),
    .I1(strobe__OBUF),
    .I2(n__4),
    .O(e09f1)
  );
  defparam _n0320_668.INIT = 16'hAAA8;
  LUT4 _n0320_668 (
    .I0(if_to_sf),
    .I1(N400),
    .I2(mb03),
    .I3(N4147),
    .O(_n0320)
  );
  defparam df_enable_1.INIT = 8'h57;
  LUT3 df_enable_1 (
    .I0(defer),
    .I1(ir0_),
    .I2(ir1),
    .O(df_enable_)
  );
  FDC ib0_669 (
    .D(n__438),
    .CLR(_n0320),
    .C(load_ib),
    .Q(ib0)
  );
  DelayLine_4_5 dl_n__38 (
    .Dclk(dclk_BUFGP),
    .In(n__34),
    .Out(n__38)
  );
  defparam n__485_670.INIT = 16'hF888;
  LUT4 n__485_670 (
    .I0(sr_enable),
    .I1(dfsr2_IBUF),
    .I2(N436),
    .I3(N672),
    .O(n__485)
  );
  FDR bf1_671 (
    .D(n__260),
    .R(eda1_IBUF),
    .C(load_bf),
    .Q(bf1)
  );
  FDP bf_enable___672 (
    .D(b_set_),
    .PRE(ts1_N0),
    .C(n__412),
    .Q(bf_enable__)
  );
  FD sf0_673 (
    .D(if0),
    .C(if_to_sf),
    .Q(sf0)
  );
  FDP df_enable___674 (
    .D(df_enable_),
    .PRE(ts1_N0),
    .C(n__412),
    .Q(df_enable__)
  );
  FDR bf0_675 (
    .D(n__260),
    .R(eda0_IBUF),
    .C(load_bf),
    .Q(bf0)
  );
  FD sf1_676 (
    .D(if1),
    .C(if_to_sf),
    .Q(sf1)
  );
  FDR bf2_677 (
    .D(n__260),
    .R(eda2_IBUF),
    .C(load_bf),
    .Q(bf2)
  );
  FDP if_enable___678 (
    .D(if_enable_),
    .PRE(ts1_N0),
    .C(n__412),
    .Q(if_enable__)
  );
  FD ac11_679 (
    .D(regbus11),
    .C(ac_load),
    .Q(ac11)
  );
  DelayLine_3_1 m700ae2 (
    .Dclk(dclk_BUFGP),
    .In(mftp0),
    .Out(mftp1)
  );
  FD pc10_680 (
    .D(regbus10),
    .C(pc_load),
    .Q(pc10)
  );
  FDC if0_681 (
    .D(n__444),
    .CLR(_n0320),
    .C(ib_to_if),
    .Q(if0)
  );
  FDCP iop2_682 (
    .D(a04c1),
    .CLR(initialize),
    .PRE(_n0763),
    .C(n__40),
    .Q(iop2)
  );
  defparam n__558_683.INIT = 16'hFF80;
  LUT4 n__558_683 (
    .I0(mb06),
    .I1(mb09),
    .I2(N674),
    .I3(N168),
    .O(n__558)
  );
  defparam n__10882_SW0.INIT = 16'h1000;
  LUT4 n__10882_SW0 (
    .I0(mb08),
    .I1(mb03),
    .I2(mp_int_),
    .I3(iop1),
    .O(N4157)
  );
  OBUF bac05_OBUF (
    .I(ac05),
    .O(bac05)
  );
  OBUF ac11__OBUF_684 (
    .I(ac11__OBUF),
    .O(ac11_)
  );
  defparam mem_enable0_41.INIT = 4'h1;
  LUT1 mem_enable0_41 (
    .I0(_n0688),
    .O(mem_enable0_4)
  );
  FD ma11_685 (
    .D(regbus11),
    .C(ma_load),
    .Q(ma11)
  );
  Monostable_1 b10d2 (
    .Dclk(dclk_BUFGP),
    .In(_n0024),
    .Out(mem_done__OBUF)
  );
  defparam n__489_686.INIT = 16'hFAF8;
  LUT4 n__489_686 (
    .I0(N634),
    .I1(mb11),
    .I2(N168),
    .I3(N440),
    .O(n__489)
  );
  defparam Ker601.INIT = 8'hFD;
  LUT3 Ker601 (
    .I0(restart),
    .I1(run),
    .I2(key_la__IBUF),
    .O(N601)
  );
  DelayLine_4_6 dl_n__41 (
    .Dclk(dclk_BUFGP),
    .In(n__38),
    .Out(n__41)
  );
  defparam _n017373.INIT = 16'hA888;
  LUT4_D _n017373 (
    .I0(CHOICE2938),
    .I1(CHOICE2935),
    .I2(eae_ir2),
    .I3(CHOICE2930),
    .LO(N4242),
    .O(_n0173)
  );
  defparam n__438_687.INIT = 16'hF888;
  LUT4 n__438_687 (
    .I0(sr_enable),
    .I1(ifsr0_IBUF),
    .I2(mb06),
    .I3(N676),
    .O(n__438)
  );
  FDC if1_688 (
    .D(n__443),
    .CLR(_n0320),
    .C(ib_to_if),
    .Q(if1)
  );
  defparam regbus0864.INIT = 16'h0037;
  LUT4_D regbus0864 (
    .I0(N428),
    .I1(adder08),
    .I2(no_shift),
    .I3(N4043),
    .LO(N4243),
    .O(regbus08)
  );
  defparam tt_inst_1.INIT = 16'hFFFE;
  LUT4 tt_inst_1 (
    .I0(uf),
    .I1(N400),
    .I2(mb04),
    .I3(N154),
    .O(btt_inst__OBUF)
  );
  FDC if2_689 (
    .D(n__442),
    .CLR(_n0320),
    .C(ib_to_if),
    .Q(if2)
  );
  FD sf2_690 (
    .D(if2),
    .C(if_to_sf),
    .Q(sf2)
  );
  OBUF bac02_OBUF (
    .I(ac02),
    .O(bac02)
  );
  defparam tt_inst_1_SW7.INIT = 16'hFB33;
  LUT4_L tt_inst_1_SW7 (
    .I0(s_),
    .I1(mb10),
    .I2(mb11_1),
    .I3(N4189),
    .LO(N3916)
  );
  Monostable_2_1 a04c (
    .Dclk(dclk_BUFGP),
    .In(a04c1),
    .Out(restart)
  );
  defparam Ker1681.INIT = 16'h1000;
  LUT4 Ker1681 (
    .I0(run),
    .I1(key_la__IBUF),
    .I2(restart),
    .I3(pc_load),
    .O(N168)
  );
  defparam _n02561.INIT = 16'h8000;
  LUT4 _n02561 (
    .I0(mb08),
    .I1(mb07),
    .I2(N4260),
    .I3(N3856),
    .O(_n0256)
  );
  FDP int_inhibit__691 (
    .D(a04c1),
    .PRE(ib_to_if),
    .C(n__27),
    .Q(int_inhibit_)
  );
  FD sf5_692 (
    .D(df2),
    .C(if_to_sf),
    .Q(sf5)
  );
  FD sf4_693 (
    .D(df1),
    .C(if_to_sf),
    .Q(sf4)
  );
  defparam n__4431.INIT = 16'hF888;
  LUT4 n__4431 (
    .I0(ifsr1_IBUF),
    .I1(sr_enable),
    .I2(ib1),
    .I3(N601),
    .O(n__443)
  );
  defparam n__4441.INIT = 16'hF888;
  LUT4 n__4441 (
    .I0(ifsr0_IBUF),
    .I1(sr_enable),
    .I2(ib0),
    .I3(N601),
    .O(n__444)
  );
  defparam Ker4271.INIT = 8'h80;
  LUT3 Ker4271 (
    .I0(isz),
    .I1(b_execute),
    .I2(ts2),
    .O(N427)
  );
  defparam Ker521.INIT = 8'hE8;
  LUT3 Ker521 (
    .I0(\_n0807<0> ),
    .I1(N4248),
    .I2(\_n0806<0> ),
    .O(N521)
  );
  VCC XST_VCC (
    .P(n__260)
  );
  defparam Ker35448.INIT = 16'hFEFA;
  LUT4_D Ker35448 (
    .I0(CHOICE3298),
    .I1(CHOICE3296),
    .I2(CHOICE3304),
    .I3(_n0741),
    .LO(N4244),
    .O(N354)
  );
  defparam _n02591.INIT = 16'h4000;
  LUT4 _n02591 (
    .I0(mb08),
    .I1(mb07),
    .I2(N449),
    .I3(N4261),
    .O(_n0259)
  );
  defparam Ker901.INIT = 8'h7F;
  LUT3 Ker901 (
    .I0(key_st__IBUF),
    .I1(key_dp__IBUF),
    .I2(key_ex__IBUF),
    .O(N90)
  );
  defparam \Madd__n0032_Mxor_Result<0>_Xo<1>1 .INIT = 8'h96;
  LUT3_D \Madd__n0032_Mxor_Result<0>_Xo<1>1  (
    .I0(\_n0803<0> ),
    .I1(\_n0804<0> ),
    .I2(n__133),
    .LO(N4245),
    .O(adder03)
  );
  defparam Ker43939.INIT = 16'hAAA8;
  LUT4 Ker43939 (
    .I0(N4167),
    .I1(mb08),
    .I2(mb07),
    .I3(CHOICE1727),
    .O(N439)
  );
  defparam c_set_1.INIT = 8'hEF;
  LUT3_D c_set_1 (
    .I0(s_),
    .I1(mb11_1),
    .I2(mb10),
    .LO(N4246),
    .O(c_set_)
  );
  defparam tp4_694.INIT = 16'h4F44;
  LUT4 tp4_694 (
    .I0(N678),
    .I1(run),
    .I2(key_cont__IBUF),
    .I3(mftp2),
    .O(tp4)
  );
  defparam adder_l_1.INIT = 16'h566A;
  LUT4_D adder_l_1 (
    .I0(n__137),
    .I1(\_n0806<1> ),
    .I2(N521),
    .I3(\_n0807<1> ),
    .LO(N4247),
    .O(adder_l_)
  );
  defparam Madd__n0032_Cout1.INIT = 8'hE8;
  LUT3_D Madd__n0032_Cout1 (
    .I0(\_n0803<1> ),
    .I1(\_n0804<1> ),
    .I2(N511),
    .LO(N4248),
    .O(n__160)
  );
  defparam Madd__n0031_Cout1.INIT = 8'hE8;
  LUT3_D Madd__n0031_Cout1 (
    .I0(\_n0800<1> ),
    .I1(\_n0801<1> ),
    .I2(N491),
    .LO(N4249),
    .O(n__133)
  );
  defparam Madd__n0030_Cout1.INIT = 8'hE8;
  LUT3_D Madd__n0030_Cout1 (
    .I0(\_n0797<1> ),
    .I1(\_n0798<1> ),
    .I2(N50),
    .LO(N4250),
    .O(carry_out6_)
  );
  defparam Madd__n0029_Cout1.INIT = 8'hE8;
  LUT3_D Madd__n0029_Cout1 (
    .I0(\_n0794<1> ),
    .I1(\_n0795<1> ),
    .I2(N541),
    .LO(N4251),
    .O(n__132)
  );
  defparam Madd__n0028_Cout1.INIT = 8'hE8;
  LUT3_D Madd__n0028_Cout1 (
    .I0(\_n0791<1> ),
    .I1(\_n0792<1> ),
    .I2(N531),
    .LO(N4252),
    .O(n__136)
  );
  LD_1 pwr_low__695 (
    .D(stop_ok),
    .G(initialize_),
    .Q(pwr_low_)
  );
  FDP mp_int__696 (
    .D(a04c1),
    .PRE(mp_int__N0),
    .C(n__748),
    .Q(mp_int_)
  );
  FDR hs_697 (
    .D(n__260),
    .R(lhs__IBUF),
    .C(n__4),
    .Q(hs)
  );
  FDP c__698 (
    .D(N4246),
    .PRE(ts1_N0),
    .C(tp4),
    .Q(c_)
  );
  FDP s__699 (
    .D(s_set_),
    .PRE(ts1_N0),
    .C(tp4),
    .Q(s_)
  );
  defparam n__657481.INIT = 8'hC4;
  LUT3_L n__657481 (
    .I0(eae_ir1),
    .I1(eae_on),
    .I2(CHOICE2843),
    .LO(N3832)
  );
  defparam n__6561.INIT = 4'h8;
  LUT2 n__6561 (
    .I0(right_shift),
    .I1(mq09),
    .O(N3833)
  );
  defparam n__6551.INIT = 4'h8;
  LUT2 n__6551 (
    .I0(right_shift),
    .I1(mq08),
    .O(N3834)
  );
  defparam n__6541.INIT = 4'h8;
  LUT2 n__6541 (
    .I0(right_shift),
    .I1(mq07),
    .O(N3835)
  );
  defparam n__6531.INIT = 4'h8;
  LUT2 n__6531 (
    .I0(right_shift),
    .I1(mq06),
    .O(N3836)
  );
  defparam n__6521.INIT = 4'h8;
  LUT2 n__6521 (
    .I0(right_shift),
    .I1(mq05),
    .O(N3837)
  );
  defparam n__6511.INIT = 4'h8;
  LUT2 n__6511 (
    .I0(right_shift),
    .I1(mq04),
    .O(N3838)
  );
  defparam n__6501.INIT = 4'h8;
  LUT2 n__6501 (
    .I0(right_shift),
    .I1(mq03),
    .O(N3839)
  );
  defparam Ker2851.INIT = 16'hFFEF;
  LUT4 Ker2851 (
    .I0(ir2),
    .I1(ir1),
    .I2(b_execute),
    .I3(ir0_),
    .O(N285)
  );
  defparam \Madd__n0030_Mxor_Result<1>_Xo<1>1 .INIT = 8'h96;
  LUT3 \Madd__n0030_Mxor_Result<1>_Xo<1>1  (
    .I0(\_n0797<1> ),
    .I1(\_n0798<1> ),
    .I2(N50),
    .O(adder06)
  );
  defparam Ker3961.INIT = 8'h80;
  LUT3 Ker3961 (
    .I0(sc4),
    .I1(sc1),
    .I2(sc2),
    .O(N396)
  );
  defparam Ker35424.INIT = 16'h8000;
  LUT4 Ker35424 (
    .I0(mb03_2),
    .I1(mb11),
    .I2(b_fetch),
    .I3(N3919),
    .O(CHOICE3298)
  );
  defparam \Madd__n0029_Mxor_Result<0>_Xo<1>1 .INIT = 8'h96;
  LUT3 \Madd__n0029_Mxor_Result<0>_Xo<1>1  (
    .I0(\_n0794<0> ),
    .I1(\_n0795<0> ),
    .I2(n__136),
    .O(adder09)
  );
  defparam n__4521.INIT = 16'hEFFF;
  LUT4 n__4521 (
    .I0(mb05),
    .I1(mb03),
    .I2(mb04),
    .I3(b_fetch),
    .O(n__452)
  );
  defparam Ker3501_SW4.INIT = 4'h9;
  LUT2 Ker3501_SW4 (
    .I0(\_n0792<0> ),
    .I1(carry_insert_),
    .O(N4003)
  );
  defparam sc_load1.INIT = 16'hAF2F;
  LUT4 sc_load1 (
    .I0(n__748),
    .I1(_n0208),
    .I2(eae_tg),
    .I3(N4511),
    .O(sc_load)
  );
  defparam Ker3981.INIT = 4'h1;
  LUT2 Ker3981 (
    .I0(N428),
    .I1(right_shift),
    .O(N398)
  );
  defparam Ker4231.INIT = 16'h4000;
  LUT4 Ker4231 (
    .I0(ir1),
    .I1(b_execute),
    .I2(ir0_),
    .I3(ts3),
    .O(N423)
  );
  defparam io_bus_in_int__SW0.INIT = 4'h8;
  LUT2 io_bus_in_int__SW0 (
    .I0(N4),
    .I1(N3),
    .O(N628)
  );
  defparam io_bus_in_skip__SW0.INIT = 4'h8;
  LUT2 io_bus_in_skip__SW0 (
    .I0(N11),
    .I1(N10),
    .O(N630)
  );
  defparam n__111_SW0.INIT = 4'h8;
  LUT2 n__111_SW0 (
    .I0(mb_load),
    .I1(b_execute),
    .O(N632)
  );
  defparam Ker4161.INIT = 16'h4000;
  LUT4 Ker4161 (
    .I0(mb04),
    .I1(mb07),
    .I2(mb11),
    .I3(op2),
    .O(N416)
  );
  defparam Ker435_SW0.INIT = 4'hD;
  LUT2 Ker435_SW0 (
    .I0(eae_ir1),
    .I1(eae_ir0),
    .O(N636)
  );
  OBUF bac06_OBUF (
    .I(ac06),
    .O(bac06)
  );
  defparam n__27_SW0.INIT = 8'h80;
  LUT3 n__27_SW0 (
    .I0(mb06),
    .I1(mb09),
    .I2(mb07),
    .O(N640)
  );
  defparam _n0618_SW1.INIT = 16'hFFEF;
  LUT4 _n0618_SW1 (
    .I0(mb07),
    .I1(mb04),
    .I2(N449),
    .I3(int_strobe_),
    .O(N4165)
  );
  defparam load_ib_SW0.INIT = 8'h20;
  LUT3 load_ib_SW0 (
    .I0(n__748),
    .I1(n__452),
    .I2(N415),
    .O(N634)
  );
  defparam manual_preset__SW1.INIT = 16'h8000;
  LUT4 manual_preset__SW1 (
    .I0(key_la__IBUF),
    .I1(key_ex__IBUF),
    .I2(key_dp__IBUF),
    .I3(key_cont__IBUF),
    .O(N4143)
  );
  defparam ea0_SW0.INIT = 16'h4F44;
  LUT4 ea0_SW0 (
    .I0(bf_enable__),
    .I1(bf0),
    .I2(df_enable__),
    .I3(df0),
    .O(N648)
  );
  defparam ea1_SW0.INIT = 16'h4F44;
  LUT4 ea1_SW0 (
    .I0(bf_enable__),
    .I1(bf1),
    .I2(df_enable__),
    .I3(df1),
    .O(N650)
  );
  defparam ea2_SW0.INIT = 16'h4F44;
  LUT4 ea2_SW0 (
    .I0(bf_enable__),
    .I1(bf2),
    .I2(df_enable__),
    .I3(df2),
    .O(N652)
  );
  defparam Ker4191.INIT = 8'h10;
  LUT3 Ker4191 (
    .I0(mb08),
    .I1(mb07),
    .I2(mb09),
    .O(N419)
  );
  defparam b_mem_start_SW0.INIT = 16'h1000;
  LUT4 b_mem_start_SW0 (
    .I0(pause),
    .I1(mem_done__OBUF),
    .I2(strobe__OBUF),
    .I3(stop_ok),
    .O(N656)
  );
  defparam _n0773_SW0.INIT = 16'hFF32;
  LUT4 _n0773_SW0 (
    .I0(N105),
    .I1(_n0208),
    .I2(eae_ir1),
    .I3(N439),
    .O(N658)
  );
  defparam n__483_SW0.INIT = 16'hA888;
  LUT4 n__483_SW0 (
    .I0(N436),
    .I1(mb11),
    .I2(sf3),
    .I3(N419),
    .O(N660)
  );
  defparam n__437_SW0.INIT = 16'hF888;
  LUT4 n__437_SW0 (
    .I0(mb07),
    .I1(mb10),
    .I2(sf1),
    .I3(N440),
    .O(N662)
  );
  defparam n__484_SW0.INIT = 16'hF888;
  LUT4 n__484_SW0 (
    .I0(mb07),
    .I1(mb11),
    .I2(sf4),
    .I3(N440),
    .O(N664)
  );
  defparam n__436_SW0.INIT = 16'hF888;
  LUT4 n__436_SW0 (
    .I0(mb08),
    .I1(mb10),
    .I2(sf2),
    .I3(N440),
    .O(N666)
  );
  defparam regbus0723_SW0.INIT = 16'h8F88;
  LUT4 regbus0723_SW0 (
    .I0(adder09),
    .I1(double_left_rotate),
    .I2(mb07),
    .I3(and_enable),
    .O(N4107)
  );
  defparam _n0233_SW1.INIT = 16'h8000;
  LUT4 _n0233_SW1 (
    .I0(mb09),
    .I1(n__748),
    .I2(uint),
    .I3(N436),
    .O(N4145)
  );
  defparam n__485_SW0.INIT = 16'hF888;
  LUT4 n__485_SW0 (
    .I0(mb08),
    .I1(mb11),
    .I2(sf5),
    .I3(N440),
    .O(N672)
  );
  defparam _n07591.INIT = 16'h40C8;
  LUT4 _n07591 (
    .I0(restart),
    .I1(power_clear__IBUF),
    .I2(key_st__IBUF),
    .I3(run),
    .O(initialize_1)
  );
  defparam n__438_SW0.INIT = 16'hA888;
  LUT4 n__438_SW0 (
    .I0(N436),
    .I1(mb10),
    .I2(sf0),
    .I3(N419),
    .O(N676)
  );
  defparam tp4_SW0.INIT = 16'hEFFF;
  LUT4 tp4_SW0 (
    .I0(pause),
    .I1(mem_done__OBUF),
    .I2(strobe__OBUF),
    .I3(stop_ok),
    .O(N678)
  );
  defparam _n0320_SW1.INIT = 16'hEFFF;
  LUT4 _n0320_SW1 (
    .I0(mb04),
    .I1(uf),
    .I2(mb10),
    .I3(b_fetch),
    .O(N4147)
  );
  defparam left_shift_SW0.INIT = 4'hD;
  LUT2 left_shift_SW0 (
    .I0(_n0656),
    .I1(mb10),
    .O(N1117)
  );
  defparam _n0655_SW0.INIT = 8'hF2;
  LUT3 _n0655_SW0 (
    .I0(b_execute),
    .I1(opr__OBUF),
    .I2(b_fetch),
    .O(N1115)
  );
  defparam _n082660_G.INIT = 16'h7FFF;
  LUT4_L _n082660_G (
    .I0(sf2),
    .I1(N449),
    .I2(mb08),
    .I3(N3856),
    .LO(N4196)
  );
  defparam n__119_SW0.INIT = 8'h23;
  LUT3 n__119_SW0 (
    .I0(mem_incr_IBUF),
    .I1(word_count),
    .I2(break),
    .O(N1093)
  );
  defparam n__646_SW0.INIT = 16'hF888;
  LUT4 n__646_SW0 (
    .I0(mq01),
    .I1(N437),
    .I2(ac00),
    .I3(N416),
    .O(N1068)
  );
  defparam n__661_SW1.INIT = 16'h4000;
  LUT4 n__661_SW1 (
    .I0(mb07),
    .I1(N636),
    .I2(N417),
    .I3(b_execute),
    .O(N4133)
  );
  defparam Ker4421.INIT = 4'h4;
  LUT2 Ker4421 (
    .I0(run),
    .I1(restart),
    .O(N442)
  );
  defparam n__665_SW0.INIT = 4'hD;
  LUT2 n__665_SW0 (
    .I0(N435),
    .I1(mb09),
    .O(N1047)
  );
  defparam n__46_SW0.INIT = 16'hF888;
  LUT4 n__46_SW0 (
    .I0(n__30),
    .I1(mb11),
    .I2(n__37),
    .I3(mb10),
    .O(N1039)
  );
  defparam _n070612.INIT = 16'hEFFF;
  LUT4 _n070612 (
    .I0(ir0_),
    .I1(ir1),
    .I2(ir2),
    .I3(ts3),
    .O(CHOICE3327)
  );
  defparam n__666_SW1.INIT = 16'hFF7F;
  LUT4 n__666_SW1 (
    .I0(N636),
    .I1(N417),
    .I2(b_execute),
    .I3(mb10),
    .O(N4135)
  );
  defparam n__651_SW0.INIT = 16'hF888;
  LUT4 n__651_SW0 (
    .I0(N437),
    .I1(mq06),
    .I2(N416),
    .I3(ac05),
    .O(N1027)
  );
  defparam n__655_SW0.INIT = 16'hF888;
  LUT4 n__655_SW0 (
    .I0(mq10),
    .I1(N437),
    .I2(ac09),
    .I3(N416),
    .O(N1025)
  );
  defparam n__650_SW0.INIT = 16'hF888;
  LUT4 n__650_SW0 (
    .I0(N437),
    .I1(mq05),
    .I2(N416),
    .I3(ac04),
    .O(N1023)
  );
  defparam n__649_SW0.INIT = 16'hF888;
  LUT4 n__649_SW0 (
    .I0(N437),
    .I1(mq04),
    .I2(N416),
    .I3(ac03),
    .O(N1021)
  );
  defparam n__653_SW0.INIT = 16'hF888;
  LUT4 n__653_SW0 (
    .I0(N437),
    .I1(mq08),
    .I2(N416),
    .I3(ac07),
    .O(N1019)
  );
  defparam n__652_SW0.INIT = 16'hF888;
  LUT4 n__652_SW0 (
    .I0(N437),
    .I1(mq07),
    .I2(N416),
    .I3(ac06),
    .O(N1017)
  );
  defparam n__647_SW0.INIT = 16'hF888;
  LUT4 n__647_SW0 (
    .I0(N437),
    .I1(mq02),
    .I2(N416),
    .I3(ac01),
    .O(N1015)
  );
  defparam ib_to_if12.INIT = 16'h0F02;
  LUT4 ib_to_if12 (
    .I0(b_fetch),
    .I1(mb03),
    .I2(ir2),
    .I3(defer),
    .O(CHOICE1694)
  );
  defparam n__648_SW0.INIT = 16'hF888;
  LUT4 n__648_SW0 (
    .I0(N437),
    .I1(mq03),
    .I2(N416),
    .I3(ac02),
    .O(N1013)
  );
  defparam if_enable__SW0.INIT = 16'hFAF8;
  LUT4 if_enable__SW0 (
    .I0(defer),
    .I1(ir0_),
    .I2(current_address),
    .I3(ir1),
    .O(N644)
  );
  defparam n__654_SW0.INIT = 16'hF888;
  LUT4 n__654_SW0 (
    .I0(N437),
    .I1(mq09),
    .I2(N416),
    .I3(ac08),
    .O(N10111)
  );
  defparam n__656_SW0.INIT = 16'hF888;
  LUT4 n__656_SW0 (
    .I0(mq11),
    .I1(N437),
    .I2(ac10),
    .I3(N416),
    .O(N1009)
  );
  defparam tt_inst_1_SW7_SW0.INIT = 4'hE;
  LUT2 tt_inst_1_SW7_SW0 (
    .I0(uf),
    .I1(mb04_1),
    .O(N4189)
  );
  defparam pc_load1.INIT = 16'hF1F3;
  LUT4 pc_load1 (
    .I0(CHOICE1819),
    .I1(N4159),
    .I2(io_pc_load_IBUF),
    .I3(CHOICE1826),
    .O(pc_load)
  );
  defparam _n083064_SW0.INIT = 16'h4000;
  LUT4 _n083064_SW0 (
    .I0(N4187),
    .I1(CHOICE3131),
    .I2(in06_IBUF),
    .I3(tt2_),
    .O(N3992)
  );
  defparam _n063631.INIT = 16'hEFFF;
  LUT4 _n063631 (
    .I0(ir2),
    .I1(N110),
    .I2(b_execute),
    .I3(n__748),
    .O(CHOICE1819)
  );
  defparam Ker43833_SW0.INIT = 16'hFFEF;
  LUT4 Ker43833_SW0 (
    .I0(ac03),
    .I1(ac04),
    .I2(CHOICE1714),
    .I3(ac05),
    .O(N4127)
  );
  defparam ib_to_if39_SW0_SW0.INIT = 16'h1101;
  LUT4 ib_to_if39_SW0_SW0 (
    .I0(int_ok),
    .I1(CHOICE1694),
    .I2(N429),
    .I3(brk_sync),
    .O(N4169)
  );
  defparam ac_load76.INIT = 16'hFF32;
  LUT4 ac_load76 (
    .I0(_n0054),
    .I1(N357),
    .I2(N4125),
    .I3(CHOICE1780),
    .O(CHOICE1781)
  );
  defparam ac_load76_SW0.INIT = 16'hFF4F;
  LUT4 ac_load76_SW0 (
    .I0(N353),
    .I1(CHOICE1770),
    .I2(N430),
    .I3(_n0070),
    .O(N4125)
  );
  defparam Ker43833.INIT = 16'h0001;
  LUT4 Ker43833 (
    .I0(ac09),
    .I1(ac08),
    .I2(ac06),
    .I3(N4127),
    .O(N438)
  );
  defparam Ker21723_SW1.INIT = 16'hBAAA;
  LUT4 Ker21723_SW1 (
    .I0(N4139),
    .I1(mb10),
    .I2(_n0656),
    .I3(mb09),
    .O(N3980)
  );
  defparam n__2384_SW1.INIT = 16'hFF45;
  LUT4 n__2384_SW1 (
    .I0(run),
    .I1(N1011),
    .I2(key_la__IBUF),
    .I3(brk_sync),
    .O(N4155)
  );
  defparam _n065014.INIT = 8'h20;
  LUT3 _n065014 (
    .I0(mb06),
    .I1(ac02),
    .I2(CHOICE1739),
    .O(CHOICE1740)
  );
  defparam ib_to_if39_SW0.INIT = 16'hFFEF;
  LUT4 ib_to_if39_SW0 (
    .I0(ir0_),
    .I1(ir1),
    .I2(n__748),
    .I3(N4169),
    .O(N4151)
  );
  defparam _n063645.INIT = 16'h222F;
  LUT4 _n063645 (
    .I0(mftp2),
    .I1(N4149),
    .I2(strobe__OBUF),
    .I3(_n0655),
    .O(CHOICE1826)
  );
  defparam ib_to_if39.INIT = 16'h20FF;
  LUT4 ib_to_if39 (
    .I0(pc_load),
    .I1(key_la__IBUF),
    .I2(N442),
    .I3(N4151),
    .O(ib_to_if)
  );
  defparam Ker41842.INIT = 16'h0001;
  LUT4 Ker41842 (
    .I0(mq06),
    .I1(mq07),
    .I2(mq08),
    .I3(mq09),
    .O(CHOICE1804)
  );
  defparam ac_load17.INIT = 16'h4FFF;
  LUT4 ac_load17 (
    .I0(ir2),
    .I1(ir1),
    .I2(N447),
    .I3(n__748),
    .O(CHOICE1770)
  );
  defparam _n02087.INIT = 16'hEEFE;
  LUT4 _n02087 (
    .I0(eae_ir1),
    .I1(N154),
    .I2(N418),
    .I3(ac02),
    .O(CHOICE1749)
  );
  defparam Ker41857_SW0.INIT = 16'hFF7F;
  LUT4 Ker41857_SW0 (
    .I0(N438),
    .I1(CHOICE1804),
    .I2(CHOICE1797),
    .I3(mq00),
    .O(N4121)
  );
  defparam _n063645_SW0.INIT = 8'h80;
  LUT3 _n063645_SW0 (
    .I0(key_la__IBUF),
    .I1(key_ex__IBUF),
    .I2(key_dp__IBUF),
    .O(N4149)
  );
  defparam _n065019.INIT = 8'hF8;
  LUT3 _n065019 (
    .I0(mb07),
    .I1(link),
    .I2(CHOICE1740),
    .O(CHOICE1741)
  );
  defparam Ker41829.INIT = 16'h0001;
  LUT4 Ker41829 (
    .I0(mq02),
    .I1(mq03),
    .I2(mq04),
    .I3(mq05),
    .O(CHOICE1797)
  );
  defparam _n070342.INIT = 16'hFCF4;
  LUT4 _n070342 (
    .I0(ir2),
    .I1(defer),
    .I2(CHOICE3272),
    .I3(N110),
    .O(CHOICE3273)
  );
  defparam pc_load1_SW0.INIT = 16'h8C88;
  LUT4 pc_load1_SW0 (
    .I0(CHOICE1812),
    .I1(n__748),
    .I2(_n0061),
    .I3(N285),
    .O(N4159)
  );
  defparam _n065040.INIT = 16'h0F08;
  LUT4 _n065040 (
    .I0(ac00),
    .I1(mb05),
    .I2(mb11),
    .I3(CHOICE1741),
    .O(CHOICE1744)
  );
  defparam _n06369.INIT = 16'h8C88;
  LUT4 _n06369 (
    .I0(defer),
    .I1(N420),
    .I2(mb03),
    .I3(b_fetch),
    .O(CHOICE1812)
  );
  defparam Ker43917.INIT = 16'hFFFE;
  LUT4 Ker43917 (
    .I0(mb03),
    .I1(mb04),
    .I2(mb05),
    .I3(mb06),
    .O(CHOICE1727)
  );
  defparam n__108186_SW0.INIT = 8'h34;
  LUT3 n__108186_SW0 (
    .I0(mb11),
    .I1(mb08),
    .I2(CHOICE1744),
    .O(N4119)
  );
  defparam _n020829.INIT = 16'hFF7D;
  LUT4 _n020829 (
    .I0(mb11),
    .I1(ac00),
    .I2(ac01),
    .I3(N448),
    .O(CHOICE1757)
  );
  defparam Ker43939_SW1.INIT = 16'h8000;
  LUT4 Ker43939_SW1 (
    .I0(btt_inst__OBUF),
    .I1(b_fetch),
    .I2(n__452),
    .I3(N415),
    .O(N4167)
  );
  defparam Ker43825.INIT = 8'h01;
  LUT3 Ker43825 (
    .I0(ac07),
    .I1(ac10),
    .I2(ac11),
    .O(CHOICE1714)
  );
  defparam _n065011.INIT = 8'h10;
  LUT3 _n065011 (
    .I0(ac00),
    .I1(ac01),
    .I2(N438),
    .O(CHOICE1739)
  );
  defparam ac_load72.INIT = 16'hA8AA;
  LUT4 ac_load72 (
    .I0(n__748),
    .I1(_n0070),
    .I2(_n0054),
    .I3(N430),
    .O(CHOICE1780)
  );
  defparam n__137193_SW0.INIT = 16'hBAAA;
  LUT4 n__137193_SW0 (
    .I0(CHOICE2744),
    .I1(mb07),
    .I2(_n0656),
    .I3(mb05),
    .O(N4089)
  );
  defparam ac_load92.INIT = 8'hF8;
  LUT3 ac_load92 (
    .I0(eae_run),
    .I1(n__597),
    .I2(CHOICE1781),
    .O(ac_load)
  );
  defparam n__12827.INIT = 16'hD8E4;
  LUT4 n__12827 (
    .I0(\_n0792<0> ),
    .I1(N3976),
    .I2(N3977),
    .I3(\_n0791<0> ),
    .O(CHOICE2780)
  );
  defparam _n083064_SW0_SW0.INIT = 4'h8;
  LUT2_L _n083064_SW0_SW0 (
    .I0(_n0260),
    .I1(df0),
    .LO(N4187)
  );
  defparam n__56424.INIT = 16'h4000;
  LUT4 n__56424 (
    .I0(mb11),
    .I1(b_fetch),
    .I2(mb03),
    .I3(N551),
    .O(CHOICE1861)
  );
  defparam _n08407.INIT = 4'h7;
  LUT2 _n08407 (
    .I0(mem00_IBUF),
    .I1(mem_enable0_4),
    .O(CHOICE2760)
  );
  defparam n__13729.INIT = 16'h1101;
  LUT4 n__13729 (
    .I0(line_in_IBUF),
    .I1(s_),
    .I2(mem00_IBUF),
    .I3(hs),
    .O(CHOICE2710)
  );
  defparam n__2324.INIT = 16'hA2AA;
  LUT4 n__2324 (
    .I0(N146),
    .I1(N551),
    .I2(mb11),
    .I3(op2),
    .O(CHOICE1880)
  );
  defparam _n084256.INIT = 16'h084C;
  LUT4 _n084256 (
    .I0(ac00),
    .I1(CHOICE2884),
    .I2(ac_enable),
    .I3(acbar_enable),
    .O(\_n0807<1> )
  );
  defparam _n084030.INIT = 8'h4C;
  LUT3 _n084030 (
    .I0(ma00),
    .I1(CHOICE2767),
    .I2(ma_enable0_4),
    .O(\_n0806<1> )
  );
  defparam _n084123_SW0.INIT = 16'h8F88;
  LUT4 _n084123_SW0 (
    .I0(mem01_IBUF),
    .I1(mem_enable0_4),
    .I2(da01_IBUF),
    .I3(data_add_enable),
    .O(N4109)
  );
  defparam mp_int__Aset_INV_SW1.INIT = 16'hEFFF;
  LUT4 mp_int__Aset_INV_SW1 (
    .I0(mb04),
    .I1(mb03),
    .I2(N4411),
    .I3(iop4),
    .O(N4141)
  );
  defparam n__137170.INIT = 16'hD5FF;
  LUT4 n__137170 (
    .I0(s_),
    .I1(mfts2),
    .I2(N2311),
    .I3(c_),
    .O(CHOICE2744)
  );
  defparam regbus0015_SW1.INIT = 8'hEA;
  LUT3 regbus0015_SW1 (
    .I0(N4185),
    .I1(adder00),
    .I2(no_shift),
    .O(N3986)
  );
  defparam Ker2861_SW0.INIT = 16'h8000;
  LUT4 Ker2861_SW0 (
    .I0(ir0_),
    .I1(b_execute),
    .I2(ir2),
    .I3(ir1),
    .O(N3894)
  );
  defparam n__137138.INIT = 8'h4C;
  LUT3 n__137138 (
    .I0(mb05),
    .I1(mb07),
    .I2(link),
    .O(CHOICE2733)
  );
  defparam n__10827.INIT = 16'h022A;
  LUT4 n__10827 (
    .I0(N427),
    .I1(\_n0807<1> ),
    .I2(N521),
    .I3(\_n0806<1> ),
    .O(CHOICE2662)
  );
  defparam eae_complete_14.INIT = 16'hBA10;
  LUT4_L eae_complete_14 (
    .I0(eae_ir2),
    .I1(N219),
    .I2(sc1),
    .I3(N232),
    .LO(CHOICE2807)
  );
  defparam e_set12.INIT = 16'h0F01;
  LUT4 e_set12 (
    .I0(ir1),
    .I1(ir2),
    .I2(mb03),
    .I3(ir0_),
    .O(CHOICE1844)
  );
  defparam _n083623_SW0.INIT = 16'h8F88;
  LUT4 _n083623_SW0 (
    .I0(mem02_IBUF),
    .I1(mem_enable0_4),
    .I2(da02_IBUF),
    .I3(data_add_enable),
    .O(N4105)
  );
  defparam _n084023.INIT = 16'h0888;
  LUT4_L _n084023 (
    .I0(CHOICE2760),
    .I1(CHOICE2762),
    .I2(pc00),
    .I3(pc_enable),
    .LO(CHOICE2767)
  );
  defparam n__1116_SW0.INIT = 16'hF8FF;
  LUT4 n__1116_SW0 (
    .I0(key_si__IBUF),
    .I1(key_stop__IBUF),
    .I2(brk_sync),
    .I3(N429),
    .O(N4153)
  );
  defparam n__13776_SW0.INIT = 8'hE4;
  LUT3 n__13776_SW0 (
    .I0(line_in_IBUF),
    .I1(s_),
    .I2(c_),
    .O(N4093)
  );
  defparam right_shift2.INIT = 16'hC040;
  LUT4 right_shift2 (
    .I0(eae_ir2),
    .I1(eae_ir1),
    .I2(eae_on),
    .I3(eae_ir0),
    .O(CHOICE2644)
  );
  defparam n__10882.INIT = 16'h1110;
  LUT4 n__10882 (
    .I0(mb07),
    .I1(mb06),
    .I2(CHOICE2687),
    .I3(N4157),
    .O(CHOICE2689)
  );
  defparam n__137126.INIT = 16'h4000;
  LUT4 n__137126 (
    .I0(N448),
    .I1(eae_ir1),
    .I2(ac00),
    .I3(eae_on),
    .O(CHOICE2728)
  );
  defparam e_set17.INIT = 16'h8000;
  LUT4 e_set17 (
    .I0(mb03),
    .I1(mb11),
    .I2(N551),
    .I3(N417),
    .O(CHOICE1847)
  );
  defparam n__137193.INIT = 16'hFEEE;
  LUT4 n__137193 (
    .I0(CHOICE2746),
    .I1(N4089),
    .I2(N433),
    .I3(mb09),
    .O(CHOICE2750)
  );
  defparam n__1116.INIT = 16'hD5FF;
  LUT4 n__1116 (
    .I0(key_ss__IBUF),
    .I1(power_ok__IBUF),
    .I2(stop_ok),
    .I3(N4153),
    .O(CHOICE2421)
  );
  defparam n__56444.INIT = 16'hC444;
  LUT4 n__56444 (
    .I0(ir2),
    .I1(CHOICE1866),
    .I2(CHOICE1861),
    .I3(ts3),
    .O(CHOICE1867)
  );
  defparam n__56440.INIT = 8'h20;
  LUT3 n__56440 (
    .I0(ir1),
    .I1(ir0_),
    .I2(uf),
    .O(CHOICE1866)
  );
  defparam regbus0015_SW1_SW0.INIT = 8'h1B;
  LUT3 regbus0015_SW1_SW0 (
    .I0(\_n0792<0> ),
    .I1(N3938),
    .I2(N3937),
    .O(N4185)
  );
  defparam right_shift27_SW0.INIT = 16'hBAAA;
  LUT4 right_shift27_SW0 (
    .I0(CHOICE2644),
    .I1(mb10),
    .I2(mb08),
    .I3(_n0656),
    .O(N4091)
  );
  defparam n__128891.INIT = 16'hF888;
  LUT4 n__128891 (
    .I0(adder_l_),
    .I1(no_shift),
    .I2(adder00),
    .I3(left_shift),
    .O(N3831)
  );
  defparam regbus0116.INIT = 16'h4C5F;
  LUT4 regbus0116 (
    .I0(double_left_rotate),
    .I1(mb01),
    .I2(N4245),
    .I3(and_enable),
    .O(CHOICE3589)
  );
  defparam n__2343.INIT = 4'h4;
  LUT2 n__2343 (
    .I0(uint),
    .I1(teleprinter_flag_),
    .O(CHOICE1885)
  );
  defparam n__13744.INIT = 8'hA8;
  LUT3 n__13744 (
    .I0(ts2),
    .I1(CHOICE2704),
    .I2(CHOICE2710),
    .O(CHOICE2712)
  );
  defparam n__12814.INIT = 16'hA2AA;
  LUT4 n__12814 (
    .I0(eae_on),
    .I1(ac00),
    .I2(N448),
    .I3(eae_ir1),
    .O(CHOICE2775)
  );
  defparam _n00701_SW0.INIT = 16'hBFFF;
  LUT4 _n00701_SW0 (
    .I0(uf),
    .I1(ts3),
    .I2(b_fetch),
    .I3(mb03_1),
    .O(N4014)
  );
  defparam eae_complete_52.INIT = 16'h8F88;
  LUT4 eae_complete_52 (
    .I0(N4129),
    .I1(N4511),
    .I2(n__677),
    .I3(sc0),
    .O(CHOICE2820)
  );
  defparam e_set39.INIT = 16'hFAF8;
  LUT4 e_set39 (
    .I0(b_fetch),
    .I1(CHOICE1844),
    .I2(int_ok),
    .I3(CHOICE1847),
    .O(CHOICE1850)
  );
  defparam n__13714.INIT = 16'h0455;
  LUT4 n__13714 (
    .I0(c_),
    .I1(line_in_IBUF),
    .I2(hs),
    .I3(s_),
    .O(CHOICE2704)
  );
  defparam n__6071.INIT = 8'hF8;
  LUT3 n__6071 (
    .I0(eae_run),
    .I1(n__597),
    .I2(_n0189),
    .O(n__607)
  );
  defparam Ker3991_SW2.INIT = 16'hC8FF;
  LUT4 Ker3991_SW2 (
    .I0(N428),
    .I1(adder09),
    .I2(double_left_rotate),
    .I3(CHOICE3671),
    .O(N3970)
  );
  defparam n__2347.INIT = 16'hC040;
  LUT4 n__2347 (
    .I0(uf),
    .I1(CHOICE1885),
    .I2(pwr_low_),
    .I3(CHOICE1880),
    .O(CHOICE1886)
  );
  defparam n__137145.INIT = 16'hFEEE;
  LUT4 n__137145 (
    .I0(_n0194),
    .I1(CHOICE2728),
    .I2(_n0656),
    .I3(CHOICE2733),
    .O(CHOICE2735)
  );
  defparam _n06561_SW1.INIT = 16'h4000;
  LUT4 _n06561_SW1 (
    .I0(ir0_),
    .I1(ir1),
    .I2(ts3),
    .I3(ir2),
    .O(N3998)
  );
  defparam n__10871.INIT = 16'h0002;
  LUT4 n__10871 (
    .I0(iop2),
    .I1(pwr_low_),
    .I2(mb08),
    .I3(mb03),
    .O(CHOICE2687)
  );
  defparam eae_complete_52_SW0.INIT = 8'hBE;
  LUT3 eae_complete_52_SW0 (
    .I0(N418),
    .I1(ac02),
    .I2(ac01),
    .O(N4129)
  );
  defparam Ker363_SW0_SW01_G.INIT = 16'h0002;
  LUT4 Ker363_SW0_SW01_G (
    .I0(io_on),
    .I1(iop4),
    .I2(iop1),
    .I3(iop2),
    .O(N4198)
  );
  defparam _n084130.INIT = 8'h4C;
  LUT3 _n084130 (
    .I0(ma01),
    .I1(CHOICE2800),
    .I2(ma_enable0_4),
    .O(\_n0806<0> )
  );
  defparam n__137240.INIT = 16'hFCF4;
  LUT4 n__137240 (
    .I0(btt_inst__OBUF),
    .I1(link),
    .I2(CHOICE2735),
    .I3(CHOICE2750),
    .O(CHOICE2753)
  );
  defparam tt_inst_1_SW3.INIT = 8'hF2;
  LUT3 tt_inst_1_SW3 (
    .I0(ts3),
    .I1(N285),
    .I2(N3872),
    .O(N3909)
  );
  defparam n__12859.INIT = 8'hEC;
  LUT3 n__12859 (
    .I0(right_shift),
    .I1(N4022),
    .I2(CHOICE2780),
    .O(CHOICE2784)
  );
  defparam _n084123.INIT = 8'h13;
  LUT3_L _n084123 (
    .I0(pc01),
    .I1(N4109),
    .I2(pc_enable),
    .LO(CHOICE2800)
  );
  defparam n__108126.INIT = 16'hD5FF;
  LUT4 n__108126 (
    .I0(tto_skip_),
    .I1(CHOICE2690),
    .I2(CHOICE2689),
    .I3(io_bus_in_skip_),
    .O(CHOICE2693)
  );
  defparam n__108197.INIT = 16'hFEEE;
  LUT4 n__108197 (
    .I0(CHOICE2662),
    .I1(CHOICE2695),
    .I2(op2),
    .I3(N4119),
    .O(n__108)
  );
  defparam _n0194_SW0_SW1.INIT = 16'hAACF;
  LUT4_L _n0194_SW0_SW1 (
    .I0(N4182),
    .I1(and_enable),
    .I2(CHOICE3731),
    .I3(eae_on_1),
    .LO(N4033)
  );
  defparam n__2311.INIT = 16'h8000;
  LUT4 n__2311 (
    .I0(io_bus_in_int_),
    .I1(irq_IBUF),
    .I2(keyboard_flag_),
    .I3(mp_int_),
    .O(CHOICE1875)
  );
  defparam n__56410.INIT = 16'hEFFF;
  LUT4 n__56410 (
    .I0(N4111),
    .I1(N400),
    .I2(mb09),
    .I3(mb04),
    .O(CHOICE1856)
  );
  defparam n__13776.INIT = 16'h0F02;
  LUT4 n__13776 (
    .I0(_n0054),
    .I1(hs),
    .I2(N4093),
    .I3(_n0070),
    .O(CHOICE2722)
  );
  defparam _n0194_SW0_SW1_SW0.INIT = 8'hF2;
  LUT3 _n0194_SW0_SW1_SW0 (
    .I0(sc0_3_0_),
    .I1(N396),
    .I2(N3974),
    .O(N4182)
  );
  defparam n__2384.INIT = 16'hF8FF;
  LUT4 n__2384 (
    .I0(CHOICE1875),
    .I1(CHOICE1886),
    .I2(N4155),
    .I3(N429),
    .O(n__23)
  );
  defparam Ker21723_SW1_SW0.INIT = 8'hC4;
  LUT3 Ker21723_SW1_SW0 (
    .I0(eae_ir1),
    .I1(eae_on),
    .I2(CHOICE3092),
    .O(N4139)
  );
  defparam _n0834461_G.INIT = 16'hC444;
  LUT4_L _n0834461_G (
    .I0(io_enable),
    .I1(CHOICE3039),
    .I2(in04_IBUF),
    .I3(tt0_),
    .LO(N4200)
  );
  defparam _n0194_SW0.INIT = 16'hFDDF;
  LUT4 _n0194_SW0 (
    .I0(sc0_3_0_),
    .I1(N396),
    .I2(mq10),
    .I3(mq11),
    .O(N1781)
  );
  defparam _n0655_SW4.INIT = 16'hFFF8;
  LUT4 _n0655_SW4 (
    .I0(N3900),
    .I1(ts1),
    .I2(CHOICE3163),
    .I3(N4259),
    .O(N4030)
  );
  defparam _n083831.INIT = 8'h13;
  LUT3 _n083831 (
    .I0(sr02_IBUF),
    .I1(N4113),
    .I2(sr_enable),
    .O(CHOICE2969)
  );
  OBUF hole8_OBUF_700 (
    .I(hole8_OBUF),
    .O(hole8)
  );
  defparam tt_inst_1_SW0.INIT = 16'hFCEC;
  LUT4 tt_inst_1_SW0 (
    .I0(uf),
    .I1(N1115),
    .I2(N4179),
    .I3(mb04_3),
    .O(N3899)
  );
  OBUF bac11_OBUF (
    .I(ac11),
    .O(bac11)
  );
  defparam _n083118.INIT = 4'h7;
  LUT2 _n083118 (
    .I0(mq07),
    .I1(mq_enable),
    .O(CHOICE3232)
  );
  defparam regbus0434.INIT = 8'h4C;
  LUT3 regbus0434 (
    .I0(adder02),
    .I1(CHOICE3434),
    .I2(double_right_rotate),
    .O(CHOICE3438)
  );
  defparam n__12845_SW0.INIT = 16'hF888;
  LUT4_L n__12845_SW0 (
    .I0(double_right_rotate),
    .I1(adder10),
    .I2(double_left_rotate),
    .I3(adder01),
    .LO(N4022)
  );
  defparam \Madd__n0028_Mxor_Result<0>_Xo<1>1_SW4 .INIT = 16'hF3F2;
  LUT4 \Madd__n0028_Mxor_Result<0>_Xo<1>1_SW4  (
    .I0(N428),
    .I1(N4003),
    .I2(N3923),
    .I3(no_shift),
    .O(N3982)
  );
  defparam _n0657142.INIT = 8'h8C;
  LUT3_L _n0657142 (
    .I0(CHOICE3192),
    .I1(CHOICE3178),
    .I2(mem_enable0_4),
    .LO(CHOICE3195)
  );
  defparam regbus0646.INIT = 16'h69FF;
  LUT4_L regbus0646 (
    .I0(\_n0797<0> ),
    .I1(\_n0798<0> ),
    .I2(n__132),
    .I3(left_shift),
    .LO(CHOICE3463)
  );
  defparam _n065746.INIT = 8'h20;
  LUT3_L _n065746 (
    .I0(break),
    .I1(mem_incr_IBUF),
    .I2(ts2),
    .LO(CHOICE3172)
  );
  defparam regbus0034_SW0_SW0.INIT = 16'h8F88;
  LUT4 regbus0034_SW0_SW0 (
    .I0(N4228),
    .I1(double_left_rotate),
    .I2(N398),
    .I3(adder_l_),
    .O(N4045)
  );
  defparam regbus0634.INIT = 8'h4C;
  LUT3 regbus0634 (
    .I0(adder04),
    .I1(CHOICE3456),
    .I2(double_right_rotate),
    .O(CHOICE3460)
  );
  defparam _n082387.INIT = 16'h2A00;
  LUT4 _n082387 (
    .I0(in11_IBUF),
    .I1(N3863),
    .I2(N434),
    .I3(tt7_),
    .O(CHOICE3768)
  );
  defparam Ker42924_SW0.INIT = 8'hA8;
  LUT3_L Ker42924_SW0 (
    .I0(ir2),
    .I1(mb09_1),
    .I2(mb10),
    .LO(N3942)
  );
  defparam _n083844.INIT = 16'hC444;
  LUT4_L _n083844 (
    .I0(io_enable),
    .I1(CHOICE2969),
    .I2(io_bus_in02_),
    .I3(in02_IBUF),
    .LO(CHOICE2973)
  );
  defparam Ker3501_SW6.INIT = 4'h9;
  LUT2 Ker3501_SW6 (
    .I0(N531),
    .I1(\_n0792<1> ),
    .O(N4007)
  );
  defparam regbus0234_SW0.INIT = 8'hB3;
  LUT3 regbus0234_SW0 (
    .I0(double_right_rotate),
    .I1(CHOICE3545),
    .I2(adder00),
    .O(N4057)
  );
  defparam _n0674104_SW1.INIT = 16'hFF32;
  LUT4 _n0674104_SW1 (
    .I0(N3966),
    .I1(_n0054),
    .I2(CHOICE3687),
    .I3(CHOICE3684),
    .O(N4001)
  );
  defparam _n082736.INIT = 16'h135F;
  LUT4_L _n082736 (
    .I0(sc2),
    .I1(mq09),
    .I2(sc_enable),
    .I3(mq_enable),
    .LO(CHOICE3389)
  );
  defparam Ker4241_SW0.INIT = 4'hD;
  LUT2 Ker4241_SW0 (
    .I0(mem00_IBUF),
    .I1(hs),
    .O(N3935)
  );
  defparam _n084331.INIT = 8'h13;
  LUT3 _n084331 (
    .I0(sr01_IBUF),
    .I1(N4115),
    .I2(sr_enable),
    .O(CHOICE2915)
  );
  defparam sr_enable_SW0.INIT = 16'h0400;
  LUT4_D sr_enable_SW0 (
    .I0(N3906),
    .I1(mb09_1),
    .I2(mb11_1),
    .I3(mb03_2),
    .LO(N4253),
    .O(N2087)
  );
  defparam n__65719.INIT = 16'h3223;
  LUT4_L n__65719 (
    .I0(N324),
    .I1(N105),
    .I2(mq11),
    .I3(adder_l_),
    .LO(CHOICE2843)
  );
  defparam _n083531.INIT = 8'h13;
  LUT3 _n083531 (
    .I0(sr05_IBUF),
    .I1(N4099),
    .I2(sr_enable),
    .O(CHOICE3075)
  );
  defparam _n0831102_SW0.INIT = 16'hC444;
  LUT4_L _n0831102_SW0 (
    .I0(io_enable),
    .I1(CHOICE3241),
    .I2(N3925),
    .I3(io_bus_in07_),
    .LO(N3994)
  );
  defparam _n082240.INIT = 16'h4C00;
  LUT4 _n082240 (
    .I0(sr10_IBUF),
    .I1(CHOICE3473),
    .I2(sr_enable0),
    .I3(CHOICE3484),
    .O(CHOICE3485)
  );
  defparam _n082122_SW0.INIT = 16'h8F88;
  LUT4 _n082122_SW0 (
    .I0(ma11),
    .I1(N4226),
    .I2(da11_IBUF),
    .I3(data_add_enable),
    .O(N3842)
  );
  defparam _n082365.INIT = 16'h7000;
  LUT4 _n082365 (
    .I0(sr11_IBUF),
    .I1(sr_enable0),
    .I2(CHOICE3751),
    .I3(CHOICE3762),
    .O(CHOICE3763)
  );
  defparam _n082122.INIT = 8'h13;
  LUT3_L _n082122 (
    .I0(pc11),
    .I1(N3842),
    .I2(pc_enable),
    .LO(CHOICE3318)
  );
  defparam _n0826116.INIT = 16'h0075;
  LUT4 _n0826116 (
    .I0(io_enable),
    .I1(N3884),
    .I2(io_bus_in08_),
    .I3(N3927),
    .O(\_n0795<1> )
  );
  defparam _n08283.INIT = 4'h7;
  LUT2_L _n08283 (
    .I0(pc06),
    .I1(pc_enable),
    .LO(CHOICE2977)
  );
  defparam _n070321.INIT = 16'hAFAB;
  LUT4 _n070321 (
    .I0(ir0_),
    .I1(ir2),
    .I2(ir1),
    .I3(mb03_3),
    .O(CHOICE3270)
  );
  defparam _n082361.INIT = 16'h135F;
  LUT4 _n082361 (
    .I0(sc4),
    .I1(mq11),
    .I2(N4237),
    .I3(mq_enable),
    .O(CHOICE3762)
  );
  defparam _n065751.INIT = 16'hF888;
  LUT4 _n065751 (
    .I0(ca_incr__IBUF),
    .I1(current_address),
    .I2(mfts2),
    .I3(N1011),
    .O(CHOICE3175)
  );
  defparam regbus0527.INIT = 16'h222A;
  LUT4 regbus0527 (
    .I0(CHOICE3504),
    .I1(adder03),
    .I2(double_left_rotate),
    .I3(double_right_rotate),
    .O(CHOICE3510)
  );
  defparam _n083431_SW0.INIT = 16'h8F88;
  LUT4_D _n083431_SW0 (
    .I0(mq04),
    .I1(mq_enable),
    .I2(d04_IBUF),
    .I3(data_enable),
    .LO(N4254),
    .O(N4103)
  );
  defparam _n084344.INIT = 16'hC444;
  LUT4_L _n084344 (
    .I0(io_enable),
    .I1(CHOICE2915),
    .I2(io_bus_in01_),
    .I3(in01_IBUF),
    .LO(CHOICE2919)
  );
  defparam _n082236.INIT = 16'h135F;
  LUT4_L _n082236 (
    .I0(sc3),
    .I1(mq10),
    .I2(sc_enable),
    .I3(mq_enable),
    .LO(CHOICE3484)
  );
  defparam _n067471.INIT = 4'hE;
  LUT2 _n067471 (
    .I0(N428),
    .I1(_n0070),
    .O(CHOICE3700)
  );
  defparam _n0194_SW3.INIT = 16'hEFFF;
  LUT4 _n0194_SW3 (
    .I0(N105),
    .I1(and_enable),
    .I2(eae_ir1),
    .I3(CHOICE3731),
    .O(N3974)
  );
  FDC eae_on_1_701 (
    .D(n__609),
    .CLR(run_N0),
    .C(n__607),
    .Q(eae_on_1)
  );
  defparam _n067461_SW1.INIT = 16'h3332;
  LUT4 _n067461_SW1 (
    .I0(_n0070),
    .I1(_n0656),
    .I2(N428),
    .I3(N4131),
    .O(N3966)
  );
  defparam \Madd__n0028_Mxor_Result<0>_Xo<1>1_SW1 .INIT = 16'hA2F3;
  LUT4 \Madd__n0028_Mxor_Result<0>_Xo<1>1_SW1  (
    .I0(mb00),
    .I1(double_right_rotate),
    .I2(carry_insert_),
    .I3(and_enable),
    .O(N3938)
  );
  defparam tt_inst_1_SW0_SW0.INIT = 4'h7;
  LUT2 tt_inst_1_SW0_SW0 (
    .I0(s_),
    .I1(c_),
    .O(N4179)
  );
  defparam n__65744.INIT = 16'hF888;
  LUT4 n__65744 (
    .I0(ac11),
    .I1(N416),
    .I2(mq10),
    .I3(right_shift),
    .O(CHOICE2849)
  );
  defparam Ker400_SW1.INIT = 16'hFFFB;
  LUT4_D Ker400_SW1 (
    .I0(ir0_),
    .I1(ir1),
    .I2(ir2),
    .I3(mb05_1),
    .LO(N4255),
    .O(N3844)
  );
  defparam _n083031_SW0.INIT = 16'h8F88;
  LUT4_L _n083031_SW0 (
    .I0(mq06),
    .I1(mq_enable),
    .I2(d06_IBUF),
    .I3(data_enable),
    .LO(N4095)
  );
  defparam regbus0034_SW0.INIT = 8'hEC;
  LUT3_L regbus0034_SW0 (
    .I0(adder01),
    .I1(N4045),
    .I2(left_shift),
    .LO(N3929)
  );
  defparam _n06882.INIT = 8'h80;
  LUT3 _n06882 (
    .I0(defer),
    .I1(ir2),
    .I2(ts3),
    .O(CHOICE3198)
  );
  defparam _n067449.INIT = 8'hF7;
  LUT3 _n067449 (
    .I0(eae_ir2),
    .I1(eae_ir1),
    .I2(eae_ir0),
    .O(CHOICE3697)
  );
  defparam _n083160_G.INIT = 16'h7FFF;
  LUT4_L _n083160_G (
    .I0(sf1),
    .I1(N449),
    .I2(mb07),
    .I3(N3856),
    .LO(N4202)
  );
  defparam _n0194_SW0_SW0.INIT = 16'hAACF;
  LUT4 _n0194_SW0_SW0 (
    .I0(N3974),
    .I1(and_enable),
    .I2(CHOICE3731),
    .I3(eae_on_1),
    .O(N4032)
  );
  defparam n__10893.INIT = 4'h4;
  LUT2 n__10893 (
    .I0(mb04),
    .I1(mb05),
    .O(CHOICE2690)
  );
  defparam _n083460.INIT = 16'h084C;
  LUT4 _n083460 (
    .I0(ac04),
    .I1(CHOICE3044),
    .I2(ac_enable),
    .I3(acbar_enable),
    .O(\_n0801<1> )
  );
  defparam _n082815.INIT = 16'h4C5F;
  LUT4 _n082815 (
    .I0(ma06),
    .I1(da06_IBUF),
    .I2(ma_enable5_11),
    .I3(data_add_enable),
    .O(CHOICE2983)
  );
  defparam Ker35414.INIT = 16'h1110;
  LUT4 Ker35414 (
    .I0(brk_sync),
    .I1(int_ok),
    .I2(N4257),
    .I3(CHOICE3153),
    .O(CHOICE3296)
  );
  defparam regbus0422.INIT = 16'h222A;
  LUT4_L regbus0422 (
    .I0(CHOICE3431),
    .I1(adder03),
    .I2(N428),
    .I3(right_shift),
    .LO(CHOICE3434)
  );
  defparam regbus0864_SW0.INIT = 8'hEC;
  LUT3_L regbus0864_SW0 (
    .I0(adder09),
    .I1(N3953),
    .I2(left_shift),
    .LO(N4043)
  );
  defparam e_set48.INIT = 8'hF8;
  LUT3 e_set48 (
    .I0(defer),
    .I1(jmp__OBUF),
    .I2(CHOICE1850),
    .O(e_set)
  );
  defparam n__664_G.INIT = 16'h6AAA;
  LUT4 n__664_G (
    .I0(sc1),
    .I1(sc3),
    .I2(sc4),
    .I3(sc2),
    .O(N4204)
  );
  defparam _n0399_SW2.INIT = 16'h82AA;
  LUT4 _n0399_SW2 (
    .I0(double_left_rotate),
    .I1(N2238),
    .I2(mq00),
    .I3(eae_on),
    .O(N4027)
  );
  defparam tt_inst_1_SW51_G.INIT = 8'hFE;
  LUT3_L tt_inst_1_SW51_G (
    .I0(word_count),
    .I1(current_address),
    .I2(mb10),
    .LO(N4206)
  );
  defparam _n083723_SW0.INIT = 16'h8F88;
  LUT4 _n083723_SW0 (
    .I0(mem03_IBUF),
    .I1(mem_enable0_4),
    .I2(da03_IBUF),
    .I3(data_add_enable),
    .O(N4101)
  );
  defparam _n082618.INIT = 4'h7;
  LUT2 _n082618 (
    .I0(mq08),
    .I1(N4236),
    .O(CHOICE3343)
  );
  defparam regbus0214.INIT = 16'h4C5F;
  LUT4_L regbus0214 (
    .I0(double_left_rotate),
    .I1(mb02),
    .I2(adder04),
    .I3(and_enable),
    .LO(CHOICE3545)
  );
  defparam \Madd__n0028_Mxor_Result<1>_Xo<1>1_SW1 .INIT = 16'h3070;
  LUT4 \Madd__n0028_Mxor_Result<1>_Xo<1>1_SW1  (
    .I0(N428),
    .I1(N4007),
    .I2(CHOICE3614),
    .I3(N4234),
    .O(N3897)
  );
  defparam _n082329.INIT = 16'hFA32;
  LUT4_L _n082329 (
    .I0(CHOICE3747),
    .I1(data_enable),
    .I2(CHOICE3745),
    .I3(d11_IBUF),
    .LO(CHOICE3751)
  );
  defparam regbus1044_SW1.INIT = 16'hD800;
  LUT4 regbus1044_SW1 (
    .I0(\_n0791<1> ),
    .I1(N3897),
    .I2(N3896),
    .I3(N4176),
    .O(N4012)
  );
  defparam regbus0622.INIT = 16'h222A;
  LUT4 regbus0622 (
    .I0(CHOICE3453),
    .I1(adder05),
    .I2(N428),
    .I3(right_shift),
    .O(CHOICE3456)
  );
  defparam _n067436.INIT = 4'h7;
  LUT2 _n067436 (
    .I0(sc2),
    .I1(sc1),
    .O(CHOICE3692)
  );
  defparam regbus0835_SW0_SW0.INIT = 16'hF8FF;
  LUT4 regbus0835_SW0_SW0 (
    .I0(double_left_rotate),
    .I1(N4224),
    .I2(N3846),
    .I3(CHOICE3631),
    .O(N3953)
  );
  defparam _n082770.INIT = 16'h44C4;
  LUT4_L _n082770 (
    .I0(io_enable),
    .I1(CHOICE3390),
    .I2(io_bus_in09_),
    .I3(N3882),
    .LO(CHOICE3399)
  );
  defparam _n083431.INIT = 8'h13;
  LUT3 _n083431 (
    .I0(sr04_IBUF),
    .I1(N4254),
    .I2(sr_enable),
    .O(CHOICE3039)
  );
  defparam _n083558_SW0.INIT = 16'hB3BB;
  LUT4_L _n083558_SW0 (
    .I0(io_enable),
    .I1(CHOICE3075),
    .I2(N4047),
    .I3(io_bus_in05_),
    .LO(N4059)
  );
  defparam _n0831118.INIT = 16'h1B00;
  LUT4 _n0831118 (
    .I0(ac07),
    .I1(acbar_enable),
    .I2(ac_enable),
    .I3(N3994),
    .O(\_n0798<0> )
  );
  defparam _n082638.INIT = 16'h004C;
  LUT4 _n082638 (
    .I0(sr08_IBUF),
    .I1(CHOICE3343),
    .I2(N4240),
    .I3(N4037),
    .O(CHOICE3352)
  );
  OBUF bac03_OBUF (
    .I(ac03),
    .O(bac03)
  );
  defparam Ker363_SW1.INIT = 8'hBA;
  LUT3 Ker363_SW1 (
    .I0(N4024),
    .I1(N285),
    .I2(ts2),
    .O(N3861)
  );
  defparam regbus1044_SW1_SW0.INIT = 4'hB;
  LUT2_L regbus1044_SW1_SW0 (
    .I0(carry_insert_),
    .I1(left_shift),
    .LO(N4176)
  );
  defparam _n06888.INIT = 8'h20;
  LUT3 _n06888 (
    .I0(b_execute),
    .I1(ir2),
    .I2(ts2),
    .O(CHOICE3201)
  );
  defparam _n017327.INIT = 16'h3F5F;
  LUT4 _n017327 (
    .I0(N3858),
    .I1(N396),
    .I2(mq01),
    .I3(N4247),
    .O(CHOICE2930)
  );
  defparam _n0399_SW1.INIT = 16'h8008;
  LUT4 _n0399_SW1 (
    .I0(double_left_rotate),
    .I1(eae_on),
    .I2(mq00),
    .I3(N2238),
    .O(N4026)
  );
  defparam regbus0815_SW0.INIT = 16'h8F88;
  LUT4 regbus0815_SW0 (
    .I0(adder06),
    .I1(double_right_rotate),
    .I2(mb08),
    .I3(and_enable),
    .O(N3846)
  );
  defparam _n082317.INIT = 4'hD;
  LUT2 _n082317 (
    .I0(ts3),
    .I1(s_),
    .O(CHOICE3747)
  );
  defparam ma_enable5_11_SW0.INIT = 16'hF888;
  LUT4 ma_enable5_11_SW0 (
    .I0(word_count),
    .I1(ts4),
    .I2(N1011),
    .I3(mfts2),
    .O(N2324)
  );
  defparam _n083723.INIT = 8'h13;
  LUT3_L _n083723 (
    .I0(pc03),
    .I1(N4101),
    .I2(pc_enable),
    .LO(CHOICE2863)
  );
  defparam _n07060.INIT = 4'h8;
  LUT2 _n07060 (
    .I0(mem09_IBUF),
    .I1(N424),
    .O(CHOICE3320)
  );
  defparam _n083031.INIT = 8'h13;
  LUT3 _n083031 (
    .I0(sr06_IBUF),
    .I1(N4095),
    .I2(sr_enable),
    .O(CHOICE3124)
  );
  defparam Ker2170.INIT = 4'hE;
  LUT2 Ker2170 (
    .I0(sc0_3_0_),
    .I1(sc4),
    .O(CHOICE3086)
  );
  defparam _n083730.INIT = 8'h4C;
  LUT3 _n083730 (
    .I0(ma03),
    .I1(CHOICE2863),
    .I2(ma_enable0_4),
    .O(\_n0803<0> )
  );
  defparam _n082314.INIT = 4'h4;
  LUT2 _n082314 (
    .I0(mb11_1),
    .I1(mb10),
    .O(CHOICE3745)
  );
  defparam Ker3501_SW3_SW0.INIT = 16'hF888;
  LUT4 Ker3501_SW3_SW0 (
    .I0(right_shift),
    .I1(N4233),
    .I2(double_right_rotate),
    .I3(adder_l_),
    .O(N4041)
  );
  defparam tt_inst_1_SW6.INIT = 16'hCCDC;
  LUT4 tt_inst_1_SW6 (
    .I0(s_),
    .I1(N1126),
    .I2(mb10),
    .I3(mb11_1),
    .O(N3914)
  );
  defparam Ker400_SW0.INIT = 16'hFFFB;
  LUT4_L Ker400_SW0 (
    .I0(mb06_2),
    .I1(mb09_1),
    .I2(mb08_1),
    .I3(mb07_1),
    .LO(N3968)
  );
  defparam tt_inst_1_SW21_G.INIT = 8'hF2;
  LUT3 tt_inst_1_SW21_G (
    .I0(ts3),
    .I1(N285),
    .I2(N3872),
    .O(N4208)
  );
  defparam regbus0015_SW0.INIT = 8'hEA;
  LUT3 regbus0015_SW0 (
    .I0(N4173),
    .I1(adder00),
    .I2(no_shift),
    .O(N3985)
  );
  defparam regbus0015_SW0_SW0.INIT = 8'h1B;
  LUT3 regbus0015_SW0_SW0 (
    .I0(\_n0792<0> ),
    .I1(N3937),
    .I2(N3938),
    .O(N4173)
  );
  defparam _n065775.INIT = 16'hFFEF;
  LUT4 _n065775 (
    .I0(mem09_IBUF),
    .I1(s_),
    .I2(ts2),
    .I3(N3935),
    .O(CHOICE3180)
  );
  defparam _n067417.INIT = 4'h4;
  LUT2 _n067417 (
    .I0(hs),
    .I1(CHOICE3682),
    .O(CHOICE3684)
  );
  defparam regbus0416.INIT = 16'h4C5F;
  LUT4 regbus0416 (
    .I0(double_left_rotate),
    .I1(mb04),
    .I2(adder06),
    .I3(and_enable),
    .O(CHOICE3431)
  );
  defparam Ker21723_SW0.INIT = 16'h4F44;
  LUT4 Ker21723_SW0 (
    .I0(eae_ir1),
    .I1(eae_on),
    .I2(N1117),
    .I3(mb09),
    .O(N3979)
  );
  defparam _n06561.INIT = 16'h0080;
  LUT4_D _n06561 (
    .I0(ts3),
    .I1(b_fetch),
    .I2(N417),
    .I3(mb03_3),
    .LO(N4256),
    .O(_n0656)
  );
  OBUF bac04_OBUF (
    .I(ac04),
    .O(bac04)
  );
  defparam _n017351.INIT = 8'h4F;
  LUT3 _n017351 (
    .I0(eae_ir2),
    .I1(mq11),
    .I2(eae_ir1),
    .O(CHOICE2935)
  );
  defparam _n065765.INIT = 16'hFE00;
  LUT4 _n065765 (
    .I0(CHOICE3175),
    .I1(word_count),
    .I2(CHOICE3172),
    .I3(_n0061),
    .O(CHOICE3178)
  );
  defparam mftp0_702.INIT = 16'hF1F3;
  LUT4 mftp0_702 (
    .I0(key_st__IBUF),
    .I1(restart),
    .I2(run),
    .I3(N4143),
    .O(mftp0)
  );
  defparam regbus0616.INIT = 16'h4C5F;
  LUT4 regbus0616 (
    .I0(double_left_rotate),
    .I1(mb06),
    .I2(adder08),
    .I3(and_enable),
    .O(CHOICE3453)
  );
  defparam regbus0515.INIT = 16'h4C5F;
  LUT4_L regbus0515 (
    .I0(right_shift),
    .I1(mb05),
    .I2(adder04),
    .I3(and_enable),
    .LO(CHOICE3504)
  );
  defparam _n0399_SW0.INIT = 16'h5040;
  LUT4 _n0399_SW0 (
    .I0(N105),
    .I1(mq11),
    .I2(eae_ir1),
    .I3(N324),
    .O(N2238)
  );
  defparam _n068879.INIT = 16'h0103;
  LUT4 _n068879 (
    .I0(ir2),
    .I1(_n0173),
    .I2(N4230),
    .I3(N423),
    .O(CHOICE3220)
  );
  defparam Ker3501_SW0.INIT = 8'hB3;
  LUT3_L Ker3501_SW0 (
    .I0(adder06),
    .I1(CHOICE3510),
    .I2(left_shift),
    .LO(N3874)
  );
  defparam _n082671_SW0.INIT = 16'hF7FF;
  LUT4 _n082671_SW0 (
    .I0(in08_IBUF),
    .I1(CHOICE3359),
    .I2(N3931),
    .I3(tt4_),
    .O(N3884)
  );
  defparam _n083931_SW0.INIT = 16'h8F88;
  LUT4_L _n083931_SW0 (
    .I0(mq03),
    .I1(mq_enable),
    .I2(d03_IBUF),
    .I3(data_enable),
    .LO(N41111)
  );
  defparam _n017370.INIT = 4'h4;
  LUT2 _n017370 (
    .I0(eae_ir0),
    .I1(eae_on),
    .O(CHOICE2938)
  );
  defparam _n084231_SW0.INIT = 16'h8F88;
  LUT4 _n084231_SW0 (
    .I0(mq00),
    .I1(mq_enable),
    .I2(d00_IBUF),
    .I3(data_enable),
    .O(N4117)
  );
  defparam _n068880.INIT = 4'h8;
  LUT2_L _n068880 (
    .I0(CHOICE3213),
    .I1(CHOICE3220),
    .LO(_n0688)
  );
  defparam _n065780.INIT = 16'hFFFE;
  LUT4 _n065780 (
    .I0(ma01),
    .I1(ma02),
    .I2(ma00),
    .I3(ma03),
    .O(CHOICE3183)
  );
  defparam _n082638_SW0.INIT = 16'hDC50;
  LUT4 _n082638_SW0 (
    .I0(d08_IBUF),
    .I1(sc1),
    .I2(data_enable),
    .I3(sc_enable),
    .O(N4037)
  );
  defparam _n071095.INIT = 16'h3553;
  LUT4 _n071095 (
    .I0(N4033),
    .I1(N4032),
    .I2(mq10),
    .I3(mq11),
    .O(CHOICE3736)
  );
  defparam Ker3501_SW2.INIT = 16'hFBF3;
  LUT4_L Ker3501_SW2 (
    .I0(adder03),
    .I1(CHOICE3548),
    .I2(N4057),
    .I3(left_shift),
    .LO(N3878)
  );
  defparam _n08243.INIT = 4'h7;
  LUT2_L _n08243 (
    .I0(pc08),
    .I1(pc_enable),
    .LO(CHOICE3048)
  );
  defparam Ker3511.INIT = 16'h0BAB;
  LUT4_D Ker3511 (
    .I0(N420),
    .I1(defer),
    .I2(b_fetch),
    .I3(mb03_2),
    .LO(N4257),
    .O(N3511)
  );
  defparam _n065781.INIT = 4'hE;
  LUT2 _n065781 (
    .I0(ma04),
    .I1(ma05),
    .O(CHOICE3184)
  );
  defparam _n070334.INIT = 16'hAA80;
  LUT4_L _n070334 (
    .I0(b_fetch),
    .I1(mb11),
    .I2(N4053),
    .I3(CHOICE3270),
    .LO(CHOICE3272)
  );
  defparam _n0674104_SW0.INIT = 16'hFF32;
  LUT4 _n0674104_SW0 (
    .I0(N3965),
    .I1(_n0054),
    .I2(CHOICE3687),
    .I3(CHOICE3684),
    .O(N4000)
  );
  defparam _n067461_SW1_SW0.INIT = 16'hA2AA;
  LUT4 _n067461_SW1_SW0 (
    .I0(eae_on),
    .I1(sc2),
    .I2(CHOICE3697),
    .I3(sc1),
    .O(N4131)
  );
  defparam _n08333.INIT = 4'h7;
  LUT2_L _n08333 (
    .I0(pc05),
    .I1(pc_enable),
    .LO(CHOICE2942)
  );
  defparam _n083169_SW0.INIT = 4'h8;
  LUT2_L _n083169_SW0 (
    .I0(df1),
    .I1(_n0260),
    .LO(N3990)
  );
  defparam Ker400.INIT = 16'hFFFE;
  LUT4 Ker400 (
    .I0(mb06_2),
    .I1(mb08_1),
    .I2(mb07_1),
    .I3(N4255),
    .O(N400)
  );
  defparam _n082214.INIT = 4'hB;
  LUT2 _n082214 (
    .I0(d10_IBUF),
    .I1(N4216),
    .O(CHOICE3473)
  );
  defparam regbus1144.INIT = 16'h4F7F;
  LUT4 regbus1144 (
    .I0(N4055),
    .I1(eae_on),
    .I2(left_shift),
    .I3(adder_l_),
    .O(CHOICE3576)
  );
  defparam _n083048.INIT = 16'h135F;
  LUT4 _n083048 (
    .I0(sf0),
    .I1(if0),
    .I2(_n0256),
    .I3(_n0259),
    .O(CHOICE3131)
  );
  defparam _n06572.INIT = 4'hD;
  LUT2 _n06572 (
    .I0(skip_),
    .I1(usf),
    .O(CHOICE3159)
  );
  defparam _n070334_SW0.INIT = 16'hA800;
  LUT4 _n070334_SW0 (
    .I0(ir2),
    .I1(mb09_2),
    .I2(mb10),
    .I3(mb03_3),
    .O(N4053)
  );
  defparam \Madd__n0028_Mxor_Result<0>_Xo<1>1_SW0 .INIT = 16'h4C5F;
  LUT4 \Madd__n0028_Mxor_Result<0>_Xo<1>1_SW0  (
    .I0(carry_insert_),
    .I1(mb00),
    .I2(double_right_rotate),
    .I3(and_enable),
    .O(N3937)
  );
  defparam regbus1134_SW0_SW0.INIT = 16'hFBF3;
  LUT4 regbus1134_SW0_SW0 (
    .I0(double_left_rotate),
    .I1(CHOICE3569),
    .I2(N4020),
    .I3(adder00),
    .O(N3923)
  );
  defparam Ker35438.INIT = 16'h5547;
  LUT4 Ker35438 (
    .I0(c_set_),
    .I1(N154),
    .I2(N3916),
    .I3(N400),
    .O(CHOICE3304)
  );
  defparam _n084231.INIT = 8'h13;
  LUT3 _n084231 (
    .I0(sr00_IBUF),
    .I1(N4117),
    .I2(sr_enable),
    .O(CHOICE2880)
  );
  defparam Ker217111.INIT = 16'h020A;
  LUT4 Ker217111 (
    .I0(eae_ir2),
    .I1(sc2),
    .I2(eae_ir0),
    .I3(sc1),
    .O(CHOICE3092)
  );
  defparam _n071082.INIT = 16'hFF7F;
  LUT4 _n071082 (
    .I0(ir2),
    .I1(N447),
    .I2(ts3),
    .I3(ir1),
    .O(CHOICE3731)
  );
  defparam regbus0315.INIT = 16'h4C5F;
  LUT4_L regbus0315 (
    .I0(right_shift),
    .I1(mb03),
    .I2(adder02),
    .I3(and_enable),
    .LO(CHOICE3650)
  );
  defparam _n083138_SW0.INIT = 16'h8F88;
  LUT4_L _n083138_SW0 (
    .I0(sc0),
    .I1(sc_enable),
    .I2(d07_IBUF),
    .I3(data_enable),
    .LO(N4039)
  );
  defparam _n083931.INIT = 8'h13;
  LUT3 _n083931 (
    .I0(sr03_IBUF),
    .I1(N41111),
    .I2(sr_enable),
    .O(CHOICE3004)
  );
  defparam Ker4111.INIT = 4'hD;
  LUT2 Ker4111 (
    .I0(b_fetch),
    .I1(mb03),
    .O(N4111)
  );
  defparam _n082415.INIT = 16'h4C5F;
  LUT4 _n082415 (
    .I0(ma08),
    .I1(da08_IBUF),
    .I2(ma_enable5_11),
    .I3(data_add_enable),
    .O(CHOICE3054)
  );
  defparam _n0655_SW1.INIT = 8'hF8;
  LUT3 _n0655_SW1 (
    .I0(ts1),
    .I1(N1115),
    .I2(N2324),
    .O(N3871)
  );
  defparam _n083315.INIT = 16'h4C5F;
  LUT4 _n083315 (
    .I0(ma05),
    .I1(da05_IBUF),
    .I2(ma_enable5_11),
    .I3(data_add_enable),
    .O(CHOICE2948)
  );
  defparam _n082022.INIT = 8'h13;
  LUT3 _n082022 (
    .I0(pc10),
    .I1(N3921),
    .I2(pc_enable),
    .O(CHOICE3287)
  );
  defparam mem_enable5_8_SW0.INIT = 16'h4000;
  LUT4 mem_enable5_8_SW0 (
    .I0(mb03),
    .I1(b_fetch),
    .I2(ts3),
    .I3(N420),
    .O(N2822)
  );
  defparam regbus0734.INIT = 16'h0103;
  LUT4 regbus0734 (
    .I0(right_shift),
    .I1(N4107),
    .I2(N4161),
    .I3(adder06),
    .O(CHOICE3532)
  );
  defparam _n084244.INIT = 16'hC444;
  LUT4_L _n084244 (
    .I0(io_enable),
    .I1(CHOICE2880),
    .I2(io_bus_in00_),
    .I3(in00_IBUF),
    .LO(CHOICE2884)
  );
  FD mb06_3_703 (
    .D(regbus06),
    .C(mb_load),
    .Q(mb06_3)
  );
  defparam _n083138.INIT = 16'h020A;
  LUT4 _n083138 (
    .I0(CHOICE3232),
    .I1(sr07_IBUF),
    .I2(N4039),
    .I3(sr_enable),
    .O(CHOICE3241)
  );
  defparam _n0194_SW1.INIT = 16'h4000;
  LUT4 _n0194_SW1 (
    .I0(eae_ir0),
    .I1(eae_ir2),
    .I2(eae_on),
    .I3(eae_ir1),
    .O(N3961)
  );
  defparam regbus0921.INIT = 8'h4C;
  LUT3 regbus0921 (
    .I0(adder07),
    .I1(CHOICE3667),
    .I2(double_right_rotate),
    .O(CHOICE3671)
  );
  defparam _n067461_SW0.INIT = 16'h0F08;
  LUT4 _n067461_SW0 (
    .I0(N3865),
    .I1(eae_on),
    .I2(_n0656),
    .I3(CHOICE3700),
    .O(N3965)
  );
  OBUF mb09__OBUF (
    .I(mcbmb09__OBUF),
    .O(mb09_)
  );
  defparam _n068831.INIT = 16'hF888;
  LUT4 _n068831 (
    .I0(break),
    .I1(d_in__IBUF),
    .I2(N4311),
    .I3(N442),
    .O(CHOICE3209)
  );
  defparam _n068826.INIT = 16'hA888;
  LUT4 _n068826 (
    .I0(ts4),
    .I1(current_address),
    .I2(defer),
    .I3(jmp__OBUF),
    .O(CHOICE3206)
  );
  FD mb04_3_704 (
    .D(regbus04),
    .C(mb_load),
    .Q(mb04_3)
  );
  defparam _n065711.INIT = 16'hF222;
  LUT4 _n065711 (
    .I0(ts3),
    .I1(N285),
    .I2(N3996),
    .I3(ts2),
    .O(CHOICE3163)
  );
  defparam _n083944.INIT = 16'hC444;
  LUT4_L _n083944 (
    .I0(io_enable),
    .I1(CHOICE3004),
    .I2(io_bus_in03_),
    .I3(in03_IBUF),
    .LO(CHOICE3008)
  );
  defparam Ker4301_SW0.INIT = 8'hFD;
  LUT3 Ker4301_SW0 (
    .I0(ts3),
    .I1(uf),
    .I2(N146),
    .O(N3850)
  );
  defparam _n065792.INIT = 16'hFFF7;
  LUT4_L _n065792 (
    .I0(defer),
    .I1(ma08),
    .I2(ma06),
    .I3(ma07),
    .LO(CHOICE3189)
  );
  defparam regbus0819.INIT = 16'h69FF;
  LUT4 regbus0819 (
    .I0(\_n0797<0> ),
    .I1(\_n0798<0> ),
    .I2(n__132),
    .I3(right_shift),
    .O(CHOICE3631)
  );
  defparam regbus1032.INIT = 16'h3050;
  LUT4_D regbus1032 (
    .I0(N4026),
    .I1(N4027),
    .I2(CHOICE3611),
    .I3(adder_l_),
    .LO(N4258),
    .O(CHOICE3614)
  );
  defparam regbus0914.INIT = 16'h4C5F;
  LUT4 regbus0914 (
    .I0(right_shift),
    .I1(mb09),
    .I2(adder08),
    .I3(and_enable),
    .O(CHOICE3667)
  );
  defparam _n065712.INIT = 16'h0080;
  LUT4_D _n065712 (
    .I0(N3998),
    .I1(b_fetch),
    .I2(mb11),
    .I3(mb03_3),
    .LO(N4259),
    .O(CHOICE3164)
  );
  defparam _n083223_SW0.INIT = 16'h8F88;
  LUT4_L _n083223_SW0 (
    .I0(mem04_IBUF),
    .I1(mem_enable0_4),
    .I2(da04_IBUF),
    .I3(data_add_enable),
    .LO(N4097)
  );
  defparam _n082022_SW0.INIT = 16'h8F88;
  LUT4 _n082022_SW0 (
    .I0(ma10),
    .I1(ma_enable5_11),
    .I2(da10_IBUF),
    .I3(data_add_enable),
    .O(N3921)
  );
  defparam Ker4491_SW0.INIT = 4'h7;
  LUT2 Ker4491_SW0 (
    .I0(b_fetch),
    .I1(N415),
    .O(N3890)
  );
  defparam _n082522_SW0.INIT = 16'h8F88;
  LUT4 _n082522_SW0 (
    .I0(ma09),
    .I1(ma_enable5_11),
    .I2(da09_IBUF),
    .I3(data_add_enable),
    .O(N4016)
  );
  defparam regbus0734_SW0.INIT = 16'h9600;
  LUT4 regbus0734_SW0 (
    .I0(carry_out6_),
    .I1(\_n0801<0> ),
    .I2(\_n0800<0> ),
    .I3(double_right_rotate),
    .O(N4161)
  );
  defparam _n067439_SW0.INIT = 16'hFAF8;
  LUT4 _n067439_SW0 (
    .I0(CHOICE3692),
    .I1(sc4),
    .I2(CHOICE3697),
    .I3(sc0_3_0_),
    .O(N3865)
  );
  defparam _n082273_SW0_SW0.INIT = 16'hC444;
  LUT4_L _n082273_SW0_SW0 (
    .I0(io_enable),
    .I1(CHOICE3485),
    .I2(io_bus_in10_),
    .I3(CHOICE3490),
    .LO(N3959)
  );
  defparam _n08293.INIT = 4'h7;
  LUT2_L _n08293 (
    .I0(pc07),
    .I1(pc_enable),
    .LO(CHOICE3012)
  );
  defparam regbus1114_SW0_SW0.INIT = 16'h8F88;
  LUT4_L regbus1114_SW0_SW0 (
    .I0(adder10),
    .I1(right_shift),
    .I2(mb11),
    .I3(and_enable),
    .LO(N4020)
  );
  defparam _n071039_SW0.INIT = 16'hFF7F;
  LUT4 _n071039_SW0 (
    .I0(b_fetch),
    .I1(ts3),
    .I2(N417),
    .I3(mb04_3),
    .O(N3940)
  );
  defparam Ker35424_SW0.INIT = 16'h2220;
  LUT4_L Ker35424_SW0 (
    .I0(ir2),
    .I1(N103),
    .I2(mb09_1),
    .I3(mb10),
    .LO(N3919)
  );
  defparam regbus0218.INIT = 16'h69FF;
  LUT4 regbus0218 (
    .I0(\_n0806<0> ),
    .I1(\_n0807<0> ),
    .I2(n__160),
    .I3(right_shift),
    .O(CHOICE3548)
  );
  defparam _n02561_SW0.INIT = 8'h80;
  LUT3 _n02561_SW0 (
    .I0(sf5),
    .I1(mb08_2),
    .I2(mb07_2),
    .O(N3863)
  );
  defparam regbus1021.INIT = 8'h4C;
  LUT3 regbus1021 (
    .I0(adder08),
    .I1(CHOICE3607),
    .I2(double_right_rotate),
    .O(CHOICE3611)
  );
  defparam _n083176_SW0.INIT = 16'h0080;
  LUT4 _n083176_SW0 (
    .I0(in07_IBUF),
    .I1(CHOICE3248),
    .I2(tt3_),
    .I3(N3990),
    .O(N3925)
  );
  OBUF bac10_OBUF (
    .I(ac10),
    .O(bac10)
  );
  defparam regbus0930.INIT = 16'h69FF;
  LUT4_L regbus0930 (
    .I0(\_n0791<1> ),
    .I1(\_n0792<1> ),
    .I2(N531),
    .I3(left_shift),
    .LO(CHOICE3674)
  );
  defparam _n082665_SW0.INIT = 4'h8;
  LUT2_L _n082665_SW0 (
    .I0(if2),
    .I1(_n0259),
    .LO(N3931)
  );
  defparam _n082029.INIT = 8'hC4;
  LUT3 _n082029 (
    .I0(mem10_IBUF),
    .I1(CHOICE3287),
    .I2(N4229),
    .O(\_n0791<1> )
  );
  defparam \Madd__n0028_Mxor_Result<1>_Xo<1>1_SW0 .INIT = 16'hC0D0;
  LUT4 \Madd__n0028_Mxor_Result<1>_Xo<1>1_SW0  (
    .I0(N428),
    .I1(N4007),
    .I2(N4258),
    .I3(no_shift),
    .O(N3896)
  );
  defparam Ker4491.INIT = 16'h0001;
  LUT4_D Ker4491 (
    .I0(N3890),
    .I1(mb06_2),
    .I2(mb03_1),
    .I3(mb05),
    .LO(N4260),
    .O(N449)
  );
  defparam _n0826101_SW0.INIT = 16'hEF4F;
  LUT4_L _n0826101_SW0 (
    .I0(ac08),
    .I1(acbar_enable),
    .I2(CHOICE3352),
    .I3(ac_enable),
    .LO(N3927)
  );
  defparam Ker4271_SW0.INIT = 16'h4000;
  LUT4 Ker4271_SW0 (
    .I0(ir2),
    .I1(ir0_),
    .I2(ir1),
    .I3(b_execute),
    .O(N3996)
  );
  defparam _n083223.INIT = 8'h13;
  LUT3 _n083223 (
    .I0(pc04),
    .I1(N4097),
    .I2(pc_enable),
    .O(CHOICE2898)
  );
  defparam _n0655_SW3.INIT = 16'hFFEC;
  LUT4_L _n0655_SW3 (
    .I0(ts1),
    .I1(CHOICE3163),
    .I2(N3899),
    .I3(CHOICE3164),
    .LO(N4029)
  );
  defparam _n068845.INIT = 16'hFECC;
  LUT4_L _n068845 (
    .I0(N3894),
    .I1(CHOICE3206),
    .I2(CHOICE3209),
    .I3(ts2),
    .LO(CHOICE3212)
  );
  defparam regbus1014.INIT = 16'h4C5F;
  LUT4 regbus1014 (
    .I0(right_shift),
    .I1(mb10),
    .I2(adder09),
    .I3(and_enable),
    .O(CHOICE3607)
  );
  defparam _n083230.INIT = 8'h4C;
  LUT3 _n083230 (
    .I0(ma04),
    .I1(CHOICE2898),
    .I2(N4218),
    .O(\_n0800<1> )
  );
  defparam _n083831_SW0.INIT = 16'h8F88;
  LUT4_L _n083831_SW0 (
    .I0(mq02),
    .I1(mq_enable),
    .I2(d02_IBUF),
    .I3(data_enable),
    .LO(N4113)
  );
  defparam _n0657113.INIT = 16'hCCC8;
  LUT4 _n0657113 (
    .I0(CHOICE3189),
    .I1(CHOICE3180),
    .I2(CHOICE3184),
    .I3(CHOICE3183),
    .O(CHOICE3192)
  );
  defparam _n065724.INIT = 16'hFE10;
  LUT4 _n065724 (
    .I0(N154),
    .I1(N400),
    .I2(N4029),
    .I3(N4030),
    .O(CHOICE3168)
  );
  defparam _n082915.INIT = 16'h4C5F;
  LUT4 _n082915 (
    .I0(ma07),
    .I1(da07_IBUF),
    .I2(ma_enable5_11),
    .I3(data_add_enable),
    .O(CHOICE3018)
  );
  defparam _n083090_SW0.INIT = 16'hC444;
  LUT4_L _n083090_SW0 (
    .I0(io_enable),
    .I1(CHOICE3124),
    .I2(N3992),
    .I3(io_bus_in06_),
    .LO(N4049)
  );
  defparam mem_ext_io_enable_1_SW2.INIT = 8'hBF;
  LUT3 mem_ext_io_enable_1_SW2 (
    .I0(N3850),
    .I1(mb09_1),
    .I2(mb04_2),
    .O(N3988)
  );
  defparam \Madd__n0028_Mxor_Result<0>_Xo<1>1_SW3 .INIT = 16'hF1F3;
  LUT4 \Madd__n0028_Mxor_Result<0>_Xo<1>1_SW3  (
    .I0(carry_insert_),
    .I1(eae_on),
    .I2(CHOICE2775),
    .I3(btt_inst__OBUF),
    .O(N3977)
  );
  defparam _n082129.INIT = 8'hC4;
  LUT3 _n082129 (
    .I0(mem11_IBUF),
    .I1(CHOICE3318),
    .I2(_n0706),
    .O(\_n0791<0> )
  );
  defparam _n082522.INIT = 8'h13;
  LUT3_L _n082522 (
    .I0(pc09),
    .I1(N4016),
    .I2(pc_enable),
    .LO(CHOICE3107)
  );
  defparam _n017314_SW0.INIT = 16'h8C04;
  LUT4 _n017314_SW0 (
    .I0(sc4),
    .I1(sc1),
    .I2(sc0_3_0_),
    .I3(sc2),
    .O(N3858)
  );
  defparam _n02591_SW0.INIT = 4'h8;
  LUT2_D _n02591_SW0 (
    .I0(mb09_2),
    .I1(mb04_3),
    .LO(N4261),
    .O(N3856)
  );
  defparam _n02601_SW0.INIT = 4'h7;
  LUT2_D _n02601_SW0 (
    .I0(mb04),
    .I1(mb09),
    .LO(N4262),
    .O(N3854)
  );
  defparam _n082740.INIT = 16'h4C00;
  LUT4 _n082740 (
    .I0(sr09_IBUF),
    .I1(CHOICE3378),
    .I2(sr_enable),
    .I3(CHOICE3389),
    .O(CHOICE3390)
  );
  defparam regbus0346_SW0.INIT = 16'hF0E0;
  LUT4_L regbus0346_SW0 (
    .I0(N428),
    .I1(double_left_rotate),
    .I2(adder03),
    .I3(no_shift),
    .LO(N4035)
  );
  defparam _n083531_SW0.INIT = 16'h8F88;
  LUT4_L _n083531_SW0 (
    .I0(mq05),
    .I1(mq_enable),
    .I2(d05_IBUF),
    .I3(data_enable),
    .LO(N4099)
  );
  defparam _n082529.INIT = 8'hC4;
  LUT3 _n082529 (
    .I0(mem09_IBUF),
    .I1(CHOICE3107),
    .I2(_n0706),
    .O(\_n0794<0> )
  );
  defparam _n0830106.INIT = 16'h1B00;
  LUT4 _n0830106 (
    .I0(ac06),
    .I1(acbar_enable),
    .I2(ac_enable),
    .I3(N4049),
    .O(\_n0798<1> )
  );
  defparam _n082256.INIT = 16'h4C00;
  LUT4 _n082256 (
    .I0(sf4),
    .I1(in10_IBUF),
    .I2(_n0256),
    .I3(tt6_),
    .O(CHOICE3490)
  );
  defparam _n082714.INIT = 4'hB;
  LUT2 _n082714 (
    .I0(d09_IBUF),
    .I1(data_enable),
    .O(CHOICE3378)
  );
  defparam Ker42955_SW0.INIT = 8'hF7;
  LUT3 Ker42955_SW0 (
    .I0(ts4),
    .I1(brk_sync),
    .I2(int_ok),
    .O(N3852)
  );
  BUFGP dclk_BUFGP_705 (
    .I(dclk),
    .O(dclk_BUFGP)
  );
  BUFGP c_i_r_BUFGP_706 (
    .I(c_i_r),
    .O(c_i_r_BUFGP)
  );
  BUFGP sync_pun_BUFGP_707 (
    .I(sync_pun),
    .O(sync_pun_BUFGP)
  );
  IBUF key_dp__IBUF_708 (
    .I(key_dp_),
    .O(key_dp__IBUF)
  );
  IBUF key_ss__IBUF_709 (
    .I(key_ss_),
    .O(key_ss__IBUF)
  );
  IBUF zone04_index_IBUF_710 (
    .I(zone04_index),
    .O(zone04_index_IBUF)
  );
  IBUF rd_hole1_IBUF_711 (
    .I(rd_hole1),
    .O(rd_hole1_IBUF)
  );
  IBUF rd_hole2_IBUF_712 (
    .I(rd_hole2),
    .O(rd_hole2_IBUF)
  );
  IBUF rd_hole3_IBUF_713 (
    .I(rd_hole3),
    .O(rd_hole3_IBUF)
  );
  IBUF rd_hole4_IBUF_714 (
    .I(rd_hole4),
    .O(rd_hole4_IBUF)
  );
  IBUF key_st__IBUF_715 (
    .I(key_st_),
    .O(key_st__IBUF)
  );
  IBUF rd_hole5_IBUF_716 (
    .I(rd_hole5),
    .O(rd_hole5_IBUF)
  );
  IBUF rd_hole6_IBUF_717 (
    .I(rd_hole6),
    .O(rd_hole6_IBUF)
  );
  IBUF rd_hole7_IBUF_718 (
    .I(rd_hole7),
    .O(rd_hole7_IBUF)
  );
  IBUF rd_hole8_IBUF_719 (
    .I(rd_hole8),
    .O(rd_hole8_IBUF)
  );
  IBUF cr_ready_IBUF_720 (
    .I(cr_ready),
    .O(cr_ready_IBUF)
  );
  IBUF d00_IBUF_721 (
    .I(d00),
    .O(d00_IBUF)
  );
  IBUF d01_IBUF_722 (
    .I(d01),
    .O(d01_IBUF)
  );
  IBUF d02_IBUF_723 (
    .I(d02),
    .O(d02_IBUF)
  );
  IBUF d03_IBUF_724 (
    .I(d03),
    .O(d03_IBUF)
  );
  IBUF d04_IBUF_725 (
    .I(d04),
    .O(d04_IBUF)
  );
  IBUF d05_IBUF_726 (
    .I(d05),
    .O(d05_IBUF)
  );
  IBUF d10_IBUF_727 (
    .I(d10),
    .O(d10_IBUF)
  );
  IBUF d06_IBUF_728 (
    .I(d06),
    .O(d06_IBUF)
  );
  IBUF d11_IBUF_729 (
    .I(d11),
    .O(d11_IBUF)
  );
  IBUF d07_IBUF_730 (
    .I(d07),
    .O(d07_IBUF)
  );
  IBUF d08_IBUF_731 (
    .I(d08),
    .O(d08_IBUF)
  );
  IBUF d09_IBUF_732 (
    .I(d09),
    .O(d09_IBUF)
  );
  IBUF key_ex__IBUF_733 (
    .I(key_ex_),
    .O(key_ex__IBUF)
  );
  IBUF zone10_index_IBUF_734 (
    .I(zone10_index),
    .O(zone10_index_IBUF)
  );
  IBUF zone05_index_IBUF_735 (
    .I(zone05_index),
    .O(zone05_index_IBUF)
  );
  IBUF s_feed_hole_IBUF_736 (
    .I(s_feed_hole),
    .O(s_feed_hole_IBUF)
  );
  IBUF in00_IBUF_737 (
    .I(in00),
    .O(in00_IBUF)
  );
  IBUF in01_IBUF_738 (
    .I(in01),
    .O(in01_IBUF)
  );
  IBUF in02_IBUF_739 (
    .I(in02),
    .O(in02_IBUF)
  );
  IBUF in03_IBUF_740 (
    .I(in03),
    .O(in03_IBUF)
  );
  IBUF in04_IBUF_741 (
    .I(in04),
    .O(in04_IBUF)
  );
  IBUF in05_IBUF_742 (
    .I(in05),
    .O(in05_IBUF)
  );
  IBUF in10_IBUF_743 (
    .I(in10),
    .O(in10_IBUF)
  );
  IBUF in06_IBUF_744 (
    .I(in06),
    .O(in06_IBUF)
  );
  IBUF in11_IBUF_745 (
    .I(in11),
    .O(in11_IBUF)
  );
  IBUF in07_IBUF_746 (
    .I(in07),
    .O(in07_IBUF)
  );
  IBUF in08_IBUF_747 (
    .I(in08),
    .O(in08_IBUF)
  );
  IBUF in09_IBUF_748 (
    .I(in09),
    .O(in09_IBUF)
  );
  IBUF dfsr0_IBUF_749 (
    .I(dfsr0),
    .O(dfsr0_IBUF)
  );
  IBUF dfsr1_IBUF_750 (
    .I(dfsr1),
    .O(dfsr1_IBUF)
  );
  IBUF dfsr2_IBUF_751 (
    .I(dfsr2),
    .O(dfsr2_IBUF)
  );
  IBUF ifsr0_IBUF_752 (
    .I(ifsr0),
    .O(ifsr0_IBUF)
  );
  IBUF ifsr1_IBUF_753 (
    .I(ifsr1),
    .O(ifsr1_IBUF)
  );
  IBUF ifsr2_IBUF_754 (
    .I(ifsr2),
    .O(ifsr2_IBUF)
  );
  IBUF key_la__IBUF_755 (
    .I(key_la_),
    .O(key_la__IBUF)
  );
  IBUF zone11_index_IBUF_756 (
    .I(zone11_index),
    .O(zone11_index_IBUF)
  );
  IBUF zone06_index_IBUF_757 (
    .I(zone06_index),
    .O(zone06_index_IBUF)
  );
  IBUF skipb_IBUF_758 (
    .I(skipb),
    .O(skipb_IBUF)
  );
  IBUF lhs__IBUF_759 (
    .I(lhs_),
    .O(lhs__IBUF)
  );
  IBUF key_cont__IBUF_760 (
    .I(key_cont_),
    .O(key_cont__IBUF)
  );
  IBUF index_markers_IBUF_761 (
    .I(index_markers),
    .O(index_markers_IBUF)
  );
  IBUF n3cycle_IBUF_762 (
    .I(n3cycle),
    .O(n3cycle_IBUF)
  );
  IBUF acclr_IBUF_763 (
    .I(acclr),
    .O(acclr_IBUF)
  );
  IBUF light_pen_IBUF_764 (
    .I(light_pen),
    .O(light_pen_IBUF)
  );
  IBUF rdr_feed_switch_IBUF_765 (
    .I(rdr_feed_switch),
    .O(rdr_feed_switch_IBUF)
  );
  IBUF eda0_IBUF_766 (
    .I(eda0),
    .O(eda0_IBUF)
  );
  IBUF eda1_IBUF_767 (
    .I(eda1),
    .O(eda1_IBUF)
  );
  IBUF brq_IBUF_768 (
    .I(brq),
    .O(brq_IBUF)
  );
  IBUF zone01_index_IBUF_769 (
    .I(zone01_index),
    .O(zone01_index_IBUF)
  );
  IBUF eda2_IBUF_770 (
    .I(eda2),
    .O(eda2_IBUF)
  );
  IBUF zone12_index_IBUF_771 (
    .I(zone12_index),
    .O(zone12_index_IBUF)
  );
  IBUF zone07_index_IBUF_772 (
    .I(zone07_index),
    .O(zone07_index_IBUF)
  );
  IBUF rx_data_IBUF_773 (
    .I(rx_data),
    .O(rx_data_IBUF)
  );
  IBUF mem00_IBUF_774 (
    .I(mem00),
    .O(mem00_IBUF)
  );
  IBUF mem01_IBUF_775 (
    .I(mem01),
    .O(mem01_IBUF)
  );
  IBUF mem02_IBUF_776 (
    .I(mem02),
    .O(mem02_IBUF)
  );
  IBUF mem03_IBUF_777 (
    .I(mem03),
    .O(mem03_IBUF)
  );
  IBUF mem04_IBUF_778 (
    .I(mem04),
    .O(mem04_IBUF)
  );
  IBUF mem10_IBUF_779 (
    .I(mem10),
    .O(mem10_IBUF)
  );
  IBUF mem05_IBUF_780 (
    .I(mem05),
    .O(mem05_IBUF)
  );
  IBUF mem11_IBUF_781 (
    .I(mem11),
    .O(mem11_IBUF)
  );
  IBUF mem06_IBUF_782 (
    .I(mem06),
    .O(mem06_IBUF)
  );
  IBUF mem07_IBUF_783 (
    .I(mem07),
    .O(mem07_IBUF)
  );
  IBUF power_ok__IBUF_784 (
    .I(power_ok_),
    .O(power_ok__IBUF)
  );
  IBUF mem08_IBUF_785 (
    .I(mem08),
    .O(mem08_IBUF)
  );
  IBUF mem09_IBUF_786 (
    .I(mem09),
    .O(mem09_IBUF)
  );
  IBUF mem_incr_IBUF_787 (
    .I(mem_incr),
    .O(mem_incr_IBUF)
  );
  IBUF zone02_index_IBUF_788 (
    .I(zone02_index),
    .O(zone02_index_IBUF)
  );
  IBUF zone08_index_IBUF_789 (
    .I(zone08_index),
    .O(zone08_index_IBUF)
  );
  IBUF sr00_IBUF_790 (
    .I(sr00),
    .O(sr00_IBUF)
  );
  IBUF sr01_IBUF_791 (
    .I(sr01),
    .O(sr01_IBUF)
  );
  IBUF sr02_IBUF_792 (
    .I(sr02),
    .O(sr02_IBUF)
  );
  IBUF sr03_IBUF_793 (
    .I(sr03),
    .O(sr03_IBUF)
  );
  IBUF sr04_IBUF_794 (
    .I(sr04),
    .O(sr04_IBUF)
  );
  IBUF sr10_IBUF_795 (
    .I(sr10),
    .O(sr10_IBUF)
  );
  IBUF sr05_IBUF_796 (
    .I(sr05),
    .O(sr05_IBUF)
  );
  IBUF key_stop__IBUF_797 (
    .I(key_stop_),
    .O(key_stop__IBUF)
  );
  IBUF sr11_IBUF_798 (
    .I(sr11),
    .O(sr11_IBUF)
  );
  IBUF sr06_IBUF_799 (
    .I(sr06),
    .O(sr06_IBUF)
  );
  IBUF sr07_IBUF_800 (
    .I(sr07),
    .O(sr07_IBUF)
  );
  IBUF b_r0__IBUF_801 (
    .I(b_r0_),
    .O(b_r0__IBUF)
  );
  IBUF sr08_IBUF_802 (
    .I(sr08),
    .O(sr08_IBUF)
  );
  IBUF sr09_IBUF_803 (
    .I(sr09),
    .O(sr09_IBUF)
  );
  IBUF d_in__IBUF_804 (
    .I(d_in_),
    .O(d_in__IBUF)
  );
  IBUF pun_feed_switch__IBUF_805 (
    .I(pun_feed_switch_),
    .O(pun_feed_switch__IBUF)
  );
  IBUF da00_IBUF_806 (
    .I(da00),
    .O(da00_IBUF)
  );
  IBUF da01_IBUF_807 (
    .I(da01),
    .O(da01_IBUF)
  );
  IBUF da02_IBUF_808 (
    .I(da02),
    .O(da02_IBUF)
  );
  IBUF da03_IBUF_809 (
    .I(da03),
    .O(da03_IBUF)
  );
  IBUF da04_IBUF_810 (
    .I(da04),
    .O(da04_IBUF)
  );
  IBUF da05_IBUF_811 (
    .I(da05),
    .O(da05_IBUF)
  );
  IBUF da10_IBUF_812 (
    .I(da10),
    .O(da10_IBUF)
  );
  IBUF da06_IBUF_813 (
    .I(da06),
    .O(da06_IBUF)
  );
  IBUF da11_IBUF_814 (
    .I(da11),
    .O(da11_IBUF)
  );
  IBUF da07_IBUF_815 (
    .I(da07),
    .O(da07_IBUF)
  );
  IBUF da08_IBUF_816 (
    .I(da08),
    .O(da08_IBUF)
  );
  IBUF da09_IBUF_817 (
    .I(da09),
    .O(da09_IBUF)
  );
  IBUF zone03_index_IBUF_818 (
    .I(zone03_index),
    .O(zone03_index_IBUF)
  );
  IBUF zone09_index_IBUF_819 (
    .I(zone09_index),
    .O(zone09_index_IBUF)
  );
  IBUF power_clear__IBUF_820 (
    .I(power_clear_),
    .O(power_clear__IBUF)
  );
  IBUF key_si__IBUF_821 (
    .I(key_si_),
    .O(key_si__IBUF)
  );
  IBUF io_pc_load_IBUF_822 (
    .I(io_pc_load),
    .O(io_pc_load_IBUF)
  );
  IBUF line_in_IBUF_823 (
    .I(line_in),
    .O(line_in_IBUF)
  );
  IBUF irq_IBUF_824 (
    .I(irq),
    .O(irq_IBUF)
  );
  IBUF ca_incr__IBUF_825 (
    .I(ca_incr_),
    .O(ca_incr__IBUF)
  );
  OBUF mem_done__OBUF_826 (
    .I(mem_done__OBUF),
    .O(mem_done_)
  );
  OBUF strobe__OBUF_827 (
    .I(strobe__OBUF),
    .O(strobe_)
  );
  OBUF jmp__OBUF_828 (
    .I(jmp__OBUF),
    .O(jmp_)
  );
  OBUF ac07__OBUF_829 (
    .I(ac07__OBUF),
    .O(ac07_)
  );
  OBUF pen_up_OBUF_830 (
    .I(pen_up_OBUF),
    .O(pen_up)
  );
  OBUF pc00__OBUF_831 (
    .I(pc00__OBUF),
    .O(pc00_)
  );
  OBUF ac08__OBUF_832 (
    .I(ac08__OBUF),
    .O(ac08_)
  );
  OBUF ba_OBUF_833 (
    .I(ba_OBUF),
    .O(ba)
  );
  OBUF and__OBUF_834 (
    .I(and__OBUF),
    .O(and_)
  );
  OBUF bb_OBUF_835 (
    .I(bb_OBUF),
    .O(bb)
  );
  OBUF pc01__OBUF_836 (
    .I(pc01__OBUF),
    .O(pc01_)
  );
  OBUF ac09__OBUF_837 (
    .I(ac09__OBUF),
    .O(ac09_)
  );
  OBUF pc02__OBUF_838 (
    .I(pc02__OBUF),
    .O(pc02_)
  );
  OBUF jms__OBUF_839 (
    .I(jms__OBUF),
    .O(jms_)
  );
  OBUF pc03__OBUF_840 (
    .I(pc03__OBUF),
    .O(pc03_)
  );
  OBUF run__OBUF (
    .I(brun__OBUF),
    .O(run_)
  );
  OBUF bbreak_OBUF_841 (
    .I(bbreak_OBUF),
    .O(bbreak)
  );
  OBUF pc04__OBUF_842 (
    .I(pc04__OBUF),
    .O(pc04_)
  );
  OBUF b_dc_inst_OBUF_843 (
    .I(b_dc_inst_OBUF),
    .O(b_dc_inst)
  );
  OBUF b_mem_start_OBUF_844 (
    .I(b_mem_start_OBUF),
    .O(b_mem_start)
  );
  OBUF pc10__OBUF_845 (
    .I(pc10__OBUF),
    .O(pc10_)
  );
  OBUF pc05__OBUF_846 (
    .I(pc05__OBUF),
    .O(pc05_)
  );
  OBUF pc11__OBUF_847 (
    .I(pc11__OBUF),
    .O(pc11_)
  );
  OBUF pc06__OBUF_848 (
    .I(pc06__OBUF),
    .O(pc06_)
  );
  OBUF pc07__OBUF_849 (
    .I(pc07__OBUF),
    .O(pc07_)
  );
  OBUF brun__OBUF_850 (
    .I(brun__OBUF),
    .O(brun_)
  );
  OBUF btt_inst__OBUF_851 (
    .I(btt_inst__OBUF),
    .O(btt_inst_)
  );
  OBUF pc08__OBUF_852 (
    .I(pc08__OBUF),
    .O(pc08_)
  );
  OBUF bmb03__OBUF_853 (
    .I(bmb03__OBUF),
    .O(bmb03_)
  );
  OBUF reader_run__OBUF_854 (
    .I(reader_run__OBUF),
    .O(reader_run_)
  );
  OBUF pc09__OBUF_855 (
    .I(pc09__OBUF),
    .O(pc09_)
  );
  OBUF bmb04__OBUF_856 (
    .I(bmb04__OBUF),
    .O(bmb04_)
  );
  OBUF bmb05__OBUF_857 (
    .I(bmb05__OBUF),
    .O(bmb05_)
  );
  OBUF execute__OBUF_858 (
    .I(execute__OBUF),
    .O(execute_)
  );
  OBUF bmb06__OBUF_859 (
    .I(bmb06__OBUF),
    .O(bmb06_)
  );
  OBUF bmb07__OBUF_860 (
    .I(bmb07__OBUF),
    .O(bmb07_)
  );
  OBUF bmb08__OBUF_861 (
    .I(bmb08__OBUF),
    .O(bmb08_)
  );
  OBUF isz__OBUF_862 (
    .I(isz__OBUF),
    .O(isz_)
  );
  OBUF df0__OBUF_863 (
    .I(df0__OBUF),
    .O(df0_)
  );
  OBUF df1__OBUF_864 (
    .I(df1__OBUF),
    .O(df1_)
  );
  OBUF drum_down_OBUF_865 (
    .I(drum_down_OBUF),
    .O(drum_down)
  );
  OBUF dca__OBUF_866 (
    .I(dca__OBUF),
    .O(dca_)
  );
  OBUF df2__OBUF_867 (
    .I(df2__OBUF),
    .O(df2_)
  );
  OBUF binitialize__OBUF (
    .I(initialize_),
    .O(binitialize_)
  );
  OBUF clear_x__OBUF_868 (
    .I(clear_x__OBUF),
    .O(clear_x_)
  );
  OBUF clear_y__OBUF_869 (
    .I(clear_y__OBUF),
    .O(clear_y_)
  );
  OBUF tad__OBUF_870 (
    .I(tad__OBUF),
    .O(tad_)
  );
  OBUF bstlr_OBUF_871 (
    .I(bstlr_OBUF),
    .O(bstlr)
  );
  OBUF ba__OBUF_872 (
    .I(ba__OBUF),
    .O(ba_)
  );
  OBUF bb__OBUF_873 (
    .I(bb__OBUF),
    .O(bb_)
  );
  OBUF defer__OBUF_874 (
    .I(defer__OBUF),
    .O(defer_)
  );
  OBUF cr_read_OBUF_875 (
    .I(cr_read_OBUF),
    .O(cr_read)
  );
  OBUF ea0_OBUF_876 (
    .I(ea0_OBUF),
    .O(ea0)
  );
  OBUF ea1_OBUF_877 (
    .I(ea1_OBUF),
    .O(ea1)
  );
  OBUF ea2_OBUF_878 (
    .I(ea2_OBUF),
    .O(ea2)
  );
  OBUF y_strobe_OBUF_879 (
    .I(y_strobe_OBUF),
    .O(y_strobe)
  );
  OBUF b_c__OBUF (
    .I(c_),
    .O(b_c_)
  );
  OBUF mb_parity_odd_OBUF (
    .I(a04c1),
    .O(mb_parity_odd)
  );
  OBUF pwr_OBUF_880 (
    .I(pwr_OBUF),
    .O(pwr)
  );
  OBUF bwc_overflow_OBUF (
    .I(wc_overflow_),
    .O(bwc_overflow)
  );
  OBUF break__OBUF (
    .I(bbreak_OBUF),
    .O(break_)
  );
  OBUF ma00__OBUF_881 (
    .I(ma00__OBUF),
    .O(ma00_)
  );
  OBUF ma01__OBUF_882 (
    .I(ma01__OBUF),
    .O(ma01_)
  );
  OBUF ma02__OBUF_883 (
    .I(ma02__OBUF),
    .O(ma02_)
  );
  OBUF pen_left_OBUF_884 (
    .I(pen_left_OBUF),
    .O(pen_left)
  );
  OBUF x_strobe_OBUF_885 (
    .I(x_strobe_OBUF),
    .O(x_strobe)
  );
  OBUF ma03__OBUF_886 (
    .I(ma03__OBUF),
    .O(ma03_)
  );
  OBUF ma04__OBUF_887 (
    .I(ma04__OBUF),
    .O(ma04_)
  );
  OBUF mcbmb00__OBUF_888 (
    .I(mcbmb00__OBUF),
    .O(mcbmb00_)
  );
  OBUF ma05__OBUF_889 (
    .I(ma05__OBUF),
    .O(ma05_)
  );
  OBUF ma10__OBUF_890 (
    .I(ma10__OBUF),
    .O(ma10_)
  );
  OBUF mcbmb01__OBUF_891 (
    .I(mcbmb01__OBUF),
    .O(mcbmb01_)
  );
  OBUF ma06__OBUF_892 (
    .I(ma06__OBUF),
    .O(ma06_)
  );
  OBUF ma11__OBUF_893 (
    .I(ma11__OBUF),
    .O(ma11_)
  );
  OBUF mcbmb02__OBUF_894 (
    .I(mcbmb02__OBUF),
    .O(mcbmb02_)
  );
  OBUF ma07__OBUF_895 (
    .I(ma07__OBUF),
    .O(ma07_)
  );
  OBUF mcbmb03__OBUF (
    .I(bmb03__OBUF),
    .O(mcbmb03_)
  );
  OBUF ma08__OBUF_896 (
    .I(ma08__OBUF),
    .O(ma08_)
  );
  OBUF mcbmb04__OBUF (
    .I(bmb04__OBUF),
    .O(mcbmb04_)
  );
  OBUF ma09__OBUF_897 (
    .I(ma09__OBUF),
    .O(ma09_)
  );
  OBUF mcbmb10__OBUF_898 (
    .I(mcbmb10__OBUF),
    .O(mcbmb10_)
  );
  OBUF mcbmb05__OBUF (
    .I(bmb05__OBUF),
    .O(mcbmb05_)
  );
  OBUF fetch__OBUF_899 (
    .I(fetch__OBUF),
    .O(fetch_)
  );
  OBUF mcbmb11__OBUF_900 (
    .I(mcbmb11__OBUF),
    .O(mcbmb11_)
  );
  OBUF mcbmb06__OBUF (
    .I(bmb06__OBUF),
    .O(mcbmb06_)
  );
  OBUF mq00__OBUF_901 (
    .I(mq00__OBUF),
    .O(mq00_)
  );
  OBUF mcbmb07__OBUF (
    .I(bmb07__OBUF),
    .O(mcbmb07_)
  );
  OBUF mq01__OBUF_902 (
    .I(mq01__OBUF),
    .O(mq01_)
  );
  OBUF bma00_OBUF (
    .I(ma00),
    .O(bma00)
  );
  OBUF mcbmb08__OBUF (
    .I(bmb08__OBUF),
    .O(mcbmb08_)
  );
  OBUF bma01_OBUF (
    .I(ma01),
    .O(bma01)
  );
  OBUF bma02_OBUF (
    .I(ma02),
    .O(bma02)
  );
  OBUF bma03_OBUF (
    .I(ma03),
    .O(bma03)
  );
  OBUF bma04_OBUF (
    .I(ma04),
    .O(bma04)
  );
  OBUF mq02__OBUF_903 (
    .I(mq02__OBUF),
    .O(mq02_)
  );
  OBUF bma05_OBUF (
    .I(ma05),
    .O(bma05)
  );
  OBUF bma10_OBUF (
    .I(ma10),
    .O(bma10)
  );
  OBUF mcbmb09__OBUF_904 (
    .I(mcbmb09__OBUF),
    .O(mcbmb09_)
  );
  OBUF bma06_OBUF (
    .I(ma06),
    .O(bma06)
  );
  OBUF bma11_OBUF (
    .I(ma11),
    .O(bma11)
  );
  OBUF bma07_OBUF (
    .I(ma07),
    .O(bma07)
  );
  OBUF bma08_OBUF (
    .I(ma08),
    .O(bma08)
  );
  OBUF bma09_OBUF (
    .I(ma09),
    .O(bma09)
  );
  OBUF mq03__OBUF_905 (
    .I(mq03__OBUF),
    .O(mq03_)
  );
  OBUF mq04__OBUF_906 (
    .I(mq04__OBUF),
    .O(mq04_)
  );
  OBUF mq10__OBUF_907 (
    .I(mq10__OBUF),
    .O(mq10_)
  );
  OBUF mq05__OBUF_908 (
    .I(mq05__OBUF),
    .O(mq05_)
  );
  OBUF btp2_OBUF (
    .I(mb_load),
    .O(btp2)
  );
  OBUF mq11__OBUF_909 (
    .I(mq11__OBUF),
    .O(mq11_)
  );
  OBUF mq06__OBUF_910 (
    .I(mq06__OBUF),
    .O(mq06_)
  );
  OBUF btp3_OBUF_911 (
    .I(btp3_OBUF),
    .O(btp3)
  );
  OBUF bmb00_OBUF (
    .I(mb00),
    .O(bmb00)
  );
  OBUF b_mem_to_lsr_OBUF_912 (
    .I(b_mem_to_lsr_OBUF),
    .O(b_mem_to_lsr)
  );
  OBUF bmb01_OBUF (
    .I(mb01),
    .O(bmb01)
  );
  OBUF bmb02_OBUF (
    .I(mb02),
    .O(bmb02)
  );
  OBUF bmb03_OBUF (
    .I(mb03),
    .O(bmb03)
  );
  OBUF bmb04_OBUF (
    .I(mb04),
    .O(bmb04)
  );
  OBUF mq07__OBUF_913 (
    .I(mq07__OBUF),
    .O(mq07_)
  );
  OBUF bmb05_OBUF (
    .I(mb05),
    .O(bmb05)
  );
  OBUF bmb10_OBUF (
    .I(mb10),
    .O(bmb10)
  );
  OBUF bmb06_OBUF (
    .I(mb06),
    .O(bmb06)
  );
  OBUF bmb11_OBUF (
    .I(mb11),
    .O(bmb11)
  );
  OBUF bmb07_OBUF (
    .I(mb07),
    .O(bmb07)
  );
  OBUF link__OBUF_914 (
    .I(link__OBUF),
    .O(link_)
  );
  OBUF bmb08_OBUF (
    .I(mb08),
    .O(bmb08)
  );
  OBUF bmb09_OBUF (
    .I(mb09),
    .O(bmb09)
  );
  OBUF mq08__OBUF_915 (
    .I(mq08__OBUF),
    .O(mq08_)
  );
  OBUF bts1_OBUF_916 (
    .I(bts1_OBUF),
    .O(bts1)
  );
  OBUF mq09__OBUF_917 (
    .I(mq09__OBUF),
    .O(mq09_)
  );
  OBUF bts3_OBUF_918 (
    .I(bts3_OBUF),
    .O(bts3)
  );
  OBUF drum_up_OBUF_919 (
    .I(drum_up_OBUF),
    .O(drum_up)
  );
  OBUF if0__OBUF_920 (
    .I(if0__OBUF),
    .O(if0_)
  );
  OBUF opr__OBUF_921 (
    .I(opr__OBUF),
    .O(opr_)
  );
  OBUF if1__OBUF_922 (
    .I(if1__OBUF),
    .O(if1_)
  );
  OBUF sc0__OBUF_923 (
    .I(sc0__OBUF),
    .O(sc0_)
  );
  OBUF if2__OBUF_924 (
    .I(if2__OBUF),
    .O(if2_)
  );
  OBUF sc1__OBUF_925 (
    .I(sc1__OBUF),
    .O(sc1_)
  );
  OBUF pen_down_OBUF_926 (
    .I(pen_down_OBUF),
    .O(pen_down)
  );
  OBUF current_address__OBUF_927 (
    .I(current_address__OBUF),
    .O(current_address_)
  );
  OBUF iot__OBUF_928 (
    .I(iot__OBUF),
    .O(iot_)
  );
  OBUF sc2__OBUF_929 (
    .I(sc2__OBUF),
    .O(sc2_)
  );
  OBUF feed_hole_OBUF_930 (
    .I(feed_hole_OBUF),
    .O(feed_hole)
  );
  OBUF mb00__OBUF (
    .I(mcbmb00__OBUF),
    .O(mb00_)
  );
  OBUF sc3__OBUF_931 (
    .I(sc3__OBUF),
    .O(sc3_)
  );
  OBUF mb01__OBUF (
    .I(mcbmb01__OBUF),
    .O(mb01_)
  );
  OBUF tx_data_OBUF_932 (
    .I(tx_data_OBUF),
    .O(tx_data)
  );
  OBUF pause__OBUF_933 (
    .I(pause__OBUF),
    .O(pause_)
  );
  OBUF sc4__OBUF_934 (
    .I(sc4__OBUF),
    .O(sc4_)
  );
  OBUF mb02__OBUF (
    .I(mcbmb02__OBUF),
    .O(mb02_)
  );
  OBUF biop1__OBUF_935 (
    .I(biop1__OBUF),
    .O(biop1_)
  );
  OBUF b_line_hold__OBUF_936 (
    .I(b_line_hold__OBUF),
    .O(b_line_hold_)
  );
  OBUF mb03__OBUF (
    .I(bmb03__OBUF),
    .O(mb03_)
  );
  OBUF biop2__OBUF_937 (
    .I(biop2__OBUF),
    .O(biop2_)
  );
  OBUF word_count__OBUF_938 (
    .I(word_count__OBUF),
    .O(word_count_)
  );
  OBUF ac00__OBUF_939 (
    .I(ac00__OBUF),
    .O(ac00_)
  );
  OBUF mb04__OBUF (
    .I(bmb04__OBUF),
    .O(mb04_)
  );
  OBUF ac01__OBUF_940 (
    .I(ac01__OBUF),
    .O(ac01_)
  );
  OBUF mb10__OBUF (
    .I(mcbmb10__OBUF),
    .O(mb10_)
  );
  OBUF mb05__OBUF (
    .I(bmb05__OBUF),
    .O(mb05_)
  );
  OBUF biop4__OBUF_941 (
    .I(biop4__OBUF),
    .O(biop4_)
  );
  OBUF ac02__OBUF_942 (
    .I(ac02__OBUF),
    .O(ac02_)
  );
  OBUF mb11__OBUF (
    .I(mcbmb11__OBUF),
    .O(mb11_)
  );
  OBUF mb06__OBUF (
    .I(bmb06__OBUF),
    .O(mb06_)
  );
  OBUF ac03__OBUF_943 (
    .I(ac03__OBUF),
    .O(ac03_)
  );
  OBUF pen_right_OBUF_944 (
    .I(pen_right_OBUF),
    .O(pen_right)
  );
  OBUF int_enable__OBUF_945 (
    .I(int_enable__1),
    .O(int_enable_)
  );
  OBUF mb07__OBUF (
    .I(bmb07__OBUF),
    .O(mb07_)
  );
  OBUF ac04__OBUF_946 (
    .I(ac04__OBUF),
    .O(ac04_)
  );
  OBUF hole1_OBUF_947 (
    .I(hole1_OBUF),
    .O(hole1)
  );
  OBUF hole2_OBUF_948 (
    .I(hole2_OBUF),
    .O(hole2)
  );
  OBUF hole3_OBUF_949 (
    .I(hole3_OBUF),
    .O(hole3)
  );
  OBUF mb08__OBUF (
    .I(bmb08__OBUF),
    .O(mb08_)
  );
  OBUF hole4_OBUF_950 (
    .I(hole4_OBUF),
    .O(hole4)
  );
  OBUF ac05__OBUF_951 (
    .I(ac05__OBUF),
    .O(ac05_)
  );
  OBUF ac10__OBUF_952 (
    .I(ac10__OBUF),
    .O(ac10_)
  );
  OBUF hole5_OBUF_953 (
    .I(hole5_OBUF),
    .O(hole5)
  );
  OBUF bac00_OBUF (
    .I(ac00),
    .O(bac00)
  );
  OBUF hole6_OBUF_954 (
    .I(hole6_OBUF),
    .O(hole6)
  );
  OBUF bac01_OBUF (
    .I(ac01),
    .O(bac01)
  );
  OBUF hole7_OBUF_955 (
    .I(hole7_OBUF),
    .O(hole7)
  );
  FD mb06_1_956 (
    .D(regbus06),
    .C(mb_load),
    .Q(mb06_1)
  );
  FD mb04_1_957 (
    .D(regbus04),
    .C(mb_load),
    .Q(mb04_1)
  );
  FD mb05_1_958 (
    .D(regbus05),
    .C(mb_load),
    .Q(mb05_1)
  );
  FD mb03_1_959 (
    .D(regbus03),
    .C(mb_load),
    .Q(mb03_1)
  );
  FD mb07_1_960 (
    .D(regbus07),
    .C(mb_load),
    .Q(mb07_1)
  );
  FD mb08_1_961 (
    .D(regbus08),
    .C(mb_load),
    .Q(mb08_1)
  );
  FD mb09_1_962 (
    .D(regbus09),
    .C(mb_load),
    .Q(mb09_1)
  );
  defparam _n0061_G.INIT = 16'hF8FF;
  LUT4_L _n0061_G (
    .I0(mb11),
    .I1(b_r0__IBUF),
    .I2(c_),
    .I3(ts3),
    .LO(N4210)
  );
  INV bmb05_1_1_INV_0 (
    .I(mb05_1),
    .O(bmb05_1)
  );
  INV bmb04_1_1_INV_0 (
    .I(mb04_1),
    .O(bmb04_1)
  );
  INV bmb06_1_1_INV_0 (
    .I(mb06_1),
    .O(bmb06_1)
  );
  FD mb06_2_963 (
    .D(regbus06),
    .C(mb_load),
    .Q(mb06_2)
  );
  FD mb04_2_964 (
    .D(regbus04),
    .C(mb_load),
    .Q(mb04_2)
  );
  FD mb03_2_965 (
    .D(regbus03),
    .C(mb_load),
    .Q(mb03_2)
  );
  FD mb07_2_966 (
    .D(regbus07),
    .C(mb_load),
    .Q(mb07_2)
  );
  FD mb08_2_967 (
    .D(regbus08),
    .C(mb_load),
    .Q(mb08_2)
  );
  FD mb09_2_968 (
    .D(regbus09),
    .C(mb_load),
    .Q(mb09_2)
  );
  FD mb11_1_969 (
    .D(regbus11),
    .C(mb_load),
    .Q(mb11_1)
  );
  defparam _n071051_G.INIT = 16'hF1F3;
  LUT4_L _n071051_G (
    .I0(mb11),
    .I1(N3940),
    .I2(N286),
    .I3(mb07_2),
    .LO(N4212)
  );
  BUFG initialize__BUFG (
    .I(initialize_1),
    .O(initialize_)
  );
  BUFG manual_preset__BUFG (
    .I(manual_preset_1),
    .O(manual_preset_)
  );
  MUXF5 _n082660 (
    .I0(N4195),
    .I1(N4196),
    .S(mb07),
    .O(CHOICE3359)
  );
  defparam _n082660_F.INIT = 16'hFF7F;
  LUT4_L _n082660_F (
    .I0(df2),
    .I1(N449),
    .I2(mb08),
    .I3(N3854),
    .LO(N4195)
  );
  MUXF5 Ker363_SW0_SW01 (
    .I0(N4197),
    .I1(N4198),
    .S(restart),
    .O(N4024)
  );
  defparam Ker363_SW0_SW01_F.INIT = 16'hF888;
  LUT4 Ker363_SW0_SW01_F (
    .I0(mfts1),
    .I1(N90),
    .I2(io_on),
    .I3(_n0707),
    .O(N4197)
  );
  MUXF5 _n0834461 (
    .I0(N4199),
    .I1(N4200),
    .S(io_bus_in04_),
    .O(CHOICE3044)
  );
  defparam _n0834461_F.INIT = 16'h0103;
  LUT4_L _n0834461_F (
    .I0(sr04_IBUF),
    .I1(io_enable),
    .I2(N4103),
    .I3(sr_enable),
    .LO(N4199)
  );
  MUXF5 _n083160 (
    .I0(N4201),
    .I1(N4202),
    .S(mb08),
    .O(CHOICE3248)
  );
  defparam _n083160_F.INIT = 16'h7FFF;
  LUT4_L _n083160_F (
    .I0(if1),
    .I1(N449),
    .I2(mb07),
    .I3(N3856),
    .LO(N4201)
  );
  MUXF5 n__664_970 (
    .I0(N4203),
    .I1(N4204),
    .S(eae_on),
    .O(n__664)
  );
  defparam n__664_F.INIT = 16'h4000;
  LUT4 n__664_F (
    .I0(mb08),
    .I1(N417),
    .I2(b_execute),
    .I3(N636),
    .O(N4203)
  );
  MUXF5 tt_inst_1_SW51 (
    .I0(N4205),
    .I1(N4206),
    .S(N1127),
    .O(N3913)
  );
  defparam tt_inst_1_SW51_F.INIT = 16'h222E;
  LUT4_L tt_inst_1_SW51_F (
    .I0(N1126),
    .I1(mb10),
    .I2(mb04_2),
    .I3(uf),
    .LO(N4205)
  );
  MUXF5 tt_inst_1_SW21 (
    .I0(N4207),
    .I1(N4208),
    .S(mb04_3),
    .O(N3908)
  );
  defparam tt_inst_1_SW21_F.INIT = 16'hFBEA;
  LUT4 tt_inst_1_SW21_F (
    .I0(_n0683),
    .I1(uf),
    .I2(N3872),
    .I3(N3871),
    .O(N4207)
  );
  MUXF5 _n0061_971 (
    .I0(N4209),
    .I1(N4210),
    .S(s_),
    .O(_n0061)
  );
  defparam _n0061_F.INIT = 16'h20FF;
  LUT4_L _n0061_F (
    .I0(mb10),
    .I1(mb11),
    .I2(c_),
    .I3(ts3),
    .LO(N4209)
  );
  MUXF5 _n071051 (
    .I0(N4211),
    .I1(N4212),
    .S(mb03_2),
    .O(CHOICE3727)
  );
  defparam _n071051_F.INIT = 16'hFF48;
  LUT4_L _n071051_F (
    .I0(mb06_3),
    .I1(N3902),
    .I2(mb04_3),
    .I3(N286),
    .LO(N4211)
  );
  FDP int_enable__1_972 (
    .D(mcbmb11__OBUF),
    .PRE(int_enable__N0),
    .C(n__123),
    .Q(int_enable__1)
  );
endmodule

