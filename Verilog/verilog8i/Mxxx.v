module g020;
    // ${M}: G020 Core Sense Amplifier
    // not implemented (core memory)
endmodule

module g021;
    // ${M}: G021 Core Sense Amplifier
    // not implemented (core memory)
endmodule

module g221;
    // ${M}: G221 Memory Selector
    // not implemented (core memory)
endmodule

module g228;
    // ${M}: G228 Inhibit Driver
    // not implemented (core memory)
endmodule

module g610a;
    // ${M}: G610A Diode Board
    // not implemented (core memory)
endmodule

module g610b;
    // ${M}: G610B Diode Board
    // not implemented (core memory)
endmodule

module g611a;
    // ${M}: G611A Diode Board
    // not implemented (core memory)
endmodule

module g611b;
    // ${M}: G611B Diode Board
    // not implemented (core memory)
endmodule

module g624;
    // ${M}: G624 Resistor Board
    // not implemented (core memory)
endmodule

module g785a;
    // ${M}: G785 Power Connector and Regulator
    // The G785 doesn't generate anything here.  It's all power connections.
endmodule

module g785b;
    // ${M}: G785 Power Connector and Regulator
    // The G785 doesn't generate anything here.  It's all power connections.
endmodule

module g821;
    // ${M}: G821 5V Regulator Control
    // The G821 doesn't generate anything here.  It's all power connections.
endmodule

module g826a;
    // ${M}: G826 Regulator and Power Detector
    // Just claim that power is OK.
    // BUGBUG: Should really assert s2 at power up.
    assign f2 = 1'b1;
    assign h2 = 1'b1;
    assign j2 = 1'b1;
    assign s2 = 1'b1;
endmodule

module g826b;
    // ${M}: G826 Regulator and Power Detector
    // Nothing here yet for the B side.
endmodule

module g879;
    // ${M}: G879 Transport Detector
    // input t2;
    // output u2;
    // The implementation is null, since this is basically 
    // an analog component.
endmodule

module g888;
    // ${M}: G888 Manchester Reader/Writer
    // BUGBUG: d2, e2, j2, k2, l2, m2, n2, p2, r2, u2, v2 are outputs!
    // The implementation is null, since this is basically 
    // an analog component.
endmodule

module g921a;
    // ${M}: G921 8/L Front Panel Connector
    // BUGBUG: a1, b1, c1, d1, e1, f1, h1, j1, k1 are I/O.
    // BUGBUG: l1, m1, n1, p1, r1, s1, t1, u1, v1 are I/O.
    // BUGBUG: a2, b2, c2, d2, e2, f2, h2, j2, k2 are I/O.
    // BUGBUG: l2, m2, n2, p2, r2, s2, t2, u2, v2 are I/O.
endmodule

module g921b;
    // ${M}: G921 8/L Front Panel Connector
    // BUGBUG: a1, b1, c1, d1, e1, f1, h1, j1, k1 are I/O.
    // BUGBUG: l1, m1, n1, p1, r1, s1, t1, u1, v1 are I/O.
    // BUGBUG: a2, b2, c2, d2, e2, f2, h2, j2, k2 are I/O.
    // BUGBUG: l2, m2, n2, p2, r2, s2, t2, u2, v2 are I/O.
endmodule

module g921c;
    // ${M}: G921 8/L Front Panel Connector
    // BUGBUG: a1, b1, c1, d1, e1, f1, h1, j1, k1 are I/O.
    // BUGBUG: l1, m1, n1, p1, r1, s1, t1, u1, v1 are I/O.
    // BUGBUG: a2, b2, c2, d2, e2, f2, h2, j2, k2 are I/O.
    // BUGBUG: l2, m2, n2, p2, r2, s2, t2, u2, v2 are I/O.
endmodule

module g921d;
    // ${M}: G921 8/L Front Panel Connector
    // BUGBUG: a1, b1, c1, d1, e1, f1, h1, j1, k1 are I/O.
    // BUGBUG: l1, m1, n1, p1, r1, s1, t1, u1, v1 are I/O.
    // BUGBUG: a2, b2, c2, d2, e2, f2, h2, j2, k2 are I/O.
    // BUGBUG: l2, m2, n2, p2, r2, s2, t2, u2, v2 are I/O.
endmodule

module m002;
    // ${M}: M002 Bus Data Interface (Posibus)
    PULLUP ${M}d2p(d2);
    PULLUP ${M}e2p(e2);
    PULLUP ${M}f2p(f2);
    PULLUP ${M}h2p(h2);
    PULLUP ${M}j2p(j2);
    PULLUP ${M}k2p(k2);
    PULLUP ${M}l2p(l2);
    PULLUP ${M}m2p(m2);
    PULLUP ${M}n2p(n2);
    PULLUP ${M}p2p(p2);
    PULLUP ${M}r2p(r2);
    PULLUP ${M}s2p(s2);
    PULLUP ${M}t2p(t2);
    PULLUP ${M}u2p(u2);
    PULLUP ${M}v2p(v2);
endmodule

module m101;
    // ${M}: M101 Bus Data Interface (Posibus)
    assign b1 = a1 & c1;
    assign e1 = d1 & c1;
    assign h1 = f1 & c1;
    assign k1 = j1 & c1;
    assign m1 = l1 & c1;
    assign p1 = n1 & c1;
    assign s1 = r1 & c1;
    assign u1 = v1 & c1;
    assign f2 = e2 & c1;
    assign j2 = h2 & c1;
    assign l2 = k2 & c1;
    assign n2 = m2 & c1;
    assign r2 = p2 & c1;
    assign t2 = s2 & c1;
    assign v2 = u2 & c1;
endmodule

module m103;
    // ${M}: M103 Device Selector (Posibus)
    assign ${M}tv2 = (d2 & e2 & f2 & h2 & j2 & k2 & l2 & n2) | ~u2;
    assign v2 = ${M}tv2;
    assign ${M}ta1 = ${M}tv2 & p2;
    assign a1 = ${M}ta1;
    assign ${M}tc1 = ${M}tv2 & r2;
    assign c1 = ${M}tc1;
    assign ${M}te1 = ${M}tv2 & s2;
    assign e1 = ${M}te1;
    assign b1 = ~${M}ta1;
    assign d1 = ~${M}tc1;
    assign f1 = ~${M}te1;
    assign k1 = ~(h1 & j1);
    assign n1 = ~(l1 & m1);
