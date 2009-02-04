module lightsMux(clk, reset, LSER, LCLK, LCL_N,
                 pc, ma, mb, ac, mq, dfld, ifld, sc, link, ir,
                 fetch, defer, exec, ion, run, wc, ca, break);
input clk, reset; 
input [0:11]pc;
input [0:11]ma;
input [0:11]mb;
input [0:11]ac;
input [0:11]mq;
input [0:2]dfld;
input [0:2]ifld;
input [0:4]sc;
input link;
input [0:2]ir;
input fetch, defer, exec, ion, run, wc, ca, break;
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

wire [0:`LightsBits] lights;    // Need an extra for LRCK.
reg  [0:`LightsBits] sr;        // Need an extra for LRCK.
integer counter = `LightsBits+1;
wire pause;

   // Display CPU major state
   assign pause = (ir == 3'b110);

   // Continuously display IR
   assign lights[`LAND] = (ir == 3'b000);
   assign lights[`LTAD] = (ir == 3'b001);
   assign lights[`LISZ] = (ir == 3'b010);
   assign lights[`LDCA] = (ir == 3'b011);
   assign lights[`LJMS] = (ir == 3'b100);
   assign lights[`LJMP] = (ir == 3'b101);
   assign lights[`LIOT] = (ir == 3'b110);
   assign lights[`LOPR] = (ir == 3'b111);

   assign lights[`LDF0] = dfld[0];
   assign lights[`LSC0] = sc[0];
   assign lights[`LDF1] = dfld[1];
   assign lights[`LSC1] = sc[1];
   assign lights[`LDF2] = dfld[2];
   assign lights[`LSC2] = sc[2];
   assign lights[`LIF0] = ifld[0];
   assign lights[`LSC3] = sc[3];
   assign lights[`LIF1] = ifld[1];
   assign lights[`LSC4] = sc[4];
   assign lights[`LIF2] = ifld[2];
   assign lights[`LLINK] = link;
   assign lights[`LUA0] = 1'b1;
   assign lights[`LUA1] = 1'b1;
   assign lights[`LUA2] = 1'b1;
   assign lights[`LUA3] = 1'b1;

   assign lights[`LPC0] = pc[0];
   assign lights[`LMA0] = ma[0];
   assign lights[`LMB0] = mb[0];
   assign lights[`LAC0] = ac[0];
   assign lights[`LMQ0] = mq[0];
   assign lights[`LPC1] = pc[1];
   assign lights[`LMA1] = ma[1];
   assign lights[`LMB1] = mb[1];
   assign lights[`LAC1] = ac[1];
   assign lights[`LMQ1] = mq[1];
   assign lights[`LPC2] = pc[2];
   assign lights[`LMA2] = ma[2];
   assign lights[`LMB2] = mb[2];
   assign lights[`LAC2] = ac[2];
   assign lights[`LMQ2] = mq[2];
   assign lights[`LPC3] = pc[3];
   assign lights[`LMA3] = ma[3];
   assign lights[`LMB3] = mb[3];
   assign lights[`LAC3] = ac[3];
   assign lights[`LMQ3] = mq[3];
   assign lights[`LPC4] = pc[4];
   assign lights[`LMA4] = ma[4];
   assign lights[`LMB4] = mb[4];
   assign lights[`LAC4] = ac[4];
   assign lights[`LMQ4] = mq[4];
   assign lights[`LPC5] = pc[5];
   assign lights[`LMA5] = ma[5];
   assign lights[`LMB5] = mb[5];
   assign lights[`LAC5] = ac[5];
   assign lights[`LMQ5] = mq[5];
   assign lights[`LUA4] = 1'b1;
   assign lights[`LUA5] = 1'b1;

   assign lights[`LPC6] = pc[6];
   assign lights[`LMA6] = ma[6];
   assign lights[`LMB6] = mb[6];
   assign lights[`LAC6] = ac[6];
   assign lights[`LMQ6] = mq[6];
   assign lights[`LPC7] = pc[7];
   assign lights[`LMA7] = ma[7];
   assign lights[`LMB7] = mb[7];
   assign lights[`LAC7] = ac[7];
   assign lights[`LMQ7] = mq[7];
   assign lights[`LPC8] = pc[8];
   assign lights[`LMA8] = ma[8];
   assign lights[`LMB8] = mb[8];
   assign lights[`LAC8] = ac[8];
   assign lights[`LMQ8] = mq[8];
   assign lights[`LPC9] = pc[9];
   assign lights[`LMA9] = ma[9];
   assign lights[`LMB9] = mb[9];
   assign lights[`LAC9] = ac[9];
   assign lights[`LMQ9] = mq[9];
   assign lights[`LPC10] = pc[10];
   assign lights[`LMA10] = ma[10];
   assign lights[`LMB10] = mb[10];
   assign lights[`LAC10] = ac[10];
   assign lights[`LMQ10] = mq[10];
   assign lights[`LPC11] = pc[11];
   assign lights[`LMA11] = ma[11];
   assign lights[`LMB11] = mb[11];
   assign lights[`LAC11] = ac[11];
   assign lights[`LMQ11] = mq[11];
   assign lights[`LUA6] = 1'b1;
   assign lights[`LFETCH] = fetch;
   assign lights[`LBREAK] = break;
   assign lights[`LPAUSE] = pause;
   assign lights[`LRUN] = run;
   assign lights[`LION] = ion;
   assign lights[`LCA] = ca;
   assign lights[`LWC] = wc;
   assign lights[`LEXEC] = exec;
   assign lights[`LDEFER] = defer;
   assign lights[`LRCK] = 1'b1; // Must be 1, must be first out.

   always @(posedge clk)
   begin
       if (reset)
          counter = `LightsBits;
       else if (counter < `LightsBits) begin
          sr = { 1'b0, sr[0:`LightsBits-1] };
          counter = counter + 1;
          LCL_N = 1'b1;
       end else if (counter > `LightsBits) begin
          sr = lights;
          counter = 0;
          LCL_N = 1'b0;
       end else begin
          counter = counter + 1;
          // Wait one clock for the lights to latch the shifted data.
       end
   end

   assign LCLK = clk;
   assign LSER = sr[`LightsBits];
    
endmodule
