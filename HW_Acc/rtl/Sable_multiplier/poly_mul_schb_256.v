`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2020 12:12:41
// Design Name: 
// Module Name: poly_mul_schb_256
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


module poly_mul_schb_256(
    input resetn,
    input clk,
    input start,
    input wb,
    input [15:0] data_in,
    output done,
    output [8:0] r_addr,
    output [9:0] w_addr,
    output write,
    output [15:0] data_out
    );

parameter N = 256;
parameter COEFF_WIDTH = 16;//13;

localparam STATE_IDLE       = 3'd0,
           STATE_LOAD_S     = 3'd2,
           STATE_COMPUTE    = 3'd3,
           STATE_WRITE_BACK = 3'd1;
reg [1:0] state, next_state;

//Datapath
wire [(COEFF_WIDTH-1):0] next_a[(N-1):0];
wire [(COEFF_WIDTH-1):0] signed_a[(N-1):0];
wire [(COEFF_WIDTH-1):0] next_res[(N-1):0];
wire [(COEFF_WIDTH-1):0] rst_res[(N-1):0];
reg [(COEFF_WIDTH-1):0] res[N:0];
wire [(2*N-1):0] s;

//Control signals
reg [4:0] addr_b, next_addr_b, addr_b_reg;
reg rstn_res, load_b, shift_b, reg_done, en;
reg [8:0] cnt, next_cnt;

//Shift register for the secret
s_shift_reg s_shift_reg_inst (.resetn(resetn), .clk(clk), .load(load_b), .addr(addr_b_reg), .data_in(data_in), .shift(shift_b), .out(s));

genvar             ii;
generate
for (ii=0; ii<N; ii=ii+1) 
begin
    assign next_a[ii] = s[2*ii+1] ? ~data_in : data_in;
    assign signed_a[ii] = next_a[ii] + res[ii] + s[2*ii+1];
    assign rst_res[ii] = rstn_res ? res[ii] : res[ii+1];
    assign next_res[ii] = (s[2*ii] & en) ? signed_a[ii] : rst_res[ii];
end
endgenerate

assign write = ~rstn_res;
assign data_out = res[0];
assign done = reg_done;

assign r_addr = ((state == STATE_IDLE) | ((state == STATE_LOAD_S) & (addr_b != 0))) ? {4'b1000, addr_b} : cnt;
assign w_addr = {1'b1, cnt};

always @(*) 
    begin
        next_state <= state;
        rstn_res <= 1;
        en <= 0;
        load_b <= 0;
        shift_b <= 0;
        reg_done <= 0;
        res[N] <= 0;
        next_cnt <= 0;
        next_addr_b <= 0;
        case (state)
            STATE_IDLE:
            begin
                if (start) begin
                    next_state <= STATE_LOAD_S;
                    next_addr_b <= addr_b+1;
                end else begin
                    if (wb) begin
                        next_state <= STATE_WRITE_BACK;
                    end
                end
            end
            STATE_LOAD_S:
            begin
                next_addr_b <= addr_b+1;
                load_b <= 1;
                if (addr_b == 0) begin
                    next_state <= STATE_COMPUTE;
                    next_addr_b <= 0;
                    next_cnt <= cnt+1;
                end
            end
            //STATE_SYNC:
            //begin
            //    shift_b <= 1;
            //    next_state <= STATE_COMPUTE;
            //end
            STATE_COMPUTE:
            begin
                next_cnt <= cnt+1;
                shift_b <= 1;
                en <= 1;
                if (cnt[8] == 1) begin
                    next_state <= STATE_IDLE;
                    reg_done <= 1;
                    next_cnt <= 0;
                end
            end
            STATE_WRITE_BACK:
            begin
                next_cnt <= cnt+1;
                rstn_res <= 0;
                if (cnt == 9'h1FF) begin
                    next_state <= STATE_IDLE;
                    reg_done <= 1;
                end
            end
        endcase
    end

//Synchronous logic to update state and registers
integer index;
always @(posedge clk)
begin
    if (resetn==1'b0)
    begin
        for (index=0; index<N; index=index+1) begin
            res[index] <= 0;
        end
    end
    else
    begin
        cnt <= next_cnt;
        addr_b <= next_addr_b;
        addr_b_reg <= addr_b;
        for (index=0; index<N; index=index+1) begin
            res[index] <= next_res[index];
        end
    end
end

always @(posedge clk)
begin
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


module s_shift_reg(
    input resetn,
    input clk,
    input load,
    input [4:0] addr,
    input [15:0] data_in,
    input shift,
    output [511:0] out
    );

parameter N_s = 512;

reg [(N_s-1):0] sr;
wire [(N_s-1):0] next_sr, load_sr, sel_sr, d_r;

dist_mem_loadsr dist_mem_loadsr_inst(.a(~addr), .spo(load_sr));

genvar             i;

generate
for (i=0; i<N_s; i=i+16)
begin
    assign d_r[(i+15):i] = data_in;
end
endgenerate

generate
for (i=2; i<N_s; i=i+2) 
begin
    assign sel_sr[i] = shift ? sr[i-2] : sr[i];
    assign sel_sr[i+1] = shift ? sr[i-1] : sr[i+1];
    assign next_sr[i] = (load & load_sr[i]) ? d_r[i] : sel_sr[i];
    assign next_sr[i+1] = (load & load_sr[i+1]) ? d_r[i+1] : sel_sr[i+1];
end
endgenerate
assign sel_sr[0] = shift ? sr[N_s-2] : sr[0];
assign sel_sr[1] = shift ? ~sr[N_s-1] : sr[1];
assign next_sr[0] = (load & load_sr[0]) ? d_r[0] : sel_sr[0];
assign next_sr[1] = (load & load_sr[1]) ? d_r[1] : sel_sr[1];

integer ii;
always @(posedge clk)
begin
    if (resetn==1'b0) begin
        for (ii=0; ii<N_s; ii=ii+1) begin
            sr[ii] <= 0;
        end
    end else begin
        for (ii=0; ii<N_s; ii=ii+1) begin
            sr[ii] <= next_sr[ii];
        end
    end
end

assign out = sr;

endmodule



module poly_mul_schb_256_slow(
    input resetn,
    input clk,
    input start,
    input [15:0] data_in,
    output done,
    output [8:0] r_addr,
    output [9:0] w_addr,
    output write,
    output [15:0] data_out
    );

parameter N = 256;
parameter COEFF_WIDTH = 16;//13;

localparam STATE_IDLE       = 4'd0,
           STATE_LOAD_A     = 4'd1,
           STATE_LOAD_B     = 4'd2,
           STATE_SYNC       = 4'd3,
           STATE_SHIFT_B    = 4'd4,
           STATE_FLUSH      = 4'd5;
reg [2:0] state, next_state;

//Datapath
wire [(COEFF_WIDTH-1):0] next_a[(N-1):0];
reg [(COEFF_WIDTH-1):0] a[N:0];
wire [(COEFF_WIDTH-1):0] signed_a[(N-1):0];
wire [(COEFF_WIDTH-1):0] next_res[(N-1):0];
wire [(COEFF_WIDTH-1):0] reset_res[(N-1):0];
reg [(COEFF_WIDTH-1):0] res[N:0];
wire [1:0] b;

//Control signals
reg [4:0] addr_b, next_addr_b, addr_b_reg;
reg load_a, rstn_res, load_b, shift_b, reg_done;
reg [8:0] cnt, next_cnt;

b_shift_reg b_shift_reg_inst (.resetn(resetn), .clk(clk), .load(load_b), .addr(addr_b_reg), .data_in(data_in), .shift(shift_b), .b(b));

genvar             ii;
generate
for (ii=0; ii<N; ii=ii+1) 
begin
    assign next_a[ii] = load_a ? a[ii+1] : a[ii];
    assign signed_a[ii] = b[1] ?  (~a[ii]) : a[ii];
    // XXX - reset or result registers is only necessary once every power up, could it be opt'd out?
    assign reset_res[ii] = rstn_res ? res[ii+1] : 0;
    assign next_res[ii] = b[0] ? (signed_a[ii] + res[ii+1] + b[1]) : reset_res[ii];
end
endgenerate

assign write = shift_b;
assign data_out = res[0];
assign done = reg_done;

assign r_addr = (state == STATE_LOAD_B) ? {4'b1000, addr_b} : cnt;
assign w_addr = {1'b1, cnt};

always @(*) 
    begin
        next_state <= state;
        load_a <= 0;
        rstn_res <= 1;
        load_b <= 0;
        shift_b <= 0;
        reg_done <= 0;
        res[N] <= 0;
        a[N] <= data_in;
        next_cnt <= 0;
        next_addr_b <= 0;
        case (state)
            STATE_IDLE:
            begin
                if (start) begin
                    next_state <= STATE_LOAD_A;
                    next_cnt <= cnt+1;
                    rstn_res <= 0;
                end
            end
            STATE_LOAD_A:
            begin
                next_cnt <= cnt+1;
                load_a <= 1;
                if (cnt[8] == 1) begin
                    next_state <= STATE_LOAD_B;
                    next_cnt <= 0;
                    next_addr_b <= addr_b+1; 
                end
            end
            STATE_LOAD_B:
            begin
                next_addr_b <= addr_b+1;
                load_b <= 1;
                a[N] <= 0;
                if (addr_b == 0) begin
                    next_state <= STATE_SYNC;
                    next_addr_b <= 0;
                    //next_cnt <= cnt+1;
                end
            end
            STATE_SYNC:
            begin
                a[N] <= 0;
                shift_b <= 1;
                next_state <= STATE_SHIFT_B;
            end
            STATE_SHIFT_B:
            begin
                next_cnt <= cnt+1;
                shift_b <= 1;
                a[N] <= 0;
                if (cnt[8] == 1) begin
                    next_state <= STATE_FLUSH;
                end
            end
            STATE_FLUSH:
            begin
                next_cnt <= cnt+1;
                shift_b <= 1;
                a[N] <= 0;
                if (cnt == 9'h1FF) begin
                    next_state <= STATE_IDLE;
                    reg_done <= 1;
                end
            end
        endcase
    end

//Synchronous logic to update state and registers
integer index;
always @(posedge clk)
begin
    cnt <= next_cnt;
    addr_b <= next_addr_b;
    addr_b_reg <= addr_b;
    for (index=0; index<N; index=index+1) begin
        a[index] <= next_a[index];
        res[index] <= next_res[index];
    end
end

always @(posedge clk)
begin
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

module b_shift_reg(
    input resetn,
    input clk,
    input load,
    input [4:0] addr,
    input [15:0] data_in,
    input shift,
    output [1:0] b
    );

reg [513:0] sr;
wire [511:0] next_sr, load_sr, sel_sr, d_r;

dist_mem_loadsr dist_mem_loadsr_inst(.a(addr), .spo(load_sr));

genvar             i;

generate
for (i=0; i<512; i=i+16)
begin
    assign d_r[(i+15):i] = data_in;
end
endgenerate

generate
for (i=0; i<512; i=i+2) 
begin
    assign sel_sr[i] = shift ? sr[i+2] : sr[i];
    assign sel_sr[i+1] = shift ? sr[i+3] : sr[i+1];
    assign next_sr[i] = (load & load_sr[i]) ? d_r[i] : sel_sr[i];
    assign next_sr[i+1] = (load & load_sr[i+1]) ? d_r[i+1] : sel_sr[i+1];
end
endgenerate

integer ii;
always @(posedge clk)
begin
    sr[512] <= 0;
    sr[513] <= 0;
    if (resetn==1'b0) begin
        for (ii=0; ii<512; ii=ii+1) begin
            sr[ii] <= 0;
        end
    end else begin
        for (ii=0; ii<512; ii=ii+1) begin
            sr[ii] <= next_sr[ii];
        end
    end
end

assign b = sr[1:0];

endmodule
