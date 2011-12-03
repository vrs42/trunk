//
// Notes on the translation of schematics to Verilog:
//   In general X_ has been converted to ~X.  The exceptions are 
//      where X_ and ~X are not equivalent, and in the ALU (M220),
//      where the polarity of the signals is crucial to how the 
//      original used the adders and AND-OR-INVERT gates.
//   Where B_x and X are equivalent and B_x is just a buffered 
//      version, X has been substituted for readability.  The 
//      Verilog compiler will, in general, decide on the correct
//      number of buffers and polarity of signals for an efficient
//      implementation.
//
module pdp8i(A40h2, A40j2, A40k2, A40d2, A40e2, A40f2,
             A40l2, A40m2, A40r2, A40s2, A40t2, A40u2, A40v2,
             B40d2, B40e2, B40f2, B40h2, B40j2,
             B40l2, B40k2, B40m2, B40r2, B40s2, B40t2, B40u2, B40v2,
             C40b1,
             C40s2, C40m2, C40n2, C40l2, C40f1,
             D40f1, D40m1, D40m2, D40t2, D40p1, D40r2, D40s1, D40l2,
             D40h2, D40d2, D40n1, D40b1, D40r1, D40a1, D40e1, D40e2,
             E40r1, E40p1, E40f2, E40d2, E40k1, E40a1, E40v2, E40t2, E40j1, E40h2, E40m1, E40b1,
             E40j2, E40s1, E40p2, E40n1, E40c1, E40d1, E40u2, E40r2, E40k2, E40e2, E40l1, E40e1,
             E40s2, E40m2, E40n2, E40l2, E40f1, E40h1,
             F40r1, F40p1, F40f2, F40d2, F40k1, F40a1, F40v2, F40t2, F40j1, F40h2, F40m1, F40b1,
             F40j2, F40s1, F40p2, F40n1, F40c1, F40d1, F40u2, F40r2, F40k2, F40e2, F40l1, F40e1,
             F40s2, F40m2, F40n2, F40l2, F40f1, F40h1,
             H05p2, H05s2, H05v2,
             J01d2, J01e2, J01h2, J01k2, J01m2, J01p2, J01s2, J01t2, J01v2,
             J02d2, J02e2, J02h2, J02k2, J02m2, J02p2, J02s2, J02t2, J02v2,
             J03d2, J03e2, J03h2, J03k2, J03m2, J03p2, J03s2, J03t2, J03v2,
             J04d2, J04e2, J04h2, J04k2, J04m2, J04p2, J04s2, J04t2, J04v2,
             J05d2, J05e2, J05h2, J05k2, J05m2, J05p2, J05s2, J05t2, J05v2,
             J06d2, J06e2, J06h2, J06k2, J06m2, J06p2, J06s2, J06t2, J06v2,
             J07d2, J07e2, J07h2, J07k2, J07m2, J07p2, J07s2, J07t2, J07v2,
             J08d2, J08e2, J08h2, J08k2, J08m2, J08p2, J08s2, J08t2, J08v2,
             J09d2, J09e2, J09h2, J09k2, J09m2, J09p2, J09s2, J09t2, J09v2,
             J10d2, J10e2, J10h2, J10k2, J10m2, J10p2, J10s2, J10t2, J10v2,
             Dclk);

input Dclk;

input wand A40h2, A40j2, A40k2, A40d2, A40e2, A40f2;
wire [0:2] Ifsr = { A40h2, A40j2, A40k2 };
wire [0:2] Dfsr = { A40d2, A40e2, A40f2 };

input wand A40l2, A40m2, A40r2, A40s2, A40t2, A40u2, A40v2;
wire [0:11] Sr;
assign Sr[0:6] = { A40l2, A40m2, A40r2, A40s2, A40t2, A40u2, A40v2 };
input wand B40d2, B40e2, B40f2, B40h2, B40j2;
assign Sr[7:11] = { B40d2, B40e2, B40f2, B40h2, B40j2 };

input wand B40l2, B40k2, B40m2, B40r2, B40s2, B40t2, B40u2, B40v2;
assign Key_la_ = B40l2;
assign Key_st_ = B40k2;
assign Key_dp_ = B40m2;
assign Key_ex_ = B40r2;
assign Key_cont_ = B40s2;
assign Key_stop_ = B40t2;
assign Key_ss_ = B40u2;
assign Key_si_ = B40v2;

input wand H05p2, H05s2;
wand Strobe_ = H05p2;
wand Mem_done_ = H05s2;

wire Power_clear = 0;   // BUGBUG: Should be an input!!

output C40b1;   // Link
output C40s2, C40m2, C40n2, C40l2, C40f1;           // Sc[0:4]

output D40f1, D40m1, D40n1, D40b1, D40r1, D40a1, D40e1, D40e2;

output E40v2, E40t2, E40j1, E40h2, E40m1, E40b1;
output F40v2, F40t2, F40j1, F40h2, F40m1, F40b1;

output E40r1, E40p1, E40f2, E40d2, E40k1, E40a1;
output F40r1, F40p1, F40f2, F40d2, F40k1, F40a1;

output E40j2, E40s1, E40p2, E40n1, E40c1, E40d1;
output F40j2, F40s1, F40p2, F40n1, F40c1, F40d1;

output E40u2, E40r2, E40k2, E40e2, E40l1, E40e1;
output F40u2, F40r2, F40k2, F40e2, F40l1, F40e1;

output E40s2, E40m2, E40n2, E40l2, E40f1, E40h1;    // Mq[0:5]
output F40s2, F40m2, F40n2, F40l2, F40f1, F40h1;    // Mq[6:11]

