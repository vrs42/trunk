// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vpt08.h for the primary calling header

#include "Vpt08.h"             // For This
#include "Vpt08__Syms.h"

//--------------------
// STATIC VARIABLES


//--------------------

VL_CTOR_IMP(Vpt08) {
    Vpt08__Syms* __restrict vlSymsp = __VlSymsp = new Vpt08__Syms(this, name());
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Vpt08::__Vconfigure(Vpt08__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

Vpt08::~Vpt08() {
    delete __VlSymsp; __VlSymsp=NULL;
}

//--------------------


void Vpt08::eval() {
    Vpt08__Syms* __restrict vlSymsp = this->__VlSymsp; // Setup global symbol table
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    VL_DEBUG_IF(VL_PRINTF("\n----TOP Evaluate Vpt08::eval\n"); );
    int __VclockLoop = 0;
    QData __Vchange=1;
    while (VL_LIKELY(__Vchange)) {
	VL_DEBUG_IF(VL_PRINTF(" Clock loop\n"););
	vlSymsp->__Vm_activity = true;
	_eval(vlSymsp);
	__Vchange = _change_request(vlSymsp);
	if (++__VclockLoop > 100) vl_fatal(__FILE__,__LINE__,__FILE__,"Verilated model didn't converge");
    }
}

void Vpt08::_eval_initial_loop(Vpt08__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    vlSymsp->__Vm_activity = true;
    int __VclockLoop = 0;
    QData __Vchange=1;
    while (VL_LIKELY(__Vchange)) {
	_eval_settle(vlSymsp);
	_eval(vlSymsp);
	__Vchange = _change_request(vlSymsp);
	if (++__VclockLoop > 100) vl_fatal(__FILE__,__LINE__,__FILE__,"Verilated model didn't DC converge");
    }
}

//--------------------
// Internal Methods

void Vpt08::_settle__TOP__1__PROF__pt08__l37(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__1__PROF__pt08__l37\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->iob3_l = 1U;
}

void Vpt08::_settle__TOP__2__PROF__pt08__l37(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__2__PROF__pt08__l37\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->iob0_l = 1U;
}

void Vpt08::_settle__TOP__3__PROF__pt08__l37(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__3__PROF__pt08__l37\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->iob2_l = 1U;
}

void Vpt08::_settle__TOP__4__PROF__pt08__l37(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__4__PROF__pt08__l37\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->iob1_l = 1U;
}

VL_INLINE_OPT void Vpt08::_settle__TOP__5__PROF__m707__l95(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__5__PROF__m707__l95\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1 
	= (1U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set) 
		 >> 8U));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__6__PROF__m707__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__6__PROF__m707__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2 
	= (1U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set) 
		 >> 7U));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__7__PROF__m707__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__7__PROF__m707__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2 
	= (1U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set) 
		 >> 6U));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__8__PROF__m707__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__8__PROF__m707__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2 
	= (1U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set) 
		 >> 5U));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__9__PROF__m707__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__9__PROF__m707__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2 
	= (1U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set) 
		 >> 4U));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__10__PROF__m707__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__10__PROF__m707__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2 
	= (1U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set) 
		 >> 3U));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__11__PROF__m707__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__11__PROF__m707__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2 
	= (1U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set) 
		 >> 2U));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__12__PROF__m707__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__12__PROF__m707__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2 
	= (1U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set) 
		 >> 1U));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__13__PROF__m707__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__13__PROF__m707__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2 
	= (1U & (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__14__PROF__pt08__l47(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__14__PROF__pt08__l47\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__mb = ((0xfffff000U & vlTOPp->pt08__DOT__mb) 
			     | (((IData)(vlTOPp->bmb0) 
				 << 0xbU) | (((IData)(vlTOPp->bmb1) 
					      << 0xaU) 
					     | (((IData)(vlTOPp->bmb2) 
						 << 9U) 
						| (((IData)(vlTOPp->bmb3) 
						    << 8U) 
						   | (((IData)(vlTOPp->bmb4) 
						       << 7U) 
						      | (((IData)(vlTOPp->bmb5) 
							  << 6U) 
							 | (((IData)(vlTOPp->bmb6) 
							     << 5U) 
							    | (((IData)(vlTOPp->bmb7) 
								<< 4U) 
							       | (((IData)(vlTOPp->bmb8) 
								   << 3U) 
								  | (((IData)(vlTOPp->bmb9) 
								      << 2U) 
								     | (((IData)(vlTOPp->bmb10) 
									 << 1U) 
									| (IData)(vlTOPp->bmb11)))))))))))));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__15__PROF__pt08__l49(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__15__PROF__pt08__l49\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__ac = ((0xfffff000U & vlTOPp->pt08__DOT__ac) 
			     | (((IData)(vlTOPp->bac0) 
				 << 0xbU) | (((IData)(vlTOPp->bac1) 
					      << 0xaU) 
					     | (((IData)(vlTOPp->bac2) 
						 << 9U) 
						| (((IData)(vlTOPp->bac3) 
						    << 8U) 
						   | (((IData)(vlTOPp->bac4) 
						       << 7U) 
						      | (((IData)(vlTOPp->bac5) 
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
									| (IData)(vlTOPp->bac11)))))))))))));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__16__PROF__pt08__l267(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__16__PROF__pt08__l267\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__tx_sel = ((((((~ (IData)(vlTOPp->bmb3)) 
				     & (~ (IData)(vlTOPp->bmb4))) 
				    & (~ (IData)(vlTOPp->bmb5))) 
				   & (IData)(vlTOPp->bmb6)) 
				  & (~ (IData)(vlTOPp->bmb7))) 
				 & (~ (IData)(vlTOPp->bmb8)));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__17__PROF__pt08__l266(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__17__PROF__pt08__l266\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__rx_sel = ((((((~ (IData)(vlTOPp->bmb3)) 
				     & (~ (IData)(vlTOPp->bmb4))) 
				    & (~ (IData)(vlTOPp->bmb5))) 
				   & (~ (IData)(vlTOPp->bmb6))) 
				  & (IData)(vlTOPp->bmb7)) 
				 & (IData)(vlTOPp->bmb8));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__21__PROF__m707__l128(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__21__PROF__m707__l128\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m707.v:128
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__teleprinter_flag 
	= (1U & ((~ (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tcf)) 
		 & (~ (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto0_))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__26__PROF__m707__l118(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__26__PROF__m707__l118\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m707.v:118
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__line = 
	(1U & ((~ (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__start_bit)) 
	       & (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto)));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__41__PROF__pt08__l39(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__41__PROF__pt08__l39\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->irq_l = (1U & (~ ((~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__keyboard_flag)) 
			      | (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__teleprinter_flag))));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__42__PROF__m707__l126(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__42__PROF__m707__l126\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tcf = ((IData)(vlTOPp->initialize) 
						   | ((IData)(vlTOPp->pt08__DOT__tx_sel) 
						      & (IData)(vlTOPp->biop2)));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__43__PROF__pt08__l39(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__43__PROF__pt08__l39\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->acclr_l = ((IData)(vlTOPp->pt08__DOT__rx_sel) 
		       & (IData)(vlTOPp->biop2));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__44__PROF__m706__l174(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__44__PROF__m706__l174\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_skip_ 
	= (1U & (~ (((IData)(vlTOPp->pt08__DOT__rx_sel) 
		     & (IData)(vlTOPp->biop1)) & (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__keyboard_flag))));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__45__PROF__m706__l109(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__45__PROF__m706__l109\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__buffer_strobe = ((IData)(vlTOPp->biop4) 
						 & (IData)(vlTOPp->pt08__DOT__rx_sel));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__49__PROF__m706__l167(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__49__PROF__m706__l167\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m706.v:167
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__reader_run 
	= (1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__keyboard_flag)));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__51__PROF__e2__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__51__PROF__e2__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->dsrttl = vlTOPp->pt08__DOT__e2__DOT__m706__DOT__reader_run;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__54__PROF__pt08__l169(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__54__PROF__pt08__l169\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__bd115200 = vlTOPp->pt08__DOT__bd115200;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__55__PROF__pt08__l167(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__55__PROF__pt08__l167\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at pt08.v:167
    vlTOPp->__Vdly__pt08__DOT__bd115200 = (1U & (~ (IData)(vlTOPp->pt08__DOT__bd115200)));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__56__PROF__pt08__l169(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__56__PROF__pt08__l169\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__bd115200 = vlTOPp->__Vdly__pt08__DOT__bd115200;
}

VL_INLINE_OPT void Vpt08::_settle__TOP__63__PROF__pt08__l237(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__63__PROF__pt08__l237\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->rx_rate = vlTOPp->pt08__DOT__bd115200;
}

VL_INLINE_OPT void Vpt08::_settle__TOP__64__PROF__pt08__l39(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__64__PROF__pt08__l39\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->skip_l = (1U & (~ ((~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_skip_)) 
			       | (((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__teleprinter_flag) 
				   & (IData)(vlTOPp->pt08__DOT__tx_sel)) 
				  & (IData)(vlTOPp->biop1)))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__75__PROF__m707__l97(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__75__PROF__m707__l97\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__80__PROF__pt08__l180(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__80__PROF__pt08__l180\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__n_t_1x = vlTOPp->pt08__DOT__n_t_1x;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__81__PROF__pt08__l176(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__81__PROF__pt08__l176\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at pt08.v:176
    vlTOPp->__Vdly__pt08__DOT__n_t_1x = ((IData)(vlTOPp->pt08__DOT__n_t_2x) 
					 & (~ (IData)(vlTOPp->pt08__DOT__n_t_1x)));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__82__PROF__pt08__l180(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__82__PROF__pt08__l180\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__n_t_1x = vlTOPp->__Vdly__pt08__DOT__n_t_1x;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__83__PROF__m707__l95(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__83__PROF__m707__l95\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m707.v:95
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto 
	= ((IData)(vlTOPp->initialize) ? (0xffU & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	    : ((0x100U & (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set))
	        ? (0x100U | (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	        : (0xffU & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__84__PROF__m707__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__84__PROF__m707__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m707.v:108
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto 
	= ((IData)(vlTOPp->initialize) ? (0x17fU & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	    : ((0x80U & (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set))
	        ? (0x80U | (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	        : ((0x17fU & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto)) 
		   | (0x80U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto) 
			       >> 1U)))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__85__PROF__m707__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__85__PROF__m707__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m707.v:108
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto 
	= ((IData)(vlTOPp->initialize) ? (0x1bfU & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	    : ((0x40U & (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set))
	        ? (0x40U | (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	        : ((0x1bfU & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto)) 
		   | (0x40U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto) 
			       >> 1U)))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__86__PROF__m707__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__86__PROF__m707__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m707.v:108
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto 
	= ((IData)(vlTOPp->initialize) ? (0x1dfU & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	    : ((0x20U & (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set))
	        ? (0x20U | (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	        : ((0x1dfU & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto)) 
		   | (0x20U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto) 
			       >> 1U)))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__87__PROF__m707__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__87__PROF__m707__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m707.v:108
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto 
	= ((IData)(vlTOPp->initialize) ? (0x1efU & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	    : ((0x10U & (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set))
	        ? (0x10U | (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	        : ((0x1efU & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto)) 
		   | (0x10U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto) 
			       >> 1U)))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__88__PROF__m707__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__88__PROF__m707__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m707.v:108
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto 
	= ((IData)(vlTOPp->initialize) ? (0x1f7U & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	    : ((8U & (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set))
	        ? (8U | (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	        : ((0x1f7U & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto)) 
		   | (8U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto) 
			    >> 1U)))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__89__PROF__m707__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__89__PROF__m707__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m707.v:108
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto 
	= ((IData)(vlTOPp->initialize) ? (0x1fbU & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	    : ((4U & (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set))
	        ? (4U | (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	        : ((0x1fbU & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto)) 
		   | (4U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto) 
			    >> 1U)))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__90__PROF__m707__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__90__PROF__m707__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m707.v:108
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto 
	= ((IData)(vlTOPp->initialize) ? (0x1fdU & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	    : ((2U & (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set))
	        ? (2U | (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	        : ((0x1fdU & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto)) 
		   | (2U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto) 
			    >> 1U)))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__91__PROF__m707__l108(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__91__PROF__m707__l108\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m707.v:108
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto 
	= ((IData)(vlTOPp->initialize) ? (0x1feU & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	    : ((1U & (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set))
	        ? (1U | (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto))
	        : ((0x1feU & (IData)(vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto)) 
		   | (1U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto) 
			    >> 1U)))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__94__PROF__e11__l94(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__94__PROF__e11__l94\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__tx_ratem = vlTOPp->pt08__DOT__e11__DOT__tx_ratem;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__95__PROF__e11__l92(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__95__PROF__e11__l92\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at e11.v:92
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__tx_ratem = 
	(1U & (~ (IData)(vlTOPp->pt08__DOT__e11__DOT__tx_ratem)));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__96__PROF__e11__l94(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__96__PROF__e11__l94\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__tx_ratem = vlTOPp->__Vdly__pt08__DOT__e11__DOT__tx_ratem;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__99__PROF__m706__l134(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__99__PROF__m706__l134\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__e2__DOT__m706__DOT__clock_scale 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__100__PROF__m706__l132(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__100__PROF__m706__l132\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m706.v:132
    vlTOPp->__Vdly__pt08__DOT__e2__DOT__m706__DOT__clock_scale 
	= (7U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__start_enable)
		  ? 0U : ((IData)(1U) + (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__101__PROF__m706__l134(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__101__PROF__m706__l134\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale 
	= vlTOPp->__Vdly__pt08__DOT__e2__DOT__m706__DOT__clock_scale;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__102__PROF__m706__l68(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__102__PROF__m706__l68\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale_in 
	= (1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale) 
		 >> 2U));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__105__PROF__pt08__l186(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__105__PROF__pt08__l186\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__bd38400 = vlTOPp->pt08__DOT__bd38400;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__106__PROF__pt08__l182(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__106__PROF__pt08__l182\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at pt08.v:182
    vlTOPp->__Vdly__pt08__DOT__bd38400 = ((IData)(vlTOPp->pt08__DOT__n_t_2x) 
					  & (~ (IData)(vlTOPp->pt08__DOT__bd38400)));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__107__PROF__pt08__l186(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__107__PROF__pt08__l186\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__bd38400 = vlTOPp->__Vdly__pt08__DOT__bd38400;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__108__PROF__m707__l97(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__108__PROF__m707__l97\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto = vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto;
}

VL_INLINE_OPT void Vpt08::_combo__TOP__109__PROF__m707__l94(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__109__PROF__m707__l94\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set 
	= (0x1ffU & (((IData)(vlTOPp->pt08__DOT__tx_sel) 
		      & (IData)(vlTOPp->biop4)) ? (0x100U 
						   | (((IData)(vlTOPp->bac4) 
						       << 7U) 
						      | (((IData)(vlTOPp->bac5) 
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
									| (IData)(vlTOPp->bac11)))))))))
		      : 0U));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__110__PROF__pt08__l188(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__110__PROF__pt08__l188\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__n_t_2x = (1U & (~ ((IData)(vlTOPp->pt08__DOT__n_t_1x) 
					  & (IData)(vlTOPp->pt08__DOT__bd38400))));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__114__PROF__m706__l126(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__114__PROF__m706__l126\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_shift 
	= ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_active) 
	   & (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale_in));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__117__PROF__e11__l98(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__117__PROF__e11__l98\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__tx_rateo = vlTOPp->pt08__DOT__tx_rateo;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__118__PROF__e11__l96(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__118__PROF__e11__l96\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at e11.v:96
    vlTOPp->__Vdly__pt08__DOT__tx_rateo = (1U & (~ (IData)(vlTOPp->pt08__DOT__tx_rateo)));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__119__PROF__e11__l98(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__119__PROF__e11__l98\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__tx_rateo = vlTOPp->__Vdly__pt08__DOT__tx_rateo;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__122__PROF__pt08__l193(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__122__PROF__pt08__l193\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__bd19200 = vlTOPp->pt08__DOT__bd19200;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__123__PROF__pt08__l191(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__123__PROF__pt08__l191\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at pt08.v:191
    vlTOPp->__Vdly__pt08__DOT__bd19200 = (1U & (~ (IData)(vlTOPp->pt08__DOT__bd19200)));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__124__PROF__pt08__l193(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__124__PROF__pt08__l193\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__bd19200 = vlTOPp->__Vdly__pt08__DOT__bd19200;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__127__PROF__m706__l143(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__127__PROF__m706__l143\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__e2__DOT__m706__DOT__in_stop 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__128__PROF__m706__l139(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__128__PROF__m706__l139\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m706.v:139
    vlTOPp->__Vdly__pt08__DOT__e2__DOT__m706__DOT__in_stop 
	= ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__preset_)
	    ? (((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_active) 
		<< 1U) | (1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop) 
				>> 1U))) : 0U);
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__129__PROF__m706__l143(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__129__PROF__m706__l143\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop 
	= vlTOPp->__Vdly__pt08__DOT__e2__DOT__m706__DOT__in_stop;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__133__PROF__m707__l73(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__133__PROF__m707__l73\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto_shift 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_shift;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__134__PROF__m707__l72(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__134__PROF__m707__l72\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m707.v:72
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto_shift 
	= (1U & (~ ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
		    & (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_active))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__137__PROF__m707__l80(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__137__PROF__m707__l80\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__out_stop 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_stop;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__138__PROF__m707__l76(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__138__PROF__m707__l76\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m707.v:76
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__out_stop 
	= ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_shift)
	    ? (((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_active) 
		<< 2U) | (3U & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_stop) 
				>> 1U))) : 7U);
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__139__PROF__m707__l80(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__139__PROF__m707__l80\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_stop 
	= vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__out_stop;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__142__PROF__m707__l88(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__142__PROF__m707__l88\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__out_active 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_active;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__143__PROF__m707__l86(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__143__PROF__m707__l86\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m707.v:86
    vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__out_active 
	= ((~ (IData)(vlTOPp->initialize)) & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__start_bit) 
					      | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_active) 
						 & (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto0_))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__144__PROF__m707__l88(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__144__PROF__m707__l88\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_active 
	= vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__out_active;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__147__PROF__pt08__l197(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__147__PROF__pt08__l197\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__bd9600 = vlTOPp->pt08__DOT__bd9600;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__148__PROF__pt08__l195(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__148__PROF__pt08__l195\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at pt08.v:195
    vlTOPp->__Vdly__pt08__DOT__bd9600 = (1U & (~ (IData)(vlTOPp->pt08__DOT__bd9600)));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__149__PROF__pt08__l197(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__149__PROF__pt08__l197\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__bd9600 = vlTOPp->__Vdly__pt08__DOT__bd9600;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__153__PROF__m706__l158(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__153__PROF__m706__l158\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m706.v:158
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__spike_detector 
	= (1U & ((~ (IData)(vlTOPp->initialize)) & 
		 (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__preset_))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__158__PROF__m706__l188(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__158__PROF__m706__l188\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m706.v:188
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_last_unit 
	= ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop_) 
	   & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti37)));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__165__PROF__m706__l181(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__165__PROF__m706__l181\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__e2__DOT__m706__DOT__tti37 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti37;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__166__PROF__m706__l180(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__166__PROF__m706__l180\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__e2__DOT__m706__DOT__tti02 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti02;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__167__PROF__m706__l176(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__167__PROF__m706__l176\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m706.v:176
    if (vlTOPp->pt08__DOT__e2__DOT__m706__DOT__preset_) {
	vlTOPp->__Vdly__pt08__DOT__e2__DOT__m706__DOT__tti02 
	    = ((4U & ((~ (IData)(vlTOPp->rxdttl)) << 2U)) 
	       | (3U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti02) 
			>> 1U)));
	vlTOPp->__Vdly__pt08__DOT__e2__DOT__m706__DOT__tti37 
	    = (((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti3_set) 
		<< 4U) | (0xfU & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti37) 
				  >> 1U)));
	vlTOPp->pt08__DOT__e2__DOT__m706__DOT__keyboard_flag 
	    = (1U & (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti37));
    } else {
	vlTOPp->__Vdly__pt08__DOT__e2__DOT__m706__DOT__tti02 = 7U;
	vlTOPp->__Vdly__pt08__DOT__e2__DOT__m706__DOT__tti37 = 0x1fU;
    }
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__169__PROF__m706__l181(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__169__PROF__m706__l181\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti37 = vlTOPp->__Vdly__pt08__DOT__e2__DOT__m706__DOT__tti37;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__170__PROF__m706__l180(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__170__PROF__m706__l180\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti02 = vlTOPp->__Vdly__pt08__DOT__e2__DOT__m706__DOT__tti02;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__171__PROF__m706__l49(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__171__PROF__m706__l49\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti3_set 
	= (1U & (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti02));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__172__PROF__m707__l73(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__172__PROF__m707__l73\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_shift 
	= vlTOPp->__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto_shift;
}

VL_INLINE_OPT void Vpt08::_multiclk__TOP__173__PROF__m707__l85(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_multiclk__TOP__173__PROF__m707__l85\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__start_bit 
	= (1U & ((~ (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_stop)) 
		 & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto) 
		    >> 8U)));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__175__PROF__m707__l83(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__175__PROF__m707__l83\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto0_ = 
	(0U != ((0x100U & (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto)) 
		| (0xffU & ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto) 
			    >> 1U))));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__176__PROF__pt08__l31(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__176__PROF__pt08__l31\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->txdttl = (1U & ((~ (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__out_active)) 
			    | (IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__line)));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__177__PROF__m706__l71(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__177__PROF__m706__l71\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop_ 
	= (1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop)));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__178__PROF__m706__l129(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__178__PROF__m706__l129\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__start_enable 
	= (1U & ((~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_active)) 
		 & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_last_unit))));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__179__PROF__m706__l148(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__179__PROF__m706__l148\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__active_clock 
	= ((~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_shift)) 
	   & (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_last_unit));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__181__PROF__m706__l186(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__181__PROF__m706__l186\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_ = (0xffU 
						  & (((IData)(vlTOPp->pt08__DOT__rx_sel) 
						      & (IData)(vlTOPp->biop4))
						      ? 
						     ((0xe0U 
						       & ((~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti02)) 
							  << 5U)) 
						      | (0x1fU 
							 & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti37))))
						      : 0xffffffffU));
}

VL_INLINE_OPT void Vpt08::_multiclk__TOP__184__PROF__pt08__l272(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_multiclk__TOP__184__PROF__pt08__l272\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->rxdttl = vlTOPp->txdttl;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__187__PROF__pt08__l201(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__187__PROF__pt08__l201\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__bd4800 = vlTOPp->pt08__DOT__bd4800;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__188__PROF__pt08__l199(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__188__PROF__pt08__l199\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at pt08.v:199
    vlTOPp->__Vdly__pt08__DOT__bd4800 = (1U & (~ (IData)(vlTOPp->pt08__DOT__bd4800)));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__189__PROF__pt08__l201(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__189__PROF__pt08__l201\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__bd4800 = vlTOPp->__Vdly__pt08__DOT__bd4800;
}

VL_INLINE_OPT void Vpt08::_combo__TOP__194__PROF__e2__l72(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__194__PROF__e2__l72\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__tt_[6U] = (1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
						 >> 1U));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__195__PROF__e2__l71(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__195__PROF__e2__l71\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__tt_[2U] = (1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
						 >> 5U));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__196__PROF__e2__l70(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__196__PROF__e2__l70\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__tt_[1U] = (1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
						 >> 6U));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__197__PROF__e2__l68(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__197__PROF__e2__l68\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__tt_[5U] = (1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
						 >> 2U));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__198__PROF__e2__l67(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__198__PROF__e2__l67\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__tt_[7U] = (1U & (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__199__PROF__e2__l64(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__199__PROF__e2__l64\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__tt_[4U] = (1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
						 >> 3U));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__200__PROF__e2__l62(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__200__PROF__e2__l62\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__tt_[3U] = (1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
						 >> 4U));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__201__PROF__e2__l61(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__201__PROF__e2__l61\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__tt_[0U] = (1U & ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tt_) 
						 >> 7U));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__211__PROF__e2__l99(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__211__PROF__e2__l99\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__iob4_l__out__en4 = 
	(1U & (~ ((~ vlTOPp->pt08__DOT__e2__DOT__tt_
		   [0U]) | (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__buffer_strobe)))));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__212__PROF__e2__l100(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__212__PROF__e2__l100\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__iob5_l__out__en5 = 
	(1U & (~ ((~ vlTOPp->pt08__DOT__e2__DOT__tt_
		   [1U]) | (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__buffer_strobe)))));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__213__PROF__e2__l101(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__213__PROF__e2__l101\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__iob6_l__out__en6 = 
	(1U & (~ ((~ vlTOPp->pt08__DOT__e2__DOT__tt_
		   [2U]) | (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__buffer_strobe)))));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__214__PROF__e2__l102(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__214__PROF__e2__l102\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__iob7_l__out__en7 = 
	(1U & (~ ((~ vlTOPp->pt08__DOT__e2__DOT__tt_
		   [3U]) | (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__buffer_strobe)))));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__215__PROF__e2__l103(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__215__PROF__e2__l103\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__iob8_l__out__en8 = 
	(1U & (~ ((~ vlTOPp->pt08__DOT__e2__DOT__tt_
		   [4U]) | (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__buffer_strobe)))));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__216__PROF__e2__l104(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__216__PROF__e2__l104\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__iob9_l__out__en9 = 
	(1U & (~ ((~ vlTOPp->pt08__DOT__e2__DOT__tt_
		   [5U]) | (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__buffer_strobe)))));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__217__PROF__e2__l105(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__217__PROF__e2__l105\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__iob10_l__out__en10 
	= (1U & (~ ((~ vlTOPp->pt08__DOT__e2__DOT__tt_
		     [6U]) | (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__buffer_strobe)))));
}

VL_INLINE_OPT void Vpt08::_settle__TOP__218__PROF__e2__l106(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__218__PROF__e2__l106\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__iob11_l__out__en11 
	= (1U & (~ ((~ vlTOPp->pt08__DOT__e2__DOT__tt_
		     [7U]) | (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__buffer_strobe)))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__221__PROF__pt08__l205(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__221__PROF__pt08__l205\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__bd2400 = vlTOPp->pt08__DOT__bd2400;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__222__PROF__pt08__l203(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__222__PROF__pt08__l203\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at pt08.v:203
    vlTOPp->__Vdly__pt08__DOT__bd2400 = (1U & (~ (IData)(vlTOPp->pt08__DOT__bd2400)));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__223__PROF__pt08__l205(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__223__PROF__pt08__l205\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__bd2400 = vlTOPp->__Vdly__pt08__DOT__bd2400;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__227__PROF__m706__l149(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__227__PROF__m706__l149\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at m706.v:149
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_active 
	= ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__active_clear_) 
	   & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__preset_)));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__237__PROF__m706__l147(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__237__PROF__m706__l147\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__active_clear_ 
	= (1U & ((~ (IData)(vlTOPp->initialize)) & 
		 (~ (((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_shift) 
		      & (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__spike_detector)) 
		     & (~ (IData)(vlTOPp->rxdttl))))));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__238__PROF__m706__l130(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__238__PROF__m706__l130\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__e2__DOT__m706__DOT__preset_ 
	= (1U & (~ (((IData)(vlTOPp->rx_rate) & (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__start_enable)) 
		    & (IData)(vlTOPp->rxdttl))));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__239__PROF__pt08__l37(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__239__PROF__pt08__l37\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->iob4_l = (1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__iob4_l__out__en4)));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__240__PROF__pt08__l37(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__240__PROF__pt08__l37\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->iob5_l = (1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__iob5_l__out__en5)));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__241__PROF__pt08__l38(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__241__PROF__pt08__l38\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->iob6_l = (1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__iob6_l__out__en6)));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__242__PROF__pt08__l38(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__242__PROF__pt08__l38\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->iob7_l = (1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__iob7_l__out__en7)));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__243__PROF__pt08__l38(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__243__PROF__pt08__l38\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->iob8_l = (1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__iob8_l__out__en8)));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__244__PROF__pt08__l38(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__244__PROF__pt08__l38\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->iob9_l = (1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__iob9_l__out__en9)));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__245__PROF__pt08__l38(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__245__PROF__pt08__l38\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->iob10_l = (1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__iob10_l__out__en10)));
}

VL_INLINE_OPT void Vpt08::_combo__TOP__246__PROF__pt08__l38(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_combo__TOP__246__PROF__pt08__l38\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->iob11_l = (1U & (~ (IData)(vlTOPp->pt08__DOT__e2__DOT__iob11_l__out__en11)));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__249__PROF__pt08__l209(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__249__PROF__pt08__l209\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__bd1200 = vlTOPp->pt08__DOT__bd1200;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__250__PROF__pt08__l207(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__250__PROF__pt08__l207\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at pt08.v:207
    vlTOPp->__Vdly__pt08__DOT__bd1200 = (1U & (~ (IData)(vlTOPp->pt08__DOT__bd1200)));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__251__PROF__pt08__l209(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__251__PROF__pt08__l209\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__bd1200 = vlTOPp->__Vdly__pt08__DOT__bd1200;
}

VL_INLINE_OPT void Vpt08::_settle__TOP__262__PROF__pt08__l51(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_settle__TOP__262__PROF__pt08__l51\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__ib = ((0xfffff000U & vlTOPp->pt08__DOT__ib) 
			     | ((0x800U & ((~ (IData)(vlTOPp->iob0_l)) 
					   << 0xbU)) 
				| ((0x400U & ((~ (IData)(vlTOPp->iob1_l)) 
					      << 0xaU)) 
				   | ((0x200U & ((~ (IData)(vlTOPp->iob2_l)) 
						 << 9U)) 
				      | ((0x100U & 
					  ((~ (IData)(vlTOPp->iob3_l)) 
					   << 8U)) 
					 | ((0x80U 
					     & ((~ (IData)(vlTOPp->iob4_l)) 
						<< 7U)) 
					    | ((0x40U 
						& ((~ (IData)(vlTOPp->iob5_l)) 
						   << 6U)) 
					       | ((0x20U 
						   & ((~ (IData)(vlTOPp->iob6_l)) 
						      << 5U)) 
						  | ((0x10U 
						      & ((~ (IData)(vlTOPp->iob7_l)) 
							 << 4U)) 
						     | ((8U 
							 & ((~ (IData)(vlTOPp->iob8_l)) 
							    << 3U)) 
							| ((4U 
							    & ((~ (IData)(vlTOPp->iob9_l)) 
							       << 2U)) 
							   | ((2U 
							       & ((~ (IData)(vlTOPp->iob10_l)) 
								  << 1U)) 
							      | (1U 
								 & (~ (IData)(vlTOPp->iob11_l)))))))))))))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__265__PROF__pt08__l213(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__265__PROF__pt08__l213\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__bd600 = vlTOPp->pt08__DOT__bd600;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__266__PROF__pt08__l211(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__266__PROF__pt08__l211\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at pt08.v:211
    vlTOPp->__Vdly__pt08__DOT__bd600 = (1U & (~ (IData)(vlTOPp->pt08__DOT__bd600)));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__267__PROF__pt08__l213(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__267__PROF__pt08__l213\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__bd600 = vlTOPp->__Vdly__pt08__DOT__bd600;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__269__PROF__pt08__l230(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__269__PROF__pt08__l230\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at pt08.v:230
    vlTOPp->pt08__DOT__div11b = vlTOPp->pt08__DOT__ndiv11b;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__270__PROF__pt08__l231(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__270__PROF__pt08__l231\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at pt08.v:231
    vlTOPp->pt08__DOT__div11c = vlTOPp->pt08__DOT__ndiv11c;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__271__PROF__pt08__l232(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__271__PROF__pt08__l232\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at pt08.v:232
    vlTOPp->pt08__DOT__div11d = vlTOPp->pt08__DOT__ndiv11d;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__272__PROF__pt08__l229(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__272__PROF__pt08__l229\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at pt08.v:229
    vlTOPp->pt08__DOT__div11a = vlTOPp->pt08__DOT__ndiv11a;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__273__PROF__pt08__l226(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__273__PROF__pt08__l226\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__ndiv11a = (1U & (~ ((((IData)(vlTOPp->pt08__DOT__div11b) 
					     & (IData)(vlTOPp->pt08__DOT__div11c)) 
					    & (IData)(vlTOPp->pt08__DOT__div11d))
					    ? (IData)(vlTOPp->pt08__DOT__div11a)
					    : ((~ (IData)(vlTOPp->pt08__DOT__div11a)) 
					       | ((IData)(vlTOPp->pt08__DOT__div11a) 
						  & (IData)(vlTOPp->pt08__DOT__div11c))))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__274__PROF__pt08__l223(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__274__PROF__pt08__l223\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__ndiv11d = (1U & (~ ((IData)(vlTOPp->pt08__DOT__div11d) 
					   | ((IData)(vlTOPp->pt08__DOT__div11a) 
					      & (IData)(vlTOPp->pt08__DOT__div11c)))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__275__PROF__pt08__l224(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__275__PROF__pt08__l224\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__ndiv11c = (1U & (~ ((IData)(vlTOPp->pt08__DOT__div11d)
					    ? (IData)(vlTOPp->pt08__DOT__div11c)
					    : ((~ (IData)(vlTOPp->pt08__DOT__div11c)) 
					       | ((IData)(vlTOPp->pt08__DOT__div11a) 
						  & (IData)(vlTOPp->pt08__DOT__div11c))))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__276__PROF__pt08__l225(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__276__PROF__pt08__l225\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__ndiv11b = (1U & (~ (((IData)(vlTOPp->pt08__DOT__div11c) 
					    & (IData)(vlTOPp->pt08__DOT__div11d))
					    ? (IData)(vlTOPp->pt08__DOT__div11b)
					    : ((~ (IData)(vlTOPp->pt08__DOT__div11b)) 
					       | ((IData)(vlTOPp->pt08__DOT__div11a) 
						  & (IData)(vlTOPp->pt08__DOT__div11c))))));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__280__PROF__pt08__l217(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__280__PROF__pt08__l217\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__pt08__DOT__bd300 = vlTOPp->pt08__DOT__bd300;
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__281__PROF__pt08__l215(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__281__PROF__pt08__l215\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at pt08.v:215
    vlTOPp->__Vdly__pt08__DOT__bd300 = (1U & (~ (IData)(vlTOPp->pt08__DOT__bd300)));
}

VL_INLINE_OPT void Vpt08::_sequent__TOP__282__PROF__pt08__l217(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_sequent__TOP__282__PROF__pt08__l217\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->pt08__DOT__bd300 = vlTOPp->__Vdly__pt08__DOT__bd300;
}

void Vpt08::_eval(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_eval\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if ((((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tcf) 
	  & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tcf))) 
	 | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift))))) {
	vlTOPp->__Vm_traceActivity = (2U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__21__PROF__m707__l128(vlSymsp);
    }
    if ((((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__start_bit) 
	  & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__start_bit))) 
	 | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift))))) {
	vlTOPp->__Vm_traceActivity = (4U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__26__PROF__m707__l118(vlSymsp);
    }
    vlTOPp->_settle__TOP__5__PROF__m707__l95(vlSymsp);
    vlTOPp->__Vm_traceActivity = (8U | vlTOPp->__Vm_traceActivity);
    vlTOPp->_settle__TOP__6__PROF__m707__l108(vlSymsp);
    vlTOPp->_settle__TOP__7__PROF__m707__l108(vlSymsp);
    vlTOPp->_settle__TOP__8__PROF__m707__l108(vlSymsp);
    vlTOPp->_settle__TOP__9__PROF__m707__l108(vlSymsp);
    vlTOPp->_settle__TOP__10__PROF__m707__l108(vlSymsp);
    vlTOPp->_settle__TOP__11__PROF__m707__l108(vlSymsp);
    vlTOPp->_settle__TOP__12__PROF__m707__l108(vlSymsp);
    vlTOPp->_settle__TOP__13__PROF__m707__l108(vlSymsp);
    vlTOPp->_settle__TOP__14__PROF__pt08__l47(vlSymsp);
    vlTOPp->_settle__TOP__15__PROF__pt08__l49(vlSymsp);
    vlTOPp->_settle__TOP__16__PROF__pt08__l267(vlSymsp);
    vlTOPp->_settle__TOP__17__PROF__pt08__l266(vlSymsp);
    vlTOPp->_combo__TOP__41__PROF__pt08__l39(vlSymsp);
    vlTOPp->_combo__TOP__42__PROF__m707__l126(vlSymsp);
    vlTOPp->_combo__TOP__43__PROF__pt08__l39(vlSymsp);
    vlTOPp->_combo__TOP__44__PROF__m706__l174(vlSymsp);
    vlTOPp->_combo__TOP__45__PROF__m706__l109(vlSymsp);
    if ((((~ (IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__keyboard_flag)) 
	  & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__keyboard_flag)) 
	 | ((~ (IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_)) 
	    & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_)))) {
	vlTOPp->__Vm_traceActivity = (0x10U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__49__PROF__m706__l167(vlSymsp);
	vlTOPp->_sequent__TOP__51__PROF__e2__l108(vlSymsp);
    }
    if (((IData)(vlTOPp->clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk)))) {
	vlTOPp->__Vm_traceActivity = (0x20U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__54__PROF__pt08__l169(vlSymsp);
	vlTOPp->_sequent__TOP__55__PROF__pt08__l167(vlSymsp);
	vlTOPp->_sequent__TOP__56__PROF__pt08__l169(vlSymsp);
    }
    if (((((((((((((IData)(vlTOPp->initialize) & (~ (IData)(vlTOPp->__Vclklast__TOP__initialize))) 
		  | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1) 
		     & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1)))) 
		 | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
		    & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift)))) 
		| ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2) 
		   & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2)))) 
	       | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2) 
		  & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2)))) 
	      | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2) 
		 & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2)))) 
	     | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2) 
		& (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2)))) 
	    | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2) 
	       & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2)))) 
	   | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2) 
	      & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2)))) 
	  | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2) 
	     & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2)))) 
	 | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2))))) {
	vlTOPp->_sequent__TOP__75__PROF__m707__l97(vlSymsp);
    }
    vlTOPp->_settle__TOP__63__PROF__pt08__l237(vlSymsp);
    vlTOPp->_settle__TOP__64__PROF__pt08__l39(vlSymsp);
    if ((((~ (IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__bd115200)) 
	  & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd115200)) 
	 | ((~ (IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__n_t_2x)) 
	    & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__n_t_2x)))) {
	vlTOPp->__Vm_traceActivity = (0x40U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__80__PROF__pt08__l180(vlSymsp);
	vlTOPp->_sequent__TOP__81__PROF__pt08__l176(vlSymsp);
	vlTOPp->_sequent__TOP__82__PROF__pt08__l180(vlSymsp);
    }
    if (((((IData)(vlTOPp->initialize) & (~ (IData)(vlTOPp->__Vclklast__TOP__initialize))) 
	  | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1) 
	     & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1)))) 
	 | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift))))) {
	vlTOPp->_sequent__TOP__83__PROF__m707__l95(vlSymsp);
    }
    if (((((IData)(vlTOPp->initialize) & (~ (IData)(vlTOPp->__Vclklast__TOP__initialize))) 
	  | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
	     & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift)))) 
	 | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2))))) {
	vlTOPp->_sequent__TOP__84__PROF__m707__l108(vlSymsp);
    }
    if (((((IData)(vlTOPp->initialize) & (~ (IData)(vlTOPp->__Vclklast__TOP__initialize))) 
	  | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
	     & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift)))) 
	 | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2))))) {
	vlTOPp->_sequent__TOP__85__PROF__m707__l108(vlSymsp);
    }
    if (((((IData)(vlTOPp->initialize) & (~ (IData)(vlTOPp->__Vclklast__TOP__initialize))) 
	  | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
	     & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift)))) 
	 | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2))))) {
	vlTOPp->_sequent__TOP__86__PROF__m707__l108(vlSymsp);
    }
    if (((((IData)(vlTOPp->initialize) & (~ (IData)(vlTOPp->__Vclklast__TOP__initialize))) 
	  | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
	     & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift)))) 
	 | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2))))) {
	vlTOPp->_sequent__TOP__87__PROF__m707__l108(vlSymsp);
    }
    if (((((IData)(vlTOPp->initialize) & (~ (IData)(vlTOPp->__Vclklast__TOP__initialize))) 
	  | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
	     & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift)))) 
	 | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2))))) {
	vlTOPp->_sequent__TOP__88__PROF__m707__l108(vlSymsp);
    }
    if (((((IData)(vlTOPp->initialize) & (~ (IData)(vlTOPp->__Vclklast__TOP__initialize))) 
	  | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
	     & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift)))) 
	 | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2))))) {
	vlTOPp->_sequent__TOP__89__PROF__m707__l108(vlSymsp);
    }
    if (((((IData)(vlTOPp->initialize) & (~ (IData)(vlTOPp->__Vclklast__TOP__initialize))) 
	  | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
	     & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift)))) 
	 | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2))))) {
	vlTOPp->_sequent__TOP__90__PROF__m707__l108(vlSymsp);
    }
    if (((((IData)(vlTOPp->initialize) & (~ (IData)(vlTOPp->__Vclklast__TOP__initialize))) 
	  | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
	     & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift)))) 
	 | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2))))) {
	vlTOPp->_sequent__TOP__91__PROF__m707__l108(vlSymsp);
    }
    if (((IData)(vlTOPp->rx_rate) & (~ (IData)(vlTOPp->__Vclklast__TOP__rx_rate)))) {
	vlTOPp->__Vm_traceActivity = (0x80U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__94__PROF__e11__l94(vlSymsp);
	vlTOPp->_sequent__TOP__95__PROF__e11__l92(vlSymsp);
	vlTOPp->_sequent__TOP__96__PROF__e11__l94(vlSymsp);
    }
    if ((((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__start_enable) 
	  & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__start_enable))) 
	 | ((IData)(vlTOPp->rx_rate) & (~ (IData)(vlTOPp->__Vclklast__TOP__rx_rate))))) {
	vlTOPp->__Vm_traceActivity = (0x100U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__99__PROF__m706__l134(vlSymsp);
	vlTOPp->_sequent__TOP__100__PROF__m706__l132(vlSymsp);
	vlTOPp->_sequent__TOP__101__PROF__m706__l134(vlSymsp);
	vlTOPp->_sequent__TOP__102__PROF__m706__l68(vlSymsp);
    }
    if ((((~ (IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__n_t_1x)) 
	  & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__n_t_1x)) 
	 | ((~ (IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__n_t_2x)) 
	    & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__n_t_2x)))) {
	vlTOPp->__Vm_traceActivity = (0x200U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__105__PROF__pt08__l186(vlSymsp);
	vlTOPp->_sequent__TOP__106__PROF__pt08__l182(vlSymsp);
	vlTOPp->_sequent__TOP__107__PROF__pt08__l186(vlSymsp);
    }
    if (((((((((((((IData)(vlTOPp->initialize) & (~ (IData)(vlTOPp->__Vclklast__TOP__initialize))) 
		  | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1) 
		     & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1)))) 
		 | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
		    & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift)))) 
		| ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2) 
		   & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2)))) 
	       | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2) 
		  & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2)))) 
	      | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2) 
		 & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2)))) 
	     | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2) 
		& (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2)))) 
	    | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2) 
	       & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2)))) 
	   | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2) 
	      & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2)))) 
	  | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2) 
	     & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2)))) 
	 | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2))))) {
	vlTOPp->_sequent__TOP__108__PROF__m707__l97(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x400U | vlTOPp->__Vm_traceActivity);
    }
    vlTOPp->_combo__TOP__109__PROF__m707__l94(vlSymsp);
    vlTOPp->_combo__TOP__110__PROF__pt08__l188(vlSymsp);
    if (((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__tx_ratem) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__tx_ratem)))) {
	vlTOPp->__Vm_traceActivity = (0x800U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__117__PROF__e11__l98(vlSymsp);
	vlTOPp->_sequent__TOP__118__PROF__e11__l96(vlSymsp);
	vlTOPp->_sequent__TOP__119__PROF__e11__l98(vlSymsp);
    }
    if (((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__bd38400) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd38400)))) {
	vlTOPp->__Vm_traceActivity = (0x1000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__122__PROF__pt08__l193(vlSymsp);
	vlTOPp->_sequent__TOP__123__PROF__pt08__l191(vlSymsp);
	vlTOPp->_sequent__TOP__124__PROF__pt08__l193(vlSymsp);
    }
    if ((((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale_in) 
	  & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e2__DOT__m706__DOT__clock_scale_in))) 
	 | ((~ (IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_)) 
	    & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_)))) {
	vlTOPp->__Vm_traceActivity = (0x2000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__127__PROF__m706__l143(vlSymsp);
	vlTOPp->_sequent__TOP__128__PROF__m706__l139(vlSymsp);
	vlTOPp->_sequent__TOP__129__PROF__m706__l143(vlSymsp);
    }
    vlTOPp->_settle__TOP__114__PROF__m706__l126(vlSymsp);
    if (((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__tx_rateo) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__tx_rateo)))) {
	vlTOPp->_sequent__TOP__133__PROF__m707__l73(vlSymsp);
	vlTOPp->_sequent__TOP__134__PROF__m707__l72(vlSymsp);
    }
    if ((((~ (IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift)) 
	  & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift)) 
	 | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__tx_rateo) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__tx_rateo))))) {
	vlTOPp->__Vm_traceActivity = (0x4000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__137__PROF__m707__l80(vlSymsp);
	vlTOPp->_sequent__TOP__138__PROF__m707__l76(vlSymsp);
	vlTOPp->_sequent__TOP__139__PROF__m707__l80(vlSymsp);
    }
    if ((((IData)(vlTOPp->initialize) & (~ (IData)(vlTOPp->__Vclklast__TOP__initialize))) 
	 | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__tx_rateo) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__tx_rateo))))) {
	vlTOPp->__Vm_traceActivity = (0x8000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__142__PROF__m707__l88(vlSymsp);
	vlTOPp->_sequent__TOP__143__PROF__m707__l86(vlSymsp);
	vlTOPp->_sequent__TOP__144__PROF__m707__l88(vlSymsp);
    }
    if (((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__bd19200) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd19200)))) {
	vlTOPp->__Vm_traceActivity = (0x10000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__147__PROF__pt08__l197(vlSymsp);
	vlTOPp->_sequent__TOP__148__PROF__pt08__l195(vlSymsp);
	vlTOPp->_sequent__TOP__149__PROF__pt08__l197(vlSymsp);
    }
    if (((((IData)(vlTOPp->initialize) & (~ (IData)(vlTOPp->__Vclklast__TOP__initialize))) 
	  | ((~ (IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_)) 
	     & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_))) 
	 | ((~ (IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_shift)) 
	    & (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e2__DOT__m706__DOT__tti_shift)))) {
	vlTOPp->__Vm_traceActivity = (0x20000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__153__PROF__m706__l158(vlSymsp);
    }
    if ((((~ (IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__in_stop_)) 
	  & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__in_stop_)) 
	 | ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_shift) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e2__DOT__m706__DOT__tti_shift))))) {
	vlTOPp->__Vm_traceActivity = (0x40000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__158__PROF__m706__l188(vlSymsp);
    }
    if ((((~ (IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_)) 
	  & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_)) 
	 | ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_shift) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e2__DOT__m706__DOT__tti_shift))))) {
	vlTOPp->__Vm_traceActivity = (0x80000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__165__PROF__m706__l181(vlSymsp);
	vlTOPp->_sequent__TOP__166__PROF__m706__l180(vlSymsp);
	vlTOPp->_sequent__TOP__167__PROF__m706__l176(vlSymsp);
	vlTOPp->_sequent__TOP__169__PROF__m706__l181(vlSymsp);
	vlTOPp->_sequent__TOP__170__PROF__m706__l180(vlSymsp);
	vlTOPp->_sequent__TOP__171__PROF__m706__l49(vlSymsp);
    }
    if (((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__tx_rateo) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__tx_rateo)))) {
	vlTOPp->_sequent__TOP__172__PROF__m707__l73(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x100000U | vlTOPp->__Vm_traceActivity);
    }
    if ((((((((((((((IData)(vlTOPp->initialize) & (~ (IData)(vlTOPp->__Vclklast__TOP__initialize))) 
		   | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1) 
		      & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1)))) 
		  | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
		     ^ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift))) 
		 | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2) 
		    & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2)))) 
		| ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2) 
		   & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2)))) 
	       | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2) 
		  & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2)))) 
	      | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2) 
		 & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2)))) 
	     | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2) 
		& (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2)))) 
	    | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2) 
	       & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2)))) 
	   | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2) 
	      & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2)))) 
	  | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2) 
	     & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2)))) 
	 | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__tx_rateo) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__tx_rateo))))) {
	vlTOPp->_multiclk__TOP__173__PROF__m707__l85(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x200000U | vlTOPp->__Vm_traceActivity);
    }
    if (((((((((((((IData)(vlTOPp->initialize) & (~ (IData)(vlTOPp->__Vclklast__TOP__initialize))) 
		  | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1) 
		     & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1)))) 
		 | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
		    & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift)))) 
		| ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2) 
		   & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2)))) 
	       | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2) 
		  & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2)))) 
	      | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2) 
		 & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2)))) 
	     | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2) 
		& (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2)))) 
	    | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2) 
	       & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2)))) 
	   | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2) 
	      & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2)))) 
	  | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2) 
	     & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2)))) 
	 | ((IData)(vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2))))) {
	vlTOPp->_settle__TOP__175__PROF__m707__l83(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x400000U | vlTOPp->__Vm_traceActivity);
    }
    if ((((((IData)(vlTOPp->initialize) & (~ (IData)(vlTOPp->__Vclklast__TOP__initialize))) 
	   | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__start_bit) 
	      & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__start_bit)))) 
	  | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift) 
	     & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift)))) 
	 | ((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__tx_rateo) 
	    & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__tx_rateo))))) {
	vlTOPp->_settle__TOP__176__PROF__pt08__l31(vlSymsp);
	vlTOPp->_multiclk__TOP__184__PROF__pt08__l272(vlSymsp);
    }
    if (((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__bd9600) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd9600)))) {
	vlTOPp->__Vm_traceActivity = (0x800000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__187__PROF__pt08__l201(vlSymsp);
	vlTOPp->_sequent__TOP__188__PROF__pt08__l199(vlSymsp);
	vlTOPp->_sequent__TOP__189__PROF__pt08__l201(vlSymsp);
    }
    if ((((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale_in) 
	  & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e2__DOT__m706__DOT__clock_scale_in))) 
	 | ((~ (IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_)) 
	    & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_)))) {
	vlTOPp->_settle__TOP__177__PROF__m706__l71(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x1000000U | vlTOPp->__Vm_traceActivity);
    }
    vlTOPp->_settle__TOP__178__PROF__m706__l129(vlSymsp);
    vlTOPp->_settle__TOP__179__PROF__m706__l148(vlSymsp);
    vlTOPp->_settle__TOP__181__PROF__m706__l186(vlSymsp);
    vlTOPp->_combo__TOP__194__PROF__e2__l72(vlSymsp);
    vlTOPp->_combo__TOP__195__PROF__e2__l71(vlSymsp);
    vlTOPp->_combo__TOP__196__PROF__e2__l70(vlSymsp);
    vlTOPp->_combo__TOP__197__PROF__e2__l68(vlSymsp);
    vlTOPp->_combo__TOP__198__PROF__e2__l67(vlSymsp);
    vlTOPp->_combo__TOP__199__PROF__e2__l64(vlSymsp);
    vlTOPp->_combo__TOP__200__PROF__e2__l62(vlSymsp);
    vlTOPp->_combo__TOP__201__PROF__e2__l61(vlSymsp);
    if (((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__bd4800) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd4800)))) {
	vlTOPp->__Vm_traceActivity = (0x2000000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__221__PROF__pt08__l205(vlSymsp);
	vlTOPp->_sequent__TOP__222__PROF__pt08__l203(vlSymsp);
	vlTOPp->_sequent__TOP__223__PROF__pt08__l205(vlSymsp);
    }
    if (((((~ (IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clear_)) 
	   & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clear_)) 
	  | ((IData)(vlTOPp->pt08__DOT__e2__DOT__m706__DOT__active_clock) 
	     & (~ (IData)(vlTOPp->__Vclklast__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clock)))) 
	 | ((~ (IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_)) 
	    & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_)))) {
	vlTOPp->__Vm_traceActivity = (0x4000000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__227__PROF__m706__l149(vlSymsp);
    }
    vlTOPp->_settle__TOP__211__PROF__e2__l99(vlSymsp);
    vlTOPp->_settle__TOP__212__PROF__e2__l100(vlSymsp);
    vlTOPp->_settle__TOP__213__PROF__e2__l101(vlSymsp);
    vlTOPp->_settle__TOP__214__PROF__e2__l102(vlSymsp);
    vlTOPp->_settle__TOP__215__PROF__e2__l103(vlSymsp);
    vlTOPp->_settle__TOP__216__PROF__e2__l104(vlSymsp);
    vlTOPp->_settle__TOP__217__PROF__e2__l105(vlSymsp);
    vlTOPp->_settle__TOP__218__PROF__e2__l106(vlSymsp);
    vlTOPp->_combo__TOP__237__PROF__m706__l147(vlSymsp);
    vlTOPp->_combo__TOP__238__PROF__m706__l130(vlSymsp);
    vlTOPp->_combo__TOP__239__PROF__pt08__l37(vlSymsp);
    vlTOPp->_combo__TOP__240__PROF__pt08__l37(vlSymsp);
    vlTOPp->_combo__TOP__241__PROF__pt08__l38(vlSymsp);
    vlTOPp->_combo__TOP__242__PROF__pt08__l38(vlSymsp);
    vlTOPp->_combo__TOP__243__PROF__pt08__l38(vlSymsp);
    vlTOPp->_combo__TOP__244__PROF__pt08__l38(vlSymsp);
    vlTOPp->_combo__TOP__245__PROF__pt08__l38(vlSymsp);
    vlTOPp->_combo__TOP__246__PROF__pt08__l38(vlSymsp);
    if (((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__bd2400) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd2400)))) {
	vlTOPp->__Vm_traceActivity = (0x8000000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__249__PROF__pt08__l209(vlSymsp);
	vlTOPp->_sequent__TOP__250__PROF__pt08__l207(vlSymsp);
	vlTOPp->_sequent__TOP__251__PROF__pt08__l209(vlSymsp);
    }
    if (((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__bd1200) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd1200)))) {
	vlTOPp->__Vm_traceActivity = (0x10000000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__265__PROF__pt08__l213(vlSymsp);
	vlTOPp->_sequent__TOP__266__PROF__pt08__l211(vlSymsp);
	vlTOPp->_sequent__TOP__267__PROF__pt08__l213(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__bd1200)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd1200))) {
	vlTOPp->__Vm_traceActivity = (0x20000000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__269__PROF__pt08__l230(vlSymsp);
	vlTOPp->_sequent__TOP__270__PROF__pt08__l231(vlSymsp);
	vlTOPp->_sequent__TOP__271__PROF__pt08__l232(vlSymsp);
	vlTOPp->_sequent__TOP__272__PROF__pt08__l229(vlSymsp);
	vlTOPp->_sequent__TOP__273__PROF__pt08__l226(vlSymsp);
	vlTOPp->_sequent__TOP__274__PROF__pt08__l223(vlSymsp);
	vlTOPp->_sequent__TOP__275__PROF__pt08__l224(vlSymsp);
	vlTOPp->_sequent__TOP__276__PROF__pt08__l225(vlSymsp);
    }
    vlTOPp->_settle__TOP__262__PROF__pt08__l51(vlSymsp);
    if (((IData)(vlTOPp->__VinpClk__TOP__pt08__DOT__bd600) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd600)))) {
	vlTOPp->__Vm_traceActivity = (0x40000000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__280__PROF__pt08__l217(vlSymsp);
	vlTOPp->_sequent__TOP__281__PROF__pt08__l215(vlSymsp);
	vlTOPp->_sequent__TOP__282__PROF__pt08__l217(vlSymsp);
    }
    // Final
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tcf 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tcf;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__start_bit 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__start_bit;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__keyboard_flag 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__keyboard_flag;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_ 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_;
    vlTOPp->__Vclklast__TOP__clk = vlTOPp->clk;
    vlTOPp->__Vclklast__TOP__initialize = vlTOPp->initialize;
    vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1;
    vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2;
    vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2;
    vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2;
    vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2;
    vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2;
    vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2;
    vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2;
    vlTOPp->__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd115200 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__bd115200;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__n_t_2x 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__n_t_2x;
    vlTOPp->__Vclklast__TOP__rx_rate = vlTOPp->rx_rate;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__start_enable 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__start_enable;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__n_t_1x 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__n_t_1x;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__tx_ratem 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__tx_ratem;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd38400 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__bd38400;
    vlTOPp->__Vclklast__TOP__pt08__DOT__e2__DOT__m706__DOT__clock_scale_in 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__clock_scale_in;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__tx_rateo 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__tx_rateo;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd19200 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__bd19200;
    vlTOPp->__Vclklast__TOP__pt08__DOT__e2__DOT__m706__DOT__tti_shift 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__tti_shift;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__in_stop_ 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__in_stop_;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd9600 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__bd9600;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd4800 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__bd4800;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clear_ 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clear_;
    vlTOPp->__Vclklast__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clock 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__active_clock;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd2400 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__bd2400;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd1200 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__bd1200;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd600 
	= vlTOPp->__VinpClk__TOP__pt08__DOT__bd600;
    vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tcf 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tcf;
    vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_shift;
    vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__start_bit 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__start_bit;
    vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__keyboard_flag 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__keyboard_flag;
    vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_ 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__preset_;
    vlTOPp->__VinpClk__TOP__pt08__DOT__bd115200 = vlTOPp->pt08__DOT__bd115200;
    vlTOPp->__VinpClk__TOP__pt08__DOT__n_t_2x = vlTOPp->pt08__DOT__n_t_2x;
    vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__start_enable 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__start_enable;
    vlTOPp->__VinpClk__TOP__pt08__DOT__n_t_1x = vlTOPp->pt08__DOT__n_t_1x;
    vlTOPp->__VinpClk__TOP__pt08__DOT__e11__DOT__tx_ratem 
	= vlTOPp->pt08__DOT__e11__DOT__tx_ratem;
    vlTOPp->__VinpClk__TOP__pt08__DOT__bd38400 = vlTOPp->pt08__DOT__bd38400;
    vlTOPp->__VinpClk__TOP__pt08__DOT__tx_rateo = vlTOPp->pt08__DOT__tx_rateo;
    vlTOPp->__VinpClk__TOP__pt08__DOT__bd19200 = vlTOPp->pt08__DOT__bd19200;
    vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__in_stop_ 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop_;
    vlTOPp->__VinpClk__TOP__pt08__DOT__bd9600 = vlTOPp->pt08__DOT__bd9600;
    vlTOPp->__VinpClk__TOP__pt08__DOT__bd4800 = vlTOPp->pt08__DOT__bd4800;
    vlTOPp->__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clear_ 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__active_clear_;
    vlTOPp->__VinpClk__TOP__pt08__DOT__bd2400 = vlTOPp->pt08__DOT__bd2400;
    vlTOPp->__VinpClk__TOP__pt08__DOT__bd1200 = vlTOPp->pt08__DOT__bd1200;
    vlTOPp->__VinpClk__TOP__pt08__DOT__bd600 = vlTOPp->pt08__DOT__bd600;
}

