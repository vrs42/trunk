module sheet30(clr_parity_error_, initialize_, iop1, iop4, mb00, mb00_, mb01, mb01_, mb02, mb02_, mb03, mb03_, mb04, mb04_, mb05, mb05_, mb06, mb06_, mb07, mb07_, mb08, mb08_, mb09, mb09_, mb10, mb10_, mb11, mb11_, mb_parity_odd, mem_parity_even_, mp_int_, mp_skip_, n__26, n__262, n__687, n__689, n__690, n__691, n__692, n__693, n__694, n__695, n__696, n__697, n__698, n__699, n__700, tp3, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
inout clr_parity_error_;
input initialize_;
input iop1;
input iop4;
input mb00;
input mb00_;
input mb01;
input mb01_;
input mb02;
input mb02_;
input mb03;
input mb03_;
input mb04;
input mb04_;
input mb05;
input mb05_;
input mb06;
input mb06_;
input mb07;
input mb07_;
input mb08;
input mb08_;
input mb09;
input mb09_;
input mb10;
input mb10_;
input mb11;
input mb11_;
output mb_parity_odd;
input mem_parity_even_;
output reg mp_int_;
output mp_skip_;
inout n__26;
inout n__262;
inout n__687;
inout n__689;
inout n__690;
inout n__691;
inout n__692;
inout n__693;
inout n__694;
inout n__695;
inout n__696;
inout n__697;
inout n__698;
inout n__699;
inout n__700;
input tp3;

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
assign n__26 = ~(mem_parity_even_);
assign n__696 = ~(n__694);
assign n__697 = ~(n__698);
always @(posedge tp3, negedge clr_parity_error_) begin
  if (~clr_parity_error_)
    mp_int_ <= 1'b1;
  else
    mp_int_ <= n__26;
end

endmodule