output J01d2, J01e2, J01h2, J01k2, J01m2, J01p2, J01s2, J01t2, J01v2;
output J02d2, J02e2, J02h2, J02k2, J02m2, J02p2, J02s2, J02t2, J02v2;
output J03d2, J03e2, J03h2, J03k2, J03m2, J03p2, J03s2, J03t2, J03v2;
output J04d2, J04e2, J04h2, J04k2, J04m2, J04p2, J04s2, J04t2, J04v2;
input  J05d2, J05e2, J05h2, J05k2, J05m2, J05p2, J05s2, J05t2, J05v2;
input  J06d2, J06e2, J06h2, J06k2, J06m2, J06p2,               J06v2;
output                                           J06s2, J06t2;

input  J07d2, J07e2, J07h2, J07k2, J07m2, J07p2, J07s2, J07t2, J07v2;
input  J08d2, J08e2, J08h2, J08k2, J08m2,               J08t2;
output                                    J08p2, J08s2,        J08v2;
input  J09d2, J09e2, J09h2, J09k2, J09m2, J09p2, J09s2, J09t2, J09v2;
input  J10d2, J10e2, J10h2, J10k2, J10m2,        J10s2, J10t2, J10v2;
output                                    J10p2;

output wire H05v2;

wire Tp1, Tp2, Tp3, Tp4;
reg Ts1, Ts2, Ts3, Ts4;
reg Iop1, Iop2, Iop4;
wire Mftp0, Mftp1, Mftp2;
reg Mfts1, Mfts2;
wire Mfts0_, Mfts3;
wire Restart_ = 1;  // For Power Fail/Restart option
wire Key_exdp_;
wire Initialize, Initialize_;
wire Io_start, Io_end;
reg Io_on;
reg Run;
reg Pause;
reg Mem_idle;
wire Eae_on, Eae_start, Eae_end, Eae_execute;
wire Eae_set, Eae_e_set, Eae_tp;
wire Ac_to_mq_enable;
wire Eae_ac_enable;
wire Eae_acbar_enable;
wire Eae_l_disable;
wire Eae_left_shift_enable;
wire Eae_mem_enable;
wire Eae_mq0_enable;
wire Eae_mq0bar_enable;
wire Eae_no_shift_enable;
wire Eae_right_shift_enable;
wire [0:11] Mq;
wire Mq_enable;
wire Sc_enable;
wire Eae_ir2;
wire [0:4] Sc;
wire Int_strobe, Int_strobe_, Int_rqst;
reg Int_sync;
wire Slow_cycle, Slow_cycle_;
reg Fetch, Defer, Execute, Current_address, Word_count, Break;
wire F_set, D_set, E_set;
wire Mem_ext, Mem_ext_io_enable_, Mem_ext_ac_load_enable_;
wire Tt_int;
wire Tt_skip;
`ifndef tt680
// No 680 hardware, so just tie off the enables
wire Tt_ac_load = 0;
wire Tt_ac_clr = 0;
wire Tt_cycle = 0;
wire Tt_inst = 0;
wire Tt_carry_insert = 0;
wire Tt_carry_insert_s = 0;
wire Tt_line_shift = 0;
wire Tt_l_disable = 0;
wire Tt_increment = 0;
wire Tt_io_enable = 0;
wire Tt_shift_enable = 0;
wire Tt_right_shift_enable = 0;
wire [0:7] Tt = 8'b0;
wire Tt_data = 0;
wire Tt_set = 0;
`endif
wire C_no_shift = 0;    // BUGBUG: Who drives this?
wire Ca_increment, Memory_increment;
reg Skip;
wire Skip_or;
wire Processor_iot;
wire Uf;
wire S = 0;     // Set to 1 for slower memory access.
wire Int_ok;
wire Break_ok, Break_ok_;
wire Special_cycle_;
wire Cycles3;
wire Manual_preset_;
wire Data_in;
wire Store_ = 1;    // BUGBUG: Who asserts this??
wire Clk_ac_clr = 0;    // From KW8I option
wor Io_bus_in_int = 0;
wor Io_bus_in_skip = 0;
wor [0:11] Io_bus_in = 12'b0;
wire Io_skip;
wire Asr_enable, Asr_l_set;
wire [0:11] Data;
wire [0:11] Input_bus;
wire [0:11] Data_add;
wire [0:2] Ext_data_add;

wire Ma_enable5_11;
wire Mem_enable5_8;
wire Mem_inh9_11 = 0;   // BUGBUG: Who asserts this?

wand [5:11] Me_;

wire Pc_increment;
wire Ac_clear;
wire Ac_enable, Acbar_enable, L_enable, Lbar_enable;

wire And_enable;

reg Int_enable;
reg Int_delay;

wor Int_inhibit = 0;

wire Brk_rqst;
reg Brk_sync;
reg Wc_overflow, Add_accepted;
wire Add_accepted_clear;

wor [0:11] Operand1;
wor [0:11] Operand1_;
wor [0:11] Operand2;
wor [0:11] Operand2_;
wire Carry_insert, Carry_out0;

reg [0:2] Ir;
wire And, Tad, Isz, Dca, Jms, Jmp, Iot, Opr;
wire Op1, Op2, Add;

wire [0:11] Mem;

reg [0:11] Ac;
reg Link;
reg [0:11] Mb;
reg [0:11] Pc;
reg [0:11] Ma;

wire Mem_p_;
wire Mb_parity_odd;
wire Mp_int_;
wire Mp_skip_;
wire U_int_;


// Page D-BD-8I-0-15 "Memory Control"
// This is just the stuff from the power controller, as the core memory
// stuff was moved into the MM8I unit.

