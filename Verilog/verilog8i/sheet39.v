module sheet39(i_m_d, index_markers, initialize_, io_bus_in00_, io_bus_in01_, io_bus_in02_, io_bus_in03_, io_bus_in04_, io_bus_in05_, io_bus_in06_, io_bus_in07_, io_bus_in08_, io_bus_in09_, io_bus_in10_, io_bus_in11_, iot632, iot634, zone01_index, zone02_index, zone03_index, zone04_index, zone05_index, zone06_index, zone07_index, zone08_index, zone09_index, zone10_index, zone11_index, zone12_index, dclk);
input dclk;
// synthesis attribute CLOCK_SIGNAL of dclk is "yes";
output i_m_d;
input index_markers;
input initialize_;
output wand io_bus_in00_;
output wand io_bus_in01_;
output wand io_bus_in02_;
output wand io_bus_in03_;
output wand io_bus_in04_;
output wand io_bus_in05_;
output wand io_bus_in06_;
output wand io_bus_in07_;
output wand io_bus_in08_;
output wand io_bus_in09_;
output wand io_bus_in10_;
output wand io_bus_in11_;
input iot632;
input iot634;
input zone01_index;
input zone02_index;
input zone03_index;
input zone04_index;
input zone05_index;
input zone06_index;
input zone07_index;
input zone08_index;
input zone09_index;
input zone10_index;
input zone11_index;
input zone12_index;

// Sheet 39
CardReaderBuffer hj32m716(.dclk(dclk), .ad2(index_markers), .ae1(zone11_index), .ae2(zone12_index), .af1(io_bus_in00_), .af2(io_bus_in01_), .ah1(iot634), .ah2(io_bus_in02_), .aj2(io_bus_in03_), .ak2(zone01_index), .al2(zone10_index), .am2(io_bus_in05_), .an2(io_bus_in04_), .ap2(zone03_index), .ar2(zone02_index), .as2(zone05_index), .au2(io_bus_in06_), .av2(io_bus_in07_), .be2(zone04_index), .bh2(io_bus_in11_), .bj2(io_bus_in10_), .bk2(zone08_index), .bl2(zone09_index), .bm2(iot632), .bn2(io_bus_in09_), .bp2(io_bus_in08_), .br1(zone07_index), .bs1(zone06_index), .bs2(initialize_), .bu1(i_m_d));

endmodule
