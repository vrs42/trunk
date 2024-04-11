// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vcpld.h for the primary calling header

#include "Vcpld.h"             // For This
#include "Vcpld__Syms.h"

//--------------------
// STATIC VARIABLES


//--------------------

VL_CTOR_IMP(Vcpld) {
    Vcpld__Syms* __restrict vlSymsp = __VlSymsp = new Vcpld__Syms(this, name());
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Vcpld::__Vconfigure(Vcpld__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

Vcpld::~Vcpld() {
    delete __VlSymsp; __VlSymsp=NULL;
}

//--------------------


void Vcpld::eval() {
    Vcpld__Syms* __restrict vlSymsp = this->__VlSymsp; // Setup global symbol table
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    VL_DEBUG_IF(VL_PRINTF("\n----TOP Evaluate Vcpld::eval\n"); );
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

void Vcpld::_eval_initial_loop(Vcpld__Syms* __restrict vlSymsp) {
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

void Vcpld::_settle__TOP__1__PROF__cpld__l143(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__1__PROF__cpld__l143\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data03_l = 1U;
}

void Vcpld::_settle__TOP__2__PROF__cpld__l144(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__2__PROF__cpld__l144\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data02_l = 1U;
}

void Vcpld::_settle__TOP__3__PROF__cpld__l145(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__3__PROF__cpld__l145\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data01_l = 1U;
}

void Vcpld::_settle__TOP__4__PROF__cpld__l146(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__4__PROF__cpld__l146\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data00_l = 1U;
}

VL_INLINE_OPT void Vcpld::_settle__TOP__5__PROF__M8650D__l765(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__5__PROF__M8650D__l765\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:765
    if (vlTOPp->cpld__DOT__h12) {
	if (vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l) {
	    vlTOPp->cpld__DOT__m8650d__DOT__start_l_m = 0U;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__start_l_m = 1U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__6__PROF__M8650D__l876(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__6__PROF__M8650D__l876\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:876
    if (vlTOPp->cpld__DOT__m8650d__DOT__tx_div) {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__h12)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_146x_m 
		= vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_146x_m = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__7__PROF__cpld__l178(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__7__PROF__cpld__l178\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md = ((0xfffff000U & vlTOPp->cpld__DOT__md) 
			     | ((0x800U & ((~ (IData)(vlTOPp->md00_l)) 
					   << 0xbU)) 
				| ((0x400U & ((~ (IData)(vlTOPp->md01_l)) 
					      << 0xaU)) 
				   | ((0x200U & ((~ (IData)(vlTOPp->md02_l)) 
						 << 9U)) 
				      | ((0x100U & 
					  ((~ (IData)(vlTOPp->md03_l)) 
					   << 8U)) 
					 | ((0x80U 
					     & ((~ (IData)(vlTOPp->md04_l)) 
						<< 7U)) 
					    | ((0x40U 
						& ((~ (IData)(vlTOPp->md05_l)) 
						   << 6U)) 
					       | ((0x20U 
						   & ((~ (IData)(vlTOPp->md06_l)) 
						      << 5U)) 
						  | ((0x10U 
						      & ((~ (IData)(vlTOPp->md07_l)) 
							 << 4U)) 
						     | ((8U 
							 & ((~ (IData)(vlTOPp->md08_l)) 
							    << 3U)) 
							| ((4U 
							    & ((~ (IData)(vlTOPp->md09_l)) 
							       << 2U)) 
							   | ((2U 
							       & ((~ (IData)(vlTOPp->md10_l)) 
								  << 1U)) 
							      | (1U 
								 & (~ (IData)(vlTOPp->md11_l)))))))))))))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__8__PROF__M8650D__l681(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__8__PROF__M8650D__l681\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:681
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__tx_div_m = 1U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__h12)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__tx_div_m 
		= (1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_div) 
			    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l)))));
	}
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__9__PROF__M8650D__l490(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__9__PROF__M8650D__l490\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:490
    if (vlTOPp->power_ok) {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_71x) {
	    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_70x) {
		vlTOPp->cpld__DOT__m8650d__DOT__rx_active_m = 0U;
	    }
	} else {
	    vlTOPp->cpld__DOT__m8650d__DOT__rx_active_m = 1U;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__rx_active_m = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__10__PROF__cpld__l429(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__10__PROF__cpld__l429\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md08_in = ((((~ (IData)(vlTOPp->tp_ab1)) 
				    & (~ (IData)(vlTOPp->tp_ba1))) 
				   | ((IData)(vlTOPp->tp_ab1) 
				      & (IData)(vlTOPp->tp_ba1))) 
				  & (IData)(vlTOPp->tp_bb1));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__11__PROF__cpld__l419(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__11__PROF__cpld__l419\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md06_in = (((IData)(vlTOPp->tp_ab1) 
				   & (~ (IData)(vlTOPp->tp_ba1))) 
				  | (((IData)(vlTOPp->tp_ab1) 
				      & (IData)(vlTOPp->tp_ba1)) 
				     & (~ (IData)(vlTOPp->tp_bb1))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__12__PROF__cpld__l400(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__12__PROF__cpld__l400\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md03_set = (((~ (IData)(vlTOPp->tp_ab1)) 
				    & (IData)(vlTOPp->tp_ba1)) 
				   | ((IData)(vlTOPp->tp_ab1) 
				      & (~ (IData)(vlTOPp->tp_ba1))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__13__PROF__cpld__l403(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__13__PROF__cpld__l403\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md05_set = ((IData)(vlTOPp->tp_ab1) 
				   & (IData)(vlTOPp->tp_ba1));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__14__PROF__cpld__l402(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__14__PROF__cpld__l402\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md04_set = (((IData)(vlTOPp->tp_ab1) 
				    & (IData)(vlTOPp->tp_ba1)) 
				   & (~ (IData)(vlTOPp->tp_bb1)));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__15__PROF__cpld__l423(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__15__PROF__cpld__l423\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md07_set = ((((~ (IData)(vlTOPp->tp_ab1)) 
				     & (IData)(vlTOPp->tp_ba1)) 
				    | ((IData)(vlTOPp->tp_ab1) 
				       & (~ (IData)(vlTOPp->tp_ba1)))) 
				   & (IData)(vlTOPp->tp_bb1));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__18__PROF__M8650D__l410(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__18__PROF__M8650D__l410\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__n_t_155x 
	= vlTOPp->cpld__DOT__m8650d__DOT__n_t_155x;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__19__PROF__M8650D__l408(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__19__PROF__M8650D__l408\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:408
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_154x_m)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__n_t_155x 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_155x)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__22__PROF__M8650D__l414(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__22__PROF__M8650D__l414\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_0 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_0;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__23__PROF__M8650D__l412(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__23__PROF__M8650D__l412\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:412
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_155x)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_0 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_0)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__26__PROF__M8650D__l418(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__26__PROF__M8650D__l418\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_1 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_1;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__27__PROF__M8650D__l416(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__27__PROF__M8650D__l416\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:416
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_0)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_1 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_1)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__30__PROF__M8650D__l422(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__30__PROF__M8650D__l422\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd2400 
	= vlTOPp->cpld__DOT__m8650d__DOT__bd2400;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__31__PROF__M8650D__l420(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__31__PROF__M8650D__l420\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:420
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_1)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd2400 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd2400)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__34__PROF__M8650D__l660(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__34__PROF__M8650D__l660\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd1200 
	= vlTOPp->cpld__DOT__m8650d__DOT__bd1200;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__35__PROF__M8650D__l658(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__35__PROF__M8650D__l658\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:658
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd2400)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd1200 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd1200)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__38__PROF__M8650D__l664(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__38__PROF__M8650D__l664\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd600 = vlTOPp->cpld__DOT__m8650d__DOT__bd600;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__39__PROF__M8650D__l662(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__39__PROF__M8650D__l662\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:662
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd1200)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd600 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd600)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__42__PROF__M8650D__l668(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__42__PROF__M8650D__l668\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd300 = vlTOPp->cpld__DOT__m8650d__DOT__bd300;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__43__PROF__M8650D__l666(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__43__PROF__M8650D__l666\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:666
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd600)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd300 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd300)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__46__PROF__M8650D__l672(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__46__PROF__M8650D__l672\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd150 = vlTOPp->cpld__DOT__m8650d__DOT__bd150;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__47__PROF__M8650D__l670(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__47__PROF__M8650D__l670\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:670
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd300)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd150 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd150)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__48__PROF__M8650D__l672(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__48__PROF__M8650D__l672\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__bd150 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd150;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__51__PROF__M8650D__l729(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__51__PROF__M8650D__l729\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_2 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__52__PROF__M8650D__l727(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__52__PROF__M8650D__l727\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:727
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__h12)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_2 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__55__PROF__M8650D__l733(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__55__PROF__M8650D__l733\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_3 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__56__PROF__M8650D__l731(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__56__PROF__M8650D__l731\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:731
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_3 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__59__PROF__M8650D__l737(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__59__PROF__M8650D__l737\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__n_t_162x 
	= vlTOPp->cpld__DOT__m8650d__DOT__n_t_162x;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__60__PROF__M8650D__l735(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__60__PROF__M8650D__l735\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:735
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__n_t_162x 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_162x)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__61__PROF__M8650D__l737(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__61__PROF__M8650D__l737\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_162x = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__n_t_162x;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__64__PROF__M8650D__l725(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__64__PROF__M8650D__l725\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__h12 = vlTOPp->cpld__DOT__h12;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__65__PROF__M8650D__l723(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__65__PROF__M8650D__l723\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:723
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__ratex2)))) {
	vlTOPp->__Vdly__cpld__DOT__h12 = (1U & (~ (IData)(vlTOPp->cpld__DOT__h12)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__66__PROF__M8650D__l725(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__66__PROF__M8650D__l725\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__h12 = vlTOPp->__Vdly__cpld__DOT__h12;
}

VL_INLINE_OPT void Vcpld::_combo__TOP__78__PROF__M8650D__l775(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__78__PROF__M8650D__l775\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:775
    if (vlTOPp->cpld__DOT__h12) {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__start_l 
		= vlTOPp->cpld__DOT__m8650d__DOT__start_l_m;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__start_l = 1U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__79__PROF__M8650D__l885(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__79__PROF__M8650D__l885\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:885
    if (vlTOPp->cpld__DOT__m8650d__DOT__tx_div) {
	if (vlTOPp->cpld__DOT__h12) {
	    vlTOPp->cpld__DOT__j23 = vlTOPp->cpld__DOT__m8650d__DOT__n_t_146x_m;
	}
    } else {
	vlTOPp->cpld__DOT__j23 = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__80__PROF__M8650D__l691(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__80__PROF__M8650D__l691\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:691
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__tx_div = 1U;
    } else {
	if (vlTOPp->cpld__DOT__h12) {
	    vlTOPp->cpld__DOT__m8650d__DOT__tx_div 
		= vlTOPp->cpld__DOT__m8650d__DOT__tx_div_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__81__PROF__M8650D__l500(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__81__PROF__M8650D__l500\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:500
    if (vlTOPp->power_ok) {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_71x) {
	    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_70x)))) {
		vlTOPp->cpld__DOT__m8650d__DOT__rx_active 
		    = vlTOPp->cpld__DOT__m8650d__DOT__rx_active_m;
	    }
	} else {
	    vlTOPp->cpld__DOT__m8650d__DOT__rx_active = 1U;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__rx_active = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__82__PROF__cpld__l421(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__82__PROF__cpld__l421\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md06_out = ((IData)(vlTOPp->cpld__DOT__md06_in) 
				   | (((~ (IData)(vlTOPp->tp_ab1)) 
				       & (~ (IData)(vlTOPp->tp_ba1))) 
				      & (IData)(vlTOPp->tp_bb1)));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__83__PROF__cpld__l404(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__83__PROF__cpld__l404\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md03_ok = (((IData)(vlTOPp->cpld__DOT__md03_set) 
				   & (~ (IData)(vlTOPp->md03_l))) 
				  | ((~ (IData)(vlTOPp->cpld__DOT__md03_set)) 
				     & (IData)(vlTOPp->md03_l)));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__84__PROF__cpld__l408(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__84__PROF__cpld__l408\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md05_ok = (((IData)(vlTOPp->cpld__DOT__md05_set) 
				   & (~ (IData)(vlTOPp->md05_l))) 
				  | ((~ (IData)(vlTOPp->cpld__DOT__md05_set)) 
				     & (IData)(vlTOPp->md05_l)));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__85__PROF__cpld__l406(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__85__PROF__cpld__l406\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md04_ok = (((IData)(vlTOPp->cpld__DOT__md04_set) 
				   & (~ (IData)(vlTOPp->md04_l))) 
				  | ((~ (IData)(vlTOPp->cpld__DOT__md04_set)) 
				     & (IData)(vlTOPp->md04_l)));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__86__PROF__cpld__l425(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__86__PROF__cpld__l425\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md07_in = ((IData)(vlTOPp->cpld__DOT__md07_set) 
				  | (((~ (IData)(vlTOPp->tp_ab1)) 
				      & (~ (IData)(vlTOPp->tp_ba1))) 
				     & (IData)(vlTOPp->tp_bb1)));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__87__PROF__cpld__l427(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__87__PROF__cpld__l427\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md07_out = ((IData)(vlTOPp->cpld__DOT__md07_set) 
				   | (((IData)(vlTOPp->tp_ab1) 
				       & (IData)(vlTOPp->tp_ba1)) 
				      & (IData)(vlTOPp->tp_bb1)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__90__PROF__cpld__l323(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__90__PROF__cpld__l323\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd115200 = vlTOPp->cpld__DOT__bd115200;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__91__PROF__cpld__l321(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__91__PROF__cpld__l321\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:321
    vlTOPp->__Vdly__cpld__DOT__bd115200 = (1U & (~ (IData)(vlTOPp->cpld__DOT__bd115200)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__92__PROF__cpld__l323(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__92__PROF__cpld__l323\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd115200 = vlTOPp->__Vdly__cpld__DOT__bd115200;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__93__PROF__M8650D__l410(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__93__PROF__M8650D__l410\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_155x = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__n_t_155x;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__94__PROF__M8650D__l414(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__94__PROF__M8650D__l414\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__gdollar_0 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_0;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__95__PROF__M8650D__l418(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__95__PROF__M8650D__l418\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__gdollar_1 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_1;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__96__PROF__M8650D__l422(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__96__PROF__M8650D__l422\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__bd2400 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd2400;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__97__PROF__M8650D__l660(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__97__PROF__M8650D__l660\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__bd1200 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd1200;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__98__PROF__M8650D__l664(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__98__PROF__M8650D__l664\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__bd600 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd600;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__99__PROF__M8650D__l668(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__99__PROF__M8650D__l668\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__bd300 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd300;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__100__PROF__M8650D__l729(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__100__PROF__M8650D__l729\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_2;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__101__PROF__M8650D__l733(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__101__PROF__M8650D__l733\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_3;
}

VL_INLINE_OPT void Vcpld::_settle__TOP__112__PROF__M8650D__l892(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__112__PROF__M8650D__l892\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:892
    if (vlTOPp->cpld__DOT__m8650d__DOT__tx_div) {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__h12)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__gdollar_7_m 
		= vlTOPp->cpld__DOT__j23;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__gdollar_7_m = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__113__PROF__M8650D__l654(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__113__PROF__M8650D__l654\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_91x = (1U & 
					       (~ (
						   (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_active)) 
						   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__114__PROF__M8650D__l510(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__114__PROF__M8650D__l510\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:510
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x) {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_active)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l_m = 0U;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l_m = 1U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__115__PROF__M8650D__l653(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__115__PROF__M8650D__l653\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_80x = (1U & 
					       (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_active) 
						   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__116__PROF__cpld__l432(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__116__PROF__cpld__l432\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__rx_sel_l = (1U & (~ ((((((IData)(vlTOPp->cpld__DOT__md03_ok) 
						& (IData)(vlTOPp->cpld__DOT__md04_ok)) 
					       & (IData)(vlTOPp->cpld__DOT__md05_ok)) 
					      & (((IData)(vlTOPp->cpld__DOT__md06_in) 
						  & (~ (IData)(vlTOPp->md06_l))) 
						 | ((~ (IData)(vlTOPp->cpld__DOT__md06_in)) 
						    & (IData)(vlTOPp->md06_l)))) 
					     & (((IData)(vlTOPp->cpld__DOT__md07_in) 
						 & (~ (IData)(vlTOPp->md07_l))) 
						| ((~ (IData)(vlTOPp->cpld__DOT__md07_in)) 
						   & (IData)(vlTOPp->md07_l)))) 
					    & (((IData)(vlTOPp->cpld__DOT__md08_in) 
						& (~ (IData)(vlTOPp->md08_l))) 
					       | ((~ (IData)(vlTOPp->cpld__DOT__md08_in)) 
						  & (IData)(vlTOPp->md08_l))))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__117__PROF__cpld__l436(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__117__PROF__cpld__l436\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__tx_sel_l = (1U & (~ ((((((IData)(vlTOPp->cpld__DOT__md03_ok) 
						& (IData)(vlTOPp->cpld__DOT__md04_ok)) 
					       & (IData)(vlTOPp->cpld__DOT__md05_ok)) 
					      & (((IData)(vlTOPp->cpld__DOT__md06_out) 
						  & (~ (IData)(vlTOPp->md06_l))) 
						 | ((~ (IData)(vlTOPp->cpld__DOT__md06_out)) 
						    & (IData)(vlTOPp->md06_l)))) 
					     & (((IData)(vlTOPp->cpld__DOT__md07_out) 
						 & (~ (IData)(vlTOPp->md07_l))) 
						| ((~ (IData)(vlTOPp->cpld__DOT__md07_out)) 
						   & (IData)(vlTOPp->md07_l)))) 
					    & (((~ (IData)(vlTOPp->cpld__DOT__md08_in)) 
						& (~ (IData)(vlTOPp->md08_l))) 
					       | ((IData)(vlTOPp->cpld__DOT__md08_in) 
						  & (IData)(vlTOPp->md08_l))))));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__120__PROF__cpld__l332(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__120__PROF__cpld__l332\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__n_t_1x = vlTOPp->cpld__DOT__n_t_1x;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__121__PROF__cpld__l328(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__121__PROF__cpld__l328\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:328
    vlTOPp->__Vdly__cpld__DOT__n_t_1x = ((IData)(vlTOPp->cpld__DOT__n_t_2x) 
					 & (~ (IData)(vlTOPp->cpld__DOT__n_t_1x)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__122__PROF__cpld__l332(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__122__PROF__cpld__l332\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__n_t_1x = vlTOPp->__Vdly__cpld__DOT__n_t_1x;
}

VL_INLINE_OPT void Vcpld::_combo__TOP__129__PROF__M8650D__l901(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__129__PROF__M8650D__l901\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:901
    if (vlTOPp->cpld__DOT__m8650d__DOT__tx_div) {
	if (vlTOPp->cpld__DOT__h12) {
	    vlTOPp->cpld__DOT__m8650d__DOT__gdollar_7 
		= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_7_m;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__gdollar_7 = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__130__PROF__M8650D__l520(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__130__PROF__M8650D__l520\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:520
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x) {
	if (vlTOPp->cpld__DOT__m8650d__DOT__rx_active) {
	    vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l 
		= vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l_m;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l = 1U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__131__PROF__M8650D__l702(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__131__PROF__M8650D__l702\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:702
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_71x) {
	if (vlTOPp->initialize) {
	    vlTOPp->cpld__DOT__m8650d__DOT__spike_det_l_m = 1U;
	} else {
	    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_80x)))) {
		vlTOPp->cpld__DOT__m8650d__DOT__spike_det_l_m = 1U;
	    }
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__spike_det_l_m = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__132__PROF__M8650D__l346(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__132__PROF__M8650D__l346\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:346
    if (vlTOPp->cpld__DOT__h12) {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_80x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse_m = 1U;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse_m = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__133__PROF__M8650D__l572(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__133__PROF__M8650D__l572\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l = ((((
						   (((IData)(vlTOPp->cpld__DOT__rx_sel_l) 
						     | (IData)(vlTOPp->io_pause_l)) 
						    | (IData)(vlTOPp->cpld__DOT__rx_sel_l)) 
						   | (IData)(vlTOPp->cpld__DOT__rx_sel_l)) 
						  | (IData)(vlTOPp->cpld__DOT__rx_sel_l)) 
						 | (IData)(vlTOPp->cpld__DOT__rx_sel_l)) 
						| (IData)(vlTOPp->cpld__DOT__rx_sel_l));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__134__PROF__M8650D__l1307(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__134__PROF__M8650D__l1307\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18 
	= ((((IData)(vlTOPp->cpld__DOT__tx_sel_l) | (IData)(vlTOPp->io_pause_l)) 
	    | (IData)(vlTOPp->cpld__DOT__tx_sel_l)) 
	   | (((IData)(vlTOPp->cpld__DOT__tx_sel_l) 
	       | (IData)(vlTOPp->io_pause_l)) | (IData)(vlTOPp->cpld__DOT__tx_sel_l)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__137__PROF__cpld__l338(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__137__PROF__cpld__l338\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd38400 = vlTOPp->cpld__DOT__bd38400;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__138__PROF__cpld__l334(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__138__PROF__cpld__l334\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:334
    vlTOPp->__Vdly__cpld__DOT__bd38400 = ((IData)(vlTOPp->cpld__DOT__n_t_2x) 
					  & (~ (IData)(vlTOPp->cpld__DOT__bd38400)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__139__PROF__cpld__l338(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__139__PROF__cpld__l338\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd38400 = vlTOPp->__Vdly__cpld__DOT__bd38400;
}

VL_INLINE_OPT void Vcpld::_settle__TOP__146__PROF__cpld__l340(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__146__PROF__cpld__l340\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__n_t_2x = (1U & (~ ((IData)(vlTOPp->cpld__DOT__n_t_1x) 
					  & (IData)(vlTOPp->cpld__DOT__bd38400))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__147__PROF__M8650D__l908(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__147__PROF__M8650D__l908\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:908
    if (vlTOPp->cpld__DOT__m8650d__DOT__tx_div) {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__h12)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_119x_m 
		= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_7;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_119x_m = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__148__PROF__M8650D__l712(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__148__PROF__M8650D__l712\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:712
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_71x) {
	if (vlTOPp->initialize) {
	    vlTOPp->cpld__DOT__m8650d__DOT__spike_det_l = 1U;
	} else {
	    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_80x) {
		vlTOPp->cpld__DOT__m8650d__DOT__spike_det_l 
		    = vlTOPp->cpld__DOT__m8650d__DOT__spike_det_l_m;
	    }
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__spike_det_l = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__149__PROF__M8650D__l356(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__149__PROF__M8650D__l356\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:356
    if (vlTOPp->cpld__DOT__h12) {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_80x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse 
		= vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse_m;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__150__PROF__cpld__l107(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__150__PROF__cpld__l107\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->internal_io_l = (1U & (~ ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
				      | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__151__PROF__M8650D__l853(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__151__PROF__M8650D__l853\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__selected_l = (1U 
						  & (~ 
						     ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)) 
						      | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__158__PROF__M8650D__l917(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__158__PROF__M8650D__l917\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:917
    if (vlTOPp->cpld__DOT__m8650d__DOT__tx_div) {
	if (vlTOPp->cpld__DOT__h12) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_119x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_119x_m;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_119x = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__159__PROF__M8650D__l648(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__159__PROF__M8650D__l648\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x = (1U & 
					       (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse) 
						   | (~ 
						      ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l) 
						       | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x))))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__160__PROF__M8650D__l1233(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__160__PROF__M8650D__l1233\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x = (1U & 
					       (~ ((IData)(vlTOPp->md10_l) 
						   | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__selected_l))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__161__PROF__M8650D__l1235(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__161__PROF__M8650D__l1235\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x = (1U & 
					       (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__selected_l) 
						   | (IData)(vlTOPp->md09_l))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__162__PROF__M8650D__l1237(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__162__PROF__M8650D__l1237\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x = (1U & 
					       (~ ((IData)(vlTOPp->md11_l) 
						   | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__selected_l))));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__165__PROF__cpld__l345(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__165__PROF__cpld__l345\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd19200 = vlTOPp->cpld__DOT__bd19200;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__166__PROF__cpld__l343(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__166__PROF__cpld__l343\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:343
    vlTOPp->__Vdly__cpld__DOT__bd19200 = (1U & (~ (IData)(vlTOPp->cpld__DOT__bd19200)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__167__PROF__cpld__l345(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__167__PROF__cpld__l345\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd19200 = vlTOPp->__Vdly__cpld__DOT__bd19200;
}

VL_INLINE_OPT void Vcpld::_settle__TOP__173__PROF__M8650D__l924(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__173__PROF__M8650D__l924\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:924
    if (vlTOPp->cpld__DOT__m8650d__DOT__tx_div) {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__h12)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__gdollar_8_m 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_119x;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__gdollar_8_m = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__174__PROF__M8650D__l425(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__174__PROF__M8650D__l425\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:425
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_30x_m = 
	    (1U & (((~ (IData)(vlTOPp->rxdttl)) & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l)) 
		   | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l))));
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__175__PROF__M8650D__l1244(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__175__PROF__M8650D__l1244\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__ckkie = (1U & (~ 
						   ((~ 
						     ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)) 
							& (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x)) 
						       & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
						      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x))) 
						    | (~ (IData)(vlTOPp->tp3)))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__176__PROF__M8650D__l1224(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__176__PROF__M8650D__l1224\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__cktfl = (1U & (~ 
						   ((~ 
						     ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
							& (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
						       & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
						      & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))) 
						    | (~ (IData)(vlTOPp->tp3)))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__177__PROF__M8650D__l1217(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__177__PROF__M8650D__l1217\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__krb_l = (1U & (~ 
						   ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)) 
						      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x)) 
						     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x)) 
						    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__178__PROF__M8650D__l1204(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__178__PROF__M8650D__l1204\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__tls_l = (1U & (~ 
						   ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
						      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x)) 
						     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x)) 
						    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__181__PROF__cpld__l349(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__181__PROF__cpld__l349\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd9600 = vlTOPp->cpld__DOT__bd9600;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__182__PROF__cpld__l347(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__182__PROF__cpld__l347\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:347
    vlTOPp->__Vdly__cpld__DOT__bd9600 = (1U & (~ (IData)(vlTOPp->cpld__DOT__bd9600)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__183__PROF__cpld__l349(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__183__PROF__cpld__l349\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd9600 = vlTOPp->__Vdly__cpld__DOT__bd9600;
}

VL_INLINE_OPT void Vcpld::_combo__TOP__190__PROF__M8650D__l933(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__190__PROF__M8650D__l933\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:933
    if (vlTOPp->cpld__DOT__m8650d__DOT__tx_div) {
	if (vlTOPp->cpld__DOT__h12) {
	    vlTOPp->cpld__DOT__m8650d__DOT__gdollar_8 
		= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_8_m;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__gdollar_8 = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__191__PROF__M8650D__l434(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__191__PROF__M8650D__l434\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:434
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_30x = vlTOPp->cpld__DOT__m8650d__DOT__n_t_30x_m;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__192__PROF__M8650D__l1221(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__192__PROF__M8650D__l1221\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__dokcc = (1U & (~ 
						   ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__krb_l) 
						    & (~ 
						       ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)) 
							  & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
							 & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x)) 
							& (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__193__PROF__M8650D__l1220(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__193__PROF__M8650D__l1220\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__dokrs = (1U & (~ 
						   ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__krb_l) 
						    & (~ 
						       ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)) 
							  & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x)) 
							 & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
							& (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__194__PROF__M8650D__l1206(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__194__PROF__M8650D__l1206\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_16x = (1U & 
					       (~ (
						   (~ (IData)(vlTOPp->initialize)) 
						   & (~ 
						      ((~ 
							((IData)(vlTOPp->cpld__DOT__m8650d__DOT__tls_l) 
							 & (~ 
							    ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
							       & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
							      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x)) 
							     & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))))) 
						       & (IData)(vlTOPp->tp3))))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__195__PROF__M8650D__l1207(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__195__PROF__M8650D__l1207\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__dotpc = (1U & (~ 
						   ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__tls_l) 
						    & (~ 
						       ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
							  & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x)) 
							 & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
							& (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))))));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__198__PROF__cpld__l353(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__198__PROF__cpld__l353\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd4800 = vlTOPp->cpld__DOT__bd4800;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__199__PROF__cpld__l351(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__199__PROF__cpld__l351\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:351
    vlTOPp->__Vdly__cpld__DOT__bd4800 = (1U & (~ (IData)(vlTOPp->cpld__DOT__bd4800)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__200__PROF__cpld__l353(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__200__PROF__cpld__l353\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd4800 = vlTOPp->__Vdly__cpld__DOT__bd4800;
}

VL_INLINE_OPT void Vcpld::_settle__TOP__207__PROF__M8650D__l441(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__207__PROF__M8650D__l441\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:441
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_34x_m = 
	    (1U & (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_30x) 
		    & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l)) 
		   | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l))));
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__208__PROF__cpld__l113(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__208__PROF__cpld__l113\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->c0_l = (1U & ((((((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokcc) 
			      & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokcc))) 
			     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokcc)) 
			    & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokcc)) 
			   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokcc)) 
			  | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokcc))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__209__PROF__M8650D__l1222(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__209__PROF__M8650D__l1222\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__ckkcc_l = (1U & 
					       (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokcc) 
						   & (IData)(vlTOPp->tp3))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__210__PROF__cpld__l111(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__210__PROF__cpld__l111\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->c1_l = (1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs) 
			     | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokcc))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__211__PROF__cpld__l125(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__211__PROF__cpld__l125\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data04_l = (1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs) 
				 & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_30x))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__212__PROF__M8650D__l873(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__212__PROF__M8650D__l873\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x = (1U & 
					       (~ (
						   ((IData)(vlTOPp->tp3) 
						    & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)) 
						   | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_div))));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__215__PROF__cpld__l357(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__215__PROF__cpld__l357\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd2400 = vlTOPp->cpld__DOT__bd2400;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__216__PROF__cpld__l355(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__216__PROF__cpld__l355\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:355
    vlTOPp->__Vdly__cpld__DOT__bd2400 = (1U & (~ (IData)(vlTOPp->cpld__DOT__bd2400)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__217__PROF__cpld__l357(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__217__PROF__cpld__l357\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd2400 = vlTOPp->__Vdly__cpld__DOT__bd2400;
}

VL_INLINE_OPT void Vcpld::_combo__TOP__224__PROF__M8650D__l450(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__224__PROF__M8650D__l450\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:450
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_34x = vlTOPp->cpld__DOT__m8650d__DOT__n_t_34x_m;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__225__PROF__M8650D__l1269(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__225__PROF__M8650D__l1269\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1269
    if (vlTOPp->cpld__DOT__m8650d__DOT__ckkcc_l) {
	if (vlTOPp->initialize) {
	    vlTOPp->cpld__DOT__m8650d__DOT__r_run_l_m = 1U;
	} else {
	    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_30x) {
		vlTOPp->cpld__DOT__m8650d__DOT__r_run_l_m = 1U;
	    }
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__r_run_l_m = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__226__PROF__M8650D__l1240(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__226__PROF__M8650D__l1240\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_28x = (1U & 
					       (~ (
						   (~ 
						    ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__ckkcc_l) 
						     & (~ (IData)(vlTOPp->initialize)))) 
						   | (~ 
						      ((~ (IData)(vlTOPp->tp3)) 
						       | (~ 
							  ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)) 
							     & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
							    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
							   & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))))))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__227__PROF__M8650D__l943(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__227__PROF__M8650D__l943\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_46x = (1U & 
					       (~ (
						   (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)) 
						   | (IData)(vlTOPp->data04_l))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__228__PROF__M8650D__l1040(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__228__PROF__M8650D__l1040\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1040
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__enab_m = 0U;
    } else {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__enab_m 
		= vlTOPp->cpld__DOT__m8650d__DOT__dotpc;
	}
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__231__PROF__cpld__l361(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__231__PROF__cpld__l361\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd1200 = vlTOPp->cpld__DOT__bd1200;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__232__PROF__cpld__l359(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__232__PROF__cpld__l359\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:359
    vlTOPp->__Vdly__cpld__DOT__bd1200 = (1U & (~ (IData)(vlTOPp->cpld__DOT__bd1200)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__233__PROF__cpld__l361(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__233__PROF__cpld__l361\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd1200 = vlTOPp->__Vdly__cpld__DOT__bd1200;
}

VL_INLINE_OPT void Vcpld::_settle__TOP__239__PROF__cpld__l124(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__239__PROF__cpld__l124\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data05_l = (1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_34x) 
				 & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__240__PROF__M8650D__l457(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__240__PROF__M8650D__l457\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:457
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_36x_m = 
	    (1U & (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_34x) 
		    & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l)) 
		   | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l))));
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__241__PROF__M8650D__l1279(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__241__PROF__M8650D__l1279\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1279
    if (vlTOPp->cpld__DOT__m8650d__DOT__ckkcc_l) {
	if (vlTOPp->initialize) {
	    vlTOPp->cpld__DOT__m8650d__DOT__r_run_l = 1U;
	} else {
	    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_30x)))) {
		vlTOPp->cpld__DOT__m8650d__DOT__r_run_l 
		    = vlTOPp->cpld__DOT__m8650d__DOT__r_run_l_m;
	    }
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__r_run_l = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__242__PROF__M8650D__l1050(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__242__PROF__M8650D__l1050\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1050
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__enab = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__enab = vlTOPp->cpld__DOT__m8650d__DOT__enab_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__244__PROF__cpld__l382(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__244__PROF__cpld__l382\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:382
    vlTOPp->cpld__DOT__div11b = vlTOPp->cpld__DOT__ndiv11b;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__245__PROF__cpld__l383(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__245__PROF__cpld__l383\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:383
    vlTOPp->cpld__DOT__div11c = vlTOPp->cpld__DOT__ndiv11c;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__246__PROF__cpld__l384(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__246__PROF__cpld__l384\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:384
    vlTOPp->cpld__DOT__div11d = vlTOPp->cpld__DOT__ndiv11d;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__247__PROF__cpld__l381(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__247__PROF__cpld__l381\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:381
    vlTOPp->cpld__DOT__div11a = vlTOPp->cpld__DOT__ndiv11a;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__248__PROF__cpld__l378(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__248__PROF__cpld__l378\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ndiv11a = (1U & (~ ((((IData)(vlTOPp->cpld__DOT__div11b) 
					     & (IData)(vlTOPp->cpld__DOT__div11c)) 
					    & (IData)(vlTOPp->cpld__DOT__div11d))
					    ? (IData)(vlTOPp->cpld__DOT__div11a)
					    : ((~ (IData)(vlTOPp->cpld__DOT__div11a)) 
					       | ((IData)(vlTOPp->cpld__DOT__div11a) 
						  & (IData)(vlTOPp->cpld__DOT__div11c))))));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__249__PROF__cpld__l375(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__249__PROF__cpld__l375\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ndiv11d = (1U & (~ ((IData)(vlTOPp->cpld__DOT__div11d) 
					   | ((IData)(vlTOPp->cpld__DOT__div11a) 
					      & (IData)(vlTOPp->cpld__DOT__div11c)))));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__250__PROF__cpld__l376(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__250__PROF__cpld__l376\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ndiv11c = (1U & (~ ((IData)(vlTOPp->cpld__DOT__div11d)
					    ? (IData)(vlTOPp->cpld__DOT__div11c)
					    : ((~ (IData)(vlTOPp->cpld__DOT__div11c)) 
					       | ((IData)(vlTOPp->cpld__DOT__div11a) 
						  & (IData)(vlTOPp->cpld__DOT__div11c))))));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__251__PROF__cpld__l377(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__251__PROF__cpld__l377\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ndiv11b = (1U & (~ (((IData)(vlTOPp->cpld__DOT__div11c) 
					    & (IData)(vlTOPp->cpld__DOT__div11d))
					    ? (IData)(vlTOPp->cpld__DOT__div11b)
					    : ((~ (IData)(vlTOPp->cpld__DOT__div11b)) 
					       | ((IData)(vlTOPp->cpld__DOT__div11a) 
						  & (IData)(vlTOPp->cpld__DOT__div11c))))));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__254__PROF__cpld__l365(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__254__PROF__cpld__l365\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd600 = vlTOPp->cpld__DOT__bd600;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__255__PROF__cpld__l363(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__255__PROF__cpld__l363\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:363
    vlTOPp->__Vdly__cpld__DOT__bd600 = (1U & (~ (IData)(vlTOPp->cpld__DOT__bd600)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__256__PROF__cpld__l365(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__256__PROF__cpld__l365\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd600 = vlTOPp->__Vdly__cpld__DOT__bd600;
}

VL_INLINE_OPT void Vcpld::_combo__TOP__261__PROF__M8650D__l466(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__261__PROF__M8650D__l466\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:466
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_36x = vlTOPp->cpld__DOT__m8650d__DOT__n_t_36x_m;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__262__PROF__M8650D__l954(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__262__PROF__M8650D__l954\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:954
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_60x_m = 0U;
    } else {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_60x_m 
		= (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__enab) 
		    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc))) 
		   | ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_46x) 
		      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)));
	}
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__269__PROF__cpld__l123(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__269__PROF__cpld__l123\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data06_l = (1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs) 
				 & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_36x))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__270__PROF__M8650D__l473(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__270__PROF__M8650D__l473\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:473
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_35x_m = 
	    (1U & (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_36x) 
		    & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l)) 
		   | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l))));
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__271__PROF__M8650D__l963(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__271__PROF__M8650D__l963\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:963
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_60x = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_60x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_60x_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__274__PROF__cpld__l369(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__274__PROF__cpld__l369\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd300 = vlTOPp->cpld__DOT__bd300;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__275__PROF__cpld__l367(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__275__PROF__cpld__l367\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:367
    vlTOPp->__Vdly__cpld__DOT__bd300 = (1U & (~ (IData)(vlTOPp->cpld__DOT__bd300)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__276__PROF__cpld__l369(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__276__PROF__cpld__l369\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd300 = vlTOPp->__Vdly__cpld__DOT__bd300;
}

VL_INLINE_OPT void Vcpld::_combo__TOP__280__PROF__cpld__l389(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__280__PROF__cpld__l389\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ratex2 = (((((((((((~ (IData)(vlTOPp->cf0)) 
					  & (~ (IData)(vlTOPp->cf1))) 
					 & (~ (IData)(vlTOPp->tp_aa1))) 
					& (IData)(vlTOPp->cpld__DOT__div11a)) 
				       | ((((~ (IData)(vlTOPp->cf0)) 
					    & (~ (IData)(vlTOPp->cf1))) 
					   & (IData)(vlTOPp->tp_aa1)) 
					  & (IData)(vlTOPp->cpld__DOT__bd300))) 
				      | ((((~ (IData)(vlTOPp->cf0)) 
					   & (IData)(vlTOPp->cf1)) 
					  & (~ (IData)(vlTOPp->tp_aa1))) 
					 & (IData)(vlTOPp->cpld__DOT__bd600))) 
				     | ((((~ (IData)(vlTOPp->cf0)) 
					  & (IData)(vlTOPp->cf1)) 
					 & (IData)(vlTOPp->tp_aa1)) 
					& (IData)(vlTOPp->cpld__DOT__bd1200))) 
				    | ((((IData)(vlTOPp->cf0) 
					 & (~ (IData)(vlTOPp->cf1))) 
					& (~ (IData)(vlTOPp->tp_aa1))) 
				       & (IData)(vlTOPp->cpld__DOT__bd9600))) 
				   | ((((IData)(vlTOPp->cf0) 
					& (~ (IData)(vlTOPp->cf1))) 
				       & (IData)(vlTOPp->tp_aa1)) 
				      & (IData)(vlTOPp->cpld__DOT__bd38400))) 
				  | ((((IData)(vlTOPp->cf0) 
				       & (IData)(vlTOPp->cf1)) 
				      & (~ (IData)(vlTOPp->tp_aa1))) 
				     & (IData)(vlTOPp->cpld__DOT__bd115200))) 
				 | ((((IData)(vlTOPp->cf0) 
				      & (IData)(vlTOPp->cf1)) 
				     & (IData)(vlTOPp->tp_aa1)) 
				    & (IData)(vlTOPp->clk)));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__281__PROF__M8650D__l482(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__281__PROF__M8650D__l482\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:482
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_35x = vlTOPp->cpld__DOT__m8650d__DOT__n_t_35x_m;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__282__PROF__M8650D__l970(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__282__PROF__M8650D__l970\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:970
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_62x_m = 0U;
    } else {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_62x_m 
		= (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_60x) 
		    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc))) 
		   | ((~ ((IData)(vlTOPp->data05_l) 
			  | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)))) 
		      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)));
	}
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__286__PROF__cpld__l121(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__286__PROF__cpld__l121\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data07_l = (1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_35x) 
				 & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__287__PROF__M8650D__l580(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__287__PROF__M8650D__l580\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:580
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_37x_m = 
	    (1U & (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_35x) 
		    & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l)) 
		   | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l))));
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__288__PROF__M8650D__l979(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__288__PROF__M8650D__l979\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:979
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_62x = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_62x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_62x_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__292__PROF__M8650D__l589(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__292__PROF__M8650D__l589\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:589
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_37x = vlTOPp->cpld__DOT__m8650d__DOT__n_t_37x_m;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__293__PROF__M8650D__l986(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__293__PROF__M8650D__l986\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:986
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_56x_m = 0U;
    } else {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_56x_m 
		= (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_62x) 
		    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc))) 
		   | ((~ ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)) 
			  | (IData)(vlTOPp->data06_l))) 
		      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)));
	}
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__296__PROF__cpld__l85(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__296__PROF__cpld__l85\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data08_l = (1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs) 
				 & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_37x))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__297__PROF__M8650D__l596(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__297__PROF__M8650D__l596\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:596
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_38x_m = 
	    (1U & (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_37x) 
		    & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l)) 
		   | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l))));
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__298__PROF__M8650D__l995(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__298__PROF__M8650D__l995\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:995
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_56x = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_56x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_56x_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__302__PROF__M8650D__l605(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__302__PROF__M8650D__l605\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:605
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_38x = vlTOPp->cpld__DOT__m8650d__DOT__n_t_38x_m;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__303__PROF__M8650D__l862(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__303__PROF__M8650D__l862\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_69x = (1U & 
					       (~ (
						   (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_56x) 
						     | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__enab)) 
						    | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_60x)) 
						   | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_62x))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__304__PROF__M8650D__l1002(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__304__PROF__M8650D__l1002\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1002
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_61x_m = 0U;
    } else {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_61x_m 
		= (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_56x) 
		    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc))) 
		   | ((~ ((IData)(vlTOPp->data07_l) 
			  | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)))) 
		      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)));
	}
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__308__PROF__cpld__l169(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__308__PROF__cpld__l169\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data09_l = (1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_38x) 
				 & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__309__PROF__M8650D__l612(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__309__PROF__M8650D__l612\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:612
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_39x_m = 
	    (1U & (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_38x) 
		    & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l)) 
		   | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l))));
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__310__PROF__M8650D__l1011(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__310__PROF__M8650D__l1011\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1011
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_61x = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_61x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_61x_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__314__PROF__M8650D__l621(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__314__PROF__M8650D__l621\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:621
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_39x = vlTOPp->cpld__DOT__m8650d__DOT__n_t_39x_m;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__315__PROF__M8650D__l1070(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__315__PROF__M8650D__l1070\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1070
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_63x_m = 0U;
    } else {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_63x_m 
		= (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_61x) 
		    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc))) 
		   | ((~ ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)) 
			  | (IData)(vlTOPp->data08_l))) 
		      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)));
	}
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__318__PROF__M8650D__l628(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__318__PROF__M8650D__l628\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:628
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_40x_m = 
	    (1U & (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_39x) 
		    & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l)) 
		   | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l))));
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__319__PROF__cpld__l168(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__319__PROF__cpld__l168\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data10_l = (1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs) 
				 & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_39x))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__320__PROF__M8650D__l1079(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__320__PROF__M8650D__l1079\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1079
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_63x = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_63x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_63x_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__324__PROF__M8650D__l637(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__324__PROF__M8650D__l637\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:637
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_40x = vlTOPp->cpld__DOT__m8650d__DOT__n_t_40x_m;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__325__PROF__M8650D__l1086(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__325__PROF__M8650D__l1086\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1086
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_65x_m = 0U;
    } else {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_65x_m 
		= (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_63x) 
		    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc))) 
		   | ((~ ((IData)(vlTOPp->data09_l) 
			  | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)))) 
		      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)));
	}
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__328__PROF__M8650D__l1249(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__328__PROF__M8650D__l1249\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1249
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_28x) {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__rflg_l_m 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_40x;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__rflg_l_m = 1U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__329__PROF__M8650D__l531(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__329__PROF__M8650D__l531\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:531
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_91x) {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__last_unit_m 
		= (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_40x)));
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__last_unit_m = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__330__PROF__cpld__l166(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__330__PROF__cpld__l166\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data11_l = (1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_40x) 
				 & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__331__PROF__M8650D__l1095(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__331__PROF__M8650D__l1095\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1095
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_65x = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_65x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_65x_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__336__PROF__M8650D__l1259(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__336__PROF__M8650D__l1259\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1259
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_28x) {
	if (vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse) {
	    vlTOPp->cpld__DOT__m8650d__DOT__rflg_l 
		= vlTOPp->cpld__DOT__m8650d__DOT__rflg_l_m;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__rflg_l = 1U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__337__PROF__M8650D__l541(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__337__PROF__M8650D__l541\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:541
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_91x) {
	if (vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse) {
	    vlTOPp->cpld__DOT__m8650d__DOT__last_unit 
		= vlTOPp->cpld__DOT__m8650d__DOT__last_unit_m;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__last_unit = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__338__PROF__M8650D__l1174(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__338__PROF__M8650D__l1174\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1174
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__int_enab_l_m = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__ckkie)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__int_enab_l_m 
		= ((IData)(vlTOPp->io_pause_l) | (IData)(vlTOPp->data11_l));
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__339__PROF__M8650D__l1102(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__339__PROF__M8650D__l1102\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1102
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_66x_m = 0U;
    } else {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_66x_m 
		= (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_65x) 
		    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc))) 
		   | ((~ ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)) 
			  | (IData)(vlTOPp->data10_l))) 
		      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)));
	}
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__344__PROF__M8650D__l1196(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__344__PROF__M8650D__l1196\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_70x = (1U & 
					       (~ (
						   ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_80x) 
						    & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__last_unit)) 
						   | ((~ 
						       ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__spike_det_l) 
							| (IData)(vlTOPp->rxdttl))) 
						      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse)))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__345__PROF__M8650D__l656(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__345__PROF__M8650D__l656\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_27x__out__out14 
	= (1U & (~ ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__last_unit)) 
		    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_active)))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__346__PROF__M8650D__l1184(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__346__PROF__M8650D__l1184\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1184
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__int_enab_l = 0U;
    } else {
	if (vlTOPp->cpld__DOT__m8650d__DOT__ckkie) {
	    vlTOPp->cpld__DOT__m8650d__DOT__int_enab_l 
		= vlTOPp->cpld__DOT__m8650d__DOT__int_enab_l_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__347__PROF__M8650D__l1111(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__347__PROF__M8650D__l1111\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1111
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_66x = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_66x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_66x_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__352__PROF__M8650D__l740(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__352__PROF__M8650D__l740\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_71x = (1U & 
					       (~ (
						   ((IData)(vlTOPp->rxdttl) 
						    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_27x__out__out14))) 
						   & (IData)(vlTOPp->cpld__DOT__h12))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__353__PROF__M8650D__l326(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__353__PROF__M8650D__l326\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:326
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__h12)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__rx_div_m = 
	    (1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_div) 
		      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_27x__out__out14))));
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__354__PROF__M8650D__l367(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__354__PROF__M8650D__l367\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:367
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_27x__out__out14) {
	if (vlTOPp->cpld__DOT__m8650d__DOT__rx_div) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x_m 
		= (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x)));
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x_m = 1U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__355__PROF__M8650D__l387(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__355__PROF__M8650D__l387\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:387
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_27x__out__out14) {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x_m 
		= (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x)));
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x_m = 1U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__356__PROF__M8650D__l551(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__356__PROF__M8650D__l551\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:551
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_27x__out__out14) {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x_m 
		= (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x)));
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x_m = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__357__PROF__M8650D__l1228(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__357__PROF__M8650D__l1228\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_19x = (1U & 
					       (~ (
						   (~ 
						    ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
						       & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x)) 
						      & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
						     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x))) 
						   | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__int_enab_l))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__358__PROF__M8650D__l1118(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__358__PROF__M8650D__l1118\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1118
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__tx_data_m = 0U;
    } else {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__tx_data_m 
		= (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_66x) 
		    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc))) 
		   | ((~ ((IData)(vlTOPp->data11_l) 
			  | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)))) 
		      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)));
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__359__PROF__M8650D__l866(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__359__PROF__M8650D__l866\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_68x = (1U & 
					       (~ (
						   (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_63x) 
						     | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_65x)) 
						    | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_66x)) 
						   | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_61x))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__368__PROF__M8650D__l336(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__368__PROF__M8650D__l336\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:336
    if (vlTOPp->cpld__DOT__h12) {
	vlTOPp->cpld__DOT__m8650d__DOT__rx_div = vlTOPp->cpld__DOT__m8650d__DOT__rx_div_m;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__369__PROF__M8650D__l377(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__369__PROF__M8650D__l377\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:377
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_27x__out__out14) {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_div)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x_m;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x = 1U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__370__PROF__M8650D__l397(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__370__PROF__M8650D__l397\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:397
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_27x__out__out14) {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x_m;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x = 1U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__371__PROF__M8650D__l561(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__371__PROF__M8650D__l561\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:561
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_27x__out__out14) {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x_m;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__372__PROF__M8650D__l1127(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__372__PROF__M8650D__l1127\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1127
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__tx_data = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__tx_data 
		= vlTOPp->cpld__DOT__m8650d__DOT__tx_data_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__373__PROF__M8650D__l744(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__373__PROF__M8650D__l744\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:744
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l_m = 1U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__h12)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l_m 
		= (1U & (~ (((IData)(vlTOPp->cpld__DOT__j23) 
			     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__enab)) 
			    | ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l)) 
			       & (~ (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_68x) 
				      & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_div))) 
				     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_69x)))))));
	}
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__374__PROF__M8650D__l1154(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__374__PROF__M8650D__l1154\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1154
    if (vlTOPp->cpld__DOT__m8650d__DOT__cktfl) {
	vlTOPp->cpld__DOT__m8650d__DOT__tflg_l_m = 0U;
    } else {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_16x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__tflg_l_m = 1U;
	} else {
	    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_div)))) {
		vlTOPp->cpld__DOT__m8650d__DOT__tflg_l_m 
		    = (1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_69x) 
				& (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_68x))));
	    }
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__382__PROF__M8650D__l1019(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__382__PROF__M8650D__l1019\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1019
    if (vlTOPp->cpld__DOT__m8650d__DOT__start_l) {
	if (vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l) {
	    vlTOPp->cpld__DOT__m8650d__DOT__line_m = 1U;
	} else {
	    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_div)))) {
		vlTOPp->cpld__DOT__m8650d__DOT__line_m 
		    = vlTOPp->cpld__DOT__m8650d__DOT__tx_data;
	    }
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__line_m = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__383__PROF__M8650D__l754(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__383__PROF__M8650D__l754\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:754
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l = 1U;
    } else {
	if (vlTOPp->cpld__DOT__h12) {
	    vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l 
		= vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__384__PROF__M8650D__l1164(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__384__PROF__M8650D__l1164\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1164
    if (vlTOPp->cpld__DOT__m8650d__DOT__cktfl) {
	vlTOPp->cpld__DOT__m8650d__DOT__tflg_l = 0U;
    } else {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_16x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__tflg_l = 1U;
	} else {
	    if (vlTOPp->cpld__DOT__m8650d__DOT__tx_div) {
		vlTOPp->cpld__DOT__m8650d__DOT__tflg_l 
		    = vlTOPp->cpld__DOT__m8650d__DOT__tflg_l_m;
	    }
	}
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__388__PROF__M8650D__l1029(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__388__PROF__M8650D__l1029\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1029
    if (vlTOPp->cpld__DOT__m8650d__DOT__start_l) {
	if (vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l) {
	    vlTOPp->txdttl = 1U;
	} else {
	    if (vlTOPp->cpld__DOT__m8650d__DOT__tx_div) {
		vlTOPp->txdttl = vlTOPp->cpld__DOT__m8650d__DOT__line_m;
	    }
	}
    } else {
	vlTOPp->txdttl = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__389__PROF__M8650D__l1226(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__389__PROF__M8650D__l1226\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__tkskp = (1U & (
						   (~ 
						    ((~ 
						      ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)) 
							 & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
							& (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
						       & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x))) 
						     | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rflg_l))) 
						   | (~ 
						      ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__tflg_l) 
						       | (~ 
							  ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
							     & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x))) 
							    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x))) 
							   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__390__PROF__M8650D__l1219(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__390__PROF__M8650D__l1219\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__flgs = (1U & (~ 
						  ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__rflg_l) 
						   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tflg_l))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__394__PROF__cpld__l105(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__394__PROF__cpld__l105\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->int_rqst_l = (1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__flgs) 
				   & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__int_enab_l)))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__395__PROF__M8650D__l1304(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__395__PROF__M8650D__l1304\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__skip_l__out__en15 
	= (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_19x) 
	    & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__flgs)) 
	   | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tkskp));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__398__PROF__cpld__l103(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__398__PROF__cpld__l103\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->skip_l = (1U & ((((((((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_19x) 
				  & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__flgs)) 
				 | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tkskp)) 
				& (~ (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_19x) 
				       & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__flgs)) 
				      | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tkskp)))) 
			       & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__skip_l__out__en15)) 
			      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__skip_l__out__en15)) 
			     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__skip_l__out__en15)) 
			    | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__skip_l__out__en15))));
}

void Vcpld::_eval(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_eval\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_154x_m)) 
	 & (IData)(vlTOPp->__Vclklast__TOP__cpld__DOT__m8650d__DOT__n_t_154x_m))) {
	vlTOPp->_sequent__TOP__18__PROF__M8650D__l410(vlSymsp);
	vlTOPp->_sequent__TOP__19__PROF__M8650D__l408(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__n_t_155x)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__n_t_155x))) {
	vlTOPp->_sequent__TOP__22__PROF__M8650D__l414(vlSymsp);
	vlTOPp->_sequent__TOP__23__PROF__M8650D__l412(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_0)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_0))) {
	vlTOPp->_sequent__TOP__26__PROF__M8650D__l418(vlSymsp);
	vlTOPp->_sequent__TOP__27__PROF__M8650D__l416(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_1)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_1))) {
	vlTOPp->_sequent__TOP__30__PROF__M8650D__l422(vlSymsp);
	vlTOPp->_sequent__TOP__31__PROF__M8650D__l420(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd2400)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd2400))) {
	vlTOPp->_sequent__TOP__34__PROF__M8650D__l660(vlSymsp);
	vlTOPp->_sequent__TOP__35__PROF__M8650D__l658(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd1200)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd1200))) {
	vlTOPp->_sequent__TOP__38__PROF__M8650D__l664(vlSymsp);
	vlTOPp->_sequent__TOP__39__PROF__M8650D__l662(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd600)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd600))) {
	vlTOPp->_sequent__TOP__42__PROF__M8650D__l668(vlSymsp);
	vlTOPp->_sequent__TOP__43__PROF__M8650D__l666(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd300)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd300))) {
	vlTOPp->__Vm_traceActivity = (2U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__46__PROF__M8650D__l672(vlSymsp);
	vlTOPp->_sequent__TOP__47__PROF__M8650D__l670(vlSymsp);
	vlTOPp->_sequent__TOP__48__PROF__M8650D__l672(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__h12)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__h12))) {
	vlTOPp->_sequent__TOP__51__PROF__M8650D__l729(vlSymsp);
	vlTOPp->_sequent__TOP__52__PROF__M8650D__l727(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2))) {
	vlTOPp->_sequent__TOP__55__PROF__M8650D__l733(vlSymsp);
	vlTOPp->_sequent__TOP__56__PROF__M8650D__l731(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_3)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_3))) {
	vlTOPp->__Vm_traceActivity = (4U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__59__PROF__M8650D__l737(vlSymsp);
	vlTOPp->_sequent__TOP__60__PROF__M8650D__l735(vlSymsp);
	vlTOPp->_sequent__TOP__61__PROF__M8650D__l737(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__ratex2)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__ratex2))) {
	vlTOPp->__Vm_traceActivity = (8U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__64__PROF__M8650D__l725(vlSymsp);
	vlTOPp->_sequent__TOP__65__PROF__M8650D__l723(vlSymsp);
	vlTOPp->_sequent__TOP__66__PROF__M8650D__l725(vlSymsp);
    }
    vlTOPp->_settle__TOP__5__PROF__M8650D__l765(vlSymsp);
    vlTOPp->__Vm_traceActivity = (0x10U | vlTOPp->__Vm_traceActivity);
    vlTOPp->_settle__TOP__6__PROF__M8650D__l876(vlSymsp);
    vlTOPp->_settle__TOP__7__PROF__cpld__l178(vlSymsp);
    vlTOPp->_settle__TOP__8__PROF__M8650D__l681(vlSymsp);
    vlTOPp->_settle__TOP__9__PROF__M8650D__l490(vlSymsp);
    vlTOPp->_settle__TOP__10__PROF__cpld__l429(vlSymsp);
    vlTOPp->_settle__TOP__11__PROF__cpld__l419(vlSymsp);
    vlTOPp->_settle__TOP__12__PROF__cpld__l400(vlSymsp);
    vlTOPp->_settle__TOP__13__PROF__cpld__l403(vlSymsp);
    vlTOPp->_settle__TOP__14__PROF__cpld__l402(vlSymsp);
    vlTOPp->_settle__TOP__15__PROF__cpld__l423(vlSymsp);
    vlTOPp->_combo__TOP__78__PROF__M8650D__l775(vlSymsp);
    vlTOPp->_combo__TOP__79__PROF__M8650D__l885(vlSymsp);
    vlTOPp->_combo__TOP__80__PROF__M8650D__l691(vlSymsp);
    vlTOPp->_combo__TOP__81__PROF__M8650D__l500(vlSymsp);
    vlTOPp->_combo__TOP__82__PROF__cpld__l421(vlSymsp);
    vlTOPp->_combo__TOP__83__PROF__cpld__l404(vlSymsp);
    vlTOPp->_combo__TOP__84__PROF__cpld__l408(vlSymsp);
    vlTOPp->_combo__TOP__85__PROF__cpld__l406(vlSymsp);
    vlTOPp->_combo__TOP__86__PROF__cpld__l425(vlSymsp);
    vlTOPp->_combo__TOP__87__PROF__cpld__l427(vlSymsp);
    if (((IData)(vlTOPp->clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk)))) {
	vlTOPp->__Vm_traceActivity = (0x20U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__90__PROF__cpld__l323(vlSymsp);
	vlTOPp->_sequent__TOP__91__PROF__cpld__l321(vlSymsp);
	vlTOPp->_sequent__TOP__92__PROF__cpld__l323(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_154x_m)) 
	 & (IData)(vlTOPp->__Vclklast__TOP__cpld__DOT__m8650d__DOT__n_t_154x_m))) {
	vlTOPp->_sequent__TOP__93__PROF__M8650D__l410(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x40U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__n_t_155x)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__n_t_155x))) {
	vlTOPp->_sequent__TOP__94__PROF__M8650D__l414(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x80U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_0)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_0))) {
	vlTOPp->_sequent__TOP__95__PROF__M8650D__l418(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x100U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_1)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_1))) {
	vlTOPp->_sequent__TOP__96__PROF__M8650D__l422(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x200U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd2400)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd2400))) {
	vlTOPp->_sequent__TOP__97__PROF__M8650D__l660(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x400U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd1200)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd1200))) {
	vlTOPp->_sequent__TOP__98__PROF__M8650D__l664(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x800U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd600)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd600))) {
	vlTOPp->_sequent__TOP__99__PROF__M8650D__l668(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x1000U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__h12)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__h12))) {
	vlTOPp->_sequent__TOP__100__PROF__M8650D__l729(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x2000U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2))) {
	vlTOPp->_sequent__TOP__101__PROF__M8650D__l733(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x4000U | vlTOPp->__Vm_traceActivity);
    }
    if ((((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd115200)) 
	  & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd115200)) 
	 | ((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__n_t_2x)) 
	    & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__n_t_2x)))) {
	vlTOPp->__Vm_traceActivity = (0x8000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__120__PROF__cpld__l332(vlSymsp);
	vlTOPp->_sequent__TOP__121__PROF__cpld__l328(vlSymsp);
	vlTOPp->_sequent__TOP__122__PROF__cpld__l332(vlSymsp);
    }
    vlTOPp->_settle__TOP__112__PROF__M8650D__l892(vlSymsp);
    vlTOPp->_settle__TOP__113__PROF__M8650D__l654(vlSymsp);
    vlTOPp->_settle__TOP__114__PROF__M8650D__l510(vlSymsp);
    vlTOPp->_settle__TOP__115__PROF__M8650D__l653(vlSymsp);
    vlTOPp->_settle__TOP__116__PROF__cpld__l432(vlSymsp);
    vlTOPp->_settle__TOP__117__PROF__cpld__l436(vlSymsp);
    vlTOPp->_combo__TOP__129__PROF__M8650D__l901(vlSymsp);
    vlTOPp->_combo__TOP__130__PROF__M8650D__l520(vlSymsp);
    vlTOPp->_combo__TOP__131__PROF__M8650D__l702(vlSymsp);
    vlTOPp->_combo__TOP__132__PROF__M8650D__l346(vlSymsp);
    vlTOPp->_combo__TOP__133__PROF__M8650D__l572(vlSymsp);
    vlTOPp->_combo__TOP__134__PROF__M8650D__l1307(vlSymsp);
    if ((((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__n_t_1x)) 
	  & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__n_t_1x)) 
	 | ((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__n_t_2x)) 
	    & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__n_t_2x)))) {
	vlTOPp->__Vm_traceActivity = (0x10000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__137__PROF__cpld__l338(vlSymsp);
	vlTOPp->_sequent__TOP__138__PROF__cpld__l334(vlSymsp);
	vlTOPp->_sequent__TOP__139__PROF__cpld__l338(vlSymsp);
    }
    vlTOPp->_settle__TOP__146__PROF__cpld__l340(vlSymsp);
    vlTOPp->_settle__TOP__147__PROF__M8650D__l908(vlSymsp);
    vlTOPp->_settle__TOP__148__PROF__M8650D__l712(vlSymsp);
    vlTOPp->_settle__TOP__149__PROF__M8650D__l356(vlSymsp);
    vlTOPp->_settle__TOP__150__PROF__cpld__l107(vlSymsp);
    vlTOPp->_settle__TOP__151__PROF__M8650D__l853(vlSymsp);
    vlTOPp->_combo__TOP__158__PROF__M8650D__l917(vlSymsp);
    vlTOPp->_combo__TOP__159__PROF__M8650D__l648(vlSymsp);
    vlTOPp->_combo__TOP__160__PROF__M8650D__l1233(vlSymsp);
    vlTOPp->_combo__TOP__161__PROF__M8650D__l1235(vlSymsp);
    vlTOPp->_combo__TOP__162__PROF__M8650D__l1237(vlSymsp);
    if (((IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd38400) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd38400)))) {
	vlTOPp->__Vm_traceActivity = (0x20000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__165__PROF__cpld__l345(vlSymsp);
	vlTOPp->_sequent__TOP__166__PROF__cpld__l343(vlSymsp);
	vlTOPp->_sequent__TOP__167__PROF__cpld__l345(vlSymsp);
    }
    if (((IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd19200) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd19200)))) {
	vlTOPp->__Vm_traceActivity = (0x40000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__181__PROF__cpld__l349(vlSymsp);
	vlTOPp->_sequent__TOP__182__PROF__cpld__l347(vlSymsp);
	vlTOPp->_sequent__TOP__183__PROF__cpld__l349(vlSymsp);
    }
    vlTOPp->_settle__TOP__173__PROF__M8650D__l924(vlSymsp);
    vlTOPp->_settle__TOP__174__PROF__M8650D__l425(vlSymsp);
    vlTOPp->_settle__TOP__175__PROF__M8650D__l1244(vlSymsp);
    vlTOPp->_settle__TOP__176__PROF__M8650D__l1224(vlSymsp);
    vlTOPp->_settle__TOP__177__PROF__M8650D__l1217(vlSymsp);
    vlTOPp->_settle__TOP__178__PROF__M8650D__l1204(vlSymsp);
    vlTOPp->_combo__TOP__190__PROF__M8650D__l933(vlSymsp);
    vlTOPp->_combo__TOP__191__PROF__M8650D__l434(vlSymsp);
    vlTOPp->_combo__TOP__192__PROF__M8650D__l1221(vlSymsp);
    vlTOPp->_combo__TOP__193__PROF__M8650D__l1220(vlSymsp);
    vlTOPp->_combo__TOP__194__PROF__M8650D__l1206(vlSymsp);
    vlTOPp->_combo__TOP__195__PROF__M8650D__l1207(vlSymsp);
    if (((IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd9600) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd9600)))) {
	vlTOPp->__Vm_traceActivity = (0x80000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__198__PROF__cpld__l353(vlSymsp);
	vlTOPp->_sequent__TOP__199__PROF__cpld__l351(vlSymsp);
	vlTOPp->_sequent__TOP__200__PROF__cpld__l353(vlSymsp);
    }
    if (((IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd4800) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd4800)))) {
	vlTOPp->__Vm_traceActivity = (0x100000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__215__PROF__cpld__l357(vlSymsp);
	vlTOPp->_sequent__TOP__216__PROF__cpld__l355(vlSymsp);
	vlTOPp->_sequent__TOP__217__PROF__cpld__l357(vlSymsp);
    }
    vlTOPp->_settle__TOP__207__PROF__M8650D__l441(vlSymsp);
    vlTOPp->_settle__TOP__208__PROF__cpld__l113(vlSymsp);
    vlTOPp->_settle__TOP__209__PROF__M8650D__l1222(vlSymsp);
    vlTOPp->_settle__TOP__210__PROF__cpld__l111(vlSymsp);
    vlTOPp->_settle__TOP__211__PROF__cpld__l125(vlSymsp);
    vlTOPp->_settle__TOP__212__PROF__M8650D__l873(vlSymsp);
    vlTOPp->_combo__TOP__224__PROF__M8650D__l450(vlSymsp);
    vlTOPp->_combo__TOP__225__PROF__M8650D__l1269(vlSymsp);
    vlTOPp->_combo__TOP__226__PROF__M8650D__l1240(vlSymsp);
    vlTOPp->_combo__TOP__227__PROF__M8650D__l943(vlSymsp);
    vlTOPp->_combo__TOP__228__PROF__M8650D__l1040(vlSymsp);
    if (((IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd2400) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd2400)))) {
	vlTOPp->__Vm_traceActivity = (0x200000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__231__PROF__cpld__l361(vlSymsp);
	vlTOPp->_sequent__TOP__232__PROF__cpld__l359(vlSymsp);
	vlTOPp->_sequent__TOP__233__PROF__cpld__l361(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd1200)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd1200))) {
	vlTOPp->__Vm_traceActivity = (0x400000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__244__PROF__cpld__l382(vlSymsp);
	vlTOPp->_sequent__TOP__245__PROF__cpld__l383(vlSymsp);
	vlTOPp->_sequent__TOP__246__PROF__cpld__l384(vlSymsp);
	vlTOPp->_sequent__TOP__247__PROF__cpld__l381(vlSymsp);
	vlTOPp->_sequent__TOP__248__PROF__cpld__l378(vlSymsp);
	vlTOPp->_sequent__TOP__249__PROF__cpld__l375(vlSymsp);
	vlTOPp->_sequent__TOP__250__PROF__cpld__l376(vlSymsp);
	vlTOPp->_sequent__TOP__251__PROF__cpld__l377(vlSymsp);
    }
    if (((IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd1200) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd1200)))) {
	vlTOPp->__Vm_traceActivity = (0x800000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__254__PROF__cpld__l365(vlSymsp);
	vlTOPp->_sequent__TOP__255__PROF__cpld__l363(vlSymsp);
	vlTOPp->_sequent__TOP__256__PROF__cpld__l365(vlSymsp);
    }
    vlTOPp->_settle__TOP__239__PROF__cpld__l124(vlSymsp);
    vlTOPp->_settle__TOP__240__PROF__M8650D__l457(vlSymsp);
    vlTOPp->_settle__TOP__241__PROF__M8650D__l1279(vlSymsp);
    vlTOPp->_settle__TOP__242__PROF__M8650D__l1050(vlSymsp);
    vlTOPp->_combo__TOP__261__PROF__M8650D__l466(vlSymsp);
    vlTOPp->_combo__TOP__262__PROF__M8650D__l954(vlSymsp);
    if (((IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd600) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd600)))) {
	vlTOPp->__Vm_traceActivity = (0x1000000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__274__PROF__cpld__l369(vlSymsp);
	vlTOPp->_sequent__TOP__275__PROF__cpld__l367(vlSymsp);
	vlTOPp->_sequent__TOP__276__PROF__cpld__l369(vlSymsp);
    }
    vlTOPp->_settle__TOP__269__PROF__cpld__l123(vlSymsp);
    vlTOPp->_settle__TOP__270__PROF__M8650D__l473(vlSymsp);
    vlTOPp->_settle__TOP__271__PROF__M8650D__l963(vlSymsp);
    vlTOPp->_combo__TOP__280__PROF__cpld__l389(vlSymsp);
    vlTOPp->_combo__TOP__281__PROF__M8650D__l482(vlSymsp);
    vlTOPp->_combo__TOP__282__PROF__M8650D__l970(vlSymsp);
    vlTOPp->_settle__TOP__286__PROF__cpld__l121(vlSymsp);
    vlTOPp->_settle__TOP__287__PROF__M8650D__l580(vlSymsp);
    vlTOPp->_settle__TOP__288__PROF__M8650D__l979(vlSymsp);
    vlTOPp->_combo__TOP__292__PROF__M8650D__l589(vlSymsp);
    vlTOPp->_combo__TOP__293__PROF__M8650D__l986(vlSymsp);
    vlTOPp->_settle__TOP__296__PROF__cpld__l85(vlSymsp);
    vlTOPp->_settle__TOP__297__PROF__M8650D__l596(vlSymsp);
    vlTOPp->_settle__TOP__298__PROF__M8650D__l995(vlSymsp);
    vlTOPp->_combo__TOP__302__PROF__M8650D__l605(vlSymsp);
    vlTOPp->_combo__TOP__303__PROF__M8650D__l862(vlSymsp);
    vlTOPp->_combo__TOP__304__PROF__M8650D__l1002(vlSymsp);
    vlTOPp->_settle__TOP__308__PROF__cpld__l169(vlSymsp);
    vlTOPp->_settle__TOP__309__PROF__M8650D__l612(vlSymsp);
    vlTOPp->_settle__TOP__310__PROF__M8650D__l1011(vlSymsp);
    vlTOPp->_combo__TOP__314__PROF__M8650D__l621(vlSymsp);
    vlTOPp->_combo__TOP__315__PROF__M8650D__l1070(vlSymsp);
    vlTOPp->_settle__TOP__318__PROF__M8650D__l628(vlSymsp);
    vlTOPp->_settle__TOP__319__PROF__cpld__l168(vlSymsp);
    vlTOPp->_settle__TOP__320__PROF__M8650D__l1079(vlSymsp);
    vlTOPp->_combo__TOP__324__PROF__M8650D__l637(vlSymsp);
    vlTOPp->_combo__TOP__325__PROF__M8650D__l1086(vlSymsp);
    vlTOPp->_settle__TOP__328__PROF__M8650D__l1249(vlSymsp);
    vlTOPp->_settle__TOP__329__PROF__M8650D__l531(vlSymsp);
    vlTOPp->_settle__TOP__330__PROF__cpld__l166(vlSymsp);
    vlTOPp->_settle__TOP__331__PROF__M8650D__l1095(vlSymsp);
    vlTOPp->_combo__TOP__336__PROF__M8650D__l1259(vlSymsp);
    vlTOPp->_combo__TOP__337__PROF__M8650D__l541(vlSymsp);
    vlTOPp->_combo__TOP__338__PROF__M8650D__l1174(vlSymsp);
    vlTOPp->_combo__TOP__339__PROF__M8650D__l1102(vlSymsp);
    vlTOPp->_settle__TOP__344__PROF__M8650D__l1196(vlSymsp);
    vlTOPp->_settle__TOP__345__PROF__M8650D__l656(vlSymsp);
    vlTOPp->_settle__TOP__346__PROF__M8650D__l1184(vlSymsp);
    vlTOPp->_settle__TOP__347__PROF__M8650D__l1111(vlSymsp);
    vlTOPp->_combo__TOP__352__PROF__M8650D__l740(vlSymsp);
    vlTOPp->_combo__TOP__353__PROF__M8650D__l326(vlSymsp);
    vlTOPp->_combo__TOP__354__PROF__M8650D__l367(vlSymsp);
    vlTOPp->_combo__TOP__355__PROF__M8650D__l387(vlSymsp);
    vlTOPp->_combo__TOP__356__PROF__M8650D__l551(vlSymsp);
    vlTOPp->_combo__TOP__357__PROF__M8650D__l1228(vlSymsp);
    vlTOPp->_combo__TOP__358__PROF__M8650D__l1118(vlSymsp);
    vlTOPp->_combo__TOP__359__PROF__M8650D__l866(vlSymsp);
    vlTOPp->_settle__TOP__368__PROF__M8650D__l336(vlSymsp);
    vlTOPp->_settle__TOP__369__PROF__M8650D__l377(vlSymsp);
    vlTOPp->_settle__TOP__370__PROF__M8650D__l397(vlSymsp);
    vlTOPp->_settle__TOP__371__PROF__M8650D__l561(vlSymsp);
    vlTOPp->_settle__TOP__372__PROF__M8650D__l1127(vlSymsp);
    vlTOPp->_settle__TOP__373__PROF__M8650D__l744(vlSymsp);
    vlTOPp->_settle__TOP__374__PROF__M8650D__l1154(vlSymsp);
    vlTOPp->_combo__TOP__382__PROF__M8650D__l1019(vlSymsp);
    vlTOPp->_combo__TOP__383__PROF__M8650D__l754(vlSymsp);
    vlTOPp->_combo__TOP__384__PROF__M8650D__l1164(vlSymsp);
    vlTOPp->_settle__TOP__388__PROF__M8650D__l1029(vlSymsp);
    vlTOPp->_settle__TOP__389__PROF__M8650D__l1226(vlSymsp);
    vlTOPp->_settle__TOP__390__PROF__M8650D__l1219(vlSymsp);
    vlTOPp->_combo__TOP__394__PROF__cpld__l105(vlSymsp);
    vlTOPp->_combo__TOP__395__PROF__M8650D__l1304(vlSymsp);
    vlTOPp->_settle__TOP__398__PROF__cpld__l103(vlSymsp);
    // Final
    vlTOPp->__Vclklast__TOP__cpld__DOT__m8650d__DOT__n_t_154x_m 
	= vlTOPp->cpld__DOT__m8650d__DOT__n_t_154x_m;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__n_t_155x 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__n_t_155x;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_0 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_0;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_1 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_1;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd2400 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd2400;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd1200 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd1200;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd600 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd600;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd300 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd300;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__h12 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__h12;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_3 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_3;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__ratex2 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__ratex2;
    vlTOPp->__Vclklast__TOP__clk = vlTOPp->clk;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd115200 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__bd115200;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__n_t_2x 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__n_t_2x;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__n_t_1x 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__n_t_1x;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd38400 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__bd38400;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd19200 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__bd19200;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd9600 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__bd9600;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd4800 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__bd4800;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd2400 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__bd2400;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd1200 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__bd1200;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd600 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__bd600;
    vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__n_t_155x 
	= vlTOPp->cpld__DOT__m8650d__DOT__n_t_155x;
    vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_0 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_0;
    vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_1 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_1;
    vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd2400 
	= vlTOPp->cpld__DOT__m8650d__DOT__bd2400;
    vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd1200 
	= vlTOPp->cpld__DOT__m8650d__DOT__bd1200;
    vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd600 
	= vlTOPp->cpld__DOT__m8650d__DOT__bd600;
    vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd300 
	= vlTOPp->cpld__DOT__m8650d__DOT__bd300;
    vlTOPp->__VinpClk__TOP__cpld__DOT__h12 = vlTOPp->cpld__DOT__h12;
    vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2;
    vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_3 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3;
    vlTOPp->__VinpClk__TOP__cpld__DOT__ratex2 = vlTOPp->cpld__DOT__ratex2;
    vlTOPp->__VinpClk__TOP__cpld__DOT__bd115200 = vlTOPp->cpld__DOT__bd115200;
    vlTOPp->__VinpClk__TOP__cpld__DOT__n_t_2x = vlTOPp->cpld__DOT__n_t_2x;
    vlTOPp->__VinpClk__TOP__cpld__DOT__n_t_1x = vlTOPp->cpld__DOT__n_t_1x;
    vlTOPp->__VinpClk__TOP__cpld__DOT__bd38400 = vlTOPp->cpld__DOT__bd38400;
    vlTOPp->__VinpClk__TOP__cpld__DOT__bd19200 = vlTOPp->cpld__DOT__bd19200;
    vlTOPp->__VinpClk__TOP__cpld__DOT__bd9600 = vlTOPp->cpld__DOT__bd9600;
    vlTOPp->__VinpClk__TOP__cpld__DOT__bd4800 = vlTOPp->cpld__DOT__bd4800;
    vlTOPp->__VinpClk__TOP__cpld__DOT__bd2400 = vlTOPp->cpld__DOT__bd2400;
    vlTOPp->__VinpClk__TOP__cpld__DOT__bd1200 = vlTOPp->cpld__DOT__bd1200;
    vlTOPp->__VinpClk__TOP__cpld__DOT__bd600 = vlTOPp->cpld__DOT__bd600;
}

