module pdp8i(
	dfsr0, dfsr1, dfsr2, ifsr0, ifsr1, ifsr2, sr00, sr01, sr02, sr03, sr04, sr05, sr06,
	power_ok_, power_clear_,
	sr07, sr08, sr09, sr10, sr11, key_st_, key_la_, key_dp_, key_ex_, key_cont_, key_stop_, key_ss_, key_si_,
	sync_pun, feed_hole, hole1, hole8, hole7, hole6, hole5, hole4, hole3, hole2, pun_feed_switch_,
	link_, if1_, if2_, sc4_, df0_, sc3_, sc1_, if0_, sc2_, df2_, df1_, sc0_,
	rd_hole1, rd_hole2, rd_hole3, rd_hole4, rd_hole5, rd_hole6, rd_hole7, rd_hole8, s_feed_hole, ba_, ba, bb_, bb, pwr, rdr_feed_switch,
	pen_right, pen_left, drum_up, drum_down, pen_up, pen_down,
	x_axis, y_axis, z_axis, light_pen,
	b_line_hold_, btp3, b_mem_to_lsr, b_c_, bstlr, b_dc_inst, lhs_, b_r0_,
	word_count_, defer_, int_enable_, opr_, current_address_, break_, run_, iot_, jmp_, pause_, and_, fetch_, isz_, execute_, dca_, jms_, tad_,
	mb05_, ac05_, pc04_, pc05_, mb03_, ma05_, ma03_, mq04_, mb02_, mq05_, ac03_, ac02_, pc00_, mb04_, ma02_, ma04_, mq03_, ac04_, mq01_, pc03_, mq02_, mb01_, pc02_, mb00_, ma01_, pc01_, mq00_, ac01_, ma00_, ac00_,
	mb11_, ac11_, pc10_, pc11_, mb09_, ma11_, ma09_, mq10_, mb08_, mq11_, ac09_, ac08_, pc06_, mb10_, ma08_, ma10_, mq09_, ac10_, mq07_, pc09_, mq08_, mb07_, pc08_, mb06_, ma07_, pc07_, mq06_, ac07_, ma06_, ac06_,
	ea0, ea1, ea2, bma00, bma01, bma02, bma03, bma04, bma05,
	bma06, bma07, bma08, bma09, bma10, bma11, mcbmb00_, mcbmb01_, mcbmb02_,
	mcbmb03_, mcbmb04_, mcbmb05_, mcbmb06_, mcbmb07_, mcbmb08_, mcbmb09_, mcbmb10_, mcbmb11_,
	mem_p, mem00, mem01, mem02, mem03, mem04, mem05, mem06, mem07,
	mem08, mem09, mem10, mem11, b_mem_start, strobe_, mem_done_, mb_parity_odd, btp2,
	x_strobe, clear_x_,
	y_strobe, clear_y_,
	cr_ready, zone01_index, zone02_index, zone03_index, index_markers, zone04_index, zone05_index, zone06_index, zone07_index, zone08_index, cr_read, c_i_r, zone09_index, zone10_index, zone11_index, zone12_index,
	bac00, bac01, bac02, bac03, bac04, bac05, bac06, bac07, bac08,
	bac09, bac10, bac11, biop1_, biop2_, biop4_, bts3, bts1, binitialize_,
	bmb00, bmb01, bmb02, bmb03_, bmb03, bmb04_, bmb04, bmb05_, bmb05,
	bmb06_, bmb06, bmb07_, bmb07, bmb08_, bmb08, bmb09, bmb10, bmb11,
	in00, in01, in02, in03, in04, in05, in06, in07, in08,
	in09, in10, in11, skipb, irq, acclr, brun_, btt_inst_, line_in,
	da00, da01, da02, da03, da04, da05, da06, da07, da08,
	da09, da10, da11, brq, d_in_, bbreak, badd_accepted_, mem_incr,
	d00, d01, d02, d03, d04, d05, d06, d07, d08,
	d09, d10, d11, n3cycle, ca_incr_, bwc_overflow, eda2, eda1, eda0,
	rx_data, tx_data, reader_run_,
	dclk
);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
reg ac00;
output wand ac00_;
reg ac01;
output wand ac01_;
reg ac02;
output wand ac02_;
reg ac03;
output wand ac03_;
reg ac04;
output wand ac04_;
reg ac05;
output wand ac05_;
reg ac06;
output wand ac06_;
reg ac07;
output wand ac07_;
reg ac08;
output wand ac08_;
reg ac09;
output wand ac09_;
reg ac10;
output wand ac10_;
reg ac11;
output wand ac11_;
wire ac_clear;
wire ac_clear_;
wand ac_enable;
wand ac_load;
wire ac_to_mq_enable;
wire ac_to_mq_enable_;
wand acbar_enable;
output wand acclr;
wire add_;
reg add_accepted_;
wire adder00;
wire adder01;
wire adder02;
wire adder03;
wire adder04;
wire adder05;
wire adder06;
wire adder07;
wire adder08;
wire adder09;
wire adder10;
wire adder11;
wire adder11_;
wire adder_l;
wire adder_l_;
output wand and_;
wand and_enable;
wire and_enable_;
wire and_h;
wire asr_enable;
wire asr_l_set_;
wire auto_index_;
output wand b_c_;
output wand b_dc_inst;
wire b_eae_on;
wand b_execute;
wire b_ext_inst;
wand b_fetch;
wand b_field;
wand b_field_;
wand b_inhibit;
wire b_left_shift;
output wand b_line_hold_;
wand b_mem_enable;
output wand b_mem_start;
output wand b_mem_to_lsr;
wand b_power_clear_;
output wand b_r0_;
wire b_set;
wire b_set_;
output wand ba;
output wand ba_;
output wand bac00;
output wand bac01;
output wand bac02;
output wand bac03;
output wand bac04;
output wand bac05;
output wand bac06;
output wand bac07;
output wand bac08;
output wand bac09;
output wand bac10;
output wand bac11;
output wand badd_accepted_;
output wand bb;
output wand bb_;
wand bb_field;
wand bb_field_;
wire bb_left_shift;
output wand bbreak;
reg bf0;
reg bf1;
reg bf2;
wire bf_enable;
reg bf_enable__;
output wand binitialize_;
wire biop1;
output wand biop1_;
wire biop2;
output wand biop2_;
wire biop4;
output wand biop4_;
output wand bma00;
output wand bma01;
output wand bma02;
output wand bma03;
output wand bma04;
output wand bma05;
output wand bma06;
output wand bma07;
output wand bma08;
output wand bma09;
output wand bma10;
output wand bma11;
output wand bmb00;
output wand bmb01;
output wand bmb02;
output wand bmb03;
output wand bmb03_;
output wand bmb04;
output wand bmb04_;
output wand bmb05;
output wand bmb05_;
output wand bmb06;
output wand bmb06_;
output wand bmb07;
output wand bmb07_;
output wand bmb08;
output wand bmb08_;
output wand bmb09;
output wand bmb10;
output wand bmb11;
reg break;
output wand break_;
wire break_ok;
wire break_ok_;
wire brk_rqst;
reg brk_sync;
output wand brq;
output wand brun_;
output wand bstlr;
output wand btp2;
output wand btp3;
output wand bts1;
output wand bts3;
output wand btt_inst_;
output wand bwc_overflow;
wire c;
reg c_;
input c_i_r;
wire c_no_shift_;
wire c_set_;
output wand ca_incr_;
wire ca_increment;
wire ca_increment_;
wire carry_insert_;
wire carry_out0;
wire carry_out0_;
wire carry_out6_;
wire cint_;
wire clear_df_;
wire clear_ib_;
wire clear_if_;
wire clear_ifdfbf_;
output wand clear_x_;
output wand clear_y_;
wire clock;
wire clock1;
wand clock_ac_clr_;
wire clock_enable_;
wire clock_iot;
wire clock_p4;
wire clock_scale_2;
wire clr_parity_error_;
output wand cr_read;
input cr_ready;
wire csr_enable_;
wire cuf;
wire cuf_;
reg current_address;
output wand current_address_;
output wand d00;
output wand d01;
output wand d02;
output wand d03;
output wand d04;
output wand d05;
output wand d06;
output wand d07;
output wand d08;
output wand d09;
output wand d10;
output wand d11;
output wand d_in_;
wire d_set;
wire d_set_;
output wand da00;
output wand da01;
output wand da02;
output wand da03;
output wand da04;
output wand da05;
output wand da06;
output wand da07;
output wand da08;
output wand da09;
output wand da10;
output wand da11;
wire data00;
wire data01;
wire data02;
wire data03;
wire data04;
wire data05;
wire data06;
wire data07;
wire data08;
wire data09;
wire data10;
wire data11;
wire data_add00;
wire data_add01;
wire data_add02;
wire data_add03;
wire data_add04;
wire data_add05;
wire data_add06;
wire data_add07;
wire data_add08;
wire data_add09;
wire data_add10;
wire data_add11;
wand data_add_enable;
wand data_enable;
wire data_in;
wire data_in_;
wire dc_inst_;
wire dca;
output wand dca_;
reg defer;
output wand defer_;
reg df0;
output wand df0_;
reg df1;
output wand df1_;
reg df2;
output wand df2_;
wire df_enable;
wire df_enable_;
reg df_enable__;
input dfsr0;
input dfsr1;
input dfsr2;
wire div_last;
wire div_last_;
wand double_left_rotate;
wand double_right_rotate;
output wand drum_down;
output wand drum_up;
wire dvi;
wire dvi_;
wire e09f1;
wire e25d1;
wire e_set;
wire e_set_;
inout wand ea0;
wand ea0_;
inout wand ea1;
wand ea1_;
inout wand ea2;
wire eae_ac_enable_;
wire eae_acbar_enable_;
wire eae_begin;
wire eae_complete_;
wire eae_e_set_;
reg eae_end;
wire eae_execute_;
wire eae_inst;
reg eae_ir0;
wire eae_ir0_;
reg eae_ir1;
wire eae_ir1_;
reg eae_ir2;
wire eae_ir2_;
wire eae_ir_clear_;
wire eae_l_disable;
wire eae_left_shift_enable_;
wire eae_mem_enable_;
wire eae_mq0_enable_;
wire eae_mq0bar_enable_;
wire eae_no_shift_enable;
reg eae_on;
wire eae_on_;
wire eae_right_shift_enable_;
reg eae_run;
wire eae_run_;
wire eae_set_;
wire eae_start_;
reg eae_tg;
wire eae_tp;
wire eae_tp_;
output wand eda0;
output wand eda1;
output wand eda2;
wire enable;
wire enable_;
reg execute;
output wand execute_;
wire ext_data_add0;
wire ext_data_add1;
wire ext_data_add2;
wire ext_go;
wire ext_inst;
wire f15f1;
wire f17f1;
wire f_set;
wire f_set_;
output wand feed_hole;
reg fetch;
output wand fetch_;
reg field;
wire field_;
output wand hole1;
output wand hole2;
output wand hole3;
output wand hole4;
output wand hole5;
output wand hole6;
output wand hole7;
output wand hole8;
reg hs;
wire hs_;
wire hz880;
wire i_iot_;
wire i_m_d;
reg ib0;
reg ib1;
reg ib2;
wire ib_to_if;
reg if0;
output wand if0_;
reg if1;
output wand if1_;
reg if2;
output wand if2_;
wire if_enable;
wire if_enable_;
reg if_enable__;
wire if_to_sf;
input ifsr0;
input ifsr1;
input ifsr2;
output wand in00;
output wand in01;
output wand in02;
output wand in03;
output wand in04;
output wand in05;
output wand in06;
output wand in07;
output wand in08;
output wand in09;
output wand in10;
output wand in11;
wire in_stop_2_;
input index_markers;
reg inhibit;
wire inhibit_;
wire initialize;
wand initialize_;
wire input_bus00;
wire input_bus01;
wire input_bus02;
wire input_bus03;
wire input_bus04;
wire input_bus05;
wire input_bus06;
wire input_bus07;
wire input_bus08;
wire input_bus09;
wire input_bus10;
wire input_bus11;
wire int_delay;
reg int_delay__;
wire int_enable;
output int_enable_;
reg int_enable_;
wire int_inhibit;
wire int_inhibit_;
wire int_ok;
wire int_ok_;
wire int_rqst;
wire int_skip_enable_;
wire int_strobe;
wire int_strobe_;
wire int_sync;
reg int_sync__;
wand io_bus_in00_;
wand io_bus_in01_;
wand io_bus_in02_;
wand io_bus_in03_;
wand io_bus_in04_;
wand io_bus_in05_;
wand io_bus_in06_;
wand io_bus_in07_;
wand io_bus_in08_;
wand io_bus_in09_;
wand io_bus_in10_;
wand io_bus_in11_;
wand io_bus_in_int_;
wand io_bus_in_skip_;
wand io_enable;
wire io_end;
wire io_end_;
reg io_on;
wire io_pc_enable_;
wire io_pc_load;
wire io_skip;
wire io_start_;
wire io_strobe;
reg iop1;
wire iop124_;
wire iop1_;
wire iop1_clr;
wire iop1_set_;
reg iop2;
wire iop2_;
wire iop2_clr;
wire iop2_set_;
reg iop4;
wire iop4_;
wire iop4_clr;
wire iop4_set_;
wire iot;
wire iot632;
wire iot634;
output wand iot_;
wire iot_opr_;
wire ipc_enable;
wire ir0;
reg ir0_;
reg ir1;
wire ir1_;
reg ir2;
wire ir2_;
output wand irq;
wire isz;
output wand isz_;
wire jmp;
output wand jmp_;
wire jms;
output wand jms_;
wire kcc_;
wire key_cont;
input key_cont_;
wire key_dp;
input key_dp_;
input key_ex_;
wire key_exdp;
wire key_exdp_;
wire key_la;
input key_la_;
wire key_laexdp;
wire key_laexdp_;
wire key_lamfts0_;
input key_si_;
wire key_sistop;
wire key_ss;
input key_ss_;
wire key_st;
input key_st_;
wire key_stexdp;
input key_stop_;
wire keyboard_flag_;
wire l_enable;
wire lbar_enable;
wand left_shift;
wire left_shift_;
wire lh_to_hs;
wire lhs;
output wand lhs_;
input light_pen;
wire line_;
wire line_hold_;
output wand line_in;
reg link;
output wand link_;
wire load_bf;
wire load_counter;
wire load_ib;
wand load_sf_;
wire low_ac0;
// wire m30v;
// wire m36v;
// wire m6v;
reg ma00;
output wand ma00_;
reg ma01;
output wand ma01_;
reg ma02;
output wand ma02_;
reg ma03;
output wand ma03_;
reg ma04;
output wand ma04_;
reg ma05;
output wand ma05_;
reg ma06;
output wand ma06_;
reg ma07;
output wand ma07_;
reg ma08;
output wand ma08_;
reg ma09;
output wand ma09_;
reg ma10;
output wand ma10_;
reg ma11;
output wand ma11_;
wand ma_enable0_4;
wand ma_enable5_11;
wand ma_load;
wand manual_preset_;
reg mb00;
output wand mb00_;
reg mb01;
output wand mb01_;
reg mb02;
output wand mb02_;
reg mb03;
output wand mb03_;
reg mb04;
output wand mb04_;
reg mb05;
output wand mb05_;
reg mb06;
output wand mb06_;
wire mb06xmb09;
reg mb07;
output wand mb07_;
reg mb08;
output wand mb08_;
reg mb09;
output wand mb09_;
reg mb10;
output wand mb10_;
reg mb11;
output wand mb11_;
wand mb_load;
output wand mb_parity_odd;
wire mb_to_ib;
wire mb_to_sc_enable;
output wand mcbmb00_;
output wand mcbmb01_;
output wand mcbmb02_;
output wand mcbmb03_;
output wand mcbmb04_;
output wand mcbmb05_;
output wand mcbmb06_;
output wand mcbmb07_;
output wand mcbmb08_;
output wand mcbmb09_;
output wand mcbmb10_;
output wand mcbmb11_;
wire me05_;
wire me06_;
wire me07_;
wire me08_;
wire me09_;
wire me10_;
wire me11_;
input mem00;
input mem01;
input mem02;
input mem03;
input mem04;
input mem05;
input mem06;
input mem07;
input mem08;
input mem09;
input mem10;
input mem11;
wand mem_begin_;
inout wand mem_done_;
reg mem_enable;
wand mem_enable0_4;
wire mem_enable0_4_;
wand mem_enable5_8;
wire mem_enable9_11;
wire mem_enable_;
wire mem_ext;
wire mem_ext_;
wire mem_ext_ac_load_enable_;
wand mem_ext_io_enable_;
wire mem_finish;
reg mem_idle;
output wand mem_incr;
wire mem_inh9_11_;
output wand mem_p;
wire mem_parity_even_;
wire mem_start;
wire mem_to_lsr_;
wire memory_increment;
wire mftp0;
wire mftp1;
wire mftp2;
wire mfts0;
reg mfts1;
wire mfts1_;
reg mfts2;
wire mfts2_;
wire mfts3;
wire mid_ac0;
wire mp_int;
wire mp_int_;
wire mp_skip_;
reg mq00;
output wand mq00_;
reg mq01;
output wand mq01_;
reg mq02;
output wand mq02_;
reg mq03;
output wand mq03_;
reg mq04;
output wand mq04_;
reg mq05;
output wand mq05_;
reg mq06;
output wand mq06_;
reg mq07;
output wand mq07_;
reg mq08;
output wand mq08_;
reg mq09;
output wand mq09_;
reg mq10;
output wand mq10_;
reg mq11;
output wand mq11_;
wand mq_enable;
wand mq_load;
wire mq_low_ac0;
wire muy;
wire muy_;
wire muy_dvi_;
wire n0_to_int_enab_;
wire n3_cycle;
output wand n3cycle;
wire n__1;
wire n__100;
wire n__101;
wire n__102;
wire n__103;
wire n__104;
wire n__105;
wire n__106;
wire n__107;
wire n__108;
wire n__109;
wire n__11;
wire n__110;
wire n__111;
wire n__112;
wire n__113;
wire n__114;
wire n__115;
wire n__116;
wire n__117;
wire n__118;
wire n__119;
wire n__12;
wire n__120;
wire n__121;
wire n__122;
wire n__123;
wire n__124;
wire n__125;
wire n__126;
wire n__127;
wire n__128;
wire n__129;
wire n__13;
wire n__130;
wire n__132;
wire n__133;
wire n__134;
wire n__135;
wire n__136;
wire n__137;
wire n__14;
wire n__140;
wire n__15;
wire n__16;
wire n__160;
wire n__17;
wire n__18;
wire n__19;
wire n__2;
wire n__20;
wire n__200;
wire n__201;
wire n__202;
wire n__203;
wire n__204;
wire n__205;
wire n__206;
wire n__207;
wire n__208;
wire n__209;
wire n__21;
wire n__210;
wire n__211;
wire n__212;
wire n__213;
wire n__214;
wire n__215;
wire n__216;
wire n__217;
wire n__218;
wire n__219;
wire n__22;
wire n__220;
wire n__221;
wire n__222;
wire n__223;
wire n__23;
wire n__24;
wire n__243;
wire n__245;
wire n__246;
wire n__25;
wire n__250;
wire n__253;
wire n__254;
wire n__259;
wire n__260;
wire n__261;
wire n__262;
wire n__263;
wire n__264;
wire n__265;
wire n__266;
// wire n__267;
// wire n__268;
wire n__269;
wire n__270;
wire n__271;
wire n__272;
wire n__273;
wire n__274;
wire n__275;
wire n__277;
wire n__281;
wire n__282;
wire n__283;
wire n__284;
wire n__285;
wire n__286;
wire n__287;
wire n__288;
wire n__289;
wire n__29;
wire n__290;
wire n__291;
wire n__292;
wire n__293;
wire n__294;
wire n__295;
wire n__296;
wire n__297;
wire n__298;
wire n__3;
wire n__30;
wire n__31;
wire n__32;
// wire n__325;
// wire n__326;
// wire n__327;
// wire n__328;
// wire n__329;
wire n__33;
// wire n__330;
// wire n__331;
// wire n__332;
// wire n__333;
// wire n__334;
// wire n__335;
// wire n__336;
// wire n__337;
// wire n__338;
// wire n__339;
wire n__34;
// wire n__340;
// wire n__341;
// wire n__342;
// wire n__343;
// wire n__344;
// wire n__345;
// wire n__346;
// wire n__347;
// wire n__348;
// wire n__349;
wire n__35;
// wire n__350;
// wire n__351;
// wire n__352;
// wire n__353;
// wire n__354;
// wire n__355;
// wire n__356;
// wire n__357;
// wire n__358;
// wire n__359;
wire n__36;
// wire n__360;
// wire n__361;
// wire n__362;
// wire n__363;
// wire n__364;
// wire n__365;
// wire n__366;
// wire n__367;
// wire n__368;
// wire n__369;
wire n__37;
// wire n__370;
// wire n__371;
// wire n__372;
// wire n__373;
// wire n__374;
// wire n__375;
// wire n__376;
// wire n__377;
// wire n__378;
// wire n__379;
wire n__38;
// wire n__380;
// wire n__381;
// wire n__382;
// wire n__383;
// wire n__384;
// wire n__385;
// wire n__386;
// wire n__387;
// wire n__388;
// wire n__389;
wire n__39;
// wire n__390;
// wire n__391;
// wire n__392;
// wire n__393;
// wire n__394;
// wire n__395;
// wire n__396;
// wire n__397;
// wire n__398;
// wire n__399;
wire n__4;
wire n__40;
// wire n__400;
// wire n__401;
// wire n__402;
wire n__403;
wire n__404;
wire n__405;
wire n__406;
wire n__407;
wire n__408;
wire n__409;
wire n__41;
wire n__410;
wire n__411;
wire n__412;
wire n__413;
wire n__414;
wire n__415;
wire n__416;
wire n__417;
wire n__418;
wire n__419;
wire n__42;
wire n__420;
wire n__421;
wire n__422;
wire n__423;
wire n__424;
wire n__425;
wire n__426;
wire n__427;
wire n__428;
wire n__429;
wire n__43;
wire n__430;
wire n__431;
wire n__432;
wire n__433;
wire n__434;
wire n__435;
wire n__436;
wire n__437;
wire n__438;
wire n__439;
wire n__44;
wire n__440;
wire n__441;
wire n__442;
wire n__443;
wire n__444;
wire n__445;
wire n__446;
wire n__447;
wire n__45;
wire n__451;
wand n__452;
wire n__453;
wire n__454;
wire n__455;
wire n__456;
wire n__457;
wire n__458;
wire n__459;
wire n__46;
wire n__460;
wire n__461;
wire n__462;
wire n__463;
wire n__464;
wire n__465;
wire n__466;
wire n__467;
wire n__468;
wire n__469;
wire n__47;
wire n__470;
wire n__471;
wire n__472;
wire n__473;
wire n__474;
wire n__475;
wire n__476;
wire n__477;
wire n__478;
wire n__479;
wire n__48;
wire n__480;
wire n__481;
wire n__482;
wire n__483;
wire n__484;
wire n__485;
wire n__489;
wire n__49;
wire n__490;
wire n__491;
wire n__492;
wire n__493;
wire n__494;
wire n__497;
wire n__5;
wire n__50;
// wire n__504;
// wire n__505;
wire n__51;
wire n__52;
// wire n__522;
// wire n__523;
// wire n__524;
// wire n__525;
// wire n__526;
// wire n__527;
// wire n__528;
// wire n__529;
wire n__53;
// wire n__530;
// wire n__531;
// wire n__532;
// wire n__533;
// wire n__534;
// wire n__535;
// wire n__536;
// wire n__537;
// wire n__538;
// wire n__539;
wire n__54;
// wire n__540;
// wire n__541;
// wire n__542;
// wire n__543;
// wire n__546;
// wire n__547;
wire n__548;
wire n__549;
wire n__55;
wire n__550;
wire n__551;
wire n__552;
wire n__553;
wire n__554;
wire n__555;
wire n__556;
wire n__557;
wire n__558;
wire n__559;
wire n__56;
wire n__560;
wire n__561;
wire n__562;
wire n__563;
wire n__564;
wire n__565;
wire n__566;
wire n__567;
wire n__568;
wire n__569;
wire n__57;
wire n__570;
wire n__571;
wire n__572;
wire n__573;
wire n__574;
wire n__575;
wire n__576;
wire n__577;
wire n__578;
wire n__579;
wire n__58;
wire n__580;
wire n__581;
wire n__582;
wire n__583;
wire n__584;
wire n__585;
wire n__586;
wire n__587;
wire n__588;
wire n__589;
wire n__59;
wire n__590;
wire n__591;
wire n__592;
wire n__593;
wire n__594;
wire n__595;
wire n__596;
wire n__597;
wire n__598;
wire n__599;
wire n__6;
wire n__60;
wire n__600;
wire n__601;
wire n__602;
wire n__603;
wire n__604;
wire n__605;
wire n__606;
wire n__607;
wire n__608;
wire n__609;
wire n__61;
wire n__610;
wire n__611;
wire n__612;
wire n__613;
wire n__614;
wire n__615;
wire n__616;
wire n__617;
wire n__618;
wire n__619;
wire n__62;
wire n__620;
wire n__621;
wire n__622;
wire n__623;
wire n__624;
wire n__625;
wire n__626;
wire n__627;
wire n__628;
wire n__629;
wire n__63;
wire n__630;
wire n__631;
wire n__632;
wire n__633;
wire n__634;
wire n__635;
wire n__636;
wire n__637;
wire n__638;
wire n__639;
wire n__64;
wire n__640;
wire n__641;
wire n__642;
wire n__643;
wire n__644;
wire n__645;
wire n__646;
wire n__647;
wire n__648;
wire n__649;
wire n__65;
wire n__650;
wire n__651;
wire n__652;
wire n__653;
wire n__654;
wire n__655;
wire n__656;
wire n__657;
wire n__658;
wire n__659;
wire n__66;
wire n__660;
wire n__661;
wire n__662;
wire n__663;
wire n__664;
wire n__665;
wire n__666;
wire n__667;
wire n__668;
wire n__669;
wire n__67;
wire n__670;
wire n__671;
wire n__672;
wire n__673;
wire n__674;
wire n__675;
wire n__676;
wand n__677;
wire n__678;
wire n__679;
wire n__68;
wire n__680;
wire n__681;
wire n__682;
wire n__683;
wire n__684;
wire n__685;
wire n__686;
wire n__687;
wire n__688;
wire n__689;
wire n__69;
wire n__690;
wire n__691;
wire n__692;
wire n__693;
wire n__694;
wire n__695;
wire n__696;
wire n__697;
wire n__698;
wire n__699;
wire n__7;
wire n__70;
wire n__700;
wire n__701;
wire n__702;
wire n__703;
wire n__704;
wire n__705;
wire n__706;
wire n__707;
wire n__708;
wire n__709;
wire n__71;
wire n__710;
wire n__711;
wire n__712;
wire n__713;
wire n__714;
wire n__715;
wire n__716;
wire n__717;
wire n__718;
wire n__719;
wire n__72;
wire n__720;
wire n__721;
wire n__722;
wire n__725;
wire n__726;
wire n__727;
wire n__728;
wire n__729;
wire n__73;
wire n__730;
wire n__731;
wire n__732;
wire n__733;
wire n__734;
wire n__735;
wire n__736;
wire n__737;
wire n__738;
wire n__739;
wire n__74;
wire n__740;
wire n__741;
wire n__742;
wire n__743;
wire n__744;
wire n__745;
wire n__746;
wire n__747;
wire n__748;
wire n__749;
wire n__75;
wire n__750;
wire n__76;
wire n__77;
wire n__78;
wire n__79;
wire n__8;
wire n__80;
wire n__81;
wire n__82;
wire n__83;
wire n__84;
wire n__85;
wire n__86;
wire n__87;
wire n__88;
wire n__89;
wire n__9;
wire n__90;
wire n__91;
wire n__92;
wire n__93;
wire n__94;
wire n__95;
wire n__96;
wire n__97;
wire n__98;
wire n__99;
wire nc;
wire nmi;
wire nmi_;
wand no_shift;
wire norm;
wire norm_;
wire op1;
wire op1_;
wire op2;
wire opr;
output wand opr_;
wire osr_;
wire out_stop2_;
wire overflow;
reg pause;
output wand pause_;
reg pc00;
output wand pc00_;
reg pc01;
output wand pc01_;
reg pc02;
output wand pc02_;
reg pc03;
output wand pc03_;
reg pc04;
output wand pc04_;
reg pc05;
output wand pc05_;
reg pc06;
output wand pc06_;
reg pc07;
output wand pc07_;
reg pc08;
output wand pc08_;
reg pc09;
output wand pc09_;
reg pc10;
output wand pc10_;
reg pc11;
output wand pc11_;
wand pc_enable;
wire pc_enable_;
wire pc_increment;
wand pc_load;
wire pc_load_;
wire pc_loadxsr_enable_;
output wand pen_down;
output wand pen_left;
output wand pen_right;
wire pen_strobe;
output wand pen_up;
output wand power_clear_;
output wand power_ok_;
wire processor_iot_;
input pun_feed_switch_;
output wand pwr;
reg pwr_low_;
wire pwr_skip_;
wire r0;
wire r0_;
input rd_hole1;
input rd_hole2;
input rd_hole3;
input rd_hole4;
input rd_hole5;
input rd_hole6;
input rd_hole7;
input rd_hole8;
wire rdr_enable_;
input rdr_feed_switch;
wire rdr_run_;
wire rdr_shift;
wire rdr_shift_;
reg read;
output wand reader_run_;
wire restart;
wire restart_;
wire rib;
wand right_shift;
wire rmf_;
reg run;
output wand run_;
input rx_data;
wire s;
reg s_;
input s_feed_hole;
wire s_set_;
reg s_uf;
reg sc0;
output wand sc0_;
wire sc0_3_0;
wand sc0_3_0_;
reg sc1;
output wand sc1_;
reg sc2;
output wand sc2_;
reg sc3;
output wand sc3_;
reg sc4;
output wand sc4_;
wire sc_0_;
wand sc_enable;
wire sc_full;
wand sc_load;
wire scl_;
reg sf0;
reg sf1;
reg sf2;
reg sf3;
reg sf4;
reg sf5;
wire sf_enable;
wire shut_down_;
wire sint;
reg skip_;
wire skip_or;
output wand skipb;
wire slow_cycle;
wire slow_cycle_;
wire special_cycle_;
input sr00;
input sr01;
input sr02;
input sr03;
input sr04;
input sr05;
input sr06;
input sr07;
input sr08;
input sr09;
input sr10;
input sr11;
wand sr_enable;
wire stop_complete;
wire stop_ok;
wire store_;
inout wand strobe_;
wire strobe_field0;
wire strobe_field1;
input sync_pun;
wire tad;
output wand tad_;
wire teleprinter_flag_;
wire tp1;
wire tp2;
wire tp2e_;
wire tp3;
wire tp4;
reg ts1;
wire ts1_;
reg ts2;
reg ts3;
wire ts3_;
reg ts4;
wire ts4_;
wire tt0_;
wire tt1_;
wire tt2_;
wire tt3_;
wire tt4_;
wire tt5_;
wire tt6_;
wire tt7_;
wire tt_ac_clr_;
wire tt_ac_load_;
wire tt_carry_insert;
wire tt_carry_insert_;
wire tt_carry_insert_c_;
wire tt_carry_insert_s;
wire tt_carry_insert_s_;
wire tt_cycle_;
wire tt_data;
wire tt_increment_;
wire tt_inst;
wire tt_inst_;
wire tt_int_;
wire tt_io_enable_;
wire tt_l_disable;
wire tt_line_shift_;
wire tt_right_shift_enable;
wire tt_right_shift_enable_;
wire tt_set_;
wire tt_shift_enable;
wire tt_shift_enable_;
wire tt_skip_;
wire tti2;
wire tti_clock;
wire tti_data;
wire tti_skip_;
wire tto_clock_;
wire tto_skip_;
output wand tx_data;
reg ub;
reg uf;
wire uf_;
reg uint;
wire uint_;
reg usf;
wire usf_;
reg wc_overflow_;
wire wc_set;
wire wc_set_;
reg word_count;
output wand word_count_;
reg write;
output wand x_axis;
output wand x_strobe;
output wand y_axis;
output wand y_strobe;
output wand z_axis;
input zone01_index;
input zone02_index;
input zone03_index;
input zone04_index;
input zone05_index;
input zone06_index;
input zone07_index;
input zone08_index;
input zone09_index;
input zone10_index;
input zone11_index;
input zone12_index;


