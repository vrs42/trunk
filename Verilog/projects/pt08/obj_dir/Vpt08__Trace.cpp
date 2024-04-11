// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vpt08__Syms.h"


//======================

void Vpt08::traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vpt08* t=(Vpt08*)userthis;
    Vpt08__Syms* __restrict vlSymsp = t->__VlSymsp; // Setup global symbol table
    if (vlSymsp->getClearActivity()) {
	t->traceChgThis (vlSymsp, vcdp, code);
    }
}

//======================


void Vpt08::traceChgThis(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
			       | (vlTOPp->__Vm_traceActivity 
				  >> 3U))))) {
	    vlTOPp->traceChgThis__2(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
			       | (vlTOPp->__Vm_traceActivity 
				  >> 8U))))) {
	    vlTOPp->traceChgThis__3(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
			       | (vlTOPp->__Vm_traceActivity 
				  >> 0x15U))))) {
	    vlTOPp->traceChgThis__4(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
			       | (vlTOPp->__Vm_traceActivity 
				  >> 0x16U))))) {
	    vlTOPp->traceChgThis__5(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
			       | (vlTOPp->__Vm_traceActivity 
				  >> 0x18U))))) {
	    vlTOPp->traceChgThis__6(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((2U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__7(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((4U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__8(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((1U & ((vlTOPp->__Vm_traceActivity 
				>> 2U) | (vlTOPp->__Vm_traceActivity 
					  >> 0xfU))))) {
	    vlTOPp->traceChgThis__9(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x10U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__10(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x20U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__11(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x40U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__12(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x80U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__13(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x100U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__14(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x200U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__15(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x400U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__16(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x800U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__17(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x1000U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__18(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x2000U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__19(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x4000U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__20(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x8000U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__21(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x10000U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__22(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x20000U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__23(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x40000U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__24(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x80000U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__25(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x100000U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__26(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x800000U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__27(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x2000000U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__28(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x4000000U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__29(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x8000000U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__30(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x10000000U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__31(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x20000000U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__32(vlSymsp, vcdp, code);
	}
	if (VL_UNLIKELY((0x40000000U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__33(vlSymsp, vcdp, code);
	}
	vlTOPp->traceChgThis__34(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vpt08::traceChgThis__2(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBus  (c+1,(vlTOPp->pt08__DOT__mb),32);
	vcdp->chgBus  (c+2,(vlTOPp->pt08__DOT__ac),32);
	vcdp->chgBus  (c+3,(vlTOPp->pt08__DOT__ib),32);
	vcdp->chgBit  (c+4,(vlTOPp->pt08__DOT__rx_sel));
	vcdp->chgBit  (c+5,(vlTOPp->pt08__DOT__tx_sel));
	vcdp->chgBit  (c+6,(vlTOPp->pt08__DOT__n_t_2x));
	vcdp->chgBit  (c+7,(vlTOPp->pt08__DOT__e2__DOT__tt_[0]));
	vcdp->chgBit  (c+8,(vlTOPp->pt08__DOT__e2__DOT__tt_[1]));
	vcdp->chgBit  (c+9,(vlTOPp->pt08__DOT__e2__DOT__tt_[2]));
	vcdp->chgBit  (c+10,(vlTOPp->pt08__DOT__e2__DOT__tt_[3]));
	vcdp->chgBit  (c+11,(vlTOPp->pt08__DOT__e2__DOT__tt_[4]));
	vcdp->chgBit  (c+12,(vlTOPp->pt08__DOT__e2__DOT__tt_[5]));
	vcdp->chgBit  (c+13,(vlTOPp->pt08__DOT__e2__DOT__tt_[6]));
	vcdp->chgBit  (c+14,(vlTOPp->pt08__DOT__e2__DOT__tt_[7]));
	vcdp->chgBit  (c+15,(vlTOPp->pt08__DOT__e2__DOT__buffer_strobe));
	vcdp->chgBit  (c+16,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_skip_));
	vcdp->chgBus  (c+17,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_),8);
	vcdp->chgBit  (c+18,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__start_enable));
	vcdp->chgBit  (c+19,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__active_clear_));
	vcdp->chgBit  (c+20,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_shift));
	vcdp->chgBit  (c+21,((1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_shift)))));
	vcdp->chgBit  (c+22,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__preset_));
	vcdp->chgBit  (c+23,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__active_clock));
	vcdp->chgBit  (c+24,((1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
				    >> 7U))));
	vcdp->chgBit  (c+25,((1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
				    >> 6U))));
	vcdp->chgBit  (c+26,((1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
				    >> 5U))));
	vcdp->chgBit  (c+27,((1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
				    >> 4U))));
	vcdp->chgBit  (c+28,((1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
				    >> 3U))));
	vcdp->chgBit  (c+29,((1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
				    >> 2U))));
	vcdp->chgBit  (c+30,((1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
				    >> 1U))));
	vcdp->chgBit  (c+31,((1U & (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_))));
	vcdp->chgBit  (c+32,((1U & (~ (IData)(vlTOPp->pt08__DOT__tx_sel)))));
	vcdp->chgBit  (c+33,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tcf));
	vcdp->chgBus  (c+34,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set),9);
    }
}

void Vpt08::traceChgThis__3(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+35,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale_in));
    }
}

void Vpt08::traceChgThis__4(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+36,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__start_bit));
    }
}

void Vpt08::traceChgThis__5(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+37,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto0_));
    }
}

void Vpt08::traceChgThis__6(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+38,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop_));
    }
}

void Vpt08::traceChgThis__7(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+39,((1U & (~ (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__teleprinter_flag)))));
	vcdp->chgBit  (c+40,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__teleprinter_flag));
    }
}

