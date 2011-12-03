//
// Instantiate and hook up each page of the MC8i drawings.
// The result is an extended memory controller for an 8/i.
//
module mc8i(B_fetch, Defer, Dfsr, Ifsr, E_set_, F_set_,
            Ext_data_add, Iot, Jmp_, Jms_, Keyla_mfts0_, Key_stexdp,
            Ma, Mb, Mftp1, Manual_preset_, Pc_load, Restart,
            Sr_enable, Tp3, Ts3, Ts4_, Wc_set_, Word_count_,
            Load_sf_, Clear_ifdfbf, B_set,
            Df, Ea, If, Int_inhibit,
            Me_, Mem_ext_ac_load_enable_, Mem_ext_io_enable_,
            Bma, H01, H02, H03);
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
input wire Keyla_mfts0_;
input wire Key_stexdp;
input wire [0:11] Ma;
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
output wire [0:2] Df;
output wire [0:2] Ea;
output wire [0:2] If;
output wire Int_inhibit;
output wire [3:8] Me_;
output wire Mem_ext_ac_load_enable_;
output wire Mem_ext_io_enable_;
output wire [0:11] Bma;
output wire [0:8] H01;
output wire [0:8] H02;
output wire [0:8] H03;

wire [0:11] Ma_ = ~Ma;
wire [0:11] Mb_ = ~Mb;
wire [0:5] Sf;

mc8i_0_1a mc8i1a(Ext_data_add, If, Df, Wc_set_, Word_count_, B_set, 
                 Tp3, Ts4_, Mftp1, Clear_ifdfbf, Restart, Load_sf_,
                 Manual_preset_, Jmp_, Jms_, Defer, Key_stexdp, 
                 Ma_, Mb, Ea, Bma,
                 H01, H02, H03, 
                 Clear_if_, Clear_df_, Clear_ib_,
                 Sf);

mc8i_0_1b mc8i1b(Clear_if_, Clear_df_, F_set_, E_set_, Jmp_, Jms_, Clear_ib_,
                 Keyla_mfts0_, Pc_load, Sr_enable, Mb_, Mb, 
                 B_fetch, Ifsr, Dfsr, Sf, Iot, Tp3, Ts3,
                 Me_, Mem_ext_ac_load_enable_, Mem_ext_io_enable_,
                 If, Df, Int_inhibit);

endmodule
