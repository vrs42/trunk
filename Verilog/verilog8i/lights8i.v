module lightsMux(clk, reset_, LSER, LCLK, LCL_N,
                 pc_, ma_, mb_, ac_, mq_, dfld_, ifld_, sc_, link_,
                 and_, tad_, isz_, dca_, jms_, jmp_, iot_, opr_,
                 fetch_, defer_, exec_, ion_, pause_, run_, wc_, ca_, break_);
input clk, reset_; 
input [0:11]pc_;
input [0:11]ma_;
input [0:11]mb_;
input [0:11]ac_;
input [0:11]mq_;
input [0:2]dfld_;
input [0:2]ifld_;
input [0:4]sc_;
input link_;
input and_, tad_, isz_, dca_, jms_, jmp_, iot_, opr_;
input fetch_, defer_, exec_, ion_, pause_, run_, wc_, ca_, break_;
output LSER, LCLK;
output reg LCL_N;

`define LightsBits (8*12) // 96 bits (89 used)
   
`define LDF0   0 
`define LSC0   1 
`define LDF1   2 
`define LSC1   3 
`define LDF2   4 
`define LSC2   5 
`define LIF0   6 
`define LSC3   7 
`define LIF1   8 
`define LSC4   9 
`define LIF2   10 
`define LLINK  11 
`define LUA0   12  // Unassigned
`define LUA1   13  // Unassigned
`define LUA2   14  // Unassigned
`define LUA3   15  // Unassigned
   
`define LPC0   16 
`define LMA0   17 
`define LMB0   18 
`define LAC0   19 
`define LMQ0   20 
`define LPC1   21 
`define LMA1   22 
`define LMB1   23 
`define LAC1   24 
`define LMQ1   25 
`define LPC2   26 
`define LMA2   27 
`define LMB2   28 
`define LAC2   29 
`define LMQ2   30 
`define LPC3   31 
`define LMA3   32 
`define LMB3   33 
`define LAC3   34 
`define LMQ3   35 
`define LPC4   36 
`define LMA4   37 
`define LMB4   38 
`define LAC4   39 
`define LMQ4   40 
`define LPC5   41 
`define LMA5   42 
`define LMB5   43 
`define LAC5   44 
`define LMQ5   45 
`define LUA4   46  // Unassigned
`define LUA5   47  // Unassigned
   
`define LPC6   48 
`define LMA6   49 
`define LMB6   50 
`define LAC6   51 
`define LMQ6   52 
`define LPC7   53 
`define LMA7   54 
`define LMB7   55 
`define LAC7   56 
`define LMQ7   57 
`define LPC8   58 
`define LMA8   59 
`define LMB8   60 
`define LAC8   61 
`define LMQ8   62 
`define LPC9   63 
`define LMA9   64 
`define LMB9   65 
`define LAC9   66 
`define LMQ9   67 
`define LPC10  68 
`define LMA10  69 
`define LMB10  70 
`define LAC10  71 
`define LMQ10  72 
`define LPC11  73 
`define LMA11  74 
`define LMB11  75 
`define LAC11  76 
`define LMQ11  77 
`define LUA6   78  // Unassigned
`define LJMS   79 
   
`define LDCA   80 
`define LISZ   81 
`define LTAD   82 
`define LAND   83 
`define LIOT   84 
`define LFETCH 85 
`define LBREAK 86 
`define LOPR   87 
`define LJMP   88 
`define LPAUSE 89 
`define LRUN   90 
`define LION   91 
`define LCA    92 
`define LWC    93 
`define LEXEC  94 
`define LDEFER 95 
`define LRCK   96  // Receive complete clock.