void Vpt08::traceChgThis__8(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+41,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__line));
    }
}

void Vpt08::traceChgThis__9(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+42,((1U & ((~ (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_active)) 
				    | (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__line)))));
	vcdp->chgBit  (c+43,((1U & (~ ((~ (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_active)) 
				       | (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__line))))));
    }
}

void Vpt08::traceChgThis__10(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+44,((1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__reader_run)))));
	vcdp->chgBit  (c+45,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__reader_run));
    }
}

void Vpt08::traceChgThis__11(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+46,(vlTOPp->pt08__DOT__bd115200));
    }
}

void Vpt08::traceChgThis__12(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+47,(vlTOPp->pt08__DOT__n_t_1x));
    }
}

void Vpt08::traceChgThis__13(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+48,(vlTOPp->pt08__DOT__e11__DOT__tx_ratem));
    }
}

void Vpt08::traceChgThis__14(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+49,((1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale) 
				    >> 2U))));
	vcdp->chgBus  (c+50,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale),3);
	vcdp->chgBit  (c+51,((1U & (~ ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale) 
				       >> 2U)))));
    }
}

void Vpt08::traceChgThis__15(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+52,(vlTOPp->pt08__DOT__bd38400));
    }
}

void Vpt08::traceChgThis__16(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+53,((1U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto) 
				    >> 8U))));
	vcdp->chgBit  (c+54,((1U & (~ ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto) 
				       >> 8U)))));
	vcdp->chgBus  (c+55,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto),9);
	vcdp->chgBit  (c+56,((1U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto) 
				    >> 5U))));
    }
}

void Vpt08::traceChgThis__17(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+57,(vlTOPp->pt08__DOT__tx_rateo));
    }
}

void Vpt08::traceChgThis__18(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+58,(vlTOPp->pt08__DOT__bd19200));
    }
}

void Vpt08::traceChgThis__19(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+59,((1U & (~ ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop) 
				       >> 1U)))));
	vcdp->chgBit  (c+60,((1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop)))));
	vcdp->chgBus  (c+61,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop),2);
    }
}

void Vpt08::traceChgThis__20(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+62,((1U & (~ ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_stop) 
				       >> 2U)))));
	vcdp->chgBit  (c+63,((1U & (~ (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_stop)))));
	vcdp->chgBus  (c+64,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_stop),3);
	vcdp->chgBit  (c+65,((1U & (~ ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_stop) 
				       >> 1U)))));
    }
}

void Vpt08::traceChgThis__21(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+66,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_active));
    }
}

void Vpt08::traceChgThis__22(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+67,(vlTOPp->pt08__DOT__bd9600));
    }
}

void Vpt08::traceChgThis__23(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+68,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__spike_detector));
    }
}

void Vpt08::traceChgThis__24(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+69,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_last_unit));
    }
}

void Vpt08::traceChgThis__25(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+70,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__keyboard_flag));
	vcdp->chgBit  (c+71,((1U & (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti02))));
	vcdp->chgBus  (c+72,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti02),3);
	vcdp->chgBus  (c+73,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti37),5);
    }
}

void Vpt08::traceChgThis__26(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+74,(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_shift));
    }
}

void Vpt08::traceChgThis__27(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+75,(vlTOPp->pt08__DOT__bd4800));
    }
}

void Vpt08::traceChgThis__28(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+76,(vlTOPp->pt08__DOT__bd2400));
    }
}

void Vpt08::traceChgThis__29(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+77,(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_active));
	vcdp->chgBit  (c+78,((1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_active)))));
    }
}

