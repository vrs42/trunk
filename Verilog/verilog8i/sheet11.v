module sheet11(ac_enable, acbar_enable, adder02, adder03, adder04, adder05, adder06, and_enable, carry_out6_, data03, data04, data05, data_add03, data_add04, data_add05, data_add_enable, data_enable, double_left_rotate, double_right_rotate, input_bus03, input_bus04, input_bus05, io_enable, left_shift, ma_enable0_4, ma_enable5_11, mem03, mem04, mem05, mem_enable0_4, mem_enable5_8, mq03, mq04, mq05, mq_enable, n__133, no_shift, pc_enable, right_shift, sc_enable, sr03, sr04, sr05, sr_enable, tt_line_shift_, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
input ac_enable;
input acbar_enable;
input adder02;
input adder03;
output adder04;
output adder05;
input adder06;
input and_enable;
input carry_out6_;
input data03;
input data04;
input data05;
input data_add03;
input data_add04;
input data_add05;
input data_add_enable;
input data_enable;
input double_left_rotate;
input double_right_rotate;
input input_bus03;
input input_bus04;
input input_bus05;
input io_enable;
input left_shift;
input ma_enable0_4;
input ma_enable5_11;
input mem03;
input mem04;
input mem05;
input mem_enable0_4;
input mem_enable5_8;
input mq03;
input mq04;
input mq05;
input mq_enable;
inout n__133;
input no_shift;
input pc_enable;
input right_shift;
input sc_enable;
input sr03;
input sr04;
input sr05;
input sr_enable;
input tt_line_shift_;

// Sheet 11
// This hair takes two operand bits and carry-in, adds them, and
// generates two bits of result and a carry-out.  Note that the
// inputs are complemented, and therefore, so are the outputs.
assign {n__133, adder04, adder05} = carry_out6_ + { ~(mq_enable & mq04 | ac_enable & ac04 | acbar_enable & ac04_ | data_enable & data04 | sr_enable & sr04 | 1'b0 | io_enable & input_bus04), ~(mq_enable & mq05 | 1'b0 | ac_enable & ac05 | acbar_enable & ac05_ | data_enable & data05 | sr_enable & sr05 | 1'b0 | io_enable & input_bus05) } + { ~(mem_enable0_4 & mem04 | ma_enable0_4 & ma04 | pc_enable & pc04 | data_add_enable & data_add04), ~(mem_enable5_8 & mem05 | ma_enable5_11 & ma05 | pc_enable & pc05 | data_add_enable & data_add05) };
assign regbus04 = ~(and_enable & mb04_ | double_right_rotate & adder02 | no_shift & adder04 | right_shift & adder03 | left_shift & adder05 | double_left_rotate & adder06 | ~tt_line_shift_ & adder03);
assign regbus05 = ~(and_enable & mb05_ | double_right_rotate & adder03 | no_shift & adder05 | right_shift & adder04 | left_shift & adder06 | double_left_rotate & adder03 | ~tt_line_shift_ & adder05);

endmodule
