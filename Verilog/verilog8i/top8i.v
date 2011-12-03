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
module top8i(dclk, S3_SSER_N, S3_SCK, S3_SCL_N, LSER, LCLK, LCL_N);

input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
input S3_SSER_N;
output S3_SCK, S3_SCL_N;
output LSER, LCLK, LCL_N;

wire [0:5] conf; // Extra pseudo-switches

// Power fail/restart
wire power_ok_, power_clear_;

// pp8i paper tape punch
wire [1:8] hole;
wire sync_pun, feed_hole, pun_feed_switch_;

// pr8i paper tape reader
wire [1:8] rd_hole;
wire s_feed_hole, ba_, ba, bb_, bb, pwr, rdr_feed_switch;

// pen plotter
wire pen_right, pen_left, drum_up, drum_down, pen_up, pen_down;
wire x_axis, y_axis, z_axis, light_pen;

// dl8i?
wire b_line_hold_, btp3, b_mem_to_lsr, b_c_, bstlr, b_dc_inst, lhs_, b_r0_;

// front panel switches
wire [0:2] dfsr;
// synthesis attribute PULLUP of dfsr is "yes";
wire [0:2] ifsr;
// synthesis attribute PULLUP of ifsr is "yes";
wire [0:11] sr;
// synthesis attribute PULLUP of sr is "yes";
wire key_st_, key_la_, key_dp_, key_ex_, key_cont_, key_stop_, key_ss_, key_si_;
// front panel lights
wire [0:2] df_;
wire [0:2] if_;
wire [0:11] pc_;
wire [0:11] ma_;
wire [0:11] mb_;
wire [0:11] ac_;
wire [0:11] mq_;
wire [0:4] sc_;
wire link_;
wire word_count_, defer_, int_enable_, opr_, current_address_, break_, run_, iot_, jmp_, pause_, and_, fetch_, isz_, execute_, dca_, jms_, tad_;

// mm8i bus
wire [0:2] ea;
wire [0:11] bma;
wire [0:11] mcbmb_;
wire mem_p;
wire [0:11] mem;
wand mem_done_;
wire b_mem_start, strobe_, mb_parity_odd, btp2;

// vc8i
wire x_strobe, clear_x_;
wire y_strobe, clear_y_;

// cr8i
wire [1:12] zone_index;
wire cr_ready, index_markers, cr_read, c_i_r;

// ka8i posibus
wire [0:11] bac;
wire [0:11] bmb;
wire [3:8] bmb_;
wire [0:11] in;
// synthesis attribute PULLUP of in is "yes";
wire biop1_, biop2_, biop4_, bts3, bts1, binitialize_;
// synthesis attribute CLOCK_SIGNAL of biop1_ is "yes";
// synthesis attribute CLOCK_SIGNAL of biop2_ is "yes";
// synthesis attribute CLOCK_SIGNAL of biop4_ is "yes";
wire skipb, irq, acclr, brun_, btt_inst_, line_in;
// synthesis attribute PULLUP of skipb is "yes";
// synthesis attribute PULLUP of irq is "yes";
// synthesis attribute PULLUP of acclr is "yes";
// synthesis attribute PULLUP of line_in is "yes";

// data break
wire [0:11] da;
wire [0:11] d;
wire brq, d_in_, bbreak, badd_accepted_, mem_incr;
wire n3cycle, ca_incr_, bwc_overflow, eda2, eda1, eda0;

// ??
wire io_pc_load;

// tty
wire rx_data, tx_data, reader_run_;

// rtc
wire clock;


