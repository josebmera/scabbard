`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2018 03:53:24 PM
// Design Name: 
// Module Name: poly_mul_schb
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


module poly_mul_schb_64_4(
    input resetn,
    input clk,
    input start,
    input [15:0] dataA,
    input [15:0] dataB,
    input [15:0] dataB1,
    input [15:0] dataC,
    input [15:0] dataC1,
    output [5:0] addressA,
    output [5:0] addressB,
    output [6:0] addressC,
    output [6:0] addressC1,
    output [15:0] dataWrite,
    output write,
    output done
    );

parameter N_ALU = 4;
parameter COEFF_WIDTH = 16;//13;
parameter LOAD_B_LATENCY = 2;//N_ALU/dualRAM

//States for the control
//localparam STATE_IDLE      = 3'b000,
//           STATE_PRECOMP   = 3'b100,
//           STATE_COMPUTING = 3'b001,
//           STATE_ENDCOMP   = 3'b101,
//           STATE_LOAD_B    = 3'b010,
//           STATE_WRITE_RES = 3'b011;
localparam STATE_IDLE      = 3'd0,
           STATE_PRECOMP   = 3'd4,
           STATE_COMPUTING = 3'd1,
           STATE_ENDCOMP   = 3'd5,
           STATE_LOAD_B    = 3'd2,
           STATE_WRITE_RES = 3'd3;
reg  [2:0] state, next_state;
//Counters
reg [1:0] cnt, next_cnt;
reg [5:0] cntA, next_cntA, cntB, next_cntB;
reg [6:0] cntC, next_cntC;
//Datapath
wire [(COEFF_WIDTH-1):0] a;
wire [(COEFF_WIDTH-1):0] next_b[(N_ALU-1):0];
reg [(COEFF_WIDTH-1):0] b[(N_ALU-1):0];
wire [(COEFF_WIDTH-1):0] ab0[(N_ALU-1):0];
wire [(COEFF_WIDTH-1):0] ab1[(N_ALU-1):0];
wire [(COEFF_WIDTH-1):0] acc[(N_ALU-1):0];
reg [(COEFF_WIDTH-1):0] res[N_ALU:0];
wire [(COEFF_WIDTH-1):0] next_res[(N_ALU-1):0];
//wire [12:0] dataC_load, dataC1_load;
//wire [12:0] dataB_load, dataB1_load;
//Control
reg sweep;
reg reg_done;

genvar             ii;
generate
for (ii=0; ii<N_ALU; ii=ii+1) 
begin
    mult_gen_0 mult_gen_0_inst (.CLK(clk), .A(a), .B(b[ii]), .SCLR(~resetn), .P(ab0[ii]));
//    mult_gen_0 mult_gen_0_inst (.CLK(clk), .A(a), .B(b[ii]), .SCLR(~resetn), .P(ab0[ii]));
//    c_addsub_0 c_addsub_0_inst (.A(ab0[ii]), .B(ab1[ii]), .CLK(clk), .C_IN(1'b0), .S(acc[ii]));
    assign acc[ii] = ab0[ii] + ab1[ii];
    //c_addsub_0 c_addsub_0_inst (.A(ab0[ii]), .B(ab1[ii]), .C_IN(1'b0), .S(acc[ii]));
    assign ab1[ii] = sweep ? res[ii+1] : res[ii];
end
endgenerate

assign a = ((state == STATE_COMPUTING) || (state == STATE_PRECOMP)) ? dataA : 16'b0;
assign dataWrite = res[0];
//assign write = sweep || (state == STATE_WRITE_RES);
assign write = (state == STATE_COMPUTING) || (state == STATE_ENDCOMP) || (state == STATE_WRITE_RES);

//wiring of registers for fixed N = 4
//is it possible to simplify this control?
assign next_b[0] = ((state == STATE_LOAD_B) && (cntB[1] == 0)) ? dataB : b[0];//((state != STATE_IDLE) ? b[0] : 16'b0);
assign next_b[1] = ((state == STATE_LOAD_B) && (cntB[1] == 0)) ? dataB1 : b[1];//((state != STATE_IDLE) ? b[1] : 16'b0);
assign next_b[2] = ((state == STATE_LOAD_B) && (cntB[1] == 1)) ? dataB : b[2];//((state != STATE_IDLE) ? b[2] : 16'b0);
assign next_b[3] = ((state == STATE_LOAD_B) && (cntB[1] == 1)) ? dataB1 : b[3];//((state != STATE_IDLE) ? b[3] : 16'b0);
//assign dataC_load = (state != STATE_IDLE) ? dataC : 13'b0;
//assign dataC1_load = (state != STATE_IDLE) ? dataC1 : 13'b0;
assign next_res[0] = ((state == STATE_LOAD_B) && (cntB[1] == 0)) ? dataC : ((state != STATE_IDLE) ? acc[0] : 16'b0);
assign next_res[1] = ((state == STATE_LOAD_B) && (cntB[1] == 0)) ? dataC1 : ((state != STATE_IDLE) ? acc[1] : 16'b0);
assign next_res[2] = ((state == STATE_LOAD_B) && (cntB[1] == 1)) ? dataC : ((state != STATE_IDLE) ? acc[2] : 16'b0);
assign next_res[3] = ((state == STATE_LOAD_B) && (cntB[1] == 1)) ? dataC1 : ((state != STATE_IDLE) ? acc[3] : 16'b0);

assign addressA = cntA;
assign addressB = cntB;
//assign addressC = ((state == STATE_COMPUTING) || (state == STATE_WRITE_RES)) ? (cntC-3'd4) : cntC;
// assign addressC = ((state == STATE_IDLE) || (state == STATE_LOAD_B)) ? cntC : (cntC-3'd4);
assign addressC = ((state == STATE_IDLE) || (state == STATE_LOAD_B)) ? {cntB} : cntC;
//assign addressC1 = ((state == STATE_COMPUTING) || (state == STATE_WRITE_RES)) ? cntC : {cntC[6:1], 1'b1};
// assign addressC1 = ((state == STATE_IDLE) || (state == STATE_LOAD_B)) ? {cntC[6:1], 1'b1} : cntC;
//wire [6:0] lockAddC1;
//assign lockAddC1 = cntB+62;
//assign addressC1 = (state == STATE_WRITE_RES) ? {lockAddC1[6:1], 1'b1} : (((state == STATE_IDLE) || (state == STATE_LOAD_B)) ? {cntB[5:1], 1'b1} : (cntC+3'd4));
assign addressC1 = ((state == STATE_IDLE) || (state == STATE_LOAD_B)) ? {cntB[5:1], 1'b1} : (cntC+3'd4);

//Combinatorial logic - FSM
integer index;
always @(*) 
    begin
        next_state <= state;
        next_cnt <= cnt;
        next_cntA <= cntA;
        next_cntB <= cntB;
        next_cntC <= cntC;
        sweep <= 0;
        reg_done <= 0;
        res[N_ALU] <= dataC1;//don't clock this
        case (state)
            STATE_IDLE:
                begin
                next_cnt <= 0;
                next_cntA <= 0;
                next_cntB <= 0;
                next_cntC <= 0;
                res[N_ALU] <= 0;//don-t clock this
                if (start == 1)
                begin
                    next_state <= STATE_LOAD_B;
                end
                else
                begin
                    next_state <= STATE_IDLE;
                end
                end
            STATE_LOAD_B:
                begin
                next_state <= STATE_LOAD_B;
                next_cntB <= cntB + 2;
                //next_cntC <= cntC + 2;
                next_cnt <= cnt+1;
                if (cnt == (LOAD_B_LATENCY-1)) begin
                    next_state <= STATE_PRECOMP;
                    next_cntA <= cntA+1;
                    next_cnt <= 0;
                end
                end
            STATE_PRECOMP:
                begin
                    next_state <= STATE_PRECOMP;
                    next_cntA <= cntA+1;
                    next_cnt <= cnt+1;
                    if (cnt == 3) begin
                        next_state <= STATE_COMPUTING;
                    end
                end
            STATE_COMPUTING:
                begin
                    next_state <= STATE_COMPUTING;
                    next_cntA <= cntA+1;
                    next_cntC <= cntC+1;
                    sweep <= 1;
                    if (cntA == 6'd0) begin
                        next_state <= STATE_ENDCOMP;
                        next_cntA <= cntA;
                    end
                end
            STATE_ENDCOMP:
                begin
                    next_state <= STATE_ENDCOMP;
                    next_cntA <= cntA;
                    next_cntC <= cntC+1;
                    next_cnt <= cnt+1;
                    sweep <= 1;
                    if (cnt == 3) begin
                        next_state <= STATE_WRITE_RES;
                    end
                end
            STATE_WRITE_RES:
                begin
                    next_state <= STATE_WRITE_RES;
                    next_cnt <= cnt+1;
                    next_cntC <= cntC + 1;
                    sweep <= 1;
                    if (cnt == 2) begin
                        next_cnt <= 0;
                        next_cntC <= cntC - 62;
                        if (cntB == 0) begin
                            next_state <= STATE_IDLE;
                            reg_done <= 1;
                        end else begin
                            next_state <= STATE_LOAD_B;
                        end
                    end 
                end
        endcase
    end

assign done = reg_done;
//Synchronous logic to update state and registers
always @(posedge clk)
begin
    cntA <= next_cntA;
    cntB <= next_cntB;
    cntC <= next_cntC;
    for (index=0; index<N_ALU; index=index+1) begin
        b[index] <= next_b[index];
        res[index] <= next_res[index];
    end
end

always @(posedge clk)
begin
    if (resetn==1'b0)
    begin
        cnt <= 0;
        state <= STATE_IDLE;
    end
    else
    begin
        cnt <= next_cnt;
        state <= next_state;
    end
end

endmodule