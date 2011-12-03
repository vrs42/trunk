module sheet28(ac00, ac01, ac02, ac03, ac04, ac05, ac06, ac07, ac08, ac09, ac10, ac11, ac_to_mq_enable, adder11_, adder_l, adder_l_, b_eae_on, b_left_shift, bb_left_shift, dvi_, eae_on, eae_right_shift_enable_, eae_tp_, left_shift_, mb07_, mb08_, mb09_, mb10_, mb11_, mb_to_sc_enable, mq00, mq00_, mq01, mq01_, mq02, mq02_, mq03, mq03_, mq04, mq04_, mq05, mq05_, mq06, mq06_, mq07, mq07_, mq08, mq08_, mq09, mq09_, mq10, mq10_, mq11, mq11_, mq_load, n__610, n__611, n__612, n__613, n__614, n__615, n__616, n__617, n__618, n__619, n__620, n__621, n__622, n__623, n__624, n__625, n__626, n__627, n__628, n__629, n__630, n__631, n__632, n__633, n__634, n__635, n__636, n__637, n__638, n__639, n__640, n__641, n__642, n__643, n__644, n__645, n__646, n__647, n__648, n__649, n__650, n__651, n__652, n__653, n__654, n__655, n__656, n__657, n__658, n__659, n__660, n__661, n__662, n__663, n__664, n__665, n__666, n__667, n__668, n__669, n__670, n__671, n__672, n__673, n__674, n__675, n__676, n__677, n__678, n__679, n__680, n__681, n__682, right_shift, sc0, sc0_, sc0_3_0, sc0_3_0_, sc1, sc1_, sc2, sc2_, sc3, sc3_, sc4, sc4_, sc_full, sc_load, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
input ac00;
input ac01;
input ac02;
input ac03;
input ac04;
input ac05;
input ac06;
input ac07;
input ac08;
input ac09;
input ac10;
input ac11;
input ac_to_mq_enable;
input adder11_;
inout adder_l;
input adder_l_;
input b_eae_on;
inout b_left_shift;
inout bb_left_shift;
input dvi_;
input eae_on;
input eae_right_shift_enable_;
input eae_tp_;
inout left_shift_;
input mb07_;
input mb08_;
input mb09_;
input mb10_;
input mb11_;
input mb_to_sc_enable;
output reg mq00;
output mq00_;
output reg mq01;
output mq01_;
output reg mq02;
output mq02_;
output reg mq03;
output mq03_;
output reg mq04;
output mq04_;
output reg mq05;
output mq05_;
output reg mq06;
output mq06_;
output reg mq07;
output mq07_;
output reg mq08;
output mq08_;
output reg mq09;
output mq09_;
output reg mq10;
output mq10_;
output reg mq11;
inout mq11_;
input mq_load;
inout n__610;
inout n__611;
inout n__612;
inout n__613;
inout n__614;
inout n__615;
inout n__616;
inout n__617;
inout n__618;
inout n__619;
inout n__620;
inout n__621;
inout n__622;
inout n__623;
inout n__624;
inout n__625;
inout n__626;
inout n__627;
inout n__628;
inout n__629;
inout n__630;
inout n__631;
inout n__632;
inout n__633;
inout n__634;
inout n__635;
inout n__636;
inout n__637;
inout n__638;
inout n__639;
inout n__640;
inout n__641;
inout n__642;
inout n__643;
inout n__644;
inout n__645;
inout n__646;
inout n__647;
inout n__648;
inout n__649;
inout n__650;
inout n__651;
inout n__652;
inout n__653;
inout n__654;
inout n__655;
inout n__656;
inout n__657;
inout n__658;
inout n__659;
inout n__660;
inout n__661;
inout n__662;
inout n__663;
inout n__664;
inout n__665;
inout n__666;
inout n__667;
inout n__668;
inout n__669;
inout n__670;
inout n__671;
inout n__672;
inout n__673;
inout n__674;
inout n__675;
inout n__676;
inout wand n__677;
inout n__678;
inout n__679;
inout n__680;
inout n__681;
inout n__682;
input right_shift;
output reg sc0;
inout sc0_;
inout sc0_3_0;
inout wand sc0_3_0_;
output reg sc1;
inout sc1_;
output reg sc2;
inout sc2_;
output reg sc3;
inout sc3_;
output reg sc4;
inout sc4_;
inout sc_full;
input sc_load;

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
always @(posedge sc_load) begin
    sc0 <= n__661;
end
assign sc0_ = ~sc0;
always @(posedge sc_load) begin
    sc1 <= n__664;
end
assign sc1_ = ~sc1;
always @(posedge sc_load) begin
    sc2 <= n__665;
end
assign sc2_ = ~sc2;
always @(posedge sc_load) begin
    sc3 <= n__666;
end
assign sc3_ = ~sc3;
always @(posedge sc_load) begin
    sc4 <= n__667;
end
assign sc4_ = ~sc4;
always @(posedge mq_load) begin
    mq00 <= n__646;
end
assign mq00_ = ~mq00;
always @(posedge mq_load) begin
    mq01 <= n__647;
end
assign mq01_ = ~mq01;
always @(posedge mq_load) begin
    mq02 <= n__648;
end
assign mq02_ = ~mq02;
always @(posedge mq_load) begin
    mq03 <= n__649;
end
assign mq03_ = ~mq03;
always @(posedge mq_load) begin
    mq04 <= n__650;
end
assign mq04_ = ~mq04;
always @(posedge mq_load) begin
    mq05 <= n__651;
end
assign mq05_ = ~mq05;
always @(posedge mq_load) begin
    mq06 <= n__652;
end
assign mq06_ = ~mq06;
always @(posedge mq_load) begin
    mq07 <= n__653;
end
assign mq07_ = ~mq07;
always @(posedge mq_load) begin
    mq08 <= n__654;
end
assign mq08_ = ~mq08;
always @(posedge mq_load) begin
    mq09 <= n__655;
end
assign mq09_ = ~mq09;
always @(posedge mq_load) begin
    mq10 <= n__656;
end
assign mq10_ = ~mq10;
always @(posedge mq_load) begin
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

endmodule
