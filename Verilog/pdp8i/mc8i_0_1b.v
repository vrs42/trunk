// `defaultnettype none
module mc8i_0_1b(Clear_if_, Clear_df_, F_set_, E_set_, Jmp_, Jms_, Clear_ib_,
                 Keyla_mfts0_, Pc_load, Sr_enable, Mb_, Mb, 
                 B_fetch, Ifsr, Dfsr, Sf, Iot, Tp3, Ts3,
                 
                 Me_, Mem_ext_ac_load_enable_, Mem_ext_io_enable_,
                 
                 If, Df, Int_inhibit);
// Extended Memory and Timeshare IOTs:
//  62n1 - CDF n (Change Data Field)
//  62n2 - CIF n (Change Instruction Field)
//  6204 - CINT (Clear user interrupt)
//  6214 - RDF (Read Data Field)
//  6224 - RIF (Read Instruction Field)
//  6234 - RIB (Read Interrupt Buffler)
//  6244 - RMF (Restore Memory Fields)
//  6254 - SINT (Skip if user interrupt)
//  6264 - CUF (Clear user flag)
//  6274 - SUF (Set user flag)

input wire Clear_if_;
input wire Clear_df_;
input wire F_set_;  // Next major cycle is Fetch
input wire E_set_;  // Next major cycle is Execute
input wire Jmp_;
input wire Jms_;
input wire Clear_ib_;
input wire Keyla_mfts0_;
input wire Pc_load;
input wire Sr_enable;
input wire [0:11] Mb_;
input wire [0:11] Mb;
input wire B_fetch;
input wire [0:2] Ifsr;
input wire [0:2] Dfsr;
input wire [0:5] Sf;
input wire Iot;
input wire Tp3;
input wire Ts3;

output wire [6:11] Me_;
output wire Mem_ext_ac_load_enable_;
output wire Mem_ext_io_enable_;

output reg [0:2] If;
output reg [0:2] Df;
output reg Int_inhibit;

// Locals:
wire Ext_inst;
wire Ifload;
wire Ibload;
wire [0:2] Ib_tmp;
wire [0:2] If_tmp;
wire [0:2] Df_tmp;
wire Mb06xmb09_;
wire Mem_ext;
wire Pc_loadxSr_enable_;
wire Sf_enable;
reg [0:2] Ib;

//Connectors:
// A40 (front panel switches)
// Dfsr = {d2:f2};
// Ifsr = {h2:k2};
// C40 (front panel lights)
// {N1,C1,D1} = If;

assign Mem_ext = B_fetch & Mb_[3] & Mb[4] & Mb_[5] & Iot; // 62xx
assign Ext_inst = Mem_ext & Mb[9]; // 62x[4567] (RDF, RIF, RIB, RMF)
assign Df_to_me = Ext_inst & Mb_[7] & Mb[8]; // 62[15][4567] (RDF)
assign Sf_to_me = Ext_inst & Mb[7] & Mb[8]; // 62[37][4567] (RIB)
assign If_to_me = Ext_inst & Mb[7] & Mb_[8]; // 62[26][4567] (RIF)
assign Me_ = Df_to_me? {Df, 3'b1} :
             Sf_to_me? Sf :
             If_to_me? {If, 3'b1} : 1;
assign Me_iot = Df_to_me | Sf_to_me | If_to_me;
assign Mem_ext_ac_load_enable_ = ~(Tp3 & Me_iot);
assign Mem_ext_io_enable_ = ~(Ts3 & Me_iot);
assign Ext_go = Tp3 & Mem_ext; // 62xx

assign Mb06xmb09_ = ~(Ext_inst & Mb[6]); // 62[4567][4567] (RMF)
assign Sf_enable = ~Mb06xmb09_; // (RMF)
assign Pc_loadxSr_enable_ = (~Keyla_mfts0_ & Pc_load);
assign Ibload = ((~Mb06xmb09_ | ~Mb_[10]) & Ext_go) | ~Pc_loadxSr_enable_;
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

assign Ifload = ~Pc_loadxSr_enable_ | (Tp3 & (~F_set_ | ~E_set_) & (~Jmp_ | ~Jms_));
assign If_tmp = Keyla_mfts0_? Ib :
                Sr_enable? Ifsr : 0;
always @(posedge Ifload)
begin
    if (~Clear_if_)
        If <= 0;
    else
        If <= If_tmp;
end

assign Set_inh = Ext_go & Mb[10]; // 62x[2367] (CIF)
always @(Ifload or Set_inh)
begin
    if (Set_inh)
        Int_inhibit = 1;
    if (Ifload)
        Int_inhibit = 0;
end

assign Dfload = ~(Ext_go & (~Mb_[11] | ~Mb06xmb09_)); // RMF or CDF
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
