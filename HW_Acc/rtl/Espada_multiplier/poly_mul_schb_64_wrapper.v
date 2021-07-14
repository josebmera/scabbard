`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2018 05:52:35 PM
// Design Name: 
// Module Name: poly_mul_schb_64_wrapper
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


module poly_mul_schb_64_wrapper(
    input start,
    input resetn,
    input clk,
    input [6:0] address,
    input [15:0] data_in,
    input write_en,
    input clres,
    output [15:0] data_out,
    output done
    );

//States for the control
localparam STATE_MEMORY_OP = 1'b0,
           STATE_COMPUTING = 1'b1;    
//Registers
reg  state, next_state;

wire [15:0] dataA, dataB, dataC, dataD, dataD_in, dataB1, dataC1;
wire [5:0] addr_a, addr_a_mem, addr_b, addr_b_mem, addr_b_mem1;
wire [6:0] addr_c, addr_c_mem, addr_c_mem1, addr_c1;
wire write_a, write_b, write_c, write_res;

assign data_out = dataC;

dist_mem_gen_0 dist_mem_gen_0_inst_a ( .a(addr_a_mem), .d(data_in), .clk(clk), .we(write_a), .spo(dataA) );
dist_mem_gen_1 dist_mem_gen_1_inst_b ( .a(addr_b_mem), .d(data_in), .dpra(addr_b_mem1), .clk(clk), .we(write_b), .spo(dataB), .dpo(dataB1) );
dist_mem_gen_2 dist_mem_gen_2_inst_c ( .a(addr_c_mem), .d(dataD_in), .dpra(addr_c_mem1), .clk(clk), .we(write_c), .spo(dataC), .dpo(dataC1) );

assign write_a = write_en & (~ address[6]);
assign write_b = write_en & address[6];

assign addr_a_mem = write_a ? address[5:0] : addr_a;
assign addr_b_mem = write_b ? address[5:0] : addr_b;
assign addr_c_mem = (state == STATE_MEMORY_OP) ? address[6:0] : addr_c;

assign addr_b_mem1 = {addr_b_mem[5:1], 1'b1};
//assign addr_c_mem1 = (state == STATE_MEMORY_OP) ? {addr_c_mem[5:1], 1'b1} : addr_c1;//if i extend output
assign addr_c_mem1 = addr_c1;
assign write_c = clres | write_res;
assign dataD_in = clres ? 13'b0 : dataD;

poly_mul_schb_64_4_custom poly_mul_schb_64_inst(.resetn(resetn), .clk(clk), .start(start),
                    .dataA(dataA), .dataB(dataB), .dataB1(dataB1), .dataC(dataC), .dataC1(dataC1),
                    .addressA(addr_a), .addressB(addr_b), .addressC(addr_c), .addressC1(addr_c1),
                    .dataWrite(dataD), .write(write_res), .done(done)
                    );

//Combinatorial logic - FSM
always @(*) 
    begin
    next_state <= state;
    case (state)
        STATE_MEMORY_OP:
            begin
            if (start == 1)
            begin
                next_state <= STATE_COMPUTING;
            end
            else
            begin
                next_state <= STATE_MEMORY_OP;
            end
            end
        STATE_COMPUTING:
            begin
            if (done == 1)
            begin
                next_state <= STATE_MEMORY_OP;
            end
            else
            begin
                next_state <= STATE_COMPUTING;
            end
            end
    endcase
    end

//Synchronous logic to update state and registers
always @(posedge clk)
begin
    if (resetn==1'b0)
    begin
        state <= STATE_MEMORY_OP;
    end
    else
    begin
        state <= next_state;
    end
end

endmodule