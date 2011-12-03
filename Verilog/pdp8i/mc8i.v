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

//
// Instantiate and hook up each page of the MC8i drawings.
// The result is an extended memory controller for an 8/i.
//
module mc8i(B_fetch, Defer, Dfsr, Ifsr, E_set_, F_set_,
            Ext_data_add, Iot, Jmp_, Jms_, Key_la_mfts0_, Key_stexdp,
            Mb, Mftp1, Manual_preset_, Pc_load, Restart,
            Sr_enable, Tp3, Ts3, Ts4_, Wc_set_, Word_count_,
            Load_sf_, Clear_ifdfbf, B_set,
            Ea, Int_inhibit, Mem_ext, Ext_inst, Mb06xmb09, Rib, Ib_to_if, Pc_loadxSr_enable_,
            Ext_go, Clear_if_, Sf_enable, Me_, Mem_ext_ac_load_enable_, Mem_ext_io_enable_);

// From the front panel or CPU.
input wire B_fetch;
input wire Defer;
input wire [0:2] Dfsr;
input wire E_set_;
input wire [0:2] Ext_data_add;
input wire F_set_;
input wire [0:2] Ifsr;
input wire Iot;
input wire Jmp_;
input wire Jms_;
input wire Key_la_mfts0_;
input wire Key_stexdp;
input wire [0:11] Mb;
input wire Mftp1;
input wire Manual_preset_;
input wire Pc_load;
input wire Restart;
input wire Sr_enable;
input wire Tp3;
input wire Ts3;
input wire Ts4_;
input wire Wc_set_;
input wire Word_count_;
input wire Load_sf_;
input wire Clear_ifdfbf;
input wire B_set;

// To the front panel or CPU.
output reg Int_inhibit;
output wire [0:2] Ea;
output wire [6:11] Me_;
output Mem_ext;
output wire Mem_ext_ac_load_enable_;
output wire Mem_ext_io_enable_;
output Ext_inst;
output Mb06xmb09;
output Rib;
output Ib_to_if;
output Pc_loadxSr_enable_;
output Ext_go;
output Clear_if_;
output Sf_enable;

// Locals
reg [0:2] Df;
reg [0:2] If;
wire B_set_;
wire A19k1, E12n2, A19s1s2;
reg [0:2] Bf;       // Break field
wire Df_enable_;    // Gate DF to EA (active low)
reg Df_enable;      // Gate DF to EA
wire If_enable_;    // Gate IF to EA (active low)
reg If_enable;      // Gate IF to EA
reg Bf_enable;      // Gate BF to EA
wire Load_bf;       // Load BF
wire [0:11] Mb_ = ~Mb;
reg [0:5] Sf;

// Combinatorial stuff to compute outputs.
assign Clear_if_ = ~(A19s1s2 & Clear_ifdfbf);
assign Clear_df_ = ~(A19s1s2 & Clear_ifdfbf);
assign Clear_ib_ = ~(A19s1s2 & Clear_ifdfbf);
assign Df_enable_ = ~(Jmp_ & Jms_ & Defer);
assign B_set_ = ~B_set;
assign If_enable_ = ~(Df_enable_ & (Wc_set_ & Word_count_) & B_set_);
assign Load_bf = B_set & Tp3;
assign Ea = If_enable? If :
            Df_enable? Df :
            Bf_enable? Bf : 0;

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

// Load_sf_ latches both IF and DF to be copied into SF
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

// Extended Memory and Timeshare IOTs:
//  62n1 - CDF n (Change Data Field)
//  62n2 - CIF n (Change Instruction Field)
//  6204 - CINT (Clear user interrupt)
//  6214 - RDF (Read Data Field)
//  6224 - RIF (Read Instruction Field)
//  6234 - RIB (Read Interrupt Buffler)
//  6244 - RMF (Restore Memory Fields)
//  6254 - SINT (Skip if user interrupt) (timeshare)
//  6264 - CUF (Clear user flag) (timeshare)
//  6274 - SUF (Set user flag) (unimplemented)

wire Ibload;
wire [0:2] Ib_tmp;
wire [0:2] If_tmp;
wire [0:2] Df_tmp;
reg [0:2] Ib;

//Connectors:
// A40 (front panel switches)
// Dfsr = {d2:f2};
// Ifsr = {h2:k2};
// C40 (front panel lights)
// {N1,C1,D1} = If;

assign Mem_ext = B_fetch & Mb_[3] & Mb[4] & Mb_[5] & Iot; // 62xx
// Question: Why doesn't CUF gate IF onto Me_ (and therefore into AC)?
assign Ext_inst = Mem_ext & Mb[9]; // 62x[4567] (RDF, RIF, RIB, RMF, etc.)
assign Rdf = Ext_inst & Mb_[7] & Mb[8]; // 62[15][4567] (RDF, SINT)
assign Rib = Ext_inst & Mb[7] & Mb[8]; // 62[37][4567] (RIB, SUF)
assign Rif = Ext_inst & Mb[7] & Mb_[8]; // 62[26][4567] (RIF, CUF)
assign Me_ = Rdf? ~{Df, 3'b0} :
             Rib? ~Sf :
             Rif? ~{If, 3'b0} : 1;
assign Me_iot = Rdf | Rib | Rif;
assign Mem_ext_ac_load_enable_ = ~(Tp3 & Me_iot);
assign Mem_ext_io_enable_ = ~(Ts3 & Me_iot);
assign Ext_go = Tp3 & Mem_ext; // 62xx

// Question: Why don't SINT, CUF, SUF also do RMF here?
assign Mb06xmb09 = Ext_inst & Mb[6]; // 62[4567][4567] (RMF, timeshare)
assign Sf_enable = Mb06xmb09; // (RMF, timeshare)
assign Pc_loadxSr_enable_ = (~Key_la_mfts0_ & Pc_load);
assign Ibload = ((Mb06xmb09 | ~Mb_[10]) & Ext_go) | ~Pc_loadxSr_enable_;
assign Ib_tmp = Sr_enable? Ifsr :
                (Mem_ext & Mb[10])? Mb[6:8] : // 62x[2367] (CIF)
                Sf_enable? Sf[0:2] : 0;
always @(posedge Ibload, negedge Clear_ib_)
begin
    if (~Clear_ib_)
        Ib <= 0;
    else
        Ib <= Ib_tmp;
end

assign Ib_to_if = ~Pc_loadxSr_enable_ | (Tp3 & (~F_set_ | ~E_set_) & (~Jmp_ | ~Jms_));
assign If_tmp = Key_la_mfts0_? Ib :
                Sr_enable? Ifsr : 0;
always @(posedge Ib_to_if)
begin
    if (~Clear_if_)
        If <= 0;
    else
        If <= If_tmp;
end

assign Set_inh = Ext_go & Mb[10]; // 62x[2367] (CIF)
always @(Ib_to_if or Set_inh)
begin
    if (Set_inh)
        Int_inhibit = 1;
    if (Ib_to_if)
        Int_inhibit = 0;
end

assign Dfload = ~(Ext_go & (~Mb_[11] | Mb06xmb09)); // RMF or CDF
assign Df_tmp = Sr_enable? Dfsr :
                (Mem_ext & Mb[11])? Mb[6:8] : // 62x[1357] (CDF)
                Sf_enable? Sf[3:5] : 0;
always @(posedge Dfload)
begin
    if (~Clear_df_)
        Df <= 0;
    else
        Df <= Df_tmp;
end

endmodule