void Vpt08::_eval_initial(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_eval_initial\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vpt08::final() {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::final\n"); );
    // Variables
    Vpt08__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vpt08::_eval_settle(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_eval_settle\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__1__PROF__pt08__l37(vlSymsp);
    vlTOPp->__Vm_traceActivity = (1U | vlTOPp->__Vm_traceActivity);
    vlTOPp->_settle__TOP__2__PROF__pt08__l37(vlSymsp);
    vlTOPp->_settle__TOP__3__PROF__pt08__l37(vlSymsp);
    vlTOPp->_settle__TOP__4__PROF__pt08__l37(vlSymsp);
    vlTOPp->_settle__TOP__5__PROF__m707__l95(vlSymsp);
    vlTOPp->_settle__TOP__6__PROF__m707__l108(vlSymsp);
    vlTOPp->_settle__TOP__7__PROF__m707__l108(vlSymsp);
    vlTOPp->_settle__TOP__8__PROF__m707__l108(vlSymsp);
    vlTOPp->_settle__TOP__9__PROF__m707__l108(vlSymsp);
    vlTOPp->_settle__TOP__10__PROF__m707__l108(vlSymsp);
    vlTOPp->_settle__TOP__11__PROF__m707__l108(vlSymsp);
    vlTOPp->_settle__TOP__12__PROF__m707__l108(vlSymsp);
    vlTOPp->_settle__TOP__13__PROF__m707__l108(vlSymsp);
    vlTOPp->_settle__TOP__14__PROF__pt08__l47(vlSymsp);
    vlTOPp->_settle__TOP__15__PROF__pt08__l49(vlSymsp);
    vlTOPp->_settle__TOP__16__PROF__pt08__l267(vlSymsp);
    vlTOPp->_settle__TOP__17__PROF__pt08__l266(vlSymsp);
    vlTOPp->_combo__TOP__41__PROF__pt08__l39(vlSymsp);
    vlTOPp->_combo__TOP__42__PROF__m707__l126(vlSymsp);
    vlTOPp->_combo__TOP__43__PROF__pt08__l39(vlSymsp);
    vlTOPp->_combo__TOP__44__PROF__m706__l174(vlSymsp);
    vlTOPp->_combo__TOP__45__PROF__m706__l109(vlSymsp);
    vlTOPp->_sequent__TOP__51__PROF__e2__l108(vlSymsp);
    vlTOPp->_settle__TOP__63__PROF__pt08__l237(vlSymsp);
    vlTOPp->_settle__TOP__64__PROF__pt08__l39(vlSymsp);
    vlTOPp->_combo__TOP__109__PROF__m707__l94(vlSymsp);
    vlTOPp->_sequent__TOP__102__PROF__m706__l68(vlSymsp);
    vlTOPp->_combo__TOP__110__PROF__pt08__l188(vlSymsp);
    vlTOPp->_settle__TOP__114__PROF__m706__l126(vlSymsp);
    vlTOPp->_multiclk__TOP__173__PROF__m707__l85(vlSymsp);
    vlTOPp->_settle__TOP__175__PROF__m707__l83(vlSymsp);
    vlTOPp->_settle__TOP__176__PROF__pt08__l31(vlSymsp);
    vlTOPp->_settle__TOP__177__PROF__m706__l71(vlSymsp);
    vlTOPp->_settle__TOP__178__PROF__m706__l129(vlSymsp);
    vlTOPp->_settle__TOP__179__PROF__m706__l148(vlSymsp);
    vlTOPp->_sequent__TOP__171__PROF__m706__l49(vlSymsp);
    vlTOPp->_settle__TOP__181__PROF__m706__l186(vlSymsp);
    vlTOPp->_multiclk__TOP__184__PROF__pt08__l272(vlSymsp);
    vlTOPp->_combo__TOP__194__PROF__e2__l72(vlSymsp);
    vlTOPp->_combo__TOP__195__PROF__e2__l71(vlSymsp);
    vlTOPp->_combo__TOP__196__PROF__e2__l70(vlSymsp);
    vlTOPp->_combo__TOP__197__PROF__e2__l68(vlSymsp);
    vlTOPp->_combo__TOP__198__PROF__e2__l67(vlSymsp);
    vlTOPp->_combo__TOP__199__PROF__e2__l64(vlSymsp);
    vlTOPp->_combo__TOP__200__PROF__e2__l62(vlSymsp);
    vlTOPp->_combo__TOP__201__PROF__e2__l61(vlSymsp);
    vlTOPp->_settle__TOP__211__PROF__e2__l99(vlSymsp);
    vlTOPp->_settle__TOP__212__PROF__e2__l100(vlSymsp);
    vlTOPp->_settle__TOP__213__PROF__e2__l101(vlSymsp);
    vlTOPp->_settle__TOP__214__PROF__e2__l102(vlSymsp);
    vlTOPp->_settle__TOP__215__PROF__e2__l103(vlSymsp);
    vlTOPp->_settle__TOP__216__PROF__e2__l104(vlSymsp);
    vlTOPp->_settle__TOP__217__PROF__e2__l105(vlSymsp);
    vlTOPp->_settle__TOP__218__PROF__e2__l106(vlSymsp);
    vlTOPp->_combo__TOP__237__PROF__m706__l147(vlSymsp);
    vlTOPp->_combo__TOP__238__PROF__m706__l130(vlSymsp);
    vlTOPp->_combo__TOP__239__PROF__pt08__l37(vlSymsp);
    vlTOPp->_combo__TOP__240__PROF__pt08__l37(vlSymsp);
    vlTOPp->_combo__TOP__241__PROF__pt08__l38(vlSymsp);
    vlTOPp->_combo__TOP__242__PROF__pt08__l38(vlSymsp);
    vlTOPp->_combo__TOP__243__PROF__pt08__l38(vlSymsp);
    vlTOPp->_combo__TOP__244__PROF__pt08__l38(vlSymsp);
    vlTOPp->_combo__TOP__245__PROF__pt08__l38(vlSymsp);
    vlTOPp->_combo__TOP__246__PROF__pt08__l38(vlSymsp);
    vlTOPp->_settle__TOP__262__PROF__pt08__l51(vlSymsp);
    vlTOPp->_sequent__TOP__273__PROF__pt08__l226(vlSymsp);
    vlTOPp->_sequent__TOP__274__PROF__pt08__l223(vlSymsp);
    vlTOPp->_sequent__TOP__275__PROF__pt08__l224(vlSymsp);
    vlTOPp->_sequent__TOP__276__PROF__pt08__l225(vlSymsp);
}

VL_INLINE_OPT QData Vpt08::_change_request(Vpt08__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_change_request\n"); );
    Vpt08* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    __req |= ((vlTOPp->pt08__DOT__tx_rateo ^ vlTOPp->__Vchglast__TOP__pt08__DOT__tx_rateo)
	 | (vlTOPp->pt08__DOT__bd115200 ^ vlTOPp->__Vchglast__TOP__pt08__DOT__bd115200)
	 | (vlTOPp->pt08__DOT__bd38400 ^ vlTOPp->__Vchglast__TOP__pt08__DOT__bd38400)
	 | (vlTOPp->pt08__DOT__bd19200 ^ vlTOPp->__Vchglast__TOP__pt08__DOT__bd19200)
	 | (vlTOPp->pt08__DOT__bd9600 ^ vlTOPp->__Vchglast__TOP__pt08__DOT__bd9600)
	 | (vlTOPp->pt08__DOT__bd4800 ^ vlTOPp->__Vchglast__TOP__pt08__DOT__bd4800)
	 | (vlTOPp->pt08__DOT__bd2400 ^ vlTOPp->__Vchglast__TOP__pt08__DOT__bd2400)
	 | (vlTOPp->pt08__DOT__bd1200 ^ vlTOPp->__Vchglast__TOP__pt08__DOT__bd1200)
	 | (vlTOPp->pt08__DOT__bd600 ^ vlTOPp->__Vchglast__TOP__pt08__DOT__bd600)
	 | (vlTOPp->pt08__DOT__n_t_1x ^ vlTOPp->__Vchglast__TOP__pt08__DOT__n_t_1x)
	|| (vlTOPp->pt08__DOT__n_t_2x ^ vlTOPp->__Vchglast__TOP__pt08__DOT__n_t_2x)
	 | (vlTOPp->pt08__DOT__e2__DOT__m706__DOT__keyboard_flag ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__keyboard_flag)
	 | (vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_active ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__in_active)
	 | (vlTOPp->pt08__DOT__e2__DOT__m706__DOT__start_enable ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__start_enable)
	 | (vlTOPp->pt08__DOT__e2__DOT__m706__DOT__active_clear_ ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clear_)
	 | (vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop_ ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__in_stop_)
	 | (vlTOPp->pt08__DOT__e2__DOT__m706__DOT__preset_ ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_)
	 | (vlTOPp->pt08__DOT__e11__DOT__tx_ratem ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e11__DOT__tx_ratem)
	 | (vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_shift ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift)
	 | (vlTOPp->pt08__DOT__e11__DOT__m707__DOT__start_bit ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__start_bit)
	|| (vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tcf ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__tcf)
	 | (vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_set));
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__tx_rateo ^ vlTOPp->__Vchglast__TOP__pt08__DOT__tx_rateo))) VL_PRINTF("	CHANGE: pt08.v:94: pt08.tx_rateo\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__bd115200 ^ vlTOPp->__Vchglast__TOP__pt08__DOT__bd115200))) VL_PRINTF("	CHANGE: pt08.v:137: pt08.bd115200\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__bd38400 ^ vlTOPp->__Vchglast__TOP__pt08__DOT__bd38400))) VL_PRINTF("	CHANGE: pt08.v:138: pt08.bd38400\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__bd19200 ^ vlTOPp->__Vchglast__TOP__pt08__DOT__bd19200))) VL_PRINTF("	CHANGE: pt08.v:139: pt08.bd19200\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__bd9600 ^ vlTOPp->__Vchglast__TOP__pt08__DOT__bd9600))) VL_PRINTF("	CHANGE: pt08.v:140: pt08.bd9600\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__bd4800 ^ vlTOPp->__Vchglast__TOP__pt08__DOT__bd4800))) VL_PRINTF("	CHANGE: pt08.v:141: pt08.bd4800\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__bd2400 ^ vlTOPp->__Vchglast__TOP__pt08__DOT__bd2400))) VL_PRINTF("	CHANGE: pt08.v:142: pt08.bd2400\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__bd1200 ^ vlTOPp->__Vchglast__TOP__pt08__DOT__bd1200))) VL_PRINTF("	CHANGE: pt08.v:143: pt08.bd1200\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__bd600 ^ vlTOPp->__Vchglast__TOP__pt08__DOT__bd600))) VL_PRINTF("	CHANGE: pt08.v:144: pt08.bd600\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__n_t_1x ^ vlTOPp->__Vchglast__TOP__pt08__DOT__n_t_1x))) VL_PRINTF("	CHANGE: pt08.v:174: pt08.n_t_1x\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__n_t_2x ^ vlTOPp->__Vchglast__TOP__pt08__DOT__n_t_2x))) VL_PRINTF("	CHANGE: pt08.v:175: pt08.n_t_2x\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__e2__DOT__m706__DOT__keyboard_flag ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__keyboard_flag))) VL_PRINTF("	CHANGE: m706.v:75: pt08.e2.m706.keyboard_flag\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_active ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__in_active))) VL_PRINTF("	CHANGE: m706.v:84: pt08.e2.m706.in_active\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__e2__DOT__m706__DOT__start_enable ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__start_enable))) VL_PRINTF("	CHANGE: m706.v:86: pt08.e2.m706.start_enable\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__e2__DOT__m706__DOT__active_clear_ ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clear_))) VL_PRINTF("	CHANGE: m706.v:88: pt08.e2.m706.active_clear_\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop_ ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__in_stop_))) VL_PRINTF("	CHANGE: m706.v:93: pt08.e2.m706.in_stop_\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__e2__DOT__m706__DOT__preset_ ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_))) VL_PRINTF("	CHANGE: m706.v:94: pt08.e2.m706.preset_\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__e11__DOT__tx_ratem ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e11__DOT__tx_ratem))) VL_PRINTF("	CHANGE: e11.v:91: pt08.e11.tx_ratem\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_shift ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift))) VL_PRINTF("	CHANGE: m707.v:41: pt08.e11.m707.tto_shift\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__e11__DOT__m707__DOT__start_bit ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__start_bit))) VL_PRINTF("	CHANGE: m707.v:50: pt08.e11.m707.start_bit\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tcf ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__tcf))) VL_PRINTF("	CHANGE: m707.v:50: pt08.e11.m707.tcf\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set ^ vlTOPp->__Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_set))) VL_PRINTF("	CHANGE: m707.v:93: pt08.e11.m707.tto_set\n"); );
    // Final
    vlTOPp->__Vchglast__TOP__pt08__DOT__tx_rateo = vlTOPp->pt08__DOT__tx_rateo;
    vlTOPp->__Vchglast__TOP__pt08__DOT__bd115200 = vlTOPp->pt08__DOT__bd115200;
    vlTOPp->__Vchglast__TOP__pt08__DOT__bd38400 = vlTOPp->pt08__DOT__bd38400;
    vlTOPp->__Vchglast__TOP__pt08__DOT__bd19200 = vlTOPp->pt08__DOT__bd19200;
    vlTOPp->__Vchglast__TOP__pt08__DOT__bd9600 = vlTOPp->pt08__DOT__bd9600;
    vlTOPp->__Vchglast__TOP__pt08__DOT__bd4800 = vlTOPp->pt08__DOT__bd4800;
    vlTOPp->__Vchglast__TOP__pt08__DOT__bd2400 = vlTOPp->pt08__DOT__bd2400;
    vlTOPp->__Vchglast__TOP__pt08__DOT__bd1200 = vlTOPp->pt08__DOT__bd1200;
    vlTOPp->__Vchglast__TOP__pt08__DOT__bd600 = vlTOPp->pt08__DOT__bd600;
    vlTOPp->__Vchglast__TOP__pt08__DOT__n_t_1x = vlTOPp->pt08__DOT__n_t_1x;
    vlTOPp->__Vchglast__TOP__pt08__DOT__n_t_2x = vlTOPp->pt08__DOT__n_t_2x;
    vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__keyboard_flag 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__keyboard_flag;
    vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__in_active 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_active;
    vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__start_enable 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__start_enable;
    vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clear_ 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__active_clear_;
    vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__in_stop_ 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__in_stop_;
    vlTOPp->__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_ 
	= vlTOPp->pt08__DOT__e2__DOT__m706__DOT__preset_;
    vlTOPp->__Vchglast__TOP__pt08__DOT__e11__DOT__tx_ratem 
	= vlTOPp->pt08__DOT__e11__DOT__tx_ratem;
    vlTOPp->__Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_shift;
    vlTOPp->__Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__start_bit 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__start_bit;
    vlTOPp->__Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__tcf 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tcf;
    vlTOPp->__Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_set 
	= vlTOPp->pt08__DOT__e11__DOT__m707__DOT__tto_set;
    return __req;
}