wire [0:`LightsBits] lights_;    // Need an extra for LRCK.
reg  [0:`LightsBits] sr;        // Need an extra for LRCK.
integer counter = `LightsBits+1;

   // Continuously display IR
   assign lights_[`LAND] = ~and_;
   assign lights_[`LTAD] = ~tad_;
   assign lights_[`LISZ] = ~isz_;
   assign lights_[`LDCA] = ~dca_;
   assign lights_[`LJMS] = ~jms_;
   assign lights_[`LJMP] = ~jmp_;
   assign lights_[`LIOT] = ~iot_;
   assign lights_[`LOPR] = ~opr_;

   assign lights_[`LDF0] = dfld_[0];
   assign lights_[`LSC0] = sc_[0];
   assign lights_[`LDF1] = dfld_[1];
   assign lights_[`LSC1] = sc_[1];
   assign lights_[`LDF2] = dfld_[2];
   assign lights_[`LSC2] = sc_[2];
   assign lights_[`LIF0] = ifld_[0];
   assign lights_[`LSC3] = sc_[3];
   assign lights_[`LIF1] = ifld_[1];
   assign lights_[`LSC4] = sc_[4];
   assign lights_[`LIF2] = ifld_[2];
   assign lights_[`LLINK] = link_;
   assign lights_[`LUA0] = 1'b1;
   assign lights_[`LUA1] = 1'b1;
   assign lights_[`LUA2] = 1'b1;
   assign lights_[`LUA3] = 1'b1;

   assign lights_[`LPC0] = pc_[0];
   assign lights_[`LMA0] = ma_[0];
   assign lights_[`LMB0] = mb_[0];
   assign lights_[`LAC0] = ac_[0];
   assign lights_[`LMQ0] = mq_[0];
   assign lights_[`LPC1] = pc_[1];
   assign lights_[`LMA1] = ma_[1];
   assign lights_[`LMB1] = mb_[1];
   assign lights_[`LAC1] = ac_[1];
   assign lights_[`LMQ1] = mq_[1];
   assign lights_[`LPC2] = pc_[2];
   assign lights_[`LMA2] = ma_[2];
   assign lights_[`LMB2] = mb_[2];
   assign lights_[`LAC2] = ac_[2];
   assign lights_[`LMQ2] = mq_[2];
   assign lights_[`LPC3] = pc_[3];
   assign lights_[`LMA3] = ma_[3];
   assign lights_[`LMB3] = mb_[3];
   assign lights_[`LAC3] = ac_[3];
   assign lights_[`LMQ3] = mq_[3];
   assign lights_[`LPC4] = pc_[4];
   assign lights_[`LMA4] = ma_[4];
   assign lights_[`LMB4] = mb_[4];
   assign lights_[`LAC4] = ac_[4];
   assign lights_[`LMQ4] = mq_[4];
   assign lights_[`LPC5] = pc_[5];
   assign lights_[`LMA5] = ma_[5];
   assign lights_[`LMB5] = mb_[5];
   assign lights_[`LAC5] = ac_[5];
   assign lights_[`LMQ5] = mq_[5];
   assign lights_[`LUA4] = 1'b1;
   assign lights_[`LUA5] = 1'b1;

   assign lights_[`LPC6] = pc_[6];
   assign lights_[`LMA6] = ma_[6];
   assign lights_[`LMB6] = mb_[6];
   assign lights_[`LAC6] = ac_[6];
   assign lights_[`LMQ6] = mq_[6];
   assign lights_[`LPC7] = pc_[7];
   assign lights_[`LMA7] = ma_[7];
   assign lights_[`LMB7] = mb_[7];
   assign lights_[`LAC7] = ac_[7];
   assign lights_[`LMQ7] = mq_[7];
   assign lights_[`LPC8] = pc_[8];
   assign lights_[`LMA8] = ma_[8];
   assign lights_[`LMB8] = mb_[8];
   assign lights_[`LAC8] = ac_[8];
   assign lights_[`LMQ8] = mq_[8];
   assign lights_[`LPC9] = pc_[9];
   assign lights_[`LMA9] = ma_[9];
   assign lights_[`LMB9] = mb_[9];
   assign lights_[`LAC9] = ac_[9];
   assign lights_[`LMQ9] = mq_[9];
   assign lights_[`LPC10] = pc_[10];
   assign lights_[`LMA10] = ma_[10];
   assign lights_[`LMB10] = mb_[10];
   assign lights_[`LAC10] = ac_[10];
   assign lights_[`LMQ10] = mq_[10];
   assign lights_[`LPC11] = pc_[11];
   assign lights_[`LMA11] = ma_[11];
   assign lights_[`LMB11] = mb_[11];
   assign lights_[`LAC11] = ac_[11];
   assign lights_[`LMQ11] = mq_[11];
   assign lights_[`LUA6] = 1'b1;
   assign lights_[`LFETCH] = fetch_;
   assign lights_[`LBREAK] = break_;
   assign lights_[`LPAUSE] = pause_;
   assign lights_[`LRUN] = run_;
   assign lights_[`LION] = ion_;
   assign lights_[`LCA] = ca_;
   assign lights_[`LWC] = wc_;
   assign lights_[`LEXEC] = exec_;
   assign lights_[`LDEFER] = defer_;
   assign lights_[`LRCK] = 1'b1; // Must be 1, must be first out.

   always @(posedge clk)
   begin
       if (~reset_)
          counter = `LightsBits; // Set up for reset
       else if (counter < `LightsBits) begin
          sr = { 1'b0, sr[0:`LightsBits-1] };
          counter = counter + 1;
          LCL_N = 1'b1;
       end else if (counter > `LightsBits) begin
          sr = ~lights_;  // Load the data to be shifted out
          counter = 0;
          LCL_N = 1'b0; // Clear/reset output shift register.
       end else begin
          counter = counter + 1;
          // Wait one clock for the lights to latch the shifted data.
       end
   end

   assign LCLK = clk;
   assign LSER = sr[`LightsBits];
    
endmodule
