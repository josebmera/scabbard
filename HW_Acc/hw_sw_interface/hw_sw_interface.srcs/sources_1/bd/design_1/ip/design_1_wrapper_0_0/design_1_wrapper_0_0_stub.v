// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Wed Nov 27 18:51:26 2019
// Host        : xellos running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/jose/vivado/hw_sw_interface/hw_sw_interface.srcs/sources_1/bd/design_1/ip/design_1_wrapper_0_0/design_1_wrapper_0_0_stub.v
// Design      : design_1_wrapper_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "wrapper,Vivado 2018.1" *)
module design_1_wrapper_0_0(clock, resetn, poly_bram_address, 
  poly_bram_din, poly_bram_we, poly_bram_dout, command0, status0)
/* synthesis syn_black_box black_box_pad_pin="clock,resetn,poly_bram_address[11:0],poly_bram_din[63:0],poly_bram_we,poly_bram_dout[63:0],command0[31:0],status0[31:0]" */;
  input clock;
  input resetn;
  input [11:0]poly_bram_address;
  input [63:0]poly_bram_din;
  input poly_bram_we;
  output [63:0]poly_bram_dout;
  input [31:0]command0;
  output [31:0]status0;
endmodule