void Vpt08::traceChgThis__30(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+79,(vlTOPp->pt08__DOT__bd1200));
    }
}

void Vpt08::traceChgThis__31(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+80,(vlTOPp->pt08__DOT__bd600));
    }
}

void Vpt08::traceChgThis__32(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+81,(vlTOPp->pt08__DOT__div11a));
	vcdp->chgBit  (c+82,(vlTOPp->pt08__DOT__div11b));
	vcdp->chgBit  (c+83,(vlTOPp->pt08__DOT__div11c));
	vcdp->chgBit  (c+84,(vlTOPp->pt08__DOT__div11d));
	vcdp->chgBit  (c+85,((1U & (~ ((((IData)(vlTOPp->pt08__DOT__div11b) 
					 & (IData)(vlTOPp->pt08__DOT__div11c)) 
					& (IData)(vlTOPp->pt08__DOT__div11d))
				        ? (IData)(vlTOPp->pt08__DOT__div11a)
				        : ((~ (IData)(vlTOPp->pt08__DOT__div11a)) 
					   | ((IData)(vlTOPp->pt08__DOT__div11a) 
					      & (IData)(vlTOPp->pt08__DOT__div11c))))))));
	vcdp->chgBit  (c+86,((1U & (~ (((IData)(vlTOPp->pt08__DOT__div11c) 
					& (IData)(vlTOPp->pt08__DOT__div11d))
				        ? (IData)(vlTOPp->pt08__DOT__div11b)
				        : ((~ (IData)(vlTOPp->pt08__DOT__div11b)) 
					   | ((IData)(vlTOPp->pt08__DOT__div11a) 
					      & (IData)(vlTOPp->pt08__DOT__div11c))))))));
	vcdp->chgBit  (c+87,((1U & (~ ((IData)(vlTOPp->pt08__DOT__div11d)
				        ? (IData)(vlTOPp->pt08__DOT__div11c)
				        : ((~ (IData)(vlTOPp->pt08__DOT__div11c)) 
					   | ((IData)(vlTOPp->pt08__DOT__div11a) 
					      & (IData)(vlTOPp->pt08__DOT__div11c))))))));
	vcdp->chgBit  (c+88,((1U & (~ ((IData)(vlTOPp->pt08__DOT__div11d) 
				       | ((IData)(vlTOPp->pt08__DOT__div11a) 
					  & (IData)(vlTOPp->pt08__DOT__div11c)))))));
    }
}

void Vpt08::traceChgThis__33(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+89,(vlTOPp->pt08__DOT__bd300));
    }
}

