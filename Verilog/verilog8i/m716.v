module CardReaderBuffer(dclk, ad2, ae1, ae2, af1, af2, ah1, ah2, aj2, ak2, al2, am2, an2, ap2, ar2, as2, au2, av2, be2, bh2, bj2, bk2, bl2, bm2, bn2, bp2, br1, bs1, bs2, bu1);
input dclk;

// The signals zone and zone_index are numbered per the card reader.
wire [1:12] zone_index;
input ak2, ar2, ap2, be2, as2, bs1, br1, bk2, bl2, al2, ae1, ae2;
assign zone_index = { ak2, ar2, ap2, be2, as2, bs1, br1, bk2, bl2, al2, ae1, ae2};
input ad2;
assign index_markers = ad2;
input ah1;
assign iot634 = ah1;
input bm2;
assign iot632 = bm2;
input bs2;
assign initialize_ = bs2;

wire [0:11] io_bus_in_;
wire i_m_d;

output af1, af2, ah2, aj2, am2, an2, au2, av2, bp2, bn2, bj2, bh2;
assign { af1, af2, ah2, aj2, am2, an2, au2, av2, bp2, bn2, bj2, bh2 } = io_bus_in_;
output bu1;
assign bu1 = i_m_d;

DelayLine #(1000) imd(dclk, index_markers, i_m_d);

reg [1:12] zone;
assign zone_clear = index_markers | ~initialize_;
always @(posedge i_m_d, posedge zone_clear) begin
  if (zone_clear)
    zone = 0;
  else
    zone = zone_index;
end

wire [6:11] char;
assign char[ 6] = zone[11] | zone[12];
assign char[ 7] = zone[10] | zone[12];
assign char[ 8] = zone[ 8] | zone[ 9];
assign char[ 9] = zone[ 4] | zone[ 5] | zone[ 6] | zone[ 7];
assign char[10] = zone[ 2] | zone[ 3] | zone[ 6] | zone[ 7];
assign char[11] = zone[ 1] | zone[ 3] | zone[ 5] | zone[ 7] | zone[ 9];

assign io_bus_in_ = iot634? { zone[12], zone[11], zone[10], zone[1:9] } :
                    iot632? { 6'b111111, char }: 12'b111111111111;

endmodule
