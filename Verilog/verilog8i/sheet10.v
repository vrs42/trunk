module sheet10(ac_enable, acbar_enable, adder00, adder01, adder02, adder03, adder04, adder11, adder_l_, and_enable, carry_out0_, data00, data01, data02, data_add00, data_add01, data_add02, data_add_enable, data_enable, double_left_rotate, double_right_rotate, input_bus00, input_bus01, input_bus02, io_enable, left_shift, ma_enable0_4, mem00, mem01, mem02, mem_enable0_4, mq00, mq01, mq02, mq_enable, n__160, no_shift, pc_enable, right_shift, sc_enable, sr00, sr01, sr02, sr_enable, tt_line_shift_, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
input ac_enable;
input acbar_enable;
inout adder00;
inout adder01;
inout adder02;
inout adder03;
input adder04;
input adder11;
input adder_l_;
input and_enable;
output carry_out0_;
input data00;
input data01;
input data02;
input data_add00;
input data_add01;
input data_add02;
input data_add_enable;
input data_enable;
input double_left_rotate;
input double_right_rotate;
input input_bus00;
input input_bus01;
input input_bus02;
input io_enable;
input left_shift;
input ma_enable0_4;
input mem00;
input mem01;
input mem02;
input mem_enable0_4;
input mq00;
input mq01;
input mq02;
input mq_enable;
inout n__160;
input no_shift;
input pc_enable;
input right_shift;
input sc_enable;
input sr00;
input sr01;
input sr02;
input sr_enable;
input tt_line_shift_;

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

endmodule
