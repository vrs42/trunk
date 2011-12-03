`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:    18:32:36 10/19/10
// Design Name:    
// Module Name:    8itop
// Project Name:   
// Target Device:  
// Tool versions:  
// Description:
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module top8i(dclk);

input dclk;

wire dfsr0, dfsr1, dfsr2, ifsr0, ifsr1, ifsr2;
wire sr00, sr01, sr02, sr03, sr04, sr05, sr06, sr07, sr08, sr09, sr10, sr11;
wire power_ok_, power_clear_;
wire key_st_, key_la_, key_dp_, key_ex_, key_cont_, key_stop_, key_ss_, key_si_;
wire sync_pun, feed_hole, hole1, hole8, hole7, hole6, hole5, hole4, hole3, hole2, pun_feed_switch_;
wire link_, if1_, if2_, sc4_, df0_, sc3_, sc1_, if0_, sc2_, df2_, df1_, sc0_;
wire rd_hole1, rd_hole2, rd_hole3, rd_hole4, rd_hole5, rd_hole6, rd_hole7, rd_hole8, s_feed_hole, ba_, ba, bb_, bb, pwr, rdr_feed_switch;
wire pen_right, pen_left, drum_up, drum_down, pen_up, pen_down;
wire x_axis, y_axis, z_axis, light_pen;
wire b_line_hold_, btp3, b_mem_to_lsr, b_c_, bstlr, b_dc_inst, lhs_, b_r0_;
wire word_count_, defer_, int_enable_, opr_, current_address_, break_, run_, iot_, jmp_, pause_, and_, fetch_, isz_, execute_, dca_, jms_, tad_;
wire mb05_, ac05_, pc04_, pc05_, mb03_, ma05_, ma03_, mq04_, mb02_, mq05_, ac03_, ac02_, pc00_, mb04_, ma02_, ma04_, mq03_, ac04_, mq01_, pc03_, mq02_, mb01_, pc02_, mb00_, ma01_, pc01_, mq00_, ac01_, ma00_, ac00_;
wire mb11_, ac11_, pc10_, pc11_, mb09_, ma11_, ma09_, mq10_, mb08_, mq11_, ac09_, ac08_, pc06_, mb10_, ma08_, ma10_, mq09_, ac10_, mq07_, pc09_, mq08_, mb07_, pc08_, mb06_, ma07_, pc07_, mq06_, ac07_, ma06_, ac06_;

wire [0:2] ea;
wire [0:11] bma;
wire [0:11] mcbmb_;
wire mem_p;
wire [1:11] mem;
wand mem_done_;

wire mem08, mem09, mem10, mem11, b_mem_start, strobe_, mb_parity_odd, btp2;
wire x_strobe, clear_x_;
wire y_strobe, clear_y_;
wire cr_ready, zone01_index, zone02_index, zone03_index, index_markers, zone04_index, zone05_index, zone06_index, zone07_index, zone08_index, cr_read, c_i_r, zone09_index, zone10_index, zone11_index, zone12_index;
wire bac00, bac01, bac02, bac03, bac04, bac05, bac06, bac07, bac08;
wire bac09, bac10, bac11, biop1_, biop2_, biop4_, bts3, bts1, binitialize_;
wire bmb00, bmb01, bmb02, bmb03_, bmb03, bmb04_, bmb04, bmb05_, bmb05;
wire bmb06_, bmb06, bmb07_, bmb07, bmb08_, bmb08, bmb09, bmb10, bmb11;
wire in00, in01, in02, in03, in04, in05, in06, in07, in08;
wire in09, in10, in11, skipb, irq, acclr, brun_, btt_inst_, line_in;
wire da00, da01, da02, da03, da04, da05, da06, da07, da08;
wire da09, da10, da11, brq, d_in_, bbreak, badd_accepted_, mem_incr;
wire d00, d01, d02, d03, d04, d05, d06, d07, d08;
wire d09, d10, d11, n3cycle, ca_incr_, bwc_overflow, eda2, eda1, eda0;
wire io_pc_load;
wire rx_data, tx_data, reader_run_;
wire clock;


pdp8i cpu(
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
    ea[0], ea[1], ea[2],
    bma[0], bma[1], bma[2], bma[3], bma[4], bma[5], bma[6], bma[7], bma[8], bma[9], bma[10], bma[11],
    mcbmb_[0], mcbmb_[1], mcbmb_[2], mcbmb_[3], mcbmb_[4], mcbmb_[5], mcbmb_[6], mcbmb_[7], mcbmb_[8], mcbmb_[9], mcbmb_[10], mcbmb_[11],
    mem_p, mem[0], mem[1], mem[2], mem[3], mem[4], mem[5], mem[6], mem[7], mem[8], mem[9], mem[10], mem[11],
    b_mem_start, strobe_, mem_done_, mb_parity_odd, btp2,
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
	io_pc_load,
	rx_data, tx_data, reader_run_,
	clock,
	dclk
);

mm8i core(dclk, power_clear_, mem_start, btp2, ea, bma, mcbmb_,
          mb_parity_odd,
          mem, mem_p_, mem_done_);

endmodule