endmodule


module m111;
    // ${M}: M111 Inverters
    assign b1 = ~a1;
    assign d2 = ~c1;
    assign e1 = ~d1;
    assign h1 = ~f1;
    assign f2 = ~e2;
    assign k1 = ~j1;
    assign j2 = ~h2;
    assign m1 = ~l1;
    assign l2 = ~k2;
    assign p1 = ~n1;
    assign n2 = ~m2;
    assign s1 = ~r1;
    assign r2 = ~p2;
    assign u1 = ~v1;
    assign t2 = ~s2;
    assign v2 = ~u2;
endmodule

module m113;
    // ${M}: M113 2 Input NAND Gates
    assign c1 = ~(a1 & b1);
    assign f1 = ~(d1 & e1);
    assign k1 = ~(h1 & j1);
    assign n1 = ~(l1 & m1);
    assign s1 = ~(p1 & r1);
    assign u1 = 1'b1;
    assign v1 = 1'b1;
    assign f2 = ~(d2 & e2);
    assign k2 = ~(h2 & j2);
    assign n2 = ~(l2 & m2);
    assign s2 = ~(p2 & r2);
    assign v2 = ~(t2 & u2);
endmodule

module m115;
    // ${M}: M115 3 Input NAND Gates
    assign d1 = ~(a1 & b1 & c1);
    assign j1 = ~(e1 & f1 & h1);
    assign n1 = ~(k1 & l1 & m1);
    assign u1 = ~(p1 & r1 & s1);
    assign h2 = ~(d2 & e2 & f2);
    assign m2 = ~(j2 & k2 & l2);
    assign s2 = ~(n2 & p2 & r2);
    assign v1 = ~(t2 & u2 & v2);
endmodule

module m117;
    // ${M}: M117 4 Input NAND Gates
    assign e1 = ~(a1 & b1 & c1 & d1);
    assign l1 = ~(f1 & h1 & j1 & k1);
    assign s1 = ~(m1 & n1 & p1 & r1);
    assign j2 = ~(d2 & e2 & f2 & h2);
    assign p2 = ~(k2 & l2 & m2 & n2);
    assign v2 = ~(r2 & s2 & t2 & u2);
    assign u1 = 1'b1;
    assign v1 = 1'b1;
endmodule


module m119;
    // ${M}: M119 8 Input NAND Gates
    assign j2 = ~(a1 & b1 & c1 & d1 & d2 & e2 & f2 & h2);
    assign p2 = ~(f1 & h1 & j1 & k1 & k2 & l2 & m2 & n2);
    assign v2 = ~(m1 & n1 & p1 & r1 & r2 & s2 & t2 & u2);
    assign u1 = 1'b1;
    assign v1 = 1'b1;
endmodule


module m121
    // ${M}: M121 8 AND-NOR Gates
    assign j2 = ~((d2 & e2) | (f2 & H2));
    assign e1 = ~((a1 & b1) | (c1 & d1));
    assign p2 = ~((k2 & l2) | (m2 & n2));
    assign s1 = ~((m1 & n1) | (p1 & r1));
    assign l1 = ~((f1 & h1) | (j1 & k1));
    assign v2 = ~((r2 & s2) | (t2 & u2));
    assign u1 = 1'b1;
    assign v1 = 1'b1;
endmodule

module m160;
    // ${M}: M160 AND-NOR Gates
    assign r1 = ~((a1 & b1 & c1 & d1)
               | (e1 & f1)
               | (h1 & j1)
               | (k1 & l1)
               | (m1 & n1 & p1));
    assign t2 = ~((d2 & e2 & f2 & h2)
               | (j2 & k2)
               | (l2 & m2)
               | (n2 & p2 & r2 & s2));
    assign v2 = ~((s1 & u1) | (v1 & u2));
endmodule

module m161;
    // ${M}: M161 8 Binary to Octal/Decimal Decoder
    assign d2 = s2 & s1 & t2 & (~(u1) & ~(v2) & ~(u2) & ~(v1));
    assign e2 = s2 & s1 & t2 & (~(u1) & ~(v2) & ~(u2) &   v1 );
    assign j2 = s2 & s1 & t2 & (~(u1) & ~(v2) &   u2  & ~(v1));
    assign n2 = s2 & s1 & t2 & (~(u1) & ~(v2) &   u2  &   v1 );
    assign f2 = s2 & s1 & t2 & (~(u1) &   v2  & ~(u2) & ~(v1));
    assign m2 = s2 & s1 & t2 & (~(u1) &   v2  & ~(u2) &   v1 );
    assign h2 = s2 & s1 & t2 & (~(u1) &   v2  &   u2  & ~(v1));
    assign l2 = s2 & s1 & t2 & (~(u1) &   v2  &   u2  &   v1 );
    assign p2 = s2 & s1 & t2 & (  u1  & ~(v2) & ~(u2) & ~(v1));
    assign r2 = s2 & s1 & t2 & (  u1  & ~(v2) & ~(u2) &   v1 );
    assign d1 = ~d2;
    assign e1 = ~e2;
    assign j1 = ~j2;
    assign n1 = ~n2;
    assign f1 = ~f2;
    assign m1 = ~m2;
    assign h1 = ~h2;
    assign l1 = ~l2;
    assign p1 = ~p2;
    assign r1 = ~r2;
endmodule


module m162;
    // ${M}: M162 Parity Circuit
    assign k1 =  (a1 ^ b1 ^ c1 ^ d1 ^ e1 ^ f1 ^ h1 ^ j1);
    assign l1 = ~(a1 ^ b1 ^ c1 ^ d1 ^ e1 ^ f1 ^ h1 ^ j1);
    assign u2 =  (k2 ^ l2 ^ m2 ^ n2 ^ p2 ^ r2 ^ s2 ^ t2);
    assign v2 = ~(k2 ^ l2 ^ m2 ^ n2 ^ p2 ^ r2 ^ s2 ^ t2);
endmodule

