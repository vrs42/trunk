library ieee;
use ieee.std_logic_1164.all;

-- latch74 7474 style latch
entity latch74 is
   generic(tpd : time := 55 ns);
   -- Declare ports here.
   port(
       d : in  std_logic;
       c : in  std_logic;
       rl: in  std_logic;
       sl: in  std_logic;
       q : out std_logic;
       ql: out std_logic
   );
end latch74;
architecture structural of latch74 is
signal qh : std_logic;
begin    -- Implementation
    qh <= '0' when (rl = '0')
    else  '1' when (sl = '0')
    else   d  when (c'event and c = '1')
    else   qh after tpd;
    q  <= qh;
    ql <= not qh;
end structural;

library ieee;
use ieee.std_logic_1164.all;
-- jk73 7473 style JK flip-flop
entity jk73 is
   generic(tpd : time := 30 ns);
   -- Declare ports here.
   port(
       j : in  std_logic;
       k : in  std_logic;
       c : in  std_logic;
       rl: in  std_logic;
       q : out std_logic;
       ql: out std_logic
   );
end jk73;
architecture structural of jk73 is
signal d  : std_logic;
signal qh : std_logic;
begin    -- Implementation
    d <= qh  when j = '0' and k = '0'
    else '0' when j = '0' and k = '1'
    else '1' when j = '1' and k = '0'
    else not qh;
    qh <=    '0'  when (rl = '0')
    else      d  when (c'event and c = '1')
    else     qh after tpd;
    q  <= qh;
    ql <= not qh;
end structural;

library ieee;
use ieee.std_logic_1164.all;
use work.posibus.all;
-- tc08 TC08 DECTape Controller
entity tc08 is
    generic(tpd : time := 10 ns);
    port(
-- Posimux signals
		  pd_l             : inout std_logic_vector(0 to 11);
		  mx_h             : in    muxctl;

-- I count 67 signals for the Indicator Panel.
        c00           : inout std_logic;   -- Indicator Panel
        c01           : inout std_logic;   -- Indicator Panel
        data          : inout std_logic;   -- Indicator Panel
        df            : inout std_logic;   -- Indicator Panel
        dtb_00        : inout std_logic;   -- Indicator Panel
        dtb_01        : inout std_logic;   -- Indicator Panel
        dtb_02        : inout std_logic;   -- Indicator Panel
        dtb_03        : inout std_logic;   -- Indicator Panel
        dtb_04        : inout std_logic;   -- Indicator Panel
        dtb_05        : inout std_logic;   -- Indicator Panel
        dtb_06        : inout std_logic;   -- Indicator Panel
        dtb_07        : inout std_logic;   -- Indicator Panel
        dtb_08        : inout std_logic;   -- Indicator Panel
        dtb_09        : inout std_logic;   -- Indicator Panel
        dtb_10        : inout std_logic;   -- Indicator Panel
        dtb_11        : inout std_logic;   -- Indicator Panel
        dtf           : inout std_logic;   -- Indicator Panel
        ef            : inout std_logic;   -- Indicator Panel
        end_h         : out   std_logic;   -- Indicator Panel
        eni           : inout std_logic;   -- Indicator Panel
        fr_00         : inout std_logic;   -- Indicator Panel
        fr_01         : inout std_logic;   -- Indicator Panel
        fr_02         : inout std_logic;   -- Indicator Panel
        fr_03         : inout std_logic;   -- Indicator Panel
        lpb_00        : inout std_logic;   -- Indicator Panel
        lpb_01        : inout std_logic;   -- Indicator Panel
        lpb_02        : inout std_logic;   -- Indicator Panel
        lpb_03        : inout std_logic;   -- Indicator Panel
        lpb_04        : inout std_logic;   -- Indicator Panel
        lpb_05        : inout std_logic;   -- Indicator Panel
        mc00          : inout std_logic;   -- Indicator Panel
        mc01          : inout std_logic;   -- Indicator Panel
        mc02          : inout std_logic;   -- Indicator Panel
        mf00          : out   std_logic;   -- Indicator Panel
        mf01          : out   std_logic;   -- Indicator Panel
        mf02          : out   std_logic;   -- Indicator Panel
        mkt           : inout std_logic;   -- Indicator Panel
        mktk          : out   std_logic;   -- Indicator Panel
        mr00          : inout std_logic;   -- Indicator Panel
        mr01          : inout std_logic;   -- Indicator Panel
        par           : out   std_logic;   -- Indicator Panel
        sel           : out   std_logic;   -- Indicator Panel
        st_blk_mk     : inout std_logic;   -- Indicator Panel
        st_ck         : inout std_logic;   -- Indicator Panel
        st_final      : inout std_logic;   -- Indicator Panel
        st_idle       : inout std_logic;   -- Indicator Panel
        st_rev_ck     : inout std_logic;   -- Indicator Panel
        swtm          : in    std_logic;   -- Indicator Panel
        tim           : out   std_logic;   -- Indicator Panel
        usr_00        : inout std_logic;   -- Indicator Panel
        usr_01        : inout std_logic;   -- Indicator Panel
        usr_02        : inout std_logic;   -- Indicator Panel
        uts           : inout std_logic;   -- Indicator Panel
        w01           : inout std_logic;   -- Indicator Panel
        w02           : inout std_logic;   -- Indicator Panel
        w03           : inout std_logic;   -- Indicator Panel
        w04           : inout std_logic;   -- Indicator Panel
        w05           : inout std_logic;   -- Indicator Panel
        w06           : inout std_logic;   -- Indicator Panel
        w07           : inout std_logic;   -- Indicator Panel
        w08           : inout std_logic;   -- Indicator Panel
        w09           : inout std_logic;   -- Indicator Panel
        wb00          : inout std_logic;   -- Indicator Panel
        wb01          : inout std_logic;   -- Indicator Panel
        wb02          : inout std_logic;   -- Indicator Panel
        wc            : inout std_logic;   -- Indicator Panel
        wr_en         : inout std_logic;   -- Indicator Panel
-- I count 15 signals for the Tape Drive.
        single_unit   : in    std_logic;   -- Tape Drive
        t_00_l        : out   std_logic;   -- Tape Drive
        t_01_l        : out   std_logic;   -- Tape Drive
        t_02_l        : out   std_logic;   -- Tape Drive
        t_03_l        : out   std_logic;   -- Tape Drive
        t_04_l        : out   std_logic;   -- Tape Drive
        t_05_l        : out   std_logic;   -- Tape Drive
        t_06_l        : out   std_logic;   -- Tape Drive
        t_07_l        : out   std_logic;   -- Tape Drive
        t_fwd_l       : out   std_logic;   -- Tape Drive
        t_go_l        : out   std_logic;   -- Tape Drive
        t_pwr_clr_l   : out   std_logic;   -- Tape Drive
        t_rev_l       : out   std_logic;   -- Tape Drive
        t_stop_l      : out   std_logic;   -- Tape Drive
        write_ok      : in    std_logic;   -- Tape Drive
-- The rest connect to various non-digital logic.  I count 41 of them.
        ck00          : out   std_logic;   -- G888 A18
        ck00_l        : inout std_logic;   -- G888 A18
        csta          : inout std_logic;   -- M302 D16
        m_stop_l      : inout std_logic;   -- M307 D14
        n_13          : out   std_logic;   -- M302 A14
        n_15          : in    std_logic;   -- M602 A16
        n_17          : in    std_logic;   -- M401 D15
        n_18          : out   std_logic;   -- M302 A14
        n_22          : in    std_logic;   -- M302 A14
        n_23          : in    std_logic;   -- M302 A14
        n_24          : out   std_logic;   -- M602 B16
        n_30          : in    std_logic;   -- M602 B16
        n_34          : in    std_logic;   -- M302 D16
        n_5           : out   std_logic;   -- M602 A16
        n_6           : in    std_logic;   -- M602 D13
        n_67          : out   std_logic;   -- M307 D14
        n_8           : in    std_logic;   -- M602 D17
        rdd_00        : in    std_logic;   -- G888 A21
        rdd_01        : in    std_logic;   -- G888 B20
        rdd_02        : in    std_logic;   -- G888 A20
        rdmk          : in    std_logic;   -- G888 B18
        sp_dy_l       : in    std_logic;   -- M307 D14
        st_ck_0p_l    : in    std_logic;   -- M602 D17
        tm_en         : inout std_logic;   -- G888 A18
        tm_en_l       : inout std_logic;   -- M401 D15
        tp00          : inout std_logic;   -- M602 A16
        tp00_a_l      : in    std_logic;   -- M602 A16
        tp01          : inout std_logic;   -- M602 B16
        tp01_a_l      : in    std_logic;   -- M602 B16
        tp0_xtlk_dy_l : inout std_logic;   -- M602 A16
        tp1_xtlk_dy_l : inout std_logic;   -- M602 B16
        ts03_l        : out   std_logic;   -- M602 D17
        t_trk         : in    std_logic;   -- G888 A18
        t_trk_l       : in    std_logic;   -- G888 A18
        u_or_m_dy_l   : in    std_logic;   -- M307 D14
        wb00_l        : inout std_logic;   -- G888 A21
        wb01_l        : inout std_logic;   -- G888 B20
        wb02_l        : inout std_logic;   -- G888 A20
        xsad_l        : in    std_logic;   -- M602 D13
        xsta          : inout std_logic;   -- M602 D13
        xsta_l        : inout std_logic    -- M602 D13
-- So I get 51+21+67+15+41 = 72+82+41 = 154+41 = 195 total signals.
    );
end tc08;
architecture structural of tc08 is
    component latch74 is
        generic(tpd : time := 55 ns);
        -- Declare ports here.
        port(
            d : in  std_logic;
            c : in  std_logic;
            rl: in  std_logic;
            sl: in  std_logic;
            q : out std_logic;
            ql: out std_logic
        );
    end component;
    component jk73 is 
        generic(tpd : time := 30 ns);
        -- Declare ports here.
        port(
            j : in std_logic;
            k : in std_logic;
            c : in  std_logic;
            rl: in  std_logic;
            q : out std_logic;
            ql: out std_logic
        );
    end component;
	 component posidmux is
	     port(

   	-- Here is the Multiplexed bus (from/to the peripheral).
			  pd_l             : inout std_logic_vector(0 to 11);
			  mx_h             : in    muxctl;

   	-- For this unit "in" means coming to us from the I/O device, 
   	--	while "out" means going from us to the device (or CPU).

		-- Here are the unmultiplexed versions (from/to the device).
		-- (There should be 72 of these.)
      	  io_bac           : out   std_logic_vector(0 to 11); -- Posibus (Data out)
	        io_bmb           : out   std_logic_vector(0 to 11); -- Posibus (Inst. out)
   	     io_bmb_l         : out   std_logic_vector(3 to  8); -- Posibus (Inst. out)
      	  io_p1            : out   std_logic;
	        io_p2            : out   std_logic;
   	     io_p4            : out   std_logic;
      	  io_ts03          : out   std_logic;
	        io_b_run         : out   std_logic;
   	     io_pwr_clr       : out   std_logic;
	   	  io_im_l          : in    std_logic_vector(0 to 11); -- Posibus (Data in)
	        io_int_rq_l      : in    std_logic;
   	     io_skp_rq_l      : in    std_logic;
      	  io_0_to_ac_l     : in    std_logic;
   	     db_addr_acc_l    : out   std_logic;   -- Data Break
      	  db_bwc0_l        : out   std_logic;   -- Data Break (Count has gone to zero)
	        db_b_brk         : out   std_logic;   -- Data Break (Break Grant)
	        db_ea_l          : in    std_logic_vector(0 to 2); -- Data Break (Extended Address)
	        db_brk_rq_l      : in    std_logic;   -- Data Break (Break Request)
	        db_data_in       : in    std_logic;   -- Data Break (Load or Store?)
	        db_1_to_ca_inh_l : in    std_logic;   -- Data Break (Inhibit address increment)
	        db_data_l        : inout std_logic_vector(0 to 11) -- Data Break (Data)
   	 );
	 end component;

 	-- Here are the unmultiplexed versions (from/to the device).
	-- (There should be 72 of these.)
   signal io_bac           : std_logic_vector(0 to 11); -- Posibus (Data out)
   signal io_bmb           : std_logic_vector(0 to 11); -- Posibus (Inst. out)
   signal io_bmb_l         : std_logic_vector(3 to  8); -- Posibus (Inst. out)
   signal io_p1            : std_logic;
   signal io_p2            : std_logic;
   signal io_p4            : std_logic;
   signal io_ts03          : std_logic;
   signal io_b_run         : std_logic;
   signal io_pwr_clr       : std_logic;
	signal io_im_l          : std_logic_vector(0 to 11) := "HHHHHHHHHHHH"; -- Posibus (Data in)
   signal io_int_rq_l      : std_logic := 'H';
   signal io_skp_rq_l      : std_logic := 'H';
   signal io_0_to_ac_l     : std_logic := 'H';
   signal db_1_to_ca_inh_l : std_logic := 'H';   -- Data Break (Inhibit address increment)
   signal db_addr_acc_l    : std_logic;   -- Data Break
   signal db_bwc0_l        : std_logic;   -- Data Break (Count has gone to zero)
   signal db_b_brk         : std_logic;   -- Data Break (Break Grant)
   signal db_ea_l          : std_logic_vector(0 to 2) := "HHH"; -- Data Break (Extended Address)
   signal db_brk_rq_l      : std_logic := 'H';   -- Data Break (Break Request)
   signal db_data_in       : std_logic := 'H';   -- Data Break (Load or Store?)
   signal db_data_l        : std_logic_vector(0 to 11); -- Data Break (Data)
	-- I count 51 signals for Posibus.
	alias im_00_l       : std_logic is io_im_l(0);   -- Posibus (Data in)
	alias im_01_l       : std_logic is io_im_l(1);   -- Posibus
	alias im_02_l       : std_logic is io_im_l(2);   -- Posibus
	alias im_03_l       : std_logic is io_im_l(3);   -- Posibus
	alias im_04_l       : std_logic is io_im_l(4);   -- Posibus
	alias im_05_l       : std_logic is io_im_l(5);   -- Posibus
	alias im_06_l       : std_logic is io_im_l(6);   -- Posibus
	alias im_07_l       : std_logic is io_im_l(7);   -- Posibus
	alias im_08_l       : std_logic is io_im_l(8);   -- Posibus
	alias im_09_l       : std_logic is io_im_l(9);   -- Posibus
--	alias im_10_l       : std_logic is io_im_l(10);   -- Posibus
	alias im_11_l       : std_logic is io_im_l(11);   -- Posibus
	alias io_bac_00     : std_logic is io_bac(0);   -- Posibus (Data Out)
	alias io_bac_01     : std_logic is io_bac(1);   -- Posibus
	alias io_bac_02     : std_logic is io_bac(2);   -- Posibus
	alias io_bac_03     : std_logic is io_bac(3);   -- Posibus
	alias io_bac_04     : std_logic is io_bac(4);   -- Posibus
	alias io_bac_05     : std_logic is io_bac(5);   -- Posibus
	alias io_bac_06     : std_logic is io_bac(6);   -- Posibus
	alias io_bac_07     : std_logic is io_bac(7);   -- Posibus
	alias io_bac_08     : std_logic is io_bac(8);   -- Posibus
	alias io_bac_09     : std_logic is io_bac(9);   -- Posibus
	alias io_bac_10     : std_logic is io_bac(10);   -- Posibus
	alias io_bac_11     : std_logic is io_bac(11);   -- Posibus
	alias io_bmb_00     : std_logic is io_bmb(0);   -- Posibus (Instruction Decode)
	alias io_bmb_01     : std_logic is io_bmb(1);   -- Posibus
	alias io_bmb_02     : std_logic is io_bmb(2);   -- Posibus
	alias io_bmb_03     : std_logic is io_bmb(3);   -- Posibus
	alias io_bmb_04     : std_logic is io_bmb(4);   -- Posibus
	alias io_bmb_05     : std_logic is io_bmb(5);   -- Posibus
	alias io_bmb_06     : std_logic is io_bmb(6);   -- Posibus
	alias io_bmb_07     : std_logic is io_bmb(7);   -- Posibus
	alias io_bmb_08     : std_logic is io_bmb(8);   -- Posibus
	alias io_bmb_08_l   : std_logic is io_bmb_l(8);   -- Posibus
	alias io_bmb_09     : std_logic is io_bmb(9);   -- Posibus
	alias io_bmb_10     : std_logic is io_bmb(10);   -- Posibus
	alias io_bmb_11     : std_logic is io_bmb(11);   -- Posibus
	-- I count 21 signals for Data Break.
	signal db_00_l      : std_logic := 'H';   -- Data Break (Data)
	signal db_01_l      : std_logic := 'H';   -- Data Break
	signal db_02_l      : std_logic := 'H';   -- Data Break
	signal db_03_l      : std_logic := 'H';   -- Data Break
	signal db_04_l      : std_logic := 'H';   -- Data Break
	signal db_05_l      : std_logic := 'H';   -- Data Break
	signal db_06_l      : std_logic := 'H';   -- Data Break
	signal db_07_l      : std_logic := 'H';   -- Data Break
	signal db_08_l      : std_logic := 'H';   -- Data Break
	signal db_09_l      : std_logic := 'H';   -- Data Break
	signal db_10_l      : std_logic := 'H';   -- Data Break
	signal db_11_l      : std_logic := 'H';   -- Data Break
	alias ea_00_l       : std_logic is db_ea_l(0);   -- Data Break (Extended Address)
	alias ea_01_l       : std_logic is db_ea_l(1);   -- Data Break (Rest of the address
	alias ea_02_l       : std_logic is db_ea_l(2);   -- Data Break  is hard-wired.)

    signal addr_acc : std_logic;
    signal addr_acc_l : std_logic;
    signal b_brk : std_logic;
    signal b_brk_l : std_logic;
    signal b_run : std_logic;
    signal b_xsta : std_logic;
    signal bac_00 : std_logic;
    signal bac_00_l : std_logic;
    signal bac_01 : std_logic;
    signal bac_01_l : std_logic;
    signal bac_02 : std_logic;
    signal bac_02_l : std_logic;
    signal bac_03 : std_logic;
    signal bac_03_l : std_logic;
    signal bac_04 : std_logic;
    signal bac_04_l : std_logic;
    signal bac_05 : std_logic;
    signal bac_05_l : std_logic;
    signal bac_06 : std_logic;
    signal bac_06_l : std_logic;
    signal bac_07 : std_logic;
    signal bac_07_l : std_logic;
    signal bac_08 : std_logic;
    signal bac_08_l : std_logic;
    signal bac_09 : std_logic;
    signal bac_09_l : std_logic;
--  signal bac_10 : std_logic;
    signal bac_10_l : std_logic;
--  signal bac_11 : std_logic;
    signal bac_11_l : std_logic;
    signal blk_in_sync : std_logic;
    signal blk_in_sync_l : std_logic;
    signal bmb_00 : std_logic;
    signal bmb_00_l : std_logic;
    signal bmb_01 : std_logic;
    signal bmb_01_l : std_logic;
    signal bmb_02 : std_logic;
    signal bmb_02_l : std_logic;
    signal bmb_03 : std_logic;
    signal bmb_03_l : std_logic;
    signal bmb_04 : std_logic;
    signal bmb_04_l : std_logic;
    signal bmb_05 : std_logic;
    signal bmb_05_l : std_logic;
    signal bmb_06 : std_logic;
    signal bmb_06_l : std_logic;
    signal bmb_07 : std_logic;
    signal bmb_07_l : std_logic;
    signal bmb_08 : std_logic;
    signal bmb_08_l : std_logic;
    signal bmb_09 : std_logic;
    signal bmb_09_l : std_logic;
    signal bmb_10 : std_logic;
    signal bmb_10_l : std_logic;
    signal bmb_11 : std_logic;
    signal bmb_11_l : std_logic;
    signal bmb_to_dtb : std_logic;
    signal bmr00 : std_logic;
    signal bmr00_l : std_logic;
    signal bmr01 : std_logic;
    signal bmr01_l : std_logic;
    signal c00_l : std_logic;
    signal c01_l : std_logic;
    signal ck01 : std_logic;
    signal ck01_l : std_logic;
    signal clr_df_l : std_logic;
    signal clr_dtf_l : std_logic;
    signal comp_or_sh : std_logic;
    signal csta_l : std_logic;
    signal data_l : std_logic;
    signal df_l : std_logic;
    signal dtb_00_l : std_logic;
    signal dtb_01_l : std_logic;
    signal dtb_02_l : std_logic;
    signal dtb_03_l : std_logic;
    signal dtb_04_l : std_logic;
    signal dtb_05_l : std_logic;
    signal dtb_06_l : std_logic;
    signal dtb_07_l : std_logic;
    signal dtb_08_l : std_logic;
    signal dtb_09_l : std_logic;
    signal dtb_10_l : std_logic;
    signal dtb_11_l : std_logic;
    signal dtf_l : std_logic;
    signal dtsf : std_logic;
--  signal dtsf_l : std_logic;
    signal ef_l : std_logic;
    signal end_l : std_logic;
    signal eni_l : std_logic;
    signal fr_00_l : std_logic;
    signal fr_01_l : std_logic;
    signal fr_02_l : std_logic;
    signal fr_03_l : std_logic;
    signal int_rq_l : std_logic;
    signal ldmf : std_logic;
    signal ldmf_l : std_logic;
    signal lpb_00_l : std_logic;
    signal lpb_01_l : std_logic;
    signal lpb_02_l : std_logic;
    signal lpb_03_l : std_logic;
    signal lpb_04_l : std_logic;
    signal lpb_05_l : std_logic;
    signal lpb_not_eq_1 : std_logic;
    signal lpb_to_dtb : std_logic;
    signal mb_to_dtb_l : std_logic;
    signal mc00_l : std_logic;
    signal mc01_l : std_logic;
    signal mc02_l : std_logic;
    signal mf00_l : std_logic;
    signal mf01_l : std_logic;
    signal mf02_l : std_logic;
    signal mk_blk_end : std_logic;
    signal mk_blk_end_l : std_logic;
    signal mk_blk_mk : std_logic;
    signal mk_blk_start_l : std_logic;
    signal mk_data_l : std_logic;
    signal mk_end : std_logic;
    signal mk_end_l : std_logic;
    signal mkt_l : std_logic;
    signal mktk_l : std_logic;
    signal move_l : std_logic;
    signal mr00_l : std_logic;
    signal mr01_l : std_logic;
    signal n01_l : std_logic;
    signal n02_l : std_logic;
    signal n03_l : std_logic;
    signal n04_l : std_logic;
    signal n05_l : std_logic;
    signal n06_l : std_logic;
    signal n07_l : std_logic;
    signal n0_to_ac_l : std_logic;
    signal n0_to_dtb : std_logic;
    signal n0_to_dtb_l : std_logic;
    signal n0_to_ef : std_logic;
    signal n0_to_ef_l : std_logic;
    signal n0_to_lpb_l : std_logic;
    signal n0_to_sta : std_logic;
    signal n0_to_sta_l : std_logic;
    signal n0_to_state_l : std_logic;
    signal n0_to_w_l : std_logic;
    signal n1_to_df : std_logic;
    signal n1_to_dtf : std_logic;
    signal n76 : std_logic;
    signal n76_l : std_logic;
    signal n76_or_77 : std_logic;
    signal n77 : std_logic;
    signal n77_l : std_logic;
    signal n_1 : std_logic;
    signal n_10 : std_logic;
    signal n_100 : std_logic;
    signal n_101 : std_logic;
    signal n_103 : std_logic;
    signal n_104 : std_logic;
    signal n_105 : std_logic;
    signal n_106 : std_logic;
    signal n_107 : std_logic;
    signal n_108 : std_logic;
    signal n_109 : std_logic;
    signal n_11 : std_logic;
    signal n_111 : std_logic;
    signal n_112 : std_logic;
    signal n_113 : std_logic;
    signal n_114 : std_logic;
    signal n_115 : std_logic;
    signal n_116 : std_logic;
    signal n_117 : std_logic;
    signal n_118 : std_logic;
    signal n_119 : std_logic;
    signal n_124 : std_logic;
    signal n_125 : std_logic;
    signal n_128 : std_logic;
    signal n_129 : std_logic;
    signal n_132 : std_logic;
    signal n_137 : std_logic;
    signal n_138 : std_logic;
    signal n_139 : std_logic;
    signal n_142 : std_logic;
    signal n_146 : std_logic;
    signal n_147 : std_logic;
    signal n_148 : std_logic;
    signal n_153 : std_logic;
    signal n_155 : std_logic;
    signal n_16 : std_logic;
    signal n_161 : std_logic;
    signal n_162 : std_logic;
    signal n_185 : std_logic;
    signal n_193 : std_logic;
    signal n_2 : std_logic;
    signal n_28 : std_logic;
    signal n_3 : std_logic;
    signal n_31 : std_logic;
    signal n_32 : std_logic;
    signal n_33 : std_logic;
    signal n_35 : std_logic;
    signal n_36 : std_logic;
    signal n_38 : std_logic;
    signal n_39 : std_logic;
    signal n_42 : std_logic;
    signal n_43 : std_logic;
    signal n_44 : std_logic;
    signal n_45 : std_logic;
    signal n_46 : std_logic;
    signal n_47 : std_logic;
    signal n_48 : std_logic;
    signal n_49 : std_logic;
    signal n_50 : std_logic;
    signal n_51 : std_logic;
    signal n_52 : std_logic;
    signal n_53 : std_logic;
    signal n_54 : std_logic;
    signal n_55 : std_logic;
    signal n_56 : std_logic;
    signal n_58 : std_logic;
    signal n_59 : std_logic;
    signal n_60 : std_logic;
    signal n_61 : std_logic;
    signal n_62 : std_logic;
    signal n_63 : std_logic;
    signal n_64 : std_logic;
    signal n_65 : std_logic;
    signal n_66 : std_logic;
    signal n_7 : std_logic;
    signal n_70 : std_logic;
    signal n_71 : std_logic;
    signal n_72 : std_logic;
    signal n_73 : std_logic;
    signal n_76 : std_logic;
    signal n_77 : std_logic;
    signal n_78 : std_logic;
    signal n_79 : std_logic;
    signal n_81 : std_logic;
    signal n_82 : std_logic;
    signal n_83 : std_logic;
    signal n_84 : std_logic;
    signal n_85 : std_logic;
    signal n_86 : std_logic;
    signal n_91 : std_logic;
    signal n_92 : std_logic;
    signal n_93 : std_logic;
    signal n_94 : std_logic;
    signal n_95 : std_logic;
    signal n_96 : std_logic;
    signal n_97 : std_logic;
    signal n_99 : std_logic;
    signal par_l : std_logic;
    signal pc_or_es : std_logic;
    signal pc_or_es_l : std_logic;
--  signal pwr_clr : std_logic;
    signal pwr_clr_l : std_logic;
    signal rd_en : std_logic;
    signal rd_en_lpb_00_02 : std_logic;
    signal rd_en_lpb_03_05 : std_logic;
    signal rd_or_wd : std_logic;
    signal read_all_l : std_logic;
    signal read_data : std_logic;
    signal read_data_l : std_logic;
    signal rsta : std_logic;
    signal rsta_l : std_logic;
    signal rstb : std_logic;
    signal rstb_l : std_logic;
    signal se_l : std_logic;
    signal search : std_logic;
    signal search_l : std_logic;
    signal sel_l : std_logic;
    signal sh_dtb : std_logic;
    signal sh_en : std_logic;
    signal sh_en_l : std_logic;
    signal sh_st : std_logic;
    signal sh_st_b : std_logic;
    signal shift_ck : std_logic;
    signal skp_rq_l : std_logic;
    signal st_blk_mk_l : std_logic;
    signal st_ck_0p : std_logic;
    signal st_ck_l : std_logic;
    signal st_data : std_logic;
--  signal st_data_l : std_logic;
    signal st_final_l : std_logic;
    signal st_idle_l : std_logic;
--  signal st_rev_ck_l : std_logic;
    signal swtm_l : std_logic;
    signal sync : std_logic;
    signal sync_en : std_logic;
    signal sync_p_l : std_logic;
    signal t3 : std_logic;
    signal tim_l : std_logic;
    signal tp00_a : std_logic;
    signal tp00_l : std_logic;
    signal tp01_a : std_logic;
    signal tp01_l : std_logic;
    signal usr_00_l : std_logic;
    signal usr_01_l : std_logic;
    signal usr_02_l : std_logic;
    signal uts_l : std_logic;
--  signal w_inh : std_logic;
    signal w_inh_l : std_logic;
    signal w_or_uts : std_logic;
    signal wc0 : std_logic;
    signal wc0_l : std_logic;
    signal wc_l : std_logic;
    signal wr_en_l : std_logic;
    signal write_all : std_logic;
    signal write_data : std_logic;
    signal write_data_l : std_logic;
    signal write_ok_l : std_logic;
    signal write_ok_or_uts : std_logic;
    signal wrtm : std_logic;
    signal wrtm_l : std_logic;
    signal wrtm_or_fr03 : std_logic;
    signal xor_to_lpb : std_logic;
    signal xsa_dy : std_logic;
    signal xsad : std_logic;
--  signal mk_blk_mk_l : std_logic;
    signal mk_blk_start : std_logic;
--  signal mk_blk_sync : std_logic;
--  signal mk_blk_sync_l : std_logic;
    signal mk_data : std_logic;
--  signal mk_data_sync : std_logic;
--  signal mk_data_sync_l : std_logic;
    signal move : std_logic;
    signal n00 : std_logic;
    signal n00_l : std_logic;
    signal n01 : std_logic;
    signal n02 : std_logic;
    signal n03 : std_logic;
    signal n04 : std_logic;
    signal n05 : std_logic;
    signal n06 : std_logic;
    signal n07 : std_logic;
    signal read_all : std_logic;
    signal se : std_logic;
--  signal sync_l : std_logic;
--  signal w01_w05 : std_logic;
--  signal write_all_l : std_logic;
--  signal st_dev_ck : std_logic;
    signal w1w5 : std_logic;
begin
    posidm: posidmux port map(
			  pd_l,
			  mx_h,
      	  io_bac,
	        io_bmb,
   	     io_bmb_l,
      	  io_p1,
	        io_p2,
   	     io_p4,
      	  io_ts03,
	        io_b_run,
   	     io_pwr_clr,
	   	  io_im_l,
	        io_int_rq_l,
   	     io_skp_rq_l,
      	  io_0_to_ac_l,
   	     db_addr_acc_l,
      	  db_bwc0_l,
	        db_b_brk,
	        db_ea_l,
	        db_brk_rq_l,
	        db_data_in,
	        db_1_to_ca_inh_l,
	        db_data_l
	 );
	 db_data_l <= db_00_l&db_01_l&db_02_l&db_03_l&db_04_l&db_05_l&
	              db_06_l&db_07_l&db_08_l&db_09_l&db_10_l&db_11_l
			when mx_h = PD_BRK and db_data_in = '0'
	 else "ZZZZZZZZZZZZ";

-- a08: m206
    a08ff1: latch74 port map(mk_end, tp00, n0_to_ef_l, xsa_dy, end_h, end_l);
    a08ff2: latch74 port map(n_83, xsa_dy, n0_to_ef_l, '1', sel, sel_l);
    a08ff3: latch74 port map(dtf, n1_to_df, n0_to_ef_l, n_132, tim, tim_l);
    a08ff4: latch74 port map(n_107, mc01, '1', n0_to_ef_l, mktk_l, mktk);
    a08ff5: latch74 port map(n_125, n_128, '1', n0_to_ef_l, par_l, par);
    a08ff6: latch74 port map('0', write_all, '1', n_33, w_inh_l);
-- a09: m117
    n_105 <= not (mk_blk_start_l and mk_data_l and mk_blk_end_l and mk_end_l) after tpd;
    n_83 <= not (n_35 and se_l and n_46 and single_unit) after tpd;
    n_138 <= not (st_blk_mk_l and st_idle_l and rd_or_wd and xsad) after tpd;
    n_107 <= not (st_blk_mk_l and st_idle_l and move_l and n_106) after tpd;
    n_161 <= not (mktk_l and tim_l and end_l and sel_l) after tpd;
    n_114 <= not (write_data and st_final and mk_blk_end and n_111) after tpd;
-- a10: m113
    n_84 <= not (blk_in_sync_l and n_85) after tpd;
    n_85 <= not (n_84 and uts) after tpd;
    n_46 <= not (fr_01 and write_ok_l) after tpd;
    n_125 <= not (read_data and lpb_not_eq_1) after tpd;
    n_124 <= not (st_ck and mc00_l) after tpd;
    n_153 <= not (bac_10_l and b_xsta) after tpd;
    n0_to_ef <= not (pwr_clr_l and n_153) after tpd;
    n0_to_sta <= not (csta_l and pwr_clr_l) after tpd;
    n_139 <= not (df and sh_dtb) after tpd;
    n_137 <= not (n_139 and n_138) after tpd;
-- a11: m111
    n_106 <= not n_105 after tpd;
    n_128 <= not n_124 after tpd;
    n_132 <= not n_137 after tpd;
    n_162 <= not n_161 after tpd;
	 n0_to_dtb <= not n0_to_dtb_l after tpd;
    n0_to_ef_l <= not n0_to_ef after tpd;
    ef_l <= not ef after tpd;
    pc_or_es_l <= not pc_or_es after tpd;
    xsad <= not xsad_l after tpd;
    n0_to_sta_l <= not n0_to_sta after tpd;
    sh_en <= not sh_en_l after tpd;
    m_stop_l <= not n_3 after tpd;
    tp0_xtlk_dy_l <= not n_23 after tpd;
    clr_df_l <= not n_58 after tpd;
    lpb_to_dtb <= not n_114 after tpd;
    tp1_xtlk_dy_l <= not n_22 after tpd;
-- a12: m113
    pc_or_es <= not (pwr_clr_l and n_162) after tpd;
    ef <= not (n_162 and par_l) after tpd;
    int_rq_l <= not (eni and n_7) after tpd;
    n_7 <= not (ef and dtf) after tpd;
    skp_rq_l <= not (n_7 and dtsf) after tpd;
    n_66 <= not (comp_or_sh and sh_en) after tpd;
    n_64 <= not (fr_01_l and tp01) after tpd;
    n_43 <= not (c00 and c01) after tpd;
    n_45 <= not (c00_l and c01_l) after tpd;
    sh_en_l <= not (n_43 and n_45) after tpd;
-- a15: m627
    tp00_l <= not (w_or_uts and tp1_xtlk_dy_l and n_16 and n_16) after tpd;
    tp00 <= not (tp00_l and tp00_l and tp00_l and tp00_l) after tpd;
    tp00_a <= not (tp00_a_l and tp00_a_l and tp00_a_l and tp00_a_l) after tpd;
    tp01_l <= not (n_31 and n_31 and tp0_xtlk_dy_l and w_or_uts) after tpd;
    tp01 <= not (tp01_l and tp01_l and tp01_l and tp01_l) after tpd;
    tp01_a <= not (tp01_a_l and tp01_a_l and tp01_a_l and tp01_a_l) after tpd;
-- a23: m633 -- NB: This is supposed to be a negative OC output, so these better go offchip!
--     (There will need to be an NPN transistor to GND on them.)
    t_go_l <= bmr01_l after tpd;
    t_stop_l <= bmr01 after tpd;
    t_fwd_l <= bmr00 after tpd;
    t_rev_l <= bmr00_l after tpd;
    t_pwr_clr_l <= pwr_clr_l after tpd;
    t_01_l <= n01_l after tpd;
    t_02_l <= n02_l after tpd;
    t_03_l <= n03_l after tpd;
    t_04_l <= n04_l after tpd;
    t_05_l <= n05_l after tpd;
    t_06_l <= n06_l after tpd;
    t_07_l <= n07_l after tpd;
-- b02: m623
-- NB: These are supposed to be OC outputs!
-- TODO: Check M623 outputs for suitable pull-up specifications.
    db_00_l <= 'Z' when (dtb_00_l or b_brk_l) = '1' else '0' after tpd;
    db_01_l <= 'Z' when (dtb_01_l or b_brk_l) = '1' else '0' after tpd;
    db_02_l <= 'Z' when (dtb_02_l or b_brk_l) = '1' else '0' after tpd;
    db_03_l <= 'Z' when (dtb_03_l or b_brk_l) = '1' else '0' after tpd;
    db_04_l <= 'Z' when (dtb_04_l or b_brk_l) = '1' else '0' after tpd;
    db_05_l <= 'Z' when (dtb_05_l or b_brk_l) = '1' else '0' after tpd;
    db_06_l <= 'Z' when (dtb_06_l or b_brk_l) = '1' else '0' after tpd;
    db_07_l <= 'Z' when (dtb_07_l or b_brk_l) = '1' else '0' after tpd;
    db_08_l <= 'Z' when (dtb_08_l or b_brk_l) = '1' else '0' after tpd;
    db_09_l <= 'Z' when (dtb_09_l or b_brk_l) = '1' else '0' after tpd;
    db_10_l <= 'Z' when (dtb_10_l or b_brk_l) = '1' else '0' after tpd;
    db_11_l <= 'Z' when (dtb_11_l or b_brk_l) = '1' else '0' after tpd;
-- b03: m623
-- NB: These are supposed to be OC outputs!
    im_00_l <= 'Z' when (usr_00_l or rsta_l) = '1' else '0' after tpd;
    im_01_l <= 'Z' when (usr_01_l or rsta_l) = '1' else '0' after tpd;
    im_02_l <= 'Z' when (usr_02_l or rsta_l) = '1' else '0' after tpd;
    im_03_l <= 'Z' when (mr00_l   or rsta_l) = '1' else '0' after tpd;
    im_04_l <= 'Z' when (mr01_l   or rsta_l) = '1' else '0' after tpd;
    im_05_l <= 'Z' when (fr_00_l  or rsta_l) = '1' else '0' after tpd;
    im_06_l <= 'Z' when (fr_01_l  or rsta_l) = '1' else '0' after tpd;
    im_07_l <= 'Z' when (fr_02_l  or rsta_l) = '1' else '0' after tpd;
    im_08_l <= 'Z' when (fr_03_l  or rsta_l) = '1' else '0' after tpd;
    im_09_l <= 'Z' when (eni_l    or rsta_l) = '1' else '0' after tpd;
-- b04: m623
-- NB: These are supposed to be OC outputs!
    im_00_l <= 'Z' when (ef_l   or rstb_l) = '1' else '0' after tpd;
    im_01_l <= 'Z' when (mktk_l or rstb_l) = '1' else '0' after tpd;
    im_02_l <= 'Z' when (end_l  or rstb_l) = '1' else '0' after tpd;
    im_03_l <= 'Z' when (sel_l  or rstb_l) = '1' else '0' after tpd;
    im_04_l <= 'Z' when (par_l  or rstb_l) = '1' else '0' after tpd;
    im_05_l <= 'Z' when (tim_l  or rstb_l) = '1' else '0' after tpd;
    im_06_l <= 'Z' when (mf00_l or rstb_l) = '1' else '0' after tpd;
    im_07_l <= 'Z' when (mf01_l or rstb_l) = '1' else '0' after tpd;
    im_08_l <= 'Z' when (mf02_l or rstb_l) = '1' else '0' after tpd;
    im_11_l <= 'Z' when (dtf_l  or rstb_l) = '1' else '0' after tpd;
-- b05: m623
-- NB: These are supposed to be OC outputs!
    db_brk_rq_l  <= 'Z' when df_l         = '1' else '0' after tpd;
    io_int_rq_l  <= 'Z' when int_rq_l     = '1' else '0' after tpd;
    io_skp_rq_l  <= 'Z' when skp_rq_l     = '1' else '0' after tpd;
    io_0_to_ac_l <= 'Z' when n0_to_ac_l   = '1' else '0' after tpd;
    ea_00_l      <= 'Z' when mf00_l       = '1' else '0' after tpd;
    ea_01_l      <= 'Z' when mf01_l       = '1' else '0' after tpd;
    ea_02_l      <= 'Z' when mf02_l       = '1' else '0' after tpd;
    db_data_in   <= 'Z' when fr_01_l      = '1' else '0' after tpd;
    db_1_to_ca_inh_l <= 'Z' when search_l = '1' else '0' after tpd;
-- b06: m111
    bac_00 <= not bac_00_l after tpd;
    bac_01 <= not bac_01_l after tpd;
    bac_02 <= not bac_02_l after tpd;
    bac_03 <= not bac_03_l after tpd;
    bac_04 <= not bac_04_l after tpd;
    bac_05 <= not bac_05_l after tpd;
    bac_06 <= not bac_06_l after tpd;
    bac_07 <= not bac_07_l after tpd;
    bac_08 <= not bac_08_l after tpd;
    bac_09 <= not bac_09_l after tpd;
--  bac_10 <= not bac_10_l after tpd;
--  bac_11 <= not bac_11_l after tpd;
    swtm_l <= not swtm after tpd;
    n0_to_ac_l <= not n_1 after tpd;
-- b07: m207
    b07ff1: jk73 port map(bac_00, bac_00, xsta, n0_to_sta_l, usr_00, usr_00_l);
    b07ff2: jk73 port map(bac_01, bac_01, xsta, n0_to_sta_l, usr_01, usr_01_l);
    b07ff3: jk73 port map(bac_02, bac_02, xsta, n0_to_sta_l, usr_02, usr_02_l);
    b07ff4: jk73 port map(bac_03, bac_03, xsta, n0_to_sta_l, mr00, mr00_l);
    b07ff5: jk73 port map(bac_05, bac_05, xsta, n0_to_sta_l, fr_00, fr_00_l);
    b07ff6: jk73 port map(bac_06, bac_06, xsta, n0_to_sta_l, fr_01, fr_01_l);
-- b08: m113
    n_97 <= not (bmb_to_dtb and bmb_06) after tpd;
    n_112 <= not (bmb_to_dtb and bmb_07) after tpd;
    n_92 <= not (bmb_to_dtb and bmb_11) after tpd;
    n_73 <= not (bmb_to_dtb and bmb_09) after tpd;
    n_91 <= not (bmb_to_dtb and bmb_10) after tpd;
    n_113 <= not (bmb_to_dtb and bmb_08) after tpd;
    wrtm_or_fr03 <= not (wrtm_l and fr_03_l) after tpd;
    rd_or_wd <= not (read_data_l and write_data_l) after tpd;
    n_1 <= not (ldmf_l and xsta_l) after tpd;
    n_58 <= not (addr_acc_l and pwr_clr_l) after tpd;
-- b09: m206
    b09ff1: latch74 port map(dtb_09, sh_dtb, n0_to_dtb_l, n_97, dtb_06, dtb_06_l);
    b09ff2: latch74 port map(rdd_02, sh_dtb, n0_to_dtb_l, n_92, dtb_11, dtb_11_l);
    b09ff3: latch74 port map(dtb_11, sh_dtb, n0_to_dtb_l, n_113, dtb_08, dtb_08_l);
    b09ff4: latch74 port map(rdd_00, sh_dtb, n0_to_dtb_l, n_73, dtb_09, dtb_09_l);
    b09ff5: latch74 port map(rdd_01, sh_dtb, n0_to_dtb_l, n_91, dtb_10, dtb_10_l);
    b09ff6: latch74 port map(dtb_10, sh_dtb, n0_to_dtb_l, n_112, dtb_07, dtb_07_l);
-- b10: m627
    sh_dtb <= not (n_66 and n_64) after tpd;
    n0_to_dtb_l <= not (n_77 and tp00_a and c01 and n_78) after tpd;
    n_33 <= not (wc and tp00 and c01_l and mkt_l) after tpd;
    sync_p_l <= not (sync and tp00) after tpd;
    b_brk_l <= not (b_brk) after tpd;
-- b11: m115
    n_56 <= not (wrtm and swtm and write_ok) after tpd;
    n_77 <= not (n_70 and wr_en_l and n_72) after tpd;
    n_72 <= not (wc and w_inh_l and write_all) after tpd;
    n_70 <= not (mc01_l and write_data and st_rev_ck) after tpd;
    n_47 <= not (n_55 and n_49 and n_56) after tpd;
    sync_en <= not (read_data_l and search_l and n_86) after tpd;
    n_3 <= not (b_run and n0_to_sta_l and pc_or_es_l) after tpd;
    n_82 <= not (mc00_l and mc02 and c01) after tpd;
-- b12: m117
    n_55 <= not (st_data and write_data and dtf_l and write_ok_or_uts) after tpd;
    n_49 <= not (write_all and w_inh_l and df_l and write_ok_or_uts) after tpd;
    n_48 <= not (n_10 and data_l and write_data and n_11) after tpd;
    n_62 <= not (rd_or_wd and fr_00 and wc_l and st_ck_0p) after tpd;
    n1_to_dtf <= not (n_60 and n_28 and n_61 and n_62) after tpd;
    n_51 <= not (c00 and mkt and tp01_a and n_44) after tpd;
-- b13: m206
    b13ff1: latch74 port map(mc02_l, tp00, sync_p_l, '1', mc00, mc00_l);
    b13ff2: latch74 port map(mc00, tp00, sync_p_l, '1', mc01, mc01_l);
    b13ff3: latch74 port map(mc01, tp00, sync_p_l, '1', mc02, mc02_l);
    b13ff4: latch74 port map(c01_l, tp01_l, sync_p_l, n_63, c01, c01_l);
    b13ff5: latch74 port map(c00_l, tp00_l, sync_p_l, '1', c00, c00_l);
    b13ff6: latch74 port map(mkt_l, c00_l, sync_p_l, '1', mkt, mkt_l);
-- b14: m206
    b14ff1: latch74 port map(mr01_l, xsa_dy, '1', '1', bmr01_l, bmr01);
    b14ff4: latch74 port map(mr00, xsa_dy, '1', '1', bmr00, bmr00_l);
    b14ff5: latch74 port map(ck01, n_17, '1', '1', ck00, ck00_l);
    b14ff6: latch74 port map(ck00_l, n_17, '1', '1', ck01, ck01_l);
-- c01: m101
    b_run <= io_b_run after tpd;
    b_brk <= db_b_brk after tpd;
    wc0 <= db_bwc0_l after tpd;
-- c02: m101
    bmb_00_l <= io_bmb_00 after tpd;
    bmb_01_l <= io_bmb_01 after tpd;
    bmb_02_l <= io_bmb_02 after tpd;
    bmb_03_l <= io_bmb_03 after tpd;
    bmb_04_l <= io_bmb_04 after tpd;
    bmb_05_l <= io_bmb_05 after tpd;
    bmb_06_l <= io_bmb_06 after tpd;
    bmb_07_l <= io_bmb_07 after tpd;
    bmb_08_l <= io_bmb_08 after tpd;
    bmb_09_l <= io_bmb_09 after tpd;
    bmb_10_l <= io_bmb_10 after tpd;
    bmb_11_l <= io_bmb_11 after tpd;
    addr_acc <= db_addr_acc_l after tpd;
-- c03: m101
    bac_00_l <= io_bac_00 and n76_or_77 after tpd;
    bac_01_l <= io_bac_01 and n76_or_77 after tpd;
    bac_02_l <= io_bac_02 and n76_or_77 after tpd;
    bac_03_l <= io_bac_03 and n76_or_77 after tpd;
    bac_04_l <= io_bac_04 and n76_or_77 after tpd;
    bac_05_l <= io_bac_05 and n76_or_77 after tpd;
    bac_06_l <= io_bac_06 and n76_or_77 after tpd;
    bac_07_l <= io_bac_07 and n76_or_77 after tpd;
    bac_08_l <= io_bac_08 and n76_or_77 after tpd;
    bac_09_l <= io_bac_09 and n76_or_77 after tpd;
    bac_10_l <= io_bac_10 and n76_or_77 after tpd;
    bac_11_l <= io_bac_11 and n76_or_77 after tpd;
-- c04: m103
    n76 <= (io_bmb_03 and io_bmb_04 and io_bmb_05 and io_bmb_06 and io_bmb_07 and io_bmb_08_l) after tpd;
    rsta <= n76 and io_p1;
    csta <= n76 and io_p2;
    xsta <= n76 and io_p4;
    rsta_l <= not rsta after tpd;
    csta_l <= not csta after tpd;
    xsta_l <= not xsta after tpd;
    ts03_l <= not (io_ts03) after tpd;
-- c05: m103
    n77 <= (io_bmb_03 and io_bmb_04 and io_bmb_05 and io_bmb_06 and io_bmb_07 and io_bmb_08) after tpd;
    dtsf <= n77 and io_p1;
    rstb <= n77 and io_p2;
    ldmf <= n77 and io_p4;
--  dtsf_l <= not dtsf after tpd;
    rstb_l <= not rstb after tpd;
    ldmf_l <= not ldmf after tpd;
    pwr_clr_l <= not (io_pwr_clr) after tpd;
-- c06: m111
    bmb_00 <= not bmb_00_l after tpd;
    bmb_01 <= not bmb_01_l after tpd;
    bmb_02 <= not bmb_02_l after tpd;
    bmb_03 <= not bmb_03_l after tpd;
    bmb_04 <= not bmb_04_l after tpd;
    bmb_05 <= not bmb_05_l after tpd;
    bmb_06 <= not bmb_06_l after tpd;
    bmb_07 <= not bmb_07_l after tpd;
    bmb_08 <= not bmb_08_l after tpd;
    bmb_09 <= not bmb_09_l after tpd;
    bmb_10 <= not bmb_10_l after tpd;
    bmb_11 <= not bmb_11_l after tpd;
    wc0_l <= not wc0 after tpd;
--  pwr_clr <= not pwr_clr_l after tpd;
    n76_l <= not n76 after tpd;
    n77_l <= not n77 after tpd;
-- c07: m207
    c07ff1: jk73 port map(bac_07, bac_07, xsta, n0_to_sta_l, fr_02, fr_02_l);
    c07ff2: jk73 port map(bac_08, bac_08, xsta, n0_to_sta_l, fr_03, fr_03_l);
    c07ff3: jk73 port map(bac_09, bac_09, xsta, n0_to_sta_l, eni, eni_l);
    c07ff4: jk73 port map(bac_04, bac_04, xsta, m_stop_l, mr01, mr01_l);
-- c08: m121
    n_104 <= not ((bmb_to_dtb and bmb_03) or (lpb_to_dtb and lpb_03)) after tpd;
    n_146 <= not ((bmb_to_dtb and bmb_00) or (lpb_to_dtb and lpb_00)) after tpd;
    n_142 <= not ((bmb_to_dtb and bmb_04) or (lpb_to_dtb and lpb_04)) after tpd;
    n_148 <= not ((bmb_to_dtb and bmb_02) or (lpb_to_dtb and lpb_02)) after tpd;
    n_147 <= not ((bmb_to_dtb and bmb_01) or (lpb_to_dtb and lpb_01)) after tpd;
    n_129 <= not ((bmb_to_dtb and bmb_05) or (lpb_to_dtb and lpb_05)) after tpd;
-- c09: m206
    c09ff1: latch74 port map(dtb_03, sh_dtb, n0_to_dtb_l, n_146, dtb_00, dtb_00_l);
    c09ff2: latch74 port map(dtb_04, sh_dtb, n0_to_dtb_l, n_147, dtb_01, dtb_01_l);
    c09ff3: latch74 port map(dtb_05, sh_dtb, n0_to_dtb_l, n_148, dtb_02, dtb_02_l);
    c09ff4: latch74 port map(dtb_06, sh_dtb, n0_to_dtb_l, n_104, dtb_03, dtb_03_l);
    c09ff5: latch74 port map(dtb_07, sh_dtb, n0_to_dtb_l, n_142, dtb_04, dtb_04_l);
    c09ff6: latch74 port map(dtb_08, sh_dtb, n0_to_dtb_l, n_129, dtb_05, dtb_05_l);
-- c10: m121
    n_108 <= not ((rd_en_lpb_00_02 and xor_to_lpb) or (xor_to_lpb and wr_en)) after tpd;
    n_185 <= not ((sh_en and dtb_00) or (sh_en_l and wb00_l)) after tpd;
    n_35 <= not ((wrtm and swtm_l) or (wrtm_l and swtm)) after tpd;
    n_193 <= not ((sh_en and dtb_02) or (sh_en_l and wb02_l)) after tpd;
    n_155 <= not ((sh_en and dtb_01) or (sh_en_l and wb01_l)) after tpd;
    n_109 <= not ((rd_en_lpb_03_05 and xor_to_lpb) or (xor_to_lpb and wr_en)) after tpd;
-- c11: m113
    n_10 <= not (st_rev_ck and mc01_l) after tpd;
    n_11 <= not (st_final and mc01) after tpd;
    n_42 <= not (read_data and rd_en) after tpd;
    n_44 <= not (n_42 and read_all_l) after tpd;
    n_52 <= not (n_48 and n0_to_dtb) after tpd;
    n_54 <= not (search and blk_in_sync) after tpd;
    n_118 <= not (wr_en_l and tp01) after tpd;
    rd_en <= not (data_l and st_final_l) after tpd;
    n_65 <= not (b_xsta and bac_11_l) after tpd;
    n_59 <= not (n_65 and pwr_clr_l) after tpd;
-- c12: m115
    n_81 <= not (u_or_m_dy_l and mr01 and tm_en_l) after tpd;
    n1_to_df <= not (n_52 and n_51 and n_54) after tpd;
    n_60 <= not (fr_00_l and n1_to_df and wrtm_or_fr03) after tpd;
    n_28 <= not (fr_00_l and rd_or_wd and st_ck_0p) after tpd;
    n_117 <= not (wr_en and tp00_a and c01_l) after tpd;
    w_or_uts <= not (wr_en_l and tm_en_l and uts_l) after tpd;
    n_50 <= not (wrtm and swtm and u_or_m_dy_l) after tpd;
    n_61 <= not (wc_l and fr_00 and wrtm_or_fr03) after tpd;
-- c13: m111
    st_ck_0p <= not st_ck_0p_l after tpd;
    n_36 <= not n_47 after tpd;
--  st_rev_ck_l <= not st_rev_ck after tpd;
    data_l <= not data after tpd;
    st_final_l <= not st_final after tpd;
    st_blk_mk_l <= not st_blk_mk after tpd;
    st_ck_l <= not st_ck after tpd;
--  st_data_l <= not st_data after tpd;
    st_idle_l <= not st_idle after tpd;
    tm_en_l <= not tm_en after tpd;
    n_79 <= not n_81 after tpd;
    blk_in_sync <= not blk_in_sync_l after tpd;
    rd_en_lpb_03_05 <= not n_119 after tpd;
    clr_dtf_l <= not n_59 after tpd;
    rd_en_lpb_00_02 <= not n_116 after tpd;
-- c14: m206
    c14ff1: latch74 port map(n_185, comp_or_sh, '1', '1', wb00_l, wb00);
    c14ff2: latch74 port map(n_155, comp_or_sh, '1', '1', wb01_l, wb01);
    c14ff3: latch74 port map(n_193, comp_or_sh, '1', '1', wb02_l, wb02);
    c14ff4: latch74 port map(sp_dy_l, n_76, '1', n_79, uts_l, uts);
    c14ff5: latch74 port map(n_36, mkt_l, '1', pwr_clr_l, wr_en_l, wr_en);
-- c15: m113
    n_38 <= not (wr_en and tp01) after tpd;
    n_39 <= not (fr_01 and tp00) after tpd;
    comp_or_sh <= not (n_38 and n_39) after tpd;
    n_53 <= not (swtm and wr_en) after tpd;
    tm_en <= not (n_50 and n_53) after tpd;
    n_119 <= not (wr_en_l and c00) after tpd;
    n_116 <= not (wr_en_l and c00_l) after tpd;
    n_115 <= not (mkt and tp01_a) after tpd;
    n_76 <= not (uts_l and t_trk) after tpd;
-- c16: m627
    n0_to_w_l <= not (uts_l) after tpd;
    n0_to_state_l <= not (uts_l) after tpd;
    n_24 <= not (tm_en and ck01) after tpd;
    st_data <= not (data_l and st_ck_l and st_final_l) after tpd;
    sh_st_b <= not (n_2) after tpd;
    n_5 <= not (tm_en and ck01_l and ck01_l and ck01_l) after tpd;
-- c17: m111
    n_2 <= not sh_st after tpd;
    n_16 <= not n_15 after tpd;
    n_78 <= not n_71 after tpd;
    n_31 <= not n_30 after tpd;
    write_ok_or_uts <= not n_32 after tpd;
    shift_ck <= not n_82 after tpd;
    write_ok_l <= not write_ok after tpd;
    addr_acc_l <= not addr_acc after tpd;
    n_103 <= not n_108 after tpd;
    t3 <= not n_8 after tpd;
    n_111 <= not n_115 after tpd;
    n_101 <= not n_109 after tpd;
    xsa_dy <= not n_34 after tpd;
-- d08: m207
    d08ff1: jk73 port map(n_93, n_93, n_103, n0_to_lpb_l, lpb_00, lpb_00_l);
    d08ff2: jk73 port map(n_94, n_94, n_101, n0_to_lpb_l, lpb_03, lpb_03_l);
    d08ff3: jk73 port map(n_95, n_95, n_103, n0_to_lpb_l, lpb_01, lpb_01_l);
    d08ff4: jk73 port map(n_100, n_100, n_101, n0_to_lpb_l, lpb_04, lpb_04_l);
    d08ff5: jk73 port map(n_96, n_96, n_103, n0_to_lpb_l, lpb_02, lpb_02_l);
    d08ff6: jk73 port map(n_99, n_99, n_101, n0_to_lpb_l, lpb_05, lpb_05_l);
-- d09: m121
    n_94 <= not ((dtb_00 and wr_en) or (rdd_00 and rd_en_lpb_03_05)) after tpd;
    n_93 <= not ((wb00 and wr_en) or (rdd_00 and rd_en_lpb_00_02)) after tpd;
    n_100 <= not ((dtb_01 and wr_en) or (rdd_01 and rd_en_lpb_03_05)) after tpd;
    n_96 <= not ((wb02 and wr_en) or (rdd_02 and rd_en_lpb_00_02)) after tpd;
    n_95 <= not ((wb01 and wr_en) or (rdd_01 and rd_en_lpb_00_02)) after tpd;
    n_99 <= not ((dtb_02 and wr_en) or (rdd_02 and rd_en_lpb_03_05)) after tpd;
-- d10: m119
    blk_in_sync_l <= not (mk_blk_mk and mk_blk_mk and c00 and c01_l and mc00 and mc01_l and mc02_l and mkt_l) after tpd;
    n_67 <= not (bac_00_l and bac_01_l and bac_02_l and bac_03_l and bac_04_l) after tpd;
    lpb_not_eq_1 <= not (lpb_00_l and lpb_01_l and lpb_02_l and lpb_03_l and lpb_04_l and lpb_05_l and lpb_05_l and lpb_05_l) after tpd;
-- d11: m206
    d11ff1: latch74 port map(bac_06, ldmf, pwr_clr_l, '1', mf00, mf00_l);
    d11ff2: latch74 port map(bac_07, ldmf, pwr_clr_l, '1', mf01, mf01_l);
    d11ff3: latch74 port map(bac_08, ldmf, pwr_clr_l, '1', mf02, mf02_l);
    d11ff4: latch74 port map(wc_l, n1_to_df, '1', clr_df_l, df_l, df);
    d11ff5: latch74 port map('0', xsta, '1', wc0_l, wc, wc_l);
    d11ff6: latch74 port map('0', n1_to_dtf, '1', clr_dtf_l, dtf_l, dtf);
-- d12: m627
    b_xsta <= not (n_6 and n_6 and n_6 and n_6) after tpd;
    bmb_to_dtb <= not (mb_to_dtb_l and mb_to_dtb_l and mb_to_dtb_l and mb_to_dtb_l) after tpd;
    mb_to_dtb_l <= not (b_brk and t3 and t3 and fr_01) after tpd;
    n0_to_lpb_l <= not (mc02 and mc02 and st_rev_ck and st_rev_ck) after tpd;
    xor_to_lpb <= not (n_118 and n_118 and n_117 and n_117) after tpd;
    n76_or_77 <= not (n76_l and n76_l and n77_l and n77_l) after tpd;
-- a07: m161
    n00 <= (not(usr_00) and not(usr_01) and not(usr_02)) after tpd;
    n01 <= (not(usr_00) and not(usr_01) and     usr_02 ) after tpd;
    n02 <= (not(usr_00) and     usr_01  and not(usr_02)) after tpd;
    n03 <= (not(usr_00) and     usr_01  and     usr_02 ) after tpd;
    n04 <= (    usr_00  and not(usr_01) and not(usr_02)) after tpd;
    n05 <= (    usr_00  and not(usr_01) and     usr_02 ) after tpd;
    n06 <= (    usr_00  and     usr_01  and not(usr_02)) after tpd;
    n07 <= (    usr_00  and     usr_01  and     usr_02 ) after tpd;
    n00_l <= not n00;
    n01_l <= not n01;
    n02_l <= not n02;
    n03_l <= not n03;
    n04_l <= not n04;
    n05_l <= not n05;
    n06_l <= not n06;
    n07_l <= not n07;
-- b15: m113
    n_13 <= not (tm_en_l and t_trk_l) after tpd;
    n_63 <= not (c00_l and tp00) after tpd;
    n_71 <= not (mkt and fr_01) after tpd;
    n_32 <= not (uts and write_ok) after tpd;
    n_18 <= not (tm_en_l and t_trk) after tpd;
    n_86 <= not (n_85 and fr_03) after tpd;
-- b22: m633
-- NB: This is supposed to be a negative OC output, so it better go offchip!
--     (There will need to be an NPN transistor to GND on it.)
    t_00_l <= n00_l after tpd;
-- cd18: m228
    -- first, instantiate the w shift register.
    w9s: latch74 port map(rdmk, tp01, n0_to_w_l, '1', w09);
    w8s: latch74 port map(w09,  tp01, n0_to_w_l, '1', w08);
    w7s: latch74 port map(w08,  tp01, n0_to_state_l, '1', w07);
    w6s: latch74 port map(w07,  tp01, n0_to_state_l, '1', w06);
    w5s: latch74 port map(w06,  tp01, n0_to_w_l, '1', w05);
    w4s: latch74 port map(w05,  tp01, n0_to_state_l, '1', w04);
    w3s: latch74 port map(w04,  tp01, n0_to_w_l, '1', w03);
    w2s: latch74 port map(w03,  tp01, n0_to_w_l, '1', w02);
    w1s: latch74 port map('1', w02,  n0_to_w_l, '1', w01);
    w1w5 <= w01 and w05;

    -- instantiate the state decoder ring.
    s1: latch74 port map(st_idle,   sh_st_b, n0_to_state_l, '1', st_blk_mk);
    s2: latch74 port map(st_blk_mk, sh_st_b, n0_to_state_l, '1', st_rev_ck);
    s3: latch74 port map(st_rev_ck, sh_st_b, n0_to_state_l, '1', data);
    s4: latch74 port map(data,      sh_st_b, n0_to_state_l, '1', st_final);
    s5: latch74 port map(st_final,  sh_st_b, n0_to_state_l, '1', st_ck);
    s6: latch74 port map(st_ck,     sh_st_b, '1', n0_to_state_l, st_idle);

    -- now the and/nor gates for the shift clock.
    sh_st <= ((st_idle and blk_in_sync) or (st_blk_mk and mk_blk_start) or (mk_blk_start and st_rev_ck) or (data and mk_blk_end) or (mk_blk_end and st_final) or (st_ck and shift_ck)) and not(tp00_l);

    -- now the data decoder gates.
    mk_blk_start <= w01 and not(w03) and not(w04) and not(w05) and w06 and not(w07) and not(w08) and not(w09);
    mk_blk_start_l <= not mk_blk_start;

    mk_end <= w02 and not(w03) and not(w04) and not(w06) and not(w07) and w08 and not(w09) and w1w5;
    mk_end_l <= not mk_end;

    sync <= sync_en and w03 and not(w04) and not(w06) and w07 and not(w08) and w09 and w1w5;
--  sync_l <= not sync;

--  mk_data_sync <= not(w03) and not(w04) and w06 and not(w07) and not(w09) and w1w5 and w02 and w08;
--  mk_data_sync_l <= not mk_data_sync;

    mk_data <= not(w02) and not(w03) and w04 and w06 and not(w07) and not(w08) and w09 and w1w5;
    mk_data_l <= not mk_data;

    mk_blk_end <= w01 and not(w03) and w04 and not(w02) and w06 and not(w07) and w08 and w09;
    mk_blk_end_l <= not mk_blk_end;

    mk_blk_mk <= not(w02) and w03 and not(w04) and not(w02) and not(w06) and w07 and w08 and not(w09) and w1w5;
--  mk_blk_mk_l <= not mk_blk_mk;

--  mk_blk_sync <= w01 and w02 and w03 and w04 and not(w05) and w06 and not(w07) and (w08 and not(w09));
--  mk_blk_sync_l <= not mk_blk_sync;

-- d07: m161
    move         <= (not(fr_01) and not(fr_02) and not(fr_03)) after tpd;
    move_l       <= not move;

    search       <= (not(fr_01) and not(fr_02) and     fr_03 ) after tpd;
    search_l     <= not search;

    read_data    <= (not(fr_01) and     fr_02  and not(fr_03)) after tpd;
    read_data_l  <= not read_data;

    read_all     <= (not(fr_01) and     fr_02  and     fr_03 ) after tpd;
    read_all_l   <= not read_all;

    write_data   <= (    fr_01  and not(fr_02) and not(fr_03)) after tpd;
    write_data_l <= not write_data;

    write_all    <= (    fr_01  and not(fr_02) and     fr_03 ) after tpd;
--  write_all_l  <= not write_all;

    wrtm         <= (    fr_01  and     fr_02  and not(fr_03)) after tpd;
    wrtm_l       <= not wrtm;

    se           <= (    fr_01  and     fr_02  and     fr_03 ) after tpd;
    se_l         <= not se;
end structural;
