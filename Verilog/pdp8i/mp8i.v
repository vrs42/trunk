module mp8i(Initialize_, Mb, Mem, Mem_p, Iop1, Iop4,
            Mb_parity_odd, Mp_int_, Mp_skip_);

input wire Initialize_;
input wire [0:11] Mb;
input wire [0:11] Mem;
input wire Mem_p;
input wire Iop1;
input wire Iop4;

output wire Mb_parity_odd;
output reg Mp_int_;
output wire Mp_skip_;

wire Mem_parity_odd;

assign A09k1 = (Mb[0:3] == 4'b0001)? 1 :
               (Mb[0:3] == 4'b0010)? 1 :
               (Mb[0:3] == 4'b0100)? 1 :
               (Mb[0:3] == 4'b1000)? 1 :
               (Mb[0:3] == 4'b1110)? 1 :
               (Mb[0:3] == 4'b1101)? 1 :
               (Mb[0:3] == 4'b1011)? 1 :
               (Mb[0:3] == 4'b0111)? 1 : 0;
assign A10u2 = (Mb[4:7] == 4'b0001)? 1 :
               (Mb[4:7] == 4'b0010)? 1 :
               (Mb[4:7] == 4'b0100)? 1 :
               (Mb[4:7] == 4'b1000)? 1 :
               (Mb[4:7] == 4'b1110)? 1 :
               (Mb[4:7] == 4'b1101)? 1 :
               (Mb[4:7] == 4'b1011)? 1 :
               (Mb[4:7] == 4'b0111)? 1 : 0;
assign A09u2 = (Mb[8:11] == 4'b0001)? 1 :
               (Mb[8:11] == 4'b0010)? 1 :
               (Mb[8:11] == 4'b0100)? 1 :
               (Mb[8:11] == 4'b1000)? 1 :
               (Mb[8:11] == 4'b1110)? 1 :
               (Mb[8:11] == 4'b1101)? 1 :
               (Mb[8:11] == 4'b1011)? 1 :
               (Mb[8:11] == 4'b0111)? 1 : 0;
assign Mb_parity_odd = ({A09k1, A10u2, A09u2} == 3'b001)? 1 :
                       ({A09k1, A10u2, A09u2} == 3'b010)? 1 :
                       ({A09k1, A10u2, A09u2} == 3'b100)? 1 :
                       ({A09k1, A10u2, A09u2} == 3'b111)? 1 : 0;

assign Mp_addr = (Mb[3:8] == 6'b001000);
assign Mp_skip_ = Iop1 & Mp_int_ & Mp_addr;
assign Clr_parity_error = ~Initialize_ | (Iop4 & Mp_addr);

always @(Clr_parity_error, Mem_parity_odd)
begin
    if (Clr_parity_error)
        Mp_int_ = 1;
    if (Mem_parity_odd)
        Mp_int_ = 0;
end

assign A07k1 = (Mem[0:3] == 4'b0001)? 1 :
               (Mem[0:3] == 4'b0010)? 1 :
               (Mem[0:3] == 4'b0100)? 1 :
               (Mem[0:3] == 4'b1000)? 1 :
               (Mem[0:3] == 4'b1110)? 1 :
               (Mem[0:3] == 4'b1101)? 1 :
               (Mem[0:3] == 4'b1011)? 1 :
               (Mem[0:3] == 4'b0111)? 1 : 0;
assign A08u2 = (Mem[4:7] == 4'b0001)? 1 :
               (Mem[4:7] == 4'b0010)? 1 :
               (Mem[4:7] == 4'b0100)? 1 :
               (Mem[4:7] == 4'b1000)? 1 :
               (Mem[4:7] == 4'b1110)? 1 :
               (Mem[4:7] == 4'b1101)? 1 :
               (Mem[4:7] == 4'b1011)? 1 :
               (Mem[4:7] == 4'b0111)? 1 : 0;
assign A07u2 = (Mem[8:11] == 4'b0001)? 1 :
               (Mem[8:11] == 4'b0010)? 1 :
               (Mem[8:11] == 4'b0100)? 1 :
               (Mem[8:11] == 4'b1000)? 1 :
               (Mem[8:11] == 4'b1110)? 1 :
               (Mem[8:11] == 4'b1101)? 1 :
               (Mem[8:11] == 4'b1011)? 1 :
               (Mem[8:11] == 4'b0111)? 1 : 0;
assign Mem_parity_odd = ({A07k1, A08u2, A07u2, Mem_p} == 4'b0001)? 1 :
                        ({A07k1, A08u2, A07u2, Mem_p} == 4'b0010)? 1 :
                        ({A07k1, A08u2, A07u2, Mem_p} == 4'b0100)? 1 :
                        ({A07k1, A08u2, A07u2, Mem_p} == 4'b1000)? 1 :
                        ({A07k1, A08u2, A07u2, Mem_p} == 4'b1110)? 1 :
                        ({A07k1, A08u2, A07u2, Mem_p} == 4'b1101)? 1 :
                        ({A07k1, A08u2, A07u2, Mem_p} == 4'b1011)? 1 :
                        ({A07k1, A08u2, A07u2, Mem_p} == 4'b0111)? 1 : 0;

endmodule
