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

module tb_poly_mul_schb_64_wrapper();

// Define internal regs and wires
reg start;
reg resetn;
reg clk;
reg [6:0] address;
reg [15:0] data_in;
reg write_en;
wire [15:0] data_out;
wire done;

// Instantiating module
poly_mul_schb_64_wrapper poly_mul_schb_64_wrapper_inst (
    .start(start),
    .resetn(resetn),
    .clk(clk),
    .address(address),
    .data_in(data_in),
    .write_en(write_en),
    .clres(write_en),
    .data_out(data_out),
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
    address  <= 0;
    data_in  <= 0;
    write_en <= 0;
end

// Reset the circuit
initial begin
    resetn = 0;
    #`RESET_TIME
    resetn = 1;
end

task perform_load_a_b;
    input [15:0] coeff;
    begin
        start    <= 0;
        address  <= 0;
        data_in  <= 0;
        write_en <= 0;
        #`CLK_PERIOD;
        data_in  <= coeff;
        write_en <= 1;
        #`CLK_PERIOD;
        repeat(128)@(posedge clk)
        begin
            address <= address + 1;
        end
        write_en <= 0;
        data_in  <= 0;
    end
endtask

//Test data
initial begin

    #`RESET_TIME
    
    $display("\nFirst test\n");
    // You can generate your own with test vector generator python script
    start    <= 0;
    address  <= 0;
    data_in  <= 0;
    write_en <= 0;
    
    perform_load_a_b(16'h1);
    #`CLK_PERIOD;
    start<=1;
    #`CLK_PERIOD;
    start<=0;
    
    wait (done==1);
    #`CLK_PERIOD;

    #`CLK_PERIOD;
    repeat(128)@(posedge clk)
    begin
        address <= address + 1;
    end  
    
    $display("\ndone\n");
    
    #`CLK_PERIOD;     

    $finish;
end

endmodule