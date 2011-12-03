module sheet22(b_ext_inst, b_fetch, clear_df_, clear_ib_, clear_if_, cuf_, df0, df0_, df1, df1_, df2, df2_, dfsr0, dfsr1, dfsr2, e_set_, ext_go, ext_inst, f_set_, ib0, ib1, ib2, ib_to_if, ib_to_if_, if0, if0_, if1, if1_, if2, if2_, ifsr0, ifsr1, ifsr2, int_inhibit_, iot, jmp_, jms_, key_lamfts0_, load_ib, mb03_, mb04, mb05_, mb06, mb06_, mb06xmb09, mb07, mb07_, mb08, mb08_, mb09, mb10, mb10_, mb11, mb11_, mb_to_ib, me06_, me07_, me08_, me09_, me10_, me11_, mem_ext, mem_ext_, mem_ext_ac_load_enable_, mem_ext_io_enable_, n__27, n__420, n__421, n__422, n__423, n__424, n__425, n__426, n__427, n__428, n__429, n__430, n__431, n__432, n__433, n__434, n__435, n__436, n__437, n__438, n__439, n__440, n__441, n__442, n__443, n__444, n__445, n__446, n__447, n__451, n__452, n__453, n__454, n__455, n__456, n__457, n__458, n__459, n__460, n__461, n__462, n__463, n__464, n__465, n__466, n__467, n__468, n__469, n__470, n__471, n__472, n__473, n__474, n__475, n__476, n__477, n__478, n__479, n__480, n__481, n__482, n__483, n__484, n__485, n__489, n__490, n__491, n__492, n__493, n__497, pc_load, pc_loadxsr_enable_, rib, rmf_, sf0, sf1, sf2, sf3, sf4, sf5, sf_enable, sr_enable, tp3, ts3, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
inout b_ext_inst;
input b_fetch;
input clear_df_;
input clear_ib_;
input clear_if_;
input cuf_;
output reg df0;
output df0_;
output reg df1;
output df1_;
output reg df2;
output df2_;
input dfsr0;
input dfsr1;
input dfsr2;
input e_set_;
inout ext_go;
inout ext_inst;
input f_set_;
output reg ib0;
output reg ib1;
output reg ib2;
inout ib_to_if;
inout ib_to_if_;
output reg if0;
output if0_;
output reg if1;
output if1_;
output reg if2;
output if2_;
input ifsr0;
input ifsr1;
input ifsr2;
output reg int_inhibit_;
input iot;
input jmp_;
input jms_;
input key_lamfts0_;
inout load_ib;
input mb03_;
input mb04;
input mb05_;
input mb06;
input mb06_;
inout mb06xmb09;
input mb07;
input mb07_;
input mb08;
input mb08_;
input mb09;
input mb10;
input mb10_;
input mb11;
input mb11_;
inout mb_to_ib;
output me06_;
output me07_;
output me08_;
output me09_;
output me10_;
output me11_;
inout mem_ext;
inout mem_ext_;
output mem_ext_ac_load_enable_;
output wand mem_ext_io_enable_;
inout n__27;
inout n__420;
inout n__421;
inout n__422;
inout n__423;
inout n__424;
inout n__425;
inout n__426;
inout n__427;
inout n__428;
inout n__429;
inout n__430;
inout n__431;
inout n__432;
inout n__433;
inout n__434;
inout n__435;
inout n__436;
inout n__437;
inout n__438;
inout n__439;
inout n__440;
inout n__441;
inout n__442;
inout n__443;
inout n__444;
inout n__445;
inout n__446;
inout n__447;
inout n__451;
inout wand n__452;
inout n__453;
inout n__454;
inout n__455;
inout n__456;
inout n__457;
inout n__458;
inout n__459;
inout n__460;
inout n__461;
inout n__462;
inout n__463;
inout n__464;
inout n__465;
inout n__466;
inout n__467;
inout n__468;
inout n__469;
inout n__470;
inout n__471;
inout n__472;
inout n__473;
inout n__474;
inout n__475;
inout n__476;
inout n__477;
inout n__478;
inout n__479;
inout n__480;
inout n__481;
inout n__482;
inout n__483;
inout n__484;
inout n__485;
inout n__489;
inout n__490;
inout n__491;
inout n__492;
inout n__493;
inout n__497;
input pc_load;
inout pc_loadxsr_enable_;
inout rib;
inout rmf_;
input sf0;
input sf1;
input sf2;
input sf3;
input sf4;
input sf5;
inout sf_enable;
input sr_enable;
input tp3;
input ts3;

// Sheet 22
assign b_ext_inst = ~(n__451);
assign n__420 = ~(mb07_ & mb08_);
assign mb06xmb09 = ~(n__421);
assign n__422 = ~(n__420);
assign rmf_ = ~(n__422 & mb06xmb09);
assign n__490 = ~(mem_ext & mb11);
assign n__464 = ~(n__459 & df0);
assign n__465 = ~(n__460 & if0);
assign n__462 = ~(rib & sf1);
assign n__468 = ~(n__459 & df2);
assign n__463 = ~(rib & sf0);
assign n__469 = ~(n__459 & df1);
assign n__466 = ~(n__460 & if1);
assign n__461 = ~(rib & sf2);
assign n__467 = ~(n__460 & if2);
assign n__497 = ~(ext_go & mb10);
assign n__482 = ~(sr_enable & dfsr0);
assign n__480 = ~(sf_enable & sf3);
assign n__477 = ~(n__473 & mb07);
assign n__479 = ~(sr_enable & dfsr2);
assign n__481 = ~(n__473 & mb06);
assign n__478 = ~(sr_enable & dfsr1);
assign n__476 = ~(sf_enable & sf4);
assign n__474 = ~(n__473 & mb08);
assign n__475 = ~(sf_enable & sf5);
assign n__493 = ~(mb11_ & rmf_);
assign ext_go = ~(n__492);
assign n__473 = ~(n__490);
assign me06_ = ~(n__470);
assign me07_ = ~(n__471);
assign n__492 = ~(tp3 & mem_ext);
assign me09_ = ~(rib & sf3);
assign me10_ = ~(rib & sf4);
assign me11_ = ~(rib & sf5);
assign me08_ = ~(n__472);
assign n__453 = ~(n__452);
assign mem_ext_ = ~(n__453 & iot);
assign mem_ext = ~(mem_ext_);
assign n__459 = ~(n__455);
assign n__460 = ~(n__457);
assign n__454 = ~(mb09 & mem_ext);
assign ext_inst = ~(n__454);
assign rib = ~(n__456);
assign mem_ext_ac_load_enable_ = ~(tp3 & n__458);
assign ib_to_if_ = ~(ib_to_if);
assign pc_loadxsr_enable_ = ~(pc_load & n__425);
assign n__424 = ~(mb10_ & rmf_);
assign mb_to_ib = ~(n__423);
assign n__426 = ~(ext_go & n__424);
assign sf_enable = ~(rmf_);
assign n__423 = ~(mb10 & mem_ext);
assign n__421 = ~(mb06 & ext_inst);
assign n__445 = ~(f_set_ & e_set_);
assign ib_to_if = ~(pc_loadxsr_enable_ & n__447);
assign n__446 = ~(jmp_ & jms_);
assign n__439 = ~(key_lamfts0_ & ib0);
assign n__440 = ~(key_lamfts0_ & ib1);
assign n__441 = ~(key_lamfts0_ & ib2);
assign n__444 = ~(n__429 & n__439);
assign n__443 = ~(n__430 & n__440);
assign n__442 = ~(n__433 & n__441);
assign n__489 = ~(n__491 & pc_loadxsr_enable_);
assign n__491 = ~(n__493 & ext_go);
assign load_ib = ~(pc_loadxsr_enable_ & n__426);
assign n__429 = ~(sr_enable & ifsr0);
assign n__428 = ~(sf_enable & sf0);
assign n__431 = ~(mb_to_ib & mb07);
assign n__433 = ~(sr_enable & ifsr2);
assign n__427 = ~(mb_to_ib & mb06);
assign n__430 = ~(sr_enable & ifsr1);
assign n__432 = ~(sf_enable & sf1);
assign n__434 = ~(mb_to_ib & mb08);
assign n__435 = ~(sf_enable & sf2);
assign n__425 = ~(key_lamfts0_);
assign n__447 = ~(n__445 & tp3 & n__446);
assign n__471 = ~(n__469 & n__462 & n__466);
assign n__455 = ~(b_ext_inst & mb07_ & mb08);
assign n__457 = ~(b_ext_inst & mb07 & mb08_);
assign n__470 = ~(n__464 & n__463 & n__465);
assign n__472 = ~(n__468 & n__461 & n__467);
assign n__456 = ~(b_ext_inst & mb08 & mb07);
assign n__458 = ~(n__455 & n__456 & n__457);
always @(posedge n__27, negedge ib_to_if_) begin
  if (~ib_to_if_)
    int_inhibit_ <= 1'b1;
  else
    int_inhibit_ <= 1'b0;
end
assign n__452 = ~(b_fetch & mb03_ & mb04 & mb05_);
always @(posedge ib_to_if, negedge clear_if_) begin
  if (~clear_if_)
    if0 <= 1'b0;
  else
    if0 <= n__444;
end
assign if0_ = ~if0;
always @(posedge ib_to_if, negedge clear_if_) begin
  if (~clear_if_)
    if1 <= 1'b0;
  else
    if1 <= n__443;
end
assign if1_ = ~if1;
always @(posedge ib_to_if, negedge clear_if_) begin
  if (~clear_if_)
    if2 <= 1'b0;
  else
    if2 <= n__442;
end
assign if2_ = ~if2;
always @(posedge load_ib, negedge clear_ib_) begin
  if (~clear_ib_)
    ib0 <= 1'b0;
  else
    ib0 <= n__438;
end
always @(posedge load_ib, negedge clear_ib_) begin
  if (~clear_ib_)
    ib1 <= 1'b0;
  else
    ib1 <= n__437;
end
always @(posedge load_ib, negedge clear_ib_) begin
  if (~clear_ib_)
    ib2 <= 1'b0;
  else
    ib2 <= n__436;
end
always @(posedge n__489, negedge clear_df_) begin
  if (~clear_df_)
    df0 <= 1'b0;
  else
    df0 <= n__483;
end
assign df0_ = ~df0;
always @(posedge n__489, negedge clear_df_) begin
  if (~clear_df_)
    df1 <= 1'b0;
  else
    df1 <= n__484;
end
assign df1_ = ~df1;
always @(posedge n__489, negedge clear_df_) begin
  if (~clear_df_)
    df2 <= 1'b0;
  else
    df2 <= n__485;
end
assign df2_ = ~df2;
assign n__438 = ~(n__429 & n__427 & n__428);
assign n__436 = ~(n__433 & n__434 & n__435);
assign n__484 = ~(n__478 & n__477 & n__476);
assign n__437 = ~(n__430 & n__431 & n__432);
assign n__483 = ~(n__482 & n__481 & n__480);
assign n__485 = ~(n__479 & n__474 & n__475);
assign mem_ext_io_enable_ = ~(n__458 & ts3 & iot & iot);
assign n__451 = ~(b_fetch & mb03_ & mb04 & mb05_ & mb06_ & mb09 & iot);
assign n__27 = ~(n__497 & n__497 & cuf_ & cuf_);

endmodule
