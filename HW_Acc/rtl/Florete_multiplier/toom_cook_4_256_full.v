`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2018 00:13:22
// Design Name: 
// Module Name: toom_cook_4_256_full
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module toom_cook_4_256_full(
    input start,
    input resetn,
    input clk,
    input [63:0] data_in,
    input poly_reduce,
    output done,
    output [7:0] read_addr,
    output [9:0] write_addr,
    output write,
    output [15:0] data_out
    );

parameter N_MULT_64 = 7;
parameter COEFF_WIDTH = 16;
parameter INV3 = 43691;
parameter INV9 = 36409;
parameter INV15 = 61167;
parameter INV5 = 52429;

//6042513
//States for the control
//localparam STATE_IDLE      = 3'b000,
//           STATE_PRECOMP   = 3'b100,
//           STATE_COMPUTING = 3'b001,
//           STATE_ENDCOMP   = 3'b101,
//           STATE_LOAD_B    = 3'b010,
//           STATE_WRITE_RES = 3'b011;
localparam STATE_IDLE       = 4'd0,
           STATE_EVALUATION = 4'd1,
           STATE_MULT_64    = 4'd2,
           STATE_WAIT_MUL   = 4'd3,
           STATE_SAVE_0     = 4'd4,
           STATE_SAVE_6     = 4'd5,
           STATE_SAVE_4     = 4'd6,
           STATE_SAVE_5     = 4'd7,
           STATE_SAVE_2     = 4'd8,
           STATE_SAVE_1     = 4'd9,
           STATE_SAVE_3     = 4'd10,
           STATE_INTERP     = 4'd11;
reg [3:0] state, next_state;
// registered outputs
reg write_res, reg_done, next_reg_done;
reg [(COEFF_WIDTH-1):0] reg_data_out;
//Counters
reg [6:0] cnt_write, addr_ev, next_addr_ev;
// depends on the selected BRAM!
reg offset_read;
reg [7:0] addr_read64, next_addr_read64;
reg [9:0] addr_write16;
//wire [(COEFF_WIDTH-1):0] acc [3:0];
//Datapath
reg start_schb, write_w;
wire done_schb [(N_MULT_64-1):0];
wire [(COEFF_WIDTH-1):0] w [(N_MULT_64-1):0];
wire [(COEFF_WIDTH-1):0] r [(N_MULT_64-1):0];
wire [(COEFF_WIDTH-1):0] c0, c1, c2, c3, c4, c5, c6;
//Datapatch for evaluation
wire [(COEFF_WIDTH-1):0] a0, a1, a2, a3;
wire [(COEFF_WIDTH-1):0] ev0, ev1, ev2, ev3, ev4, ev5, ev6, ev7, ev8, ev9, ev10;
//Datapath for interpolation //Registers are for the pipelining
reg [(COEFF_WIDTH-1):0] c0_reg, c1_reg, c2_reg, c3_reg, c4_reg, c5_reg, c6_reg;
wire [(COEFF_WIDTH-1):0] r00, r01, r02, r03, r04, r05, r06, r07, r08, r09, r010;
reg [(COEFF_WIDTH-1):0] r00_reg, r01_reg, r02_reg, r03_reg, r04_reg, r05_reg, r06_reg, r07_reg, r08_reg, r09_reg, r010_reg;
wire [(COEFF_WIDTH-1):0] r10, r11, r12, r13, r14, r15, r16, r17, r18;
reg [(COEFF_WIDTH-1):0] r10_reg, r11_reg, r12_reg, r13_reg, r14_reg, r15_reg, r16_reg, r17_reg, r18_reg;
wire [(COEFF_WIDTH-1):0] r20, r21, r22;
reg [(COEFF_WIDTH-1):0] r20_reg, r21_reg, r22_reg;
wire [(COEFF_WIDTH-1):0] r30, r31, r32, r33;
reg [(COEFF_WIDTH-1):0] r30_reg, r31_reg, r32_reg, r33_reg;
wire [(COEFF_WIDTH-1):0] r40, r41, r42;
reg [(COEFF_WIDTH-1):0] r40_reg, r41_reg, r42_reg;
wire [(COEFF_WIDTH-1):0] r50, r60;
reg [(COEFF_WIDTH-1):0] r50_reg, r60_reg;
wire [(COEFF_WIDTH-1):0] t0, t1, t2, t3, t4, t5, t6;
reg [(COEFF_WIDTH-1):0] r0, r1, r2, r3, r4, r5, r6;

assign write = write_res;
assign done = reg_done;
assign data_out = reg_data_out;

// depends on the selected BRAM!
assign read_addr = addr_read64 + {offset_read, 6'b0};//(+64)
//assign write_addr = addr_write16 + 512;
assign write_addr = {1'b1, addr_write16[8], addr_write16[5:0], addr_write16[7:6]};//address translation from coefficient index
//Be careful with BRAM endianness:
assign a0 = data_in[15:0];
assign a1 = data_in[31:16];
assign a2 = data_in[47:32];
assign a3 = data_in[63:48];

//Evaluation
assign ev0 = a0 + a2;
assign ev1 = a1 + a3;
assign ev2 = ev0 + ev1;
assign ev3 = ev0 - ev1;
assign ev4 = {a0[12:0],3'b0} + {a2[14:0],1'b0};
assign ev5 = {a1[13:0],2'b0} + a3;
assign ev6 = ev4 + ev5;
assign ev7 = ev4 - ev5;
assign ev8 = {a1[14:0],1'b0} + a0;
assign ev9 = {a3[12:0],3'b0} + {a2[13:0],2'b0};
assign ev10 = ev8 + ev9;
assign w[0] = a3;
assign w[1] = ev10;
assign w[2] = ev2;
assign w[3] = ev3;
assign w[4] = ev6;
assign w[5] = ev7;
assign w[6] = a0;

//Multiplication
genvar             ii;
generate
for (ii=0; ii<N_MULT_64; ii=ii+1) 
begin
    poly_mul_schb_64_wrapper poly_mul_schb_64_wrapper_inst(.start(start_schb), .resetn(resetn), .clk(clk),
                              .address(addr_ev[6:0]), .data_in(w[ii]), .write_en(write_w),
                              .data_out(r[ii]), .done(done_schb[ii])
                             );
end
endgenerate

assign c0 = r[0];
assign c1 = r[1];
assign c2 = r[2];
assign c3 = r[3];
assign c4 = r[4];
assign c5 = r[5];
assign c6 = r[6];

//Interpolation datapath

assign t0 = c0;
assign t6 = c6;

assign r00 = 5 * c0_reg;//assign r00 = c0 + {c0[13:0],2'b0};
assign r01 = c0_reg + c6_reg;
mult_const_inv15 m1 (.A(c1_reg), .P(r02));
mult_const_inv3 m2 (.A(c2_reg), .P(r03));
assign r04 = c2_reg + c3_reg;
assign r05 = c2_reg - c3_reg;
assign r06 = c4_reg - (c3_reg << 3);
assign r07 = (c3_reg << 2) + c4_reg;
assign r08 = c4_reg + c5_reg;
mult_const_inv5 m3 (.A(c5_reg), .P(r09));
assign r010 = 5 * c6_reg;//assign r010 = c6 + {c6[13:0],2'b0};

assign r10 = (r01 << 3) + (r03 << 3);
assign r11 = (r01 << 1) + (r03 << 2);
assign r12 = (r02 << 3) + r09;
assign r13 = (r02 << 1) - r09;
mult_const_inv3 m4 (.A(r06), .P(r14));
mult_const_inv3 m5 (.A(r07), .P(r15));
assign r16 = r08 - (r04 << 2);
assign r17 = (c6_reg << 5) - (r00 << 1);
assign r18 = (c0_reg << 1) - (r010 << 3);

assign r20 = r12_reg + r14_reg;
assign r21 = r13_reg + r15_reg;
mult_const_inv3 m6 (.A(r16_reg), .P(r22));

mult_const_inv3 m7 (.A(r20), .P(r30));
mult_const_inv3 m8 (.A(r21), .P(r31));
assign r32 = (r04 << 2) - r22;
assign r33 = r22 + r18_reg;

assign r40 = r30_reg - r10_reg;
assign r41 = r31_reg - r11_reg;
assign r42 = r32_reg + r17_reg;

assign r50 = r40 + r41;

assign r60 = (r05 << 1) - r50;

assign t1 = r40 >> 2;
assign t2 = r42 >> 3;
assign t3 = r60 >> 2;
assign t4 = r33 >> 3;
assign t5 = r41 >> 2;

//Pipelining of the interpolation datapath
always @(posedge clk)
begin
//Input
    c0_reg <= c0;
    c1_reg <= c1;
    c2_reg <= c2;
    c3_reg <= c3;
    c4_reg <= c4;
    c5_reg <= c5;
    c6_reg <= c6;
//0
    r00_reg <= r00;
    r01_reg <= r01;
    r02_reg <= r02;
    r03_reg <= r03;
    r04_reg <= r04;
    r05_reg <= r05;
    r06_reg <= r06;
    r07_reg <= r07;
    r08_reg <= r08;
    r09_reg <= r09;
    r010_reg <= r010;
//1
    r10_reg <= r10;
    r11_reg <= r11;
    r12_reg <= r12;
    r13_reg <= r13;
    r14_reg <= r14;
    r15_reg <= r15;
    r16_reg <= r16;
    r17_reg <= r17;
    r18_reg <= r18;
//2
    r20_reg <= r20;
    r21_reg <= r21;
    r22_reg <= r22;
//3
    r30_reg <= r30;
    r31_reg <= r31;
    r32_reg <= r32;
    r33_reg <= r33;
//4
    r40_reg <= r40;
    r41_reg <= r41;
    r42_reg <= r42;
//5,6 (only for r3)
    r50_reg <= r50;
    r60_reg <= r60;
//Output
    r0 <= t0;
    r1 <= t1;
    r2 <= t2;
    r3 <= t3;
    r4 <= t4;
    r5 <= t5;
    r6 <= t6;
end


//Combinatorial logic - FSM
always @(*) 
    begin
    next_state <= state;
    next_addr_ev <= addr_ev;
    next_addr_read64 <= addr_read64;
    addr_write16 <= cnt_write;
    offset_read <= 0;
    reg_data_out <= 0;
    write_w <= 0;
    start_schb <= 0;
    write_res <= 0;
    next_reg_done <= 0;
    case (state)
        STATE_IDLE:
            begin
            next_addr_ev <= 0;
            next_addr_read64 <= 0;
            if (start == 1)
            begin
                next_state <= STATE_EVALUATION;
                next_addr_read64 <= addr_read64 + 1;
            end
            else
            begin
                next_state <= STATE_IDLE;
            end
            end
        STATE_EVALUATION:
            begin
                next_addr_read64 <= addr_read64 + 1;
                next_addr_ev <= addr_ev + 1;
                write_w <= 1;
                if (addr_read64[7])//if (cnt_write == 126)//if (addr_read64[7])//if (addr_ev == 127)//if (addr_read64 == 128)
                begin
                    next_addr_read64 <= addr_read64;
                    next_state <= STATE_MULT_64;
                end
            end
        STATE_MULT_64:
            begin
                start_schb <= 1;
                next_state <= STATE_WAIT_MUL;
            end
        STATE_WAIT_MUL:
            begin
                if (done_schb[0] == 1)
                begin
                    next_state <= STATE_INTERP;
                end
            end
        STATE_INTERP:
            begin
                offset_read <= 1;
                next_state <= STATE_SAVE_0;
            end
        STATE_SAVE_0:
            begin
                reg_data_out <= r0 + (cnt_write[6] ? a3 : a2);
                addr_write16 <= cnt_write + 384;
                write_res <= 1;
                next_state <= STATE_SAVE_6;
            end
        STATE_SAVE_6:
            begin
                reg_data_out <= r6 + (cnt_write[6] ? a1 : a0);
                addr_write16 <= cnt_write;
                write_res <= 1;
                next_state <= STATE_SAVE_4;
            end
        STATE_SAVE_4:
            begin
                reg_data_out <= r4 + (cnt_write[6] ? a3 : a2);
                addr_write16 <= cnt_write + 128;
                write_res <= 1;
                next_state <= STATE_SAVE_5;
            end
        STATE_SAVE_5:
            begin
                reg_data_out <= r5 + (cnt_write[6] ? a2 : a1);
                offset_read <= 1;
                addr_write16 <= cnt_write + 64;
                write_res <= 1;
                next_state <= STATE_SAVE_2;
            end
        STATE_SAVE_2:
            begin
                reg_data_out <= r2 + (cnt_write[6] ? a1 : a0);
                offset_read <= 1;
                addr_write16 <= cnt_write + 256;
                write_res <= 1;
                next_state <= STATE_SAVE_1;
            end
        STATE_SAVE_1:
            begin
                reg_data_out <= r1 + (cnt_write[6] ? a2 : a1);
                offset_read <= cnt_write[6];
                addr_write16 <= cnt_write + 320;
                write_res <= 1;
                next_addr_ev <= addr_ev + 1;
                next_addr_read64 <= addr_read64 + 1;
                next_state <= STATE_SAVE_3;
                if (addr_read64[5:0] == 63)//if (cnt_write == 63)//if (addr_ev == 63)//if (addr_read64[5:0] == 63)
                begin
                    next_addr_read64 <= addr_read64 - 63;
                end
            end
        STATE_SAVE_3:
            begin
                reg_data_out <= r3 + (cnt_write[6] ? a0 : a3);
                offset_read <= 1;
                addr_write16 <= cnt_write + 192;
                write_res <= 1;
                next_state <= STATE_SAVE_0;
                if (cnt_write == 126)//if (cnt_write[6] && (addr_read64[5:0] == 63))//if (cnt_write == 126)//if (addr_ev == 127)
                begin
                    next_state <= STATE_IDLE;
                    next_reg_done <= 1;
                end
            end
    endcase
    end

//Synchronous logic to update state and registers
always @(posedge clk)
begin
    cnt_write <= addr_ev;
    addr_ev <= next_addr_ev;
    addr_read64 <= next_addr_read64;
    reg_done <= next_reg_done;
    if (resetn==1'b0)
    begin
        state <= STATE_IDLE;
    end
    else
    begin
        state <= next_state;
    end
end


endmodule

