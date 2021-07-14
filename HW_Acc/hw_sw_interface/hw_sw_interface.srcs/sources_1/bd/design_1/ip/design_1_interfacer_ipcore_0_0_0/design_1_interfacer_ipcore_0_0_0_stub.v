// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Fri Apr  5 14:48:35 2019
// Host        : xellos running 64-bit Ubuntu 16.04.6 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top design_1_interfacer_ipcore_0_0_0 -prefix
//               design_1_interfacer_ipcore_0_0_0_ design_1_interfacer_ipcore_0_0_0_stub.v
// Design      : design_1_interfacer_ipcore_0_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "interfacer_v1_0,Vivado 2018.1" *)
module design_1_interfacer_ipcore_0_0_0(poly_bram_address, poly_bram_din, 
  poly_bram_we, poly_bram_dout, command0, status0, m00_axis_tdata, m00_axis_tkeep, 
  m00_axis_tlast, m00_axis_tvalid, m00_axis_tready, m00_axis_aclk, m00_axis_aresetn, 
  s00_axis_tdata, s00_axis_tkeep, s00_axis_tlast, s00_axis_tvalid, s00_axis_tready, 
  s00_axis_aclk, s00_axis_aresetn, s00_axi_awaddr, s00_axi_awprot, s00_axi_awvalid, 
  s00_axi_awready, s00_axi_wdata, s00_axi_wstrb, s00_axi_wvalid, s00_axi_wready, 
  s00_axi_bresp, s00_axi_bvalid, s00_axi_bready, s00_axi_araddr, s00_axi_arprot, 
  s00_axi_arvalid, s00_axi_arready, s00_axi_rdata, s00_axi_rresp, s00_axi_rvalid, 
  s00_axi_rready, s00_axi_aclk, s00_axi_aresetn)
/* synthesis syn_black_box black_box_pad_pin="poly_bram_address[11:0],poly_bram_din[63:0],poly_bram_we,poly_bram_dout[63:0],command0[31:0],status0[31:0],m00_axis_tdata[63:0],m00_axis_tkeep[7:0],m00_axis_tlast,m00_axis_tvalid,m00_axis_tready,m00_axis_aclk,m00_axis_aresetn,s00_axis_tdata[63:0],s00_axis_tkeep[7:0],s00_axis_tlast,s00_axis_tvalid,s00_axis_tready,s00_axis_aclk,s00_axis_aresetn,s00_axi_awaddr[5:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[5:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready,s00_axi_aclk,s00_axi_aresetn" */;
  output [11:0]poly_bram_address;
  output [63:0]poly_bram_din;
  output poly_bram_we;
  input [63:0]poly_bram_dout;
  output [31:0]command0;
  input [31:0]status0;
  output [63:0]m00_axis_tdata;
  output [7:0]m00_axis_tkeep;
  output m00_axis_tlast;
  output m00_axis_tvalid;
  input m00_axis_tready;
  input m00_axis_aclk;
  input m00_axis_aresetn;
  input [63:0]s00_axis_tdata;
  input [7:0]s00_axis_tkeep;
  input s00_axis_tlast;
  input s00_axis_tvalid;
  output s00_axis_tready;
  input s00_axis_aclk;
  input s00_axis_aresetn;
  input [5:0]s00_axi_awaddr;
  input [2:0]s00_axi_awprot;
  input s00_axi_awvalid;
  output s00_axi_awready;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_wstrb;
  input s00_axi_wvalid;
  output s00_axi_wready;
  output [1:0]s00_axi_bresp;
  output s00_axi_bvalid;
  input s00_axi_bready;
  input [5:0]s00_axi_araddr;
  input [2:0]s00_axi_arprot;
  input s00_axi_arvalid;
  output s00_axi_arready;
  output [31:0]s00_axi_rdata;
  output [1:0]s00_axi_rresp;
  output s00_axi_rvalid;
  input s00_axi_rready;
  input s00_axi_aclk;
  input s00_axi_aresetn;
endmodule
