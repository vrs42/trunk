module sheet13(ac_enable, acbar_enable, adder00, adder08, adder09, adder10, adder11, adder_l_, and_enable, carry_insert_, data09, data10, data11, data_add09, data_add10, data_add11, data_add_enable, data_enable, double_left_rotate, double_right_rotate, e25d1, eae_mq0_enable_, eae_mq0bar_enable_, eae_on_, input_bus09, input_bus10, input_bus11, io_enable, left_shift, ma_enable5_11, mem09, mem10, mem11, mem_enable9_11, mq09, mq10, mq11, mq_enable, n__136, n__140, no_shift, pc_enable, right_shift, sc2, sc3, sc4, sc_enable, sr09, sr10, sr11, sr_enable, tt_carry_insert_s, tt_line_shift_, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
input ac_enable;
input acbar_enable;
input adder00;
input adder08;
input adder09;
inout adder10;
output adder11;
input adder_l_;
input and_enable;
input carry_insert_;
input data09;
input data10;
input data11;
input data_add09;
input data_add10;
input data_add11;
input data_add_enable;
input data_enable;
input double_left_rotate;
input double_right_rotate;
inout e25d1;
input eae_mq0_enable_;
input eae_mq0bar_enable_;
input eae_on_;
input input_bus09;
input input_bus10;
input input_bus11;
input io_enable;
input left_shift;
input ma_enable5_11;
input mem09;
input mem10;
input mem11;
input mem_enable9_11;
input mq09;
input mq10;
input mq11;
input mq_enable;
inout n__136;
inout n__140;
input no_shift;
input pc_enable;
input right_shift;
input sc2;
input sc3;
input sc4;
input sc_enable;
input sr09;
input sr10;
input sr11;
input sr_enable;
input tt_carry_insert_s;
input tt_line_shift_;

// Sheet 13
assign n__140 = ~(eae_on_ & adder_l_);
assign e25d1 = ~(n__140 & eae_mq0bar_enable_ & eae_mq0_enable_);
// This hair takes two operand bits and carry-in, adds them, and
// generates two bits of result and a carry-out.  Note that the
// inputs are complemented, and therefore, so are the outputs.
assign {n__136, adder10, adder11} = carry_insert_ + { ~(mq_enable & mq10 | ac_enable & ac10 | acbar_enable & ac10_ | data_enable & data10 | sr_enable & sr10 | sc_enable & sc3 | io_enable & input_bus10), ~(mq_enable & mq11 | tt_carry_insert_s | ac_enable & ac11 | acbar_enable & ac11_ | data_enable & data11 | sr_enable & sr11 | sc_enable & sc4 | io_enable & input_bus11) } + { ~(mem_enable9_11 & mem10 | ma_enable5_11 & ma10 | pc_enable & pc10 | data_add_enable & data_add10), ~(mem_enable9_11 & mem11 | ma_enable5_11 & ma11 | pc_enable & pc11 | data_add_enable & data_add11) };
assign regbus10 = ~(and_enable & mb10_ | double_right_rotate & adder08 | no_shift & adder10 | right_shift & adder09 | left_shift & adder11 | double_left_rotate & e25d1 | ~tt_line_shift_ & adder10);
assign regbus11 = ~(and_enable & mb11_ | double_right_rotate & adder09 | no_shift & adder11 | right_shift & adder10 | left_shift & e25d1 | double_left_rotate & adder00 | ~tt_line_shift_ & adder11);

endmodule