void Vpt08::_ctor_var_reset() {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_ctor_var_reset\n"); );
    // Body
    clk = VL_RAND_RESET_I(1);
    dsrttl = VL_RAND_RESET_I(1);
    txdttl = VL_RAND_RESET_I(1);
    rxdttl = VL_RAND_RESET_I(1);
    rx_rate = VL_RAND_RESET_I(1);
    bmb0 = VL_RAND_RESET_I(1);
    bmb1 = VL_RAND_RESET_I(1);
    bmb2 = VL_RAND_RESET_I(1);
    bmb3 = VL_RAND_RESET_I(1);
    bmb4 = VL_RAND_RESET_I(1);
    bmb5 = VL_RAND_RESET_I(1);
    bmb6 = VL_RAND_RESET_I(1);
    bmb7 = VL_RAND_RESET_I(1);
    bmb8 = VL_RAND_RESET_I(1);
    bmb9 = VL_RAND_RESET_I(1);
    bmb10 = VL_RAND_RESET_I(1);
    bmb11 = VL_RAND_RESET_I(1);
    bmb3_l = VL_RAND_RESET_I(1);
    bmb4_l = VL_RAND_RESET_I(1);
    bmb5_l = VL_RAND_RESET_I(1);
    bmb6_l = VL_RAND_RESET_I(1);
    bmb7_l = VL_RAND_RESET_I(1);
    bmb8_l = VL_RAND_RESET_I(1);
    bac0 = VL_RAND_RESET_I(1);
    bac1 = VL_RAND_RESET_I(1);
    bac2 = VL_RAND_RESET_I(1);
    bac3 = VL_RAND_RESET_I(1);
    bac4 = VL_RAND_RESET_I(1);
    bac5 = VL_RAND_RESET_I(1);
    bac6 = VL_RAND_RESET_I(1);
    bac7 = VL_RAND_RESET_I(1);
    bac8 = VL_RAND_RESET_I(1);
    bac9 = VL_RAND_RESET_I(1);
    bac10 = VL_RAND_RESET_I(1);
    bac11 = VL_RAND_RESET_I(1);
    biop1 = VL_RAND_RESET_I(1);
    biop2 = VL_RAND_RESET_I(1);
    biop4 = VL_RAND_RESET_I(1);
    bts1 = VL_RAND_RESET_I(1);
    bts3 = VL_RAND_RESET_I(1);
    initialize = VL_RAND_RESET_I(1);
    iob0_l = VL_RAND_RESET_I(1);
    iob1_l = VL_RAND_RESET_I(1);
    iob2_l = VL_RAND_RESET_I(1);
    iob3_l = VL_RAND_RESET_I(1);
    iob4_l = VL_RAND_RESET_I(1);
    iob5_l = VL_RAND_RESET_I(1);
    iob6_l = VL_RAND_RESET_I(1);
    iob7_l = VL_RAND_RESET_I(1);
    iob8_l = VL_RAND_RESET_I(1);
    iob9_l = VL_RAND_RESET_I(1);
    iob10_l = VL_RAND_RESET_I(1);
    iob11_l = VL_RAND_RESET_I(1);
    skip_l = VL_RAND_RESET_I(1);
    irq_l = VL_RAND_RESET_I(1);
    acclr_l = VL_RAND_RESET_I(1);
    run = VL_RAND_RESET_I(1);
    pt08__DOT__mb = 0;
    pt08__DOT__ac = 0;
    pt08__DOT__ib = 0;
    pt08__DOT__rx_sel = VL_RAND_RESET_I(1);
    pt08__DOT__tx_sel = VL_RAND_RESET_I(1);
    pt08__DOT__tx_rateo = VL_RAND_RESET_I(1);
    pt08__DOT__bd115200 = VL_RAND_RESET_I(1);
    pt08__DOT__bd38400 = VL_RAND_RESET_I(1);
    pt08__DOT__bd19200 = VL_RAND_RESET_I(1);
    pt08__DOT__bd9600 = VL_RAND_RESET_I(1);
    pt08__DOT__bd4800 = VL_RAND_RESET_I(1);
    pt08__DOT__bd2400 = VL_RAND_RESET_I(1);
    pt08__DOT__bd1200 = VL_RAND_RESET_I(1);
    pt08__DOT__bd600 = VL_RAND_RESET_I(1);
    pt08__DOT__bd300 = VL_RAND_RESET_I(1);
    pt08__DOT__n_t_1x = VL_RAND_RESET_I(1);
    pt08__DOT__n_t_2x = VL_RAND_RESET_I(1);
    pt08__DOT__div11a = VL_RAND_RESET_I(1);
    pt08__DOT__div11b = VL_RAND_RESET_I(1);
    pt08__DOT__div11c = VL_RAND_RESET_I(1);
    pt08__DOT__div11d = VL_RAND_RESET_I(1);
    pt08__DOT__ndiv11a = VL_RAND_RESET_I(1);
    pt08__DOT__ndiv11b = VL_RAND_RESET_I(1);
    pt08__DOT__ndiv11c = VL_RAND_RESET_I(1);
    pt08__DOT__ndiv11d = VL_RAND_RESET_I(1);
    { int __Vi0=0; for (; __Vi0<8; ++__Vi0) {
	    pt08__DOT__e2__DOT__tt_[__Vi0] = VL_RAND_RESET_I(1);
    }}
    pt08__DOT__e2__DOT__buffer_strobe = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__iob4_l__out__en4 = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__iob5_l__out__en5 = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__iob6_l__out__en6 = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__iob7_l__out__en7 = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__iob8_l__out__en8 = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__iob9_l__out__en9 = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__iob10_l__out__en10 = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__iob11_l__out__en11 = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__m706__DOT__keyboard_flag = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__m706__DOT__tti_skip_ = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__m706__DOT__tti02 = VL_RAND_RESET_I(3);
    pt08__DOT__e2__DOT__m706__DOT__tti37 = VL_RAND_RESET_I(5);
    pt08__DOT__e2__DOT__m706__DOT__tt_ = VL_RAND_RESET_I(8);
    pt08__DOT__e2__DOT__m706__DOT__reader_run = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__m706__DOT__clock_scale = VL_RAND_RESET_I(3);
    pt08__DOT__e2__DOT__m706__DOT__in_stop = VL_RAND_RESET_I(2);
    pt08__DOT__e2__DOT__m706__DOT__spike_detector = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__m706__DOT__in_active = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__m706__DOT__in_last_unit = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__m706__DOT__start_enable = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__m706__DOT__active_clear_ = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__m706__DOT__tti3_set = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__m706__DOT__clock_scale_in = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__m706__DOT__in_stop_ = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__m706__DOT__tti_shift = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__m706__DOT__preset_ = VL_RAND_RESET_I(1);
    pt08__DOT__e2__DOT__m706__DOT__active_clock = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__skip_ = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__tx_rate = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__tx_ratem = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__m707__DOT__line = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__m707__DOT__teleprinter_flag = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__m707__DOT__out_stop = VL_RAND_RESET_I(3);
    pt08__DOT__e11__DOT__m707__DOT__tto_shift = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__m707__DOT__out_active = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__m707__DOT__tto = VL_RAND_RESET_I(9);
    pt08__DOT__e11__DOT__m707__DOT__tto0_ = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__m707__DOT__start_bit = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__m707__DOT__tcf = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__m707__DOT__tto_set = VL_RAND_RESET_I(9);
    pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1 = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2 = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2 = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2 = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2 = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2 = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2 = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2 = VL_RAND_RESET_I(1);
    pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2 = VL_RAND_RESET_I(1);
    __Vdly__pt08__DOT__bd115200 = VL_RAND_RESET_I(1);
    __Vdly__pt08__DOT__n_t_1x = VL_RAND_RESET_I(1);
    __Vdly__pt08__DOT__bd38400 = VL_RAND_RESET_I(1);
    __Vdly__pt08__DOT__bd19200 = VL_RAND_RESET_I(1);
    __Vdly__pt08__DOT__bd9600 = VL_RAND_RESET_I(1);
    __Vdly__pt08__DOT__bd4800 = VL_RAND_RESET_I(1);
    __Vdly__pt08__DOT__bd2400 = VL_RAND_RESET_I(1);
    __Vdly__pt08__DOT__bd1200 = VL_RAND_RESET_I(1);
    __Vdly__pt08__DOT__bd600 = VL_RAND_RESET_I(1);
    __Vdly__pt08__DOT__bd300 = VL_RAND_RESET_I(1);
    __Vdly__pt08__DOT__e2__DOT__m706__DOT__clock_scale = VL_RAND_RESET_I(3);
    __Vdly__pt08__DOT__e2__DOT__m706__DOT__in_stop = VL_RAND_RESET_I(2);
    __Vdly__pt08__DOT__e2__DOT__m706__DOT__tti02 = VL_RAND_RESET_I(3);
    __Vdly__pt08__DOT__e2__DOT__m706__DOT__tti37 = VL_RAND_RESET_I(5);
    __Vdly__pt08__DOT__e11__DOT__tx_ratem = VL_RAND_RESET_I(1);
    __Vdly__pt08__DOT__tx_rateo = VL_RAND_RESET_I(1);
    __Vdly__pt08__DOT__e11__DOT__m707__DOT__tto_shift = VL_RAND_RESET_I(1);
    __Vdly__pt08__DOT__e11__DOT__m707__DOT__out_stop = VL_RAND_RESET_I(3);
    __Vdly__pt08__DOT__e11__DOT__m707__DOT__out_active = VL_RAND_RESET_I(1);
    __Vdly__pt08__DOT__e11__DOT__m707__DOT__tto = VL_RAND_RESET_I(9);
    __VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tcf = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__start_bit = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__keyboard_flag = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_ = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__bd115200 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__n_t_2x = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__start_enable = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__n_t_1x = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__e11__DOT__tx_ratem = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__bd38400 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__tx_rateo = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__bd19200 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__in_stop_ = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__bd9600 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__bd4800 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clear_ = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__bd2400 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__bd1200 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__pt08__DOT__bd600 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tcf = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__start_bit = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__keyboard_flag = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_ = VL_RAND_RESET_I(1);
    __Vclklast__TOP__clk = VL_RAND_RESET_I(1);
    __Vclklast__TOP__initialize = VL_RAND_RESET_I(1);
    __Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1 = VL_RAND_RESET_I(1);
    __Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2 = VL_RAND_RESET_I(1);
    __Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2 = VL_RAND_RESET_I(1);
    __Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2 = VL_RAND_RESET_I(1);
    __Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2 = VL_RAND_RESET_I(1);
    __Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2 = VL_RAND_RESET_I(1);
    __Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2 = VL_RAND_RESET_I(1);
    __Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2 = VL_RAND_RESET_I(1);
    __Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd115200 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__n_t_2x = VL_RAND_RESET_I(1);
    __Vclklast__TOP__rx_rate = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__start_enable = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__n_t_1x = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__tx_ratem = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd38400 = VL_RAND_RESET_I(1);
    __Vclklast__TOP__pt08__DOT__e2__DOT__m706__DOT__clock_scale_in = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__tx_rateo = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd19200 = VL_RAND_RESET_I(1);
    __Vclklast__TOP__pt08__DOT__e2__DOT__m706__DOT__tti_shift = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__in_stop_ = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd9600 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd4800 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clear_ = VL_RAND_RESET_I(1);
    __Vclklast__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clock = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd2400 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd1200 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd600 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__tx_rateo = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__bd115200 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__bd38400 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__bd19200 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__bd9600 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__bd4800 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__bd2400 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__bd1200 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__bd600 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__n_t_1x = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__n_t_2x = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__keyboard_flag = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__in_active = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__start_enable = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clear_ = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__in_stop_ = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_ = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__e11__DOT__tx_ratem = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__start_bit = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__tcf = VL_RAND_RESET_I(1);
    __Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_set = VL_RAND_RESET_I(9);
    __Vm_traceActivity = VL_RAND_RESET_I(32);
}

void Vpt08::_configure_coverage(Vpt08__Syms* __restrict vlSymsp, bool first) {
    VL_DEBUG_IF(VL_PRINTF("    Vpt08::_configure_coverage\n"); );
}