void Vcpld::_eval_initial(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_eval_initial\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vcpld::final() {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::final\n"); );
    // Variables
    Vcpld__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vcpld::_eval_settle(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_eval_settle\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__1__PROF__cpld__l143(vlSymsp);
    vlTOPp->__Vm_traceActivity = (1U | vlTOPp->__Vm_traceActivity);
    vlTOPp->_settle__TOP__2__PROF__cpld__l144(vlSymsp);
    vlTOPp->_settle__TOP__3__PROF__cpld__l145(vlSymsp);
    vlTOPp->_settle__TOP__4__PROF__cpld__l146(vlSymsp);
    vlTOPp->_settle__TOP__5__PROF__M8650D__l765(vlSymsp);
    vlTOPp->_settle__TOP__6__PROF__M8650D__l876(vlSymsp);
    vlTOPp->_settle__TOP__7__PROF__cpld__l178(vlSymsp);
    vlTOPp->_settle__TOP__8__PROF__M8650D__l681(vlSymsp);
    vlTOPp->_settle__TOP__9__PROF__M8650D__l490(vlSymsp);
    vlTOPp->_settle__TOP__10__PROF__cpld__l429(vlSymsp);
    vlTOPp->_settle__TOP__11__PROF__cpld__l419(vlSymsp);
    vlTOPp->_settle__TOP__12__PROF__cpld__l400(vlSymsp);
    vlTOPp->_settle__TOP__13__PROF__cpld__l403(vlSymsp);
    vlTOPp->_settle__TOP__14__PROF__cpld__l402(vlSymsp);
    vlTOPp->_settle__TOP__15__PROF__cpld__l423(vlSymsp);
    vlTOPp->_combo__TOP__78__PROF__M8650D__l775(vlSymsp);
    vlTOPp->_combo__TOP__79__PROF__M8650D__l885(vlSymsp);
    vlTOPp->_combo__TOP__80__PROF__M8650D__l691(vlSymsp);
    vlTOPp->_combo__TOP__81__PROF__M8650D__l500(vlSymsp);
    vlTOPp->_combo__TOP__82__PROF__cpld__l421(vlSymsp);
    vlTOPp->_combo__TOP__83__PROF__cpld__l404(vlSymsp);
    vlTOPp->_combo__TOP__84__PROF__cpld__l408(vlSymsp);
    vlTOPp->_combo__TOP__85__PROF__cpld__l406(vlSymsp);
    vlTOPp->_combo__TOP__86__PROF__cpld__l425(vlSymsp);
    vlTOPp->_combo__TOP__87__PROF__cpld__l427(vlSymsp);
    vlTOPp->_settle__TOP__112__PROF__M8650D__l892(vlSymsp);
    vlTOPp->_settle__TOP__113__PROF__M8650D__l654(vlSymsp);
    vlTOPp->_settle__TOP__114__PROF__M8650D__l510(vlSymsp);
    vlTOPp->_settle__TOP__115__PROF__M8650D__l653(vlSymsp);
    vlTOPp->_settle__TOP__116__PROF__cpld__l432(vlSymsp);
    vlTOPp->_settle__TOP__117__PROF__cpld__l436(vlSymsp);
    vlTOPp->_combo__TOP__129__PROF__M8650D__l901(vlSymsp);
    vlTOPp->_combo__TOP__130__PROF__M8650D__l520(vlSymsp);
    vlTOPp->_combo__TOP__131__PROF__M8650D__l702(vlSymsp);
    vlTOPp->_combo__TOP__132__PROF__M8650D__l346(vlSymsp);
    vlTOPp->_combo__TOP__133__PROF__M8650D__l572(vlSymsp);
    vlTOPp->_combo__TOP__134__PROF__M8650D__l1307(vlSymsp);
    vlTOPp->_settle__TOP__146__PROF__cpld__l340(vlSymsp);
    vlTOPp->_settle__TOP__147__PROF__M8650D__l908(vlSymsp);
    vlTOPp->_settle__TOP__148__PROF__M8650D__l712(vlSymsp);
    vlTOPp->_settle__TOP__149__PROF__M8650D__l356(vlSymsp);
    vlTOPp->_settle__TOP__150__PROF__cpld__l107(vlSymsp);
    vlTOPp->_settle__TOP__151__PROF__M8650D__l853(vlSymsp);
    vlTOPp->_combo__TOP__158__PROF__M8650D__l917(vlSymsp);
    vlTOPp->_combo__TOP__159__PROF__M8650D__l648(vlSymsp);
    vlTOPp->_combo__TOP__160__PROF__M8650D__l1233(vlSymsp);
    vlTOPp->_combo__TOP__161__PROF__M8650D__l1235(vlSymsp);
    vlTOPp->_combo__TOP__162__PROF__M8650D__l1237(vlSymsp);
    vlTOPp->_settle__TOP__173__PROF__M8650D__l924(vlSymsp);
    vlTOPp->_settle__TOP__174__PROF__M8650D__l425(vlSymsp);
    vlTOPp->_settle__TOP__175__PROF__M8650D__l1244(vlSymsp);
    vlTOPp->_settle__TOP__176__PROF__M8650D__l1224(vlSymsp);
    vlTOPp->_settle__TOP__177__PROF__M8650D__l1217(vlSymsp);
    vlTOPp->_settle__TOP__178__PROF__M8650D__l1204(vlSymsp);
    vlTOPp->_combo__TOP__190__PROF__M8650D__l933(vlSymsp);
    vlTOPp->_combo__TOP__191__PROF__M8650D__l434(vlSymsp);
    vlTOPp->_combo__TOP__192__PROF__M8650D__l1221(vlSymsp);
    vlTOPp->_combo__TOP__193__PROF__M8650D__l1220(vlSymsp);
    vlTOPp->_combo__TOP__194__PROF__M8650D__l1206(vlSymsp);
    vlTOPp->_combo__TOP__195__PROF__M8650D__l1207(vlSymsp);
    vlTOPp->_settle__TOP__207__PROF__M8650D__l441(vlSymsp);
    vlTOPp->_settle__TOP__208__PROF__cpld__l113(vlSymsp);
    vlTOPp->_settle__TOP__209__PROF__M8650D__l1222(vlSymsp);
    vlTOPp->_settle__TOP__210__PROF__cpld__l111(vlSymsp);
    vlTOPp->_settle__TOP__211__PROF__cpld__l125(vlSymsp);
    vlTOPp->_settle__TOP__212__PROF__M8650D__l873(vlSymsp);
    vlTOPp->_combo__TOP__224__PROF__M8650D__l450(vlSymsp);
    vlTOPp->_combo__TOP__225__PROF__M8650D__l1269(vlSymsp);
    vlTOPp->_combo__TOP__226__PROF__M8650D__l1240(vlSymsp);
    vlTOPp->_combo__TOP__227__PROF__M8650D__l943(vlSymsp);
    vlTOPp->_combo__TOP__228__PROF__M8650D__l1040(vlSymsp);
    vlTOPp->_settle__TOP__239__PROF__cpld__l124(vlSymsp);
    vlTOPp->_settle__TOP__240__PROF__M8650D__l457(vlSymsp);
    vlTOPp->_settle__TOP__241__PROF__M8650D__l1279(vlSymsp);
    vlTOPp->_settle__TOP__242__PROF__M8650D__l1050(vlSymsp);
    vlTOPp->_sequent__TOP__248__PROF__cpld__l378(vlSymsp);
    vlTOPp->_sequent__TOP__249__PROF__cpld__l375(vlSymsp);
    vlTOPp->_sequent__TOP__250__PROF__cpld__l376(vlSymsp);
    vlTOPp->_sequent__TOP__251__PROF__cpld__l377(vlSymsp);
    vlTOPp->_combo__TOP__261__PROF__M8650D__l466(vlSymsp);
    vlTOPp->_combo__TOP__262__PROF__M8650D__l954(vlSymsp);
    vlTOPp->_settle__TOP__269__PROF__cpld__l123(vlSymsp);
    vlTOPp->_settle__TOP__270__PROF__M8650D__l473(vlSymsp);
    vlTOPp->_settle__TOP__271__PROF__M8650D__l963(vlSymsp);
    vlTOPp->_combo__TOP__280__PROF__cpld__l389(vlSymsp);
    vlTOPp->_combo__TOP__281__PROF__M8650D__l482(vlSymsp);
    vlTOPp->_combo__TOP__282__PROF__M8650D__l970(vlSymsp);
    vlTOPp->_settle__TOP__286__PROF__cpld__l121(vlSymsp);
    vlTOPp->_settle__TOP__287__PROF__M8650D__l580(vlSymsp);
    vlTOPp->_settle__TOP__288__PROF__M8650D__l979(vlSymsp);
    vlTOPp->_combo__TOP__292__PROF__M8650D__l589(vlSymsp);
    vlTOPp->_combo__TOP__293__PROF__M8650D__l986(vlSymsp);
    vlTOPp->_settle__TOP__296__PROF__cpld__l85(vlSymsp);
    vlTOPp->_settle__TOP__297__PROF__M8650D__l596(vlSymsp);
    vlTOPp->_settle__TOP__298__PROF__M8650D__l995(vlSymsp);
    vlTOPp->_combo__TOP__302__PROF__M8650D__l605(vlSymsp);
    vlTOPp->_combo__TOP__303__PROF__M8650D__l862(vlSymsp);
    vlTOPp->_combo__TOP__304__PROF__M8650D__l1002(vlSymsp);
    vlTOPp->_settle__TOP__308__PROF__cpld__l169(vlSymsp);
    vlTOPp->_settle__TOP__309__PROF__M8650D__l612(vlSymsp);
    vlTOPp->_settle__TOP__310__PROF__M8650D__l1011(vlSymsp);
    vlTOPp->_combo__TOP__314__PROF__M8650D__l621(vlSymsp);
    vlTOPp->_combo__TOP__315__PROF__M8650D__l1070(vlSymsp);
    vlTOPp->_settle__TOP__318__PROF__M8650D__l628(vlSymsp);
    vlTOPp->_settle__TOP__319__PROF__cpld__l168(vlSymsp);
    vlTOPp->_settle__TOP__320__PROF__M8650D__l1079(vlSymsp);
    vlTOPp->_combo__TOP__324__PROF__M8650D__l637(vlSymsp);
    vlTOPp->_combo__TOP__325__PROF__M8650D__l1086(vlSymsp);
    vlTOPp->_settle__TOP__328__PROF__M8650D__l1249(vlSymsp);
    vlTOPp->_settle__TOP__329__PROF__M8650D__l531(vlSymsp);
    vlTOPp->_settle__TOP__330__PROF__cpld__l166(vlSymsp);
    vlTOPp->_settle__TOP__331__PROF__M8650D__l1095(vlSymsp);
    vlTOPp->_combo__TOP__336__PROF__M8650D__l1259(vlSymsp);
    vlTOPp->_combo__TOP__337__PROF__M8650D__l541(vlSymsp);
    vlTOPp->_combo__TOP__338__PROF__M8650D__l1174(vlSymsp);
    vlTOPp->_combo__TOP__339__PROF__M8650D__l1102(vlSymsp);
    vlTOPp->_settle__TOP__344__PROF__M8650D__l1196(vlSymsp);
    vlTOPp->_settle__TOP__345__PROF__M8650D__l656(vlSymsp);
    vlTOPp->_settle__TOP__346__PROF__M8650D__l1184(vlSymsp);
    vlTOPp->_settle__TOP__347__PROF__M8650D__l1111(vlSymsp);
    vlTOPp->_combo__TOP__352__PROF__M8650D__l740(vlSymsp);
    vlTOPp->_combo__TOP__353__PROF__M8650D__l326(vlSymsp);
    vlTOPp->_combo__TOP__354__PROF__M8650D__l367(vlSymsp);
    vlTOPp->_combo__TOP__355__PROF__M8650D__l387(vlSymsp);
    vlTOPp->_combo__TOP__356__PROF__M8650D__l551(vlSymsp);
    vlTOPp->_combo__TOP__357__PROF__M8650D__l1228(vlSymsp);
    vlTOPp->_combo__TOP__358__PROF__M8650D__l1118(vlSymsp);
    vlTOPp->_combo__TOP__359__PROF__M8650D__l866(vlSymsp);
    vlTOPp->_settle__TOP__368__PROF__M8650D__l336(vlSymsp);
    vlTOPp->_settle__TOP__369__PROF__M8650D__l377(vlSymsp);
    vlTOPp->_settle__TOP__370__PROF__M8650D__l397(vlSymsp);
    vlTOPp->_settle__TOP__371__PROF__M8650D__l561(vlSymsp);
    vlTOPp->_settle__TOP__372__PROF__M8650D__l1127(vlSymsp);
    vlTOPp->_settle__TOP__373__PROF__M8650D__l744(vlSymsp);
    vlTOPp->_settle__TOP__374__PROF__M8650D__l1154(vlSymsp);
    vlTOPp->_combo__TOP__382__PROF__M8650D__l1019(vlSymsp);
    vlTOPp->_combo__TOP__383__PROF__M8650D__l754(vlSymsp);
    vlTOPp->_combo__TOP__384__PROF__M8650D__l1164(vlSymsp);
    vlTOPp->_settle__TOP__388__PROF__M8650D__l1029(vlSymsp);
    vlTOPp->_settle__TOP__389__PROF__M8650D__l1226(vlSymsp);
    vlTOPp->_settle__TOP__390__PROF__M8650D__l1219(vlSymsp);
    vlTOPp->_combo__TOP__394__PROF__cpld__l105(vlSymsp);
    vlTOPp->_combo__TOP__395__PROF__M8650D__l1304(vlSymsp);
    vlTOPp->_settle__TOP__398__PROF__cpld__l103(vlSymsp);
}

VL_INLINE_OPT QData Vcpld::_change_request(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_change_request\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    __req |= ((vlTOPp->cpld__DOT__bd115200 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd115200)
	 | (vlTOPp->cpld__DOT__bd38400 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd38400)
	 | (vlTOPp->cpld__DOT__bd19200 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd19200)
	 | (vlTOPp->cpld__DOT__bd9600 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd9600)
	 | (vlTOPp->cpld__DOT__bd4800 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd4800)
	 | (vlTOPp->cpld__DOT__bd2400 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd2400)
	 | (vlTOPp->cpld__DOT__bd1200 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd1200)
	 | (vlTOPp->cpld__DOT__bd600 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd600)
	 | (vlTOPp->cpld__DOT__n_t_1x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__n_t_1x)
	 | (vlTOPp->cpld__DOT__n_t_2x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__n_t_2x)
	|| (vlTOPp->cpld__DOT__h12 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__h12)
	 | (vlTOPp->cpld__DOT__ratex2 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__ratex2)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__bd1200 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd1200)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__bd2400 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd2400)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__bd300 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd300)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__bd600 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd600)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__rx_div ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__rx_div)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_43x)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_75x)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__n_t_155x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_155x)
	|| (vlTOPp->cpld__DOT__m8650d__DOT__gdollar_0 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_0)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__gdollar_1 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_1)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_88x)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__tx_div ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_div)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_2)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_3)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_active_l)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__n_t_70x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_70x)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__n_t_71x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_71x));
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__bd115200 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd115200))) VL_PRINTF("	CHANGE: cpld.v:199: cpld.bd115200\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__bd38400 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd38400))) VL_PRINTF("	CHANGE: cpld.v:200: cpld.bd38400\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__bd19200 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd19200))) VL_PRINTF("	CHANGE: cpld.v:201: cpld.bd19200\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__bd9600 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd9600))) VL_PRINTF("	CHANGE: cpld.v:202: cpld.bd9600\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__bd4800 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd4800))) VL_PRINTF("	CHANGE: cpld.v:203: cpld.bd4800\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__bd2400 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd2400))) VL_PRINTF("	CHANGE: cpld.v:204: cpld.bd2400\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__bd1200 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd1200))) VL_PRINTF("	CHANGE: cpld.v:205: cpld.bd1200\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__bd600 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd600))) VL_PRINTF("	CHANGE: cpld.v:206: cpld.bd600\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__n_t_1x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__n_t_1x))) VL_PRINTF("	CHANGE: cpld.v:209: cpld.n_t_1x\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__n_t_2x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__n_t_2x))) VL_PRINTF("	CHANGE: cpld.v:210: cpld.n_t_2x\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__h12 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__h12))) VL_PRINTF("	CHANGE: cpld.v:226: cpld.h12\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__ratex2 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__ratex2))) VL_PRINTF("	CHANGE: cpld.v:227: cpld.ratex2\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__bd1200 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd1200))) VL_PRINTF("	CHANGE: M8650D.v:97: cpld.m8650d.bd1200\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__bd2400 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd2400))) VL_PRINTF("	CHANGE: M8650D.v:100: cpld.m8650d.bd2400\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__bd300 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd300))) VL_PRINTF("	CHANGE: M8650D.v:101: cpld.m8650d.bd300\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__bd600 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd600))) VL_PRINTF("	CHANGE: M8650D.v:102: cpld.m8650d.bd600\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__rx_div ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__rx_div))) VL_PRINTF("	CHANGE: M8650D.v:214: cpld.m8650d.rx_div\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_43x))) VL_PRINTF("	CHANGE: M8650D.v:216: cpld.m8650d.n_t_43x\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_75x))) VL_PRINTF("	CHANGE: M8650D.v:217: cpld.m8650d.n_t_75x\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__n_t_155x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_155x))) VL_PRINTF("	CHANGE: M8650D.v:218: cpld.m8650d.n_t_155x\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__gdollar_0 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_0))) VL_PRINTF("	CHANGE: M8650D.v:219: cpld.m8650d.gdollar_0\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__gdollar_1 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_1))) VL_PRINTF("	CHANGE: M8650D.v:220: cpld.m8650d.gdollar_1\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_88x))) VL_PRINTF("	CHANGE: M8650D.v:226: cpld.m8650d.n_t_88x\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__tx_div ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_div))) VL_PRINTF("	CHANGE: M8650D.v:231: cpld.m8650d.tx_div\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_2))) VL_PRINTF("	CHANGE: M8650D.v:233: cpld.m8650d.gdollar_2\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_3))) VL_PRINTF("	CHANGE: M8650D.v:234: cpld.m8650d.gdollar_3\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_active_l))) VL_PRINTF("	CHANGE: M8650D.v:235: cpld.m8650d.tx_active_l\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__n_t_70x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_70x))) VL_PRINTF("	CHANGE: M8650D.v:295: cpld.m8650d.n_t_70x\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__n_t_71x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_71x))) VL_PRINTF("	CHANGE: M8650D.v:296: cpld.m8650d.n_t_71x\n"); );
    // Final
    vlTOPp->__Vchglast__TOP__cpld__DOT__bd115200 = vlTOPp->cpld__DOT__bd115200;
    vlTOPp->__Vchglast__TOP__cpld__DOT__bd38400 = vlTOPp->cpld__DOT__bd38400;
    vlTOPp->__Vchglast__TOP__cpld__DOT__bd19200 = vlTOPp->cpld__DOT__bd19200;
    vlTOPp->__Vchglast__TOP__cpld__DOT__bd9600 = vlTOPp->cpld__DOT__bd9600;
    vlTOPp->__Vchglast__TOP__cpld__DOT__bd4800 = vlTOPp->cpld__DOT__bd4800;
    vlTOPp->__Vchglast__TOP__cpld__DOT__bd2400 = vlTOPp->cpld__DOT__bd2400;
    vlTOPp->__Vchglast__TOP__cpld__DOT__bd1200 = vlTOPp->cpld__DOT__bd1200;
    vlTOPp->__Vchglast__TOP__cpld__DOT__bd600 = vlTOPp->cpld__DOT__bd600;
    vlTOPp->__Vchglast__TOP__cpld__DOT__n_t_1x = vlTOPp->cpld__DOT__n_t_1x;
    vlTOPp->__Vchglast__TOP__cpld__DOT__n_t_2x = vlTOPp->cpld__DOT__n_t_2x;
    vlTOPp->__Vchglast__TOP__cpld__DOT__h12 = vlTOPp->cpld__DOT__h12;
    vlTOPp->__Vchglast__TOP__cpld__DOT__ratex2 = vlTOPp->cpld__DOT__ratex2;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd1200 
	= vlTOPp->cpld__DOT__m8650d__DOT__bd1200;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd2400 
	= vlTOPp->cpld__DOT__m8650d__DOT__bd2400;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd300 
	= vlTOPp->cpld__DOT__m8650d__DOT__bd300;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd600 
	= vlTOPp->cpld__DOT__m8650d__DOT__bd600;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__rx_div 
	= vlTOPp->cpld__DOT__m8650d__DOT__rx_div;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_43x 
	= vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_75x 
	= vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_155x 
	= vlTOPp->cpld__DOT__m8650d__DOT__n_t_155x;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_0 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_0;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_1 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_1;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_88x 
	= vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_div 
	= vlTOPp->cpld__DOT__m8650d__DOT__tx_div;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_2 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_3 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_active_l 
	= vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_70x 
	= vlTOPp->cpld__DOT__m8650d__DOT__n_t_70x;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_71x 
	= vlTOPp->cpld__DOT__m8650d__DOT__n_t_71x;
    return __req;
}