// TODO: Worry about the difference between the M206 & the M216.
module m206;
    // ${M}: M206 D Type Flip Flops
    FDCPE ${M}a(.D(c1), .C(b1), .CLR(~a1), .PRE(~d1), .Q(${M}e1));
    assign e1 = ~${M}e1;
    assign f1 = ~${M}e1;
    FDCPE ${M}b(.D(e2), .C(d2), .CLR(~a1), .PRE(~f2), .Q(${M}h2));
    assign h2 = ~${M}h2;
    assign j2 = ~${M}h2;
    FDCPE ${M}c(.D(j1), .C(h1), .CLR(~a1), .PRE(~k1), .Q(${M}l1));
    assign l1 = ~${M}l1;
    assign m1 = ~${M}l1;
    FDCPE ${M}d(.D(m2), .C(l2), .CLR(~k2), .PRE(~n2), .Q(${M}p2));
    assign p2 = ~${M}p2;
    assign r2 = ~${M}p2;
    FDCPE ${M}e(.D(p1), .C(n1), .CLR(~k2), .PRE(~r1), .Q(${M}s1));
    assign s1 = ~${M}s1;
    assign u1 = ~${M}s1;
    FDCPE ${M}f(.D(t2), .C(s2), .CLR(~k2), .PRE(~u2), .Q(${M}v2));
    assign v2 = ~${M}v2;
    assign v1 = ~${M}v2;
endmodule

module m207;
    // ${M}: M207 JK Type Flip Flops
    FDCE ${M}a(.D((d1 ^ c1)? d1: (c1 ^ e1)), .C(b1), .CLR(~a1), .Q(e1));
    assign f1 = ~e1;
    FDCE ${M}a(.D((f2 ^ e2)? f2: (e2 ^ h2)), .C(d2), .CLR(~a1), .Q(h2));
    assign j2 = ~h2;
    FDCE ${M}a(.D((k1 ^ j1)? k1: (j1 ^ l1)), .C(h1), .CLR(~a1), .Q(l1));
    assign m1 = ~l1;
    FDCE ${M}a(.D((n2 ^ m2)? n2: (m2 ^ p2)), .C(l2), .CLR(~k2), .Q(p2));
    assign r2 = ~p2;
    FDCE ${M}a(.D((r1 ^ p1)? r1: (p1 ^ s1)), .C(n1), .CLR(~k2), .Q(s1));
    assign u1 = ~s1;
    FDCE ${M}a(.D((u2 ^ t2)? u2: (t2 ^ v2)), .C(s2), .CLR(~k2), .Q(v2));
    assign v1 = ~v2;
endmodule

// TODO: Worry about the difference between the M206 & the M216.
module m216;
    // ${M}: M216 D Type Flip Flops
    FDCPE ${M}a(.D(c1), .C(b1), .CLR(~a1), .PRE(~d1), .Q(${M}e1));
    assign e1 = ~${M}e1;
    assign f1 = ~${M}e1;
    FDCPE ${M}b(.D(e2), .C(d2), .CLR(~a1), .PRE(~f2), .Q(${M}h2));
    assign h2 = ~${M}h2;
    assign j2 = ~${M}h2;
    FDCPE ${M}c(.D(j1), .C(h1), .CLR(~a1), .PRE(~k1), .Q(${M}l1));
    assign l1 = ~${M}l1;
    assign m1 = ~${M}l1;
    FDCPE ${M}d(.D(m2), .C(l2), .CLR(~k2), .PRE(~n2), .Q(${M}p2));
    assign p2 = ~${M}p2;
    assign r2 = ~${M}p2;
    FDCPE ${M}e(.D(p1), .C(n1), .CLR(~k2), .PRE(~r1), .Q(${M}s1));
    assign s1 = ~${M}s1;
    assign u1 = ~${M}s1;
    FDCPE ${M}f(.D(t2), .C(s2), .CLR(~k2), .PRE(~u2), .Q(${M}v2));
    assign v2 = ~${M}v2;
    assign v1 = ~${M}v2;
endmodule

