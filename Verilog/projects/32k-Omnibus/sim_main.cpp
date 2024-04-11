// vim: sw=4
#include <verilated.h>          // Defines common routines
#include "verilated_vcd_c.h"
#include <iostream>             // Need std::cout
#include "Vcpld.h"		// From Verilating "top.v"

int ts2_l, ts4_l;		// Not in CPLD model
int tp1;
int clk, ns;

//
// This bit is an array of test vectors to be applied to the top level.
//
typedef struct {
	int iot;	// The IOT to be tested
	int pcdelta;	// Delta for PC (+1 if skip_l asserted)
	int ac;		// Value in AC (if output)
} cpldvector;

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
cpldvector wv[] = {
//	{ 06416, 1, 0125 }, // Send a byte
//	{ 06436, 1, 0125 }, // Send a byte
//	{ 06456, 1, 0125 }, // Send a byte
//	{ 06476, 1, 0125 }, // Send a byte
//	{ 06356, 1, 0125 }, // Send a byte
//	{ 06126, 1, 0125 }, // Send a byte
	{ TLS, 1, 0305 }, // Send a byte
	{ TSF, 0 },	// Wait for output
	{ KSF, 0 },	// Wait for input
	{ KRB, 1 },	// Read the input
	{ TLS, 1, 0125 }, // Send a byte
	{ TSF, 0 },	// Wait for output
	{ KSF, 0 },	// Wait for input
	{ KRB, 1 },	// Read the input
#if 0
// Initialize VC8E done flag.  Should not hang here.
	{ DICD, 1 },	// Clear VC8E done
	{ DISD, 1 },	// Check for done
	{ NOP, 2 },	// SKP
	{ HLT, 0 },	// HLT: VC8E Done did not clear

// Test basic point plotting.  Should not hang here.
	{ DILX, 1 },	// Set X coordinate
	{ DISD, 0 },	// Wait for done
	{ DILY, 1 },	// Set Y coordinate
	{ DISD, 0 },	// Wait for done
	{ DIXY, 1 },	// Intensify the point
	{ DISD, 0 },	// Wait for done

// Test erase delay.
	{ DILE, 1, ER }, // Erase the screen
			// Manually check that AC was cleared by IOT
	{ DISD, 0 },	// Wait for done
// Test red delay.
	{ DILE, 1, CO }, // Set red mode
	{ DISD, 0 },	// Wait for done
// Test green delay.
	{ DILE, 1, 0 },	// Set red mode
	{ DISD, 0 },	// Wait for done

// Theoretically should test DIRE here, checking that the status bits
// are set and reported back OK.

// Check the M1703 input port is sort of functional.  (Essentially,
// read and check that AC changed.)
	{ OISK, 0 },	// This should skip, not hang
	{ OIRD, 1 },	// Check if this transfers to DATA bus

// Now check the clock.
	{ CLSK, 0 },	// This should eventually skip, not hang.
	{ CLSK, 1 },	// This should *not* skip.
	{ NOP, 2 },	// SKP
	{ HLT, 0 },	// HLT: Clock Done did not clear

// Should probably check the interrupt logic here too.
#endif

// Getting here means success
	{ HLT, 0 },	// HLT: Successful simulation
};

Vcpld *top;			// Instantiation of module

vluint64_t main_time = 0;	// Current simulation time
// This is a 64-bit integer to reduce wrap over issues and
// allow modulus.  You can also use a double, if you wish.

double sc_time_stamp () {	// Called by $time in Verilog
    return main_time;		// converts to double, to match
				// what SystemC does
}

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv); // Remember args

    top = new Vcpld;		// Create instance

    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC;
    top->trace(tfp, 99);	// Trace 99 levels of hierarchy (or see below)
    // tfp->dumpvars(1, "cpld"); // trace 1 level under "cpld"
    tfp->open("cpld.vcd");

// BUGBUG: This configuration is unique to the SERIAL device.  It should
// be elsewhere, and conditionally compiled.
    top->power_ok = 1;
    top->cf0 = 1;
    top->cf1 = 1;
    top->tp_aa1 = 1;
    top->tp_ab1 = 0;
    top->tp_ba1 = 0;
    top->tp_bb1 = 1;
    top->io_pause_l = 1;
    top->skip_l = 1;

