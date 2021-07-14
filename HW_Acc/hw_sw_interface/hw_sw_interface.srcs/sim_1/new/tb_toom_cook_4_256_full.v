`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.12.2018 15:16:06
// Design Name: 
// Module Name: tb_toom_cook_4_256_full
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

module tb_toom_cook_4_256_full();

reg clk;
// TC
reg start;
reg start_interp;
reg resetn;
wire [63:0] din;//
reg poly_reduce;
reg initial_cl;
wire done;
wire [7:0] read_addr;
wire [9:0] write_addr;
wire write;
wire [15:0] data_out;
// BRAM
wire weamax, webmax;//
wire [11:0] addramax;//
wire [9:0] addrbmax;//
wire [15:0] dinamax;//
wire [63:0] dinbmax;//
wire [63:0] doutamax;
wire [63:0] doutbmax;

// Instantiating TC
toom_cook_4_256_full toom_cook_4_256_full_inst (
    .start(start),
    .start_interp(start_interp),
    .resetn(resetn),
    .clk(clk),
    .data_in(din),
    .poly_reduce(poly_reduce),
    .initial_cl(initial_cl),
    .done(done),
    .read_addr(read_addr),
    .write_addr(write_addr),
    .write(write),
    .data_out(data_out)
    );
// Instantiating BRAM
blk_mem_tdp_max bram_tdp_max_inst (
    .clka(clk),
    .wea(weamax),
    .addra(addramax),
    .dina(dinamax),
    .douta(doutamax),
    .clkb(clk),
    .web(webmax),
    .addrb(addrbmax),
    .dinb(dinbmax),
    .doutb(doutbmax)
);

// Generate Clock
initial begin
    clk = 0;
    forever #`CLK_HALF clk = ~clk;
end

// Registers for test
reg [11:0] address;
reg [63:0] data_in;
reg wen, web;
reg [12:0] length;
reg finish;

// Connections of wires
assign din = doutbmax;//Port B for reading
assign addramax = write ? write_addr : address;//Write in port A from TC or from simulation
assign addrbmax = (wen || finish) ? address : read_addr;//Port B for reading from TC and writing from simulation
//assign addramax = address;//Write in port A from simulation
assign weamax = write;//Port A for writing from TC
assign webmax = wen;//Write in port A/B from simulation
assign dinbmax = data_in;//Write in port A/B from simulation
assign dinamax = data_out;


// Initialize input signals to zero
initial begin
    length <= 64;//256;

    finish <= 0;

    start    <= 0;
    poly_reduce <= 0;
    start_interp <= 0;
    initial_cl <= 0;
//    din <= doutbmax;//Port B for reading
//    weamax <= wen;//Write in port A from simulation
    //webmax <= 0;
//    addramax <= address;//Write in port A from simulation
//    addrbmax <= read_addr;//Port B for reading
//    dinamax <= data_in;//Write in port A from simulation
//    dinbmax <= 0;
    address <= 0;
    data_in <= 0;
    wen <= 0;
    web <= 0;
end


// Reset the circuit
initial begin
    resetn = 0;
    #`RESET_TIME
    resetn = 1;
end

// counter up to n and reset count
task counter;
    input [11:0] n;
    begin
        repeat(n)@(posedge clk)
        begin
            address <= address + 1;
        end
        address <= address - n + 1;
    end
endtask

// task for loading coeff into n positions of memory
task perform_load_mem;
    input [63:0] coeff;
    input [11:0] n;
    begin
        wen <= 0;
        #`CLK_PERIOD;
        data_in <= coeff;
        wen    <= 1;
        #`CLK_PERIOD;
        repeat(n)@(posedge clk)
        begin
            address <= address + 1;
            //data_in <= data_in + 1;//64'h0001000100010001
//            if (address == 5) begin
//                web <= 1;
//                wen <= 0;
//            end else begin
//                web <= 0;
//                wen <= 1;
//            end
        end
        address <= address - n + 1;
        data_in <= 0;
        wen    <= 0;
    end
endtask

//Test data
initial begin
    #`RESET_TIME

    $display("\nFirst test\n");
    // You can generate your own with test vector generator python script
    address <= 0;
    data_in <= 0;
    wen <= 0;
    web <= 0;

    perform_load_mem(64'h0001000100010001, length);//load_a
    address <= length;
    perform_load_mem(64'h0001000100010001, length);//load_b
    address <= 2*length;

    #`CLK_PERIOD;
    start<=1;
    initial_cl<=1;
    #`CLK_PERIOD;
    start<=0;
    
    wait (done==1);

    initial_cl<=0;
//    finish <= 1;
    //#`CLK_PERIOD;
    //#`CLK_PERIOD;
    //#`CLK_PERIOD;
    start_interp<=1;
    #`CLK_PERIOD;
    start_interp<=0;
    #`CLK_PERIOD;
    wait (done==1);
//    counter(2*length);
//    address <= 0;
    #`CLK_PERIOD;
    #`CLK_PERIOD;
    #`CLK_PERIOD;

    $display("\ndone\n");
    #`CLK_PERIOD;
    $finish;
end

endmodule