module m220;
    // ${M}: M220 Major Registers
    // A lot of stuff comes together here!
    // Select the adder inputs.
    assign ${M}l0 =  ~((bh1 & bf1)
               | (bh2 & ba1)
               | (bj2 & bb1)
               | (bm2 & bl1)
               | (be1 & bc1)
               | (bd1 & bf2)
               | (bl2 & bk1));
    assign ${M}r0 = ~((br1 & bu2)
               | (am2 & bp1)
               | (ap1 & bs2)
               | (bt2 & bs1));
    assign ${M}l1 =  ~((bn2 & bf1)
               | (bh2 & av1)
               | (1'b1 & be2)
               | (bj2 & av2)
               | (bp2 & bl1)
               | (bd2 & bc1)
               | (bn1 & bf2)
               | (bl2 & bm1));
    assign ${M}r1 = ~((bv2 & bv1)
               | (al2 & br2)
               | (an1 & bs2)
               | (bt2 & bu1));
    // Sum the adder inputs.
    assign af1 = ${M}l1 + ${M}r1 + bj1;
    assign ${M}co1 = (${M}l1 & ${M}r1) | (${M}l1 & bj1) | (${M}r1 & bj1);
    assign ae2 = ${M}l0 + ${M}r0 + ${M}co1;
    assign bk2 = (${M}l0 & ${M}r0) | (${M}r0 & ${M}co1) | (${M}r0 & ${M}co1);
    // Select the adder outputs | other ALU values.
    assign tts = ~ab2;
    assign ${M}aj1 = ~((av2 & aa1)
               | (ad1 & ab1)
               | (ae2 & ae1)
               | (ad2 & ac1)
               | (af2 & af1)
               | (ah2 & ah1)
               | (bb2 & tts));
    assign ${M}ak2 = ~((as1 & aa1)
               | (ad1 & ac1)
               | (ae1 & af1)
               | (ah2 & af2)
               | (ad2 & ae2)
               | (aj2 & ah1)
               | (af1 & tts));
    assign aj1 = ${M}aj1;
    assign ak2 = ${M}ak2;
    // Now latch the ALU result in the appropriate register.
    // ma2: latch74 port map(${M}aj1, ak1, 1'b1, 1'b1, am2, am1);
    FDCPE ${M}ma0(.D(${M}aj1), .C(ak1), .Q(am2));
    assign am1 = ~am2;
    // pc2: latch74 port map(${M}aj1, an2, 1'b1, 1'b1, ap1, ar2);
    FDCPE ${M}pc0(.D(${M}aj1), .C(an2), .Q(ap1));
    assign ar2 = ~ap1;
    // mb2: latch74 port map(${M}aj1, ar1, 1'b1, 1'b1, au2, at2);
    FDCPE ${M}mb0(.D(${M}aj1), .C(ar1), .Q(at2));
    assign au2 = ~at2;
    // ac2: latch74 port map(${M}aj1, av1, 1'b1, 1'b1, ba1, bb1);
    FDCPE ${M}ac0(.D(${M}aj1), .C(av1), .Q(ba1));
    assign bb1 = ~ba1;
    // ma3: latch74 port map(${M}ak2, ak1, 1'b1, 1'b1, al2, al1);
    FDCPE ${M}ma1(.D(${M}ak2), .C(ak1), .Q(al2));
    assign al1 = ~al2;
    // pc3: latch74 port map(${M}ak2, an2, 1'b1, 1'b1, an1, ap2);
    FDCPE ${M}pc1(.D(${M}ak2), .C(an2), .Q(an1));
    assign ap2 = ~an1;
    // mb3: latch74 port map(${M}ak2, ar1, 1'b1, 1'b1, as2, as1);
    FDCPE ${M}mb1(.D(${M}ak2), .C(ar1), .Q(as2));
    assign as1 = ~as2;
    // ac3: latch74 port map(${M}ak2, av1, 1'b1, 1'b1, av1, av2);
    FDCPE ${M}ac1(.D(${M}ak2), .C(av1), .Q(av1));
    assign av2 = ~av1;
endmodule

//// A lot of stuff comes together here!
//// M228 Mark Track Decoder
//module m228;
//// generic(tpd : time := 45 ns);
//   // Declare ports here.
//   port(
//      aa1 : in  bit;
//      ab1 : in  bit;
//      ac1 : in  bit;
//      ad1 : in  bit;
//      ae1 : out bit;
//      af1 : out bit;
//      ah1 : out bit;
//      aj1 : out bit;
//      ak1 : out bit;
//      al1 : out bit;
//      am1 : out bit;
//      an1 : in  bit;
//      ap1 : in  bit;
//      ar1 : in  bit;
//      as1 : out bit;
////    at1 : in  bit;   -- GND
//      au1 : out bit;
//      av1 : out bit;
////    aa2 : in  bit;  -- VCC
////    ab2 : in  bit;  -- Unused
////    ac2 : out bit;  -- GND
//      ad2 : out bit;
//      ae2 : out bit;
//      af2 : out bit;
//      ah2 : out bit;
//      aj2 : out bit;
//      ak2 : out bit;
//      al2 : in  bit;
//      am2 : out bit;
//      an2 : out bit;
//      ap2 : in  bit;
//      ar2 : out bit;
//      as2 : in  bit;
//      at2 : out bit;
//      au2 : out bit;
//      av2 : in  bit;
//      ba1 : in  bit;
//      bb1 : in  bit;
//      bc1 : in  bit;
//      bd1 : in  bit;
//      be1 : out bit;
//      bf1 : in  bit;
//      bh1 : in  bit;
//      bj1 : in  bit;
//      bk1 : in  bit;
//      bl1 : out bit;
//      bm1 : out bit;
//      bn1 : in  bit;
//      bp1 : in  bit;
//      br1 : out bit;
//      bs1 : out bit;
////    bt1 : in  bit;   -- GND
//      bu1 : out bit;
//      bv1 : out bit;
////    ba2 : in  bit;  -- VCC
////    bb2 : in  bit;  -- Unused
////    bc2 : out bit;  -- GND
//      bd2 : in  bit;
//      be2 : out bit;
//      bf2 : out bit;
//      bh2 : in  bit;
//      bj2 : out bit;
//      bk2 : out bit;
//      bl2 : out bit;
//      bm2 : out bit;
//      bn2 : out bit;
//      bp2 : out bit;
//      br2 : in  bit;
//      bs2 : out bit;
//      bt2 : out bit;
//      bu2 : out bit;
//      bv2 : out bit
//   );
//end m228;
//
//architecture structural of m228;
//    component latch74 port(
//           d : in  bit;
//           c : in  bit;
//           rl: in  bit;
//           sl: in  bit;
//           q : out bit;
//           ql: out bit
//    );
//    end component;
//    signal w9, w8, w7, w6, w5, w4, w3, w2, w1 : bit;
//    signal w1w5 : bit;
//    signal sh_st: bit;
//    signal st_blk_mk, st_dev_ck, data, st_final, st_ck, st_idle : bit;
//    signal mk_blk_start, mk_end, sync, mk_data_sync, mk_data, mk_blk_end, mk_blk_mk, mk_blk_sync : bit;
//begin    // Implementation
//      // First, instantiate the w shift register.
//      w9s: latch74 port map(as2, bf1, bh2, 1'b1, w9);
//      w8s: latch74 port map(w9,  bf1, bh2, 1'b1, w8);
//      w7s: latch74 port map(w8,  bf1, av2, 1'b1, w7);
//      w6s: latch74 port map(w7,  bf1, av2, 1'b1, w6);
//      w5s: latch74 port map(w6,  bf1, bh2, 1'b1, w5);
//      w4s: latch74 port map(w5,  bf1, av2, 1'b1, w4);
//      w3s: latch74 port map(w4,  bf1, bh2, 1'b1, w3);
//      w2s: latch74 port map(w3,  bf1, bh2, 1'b1, w2);
//      w1s: latch74 port map(1'b1, w2,  bh2, 1'b1, w1);
//      w1w5 = w1 & w5;
//      bf2 = w9;
//      al1 = w8;
//      ak2 = w7;
//      am2 = w6;
//      bu2 = w5;
//      at2 = w4;
//      be2 = w3;
//      bv2 = w2;
//      bj2 = w1;
//      ak1 = w1w5;
//
//      // Instantiate the state decoder ring.
//      s1: latch74 port map(st_idle,   sh_st, av2, 1'b1, st_blk_mk);
//      s2: latch74 port map(st_blk_mk, sh_st, av2, 1'b1, st_dev_ck);
//      s3: latch74 port map(st_dev_ck, sh_st, av2, 1'b1, data);
//      s4: latch74 port map(data,      sh_st, av2, 1'b1, st_final);
//      s5: latch74 port map(st_final,  sh_st, av2, 1'b1, st_ck);
//      s6: latch74 port map(st_ck,     sh_st, 1'b1, av2, st_idle);
//      an2 = st_idle;
//      ar2 = st_blk_mk;
//      bs1 = st_dev_ck;
//      bk2 = data;
//      bl2 = st_final;
//      br1 = st_ck;
//
//      // Now the AND/NOR gates for the shift clock.
//      sh_st = ((st_idle & ap2) | (st_blk_mk & mk_blk_start) | (mk_blk_start & st_dev_ck) | (data & mk_blk_end) | (mk_blk_end & st_final) | (st_ck & br2)) & ~(an1);
//      am1 = sh_st;
//
//      // Now the data decoder gates.
//      mk_blk_start = w1 & ~(w3) & ~(w4) & ~(w5) & w6 & ~(w7) & ~(w8) & ~(w9);
//      af1 = ~mk_blk_start;
//      aj2 = mk_blk_start;
//
//      mk_end = w2 & ~(w3) & ~(w4) & ~(w6) & ~(w7) & w8 & ~(w9) & w1w5;
//      ah2 = ~mk_end;
//      af2 = mk_end;
//
//      sync = bh1 & w3 & ~(w4) & ~(w6) & w7 & ~(w8) & w9 & w1w5;
//      bm2 = ~sync;
//      bn2 = sync;
//
//      mk_data_sync = ~(w3) & ~(w4) & w6 & ~(w7) & ~(w9) & w1w5 & w2 & w8;
//      aj1 = ~mk_data_sync;
//      ah1 = mk_data_sync;
//
//      mk_data = ~(w2) & ~(w3) & w4 & w6 & ~(w7) & ~(w8) & w9 & w1w5;
//      au2 = ~mk_data;
//      bp2 = mk_data;
//
//      mk_blk_end = w1 & ~(w3) & w4 & ~(w2) & w6 & ~(w7) & w8 & w9;
//      bv1 = ~mk_blk_end;
//      bu1 = mk_blk_end;
//
//      mk_blk_mk = ~(w2) & w3 & ~(w4) & ~(w2) & ~(w6) & w7 & w8 & ~(w9) & w1w5;
//      ad2 = ~mk_blk_mk;
//      ae2 = mk_blk_mk;
//
//      mk_blk_sync = w1 & w2 & w3 & w4 & ~(w5) & w6 & ~(w7) & (w8 & ~(w9));
//      bt2 = ~mk_blk_sync;
//      bs2 = mk_blk_sync;
//
//      // Finally, that last gate.
//      au1 = w8 & ~(w9);
//endmodule
//
//// M302 One Shot Delay
//module m302;
//// TODO: automate delay1 and delay2?
//// s2, n1, s1, u1, p1, r1 additively form delay1 when grounded
//// l2, d2, h1, j1, e1, f1 additively form delay2 when grounded
//    // The trigger is the NAND of h2, j2, k2, falling.
//    // Trigger causes the output f2 to go low.
//    // A delay of delay1 clocks later, f2 returns high.
//    ${M}trig1 = ~(h2 & j2 & k2 & ~f2); // ~f2 inhibits retrigger
//    always @(posedge clk) begin
//        if ${M}trig1 begin
//            ${M}count1 = 0;
//        end else begin
//            if ${M}count1 = ${M}delay1 begin
//                f2 = 1'b1;
//            end else begin
//                f2 = 1'b0;
//                ${M}cout1++;
//            end;
//        end
//    end;
//    // The trigger is the NAND of m2, n2, p2 rising.
//    // Trigger causes the output t2 to go low.
//    // A delay of delay2 clocks later, t2 returns high.
//    ${M}trig1 = ~(m2 & n2 & p2 & ~t2); // ~f2 inhibits retrigger
//    always @(posedge clk) begin
//        if ${M}trig2 begin
//            ${M}count2 = 0;
//        end else begin
//            if ${M}count2 = ${M}delay2 begin
//                t2 = 1'b1;
//            end else begin
//                t2 = 1'b0;
//                ${M}cout2++;
//            end;
//        end
//    end;
//endmodule
//
//
//// m307 Dual Retriggerable One Shot Delay
//module m307;
//   generic(
//       clkspd : integer := 10;               // in ns
//       delay1 : integer := 120000000/clkspd; // 120ms
//       delay2 : integer := 70000/clkspd;     // 70us
//   );
//   // Declare ports here.
//   port(
//       clk : in std_logic;
//
////     a1, c1, d2, m2, p1, r1, v1 : buffer std_logic; -- RC jumpers
//
////     b1, d1, e1, f1, h1, j1 : buffer std_logic; -- RC jumpers
//       e2, k1 : buffer std_logic; // TTL Output
//       j1, k2, l1, l2: buffer std_logic := 1'b1; // TTL Inputs
//
////     n2, p2, r2, s2, u2, v2 : buffer std_logic; -- RC Jumpers
//       f2, h2 : buffer std_logic; // TTL Output
//       m1, n1, s1, u1: buffer std_logic := 1'b1  // TTL Inputs
//   );
//end m307;
//
//architecture behavioral of m307;
//   signal ${M}trig1  : std_logic;
//   signal ${M}otrig1 : std_logic;
//   signal trig2  : std_logic;
//   signal otrig2 : std_logic;
//   signal timer1 : integer;
//   signal timer2 : integer;
//begin    // Implementation
//
//   // Trigger causes the output e2 to go low.
//   // A delay of delay1 clocks later, e2 returns high.
//   // k1 presents the inversion of e2.
//   ${M}trig1 = j2 & l1 & ~(k2 & l2);
//   m307a: process (clk)
//   begin
//      if (clk'event & clk = 1'b1) then
//         // This should be retriggerable.
//         if (${M}trig1 > ${M}otrig1) then
//            //- Rising edge on the trigger detected.
//            e2 = 1'b0;
//            timer1 = 0;
//         else
//            if timer1 = delay1 then
//                e2 = 1'b1;
//            else
//               timer1 = timer1 + 1;
//            end if;
//         end if;
//         ${M}otrig1 = ${M}trig1;
//      end if;
//   end process;
//   k1 = ~e2;
//
//   // Trigger causes the output f2 to go low.
//   // A delay of delay2 clocks later, f2 returns high.
//   // h2 presents the inversion of f2.
//   ${M}trig1 = m1 & n1 & ~(s1 & u1);
//   m307b: process (clk)
//   begin
//      if (clk'event & clk = 1'b1) then
//         // This should be retriggerable
//         if (trig2 > otrig2) then
//            //- Rising edge on the trigger detected.
//            f2 = 1'b0;
//            timer2 = 0;
//         else
//            if timer2 = delay2 then
//                f2 = 1'b1;
//            else
//               timer2 = timer2 + 1;
//            end if;
//         end if;
//         otrig2 = trig2;
//      end if;
//   end process;
//   h2 = ~f2;
//end behavioral;

module m310;
    // ${M}: M310 Dual Retriggerable One Shot Delay
    // BUGBUG: Wants 50ns clk
    always @(posedge clk) begin
        // Delay Line implemented with shift register.
        ${M}sr = {~h2, ${M}sr[0:9]};
        // Pulse amp. triggered by e1, rises after 100 ns.
        if (e1) begin
            ${M}count1 = 0;
            f1 = 1'b1;
        end else if (${M}count1 == 2) begin
            f1 = 1'b0;
        end else begin
            ${M}count1 = ${M}count1 + 1;
        end
        // Pulse amp. triggered by h1, rises after 100 ns.
        if (h1) begin
            ${M}count2 = 0;
            j1 = 1'b1;
        end else if (${M}count2 == 2) begin
            j1 = 1'b0;
        end else begin
            ${M}count2 = ${M}count2 + 1;
        end
    end
    // Delay line taps
    assign j2 = ${M}sr[ 0]; //   0 ns
    assign k2 = ${M}sr[ 1]; //  50 ns
    assign l2 = ${M}sr[ 2]; // 150 ns
    assign m2 = ${M}sr[ 3]; // 150 ns
    assign n2 = ${M}sr[ 4]; // 250 ns
    assign p2 = ${M}sr[ 5]; // 250 ns
    assign r2 = ${M}sr[ 6]; // 300 ns
    assign s2 = ${M}sr[ 7]; // 350 ns
    assign t2 = ${M}sr[ 8]; // 400 ns
    assign u2 = ${M}sr[ 9]; // 450 ns
    assign v2 = ${M}sr[10]; // 500 ns
endmodule

module m360;
    // ${M}: M360 Variable Delay
    // An adjustment sets the delay, and the pulse width is 100ns.
    // BUGBUG: Variable ${M}delay needs to be filled in here!
    // BUGBUG: Wants 50ns clk
    always @(posedge clk) begin
        // BUGBUG: Should initialize ${M}count to ${M}delay+2
        if (p2 & r2) begin
            ${M}count = 0;
        end else if (${M}count == ${M}delay) begin
            s2 = 1'b1;
            ${M}t2 = 1'b1;
            ${M}count = ${M}count + 1;
        end else if (${M}count == ${M}delay+2) begin
            s2 = 1'b0;
            ${M}t2 = 1'b0;
        end else begin
            ${M}count = ${M}count + 1;
        end
    end
    assign t2 = ${M}t2;
    assign v2 = ~u2;
endmodule

//// M401 Variable Clock
//// m401 Clock
//module m401;
//   generic(
//       clkspd : integer := 10;          // in ns!
//       delay  : integer := 8333/clkspd; // 8.33us
//   );
//   // Declare ports here.
//   port(
//       clk : in std_logic;
//
////     m2, n2, p2, r2, s2, t2 : buffer std_logic; -- RC jumpers
//
//       d2, e2 : buffer std_logic; // TTL Output
//       j2, k2 : buffer std_logic := 1'bH  // TTL Inputs
//   );
//end m401;
//
//architecture behavioral of m401;
//   signal enable : std_logic;
//   signal timer  : integer;
//begin    // Implementation
//
//   enable = ~(j2 & k2);
//   m401a: process (clk)
//   begin
//      if ((enable = 1'b1) & clk'event & (clk = 1'b1)) then
//         if (d2 = 1'b1) then
//             d2 = 1'b0;
//             timer = 1'b0;
//         else
//            if timer = delay then
//               d2 = 1'b1;
//            else
//               timer = timer + 1;
//            end if;
//         end if;
//      end if;
//   end process;
//   e2 = ~d2;
//
//end behavioral;

module m452;
    // ${M}: M452 Baud Rate Generator
    // TODO: This is stubbed out pending M706, M707 implementation.
endmodule

//// M502 Negative Input Converter
//module m502;
//   generic(tpd : time := 20 ns);
//   // Declare ports here.
//   port(
//       d2 : buffer bit; // TTL Output
//       e2 : buffer bit; // Impedance match resistor
//       h2: buffer bit; // Negibus Input
//       u2 : buffer bit; // TTL Output
//       p2 : buffer bit; // Impedance match resistor
//       r2: buffer bit // Negibus Input
//   );
//end m502;
//architecture structural of m502;
//begin    // Implementation
//   // No real way to model the timing, so just allocate 
//   //  buffer pins.
//endmodule

module m516;
    // ${M}: M516 Positive Bus Receiver
    // Only: a1, b1, d2, e2, f1, h1, k2, l2, m1, n1, r2, and s2 have pull-ups.
    PULLUP ${M}a1p(a1);
    PULLUP ${M}b1p(b1);
    PULLUP ${M}d2p(d2);
    PULLUP ${M}e2p(e2);
    PULLUP ${M}f1p(f1);
    PULLUP ${M}h1p(h1);
    PULLUP ${M}k2p(k2);
    PULLUP ${M}l2p(l2);
    PULLUP ${M}m1p(m1);
    PULLUP ${M}n1p(n1);
    PULLUP ${M}r2p(r2);
    PULLUP ${M}s2p(s2);
    assign e1 = ~(a1 & b1 & c1 & d1);
    assign j2 = ~(d2 & e2 & f2 & h2);
    assign l1 = ~(f1 & h1 & j1 & k1);
    assign p2 = ~(k2 & l2 & m2 & n2);
    assign s1 = ~(m1 & n1 & p1 & r1);
    assign v2 = ~(r2 & s2 & t2 & v2);
endmodule

//// m602 Dual Pulse Amplifier
//// Amplifier is a git of a misnomer here, as we just 
//// convert level transitions into standardized pulses.
//module m602;
//   generic(
//       clkspd : integer := 10;         // in ns!
//       short  : integer := 50/clkspd;  // 50ns
//       long   : integer := 110/clkspd  // 110ns
//   );
//   // Declare ports here.
//   port(
//       clk : in std_logic;
//
//       d2 : buffer std_logic := 1'bH; // RC jumpers
//       e2 : buffer std_logic := 1'b0; // RC jumpers
//       f2 : buffer std_logic; // TTL Output
//       h2, j2, k2: buffer std_logic := 1'b1; // TTL Inputs
//
//       r2 : buffer std_logic := 1'bH; // RC Jumpers
//       s2 : buffer std_logic := 1'b0; // RC Jumpers
//       l2 : buffer std_logic; // TTL Output
//       m2, n2, p2: buffer std_logic := 1'b1  // TTL Inputs
//   );
//end m602;
//
//architecture behavioral of m602;
//   signal ${M}trig1  : std_logic;
//   signal ${M}otrig1 : std_logic;
//   signal trig2  : std_logic;
//   signal otrig2 : std_logic;
//   signal timer1 : integer;
//   signal timer2 : integer;
//begin    // Implementation
//   // The configuration of delay1 & delay2 is done as follows:
//   // One of the jumper inputs is weakly pulled high, & the 
//   // other is strongly pulled low.  Then, if they are connected 
//   // together, this can be detected, as they'll both be low.
//   d2 = 1'bH;
//   e2 = 1'b0;
//   delay1 = short when d2 = 1'b1
//   else      long;
//   r2 = 1'bH;
//   s2 = 1'b0;
//   delay2 = short when r2 = 1'b1
//   else      long;
//
//   // The trigger is the NAND of h2, j2, k2 rising.
//   // Trigger causes the output f2 to go low.
//   // A delay of delay1 clocks later, f2 returns high.
//   ${M}trig1 = ~(h2 & j2 & k2);
//   m602a: process (clk)
//   begin
//      if (clk'event & clk = 1'b1) then
//         // This must not be retriggerable!
//         if ((f2 & ${M}trig1) > ${M}otrig1) then
//            //- Rising edge on the trigger detected.
//            f2 = 1'b0;
//            timer1 = 0;
//         else
//            if timer1 = delay1 then
//               f2 = 1'b1;
//            else
//               timer1 = timer1 + 1;
//            end if;
//         end if;
//         ${M}otrig1 = ${M}trig1;
//      end if;
//   end process;
//
//   // The trigger is the NAND of m2, n2, p2 rising.
//   // Trigger causes the output L2 to go low.
//   // A delay of delay2 clocks later, t2 returns high.
//   ${M}trig1 = ~(h2 & j2 & k2);
//   m602b: process (clk)
//   begin
//      if (clk'event & clk = 1'b1) then
//         // This must not be retriggerable!
//         if ((t2 & trig2) > otrig2) then
//            //- Rising edge on the trigger detected.
//            t2 = 1'b0;
//            timer2 = 0;
//         else
//            if timer2 = delay2 then
//                t2 = 1'b1;
//            else
//               timer2 = timer2 + 1;
//            end if;
//         end if;
//         otrig2 = trig2;
//      end if;
//   end process;
//end behavioral;

module m617;
    // ${M}: M617 NAND Power Amplifier
    assign e1 = ~(a1 & b1 & c1 & d1);
    assign l1 = ~(f1 & h1 & j1 & k1);
    assign s1 = ~(m1 & n1 & p1 & r1);
    assign j2 = ~(d2 & e2 & f2 & h2);
    assign p2 = ~(k2 & l2 & m2 & n2);
    assign v2 = ~(r2 & s2 & t2 & u2);
    assign u1 = 1'b1;
    assign v1 = 1'b1;
endmodule

module m623;
    // ${M}: M623 Bus Driver
    // BUGBUG: d1, e1, k1, l1, r1, s1 are outputs!
    // BUGBUG: h2, j2, n2, p2, u2, v2 are outputs!
    assign d1 = a1 | c1;
    assign e1 = b1 | c1;
    assign k1 = f1 | j1;
    assign l1 = h1 | j1;
    assign r1 = m1 | p1;
    assign s1 = n1 | p1;
    assign h2 = d2 | f2;
    assign j2 = e2 | f2;
    assign n2 = k2 | m2;
    assign p2 = l2 | m2;
    assign u2 = r2 | t2;
    assign v2 = s2 | t2;
    assign u1 = 1'b0;
    assign v1 = 1'b0;
endmodule

module m627;
   // ${M}: M627 NAND Power Amplifier
   assign e1 = ~(a1 & b1 & c1 & d1);
   assign l1 = ~(f1 & h1 & j1 & k1);
   assign s1 = ~(m1 & n1 & p1 & r1);
   assign j2 = ~(d2 & e2 & f2 & h2);
   assign p2 = ~(k2 & l2 & m2 & n2);
   assign v2 = ~(r2 & s2 & t2 & u2);
   assign u1 = 1'b1;
   assign v1 = 1'b1;
endmodule

module m633;
    // ${M}: M633 Negative Bus Driver
    // BUGBUG: d1, e1, k1, l1, r1, s1 are outputs!
    // BUGBUG: h2, j2, n2, p2, u2, v2 are outputs!
    // (Logically equivalent to M623)
    assign d1 = a1 | c1;
    assign e1 = b1 | c1;
    assign k1 = f1 | j1;
    assign l1 = h1 | j1;
    assign r1 = m1 | p1;
    assign s1 = n1 | p1;
    assign h2 = d2 | f2;
    assign j2 = e2 | f2;
    assign n2 = k2 | m2;
    assign p2 = l2 | m2;
    assign u2 = r2 | t2;
    assign v2 = s2 | t2;
    assign u1 = 1'b0;
    assign v1 = 1'b0;
endmodule

module m660;
    // ${M}: M660 Positive Level Driver
    // BUGBUG: d2, k2, s2 are high current outputs.
    assign d2 = ~(h2 & j2);
    assign k2 = ~(n2 & p2);
    assign s2 = ~(u2 & v2);
endmodule

module m700;
    // ${M}: M700 Manual Timing Generator
    // First, AS2 is filtered over 100 ms, .
    // then, inverted & squared up.
    // AM2 gets this re-inverted to be positive-going.
    // AT2, AE2, & BD2 are 150ns positive going pulses.
    // AJ2, & AF2 are 2 us positive going pulses.
    // AK2, & AH2 are 2 us negative going pulses.
    // BUGBUG: ar2 is an input!
    PULLUP ${M}be2p(be2);
    PULLUP ${M}bf2p(bf2);
    PULLUP ${M}ar2p(ar2);
    assign at2 = ~(~(as2 & ar2) & ap2);
    assign an2 = at2;
    assign am2 = ~at2;
    // BUGBUG TODO: Research desired pulse widths here.
    always @(posedge clk) begin
        if (al2 == 1'b0) begin
            // Reset
            af2 = 1'b0;
            ah2 = 1'b1;
            aj2 = 1'b0;
            ak2 = 1'b1;
        end else if (clk == 1'b1) begin
            if (am2 > ${M}oam2) begin
                //- Rising edge on the trigger detected.
                aj2 = 1'b1;
                ak2 = 1'b0;
                ${M}timer1 = 0;
            end else begin
                if (${M}timer1 == ${M}delay1) begin
                    // First interval has passed.
                    af2 = 1'b1;
                    ah2 = 1'b0;
                    aj2 = 1'b0;
                    ak2 = 1'b1;
                    ae2 = 1'b1;
                end else if (${M}timer1 == ${M}delay2) begin
                    aj2 = 1'b0;
                    ak2 = 1'b1;
                    ae2 = 1'b0; // BUGBUG: Duty cycle?
                    bd2 = 1'b1; // BUGBUG: How long?
                end else begin
                    ${M}timer1 = ${M}timer1 + 1;
                end
            end
            ${M}oam2 = am2;
        end
    end
endmodule

module m703;
    // ${M}: M703 Power Fail
    assign l2 = 1'b1;
    assign u1 = 1'b1;
    assign r2 = 1'b1;
endmodule

module m705;
    // ${M}: M705 Reader Control
    // TODO: Reader/Punch stubbed out
endmodule

module m706a;
    // ${M}: M706 Teletype Receiver
    // TODO: This is stubbed out
endmodule

module m706b;
    // ${M}: M706 Teletype Receiver
    // TODO: This is stubbed out
endmodule

module m707a;
    // ${M}: M707 Teletype Transmitter
    // TODO: This is stubbed out
endmodule

module m707b;
    // ${M}: M707 Teletype Transmitter
    // TODO: This is stubbed out
endmodule

module m710;
    // ${M}: M710 Punch Control
    // TODO: Reader/Punch stubbed out
endmodule

module m715;
    // ${M}: M715 Reader Clock
    // TODO: Reader/Punch stubbed out
endmodule

module m903;
    // ${M}: M903 Connector
    // BUGBUG: b1, d1, e1, h1, j1, l1 are I/O.
    // BUGBUG: m1, p1, s1, d2, e2, h2 are I/O.
    // BUGBUG: k2, m2, p2, s2, t2, v2 are I/O.
endmodule

module m906;
    // ${M}: M906 Cable Terminator
    // Just pull-ups.
    PULLUP ${M}b1p(b1);
    PULLUP ${M}d1p(d1);
    PULLUP ${M}e1p(e1);
    PULLUP ${M}h1p(h1);
    PULLUP ${M}j1p(j1);
    PULLUP ${M}l1p(l1);
    PULLUP ${M}m1p(m1);
    PULLUP ${M}p1p(p1);
    PULLUP ${M}s1p(s1);
    PULLUP ${M}d2p(d2);
    PULLUP ${M}e2p(e2);
    PULLUP ${M}h2p(h2);
    PULLUP ${M}k2p(k2);
    PULLUP ${M}m2p(m2);
    PULLUP ${M}p2p(p2);
    PULLUP ${M}s2p(s2);
    PULLUP ${M}t2p(t2);
    PULLUP ${M}v2p(v2);
endmodule

module m916;
    // ${M}: M916 Connector
    // BUGBUG: a1, b1, c1, d1, e1, f1, h1, j1, k1 are I/O.
    // BUGBUG: l1, m1, n1, p1, r1, s1, t1, u1, v1 are I/O.
    // BUGBUG: a2, b2, c2, d2, e2, f2, h2, j2, k2 are I/O.
    // BUGBUG: l2, m2, n2, p2, r2, s2, t2, u2, v2 are I/O.
endmodule

module w005;
    // ${M}: W005 Clamp Loads
    // Declare ports here.
    // We don't declare any, because if it's negative 
    // logic, it shouldn't be coming into the FPGA.
endmodule

module w023;
    // ${M}: W023 Connector
    // BUGBUG: a2, b2, c2, d2, e2, f2, h2, j2, k2 are I/O.
    // BUGBUG: l2, m2, n2, p2, r2, s2, t2, u2, v2 are I/O.
endmodule

module w025a;
    // ${M}: W025A Core Memory
    // Not implemented (core memory)
endmodule

module w025b;
    // ${M}: W025B Core Memory
    // Not implemented (core memory)
endmodule

module w032;
    // ${M}: W032 Connector
    // BUGBUG: af2, ah2, aj2, an2, ap2, ar2, au2, av2 are I/O.
    // BUGBUG: bd2, bf2, bh2, bj2, bm2, bn2, bp2 are I/O.
endmodule

module w076;
    // ${M}: W076 Teletype Connector
    // TODO: Stubbed out pending implementation of M706, M707.
endmodule

module w077;
    // ${M}: W077 Connector
    // BUGBUG: a2, b2, c2, d2, e2, f2, h2, j2, k2 are I/O.
    // BUGBUG: l2, m2, n2, p2, r2, s2, t2, u2, v2 are I/O.
endmodule
