`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2019 08:58:13 AM
// Design Name: 
// Module Name: wrapper
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


module wrapper # (
        parameter integer BRAM_DATA_WIDTH = 64,
        parameter integer BRAM_ADDR_WIDTH = 12,
        
        parameter integer REG_DATA_WIDTH  = 32,

        parameter integer COEFF_WIDTH     = 16
    )
    (
        input  wire                        clock,
        input  wire                        resetn,
        
        input  wire [BRAM_ADDR_WIDTH-1:0]  poly_bram_address, 
        input  wire [BRAM_DATA_WIDTH-1:0]  poly_bram_din,
        input  wire                        poly_bram_we,
        output wire [BRAM_DATA_WIDTH-1:0]  poly_bram_dout,
        
        input  wire [REG_DATA_WIDTH-1:0]   command0,
        output wire [REG_DATA_WIDTH-1:0]   status0        
    );

//    blk_mem_gen_0 bram (
//      .clka         (clock             ),  // input wire clka
//      .wea          (poly_bram_we      ),  // input wire [0 : 0] wea
//      .addra        (poly_bram_address ),  // input wire [11 : 0] addra
//      .dina         (poly_bram_din     ),  // input wire [63 : 0] dina
//      .douta        (poly_bram_dout    )   // output wire [63 : 0] douta
//    );

reg start_tc, start_interp, poly_reduce, initial_cl;
wire done_tc;
wire w_res;
wire [BRAM_ADDR_WIDTH-1:0] w_addr;
wire [COEFF_WIDTH-1:0] w_data;

wire [7:0] r_tc;
wire [9:0] addrb;//poly_bram_address or r_tc if bram used by TC
wire web;//poly_bram_we or 0 if bram used by TC
reg busy_bram;

assign addrb = busy_bram ? {2'b0, r_tc} : poly_bram_address;
assign web = busy_bram ? 1'b0 : poly_bram_we;
assign w_addr[11:10] = 2'b0;

toom_cook_4_256_full toom_cook_4_256_full_inst (
    .start(start_tc),
    .start_interp(start_interp),
    .resetn(resetn),
    .clk(clock),
    .data_in(poly_bram_dout),
    .poly_reduce(poly_reduce),
    .initial_cl(initial_cl),
    .done(done_tc),
    .read_addr(r_tc),
    .write_addr(w_addr[9:0]),
    .write(w_res),
    .data_out(w_data)
    );

blk_mem_tdp_max bram_tdp_max_inst (
    .clka(clock),
    .wea(w_res),
    .addra(w_addr),//[11:0]
    .dina(w_data),
    .douta(),//unconnected
    .clkb(clock),
    .web(web),
    .addrb(addrb),//[9:0]
    .dinb(poly_bram_din),
    .doutb(poly_bram_dout)
);

localparam STATE_BITS          = 4;
localparam STATE_WAIT_FOR_CMD  = 4'd0,
           STATE_EVAL_CL       = 4'd1,
           STATE_EVAL_ACC      = 4'd2,
           STATE_INTERP        = 4'd4,
           STATE_WAIT_DONE_CL  = 4'd5,
           STATE_WAIT_DONE     = 4'd6,
           STATE_MULT_CL       = 4'd7,
           STATE_MULT_ACC      = 4'd8,
           STATE_WAIT_MULT_CL  = 4'd9,
           STATE_WAIT_MULT_ACC = 4'd10,
           STATE_WAIT_CMD_RST  = 4'd11;
reg [STATE_BITS-1:0] state, next_state;

localparam CMD_NOP        = 8'd0,
           CMD_SEND_POLY  = 8'd1,
           CMD_READ_POLY  = 8'd2,
           CMD_SEND_2POLY = 8'd3,
           CMD_READ_2POLY = 8'd4,
           CMD_SEND_3POLY = 8'd5,
           CMD_READ_3POLY = 8'd6,
           CMD_SEND_9POLY = 8'd7,
           CMD_READ_9POLY = 8'd8,
           CMD_SEND_BRAM  = 8'd9,
           CMD_READ_BRAM  = 8'd10,
           CMD_MULT_123   = 8'd11,
           CMD_MAC_123    = 8'd12,
           CMD_EV_123     = 8'd13,
           CMD_EV_ACC_123 = 8'd14,
           CMD_INTERP     = 8'd15;

always @(*)
begin
    busy_bram <= 0;
    start_tc <= 0;
    start_interp <= 0;
    poly_reduce <= 0;
    initial_cl <= 0;
    //w_addr[11:10] <= 2'b0;
    next_state <= state;
    case (state)
        STATE_WAIT_FOR_CMD:
        begin
            case (command0)
                CMD_MULT_123:
                begin
                    next_state <= STATE_MULT_CL;
                end
                CMD_MAC_123:
                begin
                    next_state <= STATE_MULT_ACC;
                end
                CMD_EV_123:
                begin
                    next_state <= STATE_EVAL_CL;
                end
                CMD_EV_ACC_123:
                begin
                    next_state <= STATE_EVAL_ACC;
                end
                CMD_INTERP:
                begin
                    next_state <= STATE_INTERP;
                end
                default:
                    next_state <= STATE_WAIT_FOR_CMD;
            endcase
        end
        STATE_MULT_CL:
        begin
            busy_bram <= 1;
            start_tc <= 1;
            initial_cl <= 1;
            next_state <= STATE_WAIT_MULT_CL;
        end
        STATE_MULT_ACC:
        begin
            busy_bram <= 1;
            start_tc <= 1;
            next_state <= STATE_WAIT_MULT_ACC;
        end
        STATE_EVAL_CL:
        begin
            busy_bram <= 1;
            start_tc <= 1;
            initial_cl <= 1;
            next_state <= STATE_WAIT_DONE_CL;
        end
        STATE_EVAL_ACC:
        begin
            busy_bram <= 1;
            start_tc <= 1;
            next_state <= STATE_WAIT_DONE;
        end
        STATE_INTERP:
        begin
            busy_bram <= 1;
            start_interp <= 1;
            next_state <= STATE_WAIT_DONE;
        end
        STATE_WAIT_MULT_CL:
        begin
            busy_bram <= 1;
            initial_cl <= 1;
            if (done_tc)
            begin
                next_state <= STATE_INTERP;
            end
        end
        STATE_WAIT_MULT_ACC:
        begin
            busy_bram <= 1;
            if (done_tc)
            begin
                next_state <= STATE_INTERP;
            end
        end
        STATE_WAIT_DONE_CL:
        begin
            busy_bram <= 1;
            initial_cl <= 1;
            if (done_tc)
            begin
                next_state <= STATE_WAIT_CMD_RST;
            end
        end
        STATE_WAIT_DONE:
        begin
            busy_bram <= 1;
            if (done_tc)
            begin
                next_state <= STATE_WAIT_CMD_RST;
            end
        end
        STATE_WAIT_CMD_RST:
        begin
            if (command0 == 32'h0)
            begin
                next_state <= STATE_WAIT_FOR_CMD;
            end
        end
        default: next_state <= STATE_WAIT_FOR_CMD;
    endcase
end

always @(posedge clock)
begin
    if (resetn==1'b0)
    begin
        state <= STATE_WAIT_FOR_CMD;
    end
    else
    begin
        state <= next_state;
    end
end

    assign status0 = (state != STATE_WAIT_FOR_CMD && state != STATE_WAIT_CMD_RST) ? {31'h0, busy_bram} : 32'h55;
    
endmodule