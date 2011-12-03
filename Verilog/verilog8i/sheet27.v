module sheet27(ac00, ac00_, ac01, ac01_, ac02, ac02_, ac03_, ac_to_mq_enable, ac_to_mq_enable_, adder_l, asr_enable, asr_l_set_, b_eae_on, b_execute, b_fetch, b_power_clear_, div_last, div_last_, dvi, dvi_, eae_ac_enable_, eae_acbar_enable_, eae_begin, eae_complete_, eae_e_set_, eae_end, eae_execute_, eae_inst, eae_ir0, eae_ir0_, eae_ir1, eae_ir1_, eae_ir2, eae_ir2_, eae_ir_clear_, eae_l_disable, eae_left_shift_enable_, eae_mem_enable_, eae_mq0_enable_, eae_mq0bar_enable_, eae_no_shift_enable, eae_on, eae_on_, eae_right_shift_enable_, eae_run, eae_run_, eae_set_, eae_start_, eae_tg, eae_tp, eae_tp_, low_ac0, mb03, mb04_, mb05, mb06, mb07, mb08, mb09, mb09_, mb10, mb10_, mb11, mb_to_sc_enable, mfts2_, mid_ac0, mq00, mq00_, mq01, mq01_, mq02_, mq03_, mq04_, mq05_, mq06_, mq07_, mq08_, mq09_, mq10, mq10_, mq11, mq11_, mq_enable, mq_load, mq_low_ac0, muy, muy_, muy_dvi_, n__404, n__405, n__406, n__419, n__568, n__570, n__571, n__572, n__573, n__574, n__575, n__576, n__577, n__578, n__579, n__580, n__581, n__582, n__583, n__584, n__585, n__586, n__587, n__588, n__589, n__590, n__591, n__592, n__593, n__594, n__595, n__596, n__597, n__598, n__599, n__600, n__601, n__602, n__603, n__604, n__605, n__606, n__607, n__608, n__609, n__683, n__684, n__685, n__686, n__688, nmi, nmi_, norm, norm_, op2, opr, sc0, sc0_3_0, sc0_3_0_, sc1, sc2, sc3, sc4, sc4_, sc_0_, sc_enable, sc_full, sc_load, scl_, tp3, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
input ac00;
input ac00_;
input ac01;
input ac01_;
input ac02;
input ac02_;
input ac03_;
output ac_to_mq_enable;
inout ac_to_mq_enable_;
input adder_l;
inout asr_enable;
output asr_l_set_;
inout b_eae_on;
input b_execute;
input b_fetch;
input b_power_clear_;
inout div_last;
inout div_last_;
inout dvi;
inout dvi_;
output eae_ac_enable_;
inout eae_acbar_enable_;
inout eae_begin;
inout eae_complete_;
output eae_e_set_;
output reg eae_end;
output eae_execute_;
inout eae_inst;
output reg eae_ir0;
inout eae_ir0_;
output reg eae_ir1;
inout eae_ir1_;
output reg eae_ir2;
inout eae_ir2_;
input eae_ir_clear_;
output eae_l_disable;
output eae_left_shift_enable_;
output eae_mem_enable_;
output eae_mq0_enable_;
output eae_mq0bar_enable_;
output eae_no_shift_enable;
output reg eae_on;
inout eae_on_;
inout eae_right_shift_enable_;
output reg eae_run;
inout eae_run_;
output eae_set_;
inout eae_start_;
output reg eae_tg;
inout eae_tp;
inout eae_tp_;
input low_ac0;
input mb03;
input mb04_;
input mb05;
input mb06;
input mb07;
input mb08;
input mb09;
input mb09_;
input mb10;
input mb10_;
input mb11;
output mb_to_sc_enable;
input mfts2_;
input mid_ac0;
input mq00;
input mq00_;
input mq01;
input mq01_;
input mq02_;
input mq03_;
input mq04_;
input mq05_;
input mq06_;
input mq07_;
input mq08_;
input mq09_;
input mq10;
input mq10_;
input mq11;
input mq11_;
output wand mq_enable;
output wand mq_load;
inout mq_low_ac0;
inout muy;
inout muy_;
inout muy_dvi_;
inout n__404;
inout n__405;
inout n__406;
inout n__419;
inout n__568;
inout n__570;
inout n__571;
inout n__572;
inout n__573;
inout n__574;
inout n__575;
inout n__576;
inout n__577;
inout n__578;
inout n__579;
inout n__580;
inout n__581;
inout n__582;
inout n__583;
inout n__584;
inout n__585;
inout n__586;
inout n__587;
inout n__588;
inout n__589;
inout n__590;
inout n__591;
inout n__592;
inout n__593;
inout n__594;
inout n__595;
inout n__596;
inout n__597;
inout n__598;
inout n__599;
inout n__600;
inout n__601;
inout n__602;
inout n__603;
inout n__604;
inout n__605;
inout n__606;
inout n__607;
inout n__608;
inout n__609;
inout n__683;
inout n__684;
inout n__685;
inout n__686;
inout n__688;
inout nmi;
inout nmi_;
inout norm;
inout norm_;
input op2;
input opr;
input sc0;
input sc0_3_0;
input sc0_3_0_;
input sc1;
input sc2;
input sc3;
input sc4;
input sc4_;
inout sc_0_;
output wand sc_enable;
input sc_full;
output wand sc_load;
inout scl_;
input tp3;

// Sheet 27
DelayLine #(250) dl_n__597(dclk, n__607, n__597);
DelayLine #(350) dl_n__596(dclk, n__607, n__596);
assign n__608 = n__596;
assign eae_tp = n__597;
assign norm_ = ~(norm);
always @(posedge eae_tp, negedge eae_run) begin
  if (~eae_run)
    eae_end <= 1'b1;
  else
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
always @(posedge n__600, negedge eae_ir_clear_) begin
  if (~eae_ir_clear_)
    eae_ir0 <= 1'b0;
  else
    eae_ir0 <= mb08;
end
assign eae_ir0_ = ~eae_ir0;
always @(posedge n__600, negedge eae_ir_clear_) begin
  if (~eae_ir_clear_)
    eae_ir1 <= 1'b0;
  else
    eae_ir1 <= mb09;
end
assign eae_ir1_ = ~eae_ir1;
always @(posedge n__600, negedge eae_ir_clear_) begin
  if (~eae_ir_clear_)
    eae_ir2 <= 1'b0;
  else
    eae_ir2 <= mb10;
end
assign eae_ir2_ = ~eae_ir2;
always @(posedge n__607, negedge b_power_clear_) begin
  if (~b_power_clear_)
    eae_on <= 1'b0;
  else
    eae_on <= n__609;
end
assign eae_on_ = ~eae_on;
always @(posedge n__608, negedge b_power_clear_, negedge eae_start_) begin
  if (~b_power_clear_)
    eae_run <= 1'b0;
  else
  if (~eae_start_)
    eae_run <= 1'b1;
  else
    eae_run <= eae_on;
end
assign eae_run_ = ~eae_run;
always @(posedge n__605, negedge b_power_clear_, negedge n__604) begin
  if (~b_power_clear_)
    eae_tg <= 1'b0;
  else
  if (~n__604)
    eae_tg <= 1'b1;
  else
    eae_tg <= n__603;
end

endmodule
