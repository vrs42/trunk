module sheet12(ac_enable, acbar_enable, adder04, adder05, adder06, adder07, adder08, adder09, adder10, and_enable, carry_out6_, data06, data07, data08, data_add06, data_add07, data_add08, data_add_enable, data_enable, double_left_rotate, double_right_rotate, input_bus06, input_bus07, input_bus08, io_enable, left_shift, ma_enable5_11, mem06, mem07, mem08, mem_enable5_8, mq06, mq07, mq08, mq_enable, n__132, no_shift, pc_enable, right_shift, sc0, sc1, sc_enable, sr06, sr07, sr08, sr_enable, tt_line_shift_, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
input ac_enable;
input acbar_enable;
input adder04;
input adder05;
inout adder06;
inout adder07;
inout adder08;
inout adder09;
input adder10;
input and_enable;
output carry_out6_;
input data06;
input data07;
input data08;
input data_add06;
input data_add07;
input data_add08;
input data_add_enable;
input data_enable;
input double_left_rotate;
input double_right_rotate;
input input_bus06;
input input_bus07;
input input_bus08;
input io_enable;
input left_shift;
input ma_enable5_11;
input mem06;
input mem07;
input mem08;
input mem_enable5_8;
input mq06;
input mq07;
input mq08;
input mq_enable;
inout n__132;
input no_shift;
input pc_enable;
input right_shift;
input sc0;
input sc1;
input sc_enable;
input sr06;
input sr07;
input sr08;
input sr_enable;
input tt_line_shift_;

// Sheet 12
// This hair takes two operand bits and carry-in, adds them, and
// generates two bits of result and a carry-out.  Note that the
// inputs are complemented, and therefore, so are the outputs.
assign {carry_out6_, adder06, adder07} = n__132 + { ~(mq_enable & mq06 | ac_enable & ac06 | acbar_enable & ac06_ | data_enable & data06 | sr_enable & sr06 | 1'b0 | io_enable & input_bus06), ~(mq_enable & mq07 | 1'b0 | ac_enable & ac07 | acbar_enable & ac07_ | data_enable & data07 | sr_enable & sr07 | sc_enable & sc0 | io_enable & input_bus07) } + { ~(mem_enable5_8 & mem06 | ma_enable5_11 & ma06 | pc_enable & pc06 | data_add_enable & data_add06), ~(mem_enable5_8 & mem07 | ma_enable5_11 & ma07 | pc_enable & pc07 | data_add_enable & data_add07) };
assign regbus06 = ~(and_enable & mb06_ | double_right_rotate & adder04 | no_shift & adder06 | right_shift & adder05 | left_shift & adder07 | double_left_rotate & adder08 | ~tt_line_shift_ & adder05);
assign regbus07 = ~(and_enable & mb07_ | double_right_rotate & adder05 | no_shift & adder07 | right_shift & adder06 | left_shift & adder08 | double_left_rotate & adder09 | ~tt_line_shift_ & adder07);
// This hair takes two operand bits and carry-in, adds them, and
// generates two bits of result and a carry-out.  Note that the
// inputs are complemented, and therefore, so are the outputs.
assign {n__132, adder08, adder09} = n__136 + { ~(mq_enable & mq08 | ac_enable & ac08 | acbar_enable & ac08_ | data_enable & data08 | sr_enable & sr08 | sc_enable & sc1 | io_enable & input_bus08), ~(mq_enable & mq09 | 1'b0 | ac_enable & ac09 | acbar_enable & ac09_ | data_enable & data09 | sr_enable & sr09 | sc_enable & sc2 | io_enable & input_bus09) } + { ~(mem_enable5_8 & mem08 | ma_enable5_11 & ma08 | pc_enable & pc08 | data_add_enable & data_add08), ~(mem_enable9_11 & mem09 | ma_enable5_11 & ma09 | pc_enable & pc09 | data_add_enable & data_add09) };
assign regbus08 = ~(and_enable & mb08_ | double_right_rotate & adder06 | no_shift & adder08 | right_shift & adder07 | left_shift & adder09 | double_left_rotate & adder10 | ~tt_line_shift_ & adder08);
assign regbus09 = ~(and_enable & mb09_ | double_right_rotate & adder07 | no_shift & adder09 | right_shift & adder08 | left_shift & adder10 | double_left_rotate & adder09 | ~tt_line_shift_ & adder09);

endmodule
