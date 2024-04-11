// vim: sw=4
#include <verilated.h>          // Defines common routines
#include "verilated_vcd_c.h"
#include <iostream>             // Need std::cout
#include "Vpt08.h"		// From Verilating "top.v"

// Not in CPLD model
int tp1, tp2, tp3, tp4;
int ts1_l, ts2_l, ts3_l, ts4_l;
int clk, ns;

//
// This bit is an array of test vectors to be applied to the top level.
//
typedef struct {
	int iot;	// The IOT to be tested
	int pcdelta;	// Delta for PC (+1 if skip_l asserted)
	int ac;		// Value in AC (if output)
} testvector;

// IOT Definitions:
#define HLT  00000	// Stop the simulation
#define NOP  06000	// Nothing implemented
#define CLEI 06131	// DK8E CLEI Intr ena
#define CLDI 06132	// DK8E CLDI Intr dis
#define CLSK 06133	// DK8E CLSK Skip on flag, Clear flag
#define OIDI 06140	// 1703 Disable Interrupt
#define OIEI 06141	// 1703 6141 Enable Interrupt
#define OICF 06142	// 1703 6142 Clear flag
#define OISK 06143	// 1703 6143 Skip if Ready
#define OIRD 06144	// 1703 6144 Read Data
#define DILC 06050	// VC8E DILC Display Logic Clear
#define DICD 06051	// VC8E DICD Display Clear Done flag
#define DISD 06052	// VC8E DISD Display Skip on Done
#define DILX 06053	// VC8E DILX Display Load X
#define DILY 06054	// VC8E DILY Display Load Y
#define DIXY 06055	// VC8E DIXY Display Intensify at (X,Y)
#define DILE 06056	// VC8E DILE Display Load Enable status register
#define DIRE 06057	// VC8E DIRE Display Read Enable status register

// VC8E Status/Command bits:
#define IE 0001         // Interrupt Enable
#define CH 0002         // Channel
#define CO 0004         // Color
#define ER 0010         // Erase (write only)
#define ST 0020         // Store
#define WT 0040         // Write Through
#define DN 4000         // Done (read only)

#define KCF 06030	// Clear Keyboard Flag (??)
#define KSF KCF+1	// Skip on Keyboard Flag
#define KCC KCF+2	// Clear Keyboard Flag, AC
#define KRS KCF+4	// OR in Character
#define KIE KCF+5	// Set/Clear Interrupt Enable
#define KRB KCF+6	// Clear Flag, Get Character

#define TFL 06040	// Set Teleprinter Flag
#define TSF TFL+1	// Skip on Teleprinter Flag
#define TCF TFL+2	// Clear Teleprinter Flag
#define TPC TFL+4	// Print Character
#define TSK TFL+5	// Skip if Keyboard or Printer Done
#define TLS TFL+6	// Clear Flag, Print Character

int pc, npc, ac;
testvector wv[] = {
	{ TLS, 1, 0305 }, // Send a byte
	{ TSF, 0 },	// Wait for output
	{ KSF, 0 },	// Wait for input
	{ KRB, 1 },	// Read the input
	{ TLS, 1, 0125 }, // Send a byte
	{ TSF, 0 },	// Wait for output
	{ KSF, 0 },	// Wait for input
	{ KRB, 1 },	// Read the input

// Getting here means success
	{ HLT, 0 },	// HLT: Successful simulation
};

Vpt08 *top;			// Instantiation of module

vluint64_t main_time = 0;	// Current simulation time
// This is a 64-bit integer to reduce wrap over issues and
// allow modulus.  You can also use a double, if you wish.

double sc_time_stamp () {	// Called by $time in Verilog
    return main_time;		// converts to double, to match
				// what SystemC does
}

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv); // Remember args

    top = new Vpt08;		// Create instance

    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp, 99);	// Trace 99 levels of hierarchy (or see below)
    // tfp->dumpvars(1, "pt08"); // trace 1 level under "pt08"
    tfp->open("pt08.vcd");

    top->initialize = 1;
    top->biop1 = 0;
    top->biop2 = 0;
    top->biop4 = 0;

