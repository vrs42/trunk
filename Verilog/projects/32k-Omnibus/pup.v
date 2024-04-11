module pup(c0_low, c1_low, data00_low, data01_low, data02_low, data03_low, data04_low, data05_low, data06_low, data07_low, data08_low, data09_low, data10_low, data11_low, internal_io_low, interrupt_low, skip_low);

output c0_low;
output c1_low;
output data00_low;
output data01_low;
output data02_low;
output data03_low;
output data04_low;
output data05_low;
output data06_low;
output data07_low;
output data08_low;
output data09_low;
output data10_low;
output data11_low;
output internal_io_low;
output interrupt_low;
output skip_low;

//
// Pullups required for an Omnibus to work properly.
pullup(c0_low);
pullup(c1_low);
pullup(data00_low);
pullup(data01_low);
pullup(data02_low);
pullup(data03_low);
pullup(data04_low);
pullup(data05_low);
pullup(data06_low);
pullup(data07_low);
pullup(data08_low);
pullup(data09_low);
pullup(data10_low);
pullup(data11_low);
pullup(internal_io_low);
pullup(interrupt_low);
pullup(skip_low);

endmodule