wire Power_ok_ = 0;
DelayLine #(2000) pwrclr(Dclk, 1'b1, Power_clear_);
assign Power_clear = ~Power_clear_;
`ifdef kp8i
wor Shutdown = 0;
`else
wire Pwr_skip = 0;
wire Pwr_low = 0;
`endif
wire Stop_ok = 1;


// Page D-BS-8I-0-2 "Timing, Manual Functions, and Run"
// This stuff is from sheet 1.

assign Btp2 = Tp2;
assign H05v2 = Btp2;

assign D40f1 = ~Run;
assign D40m1 = ~Pause;

assign Key_la = ~Key_la_;
assign Key_dp = ~Key_dp_;
assign Key_st = ~Key_st_ & Restart_;
assign Key_exdp_ = Key_dp_ & Key_ex_;
assign Key_exdp = ~Key_exdp_;
assign Key_ss = ~Key_ss_;
assign Key_sistop = ~Key_si_ | ~Key_stop_;
assign Key_stexdp = ~Restart_ | ~Key_st_ | ~Key_exdp_;
assign Key_laexdp = ~Key_la_ | ~Key_exdp_;
assign Key_cont = ~Key_cont_;
assign Manual_preset_ = ~Key_cont_ | ~Mftp0;

assign F19j2 = ~Key_la_ | ~Key_st_ | ~Key_exdp_ | ~Key_cont_;
assign Mfts0_ = (F19j2 & Restart_) | Run; //BUGBUG: M700 filter and pulse shaping?
assign Mftp0 = Mfts0_;

assign Mfts1_reset_ = ~Mfts2 & ~Power_clear;
always @(negedge Mfts0_, negedge Mfts1_reset_)
begin
    if (~Mfts0_)
        Mfts1 = 1;
    if (~Mfts1_reset_)
        Mfts1 = 0;
end

DelayLine #(200) mftp1(Dclk, Mftp0, Mftp1);

assign Mfts2_reset_ = ~Mftp2 & Power_clear;
always @(posedge Mftp1, negedge Mfts2_reset_)
begin
    if (Mftp1)
        Mfts2 = 1;
    if (~Mfts2_reset_)
        Mfts2 = 0;
end

DelayLine #(200) mftp2(Dclk, Mftp1, Mftp2);

assign Mfts3 = Mfts0_ & ~Mfts1 & ~Mfts2;

always @(posedge Io_start, posedge Io_end, negedge Manual_preset_)
begin
    if (Io_start)
        Io_on = 1;
    if (~Manual_preset_)
        Io_on = 0;
    else
        Io_on = 0;
end

assign E12c1 = ~Io_start & ~Eae_start;
assign E12f2 = ~Eae_end | Io_end;
DelayLine #(300) pauseclk(Dclk, E12f2, Pause_clock);
always @(posedge Pause_clock, negedge Strobe_, negedge E12c1)
begin
    if (~Strobe_)
        Pause = 0;
    else if (~E12c1)
        Pause = 1;
    else
        Pause = 0;
end

always @(negedge Strobe_, negedge Mem_done_)
begin
    if (~Strobe_)
        Mem_idle = 0;
    else
        Mem_idle = 1;
end

assign E14d1 = Mem_idle & ~Pause;
assign Mem_start = (Mftp2 & Key_la_) | E14d1;
assign Tp4 = (Mftp2 & Key_cont) | E14d1;

always @(negedge Strobe_, negedge Manual_preset_, posedge Tp4)
begin
    if (Tp4)
        Ts1 = 1;
    else if (~Strobe_)
        Ts1 = 0;
    else
        Ts1 = 1;
end

always @(negedge Strobe_, negedge Manual_preset_, posedge Tp2)
begin
    if (Tp2)
        Ts2 = 0;
    else if (~Strobe_)
        Ts2 = 1;
    else
        Ts2 = 0;
end

always @(posedge Tp2, negedge Manual_preset_, posedge Tp3)
begin
    if (~Manual_preset_)
        Ts3 = 0;
    else if (Tp2)
        Ts3 = 1;
    else
        Ts3 = 0;
end

always @(negedge Int_strobe_, negedge Manual_preset_, posedge Tp4)
begin
    if (~Manual_preset_)
        Ts4 = 0;
    else if (~Int_strobe_)
        Ts4 = 1;
    else
        Ts4 = 0;
end

assign Tp1 = ~Strobe_;

DelayLine #(150) tp2(Dclk, E09f1, Tp2);
DelayLine #(400) tp3(Dclk, E09f1, Tp3);

assign Int_strobe = (Tp3 & ~Eae_set & Slow_cycle_) | ~Eae_end | Io_end;
assign Int_strobe_ = ~Int_strobe;

assign Io_start = Tp3 & Slow_cycle;

DelayLine #(150) iop1_set(Dclk, Io_start, Iop1_set);
DelayLine #(600) iop1_clr(Dclk, Iop1_set, Iop1_clr); // .4-.15+.35 = .75-.15
DelayLine #(200) iop2_set(Dclk, Iop1_clr, Iop2_set);
DelayLine #(600) iop2_clr(Dclk, Iop2_set, Iop2_clr);
DelayLine #(200) iop4_set(Dclk, Iop2_clr, Iop4_set);
DelayLine #(600) iop4_clr(Dclk, Iop4_set, Iop4_clr);
DelayLine #( 50) ioend(Dclk, Iop4_clr, Io_end);

always @(negedge Initialize_, posedge Iop1_set, posedge Iop1_clr)
begin
    if (~Initialize_)
        Iop1 = 0;
    else if (Iop1_set)
        Iop1 = 1;
    else
        Iop1 = 0;
end

always @(negedge Initialize_, posedge Iop2_set, posedge Iop2_clr)
begin
    if (~Initialize_)
        Iop2 = 0;
    else if (Iop2_set)
        Iop2 = 1;
    else
        Iop2 = 0;
end

always @(negedge Initialize_, posedge Iop4_set, posedge Iop4_clr)
begin
    if (~Initialize_)
        Iop4 = 0;
    else if (Iop4_set)
        Iop4 = 1;
    else
        Iop4 = 0;
end

assign F20u1 = Iop1_set | Iop2_set | Iop4_set;
DelayLine #(400) iostrobe(Dclk, F20u1, Io_strobe);

assign Initialize = Mftp0 & Key_st | ~Power_clear;
assign Initialize_ = ~Initialize;

assign Slow_cycle = Fetch & Iot & Mem_ext & Tt_inst & Processor_iot;
assign Slow_cycle_ = ~Slow_cycle;

// E13r1 are essentially reasons to stop.
assign E13r1_ = Key_ss | (Key_sistop & F_set) | (Mb[10] & ~Mb[11] & Op2 & ~Uf)
              | (Key_exdp & ~Mfts0_) | (Stop_ok & ~Power_ok_);

always @(posedge Power_clear, posedge Tp3)
begin
    if (Tp3)
        Run = ~E13r1_;
    if (Power_clear)
        Run = 0;
end


// Page D-BS-8I-0-2 "Timing, Manual Functions, and Run"
// This stuff is from sheet 2.

// S is set for slow memory; adds 300ns to the cycle.
assign E09c1_ = Tp1 & ~S;
assign Mem_to_lsr  = Tp1 & S;

DelayLine #(300) lhtohs(Dclk, Mem_to_lsr, Lh_to_hs);

assign E09f1 = E09c1_ | Lh_to_hs;


// Page D-BS-8I-0-3 "Instruction Register and Major States"

assign E24k2 = Int_ok & Tp4;
assign Ir_clk = Fetch & Tp2;
assign Eae_ir_clr_ = ~Ir_clk;

always @(posedge E24k2, posedge Ir_clk)
begin
    if (E24k2)
        Ir = 3'b100; // Force JMS 0
    else
        Ir = Mem[0:2];
end

assign And   = (Ir == 3'b000);
assign Tad   = (Ir == 3'b001);
assign Isz   = (Ir == 3'b010);
assign Dca   = (Ir == 3'b011);
assign Jms   = (Ir == 3'b100);
assign Jmp   = (Ir == 3'b101);
assign I_iot = (Ir == 3'b110);
assign Opr   = (Ir == 3'b111);
assign Iot = I_iot & ~Uf;

assign And_ = ~And;
assign Tad_ = ~Tad;
assign Isz_ = ~Isz;
assign Dca_ = ~Dca;
assign Jms_ = ~Jms;
assign Jmp_ = ~Jmp;
assign Iot_ = ~Iot;
assign Opr_ = ~Opr;

output D40m2;
output D40t2;
output D40p1;
output D40r2;
output D40s1;
output D40l2;
output D40h2;
output D40d2;

assign D40m2 = And_;
assign D40t2 = Tad_;
assign D40p1 = Isz_;
assign D40r2 = Dca_;
assign D40s1 = Jms_;
assign D40l2 = Jmp_;
assign D40h2 = Iot_;
assign D40d2 = Opr_;

assign Iot_opr_ = (Ir[0:1] != 2'b11);

assign F_set = ~D_set & ~E_set & Break_ok_ & Special_cycle_;
assign D_set = Fetch & Iot_opr_;
assign E_set = Int_ok
             | (Jmp_ & Defer) // Follow defer (except Jmp)
             | (Iot_opr_ & Fetch & Jmp_ & ~Mb[3]) // Mem op direct, follow fetch
             | Eae_e_set;
assign Wc_set = Cycles3 & Break_ok;

always @(posedge Tp1, negedge Manual_preset_)
begin
    if (~Manual_preset_)
        Brk_sync = 0;
    else
        Brk_sync = Brk_rqst;
end

assign Special_cycle_ = ~Tt_set & ~Current_address & ~Word_count;
assign Break_ok = ~E_set & Brk_sync & Special_cycle_ & ~D_set;
assign Break_ok_ = ~Break_ok;

assign B_set = (Break_ok & ~Wc_set) | Current_address;

assign F22f2_ = Key_st & Mftp2;
always @(negedge Manual_preset_, posedge F22f2_, posedge Tp4)
begin
    if (~Manual_preset_)
        Fetch = 0;
    else if (F22f2_)
        Fetch = 1;
    else
        Fetch = F_set;
end

always @(negedge Manual_preset_, posedge Tp4)
begin
    if (~Manual_preset_) begin
        Defer = 0;
        Execute = 0;
        Word_count = 0;
        Current_address = 0;
        Break = 0;
    end else begin
        Defer = D_set;
        Execute = E_set;
        Word_count = Wc_set;
        Current_address = Word_count;
        Break = B_set;
    end
end

assign D40n1 = ~Fetch;
assign D40b1 = ~Defer;
assign D40r1 = ~Execute;
assign D40a1 = ~Word_count;
assign D40e1 = ~Current_address;
assign D40e2 = ~Break;

// Page D-BS-8I-0-4 "Register Output Gate Control"

assign E14h2 = Restart_ & Mfts1 & Key_stexdp;
assign Int_skip_enable = Ts2 & Execute & Jms;
assign Pc_enable_ = Ts4 & (F_set | Eae_e_set | Tt_set);
assign Pc_enable = ~Pc_enable_ | E14h2 | Int_skip_enable | Tt_carry_insert;

assign Io_enable = Io_on | Mem_ext_io_enable_ | ~Tt_io_enable;
assign Data_enable = Ts2 & Break & Data_in;
assign Data_add_enable = Ts4 & Break_ok;

assign Osr = Op2 & Mb[9] & ~Mb[11];
assign Osr_uf0 = Osr & ~Uf;
assign Key_la_mfts0 = Key_la & ~Mfts0_;
assign Sr_enable = (Key_dp & Mfts3)
                 | Osr_uf0
                 | Key_la_mfts0;
assign Lbar_enable = (Op1 & Mb[7]) | Eae_acbar_enable; // CML
assign L_enable_ = (Mfts2 & Key_st)
                 | (Op1 & ~Mb[5] & Mb[7]) // CML
                 | (Op1 & Mb[5] & ~Mb[7]) // CLL
                 | Tt_l_disable
                 | Eae_l_disable;
assign L_enable = ~L_enable_;
assign Acbar_enable = (Op1 & Mb[6]) | Eae_acbar_enable; // CMA

assign E29t2_ = (Dca & Execute) // Store operations
              | (Jms & Execute)
              | (Data_in & Break)
              | (Key_dp & Mfts3);
assign E29r1_ = (~E29t2_ & Ts2)
              | (Jmp & Defer & Ts3)
              | (Jmp_ & Defer & Ts4)
              | (Current_address & Ts4);
assign Mem_enable0_4 = Add | E29r1_ | ~Store_ | Eae_mem_enable;

assign Mem_enable9_11 = Mem_enable5_8 & ~Mem_inh9_11;

assign Mem_enable5_8 = (Jmp & Fetch & ~Mb[3] & Ts3)
                     | ((D_set | E_set) & Ts4 & ~Int_ok & Pc_enable_)
                     | Mem_enable0_4
                     | Eae_mem_enable;

assign Ma_enable5_11 = (Pc_increment & Ts1)
                     | (Key_exdp & Mfts2)
                     | (Jms & Execute & Ts3)
                     | (Word_count & Ts4);
assign Ma_enable0_4 = (~Mem_enable0_4 & Mem_enable5_8 & Mb[4]) // Current page
                    | Ma_enable5_11;

assign Op2 = Opr & Fetch & Mb[3] & Ts3;
assign E30t2_ = (Ac_clear & Io_enable)
              | (Op2 & ~Mb[4] & ~Ac_to_mq_enable)
              | (Op1 & (Mb[4] == Mb[6]))
              | (Dca & Execute & Ts2);
assign Add = Tad & Execute & Ts3;
assign Ac_enable = And_enable | E30t2_ | Add | ~Eae_ac_enable;


// Page D-BS-8I-0-5 "Shift and Carry Gate Control"

assign Op1 = Opr & ~Mb[3] & Fetch & Ts3;

assign Double_right_rotate = Op1 & Mb[8] & Mb[10];
assign Double_left_rotate = Op1 & Mb[9] & Mb[10];
assign Right_shift = (Op1 & Mb[8] & ~Mb[10])
                   | Tt_right_shift_enable
                   | Eae_right_shift_enable;
assign Left_shift = (Op1 & Mb[9] & ~Mb[10])
                   | Eae_left_shift_enable;
assign No_shift = (Op1 & ~Mb[8] & ~Mb[9])
                | (~Op1 & ~Tt_shift_enable & Eae_no_shift_enable)
                | Tt_carry_insert
                | C_no_shift;
assign And_enable = And & Execute & Ts1;

assign Auto_index = (Defer & (Ma[0:8] == 9'b000000001) | Tt_increment)
                  & Mem_enable0_4;

assign Pc_increment = ~Fetch | Eae_execute | Tt_cycle;
assign Carry_insert = (Pc_increment & Ts1)
                    | (Op1 & Mb[11]) // IAC
                    | (Jms & Execute & Ts3)
                    | ((Int_skip_enable | Pc_enable) & Skip_or) 
                    | (Isz & Execute & Ts2)
                    | (Key_exdp & Mfts2)
                    | Word_count
                    | (Ca_increment & Current_address)
                    | (Break & Memory_increment & Ts2)
                    | Auto_index
                    | Tt_carry_insert;


// Page D-BS-8I-0-6 "Register Input Control and Skip"

assign Ma_load = (Key_stexdp & Mftp1)
               | Tp4;
assign Mb_load = Tp2;
assign Ac_load = ((And | Tad | Dca) & Execute & Tp3)
               | (Key_st & Mftp2)
               | (Iot & Io_strobe)
               | (Opr & Fetch & Tp3)
               | Eae_tp
               | Tt_ac_load
               | ~Mem_ext_ac_load_enable_;
assign Pc_load = (Jmp & Defer & Tp3)
               | (Pc_increment & Tp1)
               | (Tt_carry_insert & Tp3)
               | (Key_laexdp & Mftp2)
               | (Jmp & ~Mb[3] & Fetch & Tp3)
               | (Jms & Execute & Tp3);

assign Low_ac0 = (Ac[8:11] == 4'b0000);
assign Mid_ac0 = (Ac[4:7] == 4'b0000);
assign F23e1_ = (Ac == 12'b000000000000) & Mb[6]; // SZA
assign E24n1_ = Ac[0] & Mb[5]; // SMA
assign E24v2_ = Link & Mb[7];  // SNL
assign E25s2_ = Op2 & (F23e1_ | E24n1_ | E24v2_) & ~Mb[11]; // Op2 skip
assign Skip_set = (Isz & Carry_out0 & Execute & Ts2)
                | (Io_skip & Io_enable)
                | (E25s2_ & ~Mb[8])
                | (~E25s2_ & Mb[8] & Op2 & ~Mb[11]);
assign Tp2e = Execute & Tp2;
assign Skip_clock = Tp2e | (Io_strobe & ~Skip) | (Opr & Fetch & Tp3);
assign Tp1f = Fetch & Tp1;

always @(posedge Tp1f, posedge Skip_clock)
begin
    if (Tp1f)
        Skip = 0;
    else
        Skip = Skip_set;
end


// Page D-BS-8I-0-7 "Interrupt and Break Control"

assign Add_accepted_clear = Strobe_ & Manual_preset_;
always @(posedge Add_accepted_clear, posedge Tp4)
begin
    if (Tp4)
        Add_accepted = Break_ok;
    if (Add_accepted_clear)
        Add_accepted = 0;
end

assign Wc_ovf_set = ((Break & Memory_increment) | Word_count) & Carry_out0;
always @(negedge Mem_done_, posedge Tp2)
begin
    if (~Mem_done_)
        Wc_overflow = 0;
    else
        Wc_overflow = Wc_ovf_set;
end

always @(negedge Manual_preset_, posedge Int_strobe)
begin
    if (~Manual_preset_)
        Int_sync = 0;
    else
        Int_sync = Int_rqst & F_set;
end

assign Int_delay_clock = Int_strobe & Fetch;
always @(negedge Int_enable, posedge Int_delay_clock)
begin
    if (~Int_enable)
        Int_delay = 0;
    else
        Int_delay = Int_enable;
end

assign Int_ok = Int_sync & ~Int_inhibit & Int_delay;
assign Load_sf = Int_strobe_ & Ts4 & Int_ok;
assign Int_enable_clr = (Int_ok & Tp1) | (Key_st & Mftp2);
assign F21s1 = Iot & Fetch * ~Mb[3] & ~Mb[4]; // 60xx, 61xx
assign F21s2 = (Mb[5:8] == 4'b0000); // x[0246]0x
assign Processor_iot = F21s1 & F21s2; // 600x
assign Ion_iof = Processor_iot & Int_strobe & (Mb[10] | Mb[11]);
assign Clear_ifdfbf = Processor_iot & Mb[10]; // 6002

always @(posedge Int_enable_clr, posedge Ion_iof)
begin
    if (Int_enable_clr)
        Int_enable = 0;
    else
        Int_enable = Mb[11];
end


// Page D-BS-8I-0-8 "Major Registers"

wire [0:11] Adder;
wire [0:11] Reg_bus;

assign F33t2_ = (Tt_data & ~Tt_inst & Tt_shift_enable)
              | (Link & L_enable)
              | (~Link & Lbar_enable)
              | (Ac[0] & Eae_on & Asr_enable & ~Eae_ir2);
assign Adder_l_ = (~F33t2_ == Carry_out0);
assign Link_set = ((Adder[11] | Eae_on | Tt_inst) & Asr_l_set & Right_shift)
                | (Adder[10] & Double_right_rotate)
                | (Adder_l_ & No_shift)
                | (Adder[0] & Left_shift)
                | (Adder[1] & Double_left_rotate);

always @(posedge Ac_load)
begin
    Link = Link_set;
    Ac = Reg_bus;
end

always @(posedge Mb_load)
begin
    Mb = Reg_bus;
end

always @(posedge Pc_load)
begin
    Pc = Reg_bus;
end

always @(posedge Ma_load)
begin
    Ma = Reg_bus;
end

assign C40b1 = ~Link;

assign E40v2 = ~Ac[0];
assign E40t2 = ~Ac[1];
assign E40j1 = ~Ac[2];
assign E40h2 = ~Ac[3];
assign E40m1 = ~Ac[4];
assign E40b1 = ~Ac[5];
assign F40v2 = ~Ac[6];
assign F40t2 = ~Ac[7];
assign F40j1 = ~Ac[8];
assign F40h2 = ~Ac[9];
assign F40m1 = ~Ac[10];
assign F40b1 = ~Ac[11];

assign E40r1 = ~Mb[0];
assign E40p1 = ~Mb[1];
assign E40f2 = ~Mb[2];
assign E40d2 = ~Mb[3];
assign E40k1 = ~Mb[4];
assign E40a1 = ~Mb[5];
assign F40r1 = ~Mb[6];
assign F40p1 = ~Mb[7];
assign F40f2 = ~Mb[8];
assign F40d2 = ~Mb[9];
assign F40k1 = ~Mb[10];
assign F40a1 = ~Mb[11];

assign E40j2 = ~Pc[0];
assign E40s1 = ~Pc[1];
assign E40p2 = ~Pc[2];
assign E40n1 = ~Pc[3];
assign E40c1 = ~Pc[4];
assign E40d1 = ~Pc[5];
assign F40j2 = ~Pc[6];
assign F40s1 = ~Pc[7];
assign F40p2 = ~Pc[8];
assign F40n1 = ~Pc[9];
assign F40c1 = ~Pc[10];
assign F40d1 = ~Pc[11];

assign E40u2 = ~Ma[0];
assign E40r2 = ~Ma[1];
assign E40k2 = ~Ma[2];
assign E40e2 = ~Ma[3];
assign E40l1 = ~Ma[4];
assign E40e1 = ~Ma[5];
assign F40u2 = ~Ma[6];
assign F40r2 = ~Ma[7];
assign F40k2 = ~Ma[8];
assign F40e2 = ~Ma[9];
assign F40l1 = ~Ma[10];
assign F40e1 = ~Ma[11];


// Page D-BS-8I-0-9 "Major Registers Gating"

//
// There is some trickiness here.  Reg_bus_ is wor, and there can be multiple
// drivers.  This is how the model dependant "RAL RAR" behavior works, for
// example.  Also, the AND instruction uses this (with DeMorgan's law).
//
// Also, note that everything in the 8/i implementation is done "active low", 
// then inverted at the end.
//
wor [0:11] Reg_bus_;
assign E25d1 = (Adder_l_ & ~Eae_on) | ~Eae_mq0_enable | ~Eae_mq0bar_enable;
assign Reg_bus_ = And_enable? ~Mb : 12'b0;
assign Reg_bus_ = Right_shift? {Adder_l_, Ac[0:10]} : 12'b0;
assign Reg_bus_ = Double_right_rotate? {Adder[11], Adder_l_ & Ac[0:9]} : 12'b0;
assign Reg_bus_ = No_shift? Adder : 12'b0;
assign Reg_bus_ = Left_shift? {Adder[1:11] & E25d1} : 12'b0;
assign Reg_bus_ = Double_left_rotate? {Adder[2:11] & E25d1 & Adder[0]} : 12'b0;
assign Reg_bus_ = Tt_line_shift? {Adder_l_, Adder[1:11]} : 12'b0;
assign Reg_bus = ~Reg_bus_;

// Note that the inputs and outputs of the adder are complemented (active low).
assign {Carry_out0_, Adder} = {~Carry_insert, Operand1_} + {1'b1, Operand2_};
assign Carry_out0 = ~Carry_out0_;

assign Operand1 = Ac_enable? Ac : 12'b0;
assign Operand1 = Acbar_enable? ~Ac : 12'b0;
assign Operand1 = Mq_enable? Mq : 12'b0;
assign Operand1 = Sr_enable? Sr : 12'b0;
assign Operand1 = Sc_enable? {7'b0, Sc} : 12'b0;
assign Operand1 = Data_enable? Data : 12'b0;
assign Operand1 = Io_enable? Input_bus : 12'b0;
assign Operand1 = {11'b0, Tt_carry_insert_s};
assign Operand1_ = ~Operand1;

assign Operand2[0:4] = Ma_enable0_4? Ma[0:4] : 5'b0;
assign Operand2[5:11] = Ma_enable5_11? Ma[5:11] : 7'b0;
assign Operand2 = Pc_enable? Pc : 12'b0;
assign Operand2[0:4] = Mem_enable0_4? Mem[0:4] : 5'b0;
assign Operand2[5:8] = Mem_enable5_8? Mem[5:8] : 4'b0;
assign Operand2[9:11] = Mem_enable9_11? Mem[9:11] : 3'b0;
assign Operand2 = Data_add_enable? Data_add : 12'b0;
assign Operand2_ = ~Operand2;


// Page D-BS-8I-0-10 "I/O Level Converters"

assign J01d2 = Ac[0]; // BAC
assign J01e2 = Ac[1];
assign J01h2 = Ac[2];
assign J01k2 = Ac[3];
assign J01m2 = Ac[4];
assign J01p2 = Ac[5];
assign J01s2 = Ac[6];
assign J01t2 = Ac[7];
assign J01v2 = Ac[8];

assign J02d2 = Ac[9];
assign J02e2 = Ac[10];
assign J02h2 = Ac[11];
assign J02k2 = ~Iop1;
assign J02m2 = ~Iop2;
assign J02p2 = ~Iop4;
assign J02s2 = ~Ts3;
assign J02t2 = ~Ts1;
assign J02v2 = Initialize_;

assign J03d2 = Mb[0]; // BMB
assign J03e2 = Mb[1];
assign J03h2 = Mb[2];
assign J03k2 = ~Mb[3];
assign J03m2 = Mb[3];
assign J03p2 = ~Mb[4];
assign J03s2 = Mb[4];
assign J03t2 = ~Mb[5];
assign J03v2 = Mb[5];

assign J04d2 = ~Mb[6];
assign J04e2 = Mb[6];
assign J04h2 = ~Mb[7];
assign J04k2 = Mb[7];
assign J04m2 = ~Mb[8];
assign J04p2 = Mb[8];
assign J04s2 = Mb[9];
assign J04t2 = Mb[10];
assign J04v2 = Mb[11];

assign Input_bus[0] = ~J05d2 | Io_bus_in[0];
assign Input_bus[1] = ~J05e2 | Io_bus_in[1];
assign Input_bus[2] = ~J05h2 | Io_bus_in[2];
assign Input_bus[3] = ~J05k2 | Io_bus_in[3];
assign Input_bus[4] = ~J05m2 | Io_bus_in[4] | Tt[0];
assign Input_bus[5] = ~J05p2 | Io_bus_in[5] | Tt[1] | ~Me_[5];
assign Input_bus[6] = ~J05s2 | Io_bus_in[6] | Tt[2] | ~Me_[6];
assign Input_bus[7] = ~J05t2 | Io_bus_in[7] | Tt[3] | ~Me_[7];
assign Input_bus[8] = ~J05v2 | Io_bus_in[8] | Tt[4] | ~Me_[8];

assign Input_bus[9] = ~J06d2 | Io_bus_in[9] | Tt[5] | ~Me_[9];
assign Input_bus[10] = ~J06e2 | Io_bus_in[10] | Tt[6] | ~Me_[10];
assign Input_bus[11] = ~J06h2 | Io_bus_in[11] | Tt[7] | ~Me_[11];
assign Io_skip = ~J06k2 | Io_bus_in_skip | Tt_skip | ~Mp_skip_;
assign Int_rqst = ~J06m2 | Io_bus_in_int | Tt_int | ~Mp_int_;
assign Ac_clear = ~J06p2 | Tt_ac_clr | Clk_ac_clr;
assign J06s2 = ~Run;
assign J06t2 = ~Tt_inst;
assign Line_ = ~J06v2;  // Notused (680 option)

assign Data_add[0] = J07d2;
assign Data_add[1] = J07e2;
assign Data_add[2] = J07h2;
assign Data_add[3] = J07k2;
assign Data_add[4] = J07m2;
assign Data_add[5] = J07p2;
assign Data_add[6] = J07s2;
assign Data_add[7] = J07t2;
assign Data_add[8] = J07v2;

assign Data_add[9] = J08d2;
assign Data_add[10] = J08e2;
assign Data_add[11] = J08h2;
assign Brk_rqst = J08k2;
assign Data_in = ~J08m2;
assign J08p2 = ~Break;
assign J08s2 = ~Add_accepted & ~Ts1;
assign Memory_increment = J08t2;
assign J08v2 = Initialize_;

assign Data[0] = J09d2;
assign Data[1] = J09e2;
assign Data[2] = J09h2;
assign Data[3] = J09k2;
assign Data[4] = J09m2;
assign Data[5] = J09p2;
assign Data[6] = J09s2;
assign Data[7] = J09t2;
assign Data[8] = J09v2;

assign Data[9] = J10d2;
assign Data[10] = J10e2;
assign Data[11] = J10h2;
assign Cycles3 = J10k2;
assign Ca_increment = ~J10m2;
assign J10p2 = ~Wc_overflow;
assign Ext_data_add[2] = J10s2;
assign Ext_data_add[1] = J10t2;
assign Ext_data_add[0] = J10v2;

// BUGBUG: These should be shorted to the ones on J10, but aren't.
// input J11d2;
// input J11e2;
// input J11h2;


// Page D-BS-8I-0-12 "Teletype Transmitter"

// BUGBUG: Implement the TTY and give these signals real values.
wire Tti_skip = 0;
wire Tto_skip = 0;
wire Keyboard_flag = 0;
wire Teleprinter_flag = 0;

// I don't know why this stuff for the power fail and timeshare skip/int
// stuff is drawn on the TTY drawings, but here it is.
assign Tt_skip = Tti_skip | Tto_skip | Pwr_skip;
assign Tt_int = Pwr_low | ~U_int_ | Keyboard_flag | Teleprinter_flag;

// Invoke stuff from other print sets below.

wire [0:2] Ea;

// These are outputs used to construct the memory bus in the original design.
`ifdef notdef
output H01d2, H01e2, H01h2, H01k2, H01m2, H01p2, H01s2, H01t2, H01v2;
output H02d2, H02e2, H02h2, H02k2, H02m2, H02p2, H02s2, H02t2, H02v2;
output H03d2, H03e2, H03h2, H03k2, H03m2, H03p2, H03s2, H03t2, H03v2;
assign { H01d2, H01e2, H01h2 } = Ea;
assign { H01k2, H01m2, H01p2, H01s2, H01t2, H01v2 } = Bma[0:5];
assign { H02d2, H02e2, H02h2, H02k2, H02m2, H02p2 } = Ma[6:11];
assign { H02s2, H02t2, H02v2 } = ~Mb[0:2];
assign { H03d2, H03e2, H03h2, H03k2, H03m2, H03p2, H03s2, H03t2, H03v2 } ~Mb[3:11];
`endif

`define mp8i
`ifdef mp8i
mp8i mp8i(Initialize_, Mb, Mem, ~Mem_p_, Iop1, Iop4,
          Mb_parity_odd, Mp_int_, Mp_skip_);
`else
assign Mb_parity_odd = Mem_p_;
assign Mp_int_ = 1;
assign Mp_skip_ = 1;
`endif

// Now instantiate the memory.
`define MEM_FIELDS 8
mm8i #(`MEM_FIELDS) core(Dclk, ~Power_clear, Mem_start, Tp2, Ea, Ma, Mb,
                         Mb_parity_odd,
                         Mem, Mem_p_, Mem_done_);

