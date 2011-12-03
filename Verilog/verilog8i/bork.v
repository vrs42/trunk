module bork(foo, out);

input wand foo;
// synthesis attribute PULLUP of foo is "yes";
output out;
wand fie = 1'b1;
// synthesis attribute PULLUP of fie is "yes";
wire tmp;

assign out = tmp;
assign tmp = ~(foo & fie & fie & fie & fie);

endmodule