// BUGBUG: Should perhaps assert initialize for a while.
//  top->initialize = 1;
//  top->eval();		// Evaluate model
//  top->initialize = 0;

    ns = 0;			// Start an 0ns into the cycle.
    top->ts1_l = 1;		// Start in TS4
    ts2_l = 1;			// Start in TS4
    top->ts3_l = 1;		// Start in TS4
    ts4_l = 0;			// Start in TS4
    tp1 = 1;			// Start TP1

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
	    top->clk = !top->clk;

	// Stop simulating if it is just taking too long.
	if (main_time >= 1024*1024)
	    break;

	if (ns == 0) {
	    // PDP-8 timing cycles through ts1...ts4.
	    // Each transition is initiated by the corresponding tp1...tp4.
	    // Thus, TP1 starts at the end of TS4, and lasts slightly into TS1.
	    // Start the model in TP4, at the beginning of TP1.
	    top->ts1_l = 1;		// Start in TS4
	    ts2_l = 1;			// Start in TS4
	    top->ts3_l = 1;		// Start in TS4
	    ts4_l = 0;			// Start in TS4
	    tp1 = 1;			// Start TP1
        }
        if (ns == 50) {
	    ts4_l = 1;			// End TS4
	    top->ts1_l = 0;		// Start TS1
        }
        if (ns == 100) {
	    tp1 = 0;			// End TP1
        }

	if (ns == 300) {
	    top->tp2 = 1;		// Start TP2
        }
        if (ns == 300+50) {
	    top->ts1_l = 1;		// End TS1
	    ts2_l = 0;			// Start TS2
        }
        if (ns == 300+100) {
	    top->tp2 = 0;		// End TP2
        }

	if (ns == 300+250) {
	    top->tp3 = 1;		// Start TP3
        }
        if (ns == 300+250+50) {
	    ts2_l = 1;			// End TS2
	    top->ts3_l = 0;		// Start TS3
        }
        if (ns == 300+250+100) {
	    top->tp3 = 0;		// End TP3
        }

	if (ns == 550+350) {
	    top->tp4 = 1;		// Start TP4
        }
        if (ns == 550+350+50) {
	    top->ts3_l = 1;		// End TS3
	    ts4_l = 0;			// Start TS4
        }
        if (ns == 550+350+100) {
	    top->tp4 = 0;		// End TP4
        }

	// Set up for new tp
	if (tp1) {
	    if (wv[pc].iot == HLT)
		break;	// Escape the loop
printf("\nGot here tp1: pc == %o, iot == 0%03o\n", pc, wv[pc].iot);
	    // Copy data to DATA bus 
	    ac = wv[pc].ac;
	    top->ac[ 0] = !!(ac & 04000);
	    top->ac[ 1] = !!(ac & 02000);
	    top->ac[ 2] = !!(ac & 01000);
	    top->ac[ 3] = !!(ac & 00400);
	    top->ac[ 4] = !!(ac & 00200);
	    top->ac[ 5] = !!(ac & 00100);
	    top->ac[ 6] = !!(ac & 00040);
	    top->ac[ 7] = !!(ac & 00020);
	    top->ac[ 8] = !!(ac & 00010);
	    top->ac[ 9] = !!(ac & 00004);
	    top->ac[10] = !!(ac & 00002);
	    top->ac[11] = !!(ac & 00001);
	    top->drive_ac = 1;
	    // Set instruction into MD[3..11]
	    top->md00_l  = !(wv[pc].iot & 04000);
	    top->md01_l  = !(wv[pc].iot & 02000);
	    top->md02_l  = !(wv[pc].iot & 01000);
	    top->md03_l  = !(wv[pc].iot & 0400);
	    top->md04_l  = !(wv[pc].iot & 0200);
	    top->md05_l  = !(wv[pc].iot & 0100);
	    top->md06_l  = !(wv[pc].iot & 0040);
	    top->md07_l  = !(wv[pc].iot & 0020);
	    top->md08_l  = !(wv[pc].iot & 0010);
	    top->md09_l  = !(wv[pc].iot & 0004);
	    top->md10_l = !(wv[pc].iot & 0002);
	    top->md11_l = !(wv[pc].iot & 0001);
	    // Assert io_pause during IOTs
	    if ((wv[pc].iot & 06000) == 06000)
	        top->io_pause_l = 0;
	} else if (top->tp2) {
	    // DATA bus is not driven here after TS1
	    top->drive_ac = 0;
	    // DATA bus may driven elsewhere in TS2
	} else if (top->tp3) {
	    // Calculate new PC value
	    if (top->ts3_l == 1) {
		npc = pc + wv[pc].pcdelta; // Advance PC to next instruction
		// Skip if we are supposed to.
//printf("Got here tp3: skip_l == %d\n", top->skip_l);
		if (top->skip_l == 0)
		    npc++;
//printf("Got here !ts3: npc == %d\n", npc);
	    } else {
		pc = npc;
//printf("Got here ts3: pc == %d\n", pc);
		// De-assert io_pause at TP3
		if ((wv[pc].iot & 06000) == 06000)
		    top->io_pause_l = 1;
	    }
	    // TP3/STROBE should possibly change AC (or PC) based on c0, c1, c2.
	} else if (top->tp4) {
		// Should probably do stuff here?
	}

	if (top->ts1_l == 0) {
            // Copy data to DATA bus
            ac = wv[pc].ac;
	    top->ac[ 0] = !!(ac & 04000);
	    top->ac[ 1] = !!(ac & 02000);
	    top->ac[ 2] = !!(ac & 01000);
	    top->ac[ 3] = !!(ac & 00400);
	    top->ac[ 4] = !!(ac & 00200);
	    top->ac[ 5] = !!(ac & 00100);
	    top->ac[ 6] = !!(ac & 00040);
	    top->ac[ 7] = !!(ac & 00020);
	    top->ac[ 8] = !!(ac & 00010);
	    top->ac[ 9] = !!(ac & 00004);
	    top->ac[10] = !!(ac & 00002);
	    top->ac[11] = !!(ac & 00001);
	    top->drive_ac = 1;
	} else if (ts2_l == 0) {
	    // Drive data bus (or not) based on c0, c1, c2.
	    // BUGBUG: Ignores c2 for now.
            if (top->c0_l == 1) {
		// Drive AC, allow wire-or.
		top->ac[ 0] = !!(ac & 04000);
		top->ac[ 1] = !!(ac & 02000);
		top->ac[ 2] = !!(ac & 01000);
		top->ac[ 3] = !!(ac & 00400);
		top->ac[ 4] = !!(ac & 00200);
		top->ac[ 5] = !!(ac & 00100);
		top->ac[ 6] = !!(ac & 00040);
		top->ac[ 7] = !!(ac & 00020);
		top->ac[ 8] = !!(ac & 00010);
		top->ac[ 9] = !!(ac & 00004);
		top->ac[10] = !!(ac & 00002);
		top->ac[11] = !!(ac & 00001);
		top->drive_ac = 1;
	    } else if (top->c1_l == 1) {
		// Drive AC.
		top->ac[ 0] = !!(ac & 04000);
		top->ac[ 1] = !!(ac & 02000);
		top->ac[ 2] = !!(ac & 01000);
		top->ac[ 3] = !!(ac & 00400);
		top->ac[ 4] = !!(ac & 00200);
		top->ac[ 5] = !!(ac & 00100);
		top->ac[ 6] = !!(ac & 00040);
		top->ac[ 7] = !!(ac & 00020);
		top->ac[ 8] = !!(ac & 00010);
		top->ac[ 9] = !!(ac & 00004);
		top->ac[10] = !!(ac & 00002);
		top->ac[11] = !!(ac & 00001);
		top->drive_ac = 1;
	    }
	}

	tfp->dump(main_time);
printf("Got here eval: pc == %o, ns == %d, iot == 0%03o\n", pc, ns, wv[pc].iot);
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