void Vpt08::traceChgThis__34(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+90,(vlTOPp->clk));
	vcdp->chgBit  (c+91,(vlTOPp->dsrttl));
	vcdp->chgBit  (c+92,(vlTOPp->txdttl));
	vcdp->chgBit  (c+93,(vlTOPp->rxdttl));
	vcdp->chgBit  (c+94,(vlTOPp->rx_rate));
	vcdp->chgBit  (c+95,(vlTOPp->bmb0));
	vcdp->chgBit  (c+96,(vlTOPp->bmb1));
	vcdp->chgBit  (c+97,(vlTOPp->bmb2));
	vcdp->chgBit  (c+98,(vlTOPp->bmb3));
	vcdp->chgBit  (c+99,(vlTOPp->bmb4));
	vcdp->chgBit  (c+100,(vlTOPp->bmb5));
	vcdp->chgBit  (c+101,(vlTOPp->bmb6));
	vcdp->chgBit  (c+102,(vlTOPp->bmb7));
	vcdp->chgBit  (c+103,(vlTOPp->bmb8));
	vcdp->chgBit  (c+104,(vlTOPp->bmb9));
	vcdp->chgBit  (c+105,(vlTOPp->bmb10));
	vcdp->chgBit  (c+106,(vlTOPp->bmb11));
	vcdp->chgBit  (c+107,(vlTOPp->bmb3_l));
	vcdp->chgBit  (c+108,(vlTOPp->bmb4_l));
	vcdp->chgBit  (c+109,(vlTOPp->bmb5_l));
	vcdp->chgBit  (c+110,(vlTOPp->bmb6_l));
	vcdp->chgBit  (c+111,(vlTOPp->bmb7_l));
	vcdp->chgBit  (c+112,(vlTOPp->bmb8_l));
	vcdp->chgBit  (c+113,(vlTOPp->bac0));
	vcdp->chgBit  (c+114,(vlTOPp->bac1));
	vcdp->chgBit  (c+115,(vlTOPp->bac2));
	vcdp->chgBit  (c+116,(vlTOPp->bac3));
	vcdp->chgBit  (c+117,(vlTOPp->bac4));
	vcdp->chgBit  (c+118,(vlTOPp->bac5));
	vcdp->chgBit  (c+119,(vlTOPp->bac6));
	vcdp->chgBit  (c+120,(vlTOPp->bac7));
	vcdp->chgBit  (c+121,(vlTOPp->bac8));
	vcdp->chgBit  (c+122,(vlTOPp->bac9));
	vcdp->chgBit  (c+123,(vlTOPp->bac10));
	vcdp->chgBit  (c+124,(vlTOPp->bac11));
	vcdp->chgBit  (c+125,(vlTOPp->biop1));
	vcdp->chgBit  (c+126,(vlTOPp->biop2));
	vcdp->chgBit  (c+127,(vlTOPp->biop4));
	vcdp->chgBit  (c+128,(vlTOPp->bts1));
	vcdp->chgBit  (c+129,(vlTOPp->bts3));
	vcdp->chgBit  (c+130,(vlTOPp->initialize));
	vcdp->chgBit  (c+131,(vlTOPp->iob0_l));
	vcdp->chgBit  (c+132,(vlTOPp->iob1_l));
	vcdp->chgBit  (c+133,(vlTOPp->iob2_l));
	vcdp->chgBit  (c+134,(vlTOPp->iob3_l));
	vcdp->chgBit  (c+135,(vlTOPp->iob4_l));
	vcdp->chgBit  (c+136,(vlTOPp->iob5_l));
	vcdp->chgBit  (c+137,(vlTOPp->iob6_l));
	vcdp->chgBit  (c+138,(vlTOPp->iob7_l));
	vcdp->chgBit  (c+139,(vlTOPp->iob8_l));
	vcdp->chgBit  (c+140,(vlTOPp->iob9_l));
	vcdp->chgBit  (c+141,(vlTOPp->iob10_l));
	vcdp->chgBit  (c+142,(vlTOPp->iob11_l));
	vcdp->chgBit  (c+143,(vlTOPp->skip_l));
	vcdp->chgBit  (c+144,(vlTOPp->irq_l));
	vcdp->chgBit  (c+145,(vlTOPp->acclr_l));
	vcdp->chgBit  (c+146,(vlTOPp->run));
	vcdp->chgBit  (c+147,((1U & (~ (IData)(vlTOPp->initialize)))));
	vcdp->chgBit  (c+148,((1U & (~ (IData)(vlTOPp->bmb3)))));
	vcdp->chgBit  (c+149,((1U & (~ (IData)(vlTOPp->bmb4)))));
	vcdp->chgBit  (c+150,((1U & (~ (IData)(vlTOPp->bmb5)))));
	vcdp->chgBit  (c+151,((1U & (~ (IData)(vlTOPp->bmb6)))));
	vcdp->chgBit  (c+152,((1U & (~ (IData)(vlTOPp->bmb7)))));
	vcdp->chgBit  (c+153,((1U & (~ (IData)(vlTOPp->bmb8)))));
	vcdp->chgBit  (c+154,(((IData)(vlTOPp->pt08__DOT__rx_sel) 
			       & (IData)(vlTOPp->biop2))));
	vcdp->chgBit  (c+155,((((IData)(vlTOPp->pt08__DOT__rx_sel) 
				& (IData)(vlTOPp->biop2)) 
			       & (~ (IData)(vlTOPp->initialize)))));
	vcdp->chgBit  (c+156,((1U & (~ (IData)(vlTOPp->rxdttl)))));
	vcdp->chgBit  (c+157,((1U & (~ (((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_shift) 
					 & (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__spike_detector)) 
					& (~ (IData)(vlTOPp->rxdttl)))))));
	vcdp->chgBit  (c+158,(((IData)(vlTOPp->pt08__DOT__rx_sel) 
			       & (IData)(vlTOPp->biop4))));
	vcdp->chgBit  (c+159,((1U & (~ (((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__teleprinter_flag) 
					 & (IData)(vlTOPp->pt08__DOT__tx_sel)) 
					& (IData)(vlTOPp->biop1))))));
	vcdp->chgBus  (c+160,((((IData)(vlTOPp->bac4) 
				<< 7U) | (((IData)(vlTOPp->bac5) 
					   << 6U) | 
					  (((IData)(vlTOPp->bac6) 
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
	vcdp->chgBit  (c+161,(((IData)(vlTOPp->pt08__DOT__tx_sel) 
			       & (IData)(vlTOPp->biop4))));
	vcdp->chgBit  (c+162,((1U & (~ ((IData)(vlTOPp->pt08__DOT__tx_sel) 
					& (IData)(vlTOPp->biop4))))));
    }
}