// Sheet 1
assign io_pc_load = 1'b1; // f32u1 pull-up

// Sheet 2
assign initialize_ = ~(initialize);
assign biop2 = ~(iop2_);
assign biop1 = ~(iop1_);
assign biop4 = ~(iop4_);
assign key_la = ~(key_la_);
assign key_st = ~(key_st_ & restart_);
assign key_exdp = ~(key_dp_ & key_ex_);
assign key_sistop = ~(key_stop_ & key_si_);
assign key_dp = ~(key_dp_);
assign key_ss = ~(key_ss_);
assign key_exdp_ = ~(key_exdp);
assign key_cont = ~(key_cont_);
assign n__16 = ~(n__15);
assign n__15 = ~(io_start_ & eae_start_);
assign io_end_ = ~(io_end);
assign slow_cycle = ~(slow_cycle_);
assign n__17 = ~(eae_end & io_end_);
assign key_laexdp = ~(key_exdp_ & key_la_);
assign n__11 = (mb10 & mb11_ & op2 & uf_) | (key_sistop & f_set) | (key_exdp & mfts0) | (stop_ok & power_ok_) | (key_ss);
assign n__19 = ~(mem_idle & pause_ & run);
assign n__25 = ~(tp3 & eae_set_ & slow_cycle_);
assign n__46 = ~(iop4_set_ & iop2_set_ & iop1_set_);
assign key_stexdp = ~(key_st_ & restart_ & key_exdp_);
assign int_strobe = ~(n__25 & eae_end & io_end_);
assign n__13 = ~(mfts0 & mfts1_ & mfts2_);
assign n__20 = ~(mftp2 & key_la_);
assign mem_start = ~(n__20 & n__19);
assign n__21 = ~(mftp2 & key_cont);
assign n__24 = ~(tp2);
assign io_start_ = ~(tp3 & slow_cycle);
assign tp4 = ~(n__19 & n__21);
assign tp1 = ~(strobe_);
assign int_strobe_ = ~(int_strobe);
assign n__29 = ~(io_start_);
assign mfts3 = ~(n__13);
DelayLine #(300) dl_n__14(dclk, n__17, n__14);
assign n__18 = n__14;
DelayLine #(150) dl_n__22(dclk, e09f1, n__22);
DelayLine #(450) dl_n__748(dclk, e09f1, n__748);
assign tp2 = n__22;
assign tp3 = n__748;
// synthesis attribute CLOCK_SIGNAL of tp4 is "yes";
always @(posedge tp4, negedge strobe_, negedge manual_preset_) begin
  if (~strobe_)
    ts1 <= 1'b0;
  else if (~manual_preset_)
    ts1 <= 1'b1;
  else if (tp4)
    ts1 <= 1'b1;
