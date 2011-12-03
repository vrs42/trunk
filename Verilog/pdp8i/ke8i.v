module ke8i(Dclk, Ac, Mid_ac0, Low_ac0, Adder_l, Adder_l_,
            Mb, Tp3, Adder11, Mfts2,
            Opr, Op2, Fetch, Execute, Power_clear_, Eae_ir_clr_, Right_shift,
            Mq, Eae_right_shift_enable, Eae_left_shift_enable, Eae_no_shift_enable, Eae_ir2,
            Eae_mem_enable, Eae_acbar_enable, Eae_ac_enable, Eae_l_disable, Asr_enable,
            Mq_enable, Sc_enable, Eae_e_set, Eae_set, Eae_mq0bar_enable, Eae_mq0_enable,
            Eae_execute, Eae_end, Asr_l_set, Ac_to_mq_enable, Sc, Eae_on, Eae_tp, Eae_start,
            C40s2, C40m2, C40n2, C40l2, C40f1,
            E40s2, E40m2, E40n2, E40l2, E40f1, E40h1,
            F40s2, F40m2, F40n2, F40l2, F40f1, F40h1);

input Dclk;

input [0:11] Ac;
input Mid_ac0;
input Low_ac0;
input Adder_l, Adder_l_;
input [0:11] Mb;
input Tp3;
input Adder11;
input Mfts2;
input Opr;
input Op2;
input Fetch;
input Execute;
input Power_clear_;
input Eae_ir_clr_;
input Right_shift;

output reg [0:11] Mq;
output reg [0:4] Sc;
output reg Eae_on;
output Asr_l_set;
output Eae_e_set;
output Eae_set;
output Eae_mq0_enable;
output Eae_mq0bar_enable;
output Eae_right_shift_enable;
output Eae_left_shift_enable;
output Eae_no_shift_enable;
output Eae_ir2;
output Eae_mem_enable;
output Eae_acbar_enable;
output Eae_ac_enable;
output Eae_l_disable;
output Asr_enable;
output Mq_enable;
output Sc_enable;
output Eae_execute;
output Eae_end;
output Ac_to_mq_enable;
output Eae_tp;
output Eae_start;
output C40s2, C40m2, C40n2, C40l2, C40f1;
output E40s2, E40m2, E40n2, E40l2, E40f1, E40h1;
output F40s2, F40m2, F40n2, F40l2, F40f1, F40h1;

reg [0:2] Eae_ir;
assign Eae_ir2 = Eae_ir[2];

reg Eae_tg;
reg Eae_run;
reg Eae_end;

wire [0:4] Sc_set;
wire Sc_full;
wire Sc0_3_0;
wire Dvi, Muy, Nmi, Scl;
wire Asr_enable;
wire Eae_begin;
wire Left_shift;
wire Div_last_;
wire D23v2_;
wire Mq_load;
wire Sc_load;


// KE8I-0-2 "Eae Control"

