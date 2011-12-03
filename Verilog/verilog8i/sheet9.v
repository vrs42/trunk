module sheet9(ac00, ac00_, ac01, ac01_, ac02, ac02_, ac03, ac03_, ac04, ac04_, ac05, ac05_, ac06, ac06_, ac07, ac07_, ac08, ac08_, ac09, ac09_, ac10, ac10_, ac11, ac11_, ac_load, adder00, adder01, adder10, adder11, adder11_, adder_l_, asr_enable, asr_l_set_, b_eae_on, carry_out0, carry_out0_, double_left_rotate, double_right_rotate, eae_ir2_, eae_on_, l_enable, lbar_enable, left_shift, link, link_, ma00, ma00_, ma01, ma01_, ma02, ma02_, ma03, ma03_, ma04, ma04_, ma05, ma05_, ma06, ma06_, ma07, ma07_, ma08, ma08_, ma09, ma09_, ma10, ma10_, ma11, ma11_, ma_load, mb00, mb00_, mb01, mb01_, mb02, mb02_, mb03, mb03_, mb04, mb04_, mb05, mb05_, mb06, mb06_, mb07, mb07_, mb08, mb08_, mb09, mb09_, mb10, mb10_, mb11, mb11_, mb_load, n__128, n__129, n__130, n__137, no_shift, pc00, pc00_, pc01, pc01_, pc02, pc02_, pc03, pc03_, pc04, pc04_, pc05, pc05_, pc06, pc06_, pc07, pc07_, pc08, pc08_, pc09, pc09_, pc10, pc10_, pc11, pc11_, pc_load, regbus00, regbus01, regbus02, regbus03, regbus04, regbus05, regbus06, regbus07, regbus08, regbus09, regbus10, regbus11, right_shift, tt_data, tt_inst_, tt_shift_enable, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
output reg ac00;
output ac00_;
output reg ac01;
output ac01_;
output reg ac02;
output ac02_;
output reg ac03;
output ac03_;
output reg ac04;
output ac04_;
output reg ac05;
output ac05_;
output reg ac06;
output ac06_;
output reg ac07;
output ac07_;
output reg ac08;
output ac08_;
output reg ac09;
output ac09_;
output reg ac10;
output ac10_;
output reg ac11;
output ac11_;
input ac_load;
input adder00;
input adder01;
input adder10;
input adder11;
inout adder11_;
inout adder_l_;
input asr_enable;
input asr_l_set_;
input b_eae_on;
inout carry_out0;
input carry_out0_;
input double_left_rotate;
input double_right_rotate;
input eae_ir2_;
input eae_on_;
input l_enable;
input lbar_enable;
input left_shift;
output reg link;
inout link_;
output reg ma00;
output ma00_;
output reg ma01;
output ma01_;
output reg ma02;
output ma02_;
output reg ma03;
output ma03_;
output reg ma04;
output ma04_;
output reg ma05;
output ma05_;
output reg ma06;
output ma06_;
output reg ma07;
output ma07_;
output reg ma08;
output ma08_;
output reg ma09;
output ma09_;
output reg ma10;
output ma10_;
output reg ma11;
output ma11_;
input ma_load;
output reg mb00;
output mb00_;
output reg mb01;
output mb01_;
output reg mb02;
output mb02_;
output reg mb03;
output mb03_;
output reg mb04;
output mb04_;
output reg mb05;
output mb05_;
output reg mb06;
output mb06_;
output reg mb07;
output mb07_;
output reg mb08;
output mb08_;
output reg mb09;
output mb09_;
output reg mb10;
output mb10_;
output reg mb11;
output mb11_;
input mb_load;
inout n__128;
inout n__129;
inout n__130;
inout n__137;
input no_shift;
output reg pc00;
output pc00_;
output reg pc01;
output pc01_;
output reg pc02;
output pc02_;
output reg pc03;
output pc03_;
output reg pc04;
output pc04_;
output reg pc05;
output pc05_;
output reg pc06;
output pc06_;
output reg pc07;
output pc07_;
output reg pc08;
output pc08_;
output reg pc09;
output pc09_;
output reg pc10;
output pc10_;
output reg pc11;
output pc11_;
input pc_load;
input regbus00;
input regbus01;
input regbus02;
input regbus03;
input regbus04;
input regbus05;
input regbus06;
input regbus07;
input regbus08;
input regbus09;
input regbus10;
input regbus11;
input right_shift;
input tt_data;
input tt_inst_;
input tt_shift_enable;

// Sheet 9
always @(posedge ac_load) begin
    link <= n__128;
end
assign link_ = ~link;
// Latch ALU results in the appropriate register.
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

endmodule
