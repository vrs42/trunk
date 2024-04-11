// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _Vpt08_H_
#define _Vpt08_H_

#include "verilated.h"
class Vpt08__Syms;
class VerilatedVcd;

//----------

VL_MODULE(Vpt08) {
  public:
    // CELLS
    // Public to allow access to /*verilator_public*/ items;
    // otherwise the application code can consider these internals.
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clk,0,0);
    VL_OUT8(rx_rate,0,0);
    VL_IN8(initialize,0,0);
    VL_OUT8(dsrttl,0,0);
    VL_OUT8(txdttl,0,0);
    VL_OUT8(rxdttl,0,0);
    VL_IN8(bmb0,0,0);
    VL_IN8(bmb1,0,0);
    VL_IN8(bmb2,0,0);
    VL_IN8(bmb3,0,0);
    VL_IN8(bmb4,0,0);
    VL_IN8(bmb5,0,0);
    VL_IN8(bmb6,0,0);
    VL_IN8(bmb7,0,0);
    VL_IN8(bmb8,0,0);
    VL_IN8(bmb9,0,0);
    VL_IN8(bmb10,0,0);
    VL_IN8(bmb11,0,0);
    VL_IN8(bmb3_l,0,0);
    VL_IN8(bmb4_l,0,0);
    VL_IN8(bmb5_l,0,0);
    VL_IN8(bmb6_l,0,0);
    VL_IN8(bmb7_l,0,0);
    VL_IN8(bmb8_l,0,0);
    VL_IN8(bac0,0,0);
    VL_IN8(bac1,0,0);
    VL_IN8(bac2,0,0);
    VL_IN8(bac3,0,0);
    VL_IN8(bac4,0,0);
    VL_IN8(bac5,0,0);
    VL_IN8(bac6,0,0);
    VL_IN8(bac7,0,0);
    VL_IN8(bac8,0,0);
    VL_IN8(bac9,0,0);
    VL_IN8(bac10,0,0);
    VL_IN8(bac11,0,0);
    VL_IN8(biop1,0,0);
    VL_IN8(biop2,0,0);
    VL_IN8(biop4,0,0);
    VL_IN8(bts1,0,0);
    VL_IN8(bts3,0,0);
    VL_OUT8(iob0_l,0,0);
    VL_OUT8(iob1_l,0,0);
    VL_OUT8(iob2_l,0,0);
    VL_OUT8(iob3_l,0,0);
    VL_OUT8(iob4_l,0,0);
    VL_OUT8(iob5_l,0,0);
    VL_OUT8(iob6_l,0,0);
    VL_OUT8(iob7_l,0,0);
    VL_OUT8(iob8_l,0,0);
    VL_OUT8(iob9_l,0,0);
    VL_OUT8(iob10_l,0,0);
    VL_OUT8(iob11_l,0,0);
    VL_OUT8(skip_l,0,0);
    VL_OUT8(irq_l,0,0);
    VL_OUT8(acclr_l,0,0);
    VL_IN8(run,0,0);
    //char	__VpadToAlign57[3];
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    VL_SIG8(pt08__DOT__tx_rateo,0,0);
    VL_SIG8(pt08__DOT__bd115200,0,0);
    VL_SIG8(pt08__DOT__bd38400,0,0);
    VL_SIG8(pt08__DOT__bd19200,0,0);
    VL_SIG8(pt08__DOT__bd9600,0,0);
    VL_SIG8(pt08__DOT__bd4800,0,0);
    VL_SIG8(pt08__DOT__bd2400,0,0);
    VL_SIG8(pt08__DOT__bd1200,0,0);
    VL_SIG8(pt08__DOT__bd600,0,0);
    VL_SIG8(pt08__DOT__n_t_1x,0,0);
    VL_SIG8(pt08__DOT__n_t_2x,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__keyboard_flag,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__start_enable,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__active_clear_,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__clock_scale_in,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__in_stop_,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__tti_shift,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__preset_,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__active_clock,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__tx_ratem,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT__tto_shift,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT__start_bit,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT__tcf,0,0);
    VL_SIG8(pt08__DOT__rx_sel,0,0);
    VL_SIG8(pt08__DOT__tx_sel,0,0);
    VL_SIG8(pt08__DOT__bd300,0,0);
    VL_SIG8(pt08__DOT__div11a,0,0);
    VL_SIG8(pt08__DOT__div11b,0,0);
    VL_SIG8(pt08__DOT__div11c,0,0);
    VL_SIG8(pt08__DOT__div11d,0,0);
    VL_SIG8(pt08__DOT__ndiv11a,0,0);
    VL_SIG8(pt08__DOT__ndiv11b,0,0);
    VL_SIG8(pt08__DOT__ndiv11c,0,0);
    VL_SIG8(pt08__DOT__ndiv11d,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__buffer_strobe,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__tti_skip_,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__tti02,2,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__tti37,7,3);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__tt_,7,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__reader_run,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__clock_scale,2,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__in_stop,2,1);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__spike_detector,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__in_active,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__in_last_unit,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__m706__DOT__tti3_set,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__skip_,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__tx_rate,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT__line,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT__teleprinter_flag,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT__out_stop,2,0);
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT__out_active,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT__tto0_,0,0);
    //char	__VpadToAlign117[1];
    VL_SIG16(pt08__DOT__e11__DOT__m707__DOT__tto,11,3);
    VL_SIG16(pt08__DOT__e11__DOT__m707__DOT__tto_set,11,3);
    //char	__VpadToAlign122[2];
    VL_SIG(pt08__DOT__mb,31,0);
    VL_SIG(pt08__DOT__ac,31,0);
    VL_SIG(pt08__DOT__ib,31,0);
    VL_SIG8(pt08__DOT__e2__DOT__tt_[8],0,0);
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2,0,0);
    VL_SIG8(pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__iob4_l__out__en4,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__iob5_l__out__en5,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__iob6_l__out__en6,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__iob7_l__out__en7,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__iob8_l__out__en8,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__iob9_l__out__en9,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__iob10_l__out__en10,0,0);
    VL_SIG8(pt08__DOT__e2__DOT__iob11_l__out__en11,0,0);
    VL_SIG8(__Vdly__pt08__DOT__bd115200,0,0);
    VL_SIG8(__Vdly__pt08__DOT__n_t_1x,0,0);
    VL_SIG8(__Vdly__pt08__DOT__bd38400,0,0);
    VL_SIG8(__Vdly__pt08__DOT__bd19200,0,0);
    VL_SIG8(__Vdly__pt08__DOT__bd9600,0,0);
    VL_SIG8(__Vdly__pt08__DOT__bd4800,0,0);
    VL_SIG8(__Vdly__pt08__DOT__bd2400,0,0);
    VL_SIG8(__Vdly__pt08__DOT__bd1200,0,0);
    VL_SIG8(__Vdly__pt08__DOT__bd600,0,0);
    VL_SIG8(__Vdly__pt08__DOT__bd300,0,0);
    VL_SIG8(__Vdly__pt08__DOT__e2__DOT__m706__DOT__clock_scale,2,0);
    VL_SIG8(__Vdly__pt08__DOT__e2__DOT__m706__DOT__in_stop,2,1);
    VL_SIG8(__Vdly__pt08__DOT__e2__DOT__m706__DOT__tti02,2,0);
    VL_SIG8(__Vdly__pt08__DOT__e2__DOT__m706__DOT__tti37,7,3);
    VL_SIG8(__Vdly__pt08__DOT__e11__DOT__tx_ratem,0,0);
    VL_SIG8(__Vdly__pt08__DOT__tx_rateo,0,0);
    VL_SIG8(__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto_shift,0,0);
    VL_SIG8(__Vdly__pt08__DOT__e11__DOT__m707__DOT__out_stop,2,0);
    VL_SIG8(__Vdly__pt08__DOT__e11__DOT__m707__DOT__out_active,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tcf,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__start_bit,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__keyboard_flag,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__bd115200,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__n_t_2x,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__start_enable,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__n_t_1x,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__e11__DOT__tx_ratem,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__bd38400,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__tx_rateo,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__bd19200,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__in_stop_,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__bd9600,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__bd4800,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clear_,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__bd2400,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__bd1200,0,0);
    VL_SIG8(__VinpClk__TOP__pt08__DOT__bd600,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tcf,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__m707__DOT__start_bit,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__keyboard_flag,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_,0,0);
    VL_SIG8(__Vclklast__TOP__clk,0,0);
    VL_SIG8(__Vclklast__TOP__initialize,0,0);
    VL_SIG8(__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT____Vsenitemexpr1,0,0);
    VL_SIG8(__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__4__KET____DOT____Vsenitemexpr2,0,0);
    VL_SIG8(__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__5__KET____DOT____Vsenitemexpr2,0,0);
    VL_SIG8(__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__6__KET____DOT____Vsenitemexpr2,0,0);
    VL_SIG8(__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__7__KET____DOT____Vsenitemexpr2,0,0);
    VL_SIG8(__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__8__KET____DOT____Vsenitemexpr2,0,0);
    VL_SIG8(__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__9__KET____DOT____Vsenitemexpr2,0,0);
    VL_SIG8(__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__10__KET____DOT____Vsenitemexpr2,0,0);
    VL_SIG8(__Vclklast__TOP__pt08__DOT__e11__DOT__m707__DOT__ttobit__BRA__11__KET____DOT____Vsenitemexpr2,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd115200,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__n_t_2x,0,0);
    VL_SIG8(__Vclklast__TOP__rx_rate,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__start_enable,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__n_t_1x,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e11__DOT__tx_ratem,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd38400,0,0);
    VL_SIG8(__Vclklast__TOP__pt08__DOT__e2__DOT__m706__DOT__clock_scale_in,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__tx_rateo,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd19200,0,0);
    VL_SIG8(__Vclklast__TOP__pt08__DOT__e2__DOT__m706__DOT__tti_shift,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__in_stop_,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd9600,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd4800,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clear_,0,0);
    VL_SIG8(__Vclklast__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clock,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd2400,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd1200,0,0);
    VL_SIG8(__Vclklast__TOP____VinpClk__TOP__pt08__DOT__bd600,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__tx_rateo,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__bd115200,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__bd38400,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__bd19200,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__bd9600,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__bd4800,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__bd2400,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__bd1200,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__bd600,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__n_t_1x,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__n_t_2x,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__keyboard_flag,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__in_active,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__start_enable,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__active_clear_,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__in_stop_,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__e2__DOT__m706__DOT__preset_,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__e11__DOT__tx_ratem,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_shift,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__start_bit,0,0);
    VL_SIG8(__Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__tcf,0,0);
    VL_SIG16(__Vdly__pt08__DOT__e11__DOT__m707__DOT__tto,11,3);
    VL_SIG16(__Vchglast__TOP__pt08__DOT__e11__DOT__m707__DOT__tto_set,11,3);
    VL_SIG(__Vm_traceActivity,31,0);
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Vpt08__Syms*	__VlSymsp;		// Symbol table
    
    // PARAMETERS
    // Parameters marked /*verilator public*/ for use by application code
    
    // CONSTRUCTORS
  private:
    Vpt08& operator= (const Vpt08&);	///< Copying not allowed
    Vpt08(const Vpt08&);	///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible WRT DPI scope names.
    Vpt08(const char* name="TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Vpt08();
    /// Trace signals in the model; called by application code
    void trace (VerilatedVcdC* tfp, int levels, int options=0);
    
    // USER METHODS
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Vpt08__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Vpt08__Syms* symsp, bool first);
  private:
    static QData	_change_request(Vpt08__Syms* __restrict vlSymsp);
  public:
    static void	_combo__TOP__109__PROF__m707__l96(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__110__PROF__pt08__l188(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__194__PROF__e2__l72(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__195__PROF__e2__l71(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__196__PROF__e2__l70(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__197__PROF__e2__l68(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__198__PROF__e2__l67(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__199__PROF__e2__l64(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__200__PROF__e2__l62(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__201__PROF__e2__l61(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__237__PROF__m706__l147(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__238__PROF__m706__l130(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__239__PROF__pt08__l37(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__240__PROF__pt08__l37(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__241__PROF__pt08__l38(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__242__PROF__pt08__l38(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__243__PROF__pt08__l38(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__244__PROF__pt08__l38(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__245__PROF__pt08__l38(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__246__PROF__pt08__l38(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__41__PROF__pt08__l39(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__42__PROF__m707__l128(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__43__PROF__pt08__l39(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__44__PROF__m706__l174(Vpt08__Syms* __restrict vlSymsp);
    static void	_combo__TOP__45__PROF__m706__l109(Vpt08__Syms* __restrict vlSymsp);
  private:
    void	_configure_coverage(Vpt08__Syms* __restrict vlSymsp, bool first);
    void	_ctor_var_reset();
  public:
    static void	_eval(Vpt08__Syms* __restrict vlSymsp);
    static void	_eval_initial(Vpt08__Syms* __restrict vlSymsp);
    static void	_eval_settle(Vpt08__Syms* __restrict vlSymsp);
    static void	_multiclk__TOP__173__PROF__m707__l87(Vpt08__Syms* __restrict vlSymsp);
    static void	_multiclk__TOP__184__PROF__pt08__l272(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__100__PROF__m706__l132(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__101__PROF__m706__l134(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__102__PROF__m706__l68(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__105__PROF__pt08__l186(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__106__PROF__pt08__l182(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__107__PROF__pt08__l186(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__108__PROF__m707__l99(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__117__PROF__e11__l100(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__118__PROF__e11__l98(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__119__PROF__e11__l100(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__122__PROF__pt08__l193(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__123__PROF__pt08__l191(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__124__PROF__pt08__l193(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__127__PROF__m706__l143(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__128__PROF__m706__l139(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__129__PROF__m706__l143(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__133__PROF__m707__l75(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__134__PROF__m707__l74(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__137__PROF__m707__l82(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__138__PROF__m707__l78(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__139__PROF__m707__l82(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__142__PROF__m707__l90(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__143__PROF__m707__l88(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__144__PROF__m707__l90(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__147__PROF__pt08__l197(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__148__PROF__pt08__l195(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__149__PROF__pt08__l197(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__153__PROF__m706__l158(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__158__PROF__m706__l188(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__165__PROF__m706__l181(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__166__PROF__m706__l180(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__167__PROF__m706__l176(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__169__PROF__m706__l181(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__170__PROF__m706__l180(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__171__PROF__m706__l49(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__172__PROF__m707__l75(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__187__PROF__pt08__l201(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__188__PROF__pt08__l199(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__189__PROF__pt08__l201(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__21__PROF__m707__l130(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__221__PROF__pt08__l205(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__222__PROF__pt08__l203(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__223__PROF__pt08__l205(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__227__PROF__m706__l149(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__249__PROF__pt08__l209(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__250__PROF__pt08__l207(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__251__PROF__pt08__l209(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__265__PROF__pt08__l213(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__266__PROF__pt08__l211(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__267__PROF__pt08__l213(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__269__PROF__pt08__l230(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__26__PROF__m707__l120(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__270__PROF__pt08__l231(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__271__PROF__pt08__l232(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__272__PROF__pt08__l229(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__273__PROF__pt08__l226(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__274__PROF__pt08__l223(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__275__PROF__pt08__l224(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__276__PROF__pt08__l225(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__280__PROF__pt08__l217(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__281__PROF__pt08__l215(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__282__PROF__pt08__l217(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__49__PROF__m706__l167(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__51__PROF__e2__l108(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__54__PROF__pt08__l169(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__55__PROF__pt08__l167(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__56__PROF__pt08__l169(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__75__PROF__m707__l99(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__80__PROF__pt08__l180(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__81__PROF__pt08__l176(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__82__PROF__pt08__l180(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__83__PROF__m707__l97(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__84__PROF__m707__l110(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__85__PROF__m707__l110(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__86__PROF__m707__l110(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__87__PROF__m707__l110(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__88__PROF__m707__l110(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__89__PROF__m707__l110(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__90__PROF__m707__l110(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__91__PROF__m707__l110(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__94__PROF__e11__l96(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__95__PROF__e11__l94(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__96__PROF__e11__l96(Vpt08__Syms* __restrict vlSymsp);
    static void	_sequent__TOP__99__PROF__m706__l134(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__10__PROF__m707__l110(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__114__PROF__m706__l126(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__11__PROF__m707__l110(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__12__PROF__m707__l110(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__13__PROF__m707__l110(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__14__PROF__pt08__l47(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__15__PROF__pt08__l49(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__16__PROF__pt08__l267(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__175__PROF__m707__l85(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__176__PROF__pt08__l31(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__177__PROF__m706__l71(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__178__PROF__m706__l129(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__179__PROF__m706__l148(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__17__PROF__pt08__l266(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__181__PROF__m706__l186(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__1__PROF__pt08__l37(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__211__PROF__e2__l99(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__212__PROF__e2__l100(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__213__PROF__e2__l101(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__214__PROF__e2__l102(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__215__PROF__e2__l103(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__216__PROF__e2__l104(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__217__PROF__e2__l105(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__218__PROF__e2__l106(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__262__PROF__pt08__l51(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__2__PROF__pt08__l37(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__3__PROF__pt08__l37(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__4__PROF__pt08__l37(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__5__PROF__m707__l97(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__63__PROF__pt08__l237(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__64__PROF__pt08__l39(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__6__PROF__m707__l110(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__7__PROF__m707__l110(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__8__PROF__m707__l110(Vpt08__Syms* __restrict vlSymsp);
    static void	_settle__TOP__9__PROF__m707__l110(Vpt08__Syms* __restrict vlSymsp);
    static void	traceChgThis(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__10(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__11(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__12(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__13(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__14(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__15(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__16(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__17(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__18(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__19(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__2(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__20(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__21(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__22(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__23(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__24(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__25(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__26(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__27(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__28(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__29(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__3(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__30(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__31(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__32(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__33(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__34(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__4(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__5(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__6(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__7(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__8(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceChgThis__9(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceFullThis(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceFullThis__1(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceInitThis(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void	traceInitThis__1(Vpt08__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceInit (VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceFull (VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceChg  (VerilatedVcd* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(128);

#endif  /*guard*/