assign Asr_l_set = Asr_enable & ~Eae_ir[2] & Ac[0];
assign Mq_low_ac0 = Low_ac0 & (Mq == 0);
assign Norm = (Ac[0] != Ac[1]) | (Mq_low_ac0 & Mid_ac0 & (Ac[2:3] == 2'b00));
assign Div_last = (~Sc0_3_0 & Adder_l & ~Sc[4])
                | (Sc[1] & Sc[2] & Sc[4]);
assign D19h2 = (~Ac[0] & Ac[2])
             | (~Ac[3] & Mq_low_ac0 & Mid_ac0)
             | (Ac[1] & ~Ac[2]);
assign Eae_complete = (Muy & Sc[1] & Sc[3] & Sc[4])
                    | (Dvi & Div_last)
                    | (Sc_full & Sc[0])
                    | (Nmi & D19h2);
assign Muy_or_dvi = ~Eae_ir[0] & Eae_ir[1];
assign Mb_to_sc_enable = Opr & ~Eae_on & Muy_or_dvi & Execute;
assign Ac_to_mq_enable = Op2 & ~Mb[4] & Mb[7] & Mb[11];
assign Eae_on_set = ~(Eae_complete & Eae_run);
assign Eae_tp_ = ~(Eae_tp & Eae_run);
assign Eae_on_clock = ~Eae_tp_ | Eae_start;
always @(negedge Power_clear_, posedge Eae_on_clock)
begin
    if (~Power_clear_)
        Eae_on = 0;
    else
        Eae_on = Eae_on_set;
end

DelayLine #(250) eaetp(Dclk, Eae_on_clock, Eae_tp);

assign Eae_right_shift_enable = Eae_on & ~Dvi & Eae_ir[1];
assign Eae_left_shift_enable = Eae_on
                             & ~(Dvi & Sc[1] & Sc[2])
                             & ~Div_last
                             & ~Eae_right_shift_enable;
assign Eae_no_shift_enable = ~Eae_on | (Dvi & Sc[1] & Sc[2]) | Div_last;
assign Eae_mem_enable = Eae_on
                      & ~Eae_ir[0]
                      & ~(Dvi & Div_last & Sc[1] & Mq[11])
                      & (Muy & Mq[11]);
assign Div_last_ = ~(Dvi & Div_last);
assign D23v2_ = (Div_last_ & ~Mq[10] & Mq[11])
              | (Mq[10] & ~Mq[11]);
assign Eae_acbar_enable = Eae_on & Dvi & (~D23v2_| Sc0_3_0| (Div_last & Mq[10]));
assign Eae_ac_enable = Eae_on & ~Eae_acbar_enable;
assign Asr_enable = Eae_on & Eae_ir[0] & Eae_ir[1];
assign Eae_inst = Opr & Fetch & Mb[3] & Mb[11];
assign Eae_l_disable = Eae_acbar_enable | (Eae_inst & Mb[9]) | ~Asr_enable;
assign Mq_enable = Op2 & Mb[5] & Mb[11];
assign Sc_enable = Op2 & Mb[6] & Mb[11];
assign Eae_e_set = Eae_inst & (Mb[9] | Mb[10]);
assign Eae_execute = Opr & Execute;
assign Sc0 = Sc0_3_0 & ~Sc[4];
assign D16n2 = Dvi & (Sc0 | Mq[11]);
assign Eae_mq0_enable = Eae_on & ~Mq[0] & ~D16n2;
assign Eae_mq0bar_enable = Eae_on & Mq[0] & D16n2;
assign Mq_load = ~Eae_tg | (Eae_inst & Mb[7] & Tp3);
assign Sc_load = ~Eae_tg | (Nmi & Tp3) | (Eae_begin & Tp3);

DelayLine #(100) eaerun(Dclk, Eae_tp, Eae_run_clock);
always @(negedge Power_clear_, posedge Eae_start, posedge Eae_run_clock)
begin
    if (~Power_clear_)
        Eae_run = 0;
    else if (Eae_start)
        Eae_run = 1;
    else
        Eae_run = Eae_on;
end

assign Eae_begin = (Nmi & ~Norm) | (Opr & Execute);
assign Eae_start = Eae_begin & ~Scl;
assign Eae_set = Eae_begin & ~Scl;

assign Eae_tg_clock = Eae_tp | Mfts2;
always @(posedge Eae_on, posedge Eae_tg_clock)
begin
    if (Eae_tg_clock)
        Eae_tg = 1;
    else
        Eae_tg = ~(Eae_run & ~Div_last);
end

assign Eae_ir_clock = Eae_inst & Tp3;
always @(negedge Eae_ir_clr_, posedge Eae_ir_clock)
begin
    if (~Eae_ir_clr_)
        Eae_ir = 0;
    else
        Eae_ir = Mb[8:10];
end

always @(negedge Eae_run, posedge Eae_tp)
begin
    if (~Eae_run)
        Eae_end = 1;
    else
        Eae_end = ~Eae_complete;
end

assign Nmi = Eae_inst & (Mb[8:10] == 3'b100);
assign Dvi = (Eae_ir == 3'b011);
assign Muy = (Eae_ir == 3'b010);
assign Scl = (Eae_ir == 3'b001);


// KE8I-0-3 "Multiplier Quotient and Step Counter"

assign Sc_full = (Sc[1:4] == 4'b1111);
assign Sc_set[0] = (Eae_on & Sc_full & ~Sc[0])
                 | (Eae_on & ~Sc_full & Sc[0])
                 | (Mb_to_sc_enable & ~Mb[7]);
assign Sc_set[1] = (Eae_on & (Sc[2:4] == 3'b111) & ~Sc[1])
                 | (Eae_on & (Sc[2:4] != 3'b111) & Sc[1])
                 | (Mb_to_sc_enable & ~Mb[8]);
assign Sc_set[2] = (Eae_on & (Sc[3:4] == 2'b11) & ~Sc[2])
                 | (Eae_on & (Sc[3:4] != 2'b11) & Sc[2])
                 | (Mb_to_sc_enable & ~Mb[9]);
assign Sc_set[3] = (Eae_on & Sc[4] & ~Sc[3])
                 | (Eae_on & ~Sc[4] & Sc[3])
                 | (Mb_to_sc_enable & ~Mb[10]);
assign Sc_set[4] = (Eae_on & ~Sc[4])
                 | (Mb_to_sc_enable & ~Mb[11]);
always @(posedge Sc_load)
begin
    Sc = Sc_set;
end

assign { C40s2, C40m2, C40n2, C40l2, C40f1 } = ~Sc;

assign Left_shift = Eae_on & ~Eae_right_shift_enable;
assign Sc0_3_0 = ~Eae_tp & (Sc[1:3] == 3'b000);
assign D23t2_ = (Sc0_3_0 & ~Sc[4])
              | (Adder_l_ & Mq[11])
              | (Adder_l & ~Mq[11])
              | ~Dvi;

wor [0:11] Mq_set = 12'b0;
assign Mq_set = Right_shift? { ~Adder11, Mq[0:10] } : 12'b0;
assign Mq_set = Ac_to_mq_enable? Ac : 12'b0;
assign Mq_set = Left_shift? { Mq[1:11], ~D23t2_ } : 12'b0;
always @(posedge Mq_load)
begin
    Mq = Mq_set;
end

assign { E40s2, E40m2, E40n2, E40l2, E40f1, E40h1 } = ~Mq[0:5];
assign { F40s2, F40m2, F40n2, F40l2, F40f1, F40h1 } = ~Mq[6:11];

endmodule