// Should we assert initialize for longer?
    top->eval();		// Evaluate model

    top->initialize = 0;

    ns = 0;			// Start 0ns into the cycle.
    ts1_l = 1;			// Start in TS4
    ts2_l = 1;			// Start in TS4
    ts3_l = 1;			// Start in TS4
    ts4_l = 0;			// Start in TS4
    tp1 = 1;			// Start TP1
    npc = pc = 0;		// Start at the beginning

    // Our main loop here will "tick" every 50 ns, which is to say change
    // phase every 25 ns.
    // As far as we are able, we use the Omnibus specification to specify
    // our timing.  For simplicity, we follow "fast timing".
    Verilated::debug(0);
    do {
	clk = !clk;
	if (ns > 1200)
	    exit(1);	// Abort simulation

	// The 1.8432 MHz clock should tick every 542 ns.
	// Which is to say, should toggle every 271 ns.
	// We pretend that works out to be close to 5 "ticks".
	if (main_time % 250 == 0)
printf("BR clk\n");
	if (main_time % 250 == 0)
	    top->clk = !top->clk;

	// Stop simulating if it is just taking too long.
	if (main_time >= 1024*1024)
	    break;

	if (ns == 0) {
	    // PDP-8 timing cycles through ts1...ts4.
	    // Each transition is initiated by the corresponding tp1...tp4.
	    // Thus, TP1 starts at the end of TS4, and lasts slightly into TS1.
	    // Start the model in TP4, at the beginning of TP1.
	    ts1_l = 1;			// Start in TS4
	    ts2_l = 1;			// Start in TS4
	    ts3_l = 1;			// Start in TS4
	    ts4_l = 0;			// Start in TS4
	    tp1 = 1;			// Start TP1
        }
        if (ns == 50) {
	    ts4_l = 1;			// End TS4
	    ts1_l = 0;			// Start TS1
        }
        if (ns == 100) {
	    tp1 = 0;			// End TP1
        }

	if (ns == 300) {
	    tp2 = 1;			// Start TP2
        }
        if (ns == 300+50) {
	    ts1_l = 1;			// End TS1
	    ts2_l = 0;			// Start TS2
        }
        if (ns == 300+100) {
	    tp2 = 0;			// End TP2
        }

	if (ns == 300+250) {
	    tp3 = 1;			// Start TP3
        }
        if (ns == 300+250+50) {
	    ts2_l = 1;			// End TS2
	    ts3_l = 0;			// Start TS3
        }
        if (ns == 300+250+100) {
	    tp3 = 0;			// End TP3
        }

	if (ns == 550+350) {
	    tp4 = 1;			// Start TP4
        }
        if (ns == 550+350+50) {
	    ts3_l = 1;			// End TS3
	    ts4_l = 0;			// Start TS4
        }
        if (ns == 550+350+100) {
	    tp4 = 0;			// End TP4
        }


	// Set up for new tp.  In general, we starts something at,
	// which then completes when the corresponding TS is
	// asserted
	if (tp1) {
printf("\nGot here tp1: pc == %o, iot == 0%04o\n", pc, wv[pc].iot);
	    if (ts1_l) {
		// Drive instruction onto MB paddle.
		// Should persist until we get back here.
		top->bmb0  = !!(wv[pc].iot & 04000);
		top->bmb1  = !!(wv[pc].iot & 02000);
		top->bmb2  = !!(wv[pc].iot & 01000);
		top->bmb3  = !!(wv[pc].iot & 0400);
		top->bmb4  = !!(wv[pc].iot & 0200);
		top->bmb5  = !!(wv[pc].iot & 0100);
		top->bmb6  = !!(wv[pc].iot & 0040);
		top->bmb7  = !!(wv[pc].iot & 0020);
		top->bmb8  = !!(wv[pc].iot & 0010);
		top->bmb9  = !!(wv[pc].iot & 0004);
		top->bmb10 = !!(wv[pc].iot & 0002);
		top->bmb11 = !!(wv[pc].iot & 0001);
		top->bmb3_l  = !(wv[pc].iot & 0400);
		top->bmb4_l  = !(wv[pc].iot & 0200);
		top->bmb5_l  = !(wv[pc].iot & 0100);
		top->bmb6_l  = !(wv[pc].iot & 0040);
		top->bmb7_l  = !(wv[pc].iot & 0020);
		top->bmb8_l  = !(wv[pc].iot & 0010);

		// Drive AC onto BAC paddle.
		// Should persist until we get back here.
		ac = wv[pc].ac;
		top->bac0  = !!(ac & 04000);
		top->bac1  = !!(ac & 02000);
		top->bac2  = !!(ac & 01000);
		top->bac3  = !!(ac & 00400);
		top->bac4  = !!(ac & 00200);
		top->bac5  = !!(ac & 00100);
		top->bac6  = !!(ac & 00040);
		top->bac7  = !!(ac & 00020);
		top->bac8  = !!(ac & 00010);
		top->bac9  = !!(ac & 00004);
		top->bac10 = !!(ac & 00002);
		top->bac11 = !!(ac & 00001);

		// Set iop1 until ts1 starts.
		top->biop1 = top->bmb11;

		npc = pc + wv[pc].pcdelta; // Advance PC to next instruction
             } else {
		// Skip if we are supposed to.
		if (top->skip_l == 0)
		    npc++;
		top->biop1 = 0;
		// Note that PC changes here, but the old AC and MB persist.
                pc = npc;
             }
	} else if (tp2) {
	    if (ts2_l) {
printf("\nGot here tp2: pc == %o, iot == 0%04o\n", pc, wv[pc].iot);
		// Set iop2 until ts1 starts.
		top->biop2 = top->bmb10;
             } else {
		// Skip if we are supposed to.
		if (top->skip_l == 0)
		    npc++;
		top->biop2 = 0;
		// Note that PC changes here, but the old AC and MB persist.
                pc = npc;
             }
	} else if (tp3) {
	    if (ts3_l) {
printf("\nGot here tp3: pc == %o, iot == 0%04o\n", pc, wv[pc].iot);
		// Set iop2 until ts1 starts.
		top->biop4 = top->bmb9;
             } else {
		// Skip if we are supposed to.
		if (top->skip_l == 0)
		    npc++;
		top->biop4 = 0;
		// Note that PC changes here, but the old AC and MB persist.
                pc = npc;
             }
	} else if (tp4) {
	    // BUGBUG: Do stuff here or remove this state!
	    if (wv[pc].iot == HLT)
		break;	// Escape the loop
	}

	tfp->dump(main_time);
printf("Got here eval: pc == %o, ns == %3d, iot == 0%04o\n", pc, ns, wv[pc].iot);
	top->eval();		// Evaluate model
//	cout << top->done << endl; // Read a output
	main_time += 25;	// Time passes...
	ns += 25;
        if (ns == 900+300) {
            ns = 0;
        }

    } while (!Verilated::gotFinish());

    top->final();		// Done simulating
    tfp->close();		// Done tracing
    // (Though this example doesn't get here)
    delete top;
}
