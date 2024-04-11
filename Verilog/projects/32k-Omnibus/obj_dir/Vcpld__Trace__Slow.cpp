// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vcpld__Syms.h"


//======================

void Vcpld::trace (VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addCallback (&Vcpld::traceInit, &Vcpld::traceFull, &Vcpld::traceChg, this);
}
void Vcpld::traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->open()
    Vcpld* t=(Vcpld*)userthis;
    Vcpld__Syms* __restrict vlSymsp = t->__VlSymsp; // Setup global symbol table
    if (!Verilated::calcUnusedSigs()) vl_fatal(__FILE__,__LINE__,__FILE__,"Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    vcdp->scopeEscape(' ');
    t->traceInitThis (vlSymsp, vcdp, code);
    vcdp->scopeEscape('.');
}
void Vcpld::traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vcpld* t=(Vcpld*)userthis;
    Vcpld__Syms* __restrict vlSymsp = t->__VlSymsp; // Setup global symbol table
    t->traceFullThis (vlSymsp, vcdp, code);
}

//======================


void Vcpld::traceInitThis(Vcpld__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    vcdp->module(vlSymsp->name()); // Setup signal names
    // Body
    {
	vlTOPp->traceInitThis__1(vlSymsp, vcdp, code);
    }
}

void Vcpld::traceFullThis(Vcpld__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vlTOPp->traceFullThis__1(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vcpld::traceInitThis__1(Vcpld__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->declBit  (c+188,"cf0",-1);
	vcdp->declBit  (c+189,"pulse_la",-1);
	vcdp->declBit  (c+190,"data08_l",-1);
	vcdp->declBit  (c+191,"f_set_l",-1);
	vcdp->declBit  (c+192,"user_mode_l",-1);
	vcdp->declBit  (c+193,"md11_l",-1);
	vcdp->declBit  (c+194,"md10_l",-1);
	vcdp->declBit  (c+195,"md09_l",-1);
	vcdp->declBit  (c+196,"d_l",-1);
	vcdp->declBit  (c+197,"md08_l",-1);
	vcdp->declBit  (c+198,"f_l",-1);
	vcdp->declBit  (c+199,"ir01_l",-1);
	vcdp->declBit  (c+200,"ir00_l",-1);
	vcdp->declBit  (c+201,"ind2_l",-1);
	vcdp->declBit  (c+202,"ind1_l",-1);
	vcdp->declBit  (c+203,"cpma_disable_l",-1);
	vcdp->declBit  (c+204,"skip_l",-1);
	vcdp->declBit  (c+205,"initialize",-1);
	vcdp->declBit  (c+206,"int_rqst_l",-1);
	vcdp->declBit  (c+207,"ts3_l",-1);
	vcdp->declBit  (c+208,"internal_io_l",-1);
	vcdp->declBit  (c+209,"ts1_l",-1);
	vcdp->declBit  (c+210,"tp4",-1);
	vcdp->declBit  (c+211,"tp3",-1);
	vcdp->declBit  (c+212,"c1_l",-1);
	vcdp->declBit  (c+213,"tp2",-1);
	vcdp->declBit  (c+214,"c0_l",-1);
	vcdp->declBit  (c+215,"io_pause_l",-1);
	vcdp->declBit  (c+216,"df_enable",-1);
	vcdp->declBit  (c+217,"power_ok",-1);
	vcdp->declBit  (c+218,"data07_l",-1);
	vcdp->declBit  (c+219,"run_l",-1);
	vcdp->declBit  (c+220,"data06_l",-1);
	vcdp->declBit  (c+221,"data05_l",-1);
	vcdp->declBit  (c+222,"data04_l",-1);
	vcdp->declBit  (c+223,"int_in_prog_l",-1);
	vcdp->declBit  (c+224,"md07_l",-1);
	vcdp->declBit  (c+225,"md06_l",-1);
	vcdp->declBit  (c+226,"md05_l",-1);
	vcdp->declBit  (c+227,"md04_l",-1);
	vcdp->declBit  (c+228,"load_cont_l",-1);
	vcdp->declBit  (c+229,"tp_bb1",-1);
	vcdp->declBit  (c+230,"tp_ba1",-1);
	vcdp->declBit  (c+231,"data03_l",-1);
	vcdp->declBit  (c+232,"data02_l",-1);
	vcdp->declBit  (c+233,"data01_l",-1);
	vcdp->declBit  (c+234,"data00_l",-1);
	vcdp->declBit  (c+235,"md03_l",-1);
	vcdp->declBit  (c+236,"md02_l",-1);
	vcdp->declBit  (c+237,"md01_l",-1);
	vcdp->declBit  (c+238,"md00_l",-1);
	vcdp->declBit  (c+239,"ema2_l",-1);
	vcdp->declBit  (c+240,"ema1_l",-1);
	vcdp->declBit  (c+241,"ema0_l",-1);
	vcdp->declBit  (c+242,"tp_ab1",-1);
	vcdp->declBit  (c+243,"tp_aa1",-1);
	vcdp->declBit  (c+244,"rxdttl",-1);
	vcdp->declBit  (c+245,"txdttl",-1);
	vcdp->declBit  (c+246,"data11_l",-1);
	vcdp->declBit  (c+247,"key_ctl_l",-1);
	vcdp->declBit  (c+248,"data10_l",-1);
	vcdp->declBit  (c+249,"data09_l",-1);
	vcdp->declBit  (c+250,"clk",-1);
	vcdp->declBit  (c+251,"cf1",-1);
	vcdp->declBit  (c+252,"drive_ac",-1);
	{int i; for (i=0; i<12; i++) {
		vcdp->declBit  (c+253+i*1,"ac",(i+0));}}
	vcdp->declBit  (c+188,"cpld cf0",-1);
	vcdp->declBit  (c+189,"cpld pulse_la",-1);
	vcdp->declBit  (c+190,"cpld data08_l",-1);
	vcdp->declBit  (c+191,"cpld f_set_l",-1);
	vcdp->declBit  (c+192,"cpld user_mode_l",-1);
	vcdp->declBit  (c+193,"cpld md11_l",-1);
	vcdp->declBit  (c+194,"cpld md10_l",-1);
	vcdp->declBit  (c+195,"cpld md09_l",-1);
	vcdp->declBit  (c+196,"cpld d_l",-1);
	vcdp->declBit  (c+197,"cpld md08_l",-1);
	vcdp->declBit  (c+198,"cpld f_l",-1);
	vcdp->declBit  (c+199,"cpld ir01_l",-1);
	vcdp->declBit  (c+200,"cpld ir00_l",-1);
	vcdp->declBit  (c+201,"cpld ind2_l",-1);
	vcdp->declBit  (c+202,"cpld ind1_l",-1);
	vcdp->declBit  (c+203,"cpld cpma_disable_l",-1);
	vcdp->declBit  (c+204,"cpld skip_l",-1);
	vcdp->declBit  (c+205,"cpld initialize",-1);
	vcdp->declBit  (c+206,"cpld int_rqst_l",-1);
	vcdp->declBit  (c+207,"cpld ts3_l",-1);
	vcdp->declBit  (c+208,"cpld internal_io_l",-1);
	vcdp->declBit  (c+209,"cpld ts1_l",-1);
	vcdp->declBit  (c+210,"cpld tp4",-1);
	vcdp->declBit  (c+211,"cpld tp3",-1);
	vcdp->declBit  (c+212,"cpld c1_l",-1);
	vcdp->declBit  (c+213,"cpld tp2",-1);
	vcdp->declBit  (c+214,"cpld c0_l",-1);
	vcdp->declBit  (c+215,"cpld io_pause_l",-1);
	vcdp->declBit  (c+216,"cpld df_enable",-1);
	vcdp->declBit  (c+217,"cpld power_ok",-1);
	vcdp->declBit  (c+218,"cpld data07_l",-1);
	vcdp->declBit  (c+219,"cpld run_l",-1);
	vcdp->declBit  (c+220,"cpld data06_l",-1);
	vcdp->declBit  (c+221,"cpld data05_l",-1);
	vcdp->declBit  (c+222,"cpld data04_l",-1);
	vcdp->declBit  (c+223,"cpld int_in_prog_l",-1);
	vcdp->declBit  (c+224,"cpld md07_l",-1);
	vcdp->declBit  (c+225,"cpld md06_l",-1);
	vcdp->declBit  (c+226,"cpld md05_l",-1);
	vcdp->declBit  (c+227,"cpld md04_l",-1);
	vcdp->declBit  (c+228,"cpld load_cont_l",-1);
	vcdp->declBit  (c+229,"cpld tp_bb1",-1);
	vcdp->declBit  (c+230,"cpld tp_ba1",-1);
	vcdp->declBit  (c+231,"cpld data03_l",-1);
	vcdp->declBit  (c+232,"cpld data02_l",-1);
	vcdp->declBit  (c+233,"cpld data01_l",-1);
	vcdp->declBit  (c+234,"cpld data00_l",-1);
	vcdp->declBit  (c+235,"cpld md03_l",-1);
	vcdp->declBit  (c+236,"cpld md02_l",-1);
	vcdp->declBit  (c+237,"cpld md01_l",-1);
	vcdp->declBit  (c+238,"cpld md00_l",-1);
	vcdp->declBit  (c+239,"cpld ema2_l",-1);
	vcdp->declBit  (c+240,"cpld ema1_l",-1);
	vcdp->declBit  (c+241,"cpld ema0_l",-1);
	vcdp->declBit  (c+242,"cpld tp_ab1",-1);
	vcdp->declBit  (c+243,"cpld tp_aa1",-1);
	vcdp->declBit  (c+244,"cpld rxdttl",-1);
	vcdp->declBit  (c+245,"cpld txdttl",-1);
	vcdp->declBit  (c+246,"cpld data11_l",-1);
	vcdp->declBit  (c+247,"cpld key_ctl_l",-1);
	vcdp->declBit  (c+248,"cpld data10_l",-1);
	vcdp->declBit  (c+249,"cpld data09_l",-1);
	vcdp->declBit  (c+250,"cpld clk",-1);
	vcdp->declBit  (c+251,"cpld cf1",-1);
	vcdp->declBus  (c+1,"cpld md",-1,31,0);
	vcdp->declBit  (c+250,"cpld bd230400",-1);
	vcdp->declBit  (c+161,"cpld bd115200",-1);
	vcdp->declBit  (c+172,"cpld bd38400",-1);
	vcdp->declBit  (c+173,"cpld bd19200",-1);
	vcdp->declBit  (c+174,"cpld bd9600",-1);
	vcdp->declBit  (c+175,"cpld bd4800",-1);
	vcdp->declBit  (c+176,"cpld bd2400",-1);
	vcdp->declBit  (c+177,"cpld bd1200",-1);
	vcdp->declBit  (c+186,"cpld bd600",-1);
	vcdp->declBit  (c+187,"cpld bd300",-1);
	vcdp->declBit  (c+178,"cpld bd109",-1);
	vcdp->declBit  (c+171,"cpld n_t_1x",-1);
	vcdp->declBit  (c+2,"cpld n_t_2x",-1);
	vcdp->declBit  (c+188,"cpld sw1",-1);
	vcdp->declBit  (c+251,"cpld sw2",-1);
	vcdp->declBit  (c+243,"cpld sw3",-1);
	vcdp->declBit  (c+242,"cpld sw4",-1);
	vcdp->declBit  (c+230,"cpld sw5",-1);
	vcdp->declBit  (c+229,"cpld sw6",-1);
	vcdp->declBit  (c+3,"cpld md03_set",-1);
	vcdp->declBit  (c+4,"cpld md04_set",-1);
	vcdp->declBit  (c+5,"cpld md05_set",-1);
	vcdp->declBit  (c+6,"cpld md07_set",-1);
	vcdp->declBit  (c+7,"cpld md03_ok",-1);
	vcdp->declBit  (c+8,"cpld md04_ok",-1);
	vcdp->declBit  (c+9,"cpld md05_ok",-1);
	vcdp->declBit  (c+10,"cpld md06_in",-1);
	vcdp->declBit  (c+11,"cpld md07_in",-1);
	vcdp->declBit  (c+12,"cpld md08_in",-1);
	vcdp->declBit  (c+13,"cpld md06_out",-1);
	vcdp->declBit  (c+14,"cpld md07_out",-1);
	vcdp->declBit  (c+15,"cpld md08_out",-1);
	vcdp->declBit  (c+16,"cpld rx_sel_l",-1);
	vcdp->declBit  (c+17,"cpld tx_sel_l",-1);
	vcdp->declBit  (c+18,"cpld j23",-1);
	vcdp->declBit  (c+159,"cpld rx_rate",-1);
	vcdp->declBit  (c+160,"cpld h12",-1);
	vcdp->declBit  (c+19,"cpld ratex2",-1);
	vcdp->declBit  (c+178,"cpld div11a",-1);
	vcdp->declBit  (c+179,"cpld div11b",-1);
	vcdp->declBit  (c+180,"cpld div11c",-1);
	vcdp->declBit  (c+181,"cpld div11d",-1);
	vcdp->declBit  (c+182,"cpld ndiv11a",-1);
	vcdp->declBit  (c+183,"cpld ndiv11b",-1);
	vcdp->declBit  (c+184,"cpld ndiv11c",-1);
	vcdp->declBit  (c+185,"cpld ndiv11d",-1);
	vcdp->declBit  (c+252,"cpld drive_ac",-1);
	{int i; for (i=0; i<12; i++) {
		vcdp->declBit  (c+20+i*1,"cpld ac",(i+0));}}
	vcdp->declBit  (c+286,"cpld m8650d n3v3",-1);
	vcdp->declBit  (c+286,"cpld m8650d n_t_103x",-1);
	vcdp->declBit  (c+287,"cpld m8650d n_t_128x",-1);
	vcdp->declBit  (c+286,"cpld m8650d n_t_152x",-1);
	vcdp->declBit  (c+16,"cpld m8650d n_t_165x",-1);
	vcdp->declBit  (c+17,"cpld m8650d n_t_1x",-1);
	vcdp->declBit  (c+17,"cpld m8650d n_t_32x",-1);
	vcdp->declBit  (c+16,"cpld m8650d n_t_3x",-1);
	vcdp->declBit  (c+16,"cpld m8650d n_t_50x",-1);
	vcdp->declBit  (c+17,"cpld m8650d n_t_58x",-1);
	vcdp->declBit  (c+17,"cpld m8650d n_t_74x",-1);
	vcdp->declBit  (c+288,"cpld m8650d n_t_77x",-1);
	vcdp->declBit  (c+17,"cpld m8650d n_t_84x",-1);
	vcdp->declBit  (c+16,"cpld m8650d n_t_86x",-1);
	vcdp->declBit  (c+16,"cpld m8650d n_t_90x",-1);
	vcdp->declBit  (c+17,"cpld m8650d n_t_95x",-1);
	vcdp->declBit  (c+16,"cpld m8650d n_t_96x",-1);
	vcdp->declBit  (c+18,"cpld m8650d stp_mark",-1);
	vcdp->declBit  (c+160,"cpld m8650d tx_rate",-1);
	vcdp->declBit  (c+166,"cpld m8650d bd1200",-1);
	vcdp->declBit  (c+158,"cpld m8650d bd150",-1);
	vcdp->declBit  (c+165,"cpld m8650d bd2400",-1);
	vcdp->declBit  (c+168,"cpld m8650d bd300",-1);
	vcdp->declBit  (c+167,"cpld m8650d bd600",-1);
	vcdp->declBit  (c+214,"cpld m8650d c0_l",-1);
	vcdp->declBit  (c+212,"cpld m8650d c1_l",-1);
	vcdp->declBit  (c+222,"cpld m8650d data04_l",-1);
	vcdp->declBit  (c+221,"cpld m8650d data05_l",-1);
	vcdp->declBit  (c+220,"cpld m8650d data06_l",-1);
	vcdp->declBit  (c+218,"cpld m8650d data07_l",-1);
	vcdp->declBit  (c+190,"cpld m8650d data08_l",-1);
	vcdp->declBit  (c+249,"cpld m8650d data09_l",-1);
	vcdp->declBit  (c+248,"cpld m8650d data10_l",-1);
	vcdp->declBit  (c+246,"cpld m8650d data11_l",-1);
	vcdp->declBit  (c+32,"cpld m8650d dotpc_l",-1);
	vcdp->declBit  (c+289,"cpld m8650d eia_in",-1);
	vcdp->declBit  (c+290,"cpld m8650d eia_out",-1);
	vcdp->declBit  (c+205,"cpld m8650d initialize",-1);
	vcdp->declBit  (c+33,"cpld m8650d int_enab",-1);
	vcdp->declBit  (c+206,"cpld m8650d int_rqst_l",-1);
	vcdp->declBit  (c+208,"cpld m8650d internal_io_l",-1);
	vcdp->declBit  (c+215,"cpld m8650d io_pause_l",-1);
	vcdp->declBit  (c+245,"cpld m8650d line",-1);
	vcdp->declBit  (c+265,"cpld m8650d line_l",-1);
	vcdp->declBit  (c+291,"cpld m8650d md03",-1);
	vcdp->declBit  (c+292,"cpld m8650d md04",-1);
	vcdp->declBit  (c+293,"cpld m8650d md05",-1);
	vcdp->declBit  (c+294,"cpld m8650d md06",-1);
	vcdp->declBit  (c+295,"cpld m8650d md07",-1);
	vcdp->declBit  (c+197,"cpld m8650d md08",-1);
	vcdp->declBit  (c+195,"cpld m8650d md09",-1);
	vcdp->declBit  (c+194,"cpld m8650d md10",-1);
	vcdp->declBit  (c+193,"cpld m8650d md11",-1);
	vcdp->declBit  (c+296,"cpld m8650d n15v",-1);
	vcdp->declBit  (c+34,"cpld m8650d n_t_119x",-1);
	vcdp->declBit  (c+18,"cpld m8650d n_t_146x",-1);
	vcdp->declBit  (c+266,"cpld m8650d n_t_161x",-1);
	vcdp->declBit  (c+160,"cpld m8650d n_t_162x",-1);
	vcdp->declBit  (c+35,"cpld m8650d n_t_27x",-1);
	vcdp->declBit  (c+36,"cpld m8650d n_t_30x",-1);
	vcdp->declBit  (c+267,"cpld m8650d n_t_45x",-1);
	vcdp->declBit  (c+268,"cpld m8650d n_t_59x",-1);
	vcdp->declBit  (c+297,"cpld m8650d n_t_83x",-1);
	vcdp->declBit  (c+269,"cpld m8650d n_t_89x",-1);
	vcdp->declBit  (c+270,"cpld m8650d n_t_92x",-1);
	vcdp->declBit  (c+271,"cpld m8650d n_t_93x",-1);
	vcdp->declBit  (c+217,"cpld m8650d power_ok",-1);
	vcdp->declBit  (c+37,"cpld m8650d r_run_l",-1);
	vcdp->declBit  (c+298,"cpld m8650d reader_run",-1);
	vcdp->declBit  (c+299,"cpld m8650d reader_run_or",-1);
	vcdp->declBit  (c+300,"cpld m8650d rtsdtr",-1);
	vcdp->declBit  (c+287,"cpld m8650d rx20ma_data",-1);
	vcdp->declBit  (c+301,"cpld m8650d rx_20ma",-1);
	vcdp->declBit  (c+302,"cpld m8650d rx_20ma_or",-1);
	vcdp->declBit  (c+38,"cpld m8650d rx_active",-1);
	vcdp->declBit  (c+303,"cpld m8650d rx_data",-1);
	vcdp->declBit  (c+159,"cpld m8650d rx_rate",-1);
	vcdp->declBit  (c+244,"cpld m8650d serial_in",-1);
	vcdp->declBit  (c+204,"cpld m8650d skip_l",-1);
	vcdp->declBit  (c+19,"cpld m8650d testp4",-1);
	vcdp->declBit  (c+211,"cpld m8650d tp3",-1);
	vcdp->declBit  (c+304,"cpld m8650d tx_20ma",-1);
	vcdp->declBit  (c+305,"cpld m8650d tx_20ma_or",-1);
	vcdp->declBit  (c+39,"cpld m8650d tx_active",-1);
	vcdp->declBit  (c+40,"cpld m8650d tx_div_l",-1);
	vcdp->declBit  (c+41,"cpld m8650d tx_sel_l",-1);
	vcdp->declBit  (c+42,"cpld m8650d ck_pulse_m",-1);
	vcdp->declBit  (c+43,"cpld m8650d enab_m",-1);
	vcdp->declBit  (c+306,"cpld m8650d gdollar_4_m",-1);
	vcdp->declBit  (c+307,"cpld m8650d gdollar_5_m",-1);
	vcdp->declBit  (c+308,"cpld m8650d gdollar_6_m",-1);
	vcdp->declBit  (c+44,"cpld m8650d gdollar_7_m",-1);
	vcdp->declBit  (c+45,"cpld m8650d gdollar_8_m",-1);
	vcdp->declBit  (c+46,"cpld m8650d int_enab_l_m",-1);
	vcdp->declBit  (c+47,"cpld m8650d last_unit_m",-1);
	vcdp->declBit  (c+48,"cpld m8650d line_m",-1);
	vcdp->declBit  (c+49,"cpld m8650d n_t_119x_m",-1);
	vcdp->declBit  (c+50,"cpld m8650d n_t_146x_m",-1);
	vcdp->declBit  (c+309,"cpld m8650d n_t_154x_m",-1);
	vcdp->declBit  (c+51,"cpld m8650d n_t_30x_m",-1);
	vcdp->declBit  (c+52,"cpld m8650d n_t_34x_m",-1);
	vcdp->declBit  (c+53,"cpld m8650d n_t_35x_m",-1);
	vcdp->declBit  (c+54,"cpld m8650d n_t_36x_m",-1);
	vcdp->declBit  (c+55,"cpld m8650d n_t_37x_m",-1);
	vcdp->declBit  (c+56,"cpld m8650d n_t_38x_m",-1);
	vcdp->declBit  (c+57,"cpld m8650d n_t_39x_m",-1);
	vcdp->declBit  (c+58,"cpld m8650d n_t_40x_m",-1);
	vcdp->declBit  (c+59,"cpld m8650d n_t_43x_m",-1);
	vcdp->declBit  (c+60,"cpld m8650d n_t_56x_m",-1);
	vcdp->declBit  (c+61,"cpld m8650d n_t_60x_m",-1);
	vcdp->declBit  (c+62,"cpld m8650d n_t_61x_m",-1);
	vcdp->declBit  (c+63,"cpld m8650d n_t_62x_m",-1);
	vcdp->declBit  (c+64,"cpld m8650d n_t_63x_m",-1);
	vcdp->declBit  (c+65,"cpld m8650d n_t_65x_m",-1);
	vcdp->declBit  (c+66,"cpld m8650d n_t_66x_m",-1);
	vcdp->declBit  (c+67,"cpld m8650d n_t_75x_m",-1);
	vcdp->declBit  (c+68,"cpld m8650d n_t_88x_m",-1);
	vcdp->declBit  (c+69,"cpld m8650d p_pulse_l_m",-1);
	vcdp->declBit  (c+70,"cpld m8650d r_run_l_m",-1);
	vcdp->declBit  (c+71,"cpld m8650d rflg_l_m",-1);
	vcdp->declBit  (c+72,"cpld m8650d rx_active_m",-1);
	vcdp->declBit  (c+73,"cpld m8650d rx_div_m",-1);
	vcdp->declBit  (c+74,"cpld m8650d spike_det_l_m",-1);
	vcdp->declBit  (c+75,"cpld m8650d start_l_m",-1);
	vcdp->declBit  (c+76,"cpld m8650d tflg_l_m",-1);
	vcdp->declBit  (c+77,"cpld m8650d tx_active_l_m",-1);
	vcdp->declBit  (c+78,"cpld m8650d tx_data_m",-1);
	vcdp->declBit  (c+79,"cpld m8650d tx_div_m",-1);
	vcdp->declBit  (c+80,"cpld m8650d rx_div",-1);
	vcdp->declBit  (c+81,"cpld m8650d ck_pulse",-1);
	vcdp->declBit  (c+82,"cpld m8650d n_t_43x",-1);
	vcdp->declBit  (c+83,"cpld m8650d n_t_75x",-1);
	vcdp->declBit  (c+162,"cpld m8650d n_t_155x",-1);
	vcdp->declBit  (c+163,"cpld m8650d gdollar_0",-1);
	vcdp->declBit  (c+164,"cpld m8650d gdollar_1",-1);
	vcdp->declBit  (c+84,"cpld m8650d n_t_34x",-1);
	vcdp->declBit  (c+85,"cpld m8650d n_t_36x",-1);
	vcdp->declBit  (c+86,"cpld m8650d n_t_35x",-1);
	vcdp->declBit  (c+87,"cpld m8650d p_pulse_l",-1);
	vcdp->declBit  (c+88,"cpld m8650d last_unit",-1);
	vcdp->declBit  (c+89,"cpld m8650d n_t_88x",-1);
	vcdp->declBit  (c+90,"cpld m8650d n_t_37x",-1);
	vcdp->declBit  (c+91,"cpld m8650d n_t_38x",-1);
	vcdp->declBit  (c+92,"cpld m8650d n_t_39x",-1);
	vcdp->declBit  (c+93,"cpld m8650d n_t_40x",-1);
	vcdp->declBit  (c+94,"cpld m8650d tx_div",-1);
	vcdp->declBit  (c+95,"cpld m8650d spike_det_l",-1);
	vcdp->declBit  (c+169,"cpld m8650d gdollar_2",-1);
	vcdp->declBit  (c+170,"cpld m8650d gdollar_3",-1);
	vcdp->declBit  (c+96,"cpld m8650d tx_active_l",-1);
	vcdp->declBit  (c+97,"cpld m8650d start_l",-1);
	vcdp->declBit  (c+306,"cpld m8650d gdollar_4",-1);
	vcdp->declBit  (c+307,"cpld m8650d gdollar_5",-1);
	vcdp->declBit  (c+308,"cpld m8650d gdollar_6",-1);
	vcdp->declBit  (c+309,"cpld m8650d n_t_154x",-1);
	vcdp->declBit  (c+98,"cpld m8650d gdollar_7",-1);
	vcdp->declBit  (c+99,"cpld m8650d gdollar_8",-1);
	vcdp->declBit  (c+100,"cpld m8650d n_t_60x",-1);
	vcdp->declBit  (c+101,"cpld m8650d n_t_62x",-1);
	vcdp->declBit  (c+102,"cpld m8650d n_t_56x",-1);
	vcdp->declBit  (c+103,"cpld m8650d n_t_61x",-1);
	vcdp->declBit  (c+104,"cpld m8650d enab",-1);
	vcdp->declBit  (c+105,"cpld m8650d n_t_63x",-1);
	vcdp->declBit  (c+106,"cpld m8650d n_t_65x",-1);
	vcdp->declBit  (c+107,"cpld m8650d n_t_66x",-1);
	vcdp->declBit  (c+108,"cpld m8650d tx_data",-1);
	vcdp->declBit  (c+109,"cpld m8650d tflg_l",-1);
	vcdp->declBit  (c+110,"cpld m8650d int_enab_l",-1);
	vcdp->declBit  (c+111,"cpld m8650d rflg_l",-1);
	vcdp->declBit  (c+112,"cpld m8650d ckkcc_l",-1);
	vcdp->declBit  (c+272,"cpld m8650d ckkcf",-1);
	vcdp->declBit  (c+113,"cpld m8650d ckkie",-1);
	vcdp->declBit  (c+273,"cpld m8650d cktcf",-1);
	vcdp->declBit  (c+114,"cpld m8650d cktfl",-1);
	vcdp->declBit  (c+115,"cpld m8650d dokcc",-1);
	vcdp->declBit  (c+116,"cpld m8650d dokrs",-1);
	vcdp->declBit  (c+117,"cpld m8650d dotcf",-1);
	vcdp->declBit  (c+118,"cpld m8650d dotpc",-1);
	vcdp->declBit  (c+119,"cpld m8650d flgs",-1);
	vcdp->declBit  (c+120,"cpld m8650d kcc_l",-1);
	vcdp->declBit  (c+121,"cpld m8650d kcf_l",-1);
	vcdp->declBit  (c+122,"cpld m8650d kie_l",-1);
	vcdp->declBit  (c+123,"cpld m8650d krb_l",-1);
	vcdp->declBit  (c+124,"cpld m8650d krs_l",-1);
	vcdp->declBit  (c+125,"cpld m8650d ksf_l",-1);
	vcdp->declBit  (c+126,"cpld m8650d kskp",-1);
	vcdp->declBit  (c+127,"cpld m8650d n_t_108x",-1);
	vcdp->declBit  (c+128,"cpld m8650d n_t_16x",-1);
	vcdp->declBit  (c+129,"cpld m8650d n_t_18x",-1);
	vcdp->declBit  (c+130,"cpld m8650d n_t_19x",-1);
	vcdp->declBit  (c+131,"cpld m8650d n_t_21x",-1);
	vcdp->declBit  (c+132,"cpld m8650d n_t_23x",-1);
	vcdp->declBit  (c+133,"cpld m8650d n_t_24x",-1);
	vcdp->declBit  (c+134,"cpld m8650d n_t_25x",-1);
	vcdp->declBit  (c+135,"cpld m8650d n_t_28x",-1);
	vcdp->declBit  (c+274,"cpld m8650d n_t_29x",-1);
	vcdp->declBit  (c+136,"cpld m8650d n_t_41x",-1);
	vcdp->declBit  (c+137,"cpld m8650d n_t_42x",-1);
	vcdp->declBit  (c+275,"cpld m8650d n_t_46x",-1);
	vcdp->declBit  (c+276,"cpld m8650d n_t_47x",-1);
	vcdp->declBit  (c+277,"cpld m8650d n_t_48x",-1);
	vcdp->declBit  (c+278,"cpld m8650d n_t_49x",-1);
	vcdp->declBit  (c+279,"cpld m8650d n_t_52x",-1);
	vcdp->declBit  (c+280,"cpld m8650d n_t_53x",-1);
	vcdp->declBit  (c+281,"cpld m8650d n_t_54x",-1);
	vcdp->declBit  (c+282,"cpld m8650d n_t_55x",-1);
	vcdp->declBit  (c+138,"cpld m8650d n_t_57x",-1);
	vcdp->declBit  (c+139,"cpld m8650d n_t_68x",-1);
	vcdp->declBit  (c+140,"cpld m8650d n_t_69x",-1);
	vcdp->declBit  (c+141,"cpld m8650d n_t_70x",-1);
	vcdp->declBit  (c+142,"cpld m8650d n_t_71x",-1);
	vcdp->declBit  (c+143,"cpld m8650d n_t_76x",-1);
	vcdp->declBit  (c+144,"cpld m8650d n_t_80x",-1);
	vcdp->declBit  (c+283,"cpld m8650d n_t_81x",-1);
	vcdp->declBit  (c+284,"cpld m8650d n_t_8x",-1);
	vcdp->declBit  (c+145,"cpld m8650d n_t_91x",-1);
	vcdp->declBit  (c+146,"cpld m8650d n_t_94x",-1);
	vcdp->declBit  (c+147,"cpld m8650d rx_bot",-1);
	vcdp->declBit  (c+148,"cpld m8650d rx_sel_l",-1);
	vcdp->declBit  (c+149,"cpld m8650d selected_l",-1);
	vcdp->declBit  (c+150,"cpld m8650d tcf_l",-1);
	vcdp->declBit  (c+151,"cpld m8650d tfl_l",-1);
	vcdp->declBit  (c+152,"cpld m8650d tkskp",-1);
	vcdp->declBit  (c+153,"cpld m8650d tls_l",-1);
	vcdp->declBit  (c+154,"cpld m8650d tpc_l",-1);
	vcdp->declBit  (c+155,"cpld m8650d tsf_l",-1);
	vcdp->declBit  (c+156,"cpld m8650d tsk_l",-1);
	vcdp->declBit  (c+157,"cpld m8650d tskp",-1);
	vcdp->declBit  (c+285,"cpld m8650d n_t_60x_d",-1);
	vcdp->declBit  (c+214,"cpld pup c0_low",-1);
	vcdp->declBit  (c+212,"cpld pup c1_low",-1);
	vcdp->declBit  (c+234,"cpld pup data00_low",-1);
	vcdp->declBit  (c+233,"cpld pup data01_low",-1);
	vcdp->declBit  (c+232,"cpld pup data02_low",-1);
	vcdp->declBit  (c+231,"cpld pup data03_low",-1);
	vcdp->declBit  (c+222,"cpld pup data04_low",-1);
	vcdp->declBit  (c+221,"cpld pup data05_low",-1);
	vcdp->declBit  (c+220,"cpld pup data06_low",-1);
	vcdp->declBit  (c+218,"cpld pup data07_low",-1);
	vcdp->declBit  (c+190,"cpld pup data08_low",-1);
	vcdp->declBit  (c+249,"cpld pup data09_low",-1);
	vcdp->declBit  (c+248,"cpld pup data10_low",-1);
	vcdp->declBit  (c+246,"cpld pup data11_low",-1);
	vcdp->declBit  (c+208,"cpld pup internal_io_low",-1);
	vcdp->declBit  (c+206,"cpld pup interrupt_low",-1);
	vcdp->declBit  (c+204,"cpld pup skip_low",-1);
    }
}

void Vcpld::traceFullThis__1(Vcpld__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->fullBus  (c+1,(vlTOPp->cpld__DOT__md),32);
	vcdp->fullBit  (c+2,(vlTOPp->cpld__DOT__n_t_2x));
	vcdp->fullBit  (c+3,(vlTOPp->cpld__DOT__md03_set));
	vcdp->fullBit  (c+4,(vlTOPp->cpld__DOT__md04_set));
	vcdp->fullBit  (c+5,(vlTOPp->cpld__DOT__md05_set));
	vcdp->fullBit  (c+6,(vlTOPp->cpld__DOT__md07_set));
	vcdp->fullBit  (c+7,(vlTOPp->cpld__DOT__md03_ok));
	vcdp->fullBit  (c+8,(vlTOPp->cpld__DOT__md04_ok));
	vcdp->fullBit  (c+9,(vlTOPp->cpld__DOT__md05_ok));
	vcdp->fullBit  (c+10,(vlTOPp->cpld__DOT__md06_in));
	vcdp->fullBit  (c+11,(vlTOPp->cpld__DOT__md07_in));
	vcdp->fullBit  (c+12,(vlTOPp->cpld__DOT__md08_in));
	vcdp->fullBit  (c+13,(vlTOPp->cpld__DOT__md06_out));
	vcdp->fullBit  (c+14,(vlTOPp->cpld__DOT__md07_out));
	vcdp->fullBit  (c+15,((1U & (~ (IData)(vlTOPp->cpld__DOT__md08_in)))));
	vcdp->fullBit  (c+16,(vlTOPp->cpld__DOT__rx_sel_l));
	vcdp->fullBit  (c+17,(vlTOPp->cpld__DOT__tx_sel_l));
	vcdp->fullBit  (c+18,(vlTOPp->cpld__DOT__j23));
	vcdp->fullBit  (c+19,(vlTOPp->cpld__DOT__ratex2));
	vcdp->fullBit  (c+20,(vlTOPp->cpld__DOT__ac[0]));
	vcdp->fullBit  (c+21,(vlTOPp->cpld__DOT__ac[1]));
	vcdp->fullBit  (c+22,(vlTOPp->cpld__DOT__ac[2]));
	vcdp->fullBit  (c+23,(vlTOPp->cpld__DOT__ac[3]));
	vcdp->fullBit  (c+24,(vlTOPp->cpld__DOT__ac[4]));
	vcdp->fullBit  (c+25,(vlTOPp->cpld__DOT__ac[5]));
	vcdp->fullBit  (c+26,(vlTOPp->cpld__DOT__ac[6]));
	vcdp->fullBit  (c+27,(vlTOPp->cpld__DOT__ac[7]));
	vcdp->fullBit  (c+28,(vlTOPp->cpld__DOT__ac[8]));
	vcdp->fullBit  (c+29,(vlTOPp->cpld__DOT__ac[9]));
	vcdp->fullBit  (c+30,(vlTOPp->cpld__DOT__ac[10]));
	vcdp->fullBit  (c+31,(vlTOPp->cpld__DOT__ac[11]));
	vcdp->fullBit  (c+32,((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)))));
	vcdp->fullBit  (c+33,((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__int_enab_l)))));
	vcdp->fullBit  (c+34,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_119x));
	vcdp->fullBit  (c+35,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_27x__out__out14));
	vcdp->fullBit  (c+36,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_30x));
	vcdp->fullBit  (c+37,(vlTOPp->cpld__DOT__m8650d__DOT__r_run_l));
	vcdp->fullBit  (c+38,(vlTOPp->cpld__DOT__m8650d__DOT__rx_active));
	vcdp->fullBit  (c+39,((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l)))));
	vcdp->fullBit  (c+40,((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_div)))));
	vcdp->fullBit  (c+41,(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18));
	vcdp->fullBit  (c+42,(vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse_m));
	vcdp->fullBit  (c+43,(vlTOPp->cpld__DOT__m8650d__DOT__enab_m));
	vcdp->fullBit  (c+44,(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_7_m));
	vcdp->fullBit  (c+45,(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_8_m));
	vcdp->fullBit  (c+46,(vlTOPp->cpld__DOT__m8650d__DOT__int_enab_l_m));
	vcdp->fullBit  (c+47,(vlTOPp->cpld__DOT__m8650d__DOT__last_unit_m));
	vcdp->fullBit  (c+48,(vlTOPp->cpld__DOT__m8650d__DOT__line_m));
	vcdp->fullBit  (c+49,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_119x_m));
	vcdp->fullBit  (c+50,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_146x_m));
	vcdp->fullBit  (c+51,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_30x_m));
	vcdp->fullBit  (c+52,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_34x_m));
	vcdp->fullBit  (c+53,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_35x_m));
	vcdp->fullBit  (c+54,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_36x_m));
	vcdp->fullBit  (c+55,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_37x_m));
	vcdp->fullBit  (c+56,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_38x_m));
	vcdp->fullBit  (c+57,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_39x_m));
	vcdp->fullBit  (c+58,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_40x_m));
	vcdp->fullBit  (c+59,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x_m));
	vcdp->fullBit  (c+60,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_56x_m));
	vcdp->fullBit  (c+61,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_60x_m));
	vcdp->fullBit  (c+62,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_61x_m));
	vcdp->fullBit  (c+63,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_62x_m));
	vcdp->fullBit  (c+64,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_63x_m));
	vcdp->fullBit  (c+65,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_65x_m));
	vcdp->fullBit  (c+66,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_66x_m));
	vcdp->fullBit  (c+67,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x_m));
	vcdp->fullBit  (c+68,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x_m));
	vcdp->fullBit  (c+69,(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l_m));
	vcdp->fullBit  (c+70,(vlTOPp->cpld__DOT__m8650d__DOT__r_run_l_m));
	vcdp->fullBit  (c+71,(vlTOPp->cpld__DOT__m8650d__DOT__rflg_l_m));
	vcdp->fullBit  (c+72,(vlTOPp->cpld__DOT__m8650d__DOT__rx_active_m));
	vcdp->fullBit  (c+73,(vlTOPp->cpld__DOT__m8650d__DOT__rx_div_m));
	vcdp->fullBit  (c+74,(vlTOPp->cpld__DOT__m8650d__DOT__spike_det_l_m));
	vcdp->fullBit  (c+75,(vlTOPp->cpld__DOT__m8650d__DOT__start_l_m));
	vcdp->fullBit  (c+76,(vlTOPp->cpld__DOT__m8650d__DOT__tflg_l_m));
	vcdp->fullBit  (c+77,(vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l_m));
	vcdp->fullBit  (c+78,(vlTOPp->cpld__DOT__m8650d__DOT__tx_data_m));
	vcdp->fullBit  (c+79,(vlTOPp->cpld__DOT__m8650d__DOT__tx_div_m));
	vcdp->fullBit  (c+80,(vlTOPp->cpld__DOT__m8650d__DOT__rx_div));
	vcdp->fullBit  (c+81,(vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse));
	vcdp->fullBit  (c+82,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x));
	vcdp->fullBit  (c+83,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x));
	vcdp->fullBit  (c+84,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_34x));
	vcdp->fullBit  (c+85,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_36x));
	vcdp->fullBit  (c+86,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_35x));
	vcdp->fullBit  (c+87,(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l));
	vcdp->fullBit  (c+88,(vlTOPp->cpld__DOT__m8650d__DOT__last_unit));
	vcdp->fullBit  (c+89,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x));
	vcdp->fullBit  (c+90,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_37x));
	vcdp->fullBit  (c+91,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_38x));
	vcdp->fullBit  (c+92,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_39x));
	vcdp->fullBit  (c+93,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_40x));
	vcdp->fullBit  (c+94,(vlTOPp->cpld__DOT__m8650d__DOT__tx_div));
	vcdp->fullBit  (c+95,(vlTOPp->cpld__DOT__m8650d__DOT__spike_det_l));
	vcdp->fullBit  (c+96,(vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l));
	vcdp->fullBit  (c+97,(vlTOPp->cpld__DOT__m8650d__DOT__start_l));
	vcdp->fullBit  (c+98,(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_7));
	vcdp->fullBit  (c+99,(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_8));
	vcdp->fullBit  (c+100,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_60x));
	vcdp->fullBit  (c+101,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_62x));
	vcdp->fullBit  (c+102,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_56x));
	vcdp->fullBit  (c+103,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_61x));
	vcdp->fullBit  (c+104,(vlTOPp->cpld__DOT__m8650d__DOT__enab));
	vcdp->fullBit  (c+105,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_63x));
	vcdp->fullBit  (c+106,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_65x));
	vcdp->fullBit  (c+107,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_66x));
	vcdp->fullBit  (c+108,(vlTOPp->cpld__DOT__m8650d__DOT__tx_data));
	vcdp->fullBit  (c+109,(vlTOPp->cpld__DOT__m8650d__DOT__tflg_l));
	vcdp->fullBit  (c+110,(vlTOPp->cpld__DOT__m8650d__DOT__int_enab_l));
	vcdp->fullBit  (c+111,(vlTOPp->cpld__DOT__m8650d__DOT__rflg_l));
	vcdp->fullBit  (c+112,(vlTOPp->cpld__DOT__m8650d__DOT__ckkcc_l));
	vcdp->fullBit  (c+113,(vlTOPp->cpld__DOT__m8650d__DOT__ckkie));
	vcdp->fullBit  (c+114,(vlTOPp->cpld__DOT__m8650d__DOT__cktfl));
	vcdp->fullBit  (c+115,(vlTOPp->cpld__DOT__m8650d__DOT__dokcc));
	vcdp->fullBit  (c+116,(vlTOPp->cpld__DOT__m8650d__DOT__dokrs));
	vcdp->fullBit  (c+117,((1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__tls_l) 
					 & (~ ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
						 & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
						& (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x)) 
					       & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))))))));
	vcdp->fullBit  (c+118,(vlTOPp->cpld__DOT__m8650d__DOT__dotpc));
	vcdp->fullBit  (c+119,(vlTOPp->cpld__DOT__m8650d__DOT__flgs));
	vcdp->fullBit  (c+120,((1U & (~ ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)) 
					   & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
					  & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x)) 
					 & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))))));
	vcdp->fullBit  (c+121,((1U & (~ ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)) 
					   & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
					  & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
					 & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))))));
	vcdp->fullBit  (c+122,((1U & (~ ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)) 
					   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x)) 
					  & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
					 & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x))))));
	vcdp->fullBit  (c+123,(vlTOPp->cpld__DOT__m8650d__DOT__krb_l));
	vcdp->fullBit  (c+124,((1U & (~ ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)) 
					   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x)) 
					  & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
					 & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))))));
	vcdp->fullBit  (c+125,((1U & (~ ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)) 
					   & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
					  & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
					 & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x))))));
	vcdp->fullBit  (c+126,((1U & (~ ((~ ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)) 
					       & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
					      & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
					     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x))) 
					 | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rflg_l))))));
	vcdp->fullBit  (c+127,((1U & (~ (((IData)(vlTOPp->cpld__DOT__j23) 
					  & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__enab)) 
					 | ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l)) 
					    & (~ (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_68x) 
						   & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_div))) 
						  & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_69x)))))))));
	vcdp->fullBit  (c+128,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_16x));
	vcdp->fullBit  (c+129,((1U & (~ (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_68x) 
					  & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_div))) 
					 & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_69x))))));
	vcdp->fullBit  (c+130,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_19x));
	vcdp->fullBit  (c+131,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x));
	vcdp->fullBit  (c+132,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x));
	vcdp->fullBit  (c+133,((1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_69x) 
					 & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_68x))))));
	vcdp->fullBit  (c+134,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x));
	vcdp->fullBit  (c+135,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_28x));
	vcdp->fullBit  (c+136,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x));
	vcdp->fullBit  (c+137,((1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l) 
					 | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x))))));
	vcdp->fullBit  (c+138,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x));
	vcdp->fullBit  (c+139,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_68x));
	vcdp->fullBit  (c+140,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_69x));
	vcdp->fullBit  (c+141,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_70x));
	vcdp->fullBit  (c+142,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_71x));
	vcdp->fullBit  (c+143,((1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_div) 
					 & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_27x__out__out14))))));
	vcdp->fullBit  (c+144,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_80x));
	vcdp->fullBit  (c+145,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_91x));
	vcdp->fullBit  (c+146,((1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_div) 
					 & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l)))))));
	vcdp->fullBit  (c+147,((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_40x)))));
	vcdp->fullBit  (c+148,(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l));
	vcdp->fullBit  (c+149,(vlTOPp->cpld__DOT__m8650d__DOT__selected_l));
	vcdp->fullBit  (c+150,((1U & (~ ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
					   & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
					  & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x)) 
					 & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))))));
	vcdp->fullBit  (c+151,((1U & (~ ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
					   & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
					  & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
					 & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))))));
	vcdp->fullBit  (c+152,(vlTOPp->cpld__DOT__m8650d__DOT__tkskp));
	vcdp->fullBit  (c+153,(vlTOPp->cpld__DOT__m8650d__DOT__tls_l));
	vcdp->fullBit  (c+154,((1U & (~ ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
					   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x)) 
					  & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
					 & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))))));
	vcdp->fullBit  (c+155,((1U & (~ ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
					   & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
					  & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
					 & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x))))));
	vcdp->fullBit  (c+156,((1U & (~ ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
					   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x)) 
					  & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
					 & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x))))));
	vcdp->fullBit  (c+157,((1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__tflg_l) 
					 | (~ ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
						 & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
						& (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
					       & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x))))))));
	vcdp->fullBit  (c+158,(vlTOPp->cpld__DOT__m8650d__DOT__bd150));
	vcdp->fullBit  (c+159,(vlTOPp->cpld__DOT__rx_rate));
	vcdp->fullBit  (c+160,(vlTOPp->cpld__DOT__h12));
	vcdp->fullBit  (c+161,(vlTOPp->cpld__DOT__bd115200));
	vcdp->fullBit  (c+162,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_155x));
	vcdp->fullBit  (c+163,(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_0));
	vcdp->fullBit  (c+164,(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_1));
	vcdp->fullBit  (c+165,(vlTOPp->cpld__DOT__m8650d__DOT__bd2400));
	vcdp->fullBit  (c+166,(vlTOPp->cpld__DOT__m8650d__DOT__bd1200));
	vcdp->fullBit  (c+167,(vlTOPp->cpld__DOT__m8650d__DOT__bd600));
	vcdp->fullBit  (c+168,(vlTOPp->cpld__DOT__m8650d__DOT__bd300));
	vcdp->fullBit  (c+169,(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2));
	vcdp->fullBit  (c+170,(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3));
	vcdp->fullBit  (c+171,(vlTOPp->cpld__DOT__n_t_1x));
	vcdp->fullBit  (c+172,(vlTOPp->cpld__DOT__bd38400));
	vcdp->fullBit  (c+173,(vlTOPp->cpld__DOT__bd19200));
	vcdp->fullBit  (c+174,(vlTOPp->cpld__DOT__bd9600));
	vcdp->fullBit  (c+175,(vlTOPp->cpld__DOT__bd4800));
	vcdp->fullBit  (c+176,(vlTOPp->cpld__DOT__bd2400));
	vcdp->fullBit  (c+177,(vlTOPp->cpld__DOT__bd1200));
	vcdp->fullBit  (c+178,(vlTOPp->cpld__DOT__div11a));
	vcdp->fullBit  (c+179,(vlTOPp->cpld__DOT__div11b));
	vcdp->fullBit  (c+180,(vlTOPp->cpld__DOT__div11c));
	vcdp->fullBit  (c+181,(vlTOPp->cpld__DOT__div11d));
	vcdp->fullBit  (c+182,((1U & (~ ((((IData)(vlTOPp->cpld__DOT__div11b) 
					   & (IData)(vlTOPp->cpld__DOT__div11c)) 
					  & (IData)(vlTOPp->cpld__DOT__div11d))
					  ? (IData)(vlTOPp->cpld__DOT__div11a)
					  : ((~ (IData)(vlTOPp->cpld__DOT__div11a)) 
					     | ((IData)(vlTOPp->cpld__DOT__div11a) 
						& (IData)(vlTOPp->cpld__DOT__div11c))))))));
	vcdp->fullBit  (c+183,((1U & (~ (((IData)(vlTOPp->cpld__DOT__div11c) 
					  & (IData)(vlTOPp->cpld__DOT__div11d))
					  ? (IData)(vlTOPp->cpld__DOT__div11b)
					  : ((~ (IData)(vlTOPp->cpld__DOT__div11b)) 
					     | ((IData)(vlTOPp->cpld__DOT__div11a) 
						& (IData)(vlTOPp->cpld__DOT__div11c))))))));
	vcdp->fullBit  (c+184,((1U & (~ ((IData)(vlTOPp->cpld__DOT__div11d)
					  ? (IData)(vlTOPp->cpld__DOT__div11c)
					  : ((~ (IData)(vlTOPp->cpld__DOT__div11c)) 
					     | ((IData)(vlTOPp->cpld__DOT__div11a) 
						& (IData)(vlTOPp->cpld__DOT__div11c))))))));
	vcdp->fullBit  (c+185,((1U & (~ ((IData)(vlTOPp->cpld__DOT__div11d) 
					 | ((IData)(vlTOPp->cpld__DOT__div11a) 
					    & (IData)(vlTOPp->cpld__DOT__div11c)))))));
	vcdp->fullBit  (c+186,(vlTOPp->cpld__DOT__bd600));
	vcdp->fullBit  (c+187,(vlTOPp->cpld__DOT__bd300));
	vcdp->fullBit  (c+188,(vlTOPp->cf0));
	vcdp->fullBit  (c+189,(vlTOPp->pulse_la));
	vcdp->fullBit  (c+190,(vlTOPp->data08_l));
	vcdp->fullBit  (c+191,(vlTOPp->f_set_l));
	vcdp->fullBit  (c+192,(vlTOPp->user_mode_l));
	vcdp->fullBit  (c+193,(vlTOPp->md11_l));
	vcdp->fullBit  (c+194,(vlTOPp->md10_l));
	vcdp->fullBit  (c+195,(vlTOPp->md09_l));
	vcdp->fullBit  (c+196,(vlTOPp->d_l));
	vcdp->fullBit  (c+197,(vlTOPp->md08_l));
	vcdp->fullBit  (c+198,(vlTOPp->f_l));
	vcdp->fullBit  (c+199,(vlTOPp->ir01_l));
	vcdp->fullBit  (c+200,(vlTOPp->ir00_l));
	vcdp->fullBit  (c+201,(vlTOPp->ind2_l));
	vcdp->fullBit  (c+202,(vlTOPp->ind1_l));
	vcdp->fullBit  (c+203,(vlTOPp->cpma_disable_l));
	vcdp->fullBit  (c+204,(vlTOPp->skip_l));
	vcdp->fullBit  (c+205,(vlTOPp->initialize));
	vcdp->fullBit  (c+206,(vlTOPp->int_rqst_l));
	vcdp->fullBit  (c+207,(vlTOPp->ts3_l));
	vcdp->fullBit  (c+208,(vlTOPp->internal_io_l));
	vcdp->fullBit  (c+209,(vlTOPp->ts1_l));
	vcdp->fullBit  (c+210,(vlTOPp->tp4));
	vcdp->fullBit  (c+211,(vlTOPp->tp3));
	vcdp->fullBit  (c+212,(vlTOPp->c1_l));
	vcdp->fullBit  (c+213,(vlTOPp->tp2));
	vcdp->fullBit  (c+214,(vlTOPp->c0_l));
	vcdp->fullBit  (c+215,(vlTOPp->io_pause_l));
	vcdp->fullBit  (c+216,(vlTOPp->df_enable));
	vcdp->fullBit  (c+217,(vlTOPp->power_ok));
	vcdp->fullBit  (c+218,(vlTOPp->data07_l));
	vcdp->fullBit  (c+219,(vlTOPp->run_l));
	vcdp->fullBit  (c+220,(vlTOPp->data06_l));
	vcdp->fullBit  (c+221,(vlTOPp->data05_l));
	vcdp->fullBit  (c+222,(vlTOPp->data04_l));
	vcdp->fullBit  (c+223,(vlTOPp->int_in_prog_l));
	vcdp->fullBit  (c+224,(vlTOPp->md07_l));
	vcdp->fullBit  (c+225,(vlTOPp->md06_l));
	vcdp->fullBit  (c+226,(vlTOPp->md05_l));
	vcdp->fullBit  (c+227,(vlTOPp->md04_l));
	vcdp->fullBit  (c+228,(vlTOPp->load_cont_l));
	vcdp->fullBit  (c+229,(vlTOPp->tp_bb1));
	vcdp->fullBit  (c+230,(vlTOPp->tp_ba1));
	vcdp->fullBit  (c+231,(vlTOPp->data03_l));
	vcdp->fullBit  (c+232,(vlTOPp->data02_l));
	vcdp->fullBit  (c+233,(vlTOPp->data01_l));
	vcdp->fullBit  (c+234,(vlTOPp->data00_l));
	vcdp->fullBit  (c+235,(vlTOPp->md03_l));
	vcdp->fullBit  (c+236,(vlTOPp->md02_l));
	vcdp->fullBit  (c+237,(vlTOPp->md01_l));
	vcdp->fullBit  (c+238,(vlTOPp->md00_l));
	vcdp->fullBit  (c+239,(vlTOPp->ema2_l));
	vcdp->fullBit  (c+240,(vlTOPp->ema1_l));
	vcdp->fullBit  (c+241,(vlTOPp->ema0_l));
	vcdp->fullBit  (c+242,(vlTOPp->tp_ab1));
	vcdp->fullBit  (c+243,(vlTOPp->tp_aa1));
	vcdp->fullBit  (c+244,(vlTOPp->rxdttl));
	vcdp->fullBit  (c+245,(vlTOPp->txdttl));
	vcdp->fullBit  (c+246,(vlTOPp->data11_l));
	vcdp->fullBit  (c+247,(vlTOPp->key_ctl_l));
	vcdp->fullBit  (c+248,(vlTOPp->data10_l));
	vcdp->fullBit  (c+249,(vlTOPp->data09_l));
	vcdp->fullBit  (c+250,(vlTOPp->clk));
	vcdp->fullBit  (c+251,(vlTOPp->cf1));
	vcdp->fullBit  (c+252,(vlTOPp->drive_ac));
	vcdp->fullBit  (c+253,(vlTOPp->ac[0]));
	vcdp->fullBit  (c+254,(vlTOPp->ac[1]));
	vcdp->fullBit  (c+255,(vlTOPp->ac[2]));
	vcdp->fullBit  (c+256,(vlTOPp->ac[3]));
	vcdp->fullBit  (c+257,(vlTOPp->ac[4]));
	vcdp->fullBit  (c+258,(vlTOPp->ac[5]));
	vcdp->fullBit  (c+259,(vlTOPp->ac[6]));
	vcdp->fullBit  (c+260,(vlTOPp->ac[7]));
	vcdp->fullBit  (c+261,(vlTOPp->ac[8]));
	vcdp->fullBit  (c+262,(vlTOPp->ac[9]));
	vcdp->fullBit  (c+263,(vlTOPp->ac[10]));
	vcdp->fullBit  (c+264,(vlTOPp->ac[11]));
	vcdp->fullBit  (c+265,((1U & (~ (IData)(vlTOPp->txdttl)))));
	vcdp->fullBit  (c+266,((1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__md05) 
					 | (IData)(vlTOPp->io_pause_l))))));
	vcdp->fullBit  (c+267,((1U & (~ ((IData)(vlTOPp->io_pause_l) 
					 | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__md03))))));
	vcdp->fullBit  (c+268,((1U & (~ ((IData)(vlTOPp->io_pause_l) 
					 | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__md04))))));
	vcdp->fullBit  (c+269,((1U & (~ ((IData)(vlTOPp->io_pause_l) 
					 | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__md06))))));
	vcdp->fullBit  (c+270,((1U & (~ ((IData)(vlTOPp->io_pause_l) 
					 | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__md07))))));
	vcdp->fullBit  (c+271,((1U & (~ ((IData)(vlTOPp->md08_l) 
					 | (IData)(vlTOPp->io_pause_l))))));
	vcdp->fullBit  (c+272,((1U & (~ ((~ (IData)(vlTOPp->tp3)) 
					 | (~ ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)) 
						 & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
						& (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
					       & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))))))));
	vcdp->fullBit  (c+273,((1U & (~ ((~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__tls_l) 
					     & (~ (
						   (((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
						     & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
						    & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x)) 
						   & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))))) 
					 & (IData)(vlTOPp->tp3))))));
	vcdp->fullBit  (c+274,((1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__ckkcc_l) 
					 & (~ (IData)(vlTOPp->initialize)))))));
	vcdp->fullBit  (c+275,((1U & (~ ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)) 
					 | (IData)(vlTOPp->data04_l))))));
	vcdp->fullBit  (c+276,((1U & (~ ((IData)(vlTOPp->data05_l) 
					 | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)))))));
	vcdp->fullBit  (c+277,((1U & (~ ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)) 
					 | (IData)(vlTOPp->data06_l))))));
	vcdp->fullBit  (c+278,((1U & (~ ((IData)(vlTOPp->data07_l) 
					 | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)))))));
	vcdp->fullBit  (c+279,((1U & (~ ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)) 
					 | (IData)(vlTOPp->data08_l))))));
	vcdp->fullBit  (c+280,((1U & (~ ((IData)(vlTOPp->data09_l) 
					 | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)))))));
	vcdp->fullBit  (c+281,((1U & (~ ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)) 
					 | (IData)(vlTOPp->data10_l))))));
	vcdp->fullBit  (c+282,((1U & (~ ((IData)(vlTOPp->data11_l) 
					 | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)))))));
	vcdp->fullBit  (c+283,((1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__spike_det_l) 
					 | (IData)(vlTOPp->rxdttl))))));
	vcdp->fullBit  (c+284,(((IData)(vlTOPp->io_pause_l) 
				| (IData)(vlTOPp->data11_l))));
	vcdp->fullBit  (c+285,((((IData)(vlTOPp->cpld__DOT__m8650d__DOT__enab) 
				 & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc))) 
				| ((~ ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)) 
				       | (IData)(vlTOPp->data04_l))) 
				   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)))));
	vcdp->fullBit  (c+286,(1U));
	vcdp->fullBit  (c+287,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_128x));
	vcdp->fullBit  (c+288,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_77x));
	vcdp->fullBit  (c+289,(vlTOPp->cpld__DOT__m8650d__DOT__eia_in));
	vcdp->fullBit  (c+290,(vlTOPp->cpld__DOT__m8650d__DOT__eia_out));
	vcdp->fullBit  (c+291,(vlTOPp->cpld__DOT__m8650d__DOT__md03));
	vcdp->fullBit  (c+292,(vlTOPp->cpld__DOT__m8650d__DOT__md04));
	vcdp->fullBit  (c+293,(vlTOPp->cpld__DOT__m8650d__DOT__md05));
	vcdp->fullBit  (c+294,(vlTOPp->cpld__DOT__m8650d__DOT__md06));
	vcdp->fullBit  (c+295,(vlTOPp->cpld__DOT__m8650d__DOT__md07));
	vcdp->fullBit  (c+296,(vlTOPp->cpld__DOT__m8650d__DOT__n15v));
	vcdp->fullBit  (c+297,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_83x));
	vcdp->fullBit  (c+298,(vlTOPp->cpld__DOT__m8650d__DOT__reader_run));
	vcdp->fullBit  (c+299,(vlTOPp->cpld__DOT__m8650d__DOT__reader_run_or));
	vcdp->fullBit  (c+300,(vlTOPp->cpld__DOT__m8650d__DOT__rtsdtr));
	vcdp->fullBit  (c+301,(vlTOPp->cpld__DOT__m8650d__DOT__rx_20ma));
	vcdp->fullBit  (c+302,(vlTOPp->cpld__DOT__m8650d__DOT__rx_20ma_or));
	vcdp->fullBit  (c+303,((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_83x)))));
	vcdp->fullBit  (c+304,(vlTOPp->cpld__DOT__m8650d__DOT__tx_20ma));
	vcdp->fullBit  (c+305,(vlTOPp->cpld__DOT__m8650d__DOT__tx_20ma_or));
	vcdp->fullBit  (c+306,(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_4_m));
	vcdp->fullBit  (c+307,(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_5_m));
	vcdp->fullBit  (c+308,(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_6_m));
	vcdp->fullBit  (c+309,(vlTOPp->cpld__DOT__m8650d__DOT__n_t_154x_m));
    }
}
