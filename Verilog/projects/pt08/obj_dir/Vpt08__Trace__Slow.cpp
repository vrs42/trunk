// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vpt08__Syms.h"


//======================

void Vpt08::trace (VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addCallback (&Vpt08::traceInit, &Vpt08::traceFull, &Vpt08::traceChg, this);
}
void Vpt08::traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->open()
    Vpt08* t=(Vpt08*)userthis;
    Vpt08__Syms* __restrict vlSymsp = t->__VlSymsp; // Setup global symbol table
    if (!Verilated::calcUnusedSigs()) vl_fatal(__FILE__,__LINE__,__FILE__,"Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    vcdp->scopeEscape(' ');
    t->traceInitThis (vlSymsp, vcdp, code);
    vcdp->scopeEscape('.');
}
void Vpt08::traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vpt08* t=(Vpt08*)userthis;
    Vpt08__Syms* __restrict vlSymsp = t->__VlSymsp; // Setup global symbol table
    t->traceFullThis (vlSymsp, vcdp, code);
}

//======================


void Vpt08::traceInitThis(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    vcdp->module(vlSymsp->name()); // Setup signal names
    // Body
    {
	vlTOPp->traceInitThis__1(vlSymsp, vcdp, code);
    }
}

void Vpt08::traceFullThis(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vlTOPp->traceFullThis__1(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vpt08::traceInitThis__1(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->declBit  (c+90,"clk",-1);
	vcdp->declBit  (c+91,"dsrttl",-1);
	vcdp->declBit  (c+92,"txdttl",-1);
	vcdp->declBit  (c+93,"rxdttl",-1);
	vcdp->declBit  (c+94,"rx_rate",-1);
	vcdp->declBit  (c+95,"bmb0",-1);
	vcdp->declBit  (c+96,"bmb1",-1);
	vcdp->declBit  (c+97,"bmb2",-1);
	vcdp->declBit  (c+98,"bmb3",-1);
	vcdp->declBit  (c+99,"bmb4",-1);
	vcdp->declBit  (c+100,"bmb5",-1);
	vcdp->declBit  (c+101,"bmb6",-1);
	vcdp->declBit  (c+102,"bmb7",-1);
	vcdp->declBit  (c+103,"bmb8",-1);
	vcdp->declBit  (c+104,"bmb9",-1);
	vcdp->declBit  (c+105,"bmb10",-1);
	vcdp->declBit  (c+106,"bmb11",-1);
	vcdp->declBit  (c+107,"bmb3_l",-1);
	vcdp->declBit  (c+108,"bmb4_l",-1);
	vcdp->declBit  (c+109,"bmb5_l",-1);
	vcdp->declBit  (c+110,"bmb6_l",-1);
	vcdp->declBit  (c+111,"bmb7_l",-1);
	vcdp->declBit  (c+112,"bmb8_l",-1);
	vcdp->declBit  (c+113,"bac0",-1);
	vcdp->declBit  (c+114,"bac1",-1);
	vcdp->declBit  (c+115,"bac2",-1);
	vcdp->declBit  (c+116,"bac3",-1);
	vcdp->declBit  (c+117,"bac4",-1);
	vcdp->declBit  (c+118,"bac5",-1);
	vcdp->declBit  (c+119,"bac6",-1);
	vcdp->declBit  (c+120,"bac7",-1);
	vcdp->declBit  (c+121,"bac8",-1);
	vcdp->declBit  (c+122,"bac9",-1);
	vcdp->declBit  (c+123,"bac10",-1);
	vcdp->declBit  (c+124,"bac11",-1);
	vcdp->declBit  (c+125,"biop1",-1);
	vcdp->declBit  (c+126,"biop2",-1);
	vcdp->declBit  (c+127,"biop4",-1);
	vcdp->declBit  (c+128,"bts1",-1);
	vcdp->declBit  (c+129,"bts3",-1);
	vcdp->declBit  (c+130,"initialize",-1);
	vcdp->declBit  (c+131,"iob0_l",-1);
	vcdp->declBit  (c+132,"iob1_l",-1);
	vcdp->declBit  (c+133,"iob2_l",-1);
	vcdp->declBit  (c+134,"iob3_l",-1);
	vcdp->declBit  (c+135,"iob4_l",-1);
	vcdp->declBit  (c+136,"iob5_l",-1);
	vcdp->declBit  (c+137,"iob6_l",-1);
	vcdp->declBit  (c+138,"iob7_l",-1);
	vcdp->declBit  (c+139,"iob8_l",-1);
	vcdp->declBit  (c+140,"iob9_l",-1);
	vcdp->declBit  (c+141,"iob10_l",-1);
	vcdp->declBit  (c+142,"iob11_l",-1);
	vcdp->declBit  (c+143,"skip_l",-1);
	vcdp->declBit  (c+144,"irq_l",-1);
	vcdp->declBit  (c+145,"acclr_l",-1);
	vcdp->declBit  (c+146,"run",-1);
	vcdp->declBit  (c+90,"pt08 clk",-1);
	vcdp->declBit  (c+91,"pt08 dsrttl",-1);
	vcdp->declBit  (c+92,"pt08 txdttl",-1);
	vcdp->declBit  (c+93,"pt08 rxdttl",-1);
	vcdp->declBit  (c+94,"pt08 rx_rate",-1);
	vcdp->declBit  (c+95,"pt08 bmb0",-1);
	vcdp->declBit  (c+96,"pt08 bmb1",-1);
	vcdp->declBit  (c+97,"pt08 bmb2",-1);
	vcdp->declBit  (c+98,"pt08 bmb3",-1);
	vcdp->declBit  (c+99,"pt08 bmb4",-1);
	vcdp->declBit  (c+100,"pt08 bmb5",-1);
	vcdp->declBit  (c+101,"pt08 bmb6",-1);
	vcdp->declBit  (c+102,"pt08 bmb7",-1);
	vcdp->declBit  (c+103,"pt08 bmb8",-1);
	vcdp->declBit  (c+104,"pt08 bmb9",-1);
	vcdp->declBit  (c+105,"pt08 bmb10",-1);
	vcdp->declBit  (c+106,"pt08 bmb11",-1);
	vcdp->declBit  (c+107,"pt08 bmb3_l",-1);
	vcdp->declBit  (c+108,"pt08 bmb4_l",-1);
	vcdp->declBit  (c+109,"pt08 bmb5_l",-1);
	vcdp->declBit  (c+110,"pt08 bmb6_l",-1);
	vcdp->declBit  (c+111,"pt08 bmb7_l",-1);
	vcdp->declBit  (c+112,"pt08 bmb8_l",-1);
	vcdp->declBit  (c+113,"pt08 bac0",-1);
	vcdp->declBit  (c+114,"pt08 bac1",-1);
	vcdp->declBit  (c+115,"pt08 bac2",-1);
	vcdp->declBit  (c+116,"pt08 bac3",-1);
	vcdp->declBit  (c+117,"pt08 bac4",-1);
	vcdp->declBit  (c+118,"pt08 bac5",-1);
	vcdp->declBit  (c+119,"pt08 bac6",-1);
	vcdp->declBit  (c+120,"pt08 bac7",-1);
	vcdp->declBit  (c+121,"pt08 bac8",-1);
	vcdp->declBit  (c+122,"pt08 bac9",-1);
	vcdp->declBit  (c+123,"pt08 bac10",-1);
	vcdp->declBit  (c+124,"pt08 bac11",-1);
	vcdp->declBit  (c+125,"pt08 biop1",-1);
	vcdp->declBit  (c+126,"pt08 biop2",-1);
	vcdp->declBit  (c+127,"pt08 biop4",-1);
	vcdp->declBit  (c+128,"pt08 bts1",-1);
	vcdp->declBit  (c+129,"pt08 bts3",-1);
	vcdp->declBit  (c+130,"pt08 initialize",-1);
	vcdp->declBit  (c+131,"pt08 iob0_l",-1);
	vcdp->declBit  (c+132,"pt08 iob1_l",-1);
	vcdp->declBit  (c+133,"pt08 iob2_l",-1);
	vcdp->declBit  (c+134,"pt08 iob3_l",-1);
	vcdp->declBit  (c+135,"pt08 iob4_l",-1);
	vcdp->declBit  (c+136,"pt08 iob5_l",-1);
	vcdp->declBit  (c+137,"pt08 iob6_l",-1);
	vcdp->declBit  (c+138,"pt08 iob7_l",-1);
	vcdp->declBit  (c+139,"pt08 iob8_l",-1);
	vcdp->declBit  (c+140,"pt08 iob9_l",-1);
	vcdp->declBit  (c+141,"pt08 iob10_l",-1);
	vcdp->declBit  (c+142,"pt08 iob11_l",-1);
	vcdp->declBit  (c+143,"pt08 skip_l",-1);
	vcdp->declBit  (c+144,"pt08 irq_l",-1);
	vcdp->declBit  (c+145,"pt08 acclr_l",-1);
	vcdp->declBit  (c+146,"pt08 run",-1);
	vcdp->declBus  (c+1,"pt08 mb",-1,31,0);
	vcdp->declBus  (c+2,"pt08 ac",-1,31,0);
	vcdp->declBus  (c+3,"pt08 ib",-1,31,0);
	vcdp->declBit  (c+4,"pt08 rx_sel",-1);
	vcdp->declBit  (c+5,"pt08 tx_sel",-1);
	vcdp->declBit  (c+147,"pt08 init_l",-1);
	vcdp->declBit  (c+62,"pt08 stop1",-1);
	vcdp->declBit  (c+63,"pt08 stop2",-1);
	vcdp->declBit  (c+63,"pt08 stp_mark",-1);
	vcdp->declBit  (c+57,"pt08 tx_ratei",-1);
	vcdp->declBit  (c+57,"pt08 tx_rateo",-1);
	vcdp->declBit  (c+90,"pt08 bd230400",-1);
	vcdp->declBit  (c+46,"pt08 bd115200",-1);
	vcdp->declBit  (c+52,"pt08 bd38400",-1);
	vcdp->declBit  (c+58,"pt08 bd19200",-1);
	vcdp->declBit  (c+67,"pt08 bd9600",-1);
	vcdp->declBit  (c+75,"pt08 bd4800",-1);
	vcdp->declBit  (c+76,"pt08 bd2400",-1);
	vcdp->declBit  (c+79,"pt08 bd1200",-1);
	vcdp->declBit  (c+80,"pt08 bd600",-1);
	vcdp->declBit  (c+89,"pt08 bd300",-1);
	vcdp->declBit  (c+81,"pt08 bd109",-1);
	vcdp->declBit  (c+47,"pt08 n_t_1x",-1);
	vcdp->declBit  (c+6,"pt08 n_t_2x",-1);
	vcdp->declBit  (c+81,"pt08 div11a",-1);
	vcdp->declBit  (c+82,"pt08 div11b",-1);
	vcdp->declBit  (c+83,"pt08 div11c",-1);
	vcdp->declBit  (c+84,"pt08 div11d",-1);
	vcdp->declBit  (c+85,"pt08 ndiv11a",-1);
	vcdp->declBit  (c+86,"pt08 ndiv11b",-1);
	vcdp->declBit  (c+87,"pt08 ndiv11c",-1);
	vcdp->declBit  (c+88,"pt08 ndiv11d",-1);
	vcdp->declBit  (c+148,"pt08 mb3_rx",-1);
	vcdp->declBit  (c+149,"pt08 mb4_rx",-1);
	vcdp->declBit  (c+150,"pt08 mb5_rx",-1);
	vcdp->declBit  (c+151,"pt08 mb6_rx",-1);
	vcdp->declBit  (c+102,"pt08 mb7_rx",-1);
	vcdp->declBit  (c+103,"pt08 mb8_rx",-1);
	vcdp->declBit  (c+148,"pt08 mb3_tx",-1);
	vcdp->declBit  (c+149,"pt08 mb4_tx",-1);
	vcdp->declBit  (c+150,"pt08 mb5_tx",-1);
	vcdp->declBit  (c+101,"pt08 mb6_tx",-1);
	vcdp->declBit  (c+152,"pt08 mb7_tx",-1);
	vcdp->declBit  (c+153,"pt08 mb8_tx",-1);
	vcdp->declBit  (c+147,"pt08 e2 init_l",-1);
	vcdp->declBit  (c+94,"pt08 e2 rx_rate",-1);
	vcdp->declBit  (c+125,"pt08 e2 biop1",-1);
	vcdp->declBit  (c+126,"pt08 e2 biop2",-1);
	vcdp->declBit  (c+127,"pt08 e2 biop4",-1);
	vcdp->declBit  (c+135,"pt08 e2 iob4_l",-1);
	vcdp->declBit  (c+136,"pt08 e2 iob5_l",-1);
	vcdp->declBit  (c+137,"pt08 e2 iob6_l",-1);
	vcdp->declBit  (c+138,"pt08 e2 iob7_l",-1);
	vcdp->declBit  (c+139,"pt08 e2 iob8_l",-1);
	vcdp->declBit  (c+140,"pt08 e2 iob9_l",-1);
	vcdp->declBit  (c+141,"pt08 e2 iob10_l",-1);
	vcdp->declBit  (c+142,"pt08 e2 iob11_l",-1);
	vcdp->declBit  (c+4,"pt08 e2 rx_sel",-1);
	vcdp->declBit  (c+93,"pt08 e2 rx_data",-1);
	vcdp->declBit  (c+5,"pt08 e2 tx_sel",-1);
	vcdp->declBit  (c+143,"pt08 e2 skip_l",-1);
	vcdp->declBit  (c+144,"pt08 e2 irq_l",-1);
	vcdp->declBit  (c+154,"pt08 e2 acclr_l",-1);
	vcdp->declBit  (c+92,"pt08 e2 txdttl",-1);
	vcdp->declBit  (c+91,"pt08 e2 dsrttl",-1);
	{int i; for (i=0; i<8; i++) {
		vcdp->declBit  (c+7+i*1,"pt08 e2 tt_",(i+0));}}
	vcdp->declBit  (c+155,"pt08 e2 kcc_",-1);
	vcdp->declBit  (c+70,"pt08 e2 irql",-1);
	vcdp->declBit  (c+71,"pt08 e2 tti02",-1);
	vcdp->declBit  (c+156,"pt08 e2 serial",-1);
	vcdp->declBit  (c+15,"pt08 e2 buffer_strobe",-1);
	vcdp->declBit  (c+44,"pt08 e2 reader_run_l",-1);
	vcdp->declBit  (c+16,"pt08 e2 tti_skip_",-1);
	vcdp->declBit  (c+49,"pt08 e2 cscale_in",-1);
	vcdp->declBit  (c+59,"pt08 e2 instop0_",-1);
	vcdp->declBit  (c+60,"pt08 e2 instop1_",-1);
	vcdp->declBit  (c+4,"pt08 e2 m706 ad2",-1);
	vcdp->declBit  (c+4,"pt08 e2 m706 ae1",-1);
	vcdp->declBit  (c+4,"pt08 e2 m706 af1",-1);
	vcdp->declBit  (c+4,"pt08 e2 m706 ah1",-1);
	vcdp->declBit  (c+4,"pt08 e2 m706 ah2",-1);
	vcdp->declBit  (c+4,"pt08 e2 m706 aj1",-1);
	vcdp->declBit  (c+71,"pt08 e2 m706 aj2",-1);
	vcdp->declBit  (c+125,"pt08 e2 m706 bd2",-1);
	vcdp->declBit  (c+126,"pt08 e2 m706 bj2",-1);
	vcdp->declBit  (c+127,"pt08 e2 m706 al2",-1);
	vcdp->declBit  (c+70,"pt08 e2 m706 av2",-1);
	vcdp->declBit  (c+130,"pt08 e2 m706 bf2",-1);
	vcdp->declBit  (c+94,"pt08 e2 m706 an1",-1);
	vcdp->declBit  (c+156,"pt08 e2 m706 ar1",-1);
	vcdp->declBit  (c+93,"pt08 e2 m706 bm2",-1);
	vcdp->declBit  (c+163,"pt08 e2 m706 bd1",-1);
	vcdp->declBit  (c+164,"pt08 e2 m706 br1",-1);
	vcdp->declBit  (c+49,"pt08 e2 m706 bu1",-1);
	vcdp->declBit  (c+60,"pt08 e2 m706 br2",-1);
	vcdp->declBit  (c+154,"pt08 e2 m706 tt_ac_clr_",-1);
	vcdp->declBit  (c+155,"pt08 e2 m706 kcc_",-1);
	vcdp->declBit  (c+70,"pt08 e2 m706 keyboard_flag",-1);
	vcdp->declBit  (c+16,"pt08 e2 m706 tti_skip_",-1);
	vcdp->declBus  (c+72,"pt08 e2 m706 tti02",-1,0,2);
	vcdp->declBus  (c+73,"pt08 e2 m706 tti37",-1,3,7);
	vcdp->declBus  (c+17,"pt08 e2 m706 tt_",-1,0,7);
	vcdp->declBit  (c+45,"pt08 e2 m706 reader_run",-1);
	vcdp->declBus  (c+50,"pt08 e2 m706 clock_scale",-1,2,0);
	vcdp->declBus  (c+61,"pt08 e2 m706 in_stop",-1,1,2);
	vcdp->declBit  (c+68,"pt08 e2 m706 spike_detector",-1);
	vcdp->declBit  (c+77,"pt08 e2 m706 in_active",-1);
	vcdp->declBit  (c+69,"pt08 e2 m706 in_last_unit",-1);
	vcdp->declBit  (c+18,"pt08 e2 m706 start_enable",-1);
	vcdp->declBit  (c+157,"pt08 e2 m706 spike_",-1);
	vcdp->declBit  (c+19,"pt08 e2 m706 active_clear_",-1);
	vcdp->declBit  (c+4,"pt08 e2 m706 mb03_",-1);
	vcdp->declBit  (c+4,"pt08 e2 m706 mb04_",-1);
	vcdp->declBit  (c+4,"pt08 e2 m706 mb05_",-1);
	vcdp->declBit  (c+4,"pt08 e2 m706 mb06_",-1);
	vcdp->declBit  (c+4,"pt08 e2 m706 mb07",-1);
	vcdp->declBit  (c+4,"pt08 e2 m706 mb08",-1);
	vcdp->declBit  (c+71,"pt08 e2 m706 tti3_set",-1);
	vcdp->declBit  (c+125,"pt08 e2 m706 iop1",-1);
	vcdp->declBit  (c+126,"pt08 e2 m706 iop2",-1);
	vcdp->declBit  (c+127,"pt08 e2 m706 iop4",-1);
	vcdp->declBit  (c+130,"pt08 e2 m706 initialize",-1);
	vcdp->declBit  (c+94,"pt08 e2 m706 tti_clock_in",-1);
	vcdp->declBit  (c+156,"pt08 e2 m706 tti0_set",-1);
	vcdp->declBit  (c+93,"pt08 e2 m706 rx_data",-1);
	vcdp->declBit  (c+163,"pt08 e2 m706 clr_flag",-1);
	vcdp->declBit  (c+164,"pt08 e2 m706 enable",-1);
	vcdp->declBit  (c+35,"pt08 e2 m706 clock_scale_in",-1);
	vcdp->declBit  (c+38,"pt08 e2 m706 in_stop_",-1);
	vcdp->declBit  (c+4,"pt08 e2 m706 keyboard_select",-1);
	vcdp->declBit  (c+20,"pt08 e2 m706 tti_shift",-1);
	vcdp->declBit  (c+21,"pt08 e2 m706 tti_shift_",-1);
	vcdp->declBit  (c+22,"pt08 e2 m706 preset_",-1);
	vcdp->declBit  (c+23,"pt08 e2 m706 active_clock",-1);
	vcdp->declBit  (c+158,"pt08 e2 m706 krs",-1);
	vcdp->declBit  (c+70,"pt08 e2 m706 reader_run_clr_",-1);
	vcdp->declBit  (c+155,"pt08 e2 m706 ae2",-1);
	vcdp->declBit  (c+70,"pt08 e2 m706 af2",-1);
	vcdp->declBit  (c+71,"pt08 e2 m706 ak1",-1);
	vcdp->declBit  (c+24,"pt08 e2 m706 ak2",-1);
	vcdp->declBit  (c+25,"pt08 e2 m706 ar2",-1);
	vcdp->declBit  (c+26,"pt08 e2 m706 as2",-1);
	vcdp->declBit  (c+27,"pt08 e2 m706 al1",-1);
	vcdp->declBit  (c+28,"pt08 e2 m706 am1",-1);
	vcdp->declBit  (c+29,"pt08 e2 m706 ap2",-1);
	vcdp->declBit  (c+30,"pt08 e2 m706 at2",-1);
	vcdp->declBit  (c+31,"pt08 e2 m706 an2",-1);
	vcdp->declBit  (c+44,"pt08 e2 m706 au2",-1);
	vcdp->declBit  (c+15,"pt08 e2 m706 av1",-1);
	vcdp->declBit  (c+154,"pt08 e2 m706 be2",-1);
	vcdp->declBit  (c+16,"pt08 e2 m706 bh2",-1);
	vcdp->declBit  (c+156,"pt08 e2 m706 am2",-1);
	vcdp->declBit  (c+51,"pt08 e2 m706 bs1",-1);
	vcdp->declBit  (c+49,"pt08 e2 m706 bt2",-1);
	vcdp->declBit  (c+59,"pt08 e2 m706 bu2",-1);
	vcdp->declBit  (c+60,"pt08 e2 m706 bv2",-1);
	vcdp->declBit  (c+78,"pt08 e2 m706 bn2",-1);
	vcdp->declBit  (c+130,"pt08 e11 initialize",-1);
	vcdp->declBit  (c+94,"pt08 e11 rx_rate",-1);
	vcdp->declBit  (c+4,"pt08 e11 rx_sel",-1);
	vcdp->declBit  (c+5,"pt08 e11 tx_sel",-1);
	vcdp->declBit  (c+113,"pt08 e11 bac0",-1);
	vcdp->declBit  (c+114,"pt08 e11 bac1",-1);
	vcdp->declBit  (c+115,"pt08 e11 bac2",-1);
	vcdp->declBit  (c+116,"pt08 e11 bac3",-1);
	vcdp->declBit  (c+117,"pt08 e11 bac4",-1);
	vcdp->declBit  (c+118,"pt08 e11 bac5",-1);
	vcdp->declBit  (c+119,"pt08 e11 bac6",-1);
	vcdp->declBit  (c+120,"pt08 e11 bac7",-1);
	vcdp->declBit  (c+121,"pt08 e11 bac8",-1);
	vcdp->declBit  (c+122,"pt08 e11 bac9",-1);
	vcdp->declBit  (c+123,"pt08 e11 bac10",-1);
	vcdp->declBit  (c+124,"pt08 e11 bac11",-1);
	vcdp->declBit  (c+125,"pt08 e11 biop1",-1);
	vcdp->declBit  (c+126,"pt08 e11 biop2",-1);
	vcdp->declBit  (c+127,"pt08 e11 biop4",-1);
	vcdp->declBit  (c+143,"pt08 e11 skip_l",-1);
	vcdp->declBit  (c+144,"pt08 e11 irq_l",-1);
	vcdp->declBit  (c+147,"pt08 e11 init_l",-1);
	vcdp->declBit  (c+42,"pt08 e11 txdttl",-1);
	vcdp->declBit  (c+62,"pt08 e11 stop1",-1);
	vcdp->declBit  (c+63,"pt08 e11 stop2",-1);
	vcdp->declBit  (c+57,"pt08 e11 tx_rateo",-1);
	vcdp->declBit  (c+57,"pt08 e11 tx_ratei",-1);
	vcdp->declBit  (c+63,"pt08 e11 stp_mark",-1);
	vcdp->declBit  (c+43,"pt08 e11 tx_data_",-1);
	vcdp->declBit  (c+165,"pt08 e11 skip_",-1);
	vcdp->declBit  (c+39,"pt08 e11 irq_",-1);
	vcdp->declBit  (c+166,"pt08 e11 tx_rate",-1);
	vcdp->declBit  (c+53,"pt08 e11 enable",-1);
	vcdp->declBit  (c+54,"pt08 e11 enable_",-1);
	vcdp->declBit  (c+159,"pt08 e11 tto_skip_",-1);
	vcdp->declBit  (c+48,"pt08 e11 tx_ratem",-1);
	vcdp->declBus  (c+160,"pt08 e11 m707 ac4_11",-1,4,11);
	vcdp->declBit  (c+5,"pt08 e11 m707 ae2",-1);
	vcdp->declBit  (c+5,"pt08 e11 m707 ae1",-1);
	vcdp->declBit  (c+5,"pt08 e11 m707 af2",-1);
	vcdp->declBit  (c+5,"pt08 e11 m707 af1",-1);
	vcdp->declBit  (c+5,"pt08 e11 m707 ah2",-1);
	vcdp->declBit  (c+5,"pt08 e11 m707 aj2",-1);
	vcdp->declBit  (c+125,"pt08 e11 m707 bh2",-1);
	vcdp->declBit  (c+126,"pt08 e11 m707 bd2",-1);
	vcdp->declBit  (c+127,"pt08 e11 m707 as1",-1);
	vcdp->declBit  (c+130,"pt08 e11 m707 be2",-1);
	vcdp->declBit  (c+117,"pt08 e11 m707 ap2",-1);
	vcdp->declBit  (c+118,"pt08 e11 m707 ar2",-1);
	vcdp->declBit  (c+119,"pt08 e11 m707 al2",-1);
	vcdp->declBit  (c+120,"pt08 e11 m707 am2",-1);
	vcdp->declBit  (c+121,"pt08 e11 m707 au2",-1);
	vcdp->declBit  (c+122,"pt08 e11 m707 as2",-1);
	vcdp->declBit  (c+123,"pt08 e11 m707 at2",-1);
	vcdp->declBit  (c+124,"pt08 e11 m707 au1",-1);
	vcdp->declBit  (c+54,"pt08 e11 m707 ah1",-1);
	vcdp->declBit  (c+53,"pt08 e11 m707 ak1",-1);
	vcdp->declBit  (c+164,"pt08 e11 m707 an1",-1);
	vcdp->declBit  (c+164,"pt08 e11 m707 an2",-1);
	vcdp->declBit  (c+164,"pt08 e11 m707 bf2",-1);
	vcdp->declBit  (c+5,"pt08 e11 m707 bj1",-1);
	vcdp->declBit  (c+164,"pt08 e11 m707 bs2",-1);
	vcdp->declBit  (c+63,"pt08 e11 m707 bn2",-1);
	vcdp->declBit  (c+57,"pt08 e11 m707 bp2",-1);
	vcdp->declBit  (c+53,"pt08 e11 m707 enable",-1);
	vcdp->declBit  (c+41,"pt08 e11 m707 line",-1);
	vcdp->declBit  (c+42,"pt08 e11 m707 tx_data",-1);
	vcdp->declBit  (c+159,"pt08 e11 m707 tto_skip_",-1);
	vcdp->declBit  (c+40,"pt08 e11 m707 teleprinter_flag",-1);
	vcdp->declBus  (c+64,"pt08 e11 m707 out_stop",-1,0,2);
	vcdp->declBit  (c+161,"pt08 e11 m707 tpc",-1);
	vcdp->declBit  (c+74,"pt08 e11 m707 tto_shift",-1);
	vcdp->declBit  (c+66,"pt08 e11 m707 out_active",-1);
	vcdp->declBus  (c+55,"pt08 e11 m707 tto",-1,3,11);
	vcdp->declBit  (c+5,"pt08 e11 m707 mb03_",-1);
	vcdp->declBit  (c+5,"pt08 e11 m707 mb04_",-1);
	vcdp->declBit  (c+5,"pt08 e11 m707 mb05_",-1);
	vcdp->declBit  (c+5,"pt08 e11 m707 mb06",-1);
	vcdp->declBit  (c+5,"pt08 e11 m707 mb07_",-1);
	vcdp->declBit  (c+5,"pt08 e11 m707 mb08_",-1);
	vcdp->declBit  (c+125,"pt08 e11 m707 iop1",-1);
	vcdp->declBit  (c+126,"pt08 e11 m707 iop2",-1);
	vcdp->declBit  (c+127,"pt08 e11 m707 iop4",-1);
	vcdp->declBit  (c+130,"pt08 e11 m707 initialize",-1);
	vcdp->declBit  (c+54,"pt08 e11 m707 enable_zdetect",-1);
	vcdp->declBit  (c+53,"pt08 e11 m707 new_char",-1);
	vcdp->declBit  (c+164,"pt08 e11 m707 force_select_",-1);
	vcdp->declBit  (c+164,"pt08 e11 m707 force_enable",-1);
	vcdp->declBit  (c+164,"pt08 e11 m707 flag_clr_",-1);
	vcdp->declBit  (c+5,"pt08 e11 m707 iot_ok",-1);
	vcdp->declBit  (c+164,"pt08 e11 m707 force_stop_",-1);
	vcdp->declBit  (c+63,"pt08 e11 m707 stop_",-1);
	vcdp->declBit  (c+57,"pt08 e11 m707 tto_clock_",-1);
	vcdp->declBit  (c+32,"pt08 e11 m707 tto_select_",-1);
	vcdp->declBit  (c+5,"pt08 e11 m707 tto_select",-1);
	vcdp->declBit  (c+37,"pt08 e11 m707 tto0_",-1);
	vcdp->declBit  (c+36,"pt08 e11 m707 start_bit",-1);
	vcdp->declBit  (c+33,"pt08 e11 m707 tcf",-1);
	vcdp->declBit  (c+53,"pt08 e11 m707 ak2",-1);
	vcdp->declBit  (c+54,"pt08 e11 m707 al1",-1);
	vcdp->declBit  (c+43,"pt08 e11 m707 av2",-1);
	vcdp->declBit  (c+159,"pt08 e11 m707 bj2",-1);
	vcdp->declBit  (c+39,"pt08 e11 m707 bk2",-1);
	vcdp->declBit  (c+62,"pt08 e11 m707 br2",-1);
	vcdp->declBit  (c+65,"pt08 e11 m707 bp1",-1);
	vcdp->declBit  (c+63,"pt08 e11 m707 bn1",-1);
	vcdp->declBit  (c+162,"pt08 e11 m707 ar1",-1);
	vcdp->declBit  (c+56,"pt08 e11 m707 aj1",-1);
	vcdp->declBus  (c+34,"pt08 e11 m707 tto_set",-1,3,11);
	// Tracing: pt08 e11 m707 cbit // Ignored: Verilator trace_off at m707.v:104
	vcdp->declBit  (c+131,"pt08 pup iob0_l",-1);
	vcdp->declBit  (c+132,"pt08 pup iob1_l",-1);
	vcdp->declBit  (c+133,"pt08 pup iob2_l",-1);
	vcdp->declBit  (c+134,"pt08 pup iob3_l",-1);
	vcdp->declBit  (c+135,"pt08 pup iob4_l",-1);
	vcdp->declBit  (c+136,"pt08 pup iob5_l",-1);
	vcdp->declBit  (c+137,"pt08 pup iob6_l",-1);
	vcdp->declBit  (c+138,"pt08 pup iob7_l",-1);
	vcdp->declBit  (c+139,"pt08 pup iob8_l",-1);
	vcdp->declBit  (c+140,"pt08 pup iob9_l",-1);
	vcdp->declBit  (c+141,"pt08 pup iob10_l",-1);
	vcdp->declBit  (c+142,"pt08 pup iob11_l",-1);
	vcdp->declBit  (c+145,"pt08 pup acclr_l",-1);
	vcdp->declBit  (c+144,"pt08 pup irq_l",-1);
	vcdp->declBit  (c+143,"pt08 pup skip_l",-1);
    }
}

void Vpt08::traceFullThis__1(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->fullBus  (c+1,(vlTOPp->pt08__DOT__mb),32);
	vcdp->fullBus  (c+2,(vlTOPp->pt08__DOT__ac),32);
	vcdp->fullBus  (c+3,(vlTOPp->pt08__DOT__ib),32);
	vcdp->fullBit  (c+4,(vlTOPp->pt08__DOT__rx_sel));
	vcdp->fullBit  (c+5,(vlTOPp->pt08__DOT__tx_sel));
	vcdp->fullBit  (c+6,(vlTOPp->pt08__DOT__n_t_2x));
	vcdp->fullBit  (c+7,(vlTOPp->pt08__DOT__e2__DOT__tt_[0]));
	vcdp->fullBit  (c+8,(vlTOPp->pt08__DOT__e2__DOT__tt_[1]));
	vcdp->fullBit  (c+9,(vlTOPp->pt08__DOT__e2__DOT__tt_[2]));
	vcdp->fullBit  (c+10,(vlTOPp->pt08__DOT__e2__DOT__tt_[3]));
	vcdp->fullBit  (c+11,(vlTOPp->pt08__DOT__e2__DOT__tt_[4]));
	vcdp->fullBit  (c+12,(vlTOPp->pt08__DOT__e2__DOT__tt_[5]));
	vcdp->fullBit  (c+13,(vlTOPp->pt08__DOT__e2__DOT__tt_[6]));
	vcdp->fullBit  (c+14,(vlTOPp->pt08__DOT__e2__DOT__tt_[7]));
	vcdp->fullBit  (c+15,(vlTOPp->pt08__DOT__e2__DOT__buffer_strobe));
	vcdp->fullBit  (c+16,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_skip_));
	vcdp->fullBus  (c+17,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_),8);
	vcdp->fullBit  (c+18,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__start_enable));
	vcdp->fullBit  (c+19,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__active_clear_));
	vcdp->fullBit  (c+20,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_shift));
	vcdp->fullBit  (c+21,((1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_shift)))));
	vcdp->fullBit  (c+22,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__preset_));
	vcdp->fullBit  (c+23,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__active_clock));
	vcdp->fullBit  (c+24,((1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
				     >> 7U))));
	vcdp->fullBit  (c+25,((1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
				     >> 6U))));
	vcdp->fullBit  (c+26,((1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
				     >> 5U))));
	vcdp->fullBit  (c+27,((1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
				     >> 4U))));
	vcdp->fullBit  (c+28,((1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
				     >> 3U))));
	vcdp->fullBit  (c+29,((1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
				     >> 2U))));
	vcdp->fullBit  (c+30,((1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
				     >> 1U))));
	vcdp->fullBit  (c+31,((1U & (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_))));
	vcdp->fullBit  (c+32,((1U & (~ (IData)(vlTOPp->pt08__DOT__tx_sel)))));
	vcdp->fullBit  (c+33,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tcf));
	vcdp->fullBus  (c+34,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set),9);
	vcdp->fullBit  (c+35,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale_in));
	vcdp->fullBit  (c+36,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__start_bit));
	vcdp->fullBit  (c+37,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto0_));
	vcdp->fullBit  (c+38,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop_));
	vcdp->fullBit  (c+39,((1U & (~ (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__teleprinter_flag)))));
	vcdp->fullBit  (c+40,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__teleprinter_flag));
	vcdp->fullBit  (c+41,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__line));
	vcdp->fullBit  (c+42,((1U & ((~ (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_active)) 
				     | (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__line)))));
	vcdp->fullBit  (c+43,((1U & (~ ((~ (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_active)) 
					| (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__line))))));
	vcdp->fullBit  (c+44,((1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__reader_run)))));
	vcdp->fullBit  (c+45,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__reader_run));
	vcdp->fullBit  (c+46,(vlTOPp->pt08__DOT__bd115200));
	vcdp->fullBit  (c+47,(vlTOPp->pt08__DOT__n_t_1x));
	vcdp->fullBit  (c+48,(vlTOPp->pt08__DOT__e11__DOT__tx_ratem));
	vcdp->fullBit  (c+49,((1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale) 
				     >> 2U))));
	vcdp->fullBus  (c+50,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale),3);
	vcdp->fullBit  (c+51,((1U & (~ ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale) 
					>> 2U)))));
	vcdp->fullBit  (c+52,(vlTOPp->pt08__DOT__bd38400));
	vcdp->fullBit  (c+53,((1U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto) 
				     >> 8U))));
	vcdp->fullBit  (c+54,((1U & (~ ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto) 
					>> 8U)))));
	vcdp->fullBus  (c+55,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto),9);
	vcdp->fullBit  (c+56,((1U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto) 
				     >> 5U))));
	vcdp->fullBit  (c+57,(vlTOPp->pt08__DOT__tx_rateo));
	vcdp->fullBit  (c+58,(vlTOPp->pt08__DOT__bd19200));
	vcdp->fullBit  (c+59,((1U & (~ ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop) 
					>> 1U)))));
	vcdp->fullBit  (c+60,((1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop)))));
	vcdp->fullBus  (c+61,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop),2);
	vcdp->fullBit  (c+62,((1U & (~ ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_stop) 
					>> 2U)))));
	vcdp->fullBit  (c+63,((1U & (~ (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_stop)))));
	vcdp->fullBus  (c+64,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_stop),3);
	vcdp->fullBit  (c+65,((1U & (~ ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_stop) 
					>> 1U)))));
	vcdp->fullBit  (c+66,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_active));
	vcdp->fullBit  (c+67,(vlTOPp->pt08__DOT__bd9600));
	vcdp->fullBit  (c+68,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__spike_detector));
	vcdp->fullBit  (c+69,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_last_unit));
	vcdp->fullBit  (c+70,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__keyboard_flag));
	vcdp->fullBit  (c+71,((1U & (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti02))));
	vcdp->fullBus  (c+72,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti02),3);
	vcdp->fullBus  (c+73,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti37),5);
	vcdp->fullBit  (c+74,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_shift));
	vcdp->fullBit  (c+75,(vlTOPp->pt08__DOT__bd4800));
	vcdp->fullBit  (c+76,(vlTOPp->pt08__DOT__bd2400));
	vcdp->fullBit  (c+77,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_active));
	vcdp->fullBit  (c+78,((1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_active)))));
	vcdp->fullBit  (c+79,(vlTOPp->pt08__DOT__bd1200));
	vcdp->fullBit  (c+80,(vlTOPp->pt08__DOT__bd600));
	vcdp->fullBit  (c+81,(vlTOPp->pt08__DOT__div11a));
	vcdp->fullBit  (c+82,(vlTOPp->pt08__DOT__div11b));
	vcdp->fullBit  (c+83,(vlTOPp->pt08__DOT__div11c));
	vcdp->fullBit  (c+84,(vlTOPp->pt08__DOT__div11d));
	vcdp->fullBit  (c+85,((1U & (~ ((((IData)(vlTOPp->pt08__DOT__div11b) 
					  & (IData)(vlTOPp->pt08__DOT__div11c)) 
					 & (IData)(vlTOPp->pt08__DOT__div11d))
					 ? (IData)(vlTOPp->pt08__DOT__div11a)
					 : ((~ (IData)(vlTOPp->pt08__DOT__div11a)) 
					    | ((IData)(vlTOPp->pt08__DOT__div11a) 
					       & (IData)(vlTOPp->pt08__DOT__div11c))))))));
	vcdp->fullBit  (c+86,((1U & (~ (((IData)(vlTOPp->pt08__DOT__div11c) 
					 & (IData)(vlTOPp->pt08__DOT__div11d))
					 ? (IData)(vlTOPp->pt08__DOT__div11b)
					 : ((~ (IData)(vlTOPp->pt08__DOT__div11b)) 
					    | ((IData)(vlTOPp->pt08__DOT__div11a) 
					       & (IData)(vlTOPp->pt08__DOT__div11c))))))));
	vcdp->fullBit  (c+87,((1U & (~ ((IData)(vlTOPp->pt08__DOT__div11d)
					 ? (IData)(vlTOPp->pt08__DOT__div11c)
					 : ((~ (IData)(vlTOPp->pt08__DOT__div11c)) 
					    | ((IData)(vlTOPp->pt08__DOT__div11a) 
					       & (IData)(vlTOPp->pt08__DOT__div11c))))))));
	vcdp->fullBit  (c+88,((1U & (~ ((IData)(vlTOPp->pt08__DOT__div11d) 
					| ((IData)(vlTOPp->pt08__DOT__div11a) 
					   & (IData)(vlTOPp->pt08__DOT__div11c)))))));
	vcdp->fullBit  (c+89,(vlTOPp->pt08__DOT__bd300));
	vcdp->fullBit  (c+90,(vlTOPp->clk));
	vcdp->fullBit  (c+91,(vlTOPp->dsrttl));
	vcdp->fullBit  (c+92,(vlTOPp->txdttl));
	vcdp->fullBit  (c+93,(vlTOPp->rxdttl));
	vcdp->fullBit  (c+94,(vlTOPp->rx_rate));
	vcdp->fullBit  (c+95,(vlTOPp->bmb0));
	vcdp->fullBit  (c+96,(vlTOPp->bmb1));
	vcdp->fullBit  (c+97,(vlTOPp->bmb2));
	vcdp->fullBit  (c+98,(vlTOPp->bmb3));
	vcdp->fullBit  (c+99,(vlTOPp->bmb4));
	vcdp->fullBit  (c+100,(vlTOPp->bmb5));
	vcdp->fullBit  (c+101,(vlTOPp->bmb6));
	vcdp->fullBit  (c+102,(vlTOPp->bmb7));
	vcdp->fullBit  (c+103,(vlTOPp->bmb8));
	vcdp->fullBit  (c+104,(vlTOPp->bmb9));
	vcdp->fullBit  (c+105,(vlTOPp->bmb10));
	vcdp->fullBit  (c+106,(vlTOPp->bmb11));
	vcdp->fullBit  (c+107,(vlTOPp->bmb3_l));
	vcdp->fullBit  (c+108,(vlTOPp->bmb4_l));
	vcdp->fullBit  (c+109,(vlTOPp->bmb5_l));
	vcdp->fullBit  (c+110,(vlTOPp->bmb6_l));
	vcdp->fullBit  (c+111,(vlTOPp->bmb7_l));
	vcdp->fullBit  (c+112,(vlTOPp->bmb8_l));
	vcdp->fullBit  (c+113,(vlTOPp->bac0));
	vcdp->fullBit  (c+114,(vlTOPp->bac1));
	vcdp->fullBit  (c+115,(vlTOPp->bac2));
	vcdp->fullBit  (c+116,(vlTOPp->bac3));
	vcdp->fullBit  (c+117,(vlTOPp->bac4));
	vcdp->fullBit  (c+118,(vlTOPp->bac5));
	vcdp->fullBit  (c+119,(vlTOPp->bac6));
	vcdp->fullBit  (c+120,(vlTOPp->bac7));
	vcdp->fullBit  (c+121,(vlTOPp->bac8));
	vcdp->fullBit  (c+122,(vlTOPp->bac9));
	vcdp->fullBit  (c+123,(vlTOPp->bac10));
	vcdp->fullBit  (c+124,(vlTOPp->bac11));
	vcdp->fullBit  (c+125,(vlTOPp->biop1));
	vcdp->fullBit  (c+126,(vlTOPp->biop2));
	vcdp->fullBit  (c+127,(vlTOPp->biop4));
	vcdp->fullBit  (c+128,(vlTOPp->bts1));
	vcdp->fullBit  (c+129,(vlTOPp->bts3));
	vcdp->fullBit  (c+130,(vlTOPp->initialize));
	vcdp->fullBit  (c+131,(vlTOPp->iob0_l));
	vcdp->fullBit  (c+132,(vlTOPp->iob1_l));
	vcdp->fullBit  (c+133,(vlTOPp->iob2_l));
	vcdp->fullBit  (c+134,(vlTOPp->iob3_l));
	vcdp->fullBit  (c+135,(vlTOPp->iob4_l));
	vcdp->fullBit  (c+136,(vlTOPp->iob5_l));
	vcdp->fullBit  (c+137,(vlTOPp->iob6_l));
	vcdp->fullBit  (c+138,(vlTOPp->iob7_l));
	vcdp->fullBit  (c+139,(vlTOPp->iob8_l));
	vcdp->fullBit  (c+140,(vlTOPp->iob9_l));
	vcdp->fullBit  (c+141,(vlTOPp->iob10_l));
	vcdp->fullBit  (c+142,(vlTOPp->iob11_l));
	vcdp->fullBit  (c+143,(vlTOPp->skip_l));
	vcdp->fullBit  (c+144,(vlTOPp->irq_l));
	vcdp->fullBit  (c+145,(vlTOPp->acclr_l));
	vcdp->fullBit  (c+146,(vlTOPp->run));
	vcdp->fullBit  (c+147,((1U & (~ (IData)(vlTOPp->initialize)))));
	vcdp->fullBit  (c+148,((1U & (~ (IData)(vlTOPp->bmb3)))));
	vcdp->fullBit  (c+149,((1U & (~ (IData)(vlTOPp->bmb4)))));
	vcdp->fullBit  (c+150,((1U & (~ (IData)(vlTOPp->bmb5)))));
	vcdp->fullBit  (c+151,((1U & (~ (IData)(vlTOPp->bmb6)))));
	vcdp->fullBit  (c+152,((1U & (~ (IData)(vlTOPp->bmb7)))));
	vcdp->fullBit  (c+153,((1U & (~ (IData)(vlTOPp->bmb8)))));
	vcdp->fullBit  (c+154,(((IData)(vlTOPp->pt08__DOT__rx_sel) 
				& (IData)(vlTOPp->biop2))));
	vcdp->fullBit  (c+155,((((IData)(vlTOPp->pt08__DOT__rx_sel) 
				 & (IData)(vlTOPp->biop2)) 
				& (~ (IData)(vlTOPp->initialize)))));
	vcdp->fullBit  (c+156,((1U & (~ (IData)(vlTOPp->rxdttl)))));
	vcdp->fullBit  (c+157,((1U & (~ (((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_shift) 
					  & (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__spike_detector)) 
					 & (~ (IData)(vlTOPp->rxdttl)))))));
	vcdp->fullBit  (c+158,(((IData)(vlTOPp->pt08__DOT__rx_sel) 
				& (IData)(vlTOPp->biop4))));
	vcdp->fullBit  (c+159,((1U & (~ (((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__teleprinter_flag) 
					  & (IData)(vlTOPp->pt08__DOT__tx_sel)) 
					 & (IData)(vlTOPp->biop1))))));
	vcdp->fullBus  (c+160,((((IData)(vlTOPp->bac4) 
				 << 7U) | (((IData)(vlTOPp->bac5) 
					    << 6U) 
					   | (((IData)(vlTOPp->bac6) 
					       << 5U) 
					      | (((IData)(vlTOPp->bac7) 
						  << 4U) 
						 | (((IData)(vlTOPp->bac8) 
						     << 3U) 
						    | (((IData)(vlTOPp->bac9) 
							<< 2U) 
						       | (((IData)(vlTOPp->bac10) 
							   << 1U) 
							  | (IData)(vlTOPp->bac11))))))))),8);
	vcdp->fullBit  (c+161,(((IData)(vlTOPp->pt08__DOT__tx_sel) 
				& (IData)(vlTOPp->biop4))));
	vcdp->fullBit  (c+162,((1U & (~ ((IData)(vlTOPp->pt08__DOT__tx_sel) 
					 & (IData)(vlTOPp->biop4))))));
	vcdp->fullBit  (c+163,(0U));
	vcdp->fullBit  (c+164,(1U));
	vcdp->fullBit  (c+165,(vlTOPp->pt08__DOT__e11__DOT__skip_));
	vcdp->fullBit  (c+166,(vlTOPp->pt08__DOT__e11__DOT__tx_rate));
    }
}
