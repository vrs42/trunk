module TTYTransmitter(ae1, ae2, af1, af2, ah1, ah2, aj1, aj2, ak1, ak2, al1, al2, am2, an1, an2, ap2, ar1, ar2, as1, as2, at2, au1, au2, av2, bd2, be2, bf2, bh2, bj1, bj2, bk2, bn1, bn2, bp1, bp2, br2, bs2);

wire [4:11] ac4_11;

input ae2, ae1, af2, af1, ah2, aj2;
assign { mb03_, mb04_, mb05_, mb06, mb07_, mb08_ }
     = { ae2,   ae1,   af2,   af1,  ah2,   aj2 };
input bh2, bd2, as1;
assign { iop1, iop2, iop4 } = { bh2, bd2, as1 };
input be2;
assign initialize = be2;
input ap2, ar2, al2, am2, au2, as2, at2, au1;
assign ac4_11 = { ap2,  ar2,  al2,  am2,  au2,  as2,  at2,  au1 };
input ah1;
assign enable_zdetect = ah1;
input ak1;
assign new_char = ak1;
input an1;
assign force_select_ = an1;
input an2;
assign force_enable = an2;
input bf2;
assign flag_clr_ = bf2;
input bj1;
assign iot_ok = bj1;
input bs2;
assign force_stop_ = bs2;
input bn2;
assign stop_ = bn2;
input bp2;
assign tto_clock_ = bp2;

wire enable;
reg line;
wire tx_data;
wire tto_skip_;
reg teleprinter_flag;
reg [0:2] out_stop;
wire tpc;
reg tto_shift;
// synthesis attribute CLOCK_SIGNAL of tto_shift is "yes";
reg out_active;
reg [3:11] tto;

output ak2, al1;
assign { ak2, al1} = { enable, ~enable };
output av2;
assign av2 = ~tx_data;
output bj2;
assign bj2 = tto_skip_;
output bk2;
assign bk2 = ~teleprinter_flag;
output br2, bp1, bn1;
assign { br2, bp1, bn1 } = ~out_stop;
output ar1;
assign ar1 = ~tpc;
output aj1;
assign aj1 = tto[6];

assign tto_select_ = ~(mb03_ & mb04_ & mb05_ & mb06 & mb07_ & mb08_ & iot_ok);
assign tto_select = ~tto_select_ | ~force_select_;

assign tpc = tto_select & iop4;

always @(posedge tto_clock_) begin
  tto_shift <= ~(tto_shift & out_active);
end

always @(posedge tto_clock_, negedge tto_shift) begin
  if (~tto_shift)
    out_stop <= ~0;
  else
    out_stop <= { (out_active | ~force_stop_), out_stop[0:1] };
end

assign tto0_ = { enable_zdetect, tto } != ~9'b0;

assign start_bit = stop_ & new_char;
always @(posedge tto_clock_, posedge initialize) begin
  if (initialize)
    out_active <= 0;
  else
    out_active <= start_bit | (out_active & tto0_);
end

wire [3:11] tto_set;
assign tto_set = tpc? { force_enable, ac4_11 } : 0;
always @(posedge tto_shift, posedge initialize, posedge tto_set[3]) begin
  if (initialize)
    tto[3] <= 0;
  else if (tto_set[3])
    tto[3] <= 1;
  else
    tto[3] <= 0;
  end
assign enable = tto[3];
genvar bit;
generate
  for (bit = 4; bit < 12; bit = bit + 1)
    begin: ttobit
      always @(posedge tto_shift, posedge initialize, posedge tto_set[bit]) begin
        if (initialize)
          tto[bit] <= 0;
        else if (tto_set[bit])
          tto[bit] <= 1;
        else
          tto[bit] <= tto[bit-1];
      end
    end
endgenerate
assign start_bit = stop_ & new_char;
always @(posedge tto_shift, posedge start_bit) begin
  if (start_bit)
    line <= 0;
  else
    line <= tto[11];
end
assign tx_data = ~out_active | line;

assign tcf = initialize | ~flag_clr_ | (tto_select & iop2);

always @(posedge tto_shift, posedge tcf) begin
  if (tcf)
    teleprinter_flag <= 0;
  else
    teleprinter_flag <= ~tto0_;
end

assign tto_skip_ = ~(teleprinter_flag & tto_select & iop1);

endmodule
