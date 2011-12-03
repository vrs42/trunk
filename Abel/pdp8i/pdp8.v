module pdp8(clock,
            brkrq, intrq, mem, ca_increment, three_cycle, data_in, mem_increment, data_addr, data, la, ex, dp, st, cont, sr,
            input_bus, acclr, ioskip,
            pc, ac, ma, mb, l, ts, ms, ir, run, wcovflo, pause, iop1, iop2, iop4, ion);

`define CLOCKMHZ 50                 // Mhz
`define CLOCKNS (1000/`CLOCKMHZ)     // ns/tick
`define IOP1SETUP (150/`CLOCKNS)    // ticks (7)
`define IOP1HOLD  (550/`CLOCKNS)    // ticks (27)
`define IOP2SETUP (250/`CLOCKNS)    // ticks (12)
`define IOP2HOLD  (550/`CLOCKNS)    // ticks
`define IOP4SETUP (250/`CLOCKNS)    // ticks
`define IOP4HOLD  (550/`CLOCKNS)    // ticks

// TODO: Realistic IOT timing.
// TODO: Make IOTs actually do stuff.

`define TS1 0
`define TS2 1
`define TS3 2
`define TS4 3
`define MFT0 4
`define MFT1 5
`define MFT2 6
`define IOP1 7
`define IOP2 8
`define IOP4 9

`define FETCH 0
`define DEFER 1
`define EXEC 2
`define BREAK 3
`define INTR 4
`define WC 5
`define CURRENT_ADDR 5

input clock;
input brkrq, intrq;
input [0:11] mem;
input three_cycle, ca_increment;
input data_in, mem_increment;
input [0:11] data_addr;
input [0:11] data;
input la, ex, dp, st, cont;
input [0:11] sr;
input [0:11] input_bus;
input acclr, ioskip;

output reg [0:11] pc;
output reg [0:11] ac;
output reg [0:11] ma;
output reg [0:11] mb;
output reg l;
output reg [0:3] ts = `TS4;
output reg [0:2] ms;
output reg [0:2] ir;
output reg run;
output reg wcovflo;
output reg pause, iop1, iop2, iop4;
output reg ion;

reg int;
reg skip;
wire st_ex_dp;
reg [0:11] lshift;
reg [0:11] rshift;

integer iop_count;

assign st_ex_dp = st + ex+ dp;

always @(posedge clock)
begin
    case (ts)
// 0:    ts = TS4;
    `TS4:  // Remain in TS4 until running, interrupt, DMA, etc.
        if ((ms == `FETCH) & (!ir[0] | !ir[1]) & ((ir != 3'b101) | mb[3])) begin
            // Compute EA and continue with DEFER or EXECUTE. 
            ma[5:11] = mb[5:11];
            if (mb[4])
                ma[0:4] = ma[0:4];
            else
                ma[0:4] = 0;
            if (mb[3])
                ms = `DEFER;
            else
                ms = `EXEC;
            ts = `TS1;
        end else if ((ms == `DEFER) & (ir != 3'b101)) begin
            ma = mb;
            ms = `EXEC;
            ts = `TS1;
        end else if (ms == `WC) begin
            ma = ma + 1;
            ms = `CURRENT_ADDR;
            ts = `TS1;
        end else if (ms == `CURRENT_ADDR) begin
            ma = mb;
            ms = `BREAK;
            ts = `TS1;
        end else begin
            // We seem to have finished an instruction
            ma = pc + skip;
            skip = 0;
            if (run) begin
                if (brkrq) begin
                    ma = data_addr;
                    if (three_cycle)
                        ms = `WC;
                    else
                        ms = `BREAK;
                    ts = `TS1;
                end else if (int & intrq) begin
                    ma = 0;
                    ir = 3'b100;
                    ms = `EXEC;
                    ts = `TS1;
                end else if (run) begin
                    ms = `FETCH;
                    ts = `TS1;
                end
            end else if (la | cont | st_ex_dp) begin
                ts = `MFT0;
            end
            // else TS4;
        end
    `TS1:
        // The job of TS1 is to do the memory read, if any.
        // The MA register should have been set in ts4.
        begin
            if (ms == `FETCH) begin
                pc = ma + 1;
                int = ion;
            end
            ts = `TS2;
        end
    `TS2:
        begin
            if (ms == `FETCH) begin
                mb = mem;
                ir = mem[0:2];
            end else if (ms == `DEFER) begin
                if (ma[0:8] == 9'b000000001)
                    mb = mem + 1;
                else
                    mb = mem;
            end else if (ms == `EXEC) begin
                if (ir[0:1] == 2'b00) begin
                    mb = mem;
                end else if (ir == 3'b010) begin
                    mb = mem + 1;
                    skip = (mem == 12'b111111111111);
                end else if (ir == 3'b011) begin
                    mb = ac;
                end else if (ir == 3'b100) begin
                    mb = pc + skip;
                end
            end else if (ms == `WC) begin
                mb = mem + 1;
                wcovflo = (mem == 12'b111111111111);
            end else if (ms == `CURRENT_ADDR) begin
                mb = mem + ca_increment;
            end else if (ms == `BREAK) begin
                if (data_in)
                    mb = data;
                else
                    mb = mem + mem_increment;
            end else if (st_ex_dp) begin
                if (ex)
                    mb = mem;
                else if (dp)
                    mb = sr;
            end
            ts = `TS3;
        end
    `TS3:
        begin
            ts = `TS4;
            // Time state 3 does a lot of the actual calculation.
            if ((ms == `FETCH) & (ir == 3'b111)) begin
                if (~mb[3]) begin
                    // NB: L and AC must use blocking assignment here!
                    if (~mb[4] & ~mb[6])
                        ac = ac;
                    else if (~mb[4] & mb[6])
                        ac = ~ac;
                    else if (mb[4] & ~mb[6])
                        ac = 0;
                    else if (mb[4] & mb[6])
                        ac = ac + ~ac;
                    if (~mb[5] & ~mb[7])
                        l = l;
                    else if (~mb[5] & mb[7])
                        l = ~l;
                    else if (mb[5] & ~mb[7])
                        l = 0;
                    else if (mb[5] & mb[7])
                        l = l + ~l;
                    if (mb[8] | mb[9]) begin
                        // Shifts on the 8/i are done by calculating the right and left shifts, then enabling their 
                        // complements through and-or-invert gates.  The net result is therefore the logical AND of 
                        // the shifted results when more than one shift is enabled.
                        if (mb[9])
                            if (mb[10])
                                lshift = { ac[1:11], l, ac[0] };
                            else
                                lshift = { ac, l };
                        else
                            lshift = ~0;
                        if (mb[8])
                            if (mb[10])
                                rshift = { ac[0:1], l, ac[2:11] };
                            else
                                rshift = { ac[0], l, ac[1:11] };
                        else
                            rshift = ~0;
                        { l, ac } = lshift & rshift;
                    end
                    if (mb[11])
                        { l, ac } = { l, ac } + 1;
                end else if (~mb[11]) begin
                    if (mb[6] && (ac == 0))
                        skip = 1;
                    else if (mb[5] & ac[0])
                        skip = 1;
                    else if (mb[7] & l)
                        skip = 1;
                    if (mb[8])
                        skip = ~skip;
                    if (mb[10])
                        run = 0;
                end
                if (mb[4])
                    ac = 0;
                if (mb[9] & ~mb[11])
                    ac = ac | sr;
            end else if ((ms == `FETCH) & (ir == 3'b110)) begin
                if (mb[3:8] == 6'b000000) begin
                    if (mb[10] | mb[11])
                        ion = mb[11];
                end else begin
                    // Start slow IOT stuff
                    pause = 1;
                    iop_count = 0;
                    // AC is available to I/O devices.
                    if (mb[11])
                        iop1 = 1;
                    ts = `IOP1;
                end
            end else if ((ms == `FETCH) & (ir == 3'b101)) begin
                if (!mb[3]) begin
                    // Shortcut direct JMP
                    pc[5:11] = mem[5:11];
                    if (mb[4])
                        pc[0:4] = ma[0:4];
                    else
                        pc[0:4] = 0;
                end                
            end else if ((ms == `DEFER) & (ir == 3'b101)) begin
                // Shortcut indirect JMP
                pc = mb;
            end else if (ms == `EXEC) begin
                if (ir == 3'b000)
                    ac = ac & mb;
                else if (ir == 3'b001)
                    { l, ac } = { l, ac } + mb;
                else if (ir == 3'b011)
                    ac = 0;
                else if (ir == 3'b100)
                    pc = ma + 1;
            end else if (st | cont) begin
                run = 1;
            end
        end
    `IOP1:
        begin
            iop_count = iop_count + 1;
            if (iop_count >= `IOP1SETUP+`IOP1HOLD) begin
                iop_count = 0;
                iop1 = 0;
                if (ioskip)
                    skip = 1;
                if (acclr)
                    ac = 0;
                ac = ac + input_bus;
                ts = `IOP2;
            end else if (iop_count >= `IOP1SETUP) begin
                if (mb[11])
                    iop1 = 1;
            end
        end
    `IOP2:
        begin
            iop_count = iop_count + 1;
            if (iop_count >= `IOP1SETUP+`IOP1HOLD) begin
                iop_count = 0;
                iop2 = 0;
                if (ioskip)
                    skip = 1;
                if (acclr)
                    ac = 0;
                ac = ac + input_bus;
                ts = `IOP4;
            end else if (iop_count >= `IOP2SETUP) begin
                if (mb[10])
                    iop2 = 1;
            end
        end
    `IOP4:
        begin
            iop_count = iop_count + 1;
            if (iop_count >= `IOP4SETUP+`IOP4HOLD) begin
                iop_count = 0;
                iop4 = 0;
                if (ioskip)
                    skip = 1;
                if (acclr)
                    ac = 0;
                ac = ac + input_bus;
                pause = 0;
                ts = `TS4;
            end else if (iop_count >= `IOP4SETUP) begin
                if (mb[9])
                    iop4 = 1;
            end
        end
    `MFT0:
        // Not sure what "Reset major state" means, as we must have been halted to get here.
        ts = `MFT1;
    `MFT1:
        begin
            if (st_ex_dp)
                ma = pc;
            ts = `MFT2;
        end
    `MFT2:
        begin
            if (la)
                pc = sr;
            else if (st) begin
                ac = 0;
                l = 0;
                int = 0;
                ms = `FETCH;
            end else if (st_ex_dp) begin
                pc = ma + 1;
            end
            // BUGBUG: mem_start?
            ts = `TS2;
        end
    endcase
end

endmodule