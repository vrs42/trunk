module switchesDeMux(clk, reset_, S3_SSER_N, S3_SCK, S3_SCL_N,
      sdf_, sif_, sr_, start_, laddr_, dep_, exam_, cont_, stop_, ss_, si_, conf);
input clk, reset_;
input S3_SSER_N;
output S3_SCK;
output reg S3_SCL_N;
output reg [0:2] sdf_, sif_;
output reg [0:11] sr_;
output reg start_, laddr_, dep_, exam_, cont_, stop_, ss_, si_;
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
integer counter     = 0;
reg oexam_, odep_, ostart_, ocont_;  // Last read values

Oscillator #(120*`SwitchBits)sr_osc(clk, 1'b1, S3_SCK);

//  The switch values change on the rising edge, and are sampled here on the falling.
always @(negedge S3_SCK, negedge reset_) begin
   if (~reset_) begin
      counter = 0;
      exam_ = 1'b1;
      dep_ = 1'b1;
      start_ = 1'b1;
      cont_ = 1'b1;
   end else begin
      // Every risin S3_SCK we shift the input register or look at the result.
      if (counter < `SwitchBits) begin
         counter = counter + 1;
         // Last one in is bit 0.  Input is active low.
         switches = { (S3_SSER_N), switches[0:`SwitchBits-2] };
         S3_SCL_N = 1'b1;
      end else begin
         // The switches are shifted into their correct locations and we can inspect their values.
         counter = 0;
         S3_SCL_N = 1'b0;
         sr_ = switches[`SSR0:`SSR11];
         conf = switches[`SCF0:`SCF5];
         laddr_ = switches[`SLADDR];
         sdf_ = switches[`SDF0:`SDF2];
         sif_ = switches[`SIF0:`SIF2];
         // Update cached "stop" keys
         stop_ = switches[`SSTOP];
         si_ = switches[`SSI];
         ss_ = switches[`SSS];
         // Some operations are idempotent, but EXAM, DEP, START, and CONT
         // must be debounced.  We do that by sampling fairly slowly, then 
         // detecting a fallinh edge.
         if (oexam_ & ~switches[`SEXAM])
            exam_ = 1'b0;
         else 
            exam_ = 1'b1;
         oexam_ = switches[`SEXAM];
         if (odep_ & ~switches[`SDEP])
            dep_ = 1'b0;
         else
            dep_ = 1'b1;
         odep_ = switches[`SDEP];
         if (ostart_ & ~switches[`SSTART])
            start_ = 1'b0;
         else
            start_ = 1'b1;
         ostart_ = ~switches[`SSTART];
         if (ocont_ & switches[`SCONT])
            cont_ = 1'b0;
         else
            cont_ = 1'b1;
         ocont_ = switches[`SCONT];
      end
   end
end

endmodule
