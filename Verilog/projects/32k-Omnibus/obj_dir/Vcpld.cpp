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

void Vcpld::_settle__TOP__1__PROF__cpld__l147(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__1__PROF__cpld__l147\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data03_l = 1U;
}

void Vcpld::_settle__TOP__2__PROF__cpld__l148(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__2__PROF__cpld__l148\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data02_l = 1U;
}

void Vcpld::_settle__TOP__3__PROF__cpld__l149(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__3__PROF__cpld__l149\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data01_l = 1U;
}

void Vcpld::_settle__TOP__4__PROF__cpld__l150(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__4__PROF__cpld__l150\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data00_l = 1U;
}

VL_INLINE_OPT void Vcpld::_settle__TOP__5__PROF__cpld__l182(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__5__PROF__cpld__l182\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__6__PROF__cpld__l453(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__6__PROF__cpld__l453\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ac[0U] = vlTOPp->ac[0U];
}

VL_INLINE_OPT void Vcpld::_settle__TOP__7__PROF__cpld__l453(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__7__PROF__cpld__l453\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ac[1U] = vlTOPp->ac[1U];
}

VL_INLINE_OPT void Vcpld::_settle__TOP__8__PROF__cpld__l453(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__8__PROF__cpld__l453\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ac[2U] = vlTOPp->ac[2U];
}

VL_INLINE_OPT void Vcpld::_settle__TOP__9__PROF__cpld__l453(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__9__PROF__cpld__l453\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ac[3U] = vlTOPp->ac[3U];
}

VL_INLINE_OPT void Vcpld::_settle__TOP__10__PROF__cpld__l453(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__10__PROF__cpld__l453\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ac[4U] = vlTOPp->ac[4U];
}

VL_INLINE_OPT void Vcpld::_settle__TOP__11__PROF__cpld__l453(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__11__PROF__cpld__l453\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ac[5U] = vlTOPp->ac[5U];
}

VL_INLINE_OPT void Vcpld::_settle__TOP__12__PROF__cpld__l453(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__12__PROF__cpld__l453\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ac[6U] = vlTOPp->ac[6U];
}

VL_INLINE_OPT void Vcpld::_settle__TOP__13__PROF__cpld__l453(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__13__PROF__cpld__l453\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ac[7U] = vlTOPp->ac[7U];
}

VL_INLINE_OPT void Vcpld::_settle__TOP__14__PROF__cpld__l453(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__14__PROF__cpld__l453\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ac[8U] = vlTOPp->ac[8U];
}

VL_INLINE_OPT void Vcpld::_settle__TOP__15__PROF__cpld__l453(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__15__PROF__cpld__l453\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ac[9U] = vlTOPp->ac[9U];
}

VL_INLINE_OPT void Vcpld::_settle__TOP__16__PROF__cpld__l453(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__16__PROF__cpld__l453\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ac[0xaU] = vlTOPp->ac[0xaU];
}

VL_INLINE_OPT void Vcpld::_settle__TOP__17__PROF__cpld__l453(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__17__PROF__cpld__l453\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ac[0xbU] = vlTOPp->ac[0xbU];
}

VL_INLINE_OPT void Vcpld::_settle__TOP__18__PROF__cpld__l461(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__18__PROF__cpld__l461\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__data11_l__out__out73 = ((IData)(vlTOPp->drive_ac) 
					       & (~ 
						  vlTOPp->ac
						  [0xbU]));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__19__PROF__cpld__l460(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__19__PROF__cpld__l460\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__data10_l__out__out76 = ((IData)(vlTOPp->drive_ac) 
					       & (~ 
						  vlTOPp->ac
						  [0xaU]));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__20__PROF__cpld__l459(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__20__PROF__cpld__l459\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__data09_l__out__out79 = ((IData)(vlTOPp->drive_ac) 
					       & (~ 
						  vlTOPp->ac
						  [9U]));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__21__PROF__cpld__l458(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__21__PROF__cpld__l458\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__data08_l__out__out46 = ((IData)(vlTOPp->drive_ac) 
					       & (~ 
						  vlTOPp->ac
						  [8U]));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__22__PROF__cpld__l457(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__22__PROF__cpld__l457\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__data07_l__out__out59 = ((IData)(vlTOPp->drive_ac) 
					       & (~ 
						  vlTOPp->ac
						  [7U]));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__23__PROF__cpld__l456(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__23__PROF__cpld__l456\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__data06_l__out__out62 = ((IData)(vlTOPp->drive_ac) 
					       & (~ 
						  vlTOPp->ac
						  [6U]));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__24__PROF__cpld__l455(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__24__PROF__cpld__l455\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__data05_l__out__out65 = ((IData)(vlTOPp->drive_ac) 
					       & (~ 
						  vlTOPp->ac
						  [5U]));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__25__PROF__cpld__l454(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__25__PROF__cpld__l454\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__data04_l__out__out68 = ((IData)(vlTOPp->drive_ac) 
					       & (~ 
						  vlTOPp->ac
						  [4U]));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__26__PROF__M8650D__l490(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__26__PROF__M8650D__l490\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__27__PROF__cpld__l434(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__27__PROF__cpld__l434\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md08_in = ((((~ (IData)(vlTOPp->tp_ab1)) 
				    & (~ (IData)(vlTOPp->tp_ba1))) 
				   | ((IData)(vlTOPp->tp_ab1) 
				      & (IData)(vlTOPp->tp_ba1))) 
				  & (IData)(vlTOPp->tp_bb1));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__28__PROF__cpld__l424(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__28__PROF__cpld__l424\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md06_in = (((IData)(vlTOPp->tp_ab1) 
				   & (~ (IData)(vlTOPp->tp_ba1))) 
				  | (((IData)(vlTOPp->tp_ab1) 
				      & (IData)(vlTOPp->tp_ba1)) 
				     & (~ (IData)(vlTOPp->tp_bb1))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__29__PROF__cpld__l405(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__29__PROF__cpld__l405\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md03_set = (((~ (IData)(vlTOPp->tp_ab1)) 
				    & (IData)(vlTOPp->tp_ba1)) 
				   | ((IData)(vlTOPp->tp_ab1) 
				      & (~ (IData)(vlTOPp->tp_ba1))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__30__PROF__cpld__l408(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__30__PROF__cpld__l408\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md05_set = ((IData)(vlTOPp->tp_ab1) 
				   & (IData)(vlTOPp->tp_ba1));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__31__PROF__cpld__l407(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__31__PROF__cpld__l407\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md04_set = (((IData)(vlTOPp->tp_ab1) 
				    & (IData)(vlTOPp->tp_ba1)) 
				   & (~ (IData)(vlTOPp->tp_bb1)));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__32__PROF__cpld__l428(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__32__PROF__cpld__l428\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md07_set = ((((~ (IData)(vlTOPp->tp_ab1)) 
				     & (IData)(vlTOPp->tp_ba1)) 
				    | ((IData)(vlTOPp->tp_ab1) 
				       & (~ (IData)(vlTOPp->tp_ba1)))) 
				   & (IData)(vlTOPp->tp_bb1));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__35__PROF__M8650D__l410(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__35__PROF__M8650D__l410\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__n_t_155x 
	= vlTOPp->cpld__DOT__m8650d__DOT__n_t_155x;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__36__PROF__M8650D__l408(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__36__PROF__M8650D__l408\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:408
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_154x_m)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__n_t_155x 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_155x)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__39__PROF__M8650D__l414(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__39__PROF__M8650D__l414\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_0 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_0;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__40__PROF__M8650D__l412(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__40__PROF__M8650D__l412\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:412
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_155x)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_0 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_0)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__43__PROF__M8650D__l418(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__43__PROF__M8650D__l418\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_1 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_1;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__44__PROF__M8650D__l416(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__44__PROF__M8650D__l416\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:416
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_0)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_1 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_1)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__47__PROF__M8650D__l422(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__47__PROF__M8650D__l422\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd2400 
	= vlTOPp->cpld__DOT__m8650d__DOT__bd2400;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__48__PROF__M8650D__l420(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__48__PROF__M8650D__l420\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:420
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_1)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd2400 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd2400)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__51__PROF__M8650D__l660(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__51__PROF__M8650D__l660\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd1200 
	= vlTOPp->cpld__DOT__m8650d__DOT__bd1200;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__52__PROF__M8650D__l658(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__52__PROF__M8650D__l658\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:658
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd2400)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd1200 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd1200)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__55__PROF__M8650D__l664(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__55__PROF__M8650D__l664\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd600 = vlTOPp->cpld__DOT__m8650d__DOT__bd600;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__56__PROF__M8650D__l662(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__56__PROF__M8650D__l662\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:662
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd1200)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd600 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd600)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__59__PROF__M8650D__l668(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__59__PROF__M8650D__l668\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd300 = vlTOPp->cpld__DOT__m8650d__DOT__bd300;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__60__PROF__M8650D__l666(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__60__PROF__M8650D__l666\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:666
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd600)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd300 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd300)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__63__PROF__M8650D__l672(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__63__PROF__M8650D__l672\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd150 = vlTOPp->cpld__DOT__m8650d__DOT__bd150;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__64__PROF__M8650D__l670(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__64__PROF__M8650D__l670\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:670
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd300)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd150 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__bd150)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__65__PROF__M8650D__l672(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__65__PROF__M8650D__l672\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__bd150 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd150;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__68__PROF__M8650D__l729(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__68__PROF__M8650D__l729\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_2 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__69__PROF__M8650D__l727(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__69__PROF__M8650D__l727\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:727
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__rx_rate)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_2 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__72__PROF__M8650D__l733(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__72__PROF__M8650D__l733\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_3 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__73__PROF__M8650D__l731(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__73__PROF__M8650D__l731\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:731
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2)))) {
	vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_3 
	    = (1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__76__PROF__M8650D__l725(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__76__PROF__M8650D__l725\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__rx_rate = vlTOPp->cpld__DOT__rx_rate;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__77__PROF__M8650D__l723(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__77__PROF__M8650D__l723\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:723
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__ratex2)))) {
	vlTOPp->__Vdly__cpld__DOT__rx_rate = (1U & 
					      (~ (IData)(vlTOPp->cpld__DOT__rx_rate)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__78__PROF__M8650D__l725(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__78__PROF__M8650D__l725\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__rx_rate = vlTOPp->__Vdly__cpld__DOT__rx_rate;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__81__PROF__M8650D__l737(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__81__PROF__M8650D__l737\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__h12 = vlTOPp->cpld__DOT__h12;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__82__PROF__M8650D__l735(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__82__PROF__M8650D__l735\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:735
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3)))) {
	vlTOPp->__Vdly__cpld__DOT__h12 = (1U & (~ (IData)(vlTOPp->cpld__DOT__h12)));
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__83__PROF__M8650D__l737(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__83__PROF__M8650D__l737\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__h12 = vlTOPp->__Vdly__cpld__DOT__h12;
}

VL_INLINE_OPT void Vcpld::_combo__TOP__112__PROF__M8650D__l691(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__112__PROF__M8650D__l691\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__113__PROF__M8650D__l754(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__113__PROF__M8650D__l754\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__114__PROF__M8650D__l500(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__114__PROF__M8650D__l500\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__115__PROF__cpld__l426(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__115__PROF__cpld__l426\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md06_out = ((IData)(vlTOPp->cpld__DOT__md06_in) 
				   | (((~ (IData)(vlTOPp->tp_ab1)) 
				       & (~ (IData)(vlTOPp->tp_ba1))) 
				      & (IData)(vlTOPp->tp_bb1)));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__116__PROF__cpld__l409(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__116__PROF__cpld__l409\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md03_ok = (((IData)(vlTOPp->cpld__DOT__md03_set) 
				   & (~ (IData)(vlTOPp->md03_l))) 
				  | ((~ (IData)(vlTOPp->cpld__DOT__md03_set)) 
				     & (IData)(vlTOPp->md03_l)));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__117__PROF__cpld__l413(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__117__PROF__cpld__l413\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md05_ok = (((IData)(vlTOPp->cpld__DOT__md05_set) 
				   & (~ (IData)(vlTOPp->md05_l))) 
				  | ((~ (IData)(vlTOPp->cpld__DOT__md05_set)) 
				     & (IData)(vlTOPp->md05_l)));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__118__PROF__cpld__l411(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__118__PROF__cpld__l411\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md04_ok = (((IData)(vlTOPp->cpld__DOT__md04_set) 
				   & (~ (IData)(vlTOPp->md04_l))) 
				  | ((~ (IData)(vlTOPp->cpld__DOT__md04_set)) 
				     & (IData)(vlTOPp->md04_l)));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__119__PROF__cpld__l430(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__119__PROF__cpld__l430\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md07_in = ((IData)(vlTOPp->cpld__DOT__md07_set) 
				  | (((~ (IData)(vlTOPp->tp_ab1)) 
				      & (~ (IData)(vlTOPp->tp_ba1))) 
				     & (IData)(vlTOPp->tp_bb1)));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__120__PROF__cpld__l432(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__120__PROF__cpld__l432\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__md07_out = ((IData)(vlTOPp->cpld__DOT__md07_set) 
				   | (((IData)(vlTOPp->tp_ab1) 
				       & (IData)(vlTOPp->tp_ba1)) 
				      & (IData)(vlTOPp->tp_bb1)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__123__PROF__cpld__l328(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__123__PROF__cpld__l328\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd115200 = vlTOPp->cpld__DOT__bd115200;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__124__PROF__cpld__l326(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__124__PROF__cpld__l326\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:326
    vlTOPp->__Vdly__cpld__DOT__bd115200 = (1U & (~ (IData)(vlTOPp->cpld__DOT__bd115200)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__125__PROF__cpld__l328(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__125__PROF__cpld__l328\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd115200 = vlTOPp->__Vdly__cpld__DOT__bd115200;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__126__PROF__M8650D__l410(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__126__PROF__M8650D__l410\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_155x = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__n_t_155x;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__127__PROF__M8650D__l414(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__127__PROF__M8650D__l414\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__gdollar_0 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_0;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__128__PROF__M8650D__l418(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__128__PROF__M8650D__l418\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__gdollar_1 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_1;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__129__PROF__M8650D__l422(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__129__PROF__M8650D__l422\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__bd2400 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd2400;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__130__PROF__M8650D__l660(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__130__PROF__M8650D__l660\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__bd1200 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd1200;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__131__PROF__M8650D__l664(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__131__PROF__M8650D__l664\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__bd600 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd600;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__132__PROF__M8650D__l668(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__132__PROF__M8650D__l668\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__bd300 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__bd300;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__133__PROF__M8650D__l729(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__133__PROF__M8650D__l729\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_2;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__134__PROF__M8650D__l733(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__134__PROF__M8650D__l733\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3 = vlTOPp->__Vdly__cpld__DOT__m8650d__DOT__gdollar_3;
}

VL_INLINE_OPT void Vcpld::_settle__TOP__144__PROF__M8650D__l681(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__144__PROF__M8650D__l681\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__145__PROF__M8650D__l876(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__145__PROF__M8650D__l876\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__146__PROF__M8650D__l765(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__146__PROF__M8650D__l765\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__147__PROF__M8650D__l654(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__147__PROF__M8650D__l654\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_91x = (1U & 
					       (~ (
						   (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_active)) 
						   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__148__PROF__M8650D__l510(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__148__PROF__M8650D__l510\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__149__PROF__M8650D__l653(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__149__PROF__M8650D__l653\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_80x = (1U & 
					       (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_active) 
						   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__150__PROF__cpld__l437(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__150__PROF__cpld__l437\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__151__PROF__cpld__l441(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__151__PROF__cpld__l441\n"); );
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

VL_INLINE_OPT void Vcpld::_sequent__TOP__154__PROF__cpld__l337(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__154__PROF__cpld__l337\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__n_t_1x = vlTOPp->cpld__DOT__n_t_1x;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__155__PROF__cpld__l333(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__155__PROF__cpld__l333\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:333
    vlTOPp->__Vdly__cpld__DOT__n_t_1x = ((IData)(vlTOPp->cpld__DOT__n_t_2x) 
					 & (~ (IData)(vlTOPp->cpld__DOT__n_t_1x)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__156__PROF__cpld__l337(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__156__PROF__cpld__l337\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__n_t_1x = vlTOPp->__Vdly__cpld__DOT__n_t_1x;
}

VL_INLINE_OPT void Vcpld::_combo__TOP__165__PROF__M8650D__l885(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__165__PROF__M8650D__l885\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__166__PROF__M8650D__l775(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__166__PROF__M8650D__l775\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__167__PROF__M8650D__l520(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__167__PROF__M8650D__l520\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__168__PROF__M8650D__l702(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__168__PROF__M8650D__l702\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__169__PROF__M8650D__l346(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__169__PROF__M8650D__l346\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:346
    if (vlTOPp->cpld__DOT__rx_rate) {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_80x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse_m = 1U;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse_m = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__170__PROF__M8650D__l572(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__170__PROF__M8650D__l572\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__171__PROF__M8650D__l1312(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__171__PROF__M8650D__l1312\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18 
	= ((((IData)(vlTOPp->cpld__DOT__tx_sel_l) | (IData)(vlTOPp->io_pause_l)) 
	    | (IData)(vlTOPp->cpld__DOT__tx_sel_l)) 
	   | (((IData)(vlTOPp->cpld__DOT__tx_sel_l) 
	       | (IData)(vlTOPp->io_pause_l)) | (IData)(vlTOPp->cpld__DOT__tx_sel_l)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__174__PROF__cpld__l343(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__174__PROF__cpld__l343\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd38400 = vlTOPp->cpld__DOT__bd38400;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__175__PROF__cpld__l339(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__175__PROF__cpld__l339\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:339
    vlTOPp->__Vdly__cpld__DOT__bd38400 = ((IData)(vlTOPp->cpld__DOT__n_t_2x) 
					  & (~ (IData)(vlTOPp->cpld__DOT__bd38400)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__176__PROF__cpld__l343(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__176__PROF__cpld__l343\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd38400 = vlTOPp->__Vdly__cpld__DOT__bd38400;
}

VL_INLINE_OPT void Vcpld::_settle__TOP__184__PROF__cpld__l345(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__184__PROF__cpld__l345\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__n_t_2x = (1U & (~ ((IData)(vlTOPp->cpld__DOT__n_t_1x) 
					  & (IData)(vlTOPp->cpld__DOT__bd38400))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__185__PROF__M8650D__l892(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__185__PROF__M8650D__l892\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__186__PROF__M8650D__l1024(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__186__PROF__M8650D__l1024\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1024
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

VL_INLINE_OPT void Vcpld::_settle__TOP__187__PROF__M8650D__l712(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__187__PROF__M8650D__l712\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__188__PROF__M8650D__l356(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__188__PROF__M8650D__l356\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:356
    if (vlTOPp->cpld__DOT__rx_rate) {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_80x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse 
		= vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse_m;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse = 0U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__189__PROF__cpld__l111(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__189__PROF__cpld__l111\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->internal_io_l = (1U & (~ ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
				      | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__190__PROF__M8650D__l853(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__190__PROF__M8650D__l853\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__selected_l = (1U 
						  & (~ 
						     ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)) 
						      | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__198__PROF__M8650D__l901(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__198__PROF__M8650D__l901\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__199__PROF__M8650D__l1034(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__199__PROF__M8650D__l1034\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1034
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

VL_INLINE_OPT void Vcpld::_combo__TOP__200__PROF__M8650D__l648(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__200__PROF__M8650D__l648\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x = (1U & 
					       (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse) 
						   | (~ 
						      ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l) 
						       | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x))))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__201__PROF__M8650D__l1238(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__201__PROF__M8650D__l1238\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x = (1U & 
					       (~ ((IData)(vlTOPp->md10_l) 
						   | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__selected_l))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__202__PROF__M8650D__l1240(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__202__PROF__M8650D__l1240\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x = (1U & 
					       (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__selected_l) 
						   | (IData)(vlTOPp->md09_l))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__203__PROF__M8650D__l1242(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__203__PROF__M8650D__l1242\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x = (1U & 
					       (~ ((IData)(vlTOPp->md11_l) 
						   | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__selected_l))));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__206__PROF__cpld__l350(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__206__PROF__cpld__l350\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd19200 = vlTOPp->cpld__DOT__bd19200;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__207__PROF__cpld__l348(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__207__PROF__cpld__l348\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:348
    vlTOPp->__Vdly__cpld__DOT__bd19200 = (1U & (~ (IData)(vlTOPp->cpld__DOT__bd19200)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__208__PROF__cpld__l350(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__208__PROF__cpld__l350\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd19200 = vlTOPp->__Vdly__cpld__DOT__bd19200;
}

VL_INLINE_OPT void Vcpld::_settle__TOP__215__PROF__M8650D__l908(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__215__PROF__M8650D__l908\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__216__PROF__cpld__l449(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__216__PROF__cpld__l449\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->rxdttl = vlTOPp->txdttl;
}

VL_INLINE_OPT void Vcpld::_settle__TOP__217__PROF__M8650D__l1249(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__217__PROF__M8650D__l1249\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__218__PROF__M8650D__l1229(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__218__PROF__M8650D__l1229\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__219__PROF__M8650D__l1222(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__219__PROF__M8650D__l1222\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__krb_l = (1U & (~ 
						   ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_sel_l)) 
						      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x)) 
						     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x)) 
						    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__220__PROF__M8650D__l1209(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__220__PROF__M8650D__l1209\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__tls_l = (1U & (~ 
						   ((((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_sel_l__out__out18)) 
						      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_23x)) 
						     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_21x)) 
						    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_25x)))));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__223__PROF__cpld__l354(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__223__PROF__cpld__l354\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd9600 = vlTOPp->cpld__DOT__bd9600;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__224__PROF__cpld__l352(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__224__PROF__cpld__l352\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:352
    vlTOPp->__Vdly__cpld__DOT__bd9600 = (1U & (~ (IData)(vlTOPp->cpld__DOT__bd9600)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__225__PROF__cpld__l354(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__225__PROF__cpld__l354\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd9600 = vlTOPp->__Vdly__cpld__DOT__bd9600;
}

VL_INLINE_OPT void Vcpld::_combo__TOP__232__PROF__M8650D__l917(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__232__PROF__M8650D__l917\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__233__PROF__M8650D__l425(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__233__PROF__M8650D__l425\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:425
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_30x_m = 
	    (1U & (((~ (IData)(vlTOPp->rxdttl)) & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l)) 
		   | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__p_pulse_l))));
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__234__PROF__M8650D__l1226(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__234__PROF__M8650D__l1226\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__235__PROF__M8650D__l1225(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__235__PROF__M8650D__l1225\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__236__PROF__M8650D__l1211(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__236__PROF__M8650D__l1211\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__237__PROF__M8650D__l1212(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__237__PROF__M8650D__l1212\n"); );
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

VL_INLINE_OPT void Vcpld::_sequent__TOP__240__PROF__cpld__l358(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__240__PROF__cpld__l358\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd4800 = vlTOPp->cpld__DOT__bd4800;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__241__PROF__cpld__l356(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__241__PROF__cpld__l356\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:356
    vlTOPp->__Vdly__cpld__DOT__bd4800 = (1U & (~ (IData)(vlTOPp->cpld__DOT__bd4800)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__242__PROF__cpld__l358(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__242__PROF__cpld__l358\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd4800 = vlTOPp->__Vdly__cpld__DOT__bd4800;
}

VL_INLINE_OPT void Vcpld::_settle__TOP__249__PROF__M8650D__l924(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__249__PROF__M8650D__l924\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__250__PROF__M8650D__l434(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__250__PROF__M8650D__l434\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:434
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_30x = vlTOPp->cpld__DOT__m8650d__DOT__n_t_30x_m;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__251__PROF__cpld__l117(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__251__PROF__cpld__l117\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->c0_l = (1U & ((((((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokcc) 
			      & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokcc))) 
			     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokcc)) 
			    & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokcc)) 
			   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokcc)) 
			  | (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokcc))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__252__PROF__M8650D__l1227(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__252__PROF__M8650D__l1227\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__ckkcc_l = (1U & 
					       (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokcc) 
						   & (IData)(vlTOPp->tp3))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__253__PROF__cpld__l115(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__253__PROF__cpld__l115\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->c1_l = (1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs) 
			     | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokcc))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__254__PROF__M8650D__l873(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__254__PROF__M8650D__l873\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x = (1U & 
					       (~ (
						   ((IData)(vlTOPp->tp3) 
						    & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)) 
						   | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tx_div))));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__257__PROF__cpld__l362(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__257__PROF__cpld__l362\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd2400 = vlTOPp->cpld__DOT__bd2400;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__258__PROF__cpld__l360(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__258__PROF__cpld__l360\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:360
    vlTOPp->__Vdly__cpld__DOT__bd2400 = (1U & (~ (IData)(vlTOPp->cpld__DOT__bd2400)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__259__PROF__cpld__l362(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__259__PROF__cpld__l362\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd2400 = vlTOPp->__Vdly__cpld__DOT__bd2400;
}

VL_INLINE_OPT void Vcpld::_combo__TOP__266__PROF__M8650D__l933(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__266__PROF__M8650D__l933\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__267__PROF__cpld__l129(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__267__PROF__cpld__l129\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data04_l = (1U & ((((IData)(vlTOPp->cpld__DOT__data04_l__out__out68) 
				& (IData)(vlTOPp->drive_ac)) 
			       & (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs) 
				   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_30x)) 
				  | (IData)(vlTOPp->drive_ac))) 
			      | (~ (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs) 
				     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_30x)) 
				    | (IData)(vlTOPp->drive_ac)))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__268__PROF__M8650D__l441(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__268__PROF__M8650D__l441\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__269__PROF__M8650D__l1245(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__269__PROF__M8650D__l1245\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__270__PROF__M8650D__l1274(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__270__PROF__M8650D__l1274\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1274
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

VL_INLINE_OPT void Vcpld::_combo__TOP__271__PROF__M8650D__l1045(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__271__PROF__M8650D__l1045\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1045
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__enab_m = 0U;
    } else {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__enab_m 
		= vlTOPp->cpld__DOT__m8650d__DOT__dotpc;
	}
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__274__PROF__cpld__l366(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__274__PROF__cpld__l366\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd1200 = vlTOPp->cpld__DOT__bd1200;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__275__PROF__cpld__l364(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__275__PROF__cpld__l364\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:364
    vlTOPp->__Vdly__cpld__DOT__bd1200 = (1U & (~ (IData)(vlTOPp->cpld__DOT__bd1200)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__276__PROF__cpld__l366(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__276__PROF__cpld__l366\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd1200 = vlTOPp->__Vdly__cpld__DOT__bd1200;
}

VL_INLINE_OPT void Vcpld::_settle__TOP__283__PROF__M8650D__l450(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__283__PROF__M8650D__l450\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:450
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_34x = vlTOPp->cpld__DOT__m8650d__DOT__n_t_34x_m;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__284__PROF__M8650D__l1284(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__284__PROF__M8650D__l1284\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1284
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

VL_INLINE_OPT void Vcpld::_settle__TOP__285__PROF__M8650D__l1055(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__285__PROF__M8650D__l1055\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1055
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__enab = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__enab = vlTOPp->cpld__DOT__m8650d__DOT__enab_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__287__PROF__cpld__l387(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__287__PROF__cpld__l387\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:387
    vlTOPp->cpld__DOT__div11b = vlTOPp->cpld__DOT__ndiv11b;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__288__PROF__cpld__l388(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__288__PROF__cpld__l388\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:388
    vlTOPp->cpld__DOT__div11c = vlTOPp->cpld__DOT__ndiv11c;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__289__PROF__cpld__l389(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__289__PROF__cpld__l389\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:389
    vlTOPp->cpld__DOT__div11d = vlTOPp->cpld__DOT__ndiv11d;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__290__PROF__cpld__l386(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__290__PROF__cpld__l386\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:386
    vlTOPp->cpld__DOT__div11a = vlTOPp->cpld__DOT__ndiv11a;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__291__PROF__cpld__l383(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__291__PROF__cpld__l383\n"); );
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

VL_INLINE_OPT void Vcpld::_sequent__TOP__292__PROF__cpld__l380(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__292__PROF__cpld__l380\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ndiv11d = (1U & (~ ((IData)(vlTOPp->cpld__DOT__div11d) 
					   | ((IData)(vlTOPp->cpld__DOT__div11a) 
					      & (IData)(vlTOPp->cpld__DOT__div11c)))));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__293__PROF__cpld__l381(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__293__PROF__cpld__l381\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ndiv11c = (1U & (~ ((IData)(vlTOPp->cpld__DOT__div11d)
					    ? (IData)(vlTOPp->cpld__DOT__div11c)
					    : ((~ (IData)(vlTOPp->cpld__DOT__div11c)) 
					       | ((IData)(vlTOPp->cpld__DOT__div11a) 
						  & (IData)(vlTOPp->cpld__DOT__div11c))))));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__294__PROF__cpld__l382(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__294__PROF__cpld__l382\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__ndiv11b = (1U & (~ (((IData)(vlTOPp->cpld__DOT__div11c) 
					    & (IData)(vlTOPp->cpld__DOT__div11d))
					    ? (IData)(vlTOPp->cpld__DOT__div11b)
					    : ((~ (IData)(vlTOPp->cpld__DOT__div11b)) 
					       | ((IData)(vlTOPp->cpld__DOT__div11a) 
						  & (IData)(vlTOPp->cpld__DOT__div11c))))));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__297__PROF__cpld__l370(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__297__PROF__cpld__l370\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd600 = vlTOPp->cpld__DOT__bd600;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__298__PROF__cpld__l368(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__298__PROF__cpld__l368\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:368
    vlTOPp->__Vdly__cpld__DOT__bd600 = (1U & (~ (IData)(vlTOPp->cpld__DOT__bd600)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__299__PROF__cpld__l370(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__299__PROF__cpld__l370\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd600 = vlTOPp->__Vdly__cpld__DOT__bd600;
}

VL_INLINE_OPT void Vcpld::_combo__TOP__303__PROF__cpld__l128(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__303__PROF__cpld__l128\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data05_l = (1U & ((((IData)(vlTOPp->cpld__DOT__data05_l__out__out65) 
				& (IData)(vlTOPp->drive_ac)) 
			       & (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_34x) 
				   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs)) 
				  | (IData)(vlTOPp->drive_ac))) 
			      | (~ (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_34x) 
				     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs)) 
				    | (IData)(vlTOPp->drive_ac)))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__304__PROF__M8650D__l457(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__304__PROF__M8650D__l457\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__305__PROF__M8650D__l962(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__305__PROF__M8650D__l962\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:962
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_60x_m = 0U;
    } else {
	if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_60x_m 
		= (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__enab) 
		    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc))) 
		   | ((~ ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)) 
			  | (IData)(vlTOPp->data04_l))) 
		      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dotpc)));
	}
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__313__PROF__M8650D__l466(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__313__PROF__M8650D__l466\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:466
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_36x = vlTOPp->cpld__DOT__m8650d__DOT__n_t_36x_m;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__314__PROF__M8650D__l968(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__314__PROF__M8650D__l968\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:968
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_60x = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_60x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_60x_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__317__PROF__cpld__l374(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__317__PROF__cpld__l374\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__cpld__DOT__bd300 = vlTOPp->cpld__DOT__bd300;
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__318__PROF__cpld__l372(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__318__PROF__cpld__l372\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at cpld.v:372
    vlTOPp->__Vdly__cpld__DOT__bd300 = (1U & (~ (IData)(vlTOPp->cpld__DOT__bd300)));
}

VL_INLINE_OPT void Vcpld::_sequent__TOP__319__PROF__cpld__l374(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_sequent__TOP__319__PROF__cpld__l374\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__bd300 = vlTOPp->__Vdly__cpld__DOT__bd300;
}

VL_INLINE_OPT void Vcpld::_combo__TOP__322__PROF__cpld__l394(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__322__PROF__cpld__l394\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__323__PROF__cpld__l127(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__323__PROF__cpld__l127\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data06_l = (1U & ((((IData)(vlTOPp->cpld__DOT__data06_l__out__out62) 
				& (IData)(vlTOPp->drive_ac)) 
			       & (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs) 
				   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_36x)) 
				  | (IData)(vlTOPp->drive_ac))) 
			      | (~ (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs) 
				     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_36x)) 
				    | (IData)(vlTOPp->drive_ac)))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__324__PROF__M8650D__l473(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__324__PROF__M8650D__l473\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__325__PROF__M8650D__l975(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__325__PROF__M8650D__l975\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:975
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

VL_INLINE_OPT void Vcpld::_settle__TOP__330__PROF__M8650D__l482(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__330__PROF__M8650D__l482\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:482
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_35x = vlTOPp->cpld__DOT__m8650d__DOT__n_t_35x_m;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__331__PROF__M8650D__l984(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__331__PROF__M8650D__l984\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:984
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_62x = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_62x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_62x_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__334__PROF__cpld__l125(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__334__PROF__cpld__l125\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data07_l = (1U & ((((IData)(vlTOPp->cpld__DOT__data07_l__out__out59) 
				& (IData)(vlTOPp->drive_ac)) 
			       & (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_35x) 
				   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs)) 
				  | (IData)(vlTOPp->drive_ac))) 
			      | (~ (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_35x) 
				     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs)) 
				    | (IData)(vlTOPp->drive_ac)))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__335__PROF__M8650D__l580(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__335__PROF__M8650D__l580\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__336__PROF__M8650D__l991(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__336__PROF__M8650D__l991\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:991
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

VL_INLINE_OPT void Vcpld::_settle__TOP__340__PROF__M8650D__l589(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__340__PROF__M8650D__l589\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:589
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_37x = vlTOPp->cpld__DOT__m8650d__DOT__n_t_37x_m;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__341__PROF__M8650D__l1000(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__341__PROF__M8650D__l1000\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1000
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_56x = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_56x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_56x_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__344__PROF__cpld__l89(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__344__PROF__cpld__l89\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data08_l = (1U & ((((IData)(vlTOPp->cpld__DOT__data08_l__out__out46) 
				& (IData)(vlTOPp->drive_ac)) 
			       & (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs) 
				   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_37x)) 
				  | (IData)(vlTOPp->drive_ac))) 
			      | (~ (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs) 
				     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_37x)) 
				    | (IData)(vlTOPp->drive_ac)))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__345__PROF__M8650D__l596(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__345__PROF__M8650D__l596\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__346__PROF__M8650D__l862(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__346__PROF__M8650D__l862\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_69x = (1U & 
					       (~ (
						   (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_56x) 
						     | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__enab)) 
						    | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_60x)) 
						   | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_62x))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__347__PROF__M8650D__l1007(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__347__PROF__M8650D__l1007\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1007
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

VL_INLINE_OPT void Vcpld::_settle__TOP__352__PROF__M8650D__l605(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__352__PROF__M8650D__l605\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:605
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_38x = vlTOPp->cpld__DOT__m8650d__DOT__n_t_38x_m;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__353__PROF__M8650D__l1016(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__353__PROF__M8650D__l1016\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1016
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_61x = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_61x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_61x_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__356__PROF__cpld__l173(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__356__PROF__cpld__l173\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data09_l = (1U & ((((IData)(vlTOPp->cpld__DOT__data09_l__out__out79) 
				& (IData)(vlTOPp->drive_ac)) 
			       & (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_38x) 
				   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs)) 
				  | (IData)(vlTOPp->drive_ac))) 
			      | (~ (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_38x) 
				     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs)) 
				    | (IData)(vlTOPp->drive_ac)))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__357__PROF__M8650D__l612(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__357__PROF__M8650D__l612\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__358__PROF__M8650D__l1075(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__358__PROF__M8650D__l1075\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1075
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

VL_INLINE_OPT void Vcpld::_settle__TOP__362__PROF__M8650D__l621(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__362__PROF__M8650D__l621\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:621
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_39x = vlTOPp->cpld__DOT__m8650d__DOT__n_t_39x_m;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__363__PROF__M8650D__l1084(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__363__PROF__M8650D__l1084\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1084
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_63x = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_63x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_63x_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__366__PROF__M8650D__l628(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__366__PROF__M8650D__l628\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__367__PROF__cpld__l172(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__367__PROF__cpld__l172\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data10_l = (1U & ((((IData)(vlTOPp->cpld__DOT__data10_l__out__out76) 
				& (IData)(vlTOPp->drive_ac)) 
			       & (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs) 
				   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_39x)) 
				  | (IData)(vlTOPp->drive_ac))) 
			      | (~ (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs) 
				     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_39x)) 
				    | (IData)(vlTOPp->drive_ac)))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__368__PROF__M8650D__l1091(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__368__PROF__M8650D__l1091\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1091
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

VL_INLINE_OPT void Vcpld::_settle__TOP__372__PROF__M8650D__l637(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__372__PROF__M8650D__l637\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:637
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_41x)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_40x = vlTOPp->cpld__DOT__m8650d__DOT__n_t_40x_m;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__373__PROF__M8650D__l1100(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__373__PROF__M8650D__l1100\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1100
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_65x = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_65x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_65x_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__376__PROF__M8650D__l1254(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__376__PROF__M8650D__l1254\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1254
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_28x) {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__rflg_l_m 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_40x;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__rflg_l_m = 1U;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__377__PROF__cpld__l170(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__377__PROF__cpld__l170\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->data11_l = (1U & ((((IData)(vlTOPp->cpld__DOT__data11_l__out__out73) 
				& (IData)(vlTOPp->drive_ac)) 
			       & (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_40x) 
				   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs)) 
				  | (IData)(vlTOPp->drive_ac))) 
			      | (~ (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_40x) 
				     & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__dokrs)) 
				    | (IData)(vlTOPp->drive_ac)))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__378__PROF__M8650D__l531(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__378__PROF__M8650D__l531\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__379__PROF__M8650D__l1107(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__379__PROF__M8650D__l1107\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1107
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

VL_INLINE_OPT void Vcpld::_settle__TOP__384__PROF__M8650D__l1264(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__384__PROF__M8650D__l1264\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1264
    if (vlTOPp->cpld__DOT__m8650d__DOT__n_t_28x) {
	if (vlTOPp->cpld__DOT__m8650d__DOT__ck_pulse) {
	    vlTOPp->cpld__DOT__m8650d__DOT__rflg_l 
		= vlTOPp->cpld__DOT__m8650d__DOT__rflg_l_m;
	}
    } else {
	vlTOPp->cpld__DOT__m8650d__DOT__rflg_l = 1U;
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__385__PROF__M8650D__l1179(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__385__PROF__M8650D__l1179\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1179
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__int_enab_l_m = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__ckkie)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__int_enab_l_m 
		= ((IData)(vlTOPp->io_pause_l) | (IData)(vlTOPp->data11_l));
	}
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__386__PROF__M8650D__l541(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__386__PROF__M8650D__l541\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__387__PROF__M8650D__l1116(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__387__PROF__M8650D__l1116\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1116
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__n_t_66x = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__n_t_66x 
		= vlTOPp->cpld__DOT__m8650d__DOT__n_t_66x_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__392__PROF__M8650D__l1189(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__392__PROF__M8650D__l1189\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1189
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__int_enab_l = 0U;
    } else {
	if (vlTOPp->cpld__DOT__m8650d__DOT__ckkie) {
	    vlTOPp->cpld__DOT__m8650d__DOT__int_enab_l 
		= vlTOPp->cpld__DOT__m8650d__DOT__int_enab_l_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__393__PROF__M8650D__l1201(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__393__PROF__M8650D__l1201\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__394__PROF__M8650D__l656(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__394__PROF__M8650D__l656\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_27x__out__out14 
	= (1U & (~ ((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__last_unit)) 
		    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_active)))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__395__PROF__M8650D__l1123(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__395__PROF__M8650D__l1123\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1123
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

VL_INLINE_OPT void Vcpld::_combo__TOP__396__PROF__M8650D__l866(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__396__PROF__M8650D__l866\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_68x = (1U & 
					       (~ (
						   (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_63x) 
						     | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_65x)) 
						    | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_66x)) 
						   | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_61x))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__402__PROF__M8650D__l1233(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__402__PROF__M8650D__l1233\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__403__PROF__M8650D__l740(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__403__PROF__M8650D__l740\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__n_t_71x = (1U & 
					       (~ (
						   ((IData)(vlTOPp->rxdttl) 
						    & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_27x__out__out14))) 
						   & (IData)(vlTOPp->cpld__DOT__rx_rate))));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__404__PROF__M8650D__l326(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__404__PROF__M8650D__l326\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:326
    if ((1U & (~ (IData)(vlTOPp->cpld__DOT__rx_rate)))) {
	vlTOPp->cpld__DOT__m8650d__DOT__rx_div_m = 
	    (1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__rx_div) 
		      & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_27x__out__out14))));
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__405__PROF__M8650D__l367(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__405__PROF__M8650D__l367\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__406__PROF__M8650D__l387(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__406__PROF__M8650D__l387\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__407__PROF__M8650D__l551(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__407__PROF__M8650D__l551\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__408__PROF__M8650D__l1132(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__408__PROF__M8650D__l1132\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1132
    if (vlTOPp->initialize) {
	vlTOPp->cpld__DOT__m8650d__DOT__tx_data = 0U;
    } else {
	if ((1U & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_57x)))) {
	    vlTOPp->cpld__DOT__m8650d__DOT__tx_data 
		= vlTOPp->cpld__DOT__m8650d__DOT__tx_data_m;
	}
    }
}

VL_INLINE_OPT void Vcpld::_settle__TOP__409__PROF__M8650D__l744(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__409__PROF__M8650D__l744\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__410__PROF__M8650D__l1159(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__410__PROF__M8650D__l1159\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1159
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

VL_INLINE_OPT void Vcpld::_combo__TOP__420__PROF__M8650D__l336(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__420__PROF__M8650D__l336\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:336
    if (vlTOPp->cpld__DOT__rx_rate) {
	vlTOPp->cpld__DOT__m8650d__DOT__rx_div = vlTOPp->cpld__DOT__m8650d__DOT__rx_div_m;
    }
}

VL_INLINE_OPT void Vcpld::_combo__TOP__421__PROF__M8650D__l377(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__421__PROF__M8650D__l377\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__422__PROF__M8650D__l397(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__422__PROF__M8650D__l397\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__423__PROF__M8650D__l561(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__423__PROF__M8650D__l561\n"); );
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

VL_INLINE_OPT void Vcpld::_combo__TOP__424__PROF__M8650D__l1169(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__424__PROF__M8650D__l1169\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at M8650D.v:1169
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

VL_INLINE_OPT void Vcpld::_settle__TOP__430__PROF__M8650D__l1231(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__430__PROF__M8650D__l1231\n"); );
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

VL_INLINE_OPT void Vcpld::_settle__TOP__431__PROF__M8650D__l1224(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__431__PROF__M8650D__l1224\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__flgs = (1U & (~ 
						  ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__rflg_l) 
						   & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tflg_l))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__434__PROF__cpld__l109(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__434__PROF__cpld__l109\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->int_rqst_l = (1U & (~ ((IData)(vlTOPp->cpld__DOT__m8650d__DOT__flgs) 
				   & (~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__int_enab_l)))));
}

VL_INLINE_OPT void Vcpld::_combo__TOP__435__PROF__M8650D__l1309(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_combo__TOP__435__PROF__M8650D__l1309\n"); );
    Vcpld* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->cpld__DOT__m8650d__DOT__skip_l__out__en15 
	= (((IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_19x) 
	    & (IData)(vlTOPp->cpld__DOT__m8650d__DOT__flgs)) 
	   | (IData)(vlTOPp->cpld__DOT__m8650d__DOT__tkskp));
}

VL_INLINE_OPT void Vcpld::_settle__TOP__438__PROF__cpld__l107(Vcpld__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_settle__TOP__438__PROF__cpld__l107\n"); );
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
	vlTOPp->_sequent__TOP__35__PROF__M8650D__l410(vlSymsp);
	vlTOPp->_sequent__TOP__36__PROF__M8650D__l408(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__n_t_155x)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__n_t_155x))) {
	vlTOPp->_sequent__TOP__39__PROF__M8650D__l414(vlSymsp);
	vlTOPp->_sequent__TOP__40__PROF__M8650D__l412(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_0)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_0))) {
	vlTOPp->_sequent__TOP__43__PROF__M8650D__l418(vlSymsp);
	vlTOPp->_sequent__TOP__44__PROF__M8650D__l416(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_1)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_1))) {
	vlTOPp->_sequent__TOP__47__PROF__M8650D__l422(vlSymsp);
	vlTOPp->_sequent__TOP__48__PROF__M8650D__l420(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd2400)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd2400))) {
	vlTOPp->_sequent__TOP__51__PROF__M8650D__l660(vlSymsp);
	vlTOPp->_sequent__TOP__52__PROF__M8650D__l658(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd1200)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd1200))) {
	vlTOPp->_sequent__TOP__55__PROF__M8650D__l664(vlSymsp);
	vlTOPp->_sequent__TOP__56__PROF__M8650D__l662(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd600)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd600))) {
	vlTOPp->_sequent__TOP__59__PROF__M8650D__l668(vlSymsp);
	vlTOPp->_sequent__TOP__60__PROF__M8650D__l666(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd300)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd300))) {
	vlTOPp->__Vm_traceActivity = (2U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__63__PROF__M8650D__l672(vlSymsp);
	vlTOPp->_sequent__TOP__64__PROF__M8650D__l670(vlSymsp);
	vlTOPp->_sequent__TOP__65__PROF__M8650D__l672(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__rx_rate)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__rx_rate))) {
	vlTOPp->_sequent__TOP__68__PROF__M8650D__l729(vlSymsp);
	vlTOPp->_sequent__TOP__69__PROF__M8650D__l727(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2))) {
	vlTOPp->_sequent__TOP__72__PROF__M8650D__l733(vlSymsp);
	vlTOPp->_sequent__TOP__73__PROF__M8650D__l731(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__ratex2)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__ratex2))) {
	vlTOPp->__Vm_traceActivity = (4U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__76__PROF__M8650D__l725(vlSymsp);
	vlTOPp->_sequent__TOP__77__PROF__M8650D__l723(vlSymsp);
	vlTOPp->_sequent__TOP__78__PROF__M8650D__l725(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_3)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_3))) {
	vlTOPp->__Vm_traceActivity = (8U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__81__PROF__M8650D__l737(vlSymsp);
	vlTOPp->_sequent__TOP__82__PROF__M8650D__l735(vlSymsp);
	vlTOPp->_sequent__TOP__83__PROF__M8650D__l737(vlSymsp);
    }
    vlTOPp->_settle__TOP__5__PROF__cpld__l182(vlSymsp);
    vlTOPp->__Vm_traceActivity = (0x10U | vlTOPp->__Vm_traceActivity);
    vlTOPp->_settle__TOP__6__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__7__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__8__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__9__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__10__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__11__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__12__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__13__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__14__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__15__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__16__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__17__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__18__PROF__cpld__l461(vlSymsp);
    vlTOPp->_settle__TOP__19__PROF__cpld__l460(vlSymsp);
    vlTOPp->_settle__TOP__20__PROF__cpld__l459(vlSymsp);
    vlTOPp->_settle__TOP__21__PROF__cpld__l458(vlSymsp);
    vlTOPp->_settle__TOP__22__PROF__cpld__l457(vlSymsp);
    vlTOPp->_settle__TOP__23__PROF__cpld__l456(vlSymsp);
    vlTOPp->_settle__TOP__24__PROF__cpld__l455(vlSymsp);
    vlTOPp->_settle__TOP__25__PROF__cpld__l454(vlSymsp);
    vlTOPp->_settle__TOP__26__PROF__M8650D__l490(vlSymsp);
    vlTOPp->_settle__TOP__27__PROF__cpld__l434(vlSymsp);
    vlTOPp->_settle__TOP__28__PROF__cpld__l424(vlSymsp);
    vlTOPp->_settle__TOP__29__PROF__cpld__l405(vlSymsp);
    vlTOPp->_settle__TOP__30__PROF__cpld__l408(vlSymsp);
    vlTOPp->_settle__TOP__31__PROF__cpld__l407(vlSymsp);
    vlTOPp->_settle__TOP__32__PROF__cpld__l428(vlSymsp);
    vlTOPp->_combo__TOP__112__PROF__M8650D__l691(vlSymsp);
    vlTOPp->_combo__TOP__113__PROF__M8650D__l754(vlSymsp);
    vlTOPp->_combo__TOP__114__PROF__M8650D__l500(vlSymsp);
    vlTOPp->_combo__TOP__115__PROF__cpld__l426(vlSymsp);
    vlTOPp->_combo__TOP__116__PROF__cpld__l409(vlSymsp);
    vlTOPp->_combo__TOP__117__PROF__cpld__l413(vlSymsp);
    vlTOPp->_combo__TOP__118__PROF__cpld__l411(vlSymsp);
    vlTOPp->_combo__TOP__119__PROF__cpld__l430(vlSymsp);
    vlTOPp->_combo__TOP__120__PROF__cpld__l432(vlSymsp);
    if (((IData)(vlTOPp->clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk)))) {
	vlTOPp->__Vm_traceActivity = (0x20U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__123__PROF__cpld__l328(vlSymsp);
	vlTOPp->_sequent__TOP__124__PROF__cpld__l326(vlSymsp);
	vlTOPp->_sequent__TOP__125__PROF__cpld__l328(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->cpld__DOT__m8650d__DOT__n_t_154x_m)) 
	 & (IData)(vlTOPp->__Vclklast__TOP__cpld__DOT__m8650d__DOT__n_t_154x_m))) {
	vlTOPp->_sequent__TOP__126__PROF__M8650D__l410(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x40U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__n_t_155x)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__n_t_155x))) {
	vlTOPp->_sequent__TOP__127__PROF__M8650D__l414(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x80U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_0)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_0))) {
	vlTOPp->_sequent__TOP__128__PROF__M8650D__l418(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x100U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_1)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_1))) {
	vlTOPp->_sequent__TOP__129__PROF__M8650D__l422(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x200U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd2400)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd2400))) {
	vlTOPp->_sequent__TOP__130__PROF__M8650D__l660(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x400U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd1200)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd1200))) {
	vlTOPp->_sequent__TOP__131__PROF__M8650D__l664(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x800U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__bd600)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__bd600))) {
	vlTOPp->_sequent__TOP__132__PROF__M8650D__l668(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x1000U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__rx_rate)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__rx_rate))) {
	vlTOPp->_sequent__TOP__133__PROF__M8650D__l729(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x2000U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2))) {
	vlTOPp->_sequent__TOP__134__PROF__M8650D__l733(vlSymsp);
	vlTOPp->__Vm_traceActivity = (0x4000U | vlTOPp->__Vm_traceActivity);
    }
    if ((((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd115200)) 
	  & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd115200)) 
	 | ((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__n_t_2x)) 
	    & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__n_t_2x)))) {
	vlTOPp->__Vm_traceActivity = (0x8000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__154__PROF__cpld__l337(vlSymsp);
	vlTOPp->_sequent__TOP__155__PROF__cpld__l333(vlSymsp);
	vlTOPp->_sequent__TOP__156__PROF__cpld__l337(vlSymsp);
    }
    vlTOPp->_settle__TOP__144__PROF__M8650D__l681(vlSymsp);
    vlTOPp->_settle__TOP__145__PROF__M8650D__l876(vlSymsp);
    vlTOPp->_settle__TOP__146__PROF__M8650D__l765(vlSymsp);
    vlTOPp->_settle__TOP__147__PROF__M8650D__l654(vlSymsp);
    vlTOPp->_settle__TOP__148__PROF__M8650D__l510(vlSymsp);
    vlTOPp->_settle__TOP__149__PROF__M8650D__l653(vlSymsp);
    vlTOPp->_settle__TOP__150__PROF__cpld__l437(vlSymsp);
    vlTOPp->_settle__TOP__151__PROF__cpld__l441(vlSymsp);
    vlTOPp->_combo__TOP__165__PROF__M8650D__l885(vlSymsp);
    vlTOPp->_combo__TOP__166__PROF__M8650D__l775(vlSymsp);
    vlTOPp->_combo__TOP__167__PROF__M8650D__l520(vlSymsp);
    vlTOPp->_combo__TOP__168__PROF__M8650D__l702(vlSymsp);
    vlTOPp->_combo__TOP__169__PROF__M8650D__l346(vlSymsp);
    vlTOPp->_combo__TOP__170__PROF__M8650D__l572(vlSymsp);
    vlTOPp->_combo__TOP__171__PROF__M8650D__l1312(vlSymsp);
    if ((((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__n_t_1x)) 
	  & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__n_t_1x)) 
	 | ((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__n_t_2x)) 
	    & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__n_t_2x)))) {
	vlTOPp->__Vm_traceActivity = (0x10000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__174__PROF__cpld__l343(vlSymsp);
	vlTOPp->_sequent__TOP__175__PROF__cpld__l339(vlSymsp);
	vlTOPp->_sequent__TOP__176__PROF__cpld__l343(vlSymsp);
    }
    vlTOPp->_settle__TOP__184__PROF__cpld__l345(vlSymsp);
    vlTOPp->_settle__TOP__185__PROF__M8650D__l892(vlSymsp);
    vlTOPp->_settle__TOP__186__PROF__M8650D__l1024(vlSymsp);
    vlTOPp->_settle__TOP__187__PROF__M8650D__l712(vlSymsp);
    vlTOPp->_settle__TOP__188__PROF__M8650D__l356(vlSymsp);
    vlTOPp->_settle__TOP__189__PROF__cpld__l111(vlSymsp);
    vlTOPp->_settle__TOP__190__PROF__M8650D__l853(vlSymsp);
    vlTOPp->_combo__TOP__198__PROF__M8650D__l901(vlSymsp);
    vlTOPp->_combo__TOP__199__PROF__M8650D__l1034(vlSymsp);
    vlTOPp->_combo__TOP__200__PROF__M8650D__l648(vlSymsp);
    vlTOPp->_combo__TOP__201__PROF__M8650D__l1238(vlSymsp);
    vlTOPp->_combo__TOP__202__PROF__M8650D__l1240(vlSymsp);
    vlTOPp->_combo__TOP__203__PROF__M8650D__l1242(vlSymsp);
    if (((IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd38400) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd38400)))) {
	vlTOPp->__Vm_traceActivity = (0x20000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__206__PROF__cpld__l350(vlSymsp);
	vlTOPp->_sequent__TOP__207__PROF__cpld__l348(vlSymsp);
	vlTOPp->_sequent__TOP__208__PROF__cpld__l350(vlSymsp);
    }
    if (((IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd19200) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd19200)))) {
	vlTOPp->__Vm_traceActivity = (0x40000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__223__PROF__cpld__l354(vlSymsp);
	vlTOPp->_sequent__TOP__224__PROF__cpld__l352(vlSymsp);
	vlTOPp->_sequent__TOP__225__PROF__cpld__l354(vlSymsp);
    }
    vlTOPp->_settle__TOP__215__PROF__M8650D__l908(vlSymsp);
    vlTOPp->_settle__TOP__216__PROF__cpld__l449(vlSymsp);
    vlTOPp->_settle__TOP__217__PROF__M8650D__l1249(vlSymsp);
    vlTOPp->_settle__TOP__218__PROF__M8650D__l1229(vlSymsp);
    vlTOPp->_settle__TOP__219__PROF__M8650D__l1222(vlSymsp);
    vlTOPp->_settle__TOP__220__PROF__M8650D__l1209(vlSymsp);
    vlTOPp->_combo__TOP__232__PROF__M8650D__l917(vlSymsp);
    vlTOPp->_combo__TOP__233__PROF__M8650D__l425(vlSymsp);
    vlTOPp->_combo__TOP__234__PROF__M8650D__l1226(vlSymsp);
    vlTOPp->_combo__TOP__235__PROF__M8650D__l1225(vlSymsp);
    vlTOPp->_combo__TOP__236__PROF__M8650D__l1211(vlSymsp);
    vlTOPp->_combo__TOP__237__PROF__M8650D__l1212(vlSymsp);
    if (((IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd9600) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd9600)))) {
	vlTOPp->__Vm_traceActivity = (0x80000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__240__PROF__cpld__l358(vlSymsp);
	vlTOPp->_sequent__TOP__241__PROF__cpld__l356(vlSymsp);
	vlTOPp->_sequent__TOP__242__PROF__cpld__l358(vlSymsp);
    }
    if (((IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd4800) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd4800)))) {
	vlTOPp->__Vm_traceActivity = (0x100000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__257__PROF__cpld__l362(vlSymsp);
	vlTOPp->_sequent__TOP__258__PROF__cpld__l360(vlSymsp);
	vlTOPp->_sequent__TOP__259__PROF__cpld__l362(vlSymsp);
    }
    vlTOPp->_settle__TOP__249__PROF__M8650D__l924(vlSymsp);
    vlTOPp->_settle__TOP__250__PROF__M8650D__l434(vlSymsp);
    vlTOPp->_settle__TOP__251__PROF__cpld__l117(vlSymsp);
    vlTOPp->_settle__TOP__252__PROF__M8650D__l1227(vlSymsp);
    vlTOPp->_settle__TOP__253__PROF__cpld__l115(vlSymsp);
    vlTOPp->_settle__TOP__254__PROF__M8650D__l873(vlSymsp);
    vlTOPp->_combo__TOP__266__PROF__M8650D__l933(vlSymsp);
    vlTOPp->_combo__TOP__267__PROF__cpld__l129(vlSymsp);
    vlTOPp->_combo__TOP__268__PROF__M8650D__l441(vlSymsp);
    vlTOPp->_combo__TOP__269__PROF__M8650D__l1245(vlSymsp);
    vlTOPp->_combo__TOP__270__PROF__M8650D__l1274(vlSymsp);
    vlTOPp->_combo__TOP__271__PROF__M8650D__l1045(vlSymsp);
    if (((IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd2400) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd2400)))) {
	vlTOPp->__Vm_traceActivity = (0x200000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__274__PROF__cpld__l366(vlSymsp);
	vlTOPp->_sequent__TOP__275__PROF__cpld__l364(vlSymsp);
	vlTOPp->_sequent__TOP__276__PROF__cpld__l366(vlSymsp);
    }
    if (((~ (IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd1200)) 
	 & (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd1200))) {
	vlTOPp->__Vm_traceActivity = (0x400000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__287__PROF__cpld__l387(vlSymsp);
	vlTOPp->_sequent__TOP__288__PROF__cpld__l388(vlSymsp);
	vlTOPp->_sequent__TOP__289__PROF__cpld__l389(vlSymsp);
	vlTOPp->_sequent__TOP__290__PROF__cpld__l386(vlSymsp);
	vlTOPp->_sequent__TOP__291__PROF__cpld__l383(vlSymsp);
	vlTOPp->_sequent__TOP__292__PROF__cpld__l380(vlSymsp);
	vlTOPp->_sequent__TOP__293__PROF__cpld__l381(vlSymsp);
	vlTOPp->_sequent__TOP__294__PROF__cpld__l382(vlSymsp);
    }
    if (((IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd1200) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd1200)))) {
	vlTOPp->__Vm_traceActivity = (0x800000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__297__PROF__cpld__l370(vlSymsp);
	vlTOPp->_sequent__TOP__298__PROF__cpld__l368(vlSymsp);
	vlTOPp->_sequent__TOP__299__PROF__cpld__l370(vlSymsp);
    }
    vlTOPp->_settle__TOP__283__PROF__M8650D__l450(vlSymsp);
    vlTOPp->_settle__TOP__284__PROF__M8650D__l1284(vlSymsp);
    vlTOPp->_settle__TOP__285__PROF__M8650D__l1055(vlSymsp);
    vlTOPp->_combo__TOP__303__PROF__cpld__l128(vlSymsp);
    vlTOPp->_combo__TOP__304__PROF__M8650D__l457(vlSymsp);
    vlTOPp->_combo__TOP__305__PROF__M8650D__l962(vlSymsp);
    if (((IData)(vlTOPp->__VinpClk__TOP__cpld__DOT__bd600) 
	 & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__bd600)))) {
	vlTOPp->__Vm_traceActivity = (0x1000000U | vlTOPp->__Vm_traceActivity);
	vlTOPp->_sequent__TOP__317__PROF__cpld__l374(vlSymsp);
	vlTOPp->_sequent__TOP__318__PROF__cpld__l372(vlSymsp);
	vlTOPp->_sequent__TOP__319__PROF__cpld__l374(vlSymsp);
    }
    vlTOPp->_settle__TOP__313__PROF__M8650D__l466(vlSymsp);
    vlTOPp->_settle__TOP__314__PROF__M8650D__l968(vlSymsp);
    vlTOPp->_combo__TOP__322__PROF__cpld__l394(vlSymsp);
    vlTOPp->_combo__TOP__323__PROF__cpld__l127(vlSymsp);
    vlTOPp->_combo__TOP__324__PROF__M8650D__l473(vlSymsp);
    vlTOPp->_combo__TOP__325__PROF__M8650D__l975(vlSymsp);
    vlTOPp->_settle__TOP__330__PROF__M8650D__l482(vlSymsp);
    vlTOPp->_settle__TOP__331__PROF__M8650D__l984(vlSymsp);
    vlTOPp->_combo__TOP__334__PROF__cpld__l125(vlSymsp);
    vlTOPp->_combo__TOP__335__PROF__M8650D__l580(vlSymsp);
    vlTOPp->_combo__TOP__336__PROF__M8650D__l991(vlSymsp);
    vlTOPp->_settle__TOP__340__PROF__M8650D__l589(vlSymsp);
    vlTOPp->_settle__TOP__341__PROF__M8650D__l1000(vlSymsp);
    vlTOPp->_combo__TOP__344__PROF__cpld__l89(vlSymsp);
    vlTOPp->_combo__TOP__345__PROF__M8650D__l596(vlSymsp);
    vlTOPp->_combo__TOP__346__PROF__M8650D__l862(vlSymsp);
    vlTOPp->_combo__TOP__347__PROF__M8650D__l1007(vlSymsp);
    vlTOPp->_settle__TOP__352__PROF__M8650D__l605(vlSymsp);
    vlTOPp->_settle__TOP__353__PROF__M8650D__l1016(vlSymsp);
    vlTOPp->_combo__TOP__356__PROF__cpld__l173(vlSymsp);
    vlTOPp->_combo__TOP__357__PROF__M8650D__l612(vlSymsp);
    vlTOPp->_combo__TOP__358__PROF__M8650D__l1075(vlSymsp);
    vlTOPp->_settle__TOP__362__PROF__M8650D__l621(vlSymsp);
    vlTOPp->_settle__TOP__363__PROF__M8650D__l1084(vlSymsp);
    vlTOPp->_combo__TOP__366__PROF__M8650D__l628(vlSymsp);
    vlTOPp->_combo__TOP__367__PROF__cpld__l172(vlSymsp);
    vlTOPp->_combo__TOP__368__PROF__M8650D__l1091(vlSymsp);
    vlTOPp->_settle__TOP__372__PROF__M8650D__l637(vlSymsp);
    vlTOPp->_settle__TOP__373__PROF__M8650D__l1100(vlSymsp);
    vlTOPp->_combo__TOP__376__PROF__M8650D__l1254(vlSymsp);
    vlTOPp->_combo__TOP__377__PROF__cpld__l170(vlSymsp);
    vlTOPp->_combo__TOP__378__PROF__M8650D__l531(vlSymsp);
    vlTOPp->_combo__TOP__379__PROF__M8650D__l1107(vlSymsp);
    vlTOPp->_settle__TOP__384__PROF__M8650D__l1264(vlSymsp);
    vlTOPp->_settle__TOP__385__PROF__M8650D__l1179(vlSymsp);
    vlTOPp->_settle__TOP__386__PROF__M8650D__l541(vlSymsp);
    vlTOPp->_settle__TOP__387__PROF__M8650D__l1116(vlSymsp);
    vlTOPp->_combo__TOP__392__PROF__M8650D__l1189(vlSymsp);
    vlTOPp->_combo__TOP__393__PROF__M8650D__l1201(vlSymsp);
    vlTOPp->_combo__TOP__394__PROF__M8650D__l656(vlSymsp);
    vlTOPp->_combo__TOP__395__PROF__M8650D__l1123(vlSymsp);
    vlTOPp->_combo__TOP__396__PROF__M8650D__l866(vlSymsp);
    vlTOPp->_settle__TOP__402__PROF__M8650D__l1233(vlSymsp);
    vlTOPp->_settle__TOP__403__PROF__M8650D__l740(vlSymsp);
    vlTOPp->_settle__TOP__404__PROF__M8650D__l326(vlSymsp);
    vlTOPp->_settle__TOP__405__PROF__M8650D__l367(vlSymsp);
    vlTOPp->_settle__TOP__406__PROF__M8650D__l387(vlSymsp);
    vlTOPp->_settle__TOP__407__PROF__M8650D__l551(vlSymsp);
    vlTOPp->_settle__TOP__408__PROF__M8650D__l1132(vlSymsp);
    vlTOPp->_settle__TOP__409__PROF__M8650D__l744(vlSymsp);
    vlTOPp->_settle__TOP__410__PROF__M8650D__l1159(vlSymsp);
    vlTOPp->_combo__TOP__420__PROF__M8650D__l336(vlSymsp);
    vlTOPp->_combo__TOP__421__PROF__M8650D__l377(vlSymsp);
    vlTOPp->_combo__TOP__422__PROF__M8650D__l397(vlSymsp);
    vlTOPp->_combo__TOP__423__PROF__M8650D__l561(vlSymsp);
    vlTOPp->_combo__TOP__424__PROF__M8650D__l1169(vlSymsp);
    vlTOPp->_settle__TOP__430__PROF__M8650D__l1231(vlSymsp);
    vlTOPp->_settle__TOP__431__PROF__M8650D__l1224(vlSymsp);
    vlTOPp->_combo__TOP__434__PROF__cpld__l109(vlSymsp);
    vlTOPp->_combo__TOP__435__PROF__M8650D__l1309(vlSymsp);
    vlTOPp->_settle__TOP__438__PROF__cpld__l107(vlSymsp);
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
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__rx_rate 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__rx_rate;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__ratex2 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__ratex2;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_3 
	= vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_3;
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
    vlTOPp->__VinpClk__TOP__cpld__DOT__rx_rate = vlTOPp->cpld__DOT__rx_rate;
    vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2;
    vlTOPp->__VinpClk__TOP__cpld__DOT__ratex2 = vlTOPp->cpld__DOT__ratex2;
    vlTOPp->__VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_3 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3;
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
    vlTOPp->_settle__TOP__1__PROF__cpld__l147(vlSymsp);
    vlTOPp->__Vm_traceActivity = (1U | vlTOPp->__Vm_traceActivity);
    vlTOPp->_settle__TOP__2__PROF__cpld__l148(vlSymsp);
    vlTOPp->_settle__TOP__3__PROF__cpld__l149(vlSymsp);
    vlTOPp->_settle__TOP__4__PROF__cpld__l150(vlSymsp);
    vlTOPp->_settle__TOP__5__PROF__cpld__l182(vlSymsp);
    vlTOPp->_settle__TOP__6__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__7__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__8__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__9__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__10__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__11__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__12__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__13__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__14__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__15__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__16__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__17__PROF__cpld__l453(vlSymsp);
    vlTOPp->_settle__TOP__18__PROF__cpld__l461(vlSymsp);
    vlTOPp->_settle__TOP__19__PROF__cpld__l460(vlSymsp);
    vlTOPp->_settle__TOP__20__PROF__cpld__l459(vlSymsp);
    vlTOPp->_settle__TOP__21__PROF__cpld__l458(vlSymsp);
    vlTOPp->_settle__TOP__22__PROF__cpld__l457(vlSymsp);
    vlTOPp->_settle__TOP__23__PROF__cpld__l456(vlSymsp);
    vlTOPp->_settle__TOP__24__PROF__cpld__l455(vlSymsp);
    vlTOPp->_settle__TOP__25__PROF__cpld__l454(vlSymsp);
    vlTOPp->_settle__TOP__26__PROF__M8650D__l490(vlSymsp);
    vlTOPp->_settle__TOP__27__PROF__cpld__l434(vlSymsp);
    vlTOPp->_settle__TOP__28__PROF__cpld__l424(vlSymsp);
    vlTOPp->_settle__TOP__29__PROF__cpld__l405(vlSymsp);
    vlTOPp->_settle__TOP__30__PROF__cpld__l408(vlSymsp);
    vlTOPp->_settle__TOP__31__PROF__cpld__l407(vlSymsp);
    vlTOPp->_settle__TOP__32__PROF__cpld__l428(vlSymsp);
    vlTOPp->_combo__TOP__112__PROF__M8650D__l691(vlSymsp);
    vlTOPp->_combo__TOP__113__PROF__M8650D__l754(vlSymsp);
    vlTOPp->_combo__TOP__114__PROF__M8650D__l500(vlSymsp);
    vlTOPp->_combo__TOP__115__PROF__cpld__l426(vlSymsp);
    vlTOPp->_combo__TOP__116__PROF__cpld__l409(vlSymsp);
    vlTOPp->_combo__TOP__117__PROF__cpld__l413(vlSymsp);
    vlTOPp->_combo__TOP__118__PROF__cpld__l411(vlSymsp);
    vlTOPp->_combo__TOP__119__PROF__cpld__l430(vlSymsp);
    vlTOPp->_combo__TOP__120__PROF__cpld__l432(vlSymsp);
    vlTOPp->_settle__TOP__144__PROF__M8650D__l681(vlSymsp);
    vlTOPp->_settle__TOP__145__PROF__M8650D__l876(vlSymsp);
    vlTOPp->_settle__TOP__146__PROF__M8650D__l765(vlSymsp);
    vlTOPp->_settle__TOP__147__PROF__M8650D__l654(vlSymsp);
    vlTOPp->_settle__TOP__148__PROF__M8650D__l510(vlSymsp);
    vlTOPp->_settle__TOP__149__PROF__M8650D__l653(vlSymsp);
    vlTOPp->_settle__TOP__150__PROF__cpld__l437(vlSymsp);
    vlTOPp->_settle__TOP__151__PROF__cpld__l441(vlSymsp);
    vlTOPp->_combo__TOP__165__PROF__M8650D__l885(vlSymsp);
    vlTOPp->_combo__TOP__166__PROF__M8650D__l775(vlSymsp);
    vlTOPp->_combo__TOP__167__PROF__M8650D__l520(vlSymsp);
    vlTOPp->_combo__TOP__168__PROF__M8650D__l702(vlSymsp);
    vlTOPp->_combo__TOP__169__PROF__M8650D__l346(vlSymsp);
    vlTOPp->_combo__TOP__170__PROF__M8650D__l572(vlSymsp);
    vlTOPp->_combo__TOP__171__PROF__M8650D__l1312(vlSymsp);
    vlTOPp->_settle__TOP__184__PROF__cpld__l345(vlSymsp);
    vlTOPp->_settle__TOP__185__PROF__M8650D__l892(vlSymsp);
    vlTOPp->_settle__TOP__186__PROF__M8650D__l1024(vlSymsp);
    vlTOPp->_settle__TOP__187__PROF__M8650D__l712(vlSymsp);
    vlTOPp->_settle__TOP__188__PROF__M8650D__l356(vlSymsp);
    vlTOPp->_settle__TOP__189__PROF__cpld__l111(vlSymsp);
    vlTOPp->_settle__TOP__190__PROF__M8650D__l853(vlSymsp);
    vlTOPp->_combo__TOP__198__PROF__M8650D__l901(vlSymsp);
    vlTOPp->_combo__TOP__199__PROF__M8650D__l1034(vlSymsp);
    vlTOPp->_combo__TOP__200__PROF__M8650D__l648(vlSymsp);
    vlTOPp->_combo__TOP__201__PROF__M8650D__l1238(vlSymsp);
    vlTOPp->_combo__TOP__202__PROF__M8650D__l1240(vlSymsp);
    vlTOPp->_combo__TOP__203__PROF__M8650D__l1242(vlSymsp);
    vlTOPp->_settle__TOP__215__PROF__M8650D__l908(vlSymsp);
    vlTOPp->_settle__TOP__216__PROF__cpld__l449(vlSymsp);
    vlTOPp->_settle__TOP__217__PROF__M8650D__l1249(vlSymsp);
    vlTOPp->_settle__TOP__218__PROF__M8650D__l1229(vlSymsp);
    vlTOPp->_settle__TOP__219__PROF__M8650D__l1222(vlSymsp);
    vlTOPp->_settle__TOP__220__PROF__M8650D__l1209(vlSymsp);
    vlTOPp->_combo__TOP__232__PROF__M8650D__l917(vlSymsp);
    vlTOPp->_combo__TOP__233__PROF__M8650D__l425(vlSymsp);
    vlTOPp->_combo__TOP__234__PROF__M8650D__l1226(vlSymsp);
    vlTOPp->_combo__TOP__235__PROF__M8650D__l1225(vlSymsp);
    vlTOPp->_combo__TOP__236__PROF__M8650D__l1211(vlSymsp);
    vlTOPp->_combo__TOP__237__PROF__M8650D__l1212(vlSymsp);
    vlTOPp->_settle__TOP__249__PROF__M8650D__l924(vlSymsp);
    vlTOPp->_settle__TOP__250__PROF__M8650D__l434(vlSymsp);
    vlTOPp->_settle__TOP__251__PROF__cpld__l117(vlSymsp);
    vlTOPp->_settle__TOP__252__PROF__M8650D__l1227(vlSymsp);
    vlTOPp->_settle__TOP__253__PROF__cpld__l115(vlSymsp);
    vlTOPp->_settle__TOP__254__PROF__M8650D__l873(vlSymsp);
    vlTOPp->_combo__TOP__266__PROF__M8650D__l933(vlSymsp);
    vlTOPp->_combo__TOP__267__PROF__cpld__l129(vlSymsp);
    vlTOPp->_combo__TOP__268__PROF__M8650D__l441(vlSymsp);
    vlTOPp->_combo__TOP__269__PROF__M8650D__l1245(vlSymsp);
    vlTOPp->_combo__TOP__270__PROF__M8650D__l1274(vlSymsp);
    vlTOPp->_combo__TOP__271__PROF__M8650D__l1045(vlSymsp);
    vlTOPp->_settle__TOP__283__PROF__M8650D__l450(vlSymsp);
    vlTOPp->_settle__TOP__284__PROF__M8650D__l1284(vlSymsp);
    vlTOPp->_settle__TOP__285__PROF__M8650D__l1055(vlSymsp);
    vlTOPp->_sequent__TOP__291__PROF__cpld__l383(vlSymsp);
    vlTOPp->_sequent__TOP__292__PROF__cpld__l380(vlSymsp);
    vlTOPp->_sequent__TOP__293__PROF__cpld__l381(vlSymsp);
    vlTOPp->_sequent__TOP__294__PROF__cpld__l382(vlSymsp);
    vlTOPp->_combo__TOP__303__PROF__cpld__l128(vlSymsp);
    vlTOPp->_combo__TOP__304__PROF__M8650D__l457(vlSymsp);
    vlTOPp->_combo__TOP__305__PROF__M8650D__l962(vlSymsp);
    vlTOPp->_settle__TOP__313__PROF__M8650D__l466(vlSymsp);
    vlTOPp->_settle__TOP__314__PROF__M8650D__l968(vlSymsp);
    vlTOPp->_combo__TOP__322__PROF__cpld__l394(vlSymsp);
    vlTOPp->_combo__TOP__323__PROF__cpld__l127(vlSymsp);
    vlTOPp->_combo__TOP__324__PROF__M8650D__l473(vlSymsp);
    vlTOPp->_combo__TOP__325__PROF__M8650D__l975(vlSymsp);
    vlTOPp->_settle__TOP__330__PROF__M8650D__l482(vlSymsp);
    vlTOPp->_settle__TOP__331__PROF__M8650D__l984(vlSymsp);
    vlTOPp->_combo__TOP__334__PROF__cpld__l125(vlSymsp);
    vlTOPp->_combo__TOP__335__PROF__M8650D__l580(vlSymsp);
    vlTOPp->_combo__TOP__336__PROF__M8650D__l991(vlSymsp);
    vlTOPp->_settle__TOP__340__PROF__M8650D__l589(vlSymsp);
    vlTOPp->_settle__TOP__341__PROF__M8650D__l1000(vlSymsp);
    vlTOPp->_combo__TOP__344__PROF__cpld__l89(vlSymsp);
    vlTOPp->_combo__TOP__345__PROF__M8650D__l596(vlSymsp);
    vlTOPp->_combo__TOP__346__PROF__M8650D__l862(vlSymsp);
    vlTOPp->_combo__TOP__347__PROF__M8650D__l1007(vlSymsp);
    vlTOPp->_settle__TOP__352__PROF__M8650D__l605(vlSymsp);
    vlTOPp->_settle__TOP__353__PROF__M8650D__l1016(vlSymsp);
    vlTOPp->_combo__TOP__356__PROF__cpld__l173(vlSymsp);
    vlTOPp->_combo__TOP__357__PROF__M8650D__l612(vlSymsp);
    vlTOPp->_combo__TOP__358__PROF__M8650D__l1075(vlSymsp);
    vlTOPp->_settle__TOP__362__PROF__M8650D__l621(vlSymsp);
    vlTOPp->_settle__TOP__363__PROF__M8650D__l1084(vlSymsp);
    vlTOPp->_combo__TOP__366__PROF__M8650D__l628(vlSymsp);
    vlTOPp->_combo__TOP__367__PROF__cpld__l172(vlSymsp);
    vlTOPp->_combo__TOP__368__PROF__M8650D__l1091(vlSymsp);
    vlTOPp->_settle__TOP__372__PROF__M8650D__l637(vlSymsp);
    vlTOPp->_settle__TOP__373__PROF__M8650D__l1100(vlSymsp);
    vlTOPp->_combo__TOP__376__PROF__M8650D__l1254(vlSymsp);
    vlTOPp->_combo__TOP__377__PROF__cpld__l170(vlSymsp);
    vlTOPp->_combo__TOP__378__PROF__M8650D__l531(vlSymsp);
    vlTOPp->_combo__TOP__379__PROF__M8650D__l1107(vlSymsp);
    vlTOPp->_settle__TOP__384__PROF__M8650D__l1264(vlSymsp);
    vlTOPp->_settle__TOP__385__PROF__M8650D__l1179(vlSymsp);
    vlTOPp->_settle__TOP__386__PROF__M8650D__l541(vlSymsp);
    vlTOPp->_settle__TOP__387__PROF__M8650D__l1116(vlSymsp);
    vlTOPp->_combo__TOP__392__PROF__M8650D__l1189(vlSymsp);
    vlTOPp->_combo__TOP__393__PROF__M8650D__l1201(vlSymsp);
    vlTOPp->_combo__TOP__394__PROF__M8650D__l656(vlSymsp);
    vlTOPp->_combo__TOP__395__PROF__M8650D__l1123(vlSymsp);
    vlTOPp->_combo__TOP__396__PROF__M8650D__l866(vlSymsp);
    vlTOPp->_settle__TOP__402__PROF__M8650D__l1233(vlSymsp);
    vlTOPp->_settle__TOP__403__PROF__M8650D__l740(vlSymsp);
    vlTOPp->_settle__TOP__404__PROF__M8650D__l326(vlSymsp);
    vlTOPp->_settle__TOP__405__PROF__M8650D__l367(vlSymsp);
    vlTOPp->_settle__TOP__406__PROF__M8650D__l387(vlSymsp);
    vlTOPp->_settle__TOP__407__PROF__M8650D__l551(vlSymsp);
    vlTOPp->_settle__TOP__408__PROF__M8650D__l1132(vlSymsp);
    vlTOPp->_settle__TOP__409__PROF__M8650D__l744(vlSymsp);
    vlTOPp->_settle__TOP__410__PROF__M8650D__l1159(vlSymsp);
    vlTOPp->_combo__TOP__420__PROF__M8650D__l336(vlSymsp);
    vlTOPp->_combo__TOP__421__PROF__M8650D__l377(vlSymsp);
    vlTOPp->_combo__TOP__422__PROF__M8650D__l397(vlSymsp);
    vlTOPp->_combo__TOP__423__PROF__M8650D__l561(vlSymsp);
    vlTOPp->_combo__TOP__424__PROF__M8650D__l1169(vlSymsp);
    vlTOPp->_settle__TOP__430__PROF__M8650D__l1231(vlSymsp);
    vlTOPp->_settle__TOP__431__PROF__M8650D__l1224(vlSymsp);
    vlTOPp->_combo__TOP__434__PROF__cpld__l109(vlSymsp);
    vlTOPp->_combo__TOP__435__PROF__M8650D__l1309(vlSymsp);
    vlTOPp->_settle__TOP__438__PROF__cpld__l107(vlSymsp);
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
	|| (vlTOPp->cpld__DOT__rx_rate ^ vlTOPp->__Vchglast__TOP__cpld__DOT__rx_rate)
	 | (vlTOPp->cpld__DOT__ratex2 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__ratex2)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__bd1200 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd1200)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__bd2400 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd2400)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__bd300 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd300)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__bd600 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd600)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l_m ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_active_l_m)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__tx_div_m ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_div_m)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__rx_div ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__rx_div)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_43x)
	|| (vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_75x)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__n_t_155x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_155x)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__gdollar_0 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_0)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__gdollar_1 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_1)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_88x)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_2)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_3)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__tx_data ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_data)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__n_t_70x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_70x)
	 | (vlTOPp->cpld__DOT__m8650d__DOT__n_t_71x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_71x));
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__bd115200 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd115200))) VL_PRINTF("	CHANGE: cpld.v:203: cpld.bd115200\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__bd38400 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd38400))) VL_PRINTF("	CHANGE: cpld.v:204: cpld.bd38400\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__bd19200 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd19200))) VL_PRINTF("	CHANGE: cpld.v:205: cpld.bd19200\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__bd9600 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd9600))) VL_PRINTF("	CHANGE: cpld.v:206: cpld.bd9600\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__bd4800 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd4800))) VL_PRINTF("	CHANGE: cpld.v:207: cpld.bd4800\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__bd2400 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd2400))) VL_PRINTF("	CHANGE: cpld.v:208: cpld.bd2400\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__bd1200 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd1200))) VL_PRINTF("	CHANGE: cpld.v:209: cpld.bd1200\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__bd600 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__bd600))) VL_PRINTF("	CHANGE: cpld.v:210: cpld.bd600\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__n_t_1x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__n_t_1x))) VL_PRINTF("	CHANGE: cpld.v:213: cpld.n_t_1x\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__n_t_2x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__n_t_2x))) VL_PRINTF("	CHANGE: cpld.v:214: cpld.n_t_2x\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__rx_rate ^ vlTOPp->__Vchglast__TOP__cpld__DOT__rx_rate))) VL_PRINTF("	CHANGE: cpld.v:230: cpld.rx_rate\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__ratex2 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__ratex2))) VL_PRINTF("	CHANGE: cpld.v:231: cpld.ratex2\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__bd1200 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd1200))) VL_PRINTF("	CHANGE: M8650D.v:97: cpld.m8650d.bd1200\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__bd2400 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd2400))) VL_PRINTF("	CHANGE: M8650D.v:100: cpld.m8650d.bd2400\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__bd300 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd300))) VL_PRINTF("	CHANGE: M8650D.v:101: cpld.m8650d.bd300\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__bd600 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd600))) VL_PRINTF("	CHANGE: M8650D.v:102: cpld.m8650d.bd600\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l_m ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_active_l_m))) VL_PRINTF("	CHANGE: M8650D.v:210: cpld.m8650d.tx_active_l_m\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__tx_div_m ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_div_m))) VL_PRINTF("	CHANGE: M8650D.v:212: cpld.m8650d.tx_div_m\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__rx_div ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__rx_div))) VL_PRINTF("	CHANGE: M8650D.v:214: cpld.m8650d.rx_div\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__n_t_43x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_43x))) VL_PRINTF("	CHANGE: M8650D.v:216: cpld.m8650d.n_t_43x\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__n_t_75x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_75x))) VL_PRINTF("	CHANGE: M8650D.v:217: cpld.m8650d.n_t_75x\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__n_t_155x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_155x))) VL_PRINTF("	CHANGE: M8650D.v:218: cpld.m8650d.n_t_155x\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__gdollar_0 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_0))) VL_PRINTF("	CHANGE: M8650D.v:219: cpld.m8650d.gdollar_0\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__gdollar_1 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_1))) VL_PRINTF("	CHANGE: M8650D.v:220: cpld.m8650d.gdollar_1\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__n_t_88x ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_88x))) VL_PRINTF("	CHANGE: M8650D.v:226: cpld.m8650d.n_t_88x\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_2))) VL_PRINTF("	CHANGE: M8650D.v:233: cpld.m8650d.gdollar_2\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3 ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_3))) VL_PRINTF("	CHANGE: M8650D.v:234: cpld.m8650d.gdollar_3\n"); );
    VL_DEBUG_IF( if(__req && ((vlTOPp->cpld__DOT__m8650d__DOT__tx_data ^ vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_data))) VL_PRINTF("	CHANGE: M8650D.v:251: cpld.m8650d.tx_data\n"); );
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
    vlTOPp->__Vchglast__TOP__cpld__DOT__rx_rate = vlTOPp->cpld__DOT__rx_rate;
    vlTOPp->__Vchglast__TOP__cpld__DOT__ratex2 = vlTOPp->cpld__DOT__ratex2;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd1200 
	= vlTOPp->cpld__DOT__m8650d__DOT__bd1200;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd2400 
	= vlTOPp->cpld__DOT__m8650d__DOT__bd2400;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd300 
	= vlTOPp->cpld__DOT__m8650d__DOT__bd300;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__bd600 
	= vlTOPp->cpld__DOT__m8650d__DOT__bd600;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_active_l_m 
	= vlTOPp->cpld__DOT__m8650d__DOT__tx_active_l_m;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_div_m 
	= vlTOPp->cpld__DOT__m8650d__DOT__tx_div_m;
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
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_2 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_2;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_3 
	= vlTOPp->cpld__DOT__m8650d__DOT__gdollar_3;
    vlTOPp->__Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_data 
	= vlTOPp->cpld__DOT__m8650d__DOT__tx_data;
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
    drive_ac = VL_RAND_RESET_I(1);
    { int __Vi0=0; for (; __Vi0<12; ++__Vi0) {
	    ac[__Vi0] = VL_RAND_RESET_I(1);
    }}
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
    cpld__DOT__rx_rate = VL_RAND_RESET_I(1);
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
    { int __Vi0=0; for (; __Vi0<12; ++__Vi0) {
	    cpld__DOT__ac[__Vi0] = VL_RAND_RESET_I(1);
    }}
    cpld__DOT__data08_l__out__out46 = VL_RAND_RESET_I(1);
    cpld__DOT__data07_l__out__out59 = VL_RAND_RESET_I(1);
    cpld__DOT__data06_l__out__out62 = VL_RAND_RESET_I(1);
    cpld__DOT__data05_l__out__out65 = VL_RAND_RESET_I(1);
    cpld__DOT__data04_l__out__out68 = VL_RAND_RESET_I(1);
    cpld__DOT__data11_l__out__out73 = VL_RAND_RESET_I(1);
    cpld__DOT__data10_l__out__out76 = VL_RAND_RESET_I(1);
    cpld__DOT__data09_l__out__out79 = VL_RAND_RESET_I(1);
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
    __Vdly__cpld__DOT__rx_rate = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__m8650d__DOT__gdollar_2 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__m8650d__DOT__gdollar_3 = VL_RAND_RESET_I(1);
    __Vdly__cpld__DOT__h12 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__n_t_155x = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_0 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_1 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__bd2400 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__bd1200 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__bd600 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__bd300 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__rx_rate = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__ratex2 = VL_RAND_RESET_I(1);
    __VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_3 = VL_RAND_RESET_I(1);
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
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__rx_rate = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_2 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__ratex2 = VL_RAND_RESET_I(1);
    __Vclklast__TOP____VinpClk__TOP__cpld__DOT__m8650d__DOT__gdollar_3 = VL_RAND_RESET_I(1);
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
    __Vchglast__TOP__cpld__DOT__rx_rate = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__ratex2 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__bd1200 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__bd2400 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__bd300 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__bd600 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_active_l_m = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_div_m = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__rx_div = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_43x = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_75x = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_155x = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_0 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_1 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_88x = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_2 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__gdollar_3 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__tx_data = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_70x = VL_RAND_RESET_I(1);
    __Vchglast__TOP__cpld__DOT__m8650d__DOT__n_t_71x = VL_RAND_RESET_I(1);
    __Vm_traceActivity = VL_RAND_RESET_I(32);
}

void Vcpld::_configure_coverage(Vcpld__Syms* __restrict vlSymsp, bool first) {
    VL_DEBUG_IF(VL_PRINTF("    Vcpld::_configure_coverage\n"); );
}