pdp8i cpu(
	dfsr[0], dfsr[1], dfsr[2], ifsr[0], ifsr[1], ifsr[2], sr[0], sr[1], sr[2], sr[3], sr[4], sr[5], sr[6],
	power_ok_, power_clear_,
	sr[7], sr[8], sr[9], sr[10], sr[11], key_st_, key_la_, key_dp_, key_ex_, key_cont_, key_stop_, key_ss_, key_si_,
	sync_pun, feed_hole, hole[1], hole[8], hole[7], hole[6], hole[5], hole[4], hole[3], hole[2], pun_feed_switch_,
	link_, if_[1], if_[2], sc_[4], df_[0], sc_[3], sc_[1], if_[0], sc_[2], df_[2], df_[1], sc_[0],
	rd_hole[1], rd_hole[2], rd_hole[3], rd_hole[4], rd_hole[5], rd_hole[6], rd_hole[7], rd_hole[8], s_feed_hole, ba_, ba, bb_, bb, pwr, rdr_feed_switch,
	pen_right, pen_left, drum_up, drum_down, pen_up, pen_down,
	x_axis, y_axis, z_axis, light_pen,
	b_line_hold_, btp3, b_mem_to_lsr, b_c_, bstlr, b_dc_inst, lhs_, b_r0_,
	word_count_, defer_, int_enable_, opr_, current_address_, break_, run_, iot_, jmp_, pause_, and_, fetch_, isz_, execute_, dca_, jms_, tad_,
	mb_[5], ac_[5], pc_[4], pc_[5], mb_[3], ma_[5], ma_[3], mq_[4], mb_[2], mq_[5], ac_[3], ac_[2], pc_[0], mb_[4], ma_[2], ma_[4], mq_[3], ac_[4], mq_[1], pc_[3], mq_[2], mb_[1], pc_[2], mb_[0], ma_[1], pc_[1], mq_[0], ac_[1], ma_[0], ac_[0],
	mb_[11], ac_[11], pc_[10], pc_[11], mb_[9], ma_[11], ma_[9], mq_[10], mb_[8], mq_[11], ac_[9], ac_[8], pc_[6], mb_[10], ma_[8], ma_[10], mq_[9], ac_[10], mq_[7], pc_[9], mq_[8], mb_[7], pc_[8], mb_[6], ma_[7], pc_[7], mq_[6], ac_[7], ma_[6], ac_[6],
	ea[0], ea[1], ea[2], bma[0], bma[1], bma[2], bma[3], bma[4], bma[5],
	bma[6], bma[7], bma[8], bma[9], bma[10], bma[11], mcbmb_[0], mcbmb_[1], mcbmb_[2],
	mcbmb_[3], mcbmb_[4], mcbmb_[5], mcbmb_[6], mcbmb_[7], mcbmb_[8], mcbmb_[9], mcbmb_[10], mcbmb_[11],
	mem_p, mem[0], mem[1], mem[2], mem[3], mem[4], mem[5], mem[6], mem[7],
	mem[8], mem[9], mem[10], mem[11], b_mem_start, strobe_, mem_done_, mb_parity_odd, btp2,
	x_strobe, clear_x_,
	y_strobe, clear_y_,
	cr_ready, zone_index[1], zone_index[2], zone_index[3], index_markers, zone_index[4], zone_index[5], zone_index[6], zone_index[7], zone_index[8], cr_read, c_i_r, zone_index[9], zone_index[10], zone_index[11], zone_index[12],
	bac[0], bac[1], bac[2], bac[3], bac[4], bac[5], bac[6], bac[7], bac[8],
	bac[9], bac[10], bac[11], biop1_, biop2_, biop4_, bts3, bts1, binitialize_,
	bmb[0], bmb[1], bmb[2], bmb_[3], bmb[3], bmb_[4], bmb[4], bmb_[5], bmb[5],
	bmb_[6], bmb[6], bmb_[7], bmb[7], bmb_[8], bmb[8], bmb[9], bmb[10], bmb[11],
	in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[8],
	in[9], in[10], in[11], skipb, irq, acclr, brun_, btt_inst_, line_in,
	da[00], da[1], da[2], da[3], da[4], da[5], da[6], da[7], da[8],
	da[9], da[10], da[11], brq, d_in_, bbreak, badd_accepted_, mem_incr,
	d[0], d[1], d[2], d[3], d[4], d[5], d[6], d[7], d[8],
	d[9], d[10], d[11], n3cycle, ca_incr_, bwc_overflow, eda2, eda1, eda0,
	io_pc_load,
	rx_data, tx_data, reader_run_,
	clock,
	dclk
);

mm8i core(dclk, power_clear_, mem_start, btp2, ea, bma, mcbmb_,
          mb_parity_odd,
          mem, mem_p_, mem_done_);

lightsMux lights(sclk, power_clear_, LSER, LCLK, LCL_N,
                 pc_, ma_, mb_, ac_, mq_, df_, if_, sc_, link_,
                 and_, tad_, isz_, dca_, jms_, jmp_, iot_, opr_,
                 fetch_, defer_, exec_, ion_, pause_, run_, wc_, ca_, break_);

switchesDeMux switches(dclk, power_clear_, S3_SSER_N, S3_SCK, S3_SCL_N,
      dfsr, ifsr, sr, key_st_, key_la_, key_dp_, key_ex_, key_cont_, key_stop_, key_ss_, key_si_, conf);

endmodule
