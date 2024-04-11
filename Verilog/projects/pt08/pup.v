module pup(iob0_l, iob1_l, iob2_l, iob3_l, iob4_l, iob5_l, iob6_l, iob7_l, iob8_l, iob9_l, iob10_l, iob11_l, acclr_l, irq_l, skip_l);

output iob0_l;
output iob1_l;
output iob2_l;
output iob3_l;
output iob4_l;
output iob5_l;
output iob6_l;
output iob7_l;
output iob8_l;
output iob9_l;
output iob10_l;
output iob11_l;
output acclr_l;
output irq_l;
output skip_l;

//
// Pullups required for an Omnibus to work properly.
pullup(iob0_l);
pullup(iob1_l);
pullup(iob2_l);
pullup(iob3_l);
pullup(iob4_l);
pullup(iob5_l);
pullup(iob6_l);
pullup(iob7_l);
pullup(iob8_l);
pullup(iob9_l);
pullup(iob10_l);
pullup(iob11_l);
pullup(acclr_l);
pullup(irq_l);
pullup(skip_l);

endmodule