`define mc8i    // If more than 1 field, must generate the extended memory control.
`ifdef mc8i
mc8i mc8i(Fetch, Defer, Dfsr, Ifsr, ~E_set, ~F_set,
          Ext_data_add, Iot, Jmp_, Jms_, ~Key_la_mfts0, Key_stexdp,
          Mb, Mftp1, Manual_preset_, Pc_load, ~Restart_,
          Sr_enable, Tp3, Ts3, ~Ts4, ~Wc_set, ~Word_count,
          ~Load_sf, Clear_ifdfbf, B_set,
          Ea, Int_inhibit, Mem_ext, Ext_inst, Mb06xmb09, Rib, Ib_to_if, Pc_loadxSr_enable_,
          Ext_go, Clear_if_, Sf_enable, Me_[6:11], Mem_ext_ac_load_enable_, Mem_ext_io_enable_);
`endif

`define kt8i
`ifdef kt8i
// Can't find a signal "Rmf", but Sf_enable looks like it will do.
kt8i kt8i(Mb, Op2, Sf_enable, I_iot, Ib_to_if, Ext_inst, Ext_go, ~Pc_loadxSr_enable_, Pc_load,
          ~Clear_if_, ~Key_la_mfts0, Tp3, Sf_enable, Load_sf, Initialize_, Tp2e, Rib, Skip, Mb06xmb09,
          Me_[5], U_int_, Skip_or, Uf);
`else
assign Uf = 0;
`endif

`define ke8i
`ifdef ke8i
ke8i ke8i(Dclk, Ac, Mid_ac0, Low_ac0, ~Adder_l_, Adder_l_,
          Mb, Tp3, Adder[11], Mfts2,
          Opr, Op2, Fetch, Execute, ~Power_clear, Eae_ir_clr_, Right_shift,
          Mq, Eae_right_shift_enable, Eae_left_shift_enable, Eae_no_shift_enable, Eae_ir2,
          Eae_mem_enable, Eae_acbar_enable, Eae_ac_enable, Eae_l_disable, Asr_enable,
          Mq_enable, Sc_enable, Eae_e_set, Eae_set, Eae_mq0bar_enable, Eae_mq0_enable,
          Eae_execute, Eae_end, Asr_l_set, Ac_to_mq_enable, Sc, Eae_on, Eae_tp, Eae_start,
          C40s2, C40m2, C40n2, C40l2, C40f1,
          E40s2, E40m2, E40n2, E40l2, E40f1, E40h1,
          F40s2, F40m2, F40n2, F40l2, F40f1, F40h1);
`else
// No EAE hardware, so just tie off the enables.
assign Ac_to_mq_enable = 0;
assign Asr_l_set = 0;
assign Eae_e_set = 0;
assign Eae_set = 0;
assign Eae_mq0_enable = 0;
assign Eae_mq0bar_enable = 0;
assign Eae_right_shift_enable = 0;
assign Eae_left_shift_enable = 0;
assign Eae_no_shift_enable = 0;
assign Eae_ir2 = 0;
assign Eae_mem_enable = 0;
assign Eae_acbar_enable = 0;
assign Eae_ac_enable = 0;
assign Eae_l_disable = 0;
assign Asr_enable = 0;
assign Mq_enable = 0;
assign Sc_enable = 0;
assign Eae_execute = 0;
assign Eae_end = 1;
// Also tie off the indicators on the front panel.
assign { C40s2, C40m2, C40n2, C40l2, C40f1 } = 5'b11111;  // Sc
assign { E40s2, E40m2, E40n2, E40l2, E40f1, E40h1 } = 6'b111111;  // Mq[0:5]
assign { F40s2, F40m2, F40n2, F40l2, F40f1, F40h1 } = 6'b111111;  // Mq[6:11]
`endif

endmodule
