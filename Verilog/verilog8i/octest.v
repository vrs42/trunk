module octest(i1, i2, i3, o1, o2, o3);

input i1, i2, i3;

wand t1, t2;

output wand o1, o2, o3;

reg r1;
always @(posedge i2, posedge i3) begin
  if (i3)
    r1 <= 0;
  else
    r1 <= i1;
end

assign o1 = i1;
assign o1 = i2;
assign o1 = i3;

//DelayLine #(100) a(i2, i3, t2);
assign t2 = i1;
assign o2 = t2;

//DelayLine #(200) b(i2, i3, o3);
assign o3 = r1;
assign o3 = t1;
assign o3 = i1;

assign t1 = i1;
assign t1 = i2;
assign t1 = i3;

assign t2 = 1'b1;

assign o2 = 1'b1;
assign o2 = t2;
assign o2 = i2;
assign o2 = r1;

endmodule
