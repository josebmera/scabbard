`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2018 04:54:40 PM
// Design Name: 
// Module Name: tb_poly_mul_schb_64_wrapper
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


`define RESET_TIME 25
`define CLK_PERIOD 10
`define CLK_HALF 5

module tb_poly_mul_schb_64();

// Define internal regs and wires
reg resetn;
reg clk;
reg start;
reg [15:0] dataA;
reg [15:0] dataB;
reg [15:0] dataB1;
reg [15:0] dataC;
reg [15:0] dataC1;
wire [5:0] addressA;
wire [5:0] addressB;
wire [6:0] addressC;
wire [6:0] addressC1;
wire [15:0] dataWrite;
wire write;
wire done;

// Instantiating module
poly_mul_schb_64_4 poly_mul_schb_64_inst(
    .resetn(resetn),
    .clk(clk),
    .start(start),
    .dataA(dataA),
    .dataB(dataB),
    .dataB1(dataB1),
    .dataC(dataC),
    .dataC1(dataC1),
    .addressA(addressA),
    .addressB(addressB),
    .addressC(addressC),
    .addressC1(addressC1),
    .dataWrite(dataWrite),
    .write(write),
    .done(done)
    );

// Generate Clock
initial begin
    clk = 0;
    forever #`CLK_HALF clk = ~clk;
end

// Initialize signals to zero
initial begin
    start    <= 0;
    dataA    <= 16'd1;
    dataB    <= 16'd1;
    dataB1   <= 16'd1;
    dataC    <= 16'd0;
    dataC1   <= 16'd0;
end

// Reset the circuit
initial begin
    resetn = 0;
    #`RESET_TIME
    resetn = 1;
end

//task perform_load_a_b;
//    input [12:0] coeff;
//    begin
//        start    <= 0;
//        address  <= 0;
//        data_in  <= 0;
//        write_en <= 0;
//        #`CLK_PERIOD;
//        data_in  <= coeff;
//        write_en <= 1;
//        #`CLK_PERIOD;
//        repeat(128)@(posedge clk)
//        begin
//            address <= address + 1;
//        end
//        write_en <= 0;
//        data_in  <= 0;
//    end
//endtask

//Test data
initial begin

    #`RESET_TIME
    
    $display("\nFirst test\n");
    // You can generate your own with test vector generator python script
    start    <= 0;
    dataA    <= 16'd1;
    dataB    <= 16'd1;
    dataB1   <= 16'd1;
    dataC    <= 16'd0;
    dataC1   <= 16'd0;
    
//    perform_load_a_b(13'h1);
    #`CLK_PERIOD;
    start<=1;
    #`CLK_PERIOD;
    start<=0;
    
    wait (done==1);
    #`CLK_PERIOD;   

//    perform_load_a_b(13'h1);
    #`CLK_PERIOD;
    start<=1;
    #`CLK_PERIOD;
    start<=0;
    wait (done==1);
    #`CLK_PERIOD;

    $display("\ndone\n");
    
    #`CLK_PERIOD;     

    $finish;
end

endmodule