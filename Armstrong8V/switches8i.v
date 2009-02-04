module switchesDeMux(clk, reset, S3_SSER_N, S3_SCK, S3_SCL_N,
      sdf, sif, sr, start, laddr, dep, exam, cont, stop, ss, si, conf);
input clk, reset;
input S3_SSER_N;
output reg S3_SCK, S3_SCL_N;
output reg [0:2] sdf, sif;
output reg [0:11] sr;
output reg start, laddr, dep, exam, cont, stop, ss, si;
output reg [0:5] conf;


   `define SwitchBits (8*4) // 32 switch bits
`ifdef SIMULATION
   `define FREQDIV    100
`else
   `define FREQDIV    10000
`endif

   // The external hardware presents SCF5 first, and SDF0 last.
   `define SDF0   0
   `define SDF1   1
   `define SDF2   2
   `define SIF0   3
   `define SIF1   4
   `define SIF2   5
   `define SSR0   6
   `define SSR1   7

   `define SSR2   8
   `define SSR3   9
   `define SSR4   10
   `define SSR5   11
   `define SSR6   12
   `define SSR7   13
   `define SSR8   14
   `define SSR9   15
   
   `define SSR10  16
   `define SSR11  17
   `define SSTART 18
   `define SLADDR 19
   `define SDEP   20
   `define SEXAM  21
   `define SCONT  22
   `define SSTOP  23

   `define SSS    24
   `define SSI    25
   `define SCF0   26
   `define SCF1   27
   `define SCF2   28
   `define SCF3   29
   `define SCF4   30
   `define SCF5   31

reg [0:`SwitchBits-1] switches;
integer SSCKCounter = 0;
integer counter     = 0;
reg isi, iss, istop, oexam, odep, ostart, ocont, iexam, idep, istart, icont;

   always @(posedge clk) begin
     // Every rising clk
     if (reset) begin
        S3_SCK = 1'b1;
        SSCKCounter = `FREQDIV;
        iexam = 1'b0;
        idep = 1'b0;
        istart = 1'b0;
        icont = 1'b0;
     end else if (SSCKCounter < `FREQDIV) begin
        S3_SCK = 1'b1;
        SSCKCounter = SSCKCounter + 1;
        iexam = 1'b0;
        idep = 1'b0;
        istart = 1'b0;
        icont = 1'b0;
     end else begin
        // Every FREQDIV clks we shift the input register or look at the result.
        S3_SCK = 1'b0;
        SSCKCounter = 0;
        if (counter < `SwitchBits) begin
           counter = counter + 1;
           // Last one in is bit 0.  Input is active low.
           switches = { (~S3_SSER_N), switches[0:`SwitchBits-2] };
           S3_SCL_N = 1'b1;
        end else begin
           // The switches are shifted into their correct locations and we can inspect their values.
           counter = 0;
           S3_SCL_N = 1'b0;
           sr = ~switches[`SSR0:`SSR11];
           conf = switches[`SCF0:`SCF5];
           laddr = switches[`SLADDR];
           sdf = ~switches[`SDF0:`SDF2];
           sif = ~switches[`SIF0:`SIF2];
           // Some operations are idempotent, but EXAM, DEP, START, and CONT
           // must be debounced.  We do that by sampling fairly slowly, then 
           // detecting a rising edge.
           if (~oexam & switches[`SEXAM])
              iexam = 1'b1;
           else 
              iexam = 1'b0;
           oexam = switches[`SEXAM];
           if (~odep & switches[`SDEP])
              idep = 1'b1;
           else
              idep = 1'b0;
           odep = switches[`SDEP];
           if (~ostart & switches[`SSTART])
              istart = 1'b1;
           else
              istart = 1'b0;
           ostart = switches[`SSTART];
           if (~ocont & switches[`SCONT])
              icont = 1'b1;
           else
              icont = 1'b0;
           ocont = switches[`SCONT];
           istop = switches[`SSTOP];
           isi = switches[`SSI];
           iss = switches[`SSS];
           //switches = (others => 1'b0); // What was I thinking here??
        end
     end
     // Switches that stop the machine should not be debounced, as it is 
     // too slow to notice SI and SS.  However, the process above only 
     // gives us visibility of the switch values every debounce interval.
     // What we do is remember the switches values in internal copies, then 
     // use the remembered values to recalculate STOP and SS here every clock.
     if (istart | icont | iexam | idep) begin
        stop = 1'b0;
        ss   = 1'b0;
     end else begin
        stop = istop;
        si   = isi;
        ss   = iss;
     end
     start = istart;
     cont = icont;
     exam = iexam;
     dep = idep;
   end
endmodule
