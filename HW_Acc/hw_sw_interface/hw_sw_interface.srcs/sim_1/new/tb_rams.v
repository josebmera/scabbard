`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.01.2019 14:45:25
// Design Name: 
// Module Name: tb_brams
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

module tb_brams();

// Define internal regs and wires
reg clk;
reg weasp, weadp, weamax, webdp, webmax;
reg [9:0] addrasp, addradp;
reg [11:0] addramax;
reg [7:0] addrb;
reg [9:0] addrbmax;
reg [15:0] dinasp, dinadp, dinamax;
reg [63:0] dinbdp, dinbmax;
wire [63:0] doutasp, doutadp, doutamax;
wire [63:0] doutbdp, doutbmax;

blk_mem_sp_norst bram_sp_inst (
    .clka(clk),
    .wea(weasp),
    .addra(addrasp),
    .dina(dinasp),
    .douta(doutasp)
    );

blk_mem_tdp_norst bram_tdp_inst (
    .clka(clk),
    .wea(weadp),
    .addra(addradp),
    .dina(dinadp),
    .douta(doutadp),
    .clkb(clk),
    .web(webdp),
    .addrb(addrb),
    .dinb(dinbdp),
    .doutb(doutbdp)
    );

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

// Initialize input signals to zero
initial begin
    weasp <= 0;
    weadp <= 0;
    weamax <= 0;
    webdp <= 0;
    webmax <= 0;
    addrasp <= 0;
    addradp <= 0;
    addramax <= 0;
    addrb <= 0;
    addrbmax <= 0;
    dinasp <= 0;
    dinadp <= 0;
    dinamax <= 0;
    dinbdp <= 0;
    dinbmax <= 0;
end

// Registers for test
reg [11:0] address;
reg [63:0] data_in;
reg wen, web;

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
task perform_load_a;
    input [63:0] coeff;
    input [11:0] n;
    begin
        wen <= 0;
        #`CLK_PERIOD;
        data_in <= coeff;
        wen    <= 1;
        #`CLK_PERIOD;
        wen <=0;
        #`CLK_PERIOD;
        #`CLK_PERIOD;
        #`CLK_PERIOD;
        wen <=1;
        repeat(n)@(posedge clk)
        begin
            address <= address + 1;
            data_in <= data_in + 1;//64'h0001000100010001
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

    assign weasp = wen;
    assign addrasp = address[9:0];
    assign dinasp = data_in[15:0];
    assign weadp = wen;
    assign addradp = address[9:0];
    assign dinadp = data_in[15:0];
    assign weamax = wen;
    assign addramax = address;
    assign dinamax = data_in[15:0];
    assign addrb = address[7:0];
    assign addrbmax = address[9:0];
    assign dinbdp = data_in;
    assign dinbmax = 64'h0001000100010001;//dinbdp;
    assign webdp = web;
    assign webmax = webdp;

    perform_load_a(64'h0001000100010001, 128);//hard-coded input

    #`CLK_PERIOD;
//    wait (done==1);
    #`CLK_PERIOD;

    counter(128);

    $display("\ndone\n");
    #`CLK_PERIOD;
    $finish;
end

endmodule