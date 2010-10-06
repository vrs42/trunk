module Oscillator(Dclk, Enable, Out);
parameter Hz = 60;
input wire Dclk;   // Delay clock (10ns)
input wire Enable; // Allow output to ttoggle
output reg Out;   // Ocillator output

integer Count;

always @(posedge Dclk)
begin
   if (Enable)
     Count = Count + 1;
   if (Count == ((100/2*1000*1000)/Hz)) begin
     Out = ~Out;
     Count = 0;
   end
end

endmodule