end
assign ts1_ = ~ts1;
// synthesis attribute CLOCK_SIGNAL of 1'b0 is "yes";
always @(posedge 1'b0, negedge strobe_, negedge mem_done_) begin
  if (~strobe_)
    mem_idle <= 1'b0;
  else if (~mem_done_)
    mem_idle <= 1'b1;
  else if (1'b0)
    mem_idle <= 1'b0;
end
// synthesis attribute CLOCK_SIGNAL of n__18 is "yes";
always @(posedge n__18, negedge strobe_, negedge n__16) begin
  if (~strobe_)
    pause <= 1'b0;
  else if (~n__16)
    pause <= 1'b1;
  else if (n__18)
    pause <= 1'b0;
end
assign pause_ = ~pause;
// synthesis attribute CLOCK_SIGNAL of tp3 is "yes";
always @(posedge tp3, negedge b_power_clear_) begin
  if (~b_power_clear_)
    run <= 1'b0;
  else if (tp3)
    run <= n__11;
end
assign run_ = ~run;
// synthesis attribute CLOCK_SIGNAL of tp2 is "yes";
always @(posedge tp2, negedge manual_preset_, negedge strobe_) begin
  if (~manual_preset_)
    ts2 <= 1'b0;
  else if (~strobe_)
    ts2 <= 1'b1;
  else if (tp2)
    ts2 <= 1'b0;
end
// synthesis attribute CLOCK_SIGNAL of tp3 is "yes";
always @(posedge tp3, negedge manual_preset_, negedge n__24) begin
  if (~manual_preset_)
    ts3 <= 1'b0;
  else if (~n__24)
    ts3 <= 1'b1;
  else if (tp3)
    ts3 <= 1'b0;
end
assign ts3_ = ~ts3;
// synthesis attribute CLOCK_SIGNAL of tp4 is "yes";
always @(posedge tp4, negedge manual_preset_, negedge int_strobe_) begin
  if (~manual_preset_)
    ts4 <= 1'b0;
  else if (~int_strobe_)
    ts4 <= 1'b1;
  else if (tp4)
    ts4 <= 1'b0;
end
assign ts4_ = ~ts4;
// synthesis attribute CLOCK_SIGNAL of iop1_clr is "yes";
always @(posedge iop1_clr, negedge initialize_, negedge iop1_set_) begin
  if (~initialize_)
    iop1 <= 1'b0;
  else if (~iop1_set_)
    iop1 <= 1'b1;
  else if (iop1_clr)
    iop1 <= 1'b0;
end
assign iop1_ = ~iop1;
// synthesis attribute CLOCK_SIGNAL of iop2_clr is "yes";
always @(posedge iop2_clr, negedge initialize_, negedge iop2_set_) begin
  if (~initialize_)
    iop2 <= 1'b0;
  else if (~iop2_set_)
    iop2 <= 1'b1;
  else if (iop2_clr)
    iop2 <= 1'b0;
end
assign iop2_ = ~iop2;
// synthesis attribute CLOCK_SIGNAL of iop4_clr is "yes";
always @(posedge iop4_clr, negedge initialize_, negedge iop4_set_) begin
  if (~initialize_)
    iop4 <= 1'b0;
  else if (~iop4_set_)
    iop4 <= 1'b1;
  else if (iop4_clr)
    iop4 <= 1'b0;
end
assign iop4_ = ~iop4;
// synthesis attribute CLOCK_SIGNAL of io_end is "yes";
always @(posedge io_end, negedge manual_preset_, negedge io_start_) begin
  if (~manual_preset_)
    io_on <= 1'b0;
  else if (~io_start_)
    io_on <= 1'b1;
  else if (io_end)
    io_on <= 1'b0;
end
// TODO: n__7 should be suitably filtered.
assign mftp0 = (restart_ & n__7) | ~run_;
assign mfts0 = ~mftp0;
always @(posedge mfts0, negedge b_power_clear_, negedge mfts2_) begin
  if (~mfts2_)
    mfts1 = 1'b0;
  else if (~b_power_clear_)
    mfts1 = 1'b0;
  else
    mfts1 = 1'b1;
end
assign mfts1_ = ~mfts1;
DelayLine #(2000) m700ae2(dclk, mftp0, mftp1);
DelayLine #(2000) m700bd2(dclk, mftp1, mftp2);
always @(posedge mftp1, posedge mftp2, negedge b_power_clear_) begin
  if (~b_power_clear_)
    mfts2 = 1'b0;
  else if (mftp2)
    mfts2 = 1'b0;
  else
    mfts2 = 1'b1;
end
assign strobe_ = 1'b1; // ef10be2 pull-up
assign b_mem_start = ~(n__20 & n__19);
assign btp2 = ~(n__24);
DelayLine #(400) dl_n__47(dclk, n__46, n__47);
assign io_strobe = n__47;
DelayLine #(150) dl_n__30(dclk, n__29, n__30);
DelayLine #(400) dl_n__31(dclk, n__29, n__31);
assign n__32 = n__31;
assign n__36 = n__30;
DelayLine #(350) dl_n__33(dclk, n__32, n__33);
DelayLine #(400) dl_n__34(dclk, n__32, n__34);
assign n__35 = n__34;
assign iop1_clr = n__33;
DelayLine #(150) dl_n__37(dclk, n__35, n__37);
DelayLine #(400) dl_n__38(dclk, n__35, n__38);
assign f15f1 = n__38;
assign n__39 = n__37;
DelayLine #(350) dl_n__40(dclk, f15f1, n__40);
DelayLine #(400) dl_n__41(dclk, f15f1, n__41);
assign n__42 = n__41;
assign iop2_clr = n__40;
DelayLine #(150) dl_n__43(dclk, n__42, n__43);
DelayLine #(400) dl_n__44(dclk, n__42, n__44);
assign f17f1 = n__44;
assign n__45 = n__43;
DelayLine #(350) dl_n__48(dclk, f17f1, n__48);
DelayLine #(400) dl_n__49(dclk, f17f1, n__49);
assign io_end = n__49;
assign iop4_clr = n__48;
assign slow_cycle_ = ~(n__12 & mem_ext_ & tt_inst_ & processor_iot_);
assign n__7 = ~(key_la_ & key_st_ & key_exdp_ & key_cont_);
assign iop2_set_ = ~(n__39 & mb10);
assign n__12 = ~(n__9);
assign n__9 = ~(b_fetch & iot);
assign iop1_set_ = ~(n__36 & mb11);
assign iop4_set_ = ~(n__45 & mb09);
assign initialize = ~(n__8 & b_power_clear_);
assign n__8 = ~(mftp0 & key_st);
assign key_laexdp_ = ~(key_laexdp & run_);
assign manual_preset_ = ~(mftp0);

// Sheet 3
DelayLine #(300) dl_n__4(dclk, n__3, n__4);
assign lh_to_hs = n__4;
assign mem_to_lsr_ = ~(n__3);
assign n__5 = ~(lh_to_hs);
assign n__3 = ~(n__2);
assign n__2 = ~(s & tp1);
assign n__1 = ~(s_ & tp1);
assign e09f1 = ~(n__5 & n__1);

// Sheet 4
assign iot = ~(iot_);
// synthesis attribute CLOCK_SIGNAL of n__51 is "yes";
always @(posedge n__51, negedge n__6) begin
  if (~n__6)
    ir0_ <= 1'b0;
  else if (n__51)
    ir0_ <= n__50;
end
assign ir0 = ~ir0_;
// synthesis attribute CLOCK_SIGNAL of n__51 is "yes";
always @(posedge n__51, negedge n__6) begin
  if (~n__6)
    ir1 <= 1'b0;
  else if (n__51)
    ir1 <= mem01;
end
assign ir1_ = ~ir1;
// synthesis attribute CLOCK_SIGNAL of n__51 is "yes";
always @(posedge n__51, negedge n__6) begin
  if (~n__6)
    ir2 <= 1'b0;
  else if (n__51)
    ir2 <= mem02;
end
assign ir2_ = ~ir2;
// synthesis attribute CLOCK_SIGNAL of tp1 is "yes";
always @(posedge tp1, negedge manual_preset_) begin
  if (~manual_preset_)
    brk_sync <= 1'b0;
  else if (tp1)
    brk_sync <= brk_rqst;
end
assign tad_ = ~(ir0_ & ir1_ & ir2);
assign isz_ = ~(ir0_ & ir1 & ir2_);
assign jms_ = ~(ir0 & ir1_ & ir2_);
assign jmp_ = ~(ir0 & ir1_ & ir2);
assign and_ = ~(ir0_ & ir1_ & ir2_);
assign dca_ = ~(ir0_ & ir1 & ir2);
assign i_iot_ = ~(ir0 & ir1 & ir2_);
assign opr_ = ~(ir0 & ir1 & ir2);
assign and_h = ~(and_);
assign tad = ~(tad_);
assign jms = ~(jms_);
assign eae_ir_clear_ = ~(tp2 & b_fetch);
assign n__51 = ~(eae_ir_clear_);
assign isz = ~(isz_);
assign dca = ~(dca_);
assign jmp = ~(jmp_);
assign opr = ~(opr_);
// synthesis attribute CLOCK_SIGNAL of tp4 is "yes";
always @(posedge tp4, negedge manual_preset_, negedge n__52) begin
  if (~manual_preset_)
    fetch <= 1'b0;
  else if (~n__52)
    fetch <= 1'b1;
  else if (tp4)
    fetch <= f_set;
end
assign fetch_ = ~fetch;
// synthesis attribute CLOCK_SIGNAL of tp4 is "yes";
always @(posedge tp4, negedge manual_preset_) begin
  if (~manual_preset_)
    defer <= 1'b0;
  else if (tp4)
    defer <= d_set;
end
assign defer_ = ~defer;
// synthesis attribute CLOCK_SIGNAL of tp4 is "yes";
always @(posedge tp4, negedge manual_preset_) begin
  if (~manual_preset_)
    execute <= 1'b0;
  else if (tp4)
    execute <= e_set;
end
assign execute_ = ~execute;
// synthesis attribute CLOCK_SIGNAL of tp4 is "yes";
always @(posedge tp4, negedge manual_preset_) begin
  if (~manual_preset_)
    word_count <= 1'b0;
  else if (tp4)
    word_count <= wc_set;
end
assign word_count_ = ~word_count;
// synthesis attribute CLOCK_SIGNAL of tp4 is "yes";
always @(posedge tp4, negedge manual_preset_) begin
  if (~manual_preset_)
    current_address <= 1'b0;
  else if (tp4)
    current_address <= word_count;
end
assign current_address_ = ~current_address;
// synthesis attribute CLOCK_SIGNAL of tp4 is "yes";
always @(posedge tp4, negedge manual_preset_) begin
  if (~manual_preset_)
    break <= 1'b0;
  else if (tp4)
    break <= b_set;
end
assign break_ = ~break;
assign n__54 = ~(defer & jmp_);
assign special_cycle_ = ~(n__59);
assign iot_opr_ = ~(ir0 & ir1);
assign n__6 = ~(tp4 & int_ok);
assign n__59 = ~(tt_set_ & current_address_ & word_count_);
assign d_set_ = ~(iot_opr_ & b_fetch & mb03);
assign iot_ = ~(ir0 & ir1 & ir2_ & uf_);
assign n__50 = ~(mem00);
assign f_set = ~(f_set_);
assign e_set_ = ~(e_set);
assign break_ok = ~(break_ok_);
assign n__56 = ~(break_ok & wc_set_);
assign n__52 = ~(mftp2 & key_st);
assign d_set = ~(d_set_);
assign wc_set = ~(wc_set_);
assign b_set = ~(n__56 & current_address_);
assign wc_set_ = ~(n3_cycle & break_ok);
assign n__55 = ~(iot_opr_ & b_fetch & jmp_ & mb03_);
assign f_set_ = ~(special_cycle_ & break_ok_ & e_set_ & d_set_);
assign e_set = ~(int_ok_ & n__54 & n__55 & eae_e_set_);
assign break_ok_ = ~(e_set_ & brk_sync & special_cycle_ & d_set_);
assign b_fetch = ~(fetch_);
assign b_execute = ~(execute_);

// Sheet 5
assign n__70 = ~(n__63 & uf_);
assign n__63 = ~(osr_);
assign n__58 = ~(mem_enable5_8 & mem_inh9_11_);
assign io_pc_enable_ = ~(iop124_ & io_on);
assign iop124_ = ~(n__120);
assign n__64 = ~(restart_ & mfts1 & key_stexdp);
assign l_enable = (mb05_ & op1 & mb07) | (mfts2 & key_st) | (tt_l_disable) | (eae_l_disable) | (mb05 & op1 & mb07_);
assign n__57 = (ts3 & defer & jmp) | (ts2 & n__68) | (1'b0) | (ts4 & current_address) | (ts4 & defer & jmp_);
assign n__68 = (b_execute & jms) | (dca & b_execute) | (break & data_in) | (mfts3 & key_dp);
assign n__62 = (1'b0) | (ts1 & pc_increment) | (ts4 & word_count) | (mfts2 & key_exdp) | (ts3 & b_execute & jms);
assign n__79 = (op2 & ac_to_mq_enable_ & mb04_) | (io_enable & ac_clear_) | (op1 & n__84) | (ts2 & b_execute & dca);
assign n__84 = (mb04_ & mb06) | (mb04 & mb06_);
assign ac_enable = ~(and_enable_ & n__79 & add_ & eae_ac_enable_);
assign acbar_enable = ~(n__72 & eae_acbar_enable_);
assign ipc_enable = ~(io_pc_enable_ & n__64 & int_skip_enable_ & pc_enable_ & tt_carry_insert_);
assign n__120 = ~(iop1_ & iop2_ & iop4_);
assign mem_enable9_11 = ~(n__58 & eae_mem_enable_ & n__61 & n__73);
assign n__749 = ~(ipc_enable);
assign n__61 = ~(ts3 & jmp & b_fetch & mb03_);
assign n__76 = ~(opr & ts3 & b_fetch & mb03);
assign n__73 = ~(ts4 & n__60 & int_ok_ & pc_enable_);
assign add_ = ~(tad & ts3 & b_execute);
assign int_skip_enable_ = ~(ts2 & b_execute & jms);
assign n__67 = ~(ts2 & break & data_in);
assign n__74 = ~(mem_enable5_8 & mem_enable0_4_ & mb04);
assign n__65 = ~(f_set_ & eae_e_set_ & tt_set_);
assign osr_ = ~(op2 & mb11_ & mb09);
assign mem_enable0_4_ = ~(mem_enable0_4);
assign n__60 = ~(d_set_ & e_set_);
assign op2 = ~(n__76);
assign n__69 = ~(ts4 & break_ok);
assign n__71 = ~(key_dp & mfts3);
assign data_in = ~(data_in_);
assign ac_clear_ = ~(ac_clear);
assign lbar_enable = ~(n__66 & eae_acbar_enable_);
assign key_lamfts0_ = ~(key_la & mfts0);
assign n__66 = ~(op1 & mb07);
assign pc_enable = ~(n__749);
assign data_enable = ~(n__67);
assign sr_enable = ~(n__71 & n__70 & key_lamfts0_);
assign io_enable = ~(iop124_ & mem_ext_io_enable_ & tt_io_enable_);
assign data_add_enable = ~(n__69);
assign mem_enable0_4 = ~(add_ & n__57 & store_ & eae_mem_enable_);
assign ma_enable0_4 = ~(n__74 & n__62);
assign mem_enable5_8 = ~(eae_mem_enable_ & n__61 & mem_enable0_4_ & n__73);
assign ma_enable5_11 = ~(n__62);
assign pc_enable_ = ~(ts4 & n__65);
assign n__72 = ~(op1 & mb06);

// Sheet 6
assign n__82 = (ts2 & b_execute & isz) | (ts1 & pc_increment) | (op1 & mb11) | (n__80 & skip_or) | (ts3 & b_execute & jms);
assign n__81 = (word_count) | (mfts2 & key_exdp) | (ca_increment & current_address) | (ts2 & memory_increment & break);
assign double_right_rotate = ~(n__94);
assign right_shift = ~(tt_right_shift_enable_ & n__91 & eae_right_shift_enable_);
assign no_shift = ~(n__88 & n__83 & tt_carry_insert_ & c_no_shift_);
assign double_left_rotate = ~(n__90);
assign left_shift = ~(n__92 & eae_left_shift_enable_);
assign and_enable = ~(and_enable_);
assign n__80 = ~(int_skip_enable_ & io_pc_enable_ & pc_enable_);
assign n__83 = ~(op1_ & tt_shift_enable_ & eae_no_shift_enable);
assign n__77 = ~(ma04_ & ma05_ & ma06_ & ma07_);
assign n__78 = ~(ma00_ & ma01_ & ma02_ & ma03_);
assign op1 = ~(op1_);
assign ca_increment = ~(ca_increment_);
assign n__86 = ~(n__77 & tt_increment_);
assign n__75 = ~(ma08 & defer);
assign n__87 = ~(n__78 & tt_increment_);
assign n__85 = ~(n__75 & tt_increment_);
assign n__90 = ~(mb09 & op1 & mb10);
assign n__91 = ~(mb08 & op1 & mb10_);
assign n__88 = ~(mb08_ & op1 & mb09_);
assign and_enable_ = ~(and_h & ts3 & b_execute);
assign n__94 = ~(mb08 & op1 & mb10);
assign n__92 = ~(mb09 & op1 & mb10_);
assign auto_index_ = ~(n__87 & n__86 & n__85 & mem_enable0_4);
assign n__89 = ~(auto_index_ & n__82 & n__81 & tt_carry_insert_);
assign op1_ = ~(opr & ts3 & b_fetch & mb03_);
assign pc_increment = ~(fetch_ & eae_execute_ & tt_cycle_);
assign carry_insert_ = ~(n__89);

// Sheet 7
// synthesis attribute CLOCK_SIGNAL of n__111 is "yes";
always @(posedge n__111, negedge b_power_clear_, negedge pc_load_) begin
  if (~b_power_clear_)
    skip_ <= 1'b0;
  else if (~pc_load_)
    skip_ <= 1'b1;
  else if (n__111)
    skip_ <= n__108;
end
assign n__104 = ~(ac00 & mb05);
assign mid_ac0 = ~(n__99);
assign n__103 = ~(n__100);
assign low_ac0 = ~(n__98);
assign n__102 = ~(link & mb07);
assign n__105 = ~(n__104 & n__101 & n__102);
assign n__111 = ~(n__113 & tp2e_ & n__115);
assign n__107 = ~(mb11_ & n__105 & op2);
assign n__113 = ~(tp3 & b_fetch & opr);
assign n__96 = (tp3 & jmp & mb03_ & b_fetch) | (tp1 & pc_increment) | (tp3 & tt_carry_insert) | (mftp2 & key_laexdp) | (tp3 & defer & jmp);
assign n__95 = (tp3 & n__93 & b_execute) | (mftp2 & key_st) | (io_strobe & iot) | (tp3 & b_fetch & opr);
assign n__108 = (ts2 & b_execute & carry_out0 & isz) | (io_enable & io_skip) | (n__106 & mb08_) | (n__107 & op2 & mb08 & mb11_);
assign ma_load = ~(n__110 & n__109);
assign mb_load = ~(n__112);
assign pc_load = ~(n__750 & n__96 & n__97);
assign ac_load = ~(eae_tp_ & n__95 & tt_ac_load_ & mem_ext_ac_load_enable_);
assign n__101 = ~(n__103 & mid_ac0 & low_ac0 & mb06);
assign n__99 = ~(ac04_ & ac05_ & ac06_ & ac07_);
assign n__100 = ~(ac00_ & ac01_ & ac02_ & ac03_);
assign n__98 = ~(ac08_ & ac09_ & ac10_ & ac11_);
assign pc_load_ = ~(pc_load);
assign n__106 = ~(n__107);
assign tp2e_ = ~(tp2 & b_execute);
assign n__115 = ~(io_strobe & skip_);
assign n__97 = ~(tp3 & b_execute & jms);
assign n__93 = ~(and_ & tad_ & dca_);
assign n__110 = ~(mftp1 & key_stexdp);
assign n__112 = ~(tp2);
assign n__109 = ~(tp4);
assign n__750 = ~(io_pc_load);

// Sheet 8
assign load_sf_ = ~(int_ok & ts4 & int_strobe_);
assign n__117 = ~(break & memory_increment);
assign n__118 = ~(word_count_ & n__117);
assign clear_ifdfbf_ = ~(n__135 & n__125 & mb10);
assign int_ok_ = ~(int_sync & int_inhibit_ & int_delay);
assign n0_to_int_enab_ = (tp1 & int_ok) | (mftp2 & key_st);
// synthesis attribute CLOCK_SIGNAL of tp4 is "yes";
always @(posedge tp4, negedge n__116) begin
  if (~n__116)
    add_accepted_ <= 1'b1;
  else if (tp4)
    add_accepted_ <= break_ok_;
end
// synthesis attribute CLOCK_SIGNAL of tp2 is "yes";
always @(posedge tp2) begin
  if (tp2)
    wc_overflow_ <= n__119;
end
// synthesis attribute CLOCK_SIGNAL of int_strobe is "yes";
always @(posedge int_strobe, negedge manual_preset_) begin
  if (~manual_preset_)
    int_sync__ <= 1'b1;
  else if (int_strobe)
    int_sync__ <= n__23;
end
assign int_sync = ~int_sync__;
// synthesis attribute CLOCK_SIGNAL of n__122 is "yes";
always @(posedge n__122, negedge int_enable) begin
  if (~int_enable)
    int_delay__ <= 1'b1;
  else if (n__122)
    int_delay__ <= int_enable_;
end
assign int_delay = ~int_delay__;
// synthesis attribute CLOCK_SIGNAL of n__123 is "yes";
always @(posedge n__123, negedge n0_to_int_enab_) begin
  if (~n0_to_int_enab_)
    int_enable_ <= 1'b1;
  else if (n__123)
    int_enable_ <= mb11_;
end
assign int_enable = ~int_enable_;
assign n__23 = ~(int_rqst & key_laexdp_ & f_set);
assign n__127 = ~(int_strobe & n__124 & n__125 & n__135);
assign n__126 = ~(iot & b_fetch & mb03_ & mb04_);
assign n__116 = ~(n__114);
assign n__114 = ~(strobe_ & manual_preset_);
assign n__119 = ~(n__118 & carry_out0);
assign n__121 = ~(int_strobe & b_fetch);
assign int_ok = ~(int_ok_);
assign n__125 = ~(n__126);
assign n__122 = ~(n__121);
assign n__123 = ~(n__127);
assign n__124 = ~(mb10_ & mb11_);
assign n__135 = ~(n__134);
assign processor_iot_ = ~(n__125 & n__135);
assign n__134 = ~(mb05_ & mb06_ & mb07_ & mb08_);

// Sheet 9
// synthesis attribute CLOCK_SIGNAL of ac_load is "yes";
always @(posedge ac_load) begin
  if (ac_load)
    link <= n__128;
end
assign link_ = ~link;
// Latch ALU results in the appropriate register.
wire regbus00, regbus01;
always @(posedge ma_load) begin
  ma00 <= regbus00; // MA
  ma01 <= regbus01;
end
assign ma00_ = ~ma00;
assign ma01_ = ~ma01;
always @(posedge pc_load) begin
  pc00 <= regbus00; // PC
  pc01 <= regbus01;
end
assign pc00_ = ~pc00;
assign pc01_ = ~pc01;
always @(posedge mb_load) begin
  mb00 <= regbus00; // MB
  mb01 <= regbus01;
end
assign mb00_ = ~mb00;
assign mb01_ = ~mb01;
always @(posedge ac_load) begin
  ac00 <= regbus00; // AC
  ac01 <= regbus01;
end
assign ac00_ = ~ac00;
assign ac01_ = ~ac01;
// Latch ALU results in the appropriate register.
wire regbus02, regbus03;
always @(posedge ma_load) begin
  ma02 <= regbus02; // MA
  ma03 <= regbus03;
end
assign ma02_ = ~ma02;
assign ma03_ = ~ma03;
always @(posedge pc_load) begin
  pc02 <= regbus02; // PC
  pc03 <= regbus03;
end
assign pc02_ = ~pc02;
assign pc03_ = ~pc03;
always @(posedge mb_load) begin
  mb02 <= regbus02; // MB
  mb03 <= regbus03;
end
assign mb02_ = ~mb02;
assign mb03_ = ~mb03;
always @(posedge ac_load) begin
  ac02 <= regbus02; // AC
  ac03 <= regbus03;
end
assign ac02_ = ~ac02;
assign ac03_ = ~ac03;
// Latch ALU results in the appropriate register.
wire regbus04, regbus05;
always @(posedge ma_load) begin
  ma04 <= regbus04; // MA
  ma05 <= regbus05;
end
assign ma04_ = ~ma04;
assign ma05_ = ~ma05;
always @(posedge pc_load) begin
  pc04 <= regbus04; // PC
  pc05 <= regbus05;
end
assign pc04_ = ~pc04;
assign pc05_ = ~pc05;
always @(posedge mb_load) begin
  mb04 <= regbus04; // MB
  mb05 <= regbus05;
end
assign mb04_ = ~mb04;
assign mb05_ = ~mb05;
always @(posedge ac_load) begin
  ac04 <= regbus04; // AC
  ac05 <= regbus05;
end
assign ac04_ = ~ac04;
assign ac05_ = ~ac05;
// Latch ALU results in the appropriate register.
wire regbus06, regbus07;
always @(posedge ma_load) begin
  ma06 <= regbus06; // MA
  ma07 <= regbus07;
end
assign ma06_ = ~ma06;
assign ma07_ = ~ma07;
always @(posedge pc_load) begin
  pc06 <= regbus06; // PC
  pc07 <= regbus07;
end
assign pc06_ = ~pc06;
assign pc07_ = ~pc07;
always @(posedge mb_load) begin
  mb06 <= regbus06; // MB
  mb07 <= regbus07;
end
assign mb06_ = ~mb06;
assign mb07_ = ~mb07;
always @(posedge ac_load) begin
  ac06 <= regbus06; // AC
  ac07 <= regbus07;
end
assign ac06_ = ~ac06;
assign ac07_ = ~ac07;
// Latch ALU results in the appropriate register.
wire regbus08, regbus09;
always @(posedge ma_load) begin
  ma08 <= regbus08; // MA
  ma09 <= regbus09;
end
assign ma08_ = ~ma08;
assign ma09_ = ~ma09;
always @(posedge pc_load) begin
  pc08 <= regbus08; // PC
  pc09 <= regbus09;
end
assign pc08_ = ~pc08;
assign pc09_ = ~pc09;
always @(posedge mb_load) begin
  mb08 <= regbus08; // MB
  mb09 <= regbus09;
end
assign mb08_ = ~mb08;
assign mb09_ = ~mb09;
always @(posedge ac_load) begin
  ac08 <= regbus08; // AC
  ac09 <= regbus09;
end
assign ac08_ = ~ac08;
assign ac09_ = ~ac09;
// Latch ALU results in the appropriate register.
wire regbus10, regbus11;
always @(posedge ma_load) begin
  ma10 <= regbus10; // MA
  ma11 <= regbus11;
end
assign ma10_ = ~ma10;
assign ma11_ = ~ma11;
always @(posedge pc_load) begin
  pc10 <= regbus10; // PC
  pc11 <= regbus11;
end
assign pc10_ = ~pc10;
assign pc11_ = ~pc11;
always @(posedge mb_load) begin
  mb10 <= regbus10; // MB
  mb11 <= regbus11;
end
assign mb10_ = ~mb10;
assign mb11_ = ~mb11;
always @(posedge ac_load) begin
  ac10 <= regbus10; // AC
  ac11 <= regbus11;
end
assign ac10_ = ~ac10;
assign ac11_ = ~ac11;
assign n__130 = ~(adder11_ & eae_on_ & tt_inst_);
assign adder11_ = ~(adder11);
assign n__129 = ~(n__137);
assign carry_out0 = ~(carry_out0_);
assign n__128 = (n__130 & asr_l_set_ & right_shift) | (adder10 & double_right_rotate) | (adder_l_ & no_shift) | (adder00 & left_shift) | (adder01 & double_left_rotate);
assign n__137 = (tt_shift_enable & tt_inst_ & tt_data) | (link & l_enable) | (link_ & lbar_enable) | (ac00 & b_eae_on & asr_enable & eae_ir2_);
assign adder_l_ = (n__137 & carry_out0) | (n__129 & carry_out0_);

// Sheet 10
// This hair takes two operand bits and carry-in, adds them, and
// generates two bits of result and a carry-out.  Note that the
// inputs are complemented, and therefore, so are the outputs.
assign {carry_out0_, adder00, adder01} = n__160 + { ~(mq_enable & mq00 | ac_enable & ac00 | acbar_enable & ac00_ | data_enable & data00 | sr_enable & sr00 | 1'b0 | io_enable & input_bus00), ~(mq_enable & mq01 | 1'b0 | ac_enable & ac01 | acbar_enable & ac01_ | data_enable & data01 | sr_enable & sr01 | 1'b0 | io_enable & input_bus01) } + { ~(mem_enable0_4 & mem00 | ma_enable0_4 & ma00 | pc_enable & pc00 | data_add_enable & data_add00), ~(mem_enable0_4 & mem01 | ma_enable0_4 & ma01 | pc_enable & pc01 | data_add_enable & data_add01) };
assign regbus00 = ~(and_enable & mb00_ | double_right_rotate & adder11 | no_shift & adder00 | right_shift & adder_l_ | left_shift & adder01 | double_left_rotate & adder02 | ~tt_line_shift_ & adder_l_);
assign regbus01 = ~(and_enable & mb01_ | double_right_rotate & adder_l_ | no_shift & adder01 | right_shift & adder00 | left_shift & adder02 | double_left_rotate & adder03 | ~tt_line_shift_ & adder01);
// This hair takes two operand bits and carry-in, adds them, and
// generates two bits of result and a carry-out.  Note that the
// inputs are complemented, and therefore, so are the outputs.
assign {n__160, adder02, adder03} = n__133 + { ~(mq_enable & mq02 | ac_enable & ac02 | acbar_enable & ac02_ | data_enable & data02 | sr_enable & sr02 | 1'b0 | io_enable & input_bus02), ~(mq_enable & mq03 | 1'b0 | ac_enable & ac03 | acbar_enable & ac03_ | data_enable & data03 | sr_enable & sr03 | 1'b0 | io_enable & input_bus03) } + { ~(mem_enable0_4 & mem02 | ma_enable0_4 & ma02 | pc_enable & pc02 | data_add_enable & data_add02), ~(mem_enable0_4 & mem03 | ma_enable0_4 & ma03 | pc_enable & pc03 | data_add_enable & data_add03) };
assign regbus02 = ~(and_enable & mb02_ | double_right_rotate & adder00 | no_shift & adder02 | right_shift & adder01 | left_shift & adder03 | double_left_rotate & adder04 | ~tt_line_shift_ & adder02);
assign regbus03 = ~(and_enable & mb03_ | double_right_rotate & adder01 | no_shift & adder03 | right_shift & adder02 | left_shift & adder04 | double_left_rotate & adder03 | ~tt_line_shift_ & adder03);

// Sheet 11
// This hair takes two operand bits and carry-in, adds them, and
// generates two bits of result and a carry-out.  Note that the
// inputs are complemented, and therefore, so are the outputs.
assign {n__133, adder04, adder05} = carry_out6_ + { ~(mq_enable & mq04 | ac_enable & ac04 | acbar_enable & ac04_ | data_enable & data04 | sr_enable & sr04 | 1'b0 | io_enable & input_bus04), ~(mq_enable & mq05 | 1'b0 | ac_enable & ac05 | acbar_enable & ac05_ | data_enable & data05 | sr_enable & sr05 | 1'b0 | io_enable & input_bus05) } + { ~(mem_enable0_4 & mem04 | ma_enable0_4 & ma04 | pc_enable & pc04 | data_add_enable & data_add04), ~(mem_enable5_8 & mem05 | ma_enable5_11 & ma05 | pc_enable & pc05 | data_add_enable & data_add05) };
assign regbus04 = ~(and_enable & mb04_ | double_right_rotate & adder02 | no_shift & adder04 | right_shift & adder03 | left_shift & adder05 | double_left_rotate & adder06 | ~tt_line_shift_ & adder03);
assign regbus05 = ~(and_enable & mb05_ | double_right_rotate & adder03 | no_shift & adder05 | right_shift & adder04 | left_shift & adder06 | double_left_rotate & adder03 | ~tt_line_shift_ & adder05);

// Sheet 12
// This hair takes two operand bits and carry-in, adds them, and
// generates two bits of result and a carry-out.  Note that the
// inputs are complemented, and therefore, so are the outputs.
assign {carry_out6_, adder06, adder07} = n__132 + { ~(mq_enable & mq06 | ac_enable & ac06 | acbar_enable & ac06_ | data_enable & data06 | sr_enable & sr06 | 1'b0 | io_enable & input_bus06), ~(mq_enable & mq07 | 1'b0 | ac_enable & ac07 | acbar_enable & ac07_ | data_enable & data07 | sr_enable & sr07 | 1'b0 | io_enable & input_bus07) } + { ~(mem_enable5_8 & mem06 | ma_enable5_11 & ma06 | pc_enable & pc06 | data_add_enable & data_add06), ~(mem_enable5_8 & mem07 | ma_enable5_11 & ma07 | pc_enable & pc07 | data_add_enable & data_add07) };
assign regbus06 = ~(and_enable & mb06_ | double_right_rotate & adder04 | no_shift & adder06 | right_shift & adder05 | left_shift & adder07 | double_left_rotate & adder08 | ~tt_line_shift_ & adder05);
assign regbus07 = ~(and_enable & mb07_ | double_right_rotate & adder05 | no_shift & adder07 | right_shift & adder06 | left_shift & adder08 | double_left_rotate & adder09 | ~tt_line_shift_ & adder07);
// This hair takes two operand bits and carry-in, adds them, and
// generates two bits of result and a carry-out.  Note that the
// inputs are complemented, and therefore, so are the outputs.
assign {n__132, adder08, adder09} = n__136 + { ~(mq_enable & mq08 | ac_enable & ac08 | acbar_enable & ac08_ | data_enable & data08 | sr_enable & sr08 | 1'b0 | io_enable & input_bus08), ~(mq_enable & mq09 | 1'b0 | ac_enable & ac09 | acbar_enable & ac09_ | data_enable & data09 | sr_enable & sr09 | 1'b0 | io_enable & input_bus09) } + { ~(mem_enable5_8 & mem08 | ma_enable5_11 & ma08 | pc_enable & pc08 | data_add_enable & data_add08), ~(mem_enable9_11 & mem09 | ma_enable5_11 & ma09 | pc_enable & pc09 | data_add_enable & data_add09) };
assign regbus08 = ~(and_enable & mb08_ | double_right_rotate & adder06 | no_shift & adder08 | right_shift & adder07 | left_shift & adder09 | double_left_rotate & adder10 | ~tt_line_shift_ & adder08);
assign regbus09 = ~(and_enable & mb09_ | double_right_rotate & adder07 | no_shift & adder09 | right_shift & adder08 | left_shift & adder10 | double_left_rotate & adder09 | ~tt_line_shift_ & adder09);

// Sheet 13
assign n__140 = ~(eae_on_ & adder_l_);
assign e25d1 = ~(n__140 & eae_mq0bar_enable_ & eae_mq0_enable_);
// This hair takes two operand bits and carry-in, adds them, and
// generates two bits of result and a carry-out.  Note that the
// inputs are complemented, and therefore, so are the outputs.
assign {n__136, adder10, adder11} = carry_insert_ + { ~(mq_enable & mq10 | ac_enable & ac10 | acbar_enable & ac10_ | data_enable & data10 | sr_enable & sr10 | 1'b0 | io_enable & input_bus10), ~(mq_enable & mq11 | tt_carry_insert_s | ac_enable & ac11 | acbar_enable & ac11_ | data_enable & data11 | sr_enable & sr11 | 1'b0 | io_enable & input_bus11) } + { ~(mem_enable9_11 & mem10 | ma_enable5_11 & ma10 | pc_enable & pc10 | data_add_enable & data_add10), ~(mem_enable9_11 & mem11 | ma_enable5_11 & ma11 | pc_enable & pc11 | data_add_enable & data_add11) };
assign regbus10 = ~(and_enable & mb10_ | double_right_rotate & adder08 | no_shift & adder10 | right_shift & adder09 | left_shift & adder11 | double_left_rotate & e25d1 | ~tt_line_shift_ & adder10);
assign regbus11 = ~(and_enable & mb11_ | double_right_rotate & adder09 | no_shift & adder11 | right_shift & adder10 | left_shift & e25d1 | double_left_rotate & adder00 | ~tt_line_shift_ & adder11);

// Sheet 14
assign bac00 = ac00;
assign bac00 = 1'b1; // h07d2 pull-up
assign bac01 = ac01;
assign bac01 = 1'b1; // h07k2 pull-up
assign bac02 = ac02;
assign bac02 = 1'b1; // h07s2 pull-up
assign bac03 = ac03;
assign bac03 = 1'b1; // h08d2 pull-up
assign bac04 = ac04;
assign bac04 = 1'b1; // h08k2 pull-up
assign bac05 = ac05;
assign bac05 = 1'b1; // h08s2 pull-up
assign bac06 = ac06;
assign bac06 = 1'b1; // h09d2 pull-up
assign bac07 = ac07;
assign bac07 = 1'b1; // h09k2 pull-up
assign bac08 = ac08;
assign bac08 = 1'b1; // h09s2 pull-up
assign bac09 = ac09;
assign bac09 = 1'b1; // h10d2 pull-up
assign bac10 = ac10;
assign bac10 = 1'b1; // h10k2 pull-up
assign bac11 = ac11;
assign bac11 = 1'b1; // h10s2 pull-up
assign biop1_ = iop1_;
assign biop1_ = 1'b1; // h11d2 pull-up
assign biop2_ = iop2_;
assign biop2_ = 1'b1; // h11k2 pull-up
assign biop4_ = iop4_;
assign biop4_ = 1'b1; // h11s2 pull-up
assign bts3 = ts3_;
assign bts3 = 1'b1; // h12d2 pull-up
assign bts1 = ts1_;
assign bts1 = 1'b1; // h12k2 pull-up
assign binitialize_ = initialize_;
assign binitialize_ = 1'b1; // h12s2 pull-up
assign bmb00 = mb00;
assign bmb00 = 1'b1; // h13d2 pull-up
assign bmb01 = mb01;
assign bmb01 = 1'b1; // h13k2 pull-up
assign bmb02 = mb02;
assign bmb02 = 1'b1; // h13s2 pull-up
assign bmb03_ = mb03_;
assign bmb03_ = 1'b1; // h14d2 pull-up
assign bmb03 = mb03;
assign bmb03 = 1'b1; // h14k2 pull-up
assign bmb04_ = mb04_;
assign bmb04_ = 1'b1; // h14s2 pull-up
assign bmb04 = mb04;
assign bmb04 = 1'b1; // h15d2 pull-up
assign bmb05_ = mb05_;
assign bmb05_ = 1'b1; // h15k2 pull-up
assign bmb05 = mb05;
assign bmb05 = 1'b1; // h15s2 pull-up
assign bmb06_ = mb06_;
assign bmb06_ = 1'b1; // h16d2 pull-up
assign bmb06 = mb06;
assign bmb06 = 1'b1; // h16k2 pull-up
assign bmb07_ = mb07_;
assign bmb07_ = 1'b1; // h16s2 pull-up
assign bmb07 = mb07;
assign bmb07 = 1'b1; // h17d2 pull-up
assign bmb08_ = mb08_;
assign bmb08_ = 1'b1; // h17k2 pull-up
assign bmb08 = mb08;
assign bmb08 = 1'b1; // h17s2 pull-up
assign bmb09 = mb09;
assign bmb09 = 1'b1; // h18d2 pull-up
assign bmb10 = mb10;
assign bmb10 = 1'b1; // h18k2 pull-up
assign bmb11 = mb11;
assign bmb11 = 1'b1; // h18s2 pull-up
assign brun_ = run_;
assign brun_ = 1'b1; // h19d2 pull-up
assign btt_inst_ = tt_inst_;
assign btt_inst_ = 1'b1; // h19k2 pull-up
assign bwc_overflow = wc_overflow_;
assign bwc_overflow = 1'b1; // h19s2 pull-up
assign bbreak = break_;
assign bbreak = 1'b1; // h20d2 pull-up
assign badd_accepted_ = add_accepted_ & ts1_;
assign badd_accepted_ = 1'b1; // h20k2 pull-up
assign input_bus00 = ~(in00 & io_bus_in00_);
assign input_bus02 = ~(in02 & io_bus_in02_);
assign input_bus04 = ~(in04 & io_bus_in04_ & tt0_);
assign input_bus01 = ~(in01 & io_bus_in01_);
assign input_bus03 = ~(in03 & io_bus_in03_);
assign input_bus05 = ~(in05 & io_bus_in05_ & tt1_ & me05_);
assign in00 = 1'b1; // j13a1 pull-up
assign io_bus_in00_ = 1'b1; // j13b1 pull-up
assign in02 = 1'b1; // j13f1 pull-up
assign io_bus_in02_ = 1'b1; // j13h1 pull-up
assign in04 = 1'b1; // j13m1 pull-up
assign io_bus_in04_ = 1'b1; // j13n1 pull-up
assign in01 = 1'b1; // j13d2 pull-up
assign io_bus_in01_ = 1'b1; // j13e2 pull-up
assign in03 = 1'b1; // j13k2 pull-up
assign io_bus_in03_ = 1'b1; // j13l2 pull-up
assign in05 = 1'b1; // j13r2 pull-up
assign io_bus_in05_ = 1'b1; // j13s2 pull-up
assign input_bus06 = ~(in06 & io_bus_in06_ & tt2_ & me06_);
assign input_bus08 = ~(in08 & io_bus_in08_ & tt4_ & me08_);
assign input_bus10 = ~(in10 & io_bus_in10_ & tt6_ & me10_);
assign input_bus07 = ~(in07 & io_bus_in07_ & tt3_ & me07_);
assign input_bus09 = ~(in09 & io_bus_in09_ & tt5_ & me09_);
assign input_bus11 = ~(in11 & io_bus_in11_ & tt7_ & me11_);
assign in06 = 1'b1; // j14a1 pull-up
assign io_bus_in06_ = 1'b1; // j14b1 pull-up
assign in08 = 1'b1; // j14f1 pull-up
assign io_bus_in08_ = 1'b1; // j14h1 pull-up
assign in10 = 1'b1; // j14m1 pull-up
assign io_bus_in10_ = 1'b1; // j14n1 pull-up
assign in07 = 1'b1; // j14d2 pull-up
assign io_bus_in07_ = 1'b1; // j14e2 pull-up
assign in09 = 1'b1; // j14k2 pull-up
assign io_bus_in09_ = 1'b1; // j14l2 pull-up
assign in11 = 1'b1; // j14r2 pull-up
assign io_bus_in11_ = 1'b1; // j14s2 pull-up
assign io_skip = ~(skipb & io_bus_in_skip_ & tt_skip_ & mp_skip_);
assign ac_clear = ~(acclr & nc & tt_ac_clr_ & clock_ac_clr_);
assign brk_rqst = ~(brq & n__246 & n__246 & n__246);
assign int_rqst = ~(irq & io_bus_in_int_ & tt_int_ & mp_int_);
assign line_ = ~(line_in & n__243 & n__243 & n__243);
assign data_in_ = ~(d_in_ & n__245 & n__245 & n__245);
assign skipb = 1'b1; // j15a1 pull-up
assign io_bus_in_skip_ = 1'b1; // j15b1 pull-up
assign acclr = 1'b1; // j15f1 pull-up
assign nc = 1'b1; // j15h1 pull-up
assign brq = 1'b1; // j15m1 pull-up
assign n__246 = 1'b1; // j15n1 pull-up
assign irq = 1'b1; // j15d2 pull-up
assign io_bus_in_int_ = 1'b1; // j15e2 pull-up
assign line_in = 1'b1; // j15k2 pull-up
assign n__243 = 1'b1; // j15l2 pull-up
assign d_in_ = 1'b1; // j15r2 pull-up
assign n__245 = 1'b1; // j15s2 pull-up
assign data_add00 = ~(da00 & n__202 & n__202 & n__202);
assign data_add02 = ~(da02 & n__203 & n__203 & n__203);
assign data_add04 = ~(da04 & n__201 & n__201 & n__201);
assign data_add01 = ~(da01 & n__200 & n__200 & n__200);
assign data_add03 = ~(da03 & n__204 & n__204 & n__204);
assign data_add05 = ~(da05 & n__205 & n__205 & n__205);
assign da00 = 1'b1; // j16a1 pull-up
assign n__202 = 1'b1; // j16b1 pull-up
assign da02 = 1'b1; // j16f1 pull-up
assign n__203 = 1'b1; // j16h1 pull-up
assign da04 = 1'b1; // j16m1 pull-up
assign n__201 = 1'b1; // j16n1 pull-up
assign da01 = 1'b1; // j16d2 pull-up
assign n__200 = 1'b1; // j16e2 pull-up
assign da03 = 1'b1; // j16k2 pull-up
assign n__204 = 1'b1; // j16l2 pull-up
assign da05 = 1'b1; // j16r2 pull-up
assign n__205 = 1'b1; // j16s2 pull-up
assign data_add06 = ~(da06 & n__207 & n__207 & n__207);
assign data_add08 = ~(da08 & n__209 & n__209 & n__209);
assign data_add10 = ~(da10 & n__206 & n__206 & n__206);
assign data_add07 = ~(da07 & n__208 & n__208 & n__208);
assign data_add09 = ~(da09 & n__210 & n__210 & n__210);
assign data_add11 = ~(da11 & n__211 & n__211 & n__211);
assign da06 = 1'b1; // j17a1 pull-up
assign n__207 = 1'b1; // j17b1 pull-up
assign da08 = 1'b1; // j17f1 pull-up
assign n__209 = 1'b1; // j17h1 pull-up
assign da10 = 1'b1; // j17m1 pull-up
assign n__206 = 1'b1; // j17n1 pull-up
assign da07 = 1'b1; // j17d2 pull-up
assign n__208 = 1'b1; // j17e2 pull-up
assign da09 = 1'b1; // j17k2 pull-up
assign n__210 = 1'b1; // j17l2 pull-up
assign da11 = 1'b1; // j17r2 pull-up
assign n__211 = 1'b1; // j17s2 pull-up
assign data00 = ~(d00 & n__223 & n__223 & n__223);
assign data02 = ~(d02 & n__221 & n__221 & n__221);
assign data04 = ~(d04 & n__219 & n__219 & n__219);
assign data01 = ~(d01 & n__222 & n__222 & n__222);
assign data03 = ~(d03 & n__220 & n__220 & n__220);
assign data05 = ~(d05 & n__218 & n__218 & n__218);
assign d00 = 1'b1; // j18a1 pull-up
assign n__223 = 1'b1; // j18b1 pull-up
assign d02 = 1'b1; // j18f1 pull-up
assign n__221 = 1'b1; // j18h1 pull-up
assign d04 = 1'b1; // j18m1 pull-up
assign n__219 = 1'b1; // j18n1 pull-up
assign d01 = 1'b1; // j18d2 pull-up
assign n__222 = 1'b1; // j18e2 pull-up
assign d03 = 1'b1; // j18k2 pull-up
assign n__220 = 1'b1; // j18l2 pull-up
assign d05 = 1'b1; // j18r2 pull-up
assign n__218 = 1'b1; // j18s2 pull-up
assign data06 = ~(d06 & n__217 & n__217 & n__217);
assign data08 = ~(d08 & n__215 & n__215 & n__215);
assign data10 = ~(d10 & n__213 & n__213 & n__213);
assign data07 = ~(d07 & n__216 & n__216 & n__216);
assign data09 = ~(d09 & n__214 & n__214 & n__214);
assign data11 = ~(d11 & n__212 & n__212 & n__212);
assign d06 = 1'b1; // j19a1 pull-up
assign n__217 = 1'b1; // j19b1 pull-up
assign d08 = 1'b1; // j19f1 pull-up
assign n__215 = 1'b1; // j19h1 pull-up
assign d10 = 1'b1; // j19m1 pull-up
assign n__213 = 1'b1; // j19n1 pull-up
assign d07 = 1'b1; // j19d2 pull-up
assign n__216 = 1'b1; // j19e2 pull-up
assign d09 = 1'b1; // j19k2 pull-up
assign n__214 = 1'b1; // j19l2 pull-up
assign d11 = 1'b1; // j19r2 pull-up
assign n__212 = 1'b1; // j19s2 pull-up
assign memory_increment = ~(mem_incr & n__250 & n__250 & n__250);
assign ca_increment_ = ~(ca_incr_ & n__254 & n__254 & n__254);
assign ext_data_add1 = ~(eda1 & n__259 & n__259 & n__259);
assign n3_cycle = ~(n3cycle & n__253 & n__253 & n__253);
assign ext_data_add0 = ~(eda0 & n__260 & n__260 & n__260);
assign ext_data_add2 = ~(eda2 & n__261 & n__261 & n__261);
assign mem_incr = 1'b1; // j20a1 pull-up
assign n__250 = 1'b1; // j20b1 pull-up
assign ca_incr_ = 1'b1; // j20f1 pull-up
assign n__254 = 1'b1; // j20h1 pull-up
assign eda1 = 1'b1; // j20m1 pull-up
assign n__259 = 1'b1; // j20n1 pull-up
assign n3cycle = 1'b1; // j20d2 pull-up
assign n__253 = 1'b1; // j20e2 pull-up
assign eda0 = 1'b1; // j20k2 pull-up
assign n__260 = 1'b1; // j20l2 pull-up
assign eda2 = 1'b1; // j20r2 pull-up
assign n__261 = 1'b1; // j20s2 pull-up

// Sheet 15
TTYReceiver ef01m706(.ad2(mb03_), .ae1(mb04_), .ae2(kcc_), .af1(mb05_), .af2(keyboard_flag_), .ah1(mb06_), .ah2(mb07), .aj1(mb08), .aj2(tti2), .ak1(tti2), .ak2(tt0_), .al1(tt3_), .al2(iop4), .am1(tt4_), .am2(tti_data), .an1(tti_clock), .an2(tt7_), .ap2(tt5_), .ar1(tti_data), .ar2(tt1_), .as2(tt2_), .at2(tt6_), .au2(reader_run_), .av2(kcc_), .bd1(1'b0), .bd2(iop1), .be2(tt_ac_clr_), .bf2(initialize), .bh2(tti_skip_), .bj2(iop2), .bm2(rx_data), .br1(1'b1), .br2(in_stop_2_), .bt2(clock_scale_2), .bu1(clock_scale_2), .bv2(in_stop_2_));

// Sheet 16
assign tt_skip_ = ~(n__266);
assign tt_int_ = ~(n__265);
TTYTransmitter ef02m707(.ae1(mb04_), .ae2(mb03_), .af1(mb06), .af2(mb05_), .ah1(enable_), .ah2(mb07_), .aj2(mb08_), .ak1(enable), .ak2(enable), .al1(enable_), .al2(ac06), .am2(ac07), .an1(1'b1), .an2(1'b1), .ap2(ac04), .ar2(ac05), .as1(iop4), .as2(ac09), .at2(ac10), .au1(ac11), .au2(ac08), .av2(tx_data), .bd2(iop2), .be2(initialize), .bf2(1'b1), .bh2(iop1), .bj1(1'b1), .bj2(tto_skip_), .bk2(teleprinter_flag_), .bn1(out_stop2_), .bn2(out_stop2_), .bp2(tto_clock_), .bs2(1'b1));
Oscillator #(880) m452_hz880(dclk, 1'b1, hz880);
Oscillator #(220) m452_tto_clock_(dclk, 1'b1, tto_clock_);
assign tti_clock = hz880;
assign n__265 = ~(pwr_low_ & uint_ & keyboard_flag_ & teleprinter_flag_);
assign n__266 = ~(tti_skip_ & tto_skip_ & pwr_skip_);

// Sheet 17
DelayLine #(100) dl_n__277(dclk, n__274, n__277);
DelayLine #(200) dl_n__281(dclk, n__274, n__281);
assign n__282 = n__277;
assign n__283 = n__281;
DelayLine #(300) dl_n__284(dclk, n__283, n__284);
assign n__285 = n__284;
DelayLine #(150) dl_n__293(dclk, n__292, n__293);
DelayLine #(200) dl_n__275(dclk, n__292, n__275);
assign n__297 = n__293;
assign n__294 = n__275;
DelayLine #(400) dl_n__295(dclk, n__294, n__295);
assign mem_finish = n__295;
// a38: G624 Resistor Board
// not implemented (core memory)
// a39: G624 Resistor Board
// not implemented (core memory)
// ab01: G805 Negative Regulator
// not implemented (power supply)
// ab02: G826 Regulator Control
// not implemented (power supply)
assign shut_down_ = 1'b1; // ab02af2 pull-up
assign stop_ok = 1'b1; // ab02ah2 pull-up
assign power_ok_ = 1'b1; // ab02aj2 pull-up
assign power_clear_ = 1'b1; // ab02as2 pull-up
assign n__274 = ~(n__273);
assign n__273 = ~(n__272 & mem_start);
assign n__298 = ~(n__294);
assign n__271 = ~(ea0_ & ea1_);
assign n__296 = ~(n__297);
assign n__272 = ~(n__271);
assign n__270 = ~(power_clear_ & power_clear_);
// synthesis attribute CLOCK_SIGNAL of mem_start is "yes";
always @(posedge mem_start, negedge b_power_clear_) begin
  if (~b_power_clear_)
    mem_enable <= 1'b0;
  else if (mem_start)
    mem_enable <= n__272;
end
assign mem_enable_ = ~mem_enable;
// synthesis attribute CLOCK_SIGNAL of n__274 is "yes";
always @(posedge n__274, negedge b_power_clear_) begin
  if (~b_power_clear_)
    field <= 1'b0;
  else if (n__274)
    field <= ea2;
end
assign field_ = ~field;
// synthesis attribute CLOCK_SIGNAL of n__285 is "yes";
always @(posedge n__285, negedge b_power_clear_, negedge mem_begin_) begin
  if (~b_power_clear_)
    read <= 1'b0;
  else if (~mem_begin_)
    read <= 1'b1;
  else if (n__285)
    read <= 1'b0;
end
// synthesis attribute CLOCK_SIGNAL of mem_finish is "yes";
always @(posedge mem_finish, negedge b_power_clear_, negedge n__296) begin
  if (~b_power_clear_)
    inhibit <= 1'b0;
  else if (~n__296)
    inhibit <= 1'b1;
  else if (mem_finish)
    inhibit <= 1'b0;
end
assign inhibit_ = ~inhibit;
// synthesis attribute CLOCK_SIGNAL of mem_finish is "yes";
always @(posedge mem_finish, negedge b_power_clear_, negedge n__298) begin
  if (~b_power_clear_)
    write <= 1'b0;
  else if (~n__298)
    write <= 1'b1;
  else if (mem_finish)
    write <= 1'b0;
end
Monostable #(100) m360s_strobe_field0(dclk, n__283 & field_, strobe_field0);
assign strobe_ = ~strobe_field0;
Monostable #(100) m360s_strobe_field1(dclk, n__283 & field, strobe_field1);
assign strobe_ = ~strobe_field1;
assign b_mem_enable = ~(mem_enable_);
assign bb_field_ = ~(field);
assign mem_begin_ = ~(n__282);
assign b_field = ~(field_);
assign b_inhibit = ~(inhibit_);
assign b_field_ = ~(field);
// b38: G624 Resistor Board
// not implemented (core memory)
// b39: G624 Resistor Board
// not implemented (core memory)
assign bb_field = ~(field_);
assign b_power_clear_ = ~(n__270 & n__270 & n__270 & n__270);
// c39: G228 Inhibit Driver
// not implemented (core memory)
assign n__287 = ~(s & n__285);
assign n__290 = ~(n__291);
assign n__288 = ~(n__287);
DelayLine #(300) dl_n__289(dclk, n__288, n__289);
assign n__291 = n__289;
// d39: G228 Inhibit Driver
// not implemented (core memory)
assign n__292 = ~(n__290 & n__286);
assign n__286 = ~(s_ & n__285);

// Sheet 18
// a30: G021 Core Sense Amplifier
// not implemented (core memory)
// a31: G021 Core Sense Amplifier
// not implemented (core memory)
// a32: G021 Core Sense Amplifier
// not implemented (core memory)
// a33: G021 Core Sense Amplifier
// not implemented (core memory)
// a36: G228 Inhibit Driver
// not implemented (core memory)
// a37: G228 Inhibit Driver
// not implemented (core memory)
// b31: G021 Core Sense Amplifier
// not implemented (core memory)
// b32: G021 Core Sense Amplifier
// not implemented (core memory)
// b33: G021 Core Sense Amplifier
// not implemented (core memory)
// b36: G228 Inhibit Driver
// not implemented (core memory)
// b37: G228 Inhibit Driver
// not implemented (core memory)

// Sheet 19
// c37: G221 Memory Selector
// not implemented (core memory)
// c38: G221 Memory Selector
// not implemented (core memory)
// cd34: G610 Diode Board
// not implemented (core memory)
// cd36: G611A Diode Board
// not implemented (core memory)
// d32: G221 Memory Selector
// not implemented (core memory)
// d33: G221 Memory Selector
// not implemented (core memory)

// Sheet 20
// c32: G221 Memory Selector
// not implemented (core memory)
// c33: G221 Memory Selector
// not implemented (core memory)
// d37: G221 Memory Selector
// not implemented (core memory)
// d38: G221 Memory Selector
// not implemented (core memory)

// Sheet 21
assign n__411 = ~(if_enable & if0);
assign n__410 = ~(df_enable & df0);
assign n__413 = ~(if_enable & if1);
assign n__415 = ~(bf_enable & bf1);
assign n__417 = ~(df_enable & df2);
assign n__409 = ~(bf_enable & bf0);
assign n__414 = ~(df_enable & df1);
assign n__416 = ~(if_enable & if2);
assign n__418 = ~(bf_enable & bf2);
assign n__263 = ~(wc_set_ & word_count_);
assign n__403 = ~(n__263);
assign n__412 = ~(n__408 & ts4_);
assign n__407 = ~(tp3 & b_set);
assign if_to_sf = ~(n__53 & load_sf_);
assign b_set_ = ~(b_set);
assign n__408 = ~(key_stexdp & mftp1);
assign load_bf = ~(n__407);
assign n__264 = ~(n__53 & load_sf_);
Monostable #(35000) b10e2(dclk, run & tp3, strobe___);
assign strobe_ = strobe___;
assign strobe_ = 1'b1;
Monostable #(40000) b10d2(dclk, run & tp3, mem_done_);
// synthesis attribute CLOCK_SIGNAL of n__412 is "yes";
always @(posedge n__412, negedge manual_preset_) begin
  if (~manual_preset_)
    if_enable__ <= 1'b1;
  else if (n__412)
    if_enable__ <= if_enable_;
end
assign if_enable = ~if_enable__;
// synthesis attribute CLOCK_SIGNAL of n__412 is "yes";
always @(posedge n__412, negedge manual_preset_) begin
  if (~manual_preset_)
    df_enable__ <= 1'b1;
  else if (n__412)
    df_enable__ <= df_enable_;
end
assign df_enable = ~df_enable__;
// synthesis attribute CLOCK_SIGNAL of n__412 is "yes";
always @(posedge n__412, negedge manual_preset_) begin
  if (~manual_preset_)
    bf_enable__ <= 1'b1;
  else if (n__412)
    bf_enable__ <= b_set_;
end
assign bf_enable = ~bf_enable__;
assign mcbmb00_ = ~(mb00);
assign mcbmb02_ = ~(mb02);
assign mcbmb04_ = ~(mb04);
assign mcbmb01_ = ~(mb01);
assign mcbmb03_ = ~(mb03);
assign mcbmb05_ = ~(mb05);
assign mcbmb06_ = ~(mb06);
assign mcbmb08_ = ~(mb08);
assign mcbmb10_ = ~(mb10);
assign mcbmb07_ = ~(mb07);
assign mcbmb09_ = ~(mb09);
assign mcbmb11_ = ~(mb11);
assign bma00 = ~(ma00_);
assign bma02 = ~(ma02_);
assign bma04 = ~(ma04_);
assign bma01 = ~(ma01_);
assign bma03 = ~(ma03_);
assign bma05 = ~(ma05_);
assign bma06 = ~(ma06_);
assign bma08 = ~(ma08_);
assign bma10 = ~(ma10_);
assign bma07 = ~(ma07_);
assign bma09 = ~(ma09_);
assign bma11 = ~(ma11_);
assign ea0 = ~(n__411 & n__410 & n__409);
assign ea2 = ~(n__416 & n__417 & n__418);
assign ea0_ = ~(ea0);
assign ea1 = ~(n__413 & n__414 & n__415);
assign ea1_ = ~(ea1);
// synthesis attribute CLOCK_SIGNAL of load_bf is "yes";
always @(posedge load_bf) begin
  if (load_bf)
    bf0 <= ext_data_add0;
end
// synthesis attribute CLOCK_SIGNAL of load_bf is "yes";
always @(posedge load_bf) begin
  if (load_bf)
    bf1 <= ext_data_add1;
end
// synthesis attribute CLOCK_SIGNAL of load_bf is "yes";
always @(posedge load_bf) begin
  if (load_bf)
    bf2 <= ext_data_add2;
end
// synthesis attribute CLOCK_SIGNAL of if_to_sf is "yes";
always @(posedge if_to_sf) begin
  if (if_to_sf)
    sf0 <= if0;
end
// synthesis attribute CLOCK_SIGNAL of if_to_sf is "yes";
always @(posedge if_to_sf) begin
  if (if_to_sf)
    sf1 <= if1;
end
// synthesis attribute CLOCK_SIGNAL of n__264 is "yes";
always @(posedge n__264) begin
  if (n__264)
    sf2 <= if2;
end
// synthesis attribute CLOCK_SIGNAL of n__264 is "yes";
always @(posedge n__264) begin
  if (n__264)
    sf3 <= df0;
end
// synthesis attribute CLOCK_SIGNAL of n__264 is "yes";
always @(posedge n__264) begin
  if (n__264)
    sf4 <= df1;
end
// synthesis attribute CLOCK_SIGNAL of n__264 is "yes";
always @(posedge n__264) begin
  if (n__264)
    sf5 <= df2;
end
assign df_enable_ = ~(jmp_ & jms_ & defer);
assign if_enable_ = ~(df_enable_ & n__403 & b_set_);
assign clear_if_ = ~(clear_ifdfbf_ & if_to_sf);
assign clear_ib_ = ~(clear_ifdfbf_ & if_to_sf);
assign clear_df_ = ~(clear_ifdfbf_ & if_to_sf);
assign n__53 = ~(restart & mftp1);

// Sheet 22
assign b_ext_inst = ~(n__451);
assign n__420 = ~(mb07_ & mb08_);
assign mb06xmb09 = ~(n__421);
assign n__422 = ~(n__420);
assign rmf_ = ~(n__422 & mb06xmb09);
assign n__490 = ~(mem_ext & mb11);
assign n__464 = ~(n__459 & df0);
assign n__465 = ~(n__460 & if0);
assign n__462 = ~(rib & sf1);
assign n__468 = ~(n__459 & df2);
assign n__463 = ~(rib & sf0);
assign n__469 = ~(n__459 & df1);
assign n__466 = ~(n__460 & if1);
assign n__461 = ~(rib & sf2);
assign n__467 = ~(n__460 & if2);
assign n__497 = ~(ext_go & mb10);
assign n__482 = ~(sr_enable & dfsr0);
assign n__480 = ~(sf_enable & sf3);
assign n__477 = ~(n__473 & mb07);
assign n__479 = ~(sr_enable & dfsr2);
assign n__481 = ~(n__473 & mb06);
assign n__478 = ~(sr_enable & dfsr1);
assign n__476 = ~(sf_enable & sf4);
assign n__474 = ~(n__473 & mb08);
assign n__475 = ~(sf_enable & sf5);
assign n__493 = ~(mb11_ & rmf_);
assign ext_go = ~(n__492);
assign n__473 = ~(n__490);
assign me06_ = ~(n__470);
assign me07_ = ~(n__471);
assign n__492 = ~(tp3 & mem_ext);
assign me09_ = ~(rib & sf3);
assign me10_ = ~(rib & sf4);
assign me11_ = ~(rib & sf5);
assign me08_ = ~(n__472);
assign n__453 = ~(n__452);
assign mem_ext_ = ~(n__453 & iot);
assign mem_ext = ~(mem_ext_);
assign n__459 = ~(n__455);
assign n__460 = ~(n__457);
assign n__454 = ~(mb09 & mem_ext);
assign ext_inst = ~(n__454);
assign rib = ~(n__456);
assign mem_ext_ac_load_enable_ = ~(tp3 & n__458);
assign n__494 = ~(ib_to_if);
assign int_inhibit_ = ~(n__494 & int_inhibit);
assign pc_loadxsr_enable_ = ~(pc_load & n__425);
assign n__424 = ~(mb10_ & rmf_);
assign mb_to_ib = ~(n__423);
assign n__426 = ~(ext_go & n__424);
assign sf_enable = ~(rmf_);
assign n__423 = ~(mb10 & mem_ext);
assign n__421 = ~(mb06 & ext_inst);
assign n__445 = ~(f_set_ & e_set_);
assign ib_to_if = ~(pc_loadxsr_enable_ & n__447);
assign n__446 = ~(jmp_ & jms_);
assign n__439 = ~(key_lamfts0_ & ib0);
assign n__440 = ~(key_lamfts0_ & ib1);
assign n__441 = ~(key_lamfts0_ & ib2);
assign n__444 = ~(n__429 & n__439);
assign n__443 = ~(n__430 & n__440);
assign n__442 = ~(n__433 & n__441);
assign n__489 = ~(n__491 & pc_loadxsr_enable_);
assign n__491 = ~(n__493 & ext_go);
assign load_ib = ~(pc_loadxsr_enable_ & n__426);
assign n__429 = ~(sr_enable & ifsr0);
assign n__428 = ~(sf_enable & sf0);
assign n__431 = ~(mb_to_ib & mb07);
assign n__433 = ~(sr_enable & ifsr2);
assign n__427 = ~(mb_to_ib & mb06);
assign n__430 = ~(sr_enable & ifsr1);
assign n__432 = ~(sf_enable & sf1);
assign n__434 = ~(mb_to_ib & mb08);
assign n__435 = ~(sf_enable & sf2);
assign n__425 = ~(key_lamfts0_);
assign n__447 = ~(n__445 & tp3 & n__446);
assign n__471 = ~(n__469 & n__462 & n__466);
assign n__455 = ~(b_ext_inst & mb07_ & mb08);
assign n__457 = ~(b_ext_inst & mb07 & mb08_);
assign n__470 = ~(n__464 & n__463 & n__465);
assign n__472 = ~(n__468 & n__461 & n__467);
assign n__456 = ~(b_ext_inst & mb08 & mb07);
assign n__458 = ~(n__455 & n__456 & n__457);
assign n__452 = ~(b_fetch & mb03_ & mb04 & mb05_);
// synthesis attribute CLOCK_SIGNAL of ib_to_if is "yes";
always @(posedge ib_to_if, negedge clear_if_) begin
  if (~clear_if_)
    if0 <= 1'b0;
  else if (ib_to_if)
    if0 <= n__444;
end
assign if0_ = ~if0;
// synthesis attribute CLOCK_SIGNAL of ib_to_if is "yes";
always @(posedge ib_to_if, negedge clear_if_) begin
  if (~clear_if_)
    if1 <= 1'b0;
  else if (ib_to_if)
    if1 <= n__443;
end
assign if1_ = ~if1;
// synthesis attribute CLOCK_SIGNAL of ib_to_if is "yes";
always @(posedge ib_to_if, negedge clear_if_) begin
  if (~clear_if_)
    if2 <= 1'b0;
  else if (ib_to_if)
    if2 <= n__442;
end
assign if2_ = ~if2;
// synthesis attribute CLOCK_SIGNAL of load_ib is "yes";
always @(posedge load_ib, negedge clear_ib_) begin
  if (~clear_ib_)
    ib0 <= 1'b0;
  else if (load_ib)
    ib0 <= n__438;
end
// synthesis attribute CLOCK_SIGNAL of load_ib is "yes";
always @(posedge load_ib, negedge clear_ib_) begin
  if (~clear_ib_)
    ib1 <= 1'b0;
  else if (load_ib)
    ib1 <= n__437;
end
// synthesis attribute CLOCK_SIGNAL of load_ib is "yes";
always @(posedge load_ib, negedge clear_ib_) begin
  if (~clear_ib_)
    ib2 <= 1'b0;
  else if (load_ib)
    ib2 <= n__436;
end
// synthesis attribute CLOCK_SIGNAL of n__489 is "yes";
always @(posedge n__489, negedge clear_df_) begin
  if (~clear_df_)
    df0 <= 1'b0;
  else if (n__489)
    df0 <= n__483;
end
assign df0_ = ~df0;
// synthesis attribute CLOCK_SIGNAL of n__489 is "yes";
always @(posedge n__489, negedge clear_df_) begin
  if (~clear_df_)
    df1 <= 1'b0;
  else if (n__489)
    df1 <= n__484;
end
assign df1_ = ~df1;
// synthesis attribute CLOCK_SIGNAL of n__489 is "yes";
always @(posedge n__489, negedge clear_df_) begin
  if (~clear_df_)
    df2 <= 1'b0;
  else if (n__489)
    df2 <= n__485;
end
assign df2_ = ~df2;
assign n__438 = ~(n__429 & n__427 & n__428);
assign n__436 = ~(n__433 & n__434 & n__435);
assign n__484 = ~(n__478 & n__477 & n__476);
assign n__437 = ~(n__430 & n__431 & n__432);
assign n__483 = ~(n__482 & n__481 & n__480);
assign n__485 = ~(n__479 & n__474 & n__475);
assign mem_ext_io_enable_ = ~(n__458 & ts3 & iot & iot);
assign n__451 = ~(b_fetch & mb03_ & mb04 & mb05_ & mb06_ & mb09 & iot);
assign int_inhibit = ~(int_inhibit_ & n__497 & cuf_ & cuf_);

// Sheet 23
// a25: G624 Resistor Board
// not implemented (core memory)
// a26: G624 Resistor Board
// not implemented (core memory)
// a27: G228 Inhibit Driver
// not implemented (core memory)
// b25: G624 Resistor Board
// not implemented (core memory)
// b26: G228 Inhibit Driver
// not implemented (core memory)
// b27: G228 Inhibit Driver
// not implemented (core memory)

// Sheet 24
// c30: G221 Memory Selector
// not implemented (core memory)
// c31: G221 Memory Selector
// not implemented (core memory)
// cd27: G610 Diode Board
// not implemented (core memory)
// cd29: G611A Diode Board
// not implemented (core memory)
// d25: G221 Memory Selector
// not implemented (core memory)
// d26: G221 Memory Selector
// not implemented (core memory)

// Sheet 25
// c25: G221 Memory Selector
// not implemented (core memory)
// c26: G221 Memory Selector
// not implemented (core memory)
// d30: G221 Memory Selector
// not implemented (core memory)
// d31: G221 Memory Selector
// not implemented (core memory)

// Sheet 26
assign n__550 = ~(mb10_ & mb09_);
assign n__549 = ~(n__548);
assign n__561 = ~(n__551 & i_iot_);
assign n__563 = ~(n__561 & uf);
assign n__564 = ~(n__562 & n__563);
assign n__551 = ~(n__549 & n__550);
assign me05_ = ~(rib & s_uf);
assign n__562 = ~(cint_ & uint);
assign uint_ = ~(n__566 & n__566);
assign sint = ~(n__552);
assign cint_ = ~(mb07_ & mb08_ & b_ext_inst);
assign n__552 = ~(mb08 & mb06xmb09 & mb07_);
assign n__569 = ~(tp2e_ & tp2e_ & pc_load_);
assign n__566 = ~(n__563 & n__563 & n__565);
assign n__548 = ~(mb11_ & op2);
assign n__567 = ~(uint & tp3 & sint);
assign skip_or = ~(usf_ & skip_);
// synthesis attribute CLOCK_SIGNAL of n__558 is "yes";
always @(posedge n__558, negedge clear_if_) begin
  if (~clear_if_)
    ub <= 1'b0;
  else if (n__558)
    ub <= n__556;
end
// synthesis attribute CLOCK_SIGNAL of ib_to_if is "yes";
always @(posedge ib_to_if, negedge clear_if_) begin
  if (~clear_if_)
    uf <= 1'b0;
  else if (ib_to_if)
    uf <= n__560;
end
assign uf_ = ~uf;
// synthesis attribute CLOCK_SIGNAL of tp3 is "yes";
always @(posedge tp3, negedge initialize_) begin
  if (~initialize_)
    uint <= 1'b0;
  else if (tp3)
    uint <= n__564;
end
assign n__565 = ~uint;
// synthesis attribute CLOCK_SIGNAL of if_to_sf is "yes";
always @(posedge if_to_sf, negedge initialize_) begin
  if (~initialize_)
    s_uf <= 1'b0;
  else if (if_to_sf)
    s_uf <= uf;
end
// synthesis attribute CLOCK_SIGNAL of n__569 is "yes";
always @(posedge n__569, negedge initialize_, negedge n__567) begin
  if (~initialize_)
    usf <= 1'b0;
  else if (~n__567)
    usf <= 1'b1;
  else if (n__569)
    usf <= 1'b0;
end
assign usf_ = ~usf;
assign cuf_ = ~(mb07 & mb06xmb09);
assign n__553 = ~(cuf_ & rmf_);
assign n__558 = ~(pc_loadxsr_enable_ & n__557);
assign n__554 = ~(cuf & mb08);
assign n__555 = ~(s_uf & sf_enable);
assign n__557 = ~(ext_go & n__553);
assign cuf = ~(cuf_);
assign n__556 = ~(n__554 & n__555);
assign n__559 = ~(ub & key_lamfts0_);
assign n__560 = ~(n__559);

// Sheet 27
DelayLine #(250) dl_n__597(dclk, n__607, n__597);
DelayLine #(350) dl_n__596(dclk, n__607, n__596);
assign n__608 = n__596;
assign eae_tp = n__597;
assign norm_ = ~(norm);
// synthesis attribute CLOCK_SIGNAL of eae_tp is "yes";
always @(posedge eae_tp, negedge eae_run) begin
  if (~eae_run)
    eae_end <= 1'b1;
  else if (eae_tp)
    eae_end <= eae_complete_;
end
assign div_last_ = ~(div_last & dvi);
assign n__589 = ~(n__587);
assign n__604 = ~(n__608);
assign n__605 = ~(eae_tp_ & mfts2_);
assign n__587 = ~(div_last_ & mq10_);
assign n__603 = ~(div_last_ & eae_run);
assign n__595 = ~(tp3 & eae_begin);
assign eae_ac_enable_ = ~(eae_acbar_enable_ & b_eae_on);
assign n__591 = ~(eae_inst & mb09);
assign b_eae_on = ~(eae_on_);
assign eae_e_set_ = ~(n__684 & eae_inst);
assign n__684 = ~(mb09_ & mb10_);
assign n__588 = ~(mq10 & div_last);
assign eae_inst = ~(n__683);
assign eae_execute_ = ~(opr & b_execute);
assign sc_0_ = ~(sc0_3_0 & sc4_);
assign n__685 = ~(sc_0_ & mq11_);
assign eae_tp_ = ~(eae_run & eae_tp);
assign n__607 = ~(eae_tp_ & eae_start_);
assign eae_set_ = ~(eae_begin & scl_);
assign n__568 = ~(ac01 & ac02_);
assign n__600 = ~(n__601);
assign n__602 = ~(opr & b_execute);
assign eae_begin = ~(n__606 & n__602);
assign n__606 = ~(norm_ & nmi);
assign n__601 = ~(tp3 & eae_inst);
assign n__599 = ~(tp3 & nmi);
assign n__579 = ~(ac00_ & ac01);
assign n__580 = ~(ac01_ & ac00);
assign muy_dvi_ = ~(eae_ir0_ & eae_ir1);
assign n__609 = ~(n__590 & eae_run_);
assign ac_to_mq_enable = ~(ac_to_mq_enable_);
assign mq_low_ac0 = ~(n__577);
assign n__590 = ~(eae_complete_);
assign mb_to_sc_enable = ~(n__581);
assign n__584 = ~(mq11_ & muy);
assign asr_enable = ~(n__592);
assign n__574 = ~(n__571);
assign n__576 = ~(n__572);
assign div_last = ~(n__404 & n__405);
assign n__686 = ~(n__685 & dvi);
assign muy = ~(muy_);
assign n__575 = ~(n__573);
assign n__419 = ~(ac01_ & ac02);
assign n__688 = ~(n__686);
assign dvi = ~(dvi_);
assign nmi = ~(nmi_);
assign eae_right_shift_enable_ = ~(eae_ir1 & dvi_ & b_eae_on);
assign n__582 = ~(sc1 & dvi & sc2);
assign eae_acbar_enable_ = ~(b_eae_on & n__583 & dvi);
assign eae_l_disable = ~(eae_acbar_enable_ & n__591 & n__592);
assign norm = ~(n__579 & n__578 & n__580);
assign eae_no_shift_enable = ~(div_last_ & n__582 & b_eae_on);
assign n__583 = ~(sc0_3_0_ & n__585 & n__588);
assign eae_start_ = ~(scl_ & tp3 & eae_begin);
assign n__592 = ~(b_eae_on & eae_ir0 & eae_ir1);
assign n__598 = ~(mb11 & op2 & mb06);
assign n__594 = ~(mb07 & eae_inst & tp3);
assign eae_mq0bar_enable_ = ~(b_eae_on & n__688 & mq00);
assign n__593 = ~(mb05 & op2 & mb11);
assign asr_l_set_ = ~(ac00 & asr_enable & eae_ir2_);
assign eae_mq0_enable_ = ~(mq00_ & n__686 & b_eae_on);
assign n__404 = ~(sc0_3_0 & adder_l & sc4_);
assign n__406 = ~(ac03_ & mq_low_ac0 & mid_ac0);
assign muy_ = ~(eae_ir0_ & eae_ir1 & eae_ir2_);
assign n__570 = ~(n__419 & n__406 & n__568);
assign n__405 = ~(sc1 & sc4 & sc2);
assign scl_ = ~(eae_ir0_ & eae_ir1_ & eae_ir2);
assign dvi_ = ~(eae_ir0_ & eae_ir1 & eae_ir2);
assign n__578 = ~(mq_low_ac0 & mid_ac0 & ac03_ & ac02_);
assign eae_mem_enable_ = ~(eae_ir0_ & n__586 & b_eae_on & n__584);
assign n__683 = ~(b_fetch & opr & mb03 & mb11);
assign eae_left_shift_enable_ = ~(eae_right_shift_enable_ & b_eae_on & n__582 & div_last_);
assign n__586 = ~(mq01 & sc1 & div_last & dvi);
assign nmi_ = ~(eae_ir0 & eae_ir1_ & eae_ir2_ & eae_inst);
assign n__577 = ~(n__574 & n__576 & n__575 & low_ac0);
assign ac_to_mq_enable_ = ~(mb11 & mb07 & mb04_ & op2);
assign n__572 = ~(mq04_ & mq05_ & mq06_ & mq07_);
assign n__581 = ~(muy_dvi_ & eae_on_ & opr & b_execute);
assign n__571 = ~(mq00_ & mq01_ & mq02_ & mq03_);
assign n__573 = ~(mq08_ & mq09_ & mq10_ & mq11_);
assign mq_enable = ~(n__593);
assign mq_load = ~(eae_tg & n__594);
assign sc_enable = ~(n__598);
assign sc_load = ~(eae_tg & n__599 & n__595);
assign eae_complete_ = (muy & sc1 & sc3 & sc4) | (div_last & dvi) | (1'b0) | (sc_full & sc0) | (nmi & n__570);
assign n__585 = (n__589 & mq11) | (mq10 & mq11_);
// synthesis attribute CLOCK_SIGNAL of n__600 is "yes";
always @(posedge n__600, negedge eae_ir_clear_) begin
  if (~eae_ir_clear_)
    eae_ir0 <= 1'b0;
  else if (n__600)
    eae_ir0 <= mb08;
end
assign eae_ir0_ = ~eae_ir0;
// synthesis attribute CLOCK_SIGNAL of n__600 is "yes";
always @(posedge n__600, negedge eae_ir_clear_) begin
  if (~eae_ir_clear_)
    eae_ir1 <= 1'b0;
  else if (n__600)
    eae_ir1 <= mb09;
end
assign eae_ir1_ = ~eae_ir1;
// synthesis attribute CLOCK_SIGNAL of n__600 is "yes";
always @(posedge n__600, negedge eae_ir_clear_) begin
  if (~eae_ir_clear_)
    eae_ir2 <= 1'b0;
  else if (n__600)
    eae_ir2 <= mb10;
end
assign eae_ir2_ = ~eae_ir2;
// synthesis attribute CLOCK_SIGNAL of n__607 is "yes";
always @(posedge n__607, negedge b_power_clear_) begin
  if (~b_power_clear_)
    eae_on <= 1'b0;
  else if (n__607)
    eae_on <= n__609;
end
assign eae_on_ = ~eae_on;
// synthesis attribute CLOCK_SIGNAL of n__608 is "yes";
always @(posedge n__608, negedge b_power_clear_, negedge eae_start_) begin
  if (~b_power_clear_)
    eae_run <= 1'b0;
  else if (~eae_start_)
    eae_run <= 1'b1;
  else if (n__608)
    eae_run <= eae_on;
end
assign eae_run_ = ~eae_run;
// synthesis attribute CLOCK_SIGNAL of n__605 is "yes";
always @(posedge n__605, negedge b_power_clear_, negedge n__604) begin
  if (~b_power_clear_)
    eae_tg <= 1'b0;
  else if (~n__604)
    eae_tg <= 1'b1;
  else if (n__605)
    eae_tg <= n__603;
end

// Sheet 28
assign n__622 = ~(right_shift & adder11_);
assign n__610 = ~(ac_to_mq_enable & ac00);
assign n__624 = ~(right_shift & mq00);
assign n__625 = ~(b_left_shift & mq02);
assign n__612 = ~(ac_to_mq_enable & ac02);
assign n__623 = ~(b_left_shift & mq01);
assign n__611 = ~(ac_to_mq_enable & ac01);
assign n__626 = ~(right_shift & mq01);
assign n__627 = ~(b_left_shift & mq03);
assign n__660 = ~(mb_to_sc_enable & mb07_);
assign n__628 = ~(right_shift & mq02);
assign n__613 = ~(ac_to_mq_enable & ac03);
assign n__630 = ~(right_shift & mq03);
assign n__631 = ~(b_left_shift & mq05);
assign n__615 = ~(ac_to_mq_enable & ac05);
assign n__629 = ~(b_left_shift & mq04);
assign n__614 = ~(ac_to_mq_enable & ac04);
assign n__632 = ~(right_shift & mq04);
assign n__633 = ~(b_left_shift & mq06);
assign n__674 = ~(mb_to_sc_enable & mb08_);
assign n__634 = ~(right_shift & mq05);
assign n__616 = ~(ac_to_mq_enable & ac06);
assign n__636 = ~(right_shift & mq06);
assign n__637 = ~(bb_left_shift & mq08);
assign n__618 = ~(ac_to_mq_enable & ac08);
assign n__635 = ~(bb_left_shift & mq07);
assign n__617 = ~(ac_to_mq_enable & ac07);
assign n__638 = ~(right_shift & mq07);
assign n__639 = ~(bb_left_shift & mq09);
assign n__675 = ~(mb_to_sc_enable & mb09_);
assign n__640 = ~(right_shift & mq08);
assign n__619 = ~(ac_to_mq_enable & ac09);
assign n__642 = ~(right_shift & mq09);
assign n__643 = ~(bb_left_shift & mq11);
assign n__621 = ~(ac_to_mq_enable & ac11);
assign n__641 = ~(bb_left_shift & mq10);
assign n__620 = ~(ac_to_mq_enable & ac10);
assign n__644 = ~(right_shift & mq10);
assign n__645 = ~(bb_left_shift & n__682);
assign n__676 = ~(mb_to_sc_enable & mb10_);
assign sc_full = ~(n__677);
assign n__679 = ~(n__678);
assign n__680 = ~(sc3 & sc4);
assign n__667 = ~(n__662 & n__663);
assign n__663 = ~(mb_to_sc_enable & mb11_);
assign n__681 = ~(n__680);
assign n__662 = ~(eae_on & sc4_);
assign sc0_3_0 = ~(sc0_3_0_);
assign adder_l = ~(adder_l_);
assign n__646 = ~(n__622 & n__610 & n__623);
assign n__648 = ~(n__626 & n__612 & n__627);
assign n__650 = ~(n__630 & n__614 & n__631);
assign n__652 = ~(n__634 & n__616 & n__635);
assign n__647 = ~(n__624 & n__611 & n__625);
assign n__649 = ~(n__628 & n__613 & n__629);
assign n__651 = ~(n__632 & n__615 & n__633);
assign n__653 = ~(n__636 & n__617 & n__637);
assign n__654 = ~(n__638 & n__618 & n__639);
assign n__656 = ~(n__642 & n__620 & n__643);
assign n__661 = ~(n__659 & n__658 & n__660);
assign n__665 = ~(n__669 & n__672 & n__675);
assign n__655 = ~(n__640 & n__619 & n__641);
assign n__657 = ~(n__644 & n__621 & n__645);
assign n__664 = ~(n__668 & n__671 & n__674);
assign n__666 = ~(n__670 & n__673 & n__676);
assign n__659 = ~(eae_on & sc_full & sc0_);
assign n__668 = ~(eae_on & n__679 & sc1_);
assign n__669 = ~(eae_on & n__681 & sc2_);
assign n__670 = ~(sc3_ & eae_on & sc4);
assign n__658 = ~(eae_on & n__677 & sc0);
assign n__671 = ~(eae_on & n__678 & sc1);
assign n__672 = ~(eae_on & n__680 & sc2);
assign n__673 = ~(eae_on & sc3 & sc4_);
// synthesis attribute CLOCK_SIGNAL of sc_load is "yes";
always @(posedge sc_load) begin
  if (sc_load)
    sc0 <= n__661;
end
assign sc0_ = ~sc0;
// synthesis attribute CLOCK_SIGNAL of sc_load is "yes";
always @(posedge sc_load) begin
  if (sc_load)
    sc1 <= n__664;
end
assign sc1_ = ~sc1;
// synthesis attribute CLOCK_SIGNAL of sc_load is "yes";
always @(posedge sc_load) begin
  if (sc_load)
    sc2 <= n__665;
end
assign sc2_ = ~sc2;
// synthesis attribute CLOCK_SIGNAL of sc_load is "yes";
always @(posedge sc_load) begin
  if (sc_load)
    sc3 <= n__666;
end
assign sc3_ = ~sc3;
// synthesis attribute CLOCK_SIGNAL of sc_load is "yes";
always @(posedge sc_load) begin
  if (sc_load)
    sc4 <= n__667;
end
assign sc4_ = ~sc4;
// synthesis attribute CLOCK_SIGNAL of mq_load is "yes";
always @(posedge mq_load) begin
  if (mq_load)
    mq00 <= n__646;
end
assign mq00_ = ~mq00;
// synthesis attribute CLOCK_SIGNAL of mq_load is "yes";
always @(posedge mq_load) begin
  if (mq_load)
    mq01 <= n__647;
end
assign mq01_ = ~mq01;
// synthesis attribute CLOCK_SIGNAL of mq_load is "yes";
always @(posedge mq_load) begin
  if (mq_load)
    mq02 <= n__648;
end
assign mq02_ = ~mq02;
// synthesis attribute CLOCK_SIGNAL of mq_load is "yes";
always @(posedge mq_load) begin
  if (mq_load)
    mq03 <= n__649;
end
assign mq03_ = ~mq03;
// synthesis attribute CLOCK_SIGNAL of mq_load is "yes";
always @(posedge mq_load) begin
  if (mq_load)
    mq04 <= n__650;
end
assign mq04_ = ~mq04;
// synthesis attribute CLOCK_SIGNAL of mq_load is "yes";
always @(posedge mq_load) begin
  if (mq_load)
    mq05 <= n__651;
end
assign mq05_ = ~mq05;
// synthesis attribute CLOCK_SIGNAL of mq_load is "yes";
always @(posedge mq_load) begin
  if (mq_load)
    mq06 <= n__652;
end
assign mq06_ = ~mq06;
// synthesis attribute CLOCK_SIGNAL of mq_load is "yes";
always @(posedge mq_load) begin
  if (mq_load)
    mq07 <= n__653;
end
assign mq07_ = ~mq07;
// synthesis attribute CLOCK_SIGNAL of mq_load is "yes";
always @(posedge mq_load) begin
  if (mq_load)
    mq08 <= n__654;
end
assign mq08_ = ~mq08;
// synthesis attribute CLOCK_SIGNAL of mq_load is "yes";
always @(posedge mq_load) begin
  if (mq_load)
    mq09 <= n__655;
end
assign mq09_ = ~mq09;
// synthesis attribute CLOCK_SIGNAL of mq_load is "yes";
always @(posedge mq_load) begin
  if (mq_load)
    mq10 <= n__656;
end
assign mq10_ = ~mq10;
// synthesis attribute CLOCK_SIGNAL of mq_load is "yes";
always @(posedge mq_load) begin
  if (mq_load)
    mq11 <= n__657;
end
assign mq11_ = ~mq11;
assign left_shift_ = ~(eae_right_shift_enable_ & b_eae_on);
assign b_left_shift = ~(left_shift_);
assign bb_left_shift = ~(left_shift_);
assign n__678 = ~(sc2 & sc3 & sc4);
assign n__677 = ~(sc1 & sc2 & sc3 & sc4);
assign sc0_3_0_ = ~(eae_tp_ & sc1_ & sc2_ & sc3_);
assign n__682 = (sc0_3_0 & sc4_) | (mq11 & adder_l_) | (adder_l & mq11_) | (dvi_);

// Sheet 29
assign b_line_hold_ = line_hold_;
assign b_line_hold_ = 1'b1; // c07d2 pull-up
assign b_c_ = c_;
assign b_c_ = 1'b1; // c07k2 pull-up
assign bstlr = mem_done_ & s & ts1;
assign bstlr = 1'b1; // c07s2 pull-up
assign btp3 = ~(tp3);
assign b_mem_to_lsr = ~(mem_to_lsr_);
assign b_dc_inst = ~(dc_inst_);
assign n__728 = ~(mem00 & hs_);
assign n__729 = ~(n__728);
assign tt_shift_enable_ = ~(tt_shift_enable);
assign n__727 = ~(n__726);
assign tt_carry_insert_ = ~(tt_carry_insert);
assign tt_shift_enable = ~(tt_line_shift_ & tt_right_shift_enable_);
assign mem_inh9_11_ = ~(n__729 & n__727);
assign r0_ = ~(r0);
assign tt_carry_insert_s = ~(tt_carry_insert_s_);
assign tt_set_ = ~(n__731);
assign tt_right_shift_enable_ = ~(tt_right_shift_enable);
assign n__733 = ~(n__742);
assign tt_cycle_ = ~(tt_l_disable & tt_inst_);
assign n__746 = ~(line_ & s);
assign tt_inst = ~(tt_inst_);
assign n__744 = ~(n__743);
assign tt_data = ~(n__746 & n__747);
assign n__747 = ~(c & n__745);
assign n__745 = ~(line_);
assign n__731 = ~(c_set_ & s_set_);
assign n__730 = ~(c & hs_ & ts2);
assign tt_io_enable_ = ~(ts3 & mb09 & tt_inst);
assign n__742 = ~(mb03 & mb04_ & mb05_);
assign tt_right_shift_enable = ~(n__730 & csr_enable_ & tt_io_enable_);
assign tt_line_shift_ = ~(ts2 & n__728 & s);
assign tt_carry_insert_s_ = ~(ts3 & s & c_set_);
assign n__743 = ~(mb06_ & mb07_ & mb08_);
assign lhs = ~(lhs_ & lhs_ & lhs_ & lhs_);
assign r0 = ~(b_r0_ & b_r0_ & b_r0_ & b_r0_);
assign lhs_ = 1'b1; // d05a1 pull-up
assign lhs_ = 1'b1; // d05b1 pull-up
assign b_r0_ = 1'b1; // d05d2 pull-up
assign b_r0_ = 1'b1; // d05e2 pull-up
assign c_no_shift_ = ~(n__725 & hs);
assign csr_enable_ = ~(n__725 & hs_);
assign n__725 = ~(store_);
assign n__726 = ~(s & ts2 & mem09);
assign dc_inst_ = ~(n__733 & iot);
assign tt_carry_insert = ~(tt_carry_insert_c_ & tt_carry_insert_s_ & line_hold_);
assign n__732 = ~(store_ & tt_io_enable_);
assign tt_carry_insert_c_ = ~(ts3 & c & mb11_);
assign tt_l_disable = ~(c_ & tt_inst_ & s_);
assign tt_ac_load_ = ~(n__732 & tp3);
assign s_set_ = ~(tt_inst & mb10);
assign tt_increment_ = ~(ts2 & n__729 & mem_inh9_11_ & s);
assign store_ = ~(r0_ & c & ts3 & mb11);
assign c_set_ = ~(s & mb10 & mb11_);
assign tt_inst_ = ~(iot & n__733 & n__744 & b_fetch);
assign line_hold_ = ~(r0 & c & ts3 & mb11);
// synthesis attribute CLOCK_SIGNAL of tp4 is "yes";
always @(posedge tp4, negedge manual_preset_) begin
  if (~manual_preset_)
    s_ <= 1'b1;
  else if (tp4)
    s_ <= s_set_;
end
assign s = ~s_;
// synthesis attribute CLOCK_SIGNAL of tp4 is "yes";
always @(posedge tp4, negedge manual_preset_) begin
  if (~manual_preset_)
    c_ <= 1'b1;
  else if (tp4)
    c_ <= c_set_;
end
assign c = ~c_;
// synthesis attribute CLOCK_SIGNAL of lh_to_hs is "yes";
always @(posedge lh_to_hs) begin
  if (lh_to_hs)
    hs <= lhs;
end
assign hs_ = ~hs;

// Sheet 30
assign n__687 =  mb00_ ^ mb01_ ^ mb02_ ^ mb03_ ^ mb00 ^ mb01 ^ mb02 ^ mb03;
assign n__262 =  ~n__687;
assign n__692 =  mb08_ ^ mb09_ ^ mb10_ ^ mb11_ ^ mb08 ^ mb09 ^ mb10 ^ mb11;
assign n__691 =  ~n__692;
assign mb_parity_odd =  n__262 ^ n__689 ^ n__691 ^ 1'b1 ^ n__687 ^ n__690 ^ n__692;
assign n__690 =  mb04_ ^ mb05_ ^ mb06_ ^ mb07_ ^ mb04 ^ mb05 ^ mb06 ^ mb07;
assign n__689 =  ~n__690;
assign n__693 = ~(mb03_ & mb04_ & mb05);
assign n__699 = ~(iop4 & n__697);
assign n__700 = ~(initialize_ & n__699);
assign n__694 = ~(mb06_ & mb07_ & mb08_);
assign mp_skip_ = ~(n__697 & iop1 & mp_int_);
assign clr_parity_error_ = ~(n__700);
assign n__695 = ~(n__693);
assign n__698 = ~(n__695 & n__696);
assign mp_int_ = ~(clr_parity_error_ & mp_int);
assign n__696 = ~(n__694);
assign n__697 = ~(n__698);
assign mp_int = ~(mp_int_ & n__701);
assign n__701 = ~(tp3 & mem_parity_even_);

// Sheet 31
assign n__703 =  n__716 ^ n__713 ^ n__714 ^ n__715 ^ mem00 ^ mem01 ^ mem02 ^ mem03;
assign n__702 =  ~n__703;
assign n__707 =  n__718 ^ n__717 ^ n__712 ^ n__719 ^ mem08 ^ mem09 ^ mem10 ^ mem11;
assign n__706 =  ~n__707;
assign mem_parity_even =  n__702 ^ n__704 ^ n__706 ^ n__720 ^ n__703 ^ n__705 ^ n__707 ^ mem_p;
assign mem_parity_even_ =  ~mem_parity_even;
assign n__705 =  n__710 ^ n__709 ^ n__708 ^ n__711 ^ mem04 ^ mem05 ^ mem06 ^ mem07;
assign n__704 =  ~n__705;
assign n__715 = ~(mem03);
assign n__714 = ~(mem02);
assign n__716 = ~(mem00);
assign n__708 = ~(mem06);
assign n__710 = ~(mem04);
assign n__713 = ~(mem01);
assign n__711 = ~(mem07);
assign n__709 = ~(mem05);
assign n__719 = ~(mem11);
assign n__712 = ~(mem10);
assign mem_p = 1'b1; // b08v1 pull-up
assign n__717 = ~(mem09);
assign n__718 = ~(mem08);
assign n__720 = ~(mem_p);

// Sheet 32
always @(negedge initialize_, negedge shut_down_) begin
  if (~initialize_)
    pwr_low_ <= 1;
  else
    pwr_low_ <= 0;
end
assign pwr_low = ~pwr_low_;
assign pwr_skip_ = ~(mb03_ & mb04_ & mb05 & mb06_ & mb07_ & mb08_ & iop2 & pwr_low);
Monostable #(1000000) a04a(dclk, shut_down_, stop_ok);
// TODO: kp8i_enable should be a switch, which would require
//       an input pin.
`ifdef kp8i_enable
Monostable #(200000000) a04b(dclk, stop_ok & shut_down_, a04c1);
`else
assign a04c1 = 1'b0;
`endif
Monostable #(1000000) a04c(dclk, a04c1, restart);
assign restart_ = ~restart;

// Sheet 33
DisplayControl hj23m701(.ae2(z_axis), .ah2(initialize), .aj1(pen_strobe), .aj2(iop2), .ak1(pen_strobe), .ak2(mb09_), .an1(mb10), .an2(light_pen), .ap1(mb11), .ap2(y_strobe), .ar1(iop1), .ar2(clear_y_), .as1(x_strobe), .as2(clear_x_), .bd2(iop4), .be2(mb07_), .bf2(mb03_), .bh2(mb04_), .bj2(mb08_), .bk2(mb05_), .bl2(mb07), .bm2(mb06), .bn2(mb08), .bp2(io_bus_in_int_), .br2(io_bus_in_skip_));
// hj24: A607 D-A Converter
// implement externally (analog)
// hj25: A607 D-A Converter
// implement externally (analog)

// Sheet 34
PlotterControl hj29m704(.dclk(dclk), .ad2(mb06_), .ae2(mb05), .af2(mb03), .ah2(mb04_), .aj2(pen_right), .ak2(mb08), .al2(pen_left), .an2(drum_up), .ar2(drum_down), .as2(mb07), .at2(pen_up), .av2(pen_down), .be2(io_bus_in_skip_), .bf2(io_bus_in_int_), .bh2(iop1), .bl2(iop1_), .bm2(iop2_), .bn2(initialize), .bp2(iop2), .bt2(iop4), .bu1(mb07_), .bv1(mb08_));

// Sheet 35
assign hole8 = ~(n__722 & n__734 & n__734 & n__734);
assign hole7 = ~(n__722 & n__735 & n__735 & n__735);
assign hole6 = ~(n__722 & n__737 & n__737 & n__737);
assign hole5 = ~(n__722 & n__738 & n__738 & n__738);
assign hole4 = ~(n__722 & n__739 & n__739 & n__739);
assign feed_hole = ~(n__722 & n__722 & n__722 & n__722);
assign hole3 = ~(n__722 & n__740 & n__740 & n__740);
assign hole2 = ~(n__722 & n__741 & n__741 & n__741);
assign hole1 = ~(n__722 & n__736 & n__736 & n__736);
PunchControl hj28m710(.dclk(dclk), .ad1(ac10), .ad2(ac11), .ae1(ac08), .ae2(ac09), .af1(ac06), .af2(ac07), .ah1(ac04), .ah2(ac05), .ak1(n__734), .ak2(n__739), .al1(n__735), .al2(n__740), .am1(n__737), .am2(n__741), .an1(n__738), .an2(n__736), .ap2(iop4), .ar1(iop2), .ar2(iop1), .as2(initialize_), .at2(pun_feed_switch_), .au1(n__721), .av2(sync_pun), .bd1(mb04_), .bd2(mb05_), .be1(mb06_), .be2(mb07), .bf1(mb08_), .bf2(mb03_), .bh2(n__722), .bn2(io_bus_in_skip_), .bs2(io_bus_in_int_), .bu2(1'b1), .bv1(n__721));

// Sheet 36
ReaderControl hj26m705(.ad1(rd_hole2), .ad2(rd_hole1), .ae1(rd_hole4), .ae2(rd_hole3), .af1(rd_hole8), .af2(rd_hole7), .ah1(rd_hole6), .ah2(rd_hole5), .ak1(rdr_run_), .ak2(io_bus_in_skip_), .al2(io_bus_in_int_), .an1(io_bus_in11_), .an2(io_bus_in07_), .ap1(io_bus_in09_), .ap2(io_bus_in04_), .ar1(io_bus_in06_), .ar2(io_bus_in10_), .as1(io_bus_in08_), .as2(io_bus_in05_), .au2(iop1), .av2(iop2), .bd1(rdr_shift_), .bd2(mb03_), .be1(mb05_), .be2(mb04_), .bf1(mb07_), .bf2(mb06_), .bh2(mb08), .bj1(rdr_shift), .bk1(iop4), .bk2(rdr_enable_), .bm1(rdr_feed_switch), .bm2(s_feed_hole), .bn2(stop_complete), .bp1(initialize_), .bp2(ba), .br1(bb_), .br2(pwr), .bs1(ba_), .bs2(clock1), .bu2(bb));
ReaderClock hj27m715(.dclk(dclk), .ak2(rdr_enable_), .as2(rdr_shift), .at2(rdr_shift_), .au2(clock1), .bp2(rdr_feed_switch), .br2(stop_complete), .bs2(rdr_run_), .bt2(initialize));

// Sheet 37
ClockControl h30m708(.a1(mb11), .c1(io_bus_in_int_), .d2(clock), .f2(iop4_), .h1(io_bus_in_skip_), .j2(clock_enable_), .k2(clock_p4), .l1(mb10), .l2(iop1_), .m2(mb08), .n1(mb09_), .n2(mb07), .p1(initialize_), .p2(mb06_), .r1(iop2_), .r2(mb05), .s1(clock_iot), .s2(mb04_), .t2(mb03_), .u2(mb09), .v1(overflow), .v2(load_counter));
ClockCounter hj31m709(.dclk(dclk), .ae1(ac00), .af1(io_bus_in02_), .af2(io_bus_in00_), .ah1(ac03), .aj1(io_bus_in06_), .aj2(io_bus_in04_), .ak1(ac05), .al1(ac07), .am1(io_bus_in08_), .am2(io_bus_in10_), .an2(ac09), .ap1(ac11), .ap2(io_bus_in09_), .ar1(ac08), .ar2(ac10), .as1(io_bus_in11_), .at2(ac06), .au1(io_bus_in05_), .au2(ac04), .av1(ac02), .av2(io_bus_in07_), .ba1(ac01), .bb1(io_bus_in03_), .bd1(io_bus_in01_), .bj1(mb10), .bj2(clock), .bk1(clock_p4), .bl1(clock_iot), .bm2(clock_ac_clr_), .bn1(load_counter), .bp1(mb10_), .bs1(overflow));
Oscillator #(60) m501_clock(dclk, clock_enable_, clock);

// Sheet 38
CardReaderControl j33m714(.a1(mb07), .b1(mb05_), .c1(mb03), .d1(mb06), .d2(mb04), .e1(mb08), .e2(mb06_), .f1(biop4), .f2(biop1), .h2(biop2), .j1(index_markers), .k1(i_m_d), .n1(initialize_), .n2(io_bus_in_int_), .p1(iot632), .p2(io_bus_in_skip_), .r1(iot634), .r2(cr_ready), .s2(cr_read), .u2(c_i_r));

// Sheet 39
CardReaderBuffer hj32m716(.dclk(dclk), .ad2(index_markers), .ae1(zone11_index), .ae2(zone12_index), .af1(io_bus_in00_), .af2(io_bus_in01_), .ah1(iot634), .ah2(io_bus_in02_), .aj2(io_bus_in03_), .ak2(zone01_index), .al2(zone10_index), .am2(io_bus_in05_), .an2(io_bus_in04_), .ap2(zone03_index), .ar2(zone02_index), .as2(zone05_index), .au2(io_bus_in06_), .av2(io_bus_in07_), .be2(zone04_index), .bh2(io_bus_in11_), .bj2(io_bus_in10_), .bk2(zone08_index), .bl2(zone09_index), .bm2(iot632), .bn2(io_bus_in09_), .bp2(io_bus_in08_), .br1(zone07_index), .bs1(zone06_index), .bs2(initialize_), .bu1(i_m_d));

endmodule