void Vcpld::_ctor_var_reset() {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_ctor_var_reset\n"); );
    // Body
    cf0 = VL_RAND_RESET_I(1);
    pulse_la = VL_RAND_RESET_I(1);
    data08_l = VL_RAND_RESET_I(1);
    f_set_l = VL_RAND_RESET_I(1);
    user_mode_l = VL_RAND_RESET_I(1);
    md11_l = VL_RAND_RESET_I(1);
    md10_l = VL_RAND_RESET_I(1);
    md09_l = VL_RAND_RESET_I(1);
    d_l = VL_RAND_RESET_I(1);
    md08_l = VL_RAND_RESET_I(1);
    f_l = VL_RAND_RESET_I(1);
    ir01_l = VL_RAND_RESET_I(1);
    ir00_l = VL_RAND_RESET_I(1);
    ind2_l = VL_RAND_RESET_I(1);
    ind1_l = VL_RAND_RESET_I(1);
    cpma_disable_l = VL_RAND_RESET_I(1);
    skip_l = VL_RAND_RESET_I(1);
    initialize = VL_RAND_RESET_I(1);
    int_rqst_l = VL_RAND_RESET_I(1);
    ts3_l = VL_RAND_RESET_I(1);
    internal_io_l = VL_RAND_RESET_I(1);
    ts1_l = VL_RAND_RESET_I(1);
    tp4 = VL_RAND_RESET_I(1);
    tp3 = VL_RAND_RESET_I(1);
    c1_l = VL_RAND_RESET_I(1);
    tp2 = VL_RAND_RESET_I(1);
    c0_l = VL_RAND_RESET_I(1);
    io_pause_l = VL_RAND_RESET_I(1);
    df_enable = VL_RAND_RESET_I(1);
    power_ok = VL_RAND_RESET_I(1);
    data07_l = VL_RAND_RESET_I(1);
    run_l = VL_RAND_RESET_I(1);
    data06_l = VL_RAND_RESET_I(1);
    data05_l = VL_RAND_RESET_I(1);
    data04_l = VL_RAND_RESET_I(1);
    int_in_prog_l = VL_RAND_RESET_I(1);
    md07_l = VL_RAND_RESET_I(1);
    md06_l = VL_RAND_RESET_I(1);
    md05_l = VL_RAND_RESET_I(1);
    md04_l = VL_RAND_RESET_I(1);
    load_cont_l = VL_RAND_RESET_I(1);
    tp_bb1 = VL_RAND_RESET_I(1);
    tp_ba1 = VL_RAND_RESET_I(1);
    data03_l = VL_RAND_RESET_I(1);
    data02_l = VL_RAND_RESET_I(1);
    data01_l = VL_RAND_RESET_I(1);
    data00_l = VL_RAND_RESET_I(1);
    md03_l = VL_RAND_RESET_I(1);
    md02_l = VL_RAND_RESET_I(1);
    md01_l = VL_RAND_RESET_I(1);
    md00_l = VL_RAND_RESET_I(1);
    ema2_l = VL_RAND_RESET_I(1);
    ema1_l = VL_RAND_RESET_I(1);
    ema0_l = VL_RAND_RESET_I(1);
    tp_ab1 = VL_RAND_RESET_I(1);
    tp_aa1 = VL_RAND_RESET_I(1);
    rxdttl = VL_RAND_RESET_I(1);
    txdttl = VL_RAND_RESET_I(1);
    data11_l = VL_RAND_RESET_I(1);
    key_ctl_l = VL_RAND_RESET_I(1);
    data10_l = VL_RAND_RESET_I(1);
    data09_l = VL_RAND_RESET_I(1);
    clk = VL_RAND_RESET_I(1);
    cf1 = VL_RAND_RESET_I(1);
    cpld__DOT__md = 0;
    cpld__DOT__bd115200 = VL_RAND_RESET_I(1);
    cpld__DOT__bd38400 = VL_RAND_RESET_I(1);
    cpld__DOT__bd19200 = VL_RAND_RESET_I(1);
    cpld__DOT__bd9600 = VL_RAND_RESET_I(1);
    cpld__DOT__bd4800 = VL_RAND_RESET_I(1);
    cpld__DOT__bd2400 = VL_RAND_RESET_I(1);
    cpld__DOT__bd1200 = VL_RAND_RESET_I(1);
    cpld__DOT__bd600 = VL_RAND_RESET_I(1);
    cpld__DOT__bd300 = VL_RAND_RESET_I(1);
    cpld__DOT__n_t_1x = VL_RAND_RESET_I(1);
    cpld__DOT__n_t_2x = VL_RAND_RESET_I(1);
    cpld__DOT__md03_set = VL_RAND_RESET_I(1);
    cpld__DOT__md04_set = VL_RAND_RESET_I(1);
    cpld__DOT__md05_set = VL_RAND_RESET_I(1);
    cpld__DOT__md07_set = VL_RAND_RESET_I(1);
    cpld__DOT__md03_ok = VL_RAND_RESET_I(1);
    cpld__DOT__md04_ok = VL_RAND_RESET_I(1);
    cpld__DOT__md05_ok = VL_RAND_RESET_I(1);
    cpld__DOT__md06_in = VL_RAND_RESET_I(1);
    cpld__DOT__md07_in = VL_RAND_RESET_I(1);
    cpld__DOT__md08_in = VL_RAND_RESET_I(1);
    cpld__DOT__md06_out = VL_RAND_RESET_I(1);
    cpld__DOT__md07_out = VL_RAND_RESET_I(1);
    cpld__DOT__rx_sel_l = VL_RAND_RESET_I(1);
    cpld__DOT__tx_sel_l = VL_RAND_RESET_I(1);
    cpld__DOT__j23 = VL_RAND_RESET_I(1);
    cpld__DOT__h12 = VL_RAND_RESET_I(1);
    cpld__DOT__ratex2 = VL_RAND_RESET_I(1);
    cpld__DOT__div11a = VL_RAND_RESET_I(1);
    cpld__DOT__div11b = VL_RAND_RESET_I(1);
    cpld__DOT__div11c = VL_RAND_RESET_I(1);
    cpld__DOT__div11d = VL_RAND_RESET_I(1);
    cpld__DOT__ndiv11a = VL_RAND_RESET_I(1);
    cpld__DOT__ndiv11b = VL_RAND_RESET_I(1);
    cpld__DOT__ndiv11c = VL_RAND_RESET_I(1);
    cpld__DOT__ndiv11d = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_128x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_77x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__bd1200 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__bd150 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__bd2400 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__bd300 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__bd600 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__eia_in = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__eia_out = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__md03 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__md04 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__md05 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__md06 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__md07 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n15v = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_119x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_162x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_30x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_83x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__r_run_l = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__reader_run = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__reader_run_or = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__rtsdtr = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__rx_20ma = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__rx_20ma_or = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__rx_active = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__tx_20ma = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__tx_20ma_or = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__ck_pulse_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__enab_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__gdollar_4_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__gdollar_5_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__gdollar_6_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__gdollar_7_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__gdollar_8_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__int_enab_l_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__last_unit_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__line_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_119x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_146x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_154x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_30x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_34x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_35x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_36x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_37x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_38x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_39x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_40x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_43x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_56x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_60x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_61x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_62x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_63x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_65x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_66x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_75x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_88x_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__p_pulse_l_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__r_run_l_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__rflg_l_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__rx_active_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__rx_div_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__spike_det_l_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__start_l_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__tflg_l_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__tx_active_l_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__tx_data_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__tx_div_m = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__rx_div = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__ck_pulse = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_43x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_75x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_155x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__gdollar_0 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__gdollar_1 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_34x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_36x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_35x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__p_pulse_l = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__last_unit = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_88x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_37x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_38x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_39x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_40x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__tx_div = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__spike_det_l = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__gdollar_2 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__gdollar_3 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__tx_active_l = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__start_l = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__gdollar_7 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__gdollar_8 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_60x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_62x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_56x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_61x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__enab = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_63x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_65x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_66x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__tx_data = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__tflg_l = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__int_enab_l = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__rflg_l = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__ckkcc_l = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__ckkie = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__cktfl = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__dokcc = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__dokrs = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__dotpc = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__flgs = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__krb_l = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_16x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_19x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_21x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_23x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_25x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_28x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_41x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_46x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_57x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_68x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_69x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_70x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_71x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_80x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_91x = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__rx_sel_l = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__selected_l = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__tkskp = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__tls_l = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__n_t_27x__out__out14 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__skip_l__out__en15 = VL_RAND_RESET_I(1);
    cpld__DOT__m8650d__DOT__tx_sel_l__out__out18 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__bd115200 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__n_t_1x = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__bd38400 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__bd19200 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__bd9600 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__bd4800 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__bd2400 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__bd1200 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__bd600 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__bd300 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__m8650d__DOT__n_t_155x = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__m8650d__DOT__gdollar_0 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__m8650d__DOT__gdollar_1 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__m8650d__DOT__bd2400 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__m8650d__DOT__bd1200 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__m8650d__DOT__bd600 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__m8650d__DOT__bd300 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__m8650d__DOT__bd150 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__h12 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__m8650d__DOT__gdollar_2 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__m8650d__DOT__gdollar_3 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__m8650d__DOT__n_t_162x = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__n_t_155x = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_0 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_1 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__bd2400 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__bd1200 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__bd600 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__bd300 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__h12 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_3 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__ratex2 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__bd115200 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__n_t_2x = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__n_t_1x = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__bd38400 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__bd19200 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__bd9600 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__bd4800 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__bd2400 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__bd1200 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__bd600 = VL_RAND_RESET_I(1);
    __Vclklast__TOP__cpld__DOT__m8650d__DOT__n_t_154x_m = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__n_t_155x = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_0 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_1 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd2400 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd1200 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd600 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd300 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__h12 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_3 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__ratex2 = VL_RAND_RESET_I(1);
    __Vclklast__TOP__clk = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd115200 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__n_t_2x = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__n_t_1x = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd38400 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd19200 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd9600 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd4800 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd2400 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd1200 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd600 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__bd115200 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__bd38400 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__bd19200 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__bd9600 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__bd4800 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__bd2400 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__bd1200 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__bd600 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__n_t_1x = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__n_t_2x = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__h12 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__ratex2 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__bd1200 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__bd2400 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__bd300 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__bd600 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__rx_div = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_43x = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_75x = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_155x = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_0 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_1 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_88x = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_div = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_2 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_3 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_active_l = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_70x = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_71x = VL_RAND_RESET_I(1);
    __Vm_traceActivity = VL_RAND_RESET_I(32);
}

void Vcpld::_configure_coverage(Vcpld__Syms* __restrict vlSymsp, bool first) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_configure_coverage\n"); );
}
