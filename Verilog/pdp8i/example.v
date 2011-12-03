//
// There is no nested module structure and no obvious way
// to do "record" structure in Verilog, so this just declares
// the signals here (GROT).
//
// The convention of capitalizing the first letter prevents
// conflicts with Verilog keywords.  A trailing underscore 
// signifies an active low signal, rather than "(0)".
//
// Combinitorial work is done with "assign" statements, to 
// make clear that latches are not intended, and to mitigate 
// tedious maintenance of sensitivity lists.
//

// The interface connectors have 9 named bits:
`define d2 0
`define e2 (`d2+1)
`define h2 (`e2+1)
`define k2 (`h2+1)
`define m2 (`k2+1)
`define p2 (`m2+1)
`define s2 (`p2+1)
`define t2 (`s2+1)
`define v2 (`t2+1)
module mc8i(Dclk, Ext_data_add, If, Df, Wc_set_, Word_count_, B_set, 
                Tp3, Ts4_, Mftp1, Clear_ifdfbf, Restart, Load_sf_,
					 Manual_preset_, Run, Jmp_, Jms_, Defer, Key_stexdp, 
					 Ma_, Mb, Ea, Ea_, Mcbmb_, Bma, Strobe_, Mem_done_,
					 Load_bf, If_enable_, Df_enable_, B_set_,
					 H01, H02, H03, 
					 Clear_if_, Clear_df_, Clear_ib_,
					 Bf, Sf, If_enable, Df_enable, Bf_enable);
// First the inputs
input wire Dclk;           // Delay Clock
input wire [0:2] Ext_data_add; // External data address
input wire [0:2] If;       // IF
input wire [0:2] Df;       // DF
input wire Wc_set_;        // Set WC (active low)
input wire Word_count_;    // Currently a WC cycle
input wire B_set;
input wire Tp3;            // Timing pulse
input wire Ts4_;           // Time state 4
input wire Mftp1;          // Manual function timing pulse
input wire Clear_ifdfbf;   // Clear field registers
input wire Restart;        // Trigger a restart (manual function)
input wire Load_sf_;
input wire Manual_preset_;
input wire Run;            // CPU is running
input wire Jmp_;           // JMP instruction in progress
input wire Jms_;           // JMS instruction in progress
input wire Defer;          // DEFER cycle in progress
input wire Key_stexdp;     // START, EXAMINE, or DEPOSIT key
input wire [0:11] Ma_;     // MA
input wire [0:11] Mb;      // MB
// ...then combinitorial outputs
output wire [0:2] Ea;      // Extended address
output wire [0:2] Ea_;     // Extended address
output wire [0:11] Mcbmb_; // Buffered MB (active low)
output wire [0:11] Bma;    // Buffered MA
output wire Strobe_;       // Memory strobe pulse (active low)
output wire Mem_done_;     // Memory strobe pulse (active low)
output wire B_set_;
output wire Load_bf;       // Load BF
output wire If_enable_;    // Gate IF to EA (active low)
output wire Df_enable_;    // Gate DF to EA (active low)
output wire Clear_if_;     // Clear IF (active low)
output wire Clear_df_;     // Clear DF (active low)
output wire Clear_ib_;     // Clear IB (active low)
output wire [`d2:`v2] H01;
output wire [`d2:`v2] H02;
output wire [`d2:`v2] H03;
// ...then registered outputs
output reg [0:2] Bf;       // Branch field
output reg [0:5] Sf;       // Saved if, df
output reg If_enable;      // Gate IF to EA
output reg Df_enable;      // Gate DF to EA
output reg Bf_enable;      // Gate BF to EA

// Locals
wire A19k1, E12n2, A19s1s2;

// Combinatorial stuff to compute outputs.
assign Clear_if_ = ~(A19s1s2 & Clear_ifdfbf);
assign Clear_df_ = ~(A19s1s2 & Clear_ifdfbf);
assign Clear_ib_ = ~(A19s1s2 & Clear_ifdfbf);
assign Df_enable_ = ~(Jmp_ & Jms_ & Defer);
assign B_set_ = ~B_set;
assign If_enable_ = ~(Df_enable_ & (Wc_set_ & Word_count_) & B_set_);
assign Load_bf = B_set & Tp3;
assign Mcbmb_ = ~Mb;
assign H02[`s2:`v2] = Mcbmb_[0:2];
assign H03[`d2:`v2] = Mcbmb_[3:11];
assign Bma = ~Ma_;
assign H01[`k2:`v2] = Bma[0:5];
assign H02[`d2:`p2] = Bma[6:11];
assign Ea = If_enable? If :
            Df_enable? Df :
				Bf_enable? Bf : 0;
assign Ea_ = ~Ea;
assign H01[`d2:`h2] = Ea;
// #() delays are lost in synthesis
//assign #(35000) Strobe_tmp = Tp3; //35us
DelayLine #(35000) strobe_delay(Dclk, Tp3, Strobe_tmp);
assign Strobe_ = ~(Run & Strobe_tmp);
//assign #(5000) Mem_done_ = Strobe_; //5us
DelayLine #(5000) done_delay(Dclk, Strobe_, Mem_done_);
// Local combinatorial stuff.
assign A19k1 = (~Ts4_) | ~(Key_stexdp & Mftp1);
assign E12n2 = ~(Restart & Mftp1);
assign A19s1s2 = (~E12n2) | (~Load_sf_);

// During TS4, enables are set for field selection
// (unless front panel function or manual reset).
always @(posedge A19k1 or negedge Manual_preset_)
begin
    if (~Manual_preset_) begin
        If_enable <= 0;
        Df_enable <= 0;
        Bf_enable <= 0;
    end else begin
        If_enable <= ~If_enable_;
        Df_enable <= ~Df_enable_;
        Bf_enable <= ~B_set_;
    end
end

// load_sf latches both IF and DF to be copied into SF
// (unless the front panel is active).
always @(posedge A19s1s2)
begin
    Sf <= {If , Df};
end

// load_bf causes the data break field to be latched.
always @(posedge Load_bf)
begin
    Bf <= Ext_data_add;
end

endmodule