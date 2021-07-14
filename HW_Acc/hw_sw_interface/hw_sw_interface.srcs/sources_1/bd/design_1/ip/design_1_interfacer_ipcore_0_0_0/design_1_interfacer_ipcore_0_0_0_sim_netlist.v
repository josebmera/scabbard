// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
// Date        : Fri Apr  5 14:48:35 2019
// Host        : xellos running 64-bit Ubuntu 16.04.6 LTS
// Command     : write_verilog -force -mode funcsim -rename_top design_1_interfacer_ipcore_0_0_0 -prefix
//               design_1_interfacer_ipcore_0_0_0_ design_1_interfacer_ipcore_0_0_0_sim_netlist.v
// Design      : design_1_interfacer_ipcore_0_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_interfacer_ipcore_0_0_0,interfacer_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "interfacer_v1_0,Vivado 2018.1" *) 
(* NotValidForBitStream *)
module design_1_interfacer_ipcore_0_0_0
   (poly_bram_address,
    poly_bram_din,
    poly_bram_we,
    poly_bram_dout,
    command0,
    status0,
    m00_axis_tdata,
    m00_axis_tkeep,
    m00_axis_tlast,
    m00_axis_tvalid,
    m00_axis_tready,
    m00_axis_aclk,
    m00_axis_aresetn,
    s00_axis_tdata,
    s00_axis_tkeep,
    s00_axis_tlast,
    s00_axis_tvalid,
    s00_axis_tready,
    s00_axis_aclk,
    s00_axis_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready,
    s00_axi_aclk,
    s00_axi_aresetn);
  output [11:0]poly_bram_address;
  output [63:0]poly_bram_din;
  output poly_bram_we;
  input [63:0]poly_bram_dout;
  output [31:0]command0;
  input [31:0]status0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TDATA" *) output [63:0]m00_axis_tdata;
  output [7:0]m00_axis_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TLAST" *) output m00_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TVALID" *) output m00_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS TREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 125000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef" *) input m00_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 M00_AXIS_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS_CLK, ASSOCIATED_BUSIF M00_AXIS, ASSOCIATED_RESET m00_axis_aresetn, FREQ_HZ 125000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0" *) input m00_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 M00_AXIS_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS_RST, POLARITY ACTIVE_LOW" *) input m00_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TDATA" *) input [63:0]s00_axis_tdata;
  input [7:0]s00_axis_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TLAST" *) input s00_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TVALID" *) input s00_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS TREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 125000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef" *) output s00_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXIS_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS_CLK, ASSOCIATED_BUSIF S00_AXIS, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 125000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0" *) input s00_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXIS_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS_RST, POLARITY ACTIVE_LOW" *) input s00_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [5:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [5:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 125000000, ID_WIDTH 0, ADDR_WIDTH 6, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *) input s00_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 125000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW" *) input s00_axi_aresetn;

  wire \<const0> ;
  wire \<const1> ;
  wire [31:0]command0;
  wire m00_axis_aclk;
  wire m00_axis_aresetn;
  wire m00_axis_tlast;
  wire m00_axis_tready;
  wire m00_axis_tvalid;
  wire [11:0]poly_bram_address;
  wire [63:0]poly_bram_dout;
  wire poly_bram_we;
  wire s00_axi_aclk;
  wire [5:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [5:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire s00_axi_wvalid;
  wire s00_axis_aclk;
  wire s00_axis_aresetn;
  wire [63:0]s00_axis_tdata;
  wire s00_axis_tlast;
  wire s00_axis_tready;
  wire s00_axis_tvalid;
  wire [31:0]status0;

  assign m00_axis_tdata[63:0] = poly_bram_dout;
  assign m00_axis_tkeep[7] = \<const1> ;
  assign m00_axis_tkeep[6] = \<const1> ;
  assign m00_axis_tkeep[5] = \<const1> ;
  assign m00_axis_tkeep[4] = \<const1> ;
  assign m00_axis_tkeep[3] = \<const1> ;
  assign m00_axis_tkeep[2] = \<const1> ;
  assign m00_axis_tkeep[1] = \<const1> ;
  assign m00_axis_tkeep[0] = \<const1> ;
  assign poly_bram_din[63:0] = s00_axis_tdata;
  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  design_1_interfacer_ipcore_0_0_0_interfacer_v1_0 inst
       (.command0(command0),
        .m00_axis_aclk(m00_axis_aclk),
        .m00_axis_aresetn(m00_axis_aresetn),
        .m00_axis_tlast(m00_axis_tlast),
        .m00_axis_tready(m00_axis_tready),
        .m00_axis_tvalid(m00_axis_tvalid),
        .poly_bram_address(poly_bram_address),
        .poly_bram_we(poly_bram_we),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[5:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[5:2]),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wvalid(s00_axi_wvalid),
        .s00_axis_aclk(s00_axis_aclk),
        .s00_axis_aresetn(s00_axis_aresetn),
        .s00_axis_tlast(s00_axis_tlast),
        .s00_axis_tready(s00_axis_tready),
        .s00_axis_tvalid(s00_axis_tvalid),
        .status0(status0));
endmodule

module design_1_interfacer_ipcore_0_0_0_interfacer_v1_0
   (command0,
    s00_axi_awready,
    s00_axi_wready,
    s00_axi_arready,
    s00_axi_rdata,
    poly_bram_we,
    s00_axis_tready,
    poly_bram_address,
    m00_axis_tlast,
    m00_axis_tvalid,
    s00_axi_rvalid,
    s00_axi_bvalid,
    s00_axis_tlast,
    s00_axis_tvalid,
    s00_axis_aresetn,
    s00_axis_aclk,
    m00_axis_tready,
    m00_axis_aresetn,
    m00_axis_aclk,
    s00_axi_wdata,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_araddr,
    status0,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_arvalid,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output [31:0]command0;
  output s00_axi_awready;
  output s00_axi_wready;
  output s00_axi_arready;
  output [31:0]s00_axi_rdata;
  output poly_bram_we;
  output s00_axis_tready;
  output [11:0]poly_bram_address;
  output m00_axis_tlast;
  output m00_axis_tvalid;
  output s00_axi_rvalid;
  output s00_axi_bvalid;
  input s00_axis_tlast;
  input s00_axis_tvalid;
  input s00_axis_aresetn;
  input s00_axis_aclk;
  input m00_axis_tready;
  input m00_axis_aresetn;
  input m00_axis_aclk;
  input [31:0]s00_axi_wdata;
  input s00_axi_aclk;
  input [3:0]s00_axi_awaddr;
  input [3:0]s00_axi_araddr;
  input [31:0]status0;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_arvalid;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire [31:0]command0;
  wire done_read;
  wire done_write;
  wire m00_axis_aclk;
  wire m00_axis_aresetn;
  wire m00_axis_tlast;
  wire m00_axis_tready;
  wire m00_axis_tvalid;
  wire [11:0]poly_bram_address;
  wire poly_bram_we;
  wire rAddress_next1;
  wire [11:1]rAddress_reg;
  wire registers_inst_n_38;
  wire registers_inst_n_39;
  wire registers_inst_n_40;
  wire registers_inst_n_41;
  wire registers_inst_n_42;
  wire registers_inst_n_43;
  wire registers_inst_n_44;
  wire registers_inst_n_45;
  wire registers_inst_n_46;
  wire registers_inst_n_47;
  wire registers_inst_n_48;
  wire registers_inst_n_49;
  wire registers_inst_n_5;
  wire registers_inst_n_50;
  wire registers_inst_n_51;
  wire registers_inst_n_52;
  wire registers_inst_n_53;
  wire registers_inst_n_54;
  wire registers_inst_n_55;
  wire registers_inst_n_56;
  wire registers_inst_n_57;
  wire registers_inst_n_58;
  wire registers_inst_n_59;
  wire registers_inst_n_60;
  wire registers_inst_n_61;
  wire registers_inst_n_62;
  wire registers_inst_n_63;
  wire registers_inst_n_64;
  wire registers_inst_n_65;
  wire registers_inst_n_66;
  wire registers_inst_n_67;
  wire registers_inst_n_68;
  wire registers_inst_n_69;
  wire registers_inst_n_70;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire s00_axi_wvalid;
  wire s00_axis_aclk;
  wire s00_axis_aresetn;
  wire s00_axis_tlast;
  wire s00_axis_tready;
  wire s00_axis_tvalid;
  wire [31:0]status0;
  wire streamer_inst_n_0;
  wire streamer_inst_n_1;
  wire streamer_inst_n_44;
  wire streamer_inst_n_47;
  wire [11:0]wAddrCounter_reg;
  wire [9:7]word_couter_reg;

  design_1_interfacer_ipcore_0_0_0_registers registers_inst
       (.DI(rAddress_next1),
        .\FSM_sequential_s_din_state_reg[0] (streamer_inst_n_44),
        .\FSM_sequential_s_din_state_reg[1] (registers_inst_n_39),
        .\FSM_sequential_s_dout_state_reg[1] (registers_inst_n_38),
        .O({registers_inst_n_47,registers_inst_n_48,registers_inst_n_49,registers_inst_n_50}),
        .Q(command0),
        .S(streamer_inst_n_47),
        .done_read(done_read),
        .done_read_reg(registers_inst_n_44),
        .done_read_reg_0(registers_inst_n_45),
        .done_read_reg_1(registers_inst_n_46),
        .done_write(done_write),
        .m00_axis_aresetn(m00_axis_aresetn),
        .out({streamer_inst_n_0,streamer_inst_n_1}),
        .rAddress_reg(rAddress_reg),
        .\rAddress_reg[11] (registers_inst_n_40),
        .\rAddress_reg[11]_0 (registers_inst_n_41),
        .\rAddress_reg[11]_1 ({registers_inst_n_55,registers_inst_n_56,registers_inst_n_57,registers_inst_n_58}),
        .\rAddress_reg[7] ({registers_inst_n_51,registers_inst_n_52,registers_inst_n_53,registers_inst_n_54}),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wvalid(s00_axi_wvalid),
        .status0(status0),
        .wAddrCounter_reg(wAddrCounter_reg),
        .\wAddrCounter_reg[11] ({registers_inst_n_67,registers_inst_n_68,registers_inst_n_69,registers_inst_n_70}),
        .\wAddrCounter_reg[3]_0 ({registers_inst_n_59,registers_inst_n_60,registers_inst_n_61,registers_inst_n_62}),
        .\wAddrCounter_reg[7] ({registers_inst_n_63,registers_inst_n_64,registers_inst_n_65,registers_inst_n_66}),
        .wAddrCounter_reg_3_sp_1(registers_inst_n_5),
        .word_couter_reg({word_couter_reg[9],word_couter_reg[7]}),
        .\word_couter_reg[31] (registers_inst_n_42),
        .\word_couter_reg[31]_0 (registers_inst_n_43));
  design_1_interfacer_ipcore_0_0_0_streamer streamer_inst
       (.DI(rAddress_next1),
        .\FSM_sequential_s_dout_state_reg[1]_0 (registers_inst_n_40),
        .\FSM_sequential_s_dout_state_reg[1]_1 (registers_inst_n_38),
        .O({registers_inst_n_47,registers_inst_n_48,registers_inst_n_49,registers_inst_n_50}),
        .S(streamer_inst_n_47),
        .command0({command0[8],command0[3:1]}),
        .done_read(done_read),
        .done_write(done_write),
        .m00_axis_aclk(m00_axis_aclk),
        .m00_axis_aresetn(m00_axis_aresetn),
        .m00_axis_tlast(m00_axis_tlast),
        .m00_axis_tready(m00_axis_tready),
        .m00_axis_tvalid(m00_axis_tvalid),
        .out({streamer_inst_n_0,streamer_inst_n_1}),
        .poly_bram_address(poly_bram_address),
        .poly_bram_we(poly_bram_we),
        .\rAddress_reg[11]_0 (rAddress_reg),
        .\rAddress_reg[11]_1 ({registers_inst_n_55,registers_inst_n_56,registers_inst_n_57,registers_inst_n_58}),
        .\rAddress_reg[7]_0 ({registers_inst_n_51,registers_inst_n_52,registers_inst_n_53,registers_inst_n_54}),
        .s00_axis_aclk(s00_axis_aclk),
        .s00_axis_aresetn(s00_axis_aresetn),
        .s00_axis_tlast(s00_axis_tlast),
        .s00_axis_tready(s00_axis_tready),
        .s00_axis_tvalid(s00_axis_tvalid),
        .\slv_reg0_reg[0] (registers_inst_n_45),
        .\slv_reg0_reg[14] (registers_inst_n_39),
        .\slv_reg0_reg[1] (registers_inst_n_44),
        .\slv_reg0_reg[1]_0 (registers_inst_n_46),
        .\slv_reg0_reg[2] ({registers_inst_n_59,registers_inst_n_60,registers_inst_n_61,registers_inst_n_62}),
        .\slv_reg0_reg[2]_0 (registers_inst_n_5),
        .\slv_reg0_reg[3] (registers_inst_n_42),
        .\slv_reg0_reg[3]_0 (registers_inst_n_43),
        .\slv_reg0_reg[6] (registers_inst_n_41),
        .wAddrCounter_reg(wAddrCounter_reg),
        .\wAddrCounter_reg[11]_0 ({registers_inst_n_67,registers_inst_n_68,registers_inst_n_69,registers_inst_n_70}),
        .\wAddrCounter_reg[3]_0 (streamer_inst_n_44),
        .\wAddrCounter_reg[7]_0 ({registers_inst_n_63,registers_inst_n_64,registers_inst_n_65,registers_inst_n_66}),
        .\word_couter_reg[11]_0 ({word_couter_reg[9],word_couter_reg[7]}));
endmodule

module design_1_interfacer_ipcore_0_0_0_registers
   (s00_axi_awready,
    s00_axi_wready,
    s00_axi_arready,
    s00_axi_bvalid,
    s00_axi_rvalid,
    wAddrCounter_reg_3_sp_1,
    Q,
    \FSM_sequential_s_dout_state_reg[1] ,
    \FSM_sequential_s_din_state_reg[1] ,
    \rAddress_reg[11] ,
    \rAddress_reg[11]_0 ,
    \word_couter_reg[31] ,
    \word_couter_reg[31]_0 ,
    done_read_reg,
    done_read_reg_0,
    done_read_reg_1,
    O,
    \rAddress_reg[7] ,
    \rAddress_reg[11]_1 ,
    \wAddrCounter_reg[3]_0 ,
    \wAddrCounter_reg[7] ,
    \wAddrCounter_reg[11] ,
    s00_axi_rdata,
    s00_axi_aclk,
    wAddrCounter_reg,
    \FSM_sequential_s_din_state_reg[0] ,
    out,
    m00_axis_aresetn,
    rAddress_reg,
    word_couter_reg,
    status0,
    done_write,
    done_read,
    DI,
    S,
    s00_axi_aresetn,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_bready,
    s00_axi_arvalid,
    s00_axi_rready,
    s00_axi_wdata,
    s00_axi_awaddr,
    s00_axi_araddr);
  output s00_axi_awready;
  output s00_axi_wready;
  output s00_axi_arready;
  output s00_axi_bvalid;
  output s00_axi_rvalid;
  output wAddrCounter_reg_3_sp_1;
  output [31:0]Q;
  output \FSM_sequential_s_dout_state_reg[1] ;
  output \FSM_sequential_s_din_state_reg[1] ;
  output \rAddress_reg[11] ;
  output \rAddress_reg[11]_0 ;
  output \word_couter_reg[31] ;
  output \word_couter_reg[31]_0 ;
  output done_read_reg;
  output done_read_reg_0;
  output done_read_reg_1;
  output [3:0]O;
  output [3:0]\rAddress_reg[7] ;
  output [3:0]\rAddress_reg[11]_1 ;
  output [3:0]\wAddrCounter_reg[3]_0 ;
  output [3:0]\wAddrCounter_reg[7] ;
  output [3:0]\wAddrCounter_reg[11] ;
  output [31:0]s00_axi_rdata;
  input s00_axi_aclk;
  input [11:0]wAddrCounter_reg;
  input \FSM_sequential_s_din_state_reg[0] ;
  input [1:0]out;
  input m00_axis_aresetn;
  input [10:0]rAddress_reg;
  input [1:0]word_couter_reg;
  input [31:0]status0;
  input done_write;
  input done_read;
  input [0:0]DI;
  input [0:0]S;
  input s00_axi_aresetn;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_bready;
  input s00_axi_arvalid;
  input s00_axi_rready;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_awaddr;
  input [3:0]s00_axi_araddr;

  wire [0:0]DI;
  wire \FSM_sequential_s_din_state[1]_i_3_n_0 ;
  wire \FSM_sequential_s_din_state[1]_i_4_n_0 ;
  wire \FSM_sequential_s_din_state[1]_i_5_n_0 ;
  wire \FSM_sequential_s_din_state[1]_i_6_n_0 ;
  wire \FSM_sequential_s_din_state[1]_i_7_n_0 ;
  wire \FSM_sequential_s_din_state[1]_i_8_n_0 ;
  wire \FSM_sequential_s_din_state[1]_i_9_n_0 ;
  wire \FSM_sequential_s_din_state_reg[0] ;
  wire \FSM_sequential_s_din_state_reg[1] ;
  wire \FSM_sequential_s_dout_state_reg[1] ;
  wire [3:0]O;
  wire [31:0]Q;
  wire [0:0]S;
  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire [5:2]axi_araddr;
  wire axi_arready0;
  wire axi_awready0;
  wire axi_bvalid_i_1_n_0;
  wire \axi_rdata[0]_i_2_n_0 ;
  wire \axi_rdata[16]_i_2_n_0 ;
  wire \axi_rdata[31]_i_2_n_0 ;
  wire \axi_rdata[31]_i_3_n_0 ;
  wire \axi_rdata[31]_i_4_n_0 ;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire done_read;
  wire done_read_reg;
  wire done_read_reg_0;
  wire done_read_reg_1;
  wire done_write;
  wire m00_axis_aresetn;
  wire [1:0]out;
  wire [1:0]p_0_in;
  wire [1:0]p_0_in_0;
  wire [31:0]p_1_in;
  wire \rAddress[0]_i_4_n_0 ;
  wire \rAddress[0]_i_5_n_0 ;
  wire \rAddress[0]_i_6_n_0 ;
  wire \rAddress[4]_i_2_n_0 ;
  wire \rAddress[4]_i_3_n_0 ;
  wire \rAddress[4]_i_4_n_0 ;
  wire \rAddress[4]_i_5_n_0 ;
  wire \rAddress[8]_i_2_n_0 ;
  wire \rAddress[8]_i_3_n_0 ;
  wire \rAddress[8]_i_4_n_0 ;
  wire \rAddress[8]_i_5_n_0 ;
  wire [10:0]rAddress_reg;
  wire \rAddress_reg[0]_i_3_n_0 ;
  wire \rAddress_reg[0]_i_3_n_1 ;
  wire \rAddress_reg[0]_i_3_n_2 ;
  wire \rAddress_reg[0]_i_3_n_3 ;
  wire \rAddress_reg[11] ;
  wire \rAddress_reg[11]_0 ;
  wire [3:0]\rAddress_reg[11]_1 ;
  wire \rAddress_reg[4]_i_1_n_0 ;
  wire \rAddress_reg[4]_i_1_n_1 ;
  wire \rAddress_reg[4]_i_1_n_2 ;
  wire \rAddress_reg[4]_i_1_n_3 ;
  wire [3:0]\rAddress_reg[7] ;
  wire \rAddress_reg[8]_i_1_n_1 ;
  wire \rAddress_reg[8]_i_1_n_2 ;
  wire \rAddress_reg[8]_i_1_n_3 ;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire s00_axi_wvalid;
  wire slv_reg0;
  wire \slv_reg0[31]_i_1_n_0 ;
  wire [31:0]slv_reg2;
  wire slv_reg2_1;
  wire slv_reg_rden__0;
  wire slv_reg_wren__0;
  wire [31:0]status0;
  wire \wAddrCounter[0]_i_5_n_0 ;
  wire \wAddrCounter[0]_i_6_n_0 ;
  wire \wAddrCounter[0]_i_7_n_0 ;
  wire \wAddrCounter[0]_i_8_n_0 ;
  wire \wAddrCounter[0]_i_9_n_0 ;
  wire \wAddrCounter[4]_i_2_n_0 ;
  wire \wAddrCounter[4]_i_3_n_0 ;
  wire \wAddrCounter[4]_i_4_n_0 ;
  wire \wAddrCounter[4]_i_5_n_0 ;
  wire \wAddrCounter[8]_i_2_n_0 ;
  wire \wAddrCounter[8]_i_3_n_0 ;
  wire \wAddrCounter[8]_i_4_n_0 ;
  wire \wAddrCounter[8]_i_5_n_0 ;
  wire [11:0]wAddrCounter_reg;
  wire \wAddrCounter_reg[0]_i_3_n_0 ;
  wire \wAddrCounter_reg[0]_i_3_n_1 ;
  wire \wAddrCounter_reg[0]_i_3_n_2 ;
  wire \wAddrCounter_reg[0]_i_3_n_3 ;
  wire [3:0]\wAddrCounter_reg[11] ;
  wire [3:0]\wAddrCounter_reg[3]_0 ;
  wire \wAddrCounter_reg[4]_i_1_n_0 ;
  wire \wAddrCounter_reg[4]_i_1_n_1 ;
  wire \wAddrCounter_reg[4]_i_1_n_2 ;
  wire \wAddrCounter_reg[4]_i_1_n_3 ;
  wire [3:0]\wAddrCounter_reg[7] ;
  wire \wAddrCounter_reg[8]_i_1_n_1 ;
  wire \wAddrCounter_reg[8]_i_1_n_2 ;
  wire \wAddrCounter_reg[8]_i_1_n_3 ;
  wire wAddrCounter_reg_3_sn_1;
  wire [1:0]word_couter_reg;
  wire \word_couter_reg[31] ;
  wire \word_couter_reg[31]_0 ;
  wire [3:3]\NLW_rAddress_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_wAddrCounter_reg[8]_i_1_CO_UNCONNECTED ;

  assign wAddrCounter_reg_3_sp_1 = wAddrCounter_reg_3_sn_1;
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_s_din_state[1]_i_2 
       (.I0(\FSM_sequential_s_din_state[1]_i_3_n_0 ),
        .I1(\FSM_sequential_s_din_state[1]_i_4_n_0 ),
        .I2(\FSM_sequential_s_din_state[1]_i_5_n_0 ),
        .I3(\FSM_sequential_s_din_state[1]_i_6_n_0 ),
        .O(\FSM_sequential_s_din_state_reg[1] ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_sequential_s_din_state[1]_i_3 
       (.I0(Q[14]),
        .I1(Q[15]),
        .I2(Q[12]),
        .I3(Q[13]),
        .I4(\FSM_sequential_s_din_state[1]_i_7_n_0 ),
        .O(\FSM_sequential_s_din_state[1]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_sequential_s_din_state[1]_i_4 
       (.I0(Q[10]),
        .I1(Q[11]),
        .I2(Q[8]),
        .I3(Q[9]),
        .I4(\rAddress_reg[11]_0 ),
        .O(\FSM_sequential_s_din_state[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FSM_sequential_s_din_state[1]_i_5 
       (.I0(Q[30]),
        .I1(Q[31]),
        .I2(Q[28]),
        .I3(Q[29]),
        .I4(Q[3]),
        .I5(\FSM_sequential_s_din_state[1]_i_8_n_0 ),
        .O(\FSM_sequential_s_din_state[1]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_sequential_s_din_state[1]_i_6 
       (.I0(Q[22]),
        .I1(Q[23]),
        .I2(Q[20]),
        .I3(Q[21]),
        .I4(\FSM_sequential_s_din_state[1]_i_9_n_0 ),
        .O(\FSM_sequential_s_din_state[1]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_s_din_state[1]_i_7 
       (.I0(Q[17]),
        .I1(Q[16]),
        .I2(Q[19]),
        .I3(Q[18]),
        .O(\FSM_sequential_s_din_state[1]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_sequential_s_din_state[1]_i_8 
       (.I0(Q[1]),
        .I1(Q[2]),
        .O(\FSM_sequential_s_din_state[1]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_sequential_s_din_state[1]_i_9 
       (.I0(Q[25]),
        .I1(Q[24]),
        .I2(Q[27]),
        .I3(Q[26]),
        .O(\FSM_sequential_s_din_state[1]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFE000000000000)) 
    \FSM_sequential_s_dout_state[1]_i_2 
       (.I0(\FSM_sequential_s_din_state[1]_i_6_n_0 ),
        .I1(\FSM_sequential_s_din_state[1]_i_5_n_0 ),
        .I2(\FSM_sequential_s_din_state[1]_i_4_n_0 ),
        .I3(\FSM_sequential_s_din_state[1]_i_3_n_0 ),
        .I4(out[1]),
        .I5(out[0]),
        .O(\FSM_sequential_s_dout_state_reg[1] ));
  LUT6 #(
    .INIT(64'hF7FFC4CCC4CCC4CC)) 
    aw_en_i_1
       (.I0(s00_axi_awvalid),
        .I1(aw_en_reg_n_0),
        .I2(s00_axi_awready),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(aw_en_i_1_n_0));
  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .S(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(axi_arready0),
        .D(s00_axi_araddr[0]),
        .Q(axi_araddr[2]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(axi_arready0),
        .D(s00_axi_araddr[1]),
        .Q(axi_araddr[3]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_araddr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(axi_arready0),
        .D(s00_axi_araddr[2]),
        .Q(axi_araddr[4]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_araddr_reg[5] 
       (.C(s00_axi_aclk),
        .CE(axi_arready0),
        .D(s00_axi_araddr[3]),
        .Q(axi_araddr[5]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_arready),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(s00_axi_arready),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(axi_awready0),
        .D(s00_axi_awaddr[0]),
        .Q(p_0_in_0[0]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(axi_awready0),
        .D(s00_axi_awaddr[1]),
        .Q(p_0_in_0[1]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(axi_awready0),
        .D(s00_axi_awaddr[2]),
        .Q(p_0_in[1]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[5] 
       (.C(s00_axi_aclk),
        .CE(axi_awready0),
        .D(s00_axi_awaddr[3]),
        .Q(p_0_in[0]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    axi_awready_i_1
       (.I0(s00_axi_wvalid),
        .I1(s00_axi_awready),
        .I2(aw_en_reg_n_0),
        .I3(s00_axi_awvalid),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(s00_axi_awready),
        .R(\slv_reg0[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_awready),
        .I3(s00_axi_wready),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(\slv_reg0[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \axi_rdata[0]_i_1 
       (.I0(\axi_rdata[0]_i_2_n_0 ),
        .I1(\axi_rdata[31]_i_3_n_0 ),
        .I2(status0[0]),
        .I3(slv_reg2[0]),
        .I4(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[0]));
  LUT6 #(
    .INIT(64'h0300000000020002)) 
    \axi_rdata[0]_i_2 
       (.I0(Q[0]),
        .I1(axi_araddr[5]),
        .I2(axi_araddr[4]),
        .I3(axi_araddr[2]),
        .I4(done_write),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[10]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[10]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[10]),
        .I4(slv_reg2[10]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[10]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[11]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[11]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[11]),
        .I4(slv_reg2[11]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[11]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[12]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[12]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[12]),
        .I4(slv_reg2[12]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[12]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[13]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[13]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[13]),
        .I4(slv_reg2[13]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[13]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[14]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[14]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[14]),
        .I4(slv_reg2[14]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[14]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[15]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[15]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[15]),
        .I4(slv_reg2[15]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[15]));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \axi_rdata[16]_i_1 
       (.I0(\axi_rdata[16]_i_2_n_0 ),
        .I1(\axi_rdata[31]_i_3_n_0 ),
        .I2(status0[16]),
        .I3(slv_reg2[16]),
        .I4(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[16]));
  LUT6 #(
    .INIT(64'h0300000000020002)) 
    \axi_rdata[16]_i_2 
       (.I0(Q[16]),
        .I1(axi_araddr[5]),
        .I2(axi_araddr[4]),
        .I3(axi_araddr[2]),
        .I4(done_read),
        .I5(axi_araddr[3]),
        .O(\axi_rdata[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[17]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[17]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[17]),
        .I4(slv_reg2[17]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[17]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[18]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[18]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[18]),
        .I4(slv_reg2[18]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[18]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[19]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[19]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[19]),
        .I4(slv_reg2[19]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[19]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[1]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[1]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[1]),
        .I4(slv_reg2[1]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[1]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[20]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[20]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[20]),
        .I4(slv_reg2[20]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[20]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[21]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[21]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[21]),
        .I4(slv_reg2[21]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[21]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[22]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[22]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[22]),
        .I4(slv_reg2[22]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[22]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[23]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[23]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[23]),
        .I4(slv_reg2[23]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[23]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[24]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[24]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[24]),
        .I4(slv_reg2[24]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[24]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[25]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[25]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[25]),
        .I4(slv_reg2[25]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[25]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[26]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[26]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[26]),
        .I4(slv_reg2[26]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[26]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[27]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[27]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[27]),
        .I4(slv_reg2[27]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[27]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[28]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[28]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[28]),
        .I4(slv_reg2[28]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[28]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[29]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[29]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[29]),
        .I4(slv_reg2[29]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[29]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[2]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[2]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[2]),
        .I4(slv_reg2[2]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[2]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[30]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[30]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[30]),
        .I4(slv_reg2[30]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[30]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[31]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[31]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[31]),
        .I4(slv_reg2[31]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[31]));
  LUT4 #(
    .INIT(16'h0001)) 
    \axi_rdata[31]_i_2 
       (.I0(axi_araddr[2]),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[3]),
        .O(\axi_rdata[31]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0002)) 
    \axi_rdata[31]_i_3 
       (.I0(axi_araddr[2]),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[3]),
        .O(\axi_rdata[31]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0100)) 
    \axi_rdata[31]_i_4 
       (.I0(axi_araddr[2]),
        .I1(axi_araddr[4]),
        .I2(axi_araddr[5]),
        .I3(axi_araddr[3]),
        .O(\axi_rdata[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[3]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[3]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[3]),
        .I4(slv_reg2[3]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[3]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[4]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[4]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[4]),
        .I4(slv_reg2[4]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[4]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[5]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[5]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[5]),
        .I4(slv_reg2[5]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[5]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[6]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[6]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[6]),
        .I4(slv_reg2[6]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[6]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[7]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[7]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[7]),
        .I4(slv_reg2[7]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[7]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[8]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[8]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[8]),
        .I4(slv_reg2[8]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[8]));
  LUT6 #(
    .INIT(64'hFFFFF888F888F888)) 
    \axi_rdata[9]_i_1 
       (.I0(\axi_rdata[31]_i_2_n_0 ),
        .I1(Q[9]),
        .I2(\axi_rdata[31]_i_3_n_0 ),
        .I3(status0[9]),
        .I4(slv_reg2[9]),
        .I5(\axi_rdata[31]_i_4_n_0 ),
        .O(p_1_in[9]));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[0]),
        .Q(s00_axi_rdata[0]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[10]),
        .Q(s00_axi_rdata[10]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[11]),
        .Q(s00_axi_rdata[11]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[12]),
        .Q(s00_axi_rdata[12]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[13]),
        .Q(s00_axi_rdata[13]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[14]),
        .Q(s00_axi_rdata[14]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[15]),
        .Q(s00_axi_rdata[15]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[16]),
        .Q(s00_axi_rdata[16]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[17]),
        .Q(s00_axi_rdata[17]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[18]),
        .Q(s00_axi_rdata[18]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[19]),
        .Q(s00_axi_rdata[19]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[1]),
        .Q(s00_axi_rdata[1]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[20]),
        .Q(s00_axi_rdata[20]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[21]),
        .Q(s00_axi_rdata[21]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[22]),
        .Q(s00_axi_rdata[22]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[23]),
        .Q(s00_axi_rdata[23]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[24]),
        .Q(s00_axi_rdata[24]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[25]),
        .Q(s00_axi_rdata[25]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[26]),
        .Q(s00_axi_rdata[26]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[27]),
        .Q(s00_axi_rdata[27]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[28]),
        .Q(s00_axi_rdata[28]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[29]),
        .Q(s00_axi_rdata[29]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[2]),
        .Q(s00_axi_rdata[2]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[30]),
        .Q(s00_axi_rdata[30]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[31]),
        .Q(s00_axi_rdata[31]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[3]),
        .Q(s00_axi_rdata[3]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[4]),
        .Q(s00_axi_rdata[4]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[5]),
        .Q(s00_axi_rdata[5]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[6]),
        .Q(s00_axi_rdata[6]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[7]),
        .Q(s00_axi_rdata[7]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[8]),
        .Q(s00_axi_rdata[8]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(p_1_in[9]),
        .Q(s00_axi_rdata[9]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(s00_axi_arready),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .I3(s00_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_axi_rvalid),
        .R(\slv_reg0[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    axi_wready_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_wready),
        .I3(aw_en_reg_n_0),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(s00_axi_wready),
        .R(\slv_reg0[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    done_read_i_2
       (.I0(Q[0]),
        .I1(Q[5]),
        .I2(Q[4]),
        .I3(Q[7]),
        .I4(Q[6]),
        .I5(out[0]),
        .O(done_read_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    m00_axis_tlast_INST_0_i_1
       (.I0(Q[6]),
        .I1(Q[7]),
        .I2(Q[4]),
        .I3(Q[5]),
        .I4(Q[0]),
        .O(\rAddress_reg[11]_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    m00_axis_tlast_INST_0_i_12
       (.I0(Q[1]),
        .I1(Q[2]),
        .O(done_read_reg_1));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h01000080)) 
    m00_axis_tlast_INST_0_i_9
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(word_couter_reg[0]),
        .I3(word_couter_reg[1]),
        .I4(Q[3]),
        .O(done_read_reg));
  LUT6 #(
    .INIT(64'hEEEFEEEFEFEFEFEE)) 
    \rAddress[0]_i_2 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(\rAddress_reg[11]_0 ),
        .I3(Q[3]),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(\rAddress_reg[11] ));
  LUT3 #(
    .INIT(8'hB8)) 
    \rAddress[0]_i_4 
       (.I0(rAddress_reg[2]),
        .I1(\word_couter_reg[31]_0 ),
        .I2(Q[11]),
        .O(\rAddress[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \rAddress[0]_i_5 
       (.I0(rAddress_reg[1]),
        .I1(\word_couter_reg[31]_0 ),
        .I2(Q[10]),
        .O(\rAddress[0]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \rAddress[0]_i_6 
       (.I0(rAddress_reg[0]),
        .I1(\word_couter_reg[31]_0 ),
        .I2(Q[9]),
        .O(\rAddress[0]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \rAddress[4]_i_2 
       (.I0(rAddress_reg[6]),
        .I1(\word_couter_reg[31]_0 ),
        .I2(Q[15]),
        .O(\rAddress[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \rAddress[4]_i_3 
       (.I0(rAddress_reg[5]),
        .I1(\word_couter_reg[31]_0 ),
        .I2(Q[14]),
        .O(\rAddress[4]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \rAddress[4]_i_4 
       (.I0(rAddress_reg[4]),
        .I1(\word_couter_reg[31]_0 ),
        .I2(Q[13]),
        .O(\rAddress[4]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \rAddress[4]_i_5 
       (.I0(rAddress_reg[3]),
        .I1(\word_couter_reg[31]_0 ),
        .I2(Q[12]),
        .O(\rAddress[4]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \rAddress[8]_i_2 
       (.I0(rAddress_reg[10]),
        .I1(\word_couter_reg[31]_0 ),
        .I2(Q[19]),
        .O(\rAddress[8]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \rAddress[8]_i_3 
       (.I0(rAddress_reg[9]),
        .I1(\word_couter_reg[31]_0 ),
        .I2(Q[18]),
        .O(\rAddress[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \rAddress[8]_i_4 
       (.I0(rAddress_reg[8]),
        .I1(\word_couter_reg[31]_0 ),
        .I2(Q[17]),
        .O(\rAddress[8]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \rAddress[8]_i_5 
       (.I0(rAddress_reg[7]),
        .I1(\word_couter_reg[31]_0 ),
        .I2(Q[16]),
        .O(\rAddress[8]_i_5_n_0 ));
  CARRY4 \rAddress_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\rAddress_reg[0]_i_3_n_0 ,\rAddress_reg[0]_i_3_n_1 ,\rAddress_reg[0]_i_3_n_2 ,\rAddress_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,DI}),
        .O(O),
        .S({\rAddress[0]_i_4_n_0 ,\rAddress[0]_i_5_n_0 ,\rAddress[0]_i_6_n_0 ,S}));
  CARRY4 \rAddress_reg[4]_i_1 
       (.CI(\rAddress_reg[0]_i_3_n_0 ),
        .CO({\rAddress_reg[4]_i_1_n_0 ,\rAddress_reg[4]_i_1_n_1 ,\rAddress_reg[4]_i_1_n_2 ,\rAddress_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\rAddress_reg[7] ),
        .S({\rAddress[4]_i_2_n_0 ,\rAddress[4]_i_3_n_0 ,\rAddress[4]_i_4_n_0 ,\rAddress[4]_i_5_n_0 }));
  CARRY4 \rAddress_reg[8]_i_1 
       (.CI(\rAddress_reg[4]_i_1_n_0 ),
        .CO({\NLW_rAddress_reg[8]_i_1_CO_UNCONNECTED [3],\rAddress_reg[8]_i_1_n_1 ,\rAddress_reg[8]_i_1_n_2 ,\rAddress_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\rAddress_reg[11]_1 ),
        .S({\rAddress[8]_i_2_n_0 ,\rAddress[8]_i_3_n_0 ,\rAddress[8]_i_4_n_0 ,\rAddress[8]_i_5_n_0 }));
  LUT1 #(
    .INIT(2'h1)) 
    \slv_reg0[31]_i_1 
       (.I0(s00_axi_aresetn),
        .O(\slv_reg0[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000002)) 
    \slv_reg0[31]_i_2 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .I3(p_0_in_0[0]),
        .I4(p_0_in_0[1]),
        .O(slv_reg0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg0[31]_i_3 
       (.I0(s00_axi_wready),
        .I1(s00_axi_awready),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .O(slv_reg_wren__0));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[0]),
        .Q(Q[0]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[10]),
        .Q(Q[10]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[11]),
        .Q(Q[11]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[12]),
        .Q(Q[12]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[13]),
        .Q(Q[13]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[14]),
        .Q(Q[14]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[15]),
        .Q(Q[15]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[16]),
        .Q(Q[16]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[17]),
        .Q(Q[17]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[18]),
        .Q(Q[18]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[19]),
        .Q(Q[19]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[1]),
        .Q(Q[1]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[20]),
        .Q(Q[20]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[21]),
        .Q(Q[21]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[22]),
        .Q(Q[22]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[23]),
        .Q(Q[23]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[24]),
        .Q(Q[24]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[25]),
        .Q(Q[25]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[26]),
        .Q(Q[26]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[27]),
        .Q(Q[27]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[28]),
        .Q(Q[28]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[29]),
        .Q(Q[29]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[2]),
        .Q(Q[2]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[30]),
        .Q(Q[30]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[31]),
        .Q(Q[31]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[3]),
        .Q(Q[3]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[4]),
        .Q(Q[4]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[5]),
        .Q(Q[5]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[6]),
        .Q(Q[6]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[7]),
        .Q(Q[7]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[8]),
        .Q(Q[8]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg0_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg0),
        .D(s00_axi_wdata[9]),
        .Q(Q[9]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000200)) 
    \slv_reg2[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .I3(p_0_in_0[1]),
        .I4(p_0_in_0[0]),
        .O(slv_reg2_1));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg2[0]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg2[10]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg2[11]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg2[12]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg2[13]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg2[14]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg2[15]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg2[16]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg2[17]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg2[18]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg2[19]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg2[1]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg2[20]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg2[21]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg2[22]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg2[23]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg2[24]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg2[25]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg2[26]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg2[27]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg2[28]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg2[29]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg2[2]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg2[30]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg2[31]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg2[3]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg2[4]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg2[5]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg2[6]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg2[7]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg2[8]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg2_1),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg2[9]),
        .R(\slv_reg0[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    slv_reg_rden
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_rvalid),
        .I2(s00_axi_arready),
        .O(slv_reg_rden__0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFE0FFFF)) 
    \wAddrCounter[0]_i_4 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(\wAddrCounter[0]_i_9_n_0 ),
        .I4(Q[0]),
        .I5(\FSM_sequential_s_din_state_reg[0] ),
        .O(wAddrCounter_reg_3_sn_1));
  LUT3 #(
    .INIT(8'hB8)) 
    \wAddrCounter[0]_i_5 
       (.I0(wAddrCounter_reg[3]),
        .I1(wAddrCounter_reg_3_sn_1),
        .I2(Q[11]),
        .O(\wAddrCounter[0]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \wAddrCounter[0]_i_6 
       (.I0(wAddrCounter_reg[2]),
        .I1(wAddrCounter_reg_3_sn_1),
        .I2(Q[10]),
        .O(\wAddrCounter[0]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \wAddrCounter[0]_i_7 
       (.I0(wAddrCounter_reg[1]),
        .I1(wAddrCounter_reg_3_sn_1),
        .I2(Q[9]),
        .O(\wAddrCounter[0]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h3A)) 
    \wAddrCounter[0]_i_8 
       (.I0(Q[8]),
        .I1(wAddrCounter_reg[0]),
        .I2(wAddrCounter_reg_3_sn_1),
        .O(\wAddrCounter[0]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \wAddrCounter[0]_i_9 
       (.I0(Q[5]),
        .I1(Q[4]),
        .I2(Q[7]),
        .I3(Q[6]),
        .O(\wAddrCounter[0]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \wAddrCounter[4]_i_2 
       (.I0(wAddrCounter_reg[7]),
        .I1(wAddrCounter_reg_3_sn_1),
        .I2(Q[15]),
        .O(\wAddrCounter[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \wAddrCounter[4]_i_3 
       (.I0(wAddrCounter_reg[6]),
        .I1(wAddrCounter_reg_3_sn_1),
        .I2(Q[14]),
        .O(\wAddrCounter[4]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \wAddrCounter[4]_i_4 
       (.I0(wAddrCounter_reg[5]),
        .I1(wAddrCounter_reg_3_sn_1),
        .I2(Q[13]),
        .O(\wAddrCounter[4]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \wAddrCounter[4]_i_5 
       (.I0(wAddrCounter_reg[4]),
        .I1(wAddrCounter_reg_3_sn_1),
        .I2(Q[12]),
        .O(\wAddrCounter[4]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \wAddrCounter[8]_i_2 
       (.I0(wAddrCounter_reg[11]),
        .I1(wAddrCounter_reg_3_sn_1),
        .I2(Q[19]),
        .O(\wAddrCounter[8]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \wAddrCounter[8]_i_3 
       (.I0(wAddrCounter_reg[10]),
        .I1(wAddrCounter_reg_3_sn_1),
        .I2(Q[18]),
        .O(\wAddrCounter[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \wAddrCounter[8]_i_4 
       (.I0(wAddrCounter_reg[9]),
        .I1(wAddrCounter_reg_3_sn_1),
        .I2(Q[17]),
        .O(\wAddrCounter[8]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \wAddrCounter[8]_i_5 
       (.I0(wAddrCounter_reg[8]),
        .I1(wAddrCounter_reg_3_sn_1),
        .I2(Q[16]),
        .O(\wAddrCounter[8]_i_5_n_0 ));
  CARRY4 \wAddrCounter_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\wAddrCounter_reg[0]_i_3_n_0 ,\wAddrCounter_reg[0]_i_3_n_1 ,\wAddrCounter_reg[0]_i_3_n_2 ,\wAddrCounter_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,wAddrCounter_reg_3_sn_1}),
        .O(\wAddrCounter_reg[3]_0 ),
        .S({\wAddrCounter[0]_i_5_n_0 ,\wAddrCounter[0]_i_6_n_0 ,\wAddrCounter[0]_i_7_n_0 ,\wAddrCounter[0]_i_8_n_0 }));
  CARRY4 \wAddrCounter_reg[4]_i_1 
       (.CI(\wAddrCounter_reg[0]_i_3_n_0 ),
        .CO({\wAddrCounter_reg[4]_i_1_n_0 ,\wAddrCounter_reg[4]_i_1_n_1 ,\wAddrCounter_reg[4]_i_1_n_2 ,\wAddrCounter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\wAddrCounter_reg[7] ),
        .S({\wAddrCounter[4]_i_2_n_0 ,\wAddrCounter[4]_i_3_n_0 ,\wAddrCounter[4]_i_4_n_0 ,\wAddrCounter[4]_i_5_n_0 }));
  CARRY4 \wAddrCounter_reg[8]_i_1 
       (.CI(\wAddrCounter_reg[4]_i_1_n_0 ),
        .CO({\NLW_wAddrCounter_reg[8]_i_1_CO_UNCONNECTED [3],\wAddrCounter_reg[8]_i_1_n_1 ,\wAddrCounter_reg[8]_i_1_n_2 ,\wAddrCounter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\wAddrCounter_reg[11] ),
        .S({\wAddrCounter[8]_i_2_n_0 ,\wAddrCounter[8]_i_3_n_0 ,\wAddrCounter[8]_i_4_n_0 ,\wAddrCounter[8]_i_5_n_0 }));
  LUT2 #(
    .INIT(4'h7)) 
    \word_couter[0]_i_1 
       (.I0(\word_couter_reg[31]_0 ),
        .I1(m00_axis_aresetn),
        .O(\word_couter_reg[31] ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFA1)) 
    \word_couter[0]_i_4 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(out[1]),
        .I4(out[0]),
        .I5(\rAddress_reg[11]_0 ),
        .O(\word_couter_reg[31]_0 ));
endmodule

module design_1_interfacer_ipcore_0_0_0_streamer
   (out,
    \word_couter_reg[11]_0 ,
    DI,
    \rAddress_reg[11]_0 ,
    wAddrCounter_reg,
    done_write,
    done_read,
    poly_bram_we,
    s00_axis_tready,
    poly_bram_address,
    \wAddrCounter_reg[3]_0 ,
    m00_axis_tlast,
    m00_axis_tvalid,
    S,
    \slv_reg0_reg[3] ,
    m00_axis_aclk,
    \FSM_sequential_s_dout_state_reg[1]_0 ,
    O,
    \rAddress_reg[7]_0 ,
    \rAddress_reg[11]_1 ,
    \slv_reg0_reg[2] ,
    s00_axis_aclk,
    \wAddrCounter_reg[7]_0 ,
    \wAddrCounter_reg[11]_0 ,
    s00_axis_tvalid,
    \slv_reg0_reg[2]_0 ,
    m00_axis_tready,
    \slv_reg0_reg[3]_0 ,
    \slv_reg0_reg[6] ,
    \slv_reg0_reg[1] ,
    \slv_reg0_reg[1]_0 ,
    command0,
    s00_axis_aresetn,
    m00_axis_aresetn,
    s00_axis_tlast,
    \slv_reg0_reg[0] ,
    \slv_reg0_reg[14] ,
    \FSM_sequential_s_dout_state_reg[1]_1 );
  output [1:0]out;
  output [1:0]\word_couter_reg[11]_0 ;
  output [0:0]DI;
  output [10:0]\rAddress_reg[11]_0 ;
  output [11:0]wAddrCounter_reg;
  output done_write;
  output done_read;
  output poly_bram_we;
  output s00_axis_tready;
  output [11:0]poly_bram_address;
  output \wAddrCounter_reg[3]_0 ;
  output m00_axis_tlast;
  output m00_axis_tvalid;
  output [0:0]S;
  input \slv_reg0_reg[3] ;
  input m00_axis_aclk;
  input \FSM_sequential_s_dout_state_reg[1]_0 ;
  input [3:0]O;
  input [3:0]\rAddress_reg[7]_0 ;
  input [3:0]\rAddress_reg[11]_1 ;
  input [3:0]\slv_reg0_reg[2] ;
  input s00_axis_aclk;
  input [3:0]\wAddrCounter_reg[7]_0 ;
  input [3:0]\wAddrCounter_reg[11]_0 ;
  input s00_axis_tvalid;
  input \slv_reg0_reg[2]_0 ;
  input m00_axis_tready;
  input \slv_reg0_reg[3]_0 ;
  input \slv_reg0_reg[6] ;
  input \slv_reg0_reg[1] ;
  input \slv_reg0_reg[1]_0 ;
  input [3:0]command0;
  input s00_axis_aresetn;
  input m00_axis_aresetn;
  input s00_axis_tlast;
  input \slv_reg0_reg[0] ;
  input \slv_reg0_reg[14] ;
  input \FSM_sequential_s_dout_state_reg[1]_1 ;

  wire [0:0]DI;
  wire \FSM_sequential_s_din_state[0]_i_1_n_0 ;
  wire \FSM_sequential_s_din_state[0]_i_2_n_0 ;
  wire \FSM_sequential_s_din_state[1]_i_1_n_0 ;
  wire \FSM_sequential_s_dout_state[0]_i_1_n_0 ;
  wire \FSM_sequential_s_dout_state[0]_i_2_n_0 ;
  wire \FSM_sequential_s_dout_state[1]_i_1_n_0 ;
  wire \FSM_sequential_s_dout_state_reg[1]_0 ;
  wire \FSM_sequential_s_dout_state_reg[1]_1 ;
  wire [3:0]O;
  wire [0:0]S;
  wire [3:0]command0;
  wire done_read;
  wire done_read_i_1_n_0;
  wire done_write;
  wire done_write_i_1_n_0;
  wire m00_axis_aclk;
  wire m00_axis_aresetn;
  wire m00_axis_tlast;
  wire m00_axis_tlast_INST_0_i_10_n_0;
  wire m00_axis_tlast_INST_0_i_11_n_0;
  wire m00_axis_tlast_INST_0_i_13_n_0;
  wire m00_axis_tlast_INST_0_i_14_n_0;
  wire m00_axis_tlast_INST_0_i_2_n_0;
  wire m00_axis_tlast_INST_0_i_3_n_0;
  wire m00_axis_tlast_INST_0_i_4_n_0;
  wire m00_axis_tlast_INST_0_i_5_n_0;
  wire m00_axis_tlast_INST_0_i_6_n_0;
  wire m00_axis_tlast_INST_0_i_7_n_0;
  wire m00_axis_tlast_INST_0_i_8_n_0;
  wire m00_axis_tready;
  wire m00_axis_tvalid;
  (* RTL_KEEP = "yes" *) wire [1:0]out;
  wire [11:0]poly_bram_address;
  wire \poly_bram_address[11]_INST_0_i_1_n_1 ;
  wire \poly_bram_address[11]_INST_0_i_1_n_2 ;
  wire \poly_bram_address[11]_INST_0_i_1_n_3 ;
  wire \poly_bram_address[3]_INST_0_i_1_n_0 ;
  wire \poly_bram_address[3]_INST_0_i_1_n_1 ;
  wire \poly_bram_address[3]_INST_0_i_1_n_2 ;
  wire \poly_bram_address[3]_INST_0_i_1_n_3 ;
  wire \poly_bram_address[3]_INST_0_i_2_n_0 ;
  wire \poly_bram_address[7]_INST_0_i_1_n_0 ;
  wire \poly_bram_address[7]_INST_0_i_1_n_1 ;
  wire \poly_bram_address[7]_INST_0_i_1_n_2 ;
  wire \poly_bram_address[7]_INST_0_i_1_n_3 ;
  wire poly_bram_we;
  wire \rAddress[0]_i_1_n_0 ;
  wire [11:0]rAddress_next;
  wire [0:0]rAddress_reg;
  wire [10:0]\rAddress_reg[11]_0 ;
  wire [3:0]\rAddress_reg[11]_1 ;
  wire [3:0]\rAddress_reg[7]_0 ;
  wire s00_axis_aclk;
  wire s00_axis_aresetn;
  wire s00_axis_tlast;
  wire s00_axis_tready;
  wire s00_axis_tvalid;
  (* RTL_KEEP = "yes" *) wire [1:0]s_din_state;
  wire \slv_reg0_reg[0] ;
  wire \slv_reg0_reg[14] ;
  wire \slv_reg0_reg[1] ;
  wire \slv_reg0_reg[1]_0 ;
  wire [3:0]\slv_reg0_reg[2] ;
  wire \slv_reg0_reg[2]_0 ;
  wire \slv_reg0_reg[3] ;
  wire \slv_reg0_reg[3]_0 ;
  wire \slv_reg0_reg[6] ;
  wire \wAddrCounter[0]_i_1_n_0 ;
  wire \wAddrCounter[0]_i_2_n_0 ;
  wire [11:0]wAddrCounter_reg;
  wire [3:0]\wAddrCounter_reg[11]_0 ;
  wire \wAddrCounter_reg[3]_0 ;
  wire [3:0]\wAddrCounter_reg[7]_0 ;
  wire \word_couter[0]_i_5_n_0 ;
  wire [31:0]word_couter_reg;
  wire \word_couter_reg[0]_i_3_n_0 ;
  wire \word_couter_reg[0]_i_3_n_1 ;
  wire \word_couter_reg[0]_i_3_n_2 ;
  wire \word_couter_reg[0]_i_3_n_3 ;
  wire \word_couter_reg[0]_i_3_n_4 ;
  wire \word_couter_reg[0]_i_3_n_5 ;
  wire \word_couter_reg[0]_i_3_n_6 ;
  wire \word_couter_reg[0]_i_3_n_7 ;
  wire [1:0]\word_couter_reg[11]_0 ;
  wire \word_couter_reg[12]_i_1_n_0 ;
  wire \word_couter_reg[12]_i_1_n_1 ;
  wire \word_couter_reg[12]_i_1_n_2 ;
  wire \word_couter_reg[12]_i_1_n_3 ;
  wire \word_couter_reg[12]_i_1_n_4 ;
  wire \word_couter_reg[12]_i_1_n_5 ;
  wire \word_couter_reg[12]_i_1_n_6 ;
  wire \word_couter_reg[12]_i_1_n_7 ;
  wire \word_couter_reg[16]_i_1_n_0 ;
  wire \word_couter_reg[16]_i_1_n_1 ;
  wire \word_couter_reg[16]_i_1_n_2 ;
  wire \word_couter_reg[16]_i_1_n_3 ;
  wire \word_couter_reg[16]_i_1_n_4 ;
  wire \word_couter_reg[16]_i_1_n_5 ;
  wire \word_couter_reg[16]_i_1_n_6 ;
  wire \word_couter_reg[16]_i_1_n_7 ;
  wire \word_couter_reg[20]_i_1_n_0 ;
  wire \word_couter_reg[20]_i_1_n_1 ;
  wire \word_couter_reg[20]_i_1_n_2 ;
  wire \word_couter_reg[20]_i_1_n_3 ;
  wire \word_couter_reg[20]_i_1_n_4 ;
  wire \word_couter_reg[20]_i_1_n_5 ;
  wire \word_couter_reg[20]_i_1_n_6 ;
  wire \word_couter_reg[20]_i_1_n_7 ;
  wire \word_couter_reg[24]_i_1_n_0 ;
  wire \word_couter_reg[24]_i_1_n_1 ;
  wire \word_couter_reg[24]_i_1_n_2 ;
  wire \word_couter_reg[24]_i_1_n_3 ;
  wire \word_couter_reg[24]_i_1_n_4 ;
  wire \word_couter_reg[24]_i_1_n_5 ;
  wire \word_couter_reg[24]_i_1_n_6 ;
  wire \word_couter_reg[24]_i_1_n_7 ;
  wire \word_couter_reg[28]_i_1_n_1 ;
  wire \word_couter_reg[28]_i_1_n_2 ;
  wire \word_couter_reg[28]_i_1_n_3 ;
  wire \word_couter_reg[28]_i_1_n_4 ;
  wire \word_couter_reg[28]_i_1_n_5 ;
  wire \word_couter_reg[28]_i_1_n_6 ;
  wire \word_couter_reg[28]_i_1_n_7 ;
  wire \word_couter_reg[4]_i_1_n_0 ;
  wire \word_couter_reg[4]_i_1_n_1 ;
  wire \word_couter_reg[4]_i_1_n_2 ;
  wire \word_couter_reg[4]_i_1_n_3 ;
  wire \word_couter_reg[4]_i_1_n_4 ;
  wire \word_couter_reg[4]_i_1_n_5 ;
  wire \word_couter_reg[4]_i_1_n_6 ;
  wire \word_couter_reg[4]_i_1_n_7 ;
  wire \word_couter_reg[8]_i_1_n_0 ;
  wire \word_couter_reg[8]_i_1_n_1 ;
  wire \word_couter_reg[8]_i_1_n_2 ;
  wire \word_couter_reg[8]_i_1_n_3 ;
  wire \word_couter_reg[8]_i_1_n_4 ;
  wire \word_couter_reg[8]_i_1_n_5 ;
  wire \word_couter_reg[8]_i_1_n_6 ;
  wire \word_couter_reg[8]_i_1_n_7 ;
  wire [3:3]\NLW_poly_bram_address[11]_INST_0_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_word_couter_reg[28]_i_1_CO_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFFFFA0C000000000)) 
    \FSM_sequential_s_din_state[0]_i_1 
       (.I0(\slv_reg0_reg[14] ),
        .I1(s00_axis_tlast),
        .I2(s_din_state[1]),
        .I3(s_din_state[0]),
        .I4(\FSM_sequential_s_din_state[0]_i_2_n_0 ),
        .I5(s00_axis_aresetn),
        .O(\FSM_sequential_s_din_state[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h14FF)) 
    \FSM_sequential_s_din_state[0]_i_2 
       (.I0(s00_axis_tvalid),
        .I1(s_din_state[0]),
        .I2(s_din_state[1]),
        .I3(\slv_reg0_reg[2]_0 ),
        .O(\FSM_sequential_s_din_state[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFF0A0C000000000)) 
    \FSM_sequential_s_din_state[1]_i_1 
       (.I0(\slv_reg0_reg[14] ),
        .I1(s00_axis_tlast),
        .I2(s_din_state[1]),
        .I3(s_din_state[0]),
        .I4(s00_axis_tvalid),
        .I5(s00_axis_aresetn),
        .O(\FSM_sequential_s_din_state[1]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "s_din_wait_data:01,s_din_read_data:10,s_din_wait_release:11,s_din_wait_command:00" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_s_din_state_reg[0] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_s_din_state[0]_i_1_n_0 ),
        .Q(s_din_state[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "s_din_wait_data:01,s_din_read_data:10,s_din_wait_release:11,s_din_wait_command:00" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_s_din_state_reg[1] 
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_s_din_state[1]_i_1_n_0 ),
        .Q(s_din_state[1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFAAEA00000000)) 
    \FSM_sequential_s_dout_state[0]_i_1 
       (.I0(\FSM_sequential_s_dout_state[0]_i_2_n_0 ),
        .I1(m00_axis_tlast_INST_0_i_2_n_0),
        .I2(out[1]),
        .I3(\slv_reg0_reg[6] ),
        .I4(\FSM_sequential_s_dout_state_reg[1]_1 ),
        .I5(m00_axis_aresetn),
        .O(\FSM_sequential_s_dout_state[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h14FF)) 
    \FSM_sequential_s_dout_state[0]_i_2 
       (.I0(m00_axis_tready),
        .I1(out[0]),
        .I2(out[1]),
        .I3(\slv_reg0_reg[3]_0 ),
        .O(\FSM_sequential_s_dout_state[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFF600000)) 
    \FSM_sequential_s_dout_state[1]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(m00_axis_tready),
        .I3(\FSM_sequential_s_dout_state_reg[1]_1 ),
        .I4(m00_axis_aresetn),
        .O(\FSM_sequential_s_dout_state[1]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "s_dout_wait_ready:01,s_dout_write_data:10,s_dout_wait_release:11,s_dout_wait_command:00" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_s_dout_state_reg[0] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_s_dout_state[0]_i_1_n_0 ),
        .Q(out[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "s_dout_wait_ready:01,s_dout_write_data:10,s_dout_wait_release:11,s_dout_wait_command:00" *) 
  (* KEEP = "yes" *) 
  FDRE \FSM_sequential_s_dout_state_reg[1] 
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(\FSM_sequential_s_dout_state[1]_i_1_n_0 ),
        .Q(out[1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h88F88808FFFFFFFF)) 
    done_read_i_1
       (.I0(done_read),
        .I1(\slv_reg0_reg[3]_0 ),
        .I2(m00_axis_tlast_INST_0_i_2_n_0),
        .I3(\slv_reg0_reg[0] ),
        .I4(out[1]),
        .I5(m00_axis_aresetn),
        .O(done_read_i_1_n_0));
  FDRE done_read_reg
       (.C(m00_axis_aclk),
        .CE(1'b1),
        .D(done_read_i_1_n_0),
        .Q(done_read),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8F888888FFFFFFFF)) 
    done_write_i_1
       (.I0(done_write),
        .I1(\slv_reg0_reg[2]_0 ),
        .I2(s_din_state[0]),
        .I3(s_din_state[1]),
        .I4(s00_axis_tlast),
        .I5(s00_axis_aresetn),
        .O(done_write_i_1_n_0));
  FDRE done_write_reg
       (.C(s00_axis_aclk),
        .CE(1'b1),
        .D(done_write_i_1_n_0),
        .Q(done_write),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h1000)) 
    m00_axis_tlast_INST_0
       (.I0(\slv_reg0_reg[6] ),
        .I1(out[0]),
        .I2(out[1]),
        .I3(m00_axis_tlast_INST_0_i_2_n_0),
        .O(m00_axis_tlast));
  LUT6 #(
    .INIT(64'h0080000000000100)) 
    m00_axis_tlast_INST_0_i_10
       (.I0(word_couter_reg[8]),
        .I1(\word_couter_reg[11]_0 [1]),
        .I2(command0[0]),
        .I3(command0[1]),
        .I4(\word_couter_reg[11]_0 [0]),
        .I5(command0[2]),
        .O(m00_axis_tlast_INST_0_i_10_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    m00_axis_tlast_INST_0_i_11
       (.I0(\word_couter_reg[11]_0 [1]),
        .I1(word_couter_reg[8]),
        .I2(\word_couter_reg[11]_0 [0]),
        .I3(command0[2]),
        .O(m00_axis_tlast_INST_0_i_11_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    m00_axis_tlast_INST_0_i_13
       (.I0(word_couter_reg[19]),
        .I1(word_couter_reg[18]),
        .I2(word_couter_reg[17]),
        .I3(word_couter_reg[16]),
        .O(m00_axis_tlast_INST_0_i_13_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    m00_axis_tlast_INST_0_i_14
       (.I0(word_couter_reg[27]),
        .I1(word_couter_reg[26]),
        .I2(word_couter_reg[25]),
        .I3(word_couter_reg[24]),
        .O(m00_axis_tlast_INST_0_i_14_n_0));
  LUT5 #(
    .INIT(32'h80000000)) 
    m00_axis_tlast_INST_0_i_2
       (.I0(m00_axis_tlast_INST_0_i_3_n_0),
        .I1(m00_axis_tlast_INST_0_i_4_n_0),
        .I2(m00_axis_tlast_INST_0_i_5_n_0),
        .I3(m00_axis_tlast_INST_0_i_6_n_0),
        .I4(m00_axis_tlast_INST_0_i_7_n_0),
        .O(m00_axis_tlast_INST_0_i_2_n_0));
  LUT5 #(
    .INIT(32'h80000000)) 
    m00_axis_tlast_INST_0_i_3
       (.I0(word_couter_reg[0]),
        .I1(word_couter_reg[1]),
        .I2(word_couter_reg[2]),
        .I3(word_couter_reg[3]),
        .I4(m00_axis_tlast_INST_0_i_8_n_0),
        .O(m00_axis_tlast_INST_0_i_3_n_0));
  LUT4 #(
    .INIT(16'h0001)) 
    m00_axis_tlast_INST_0_i_4
       (.I0(word_couter_reg[31]),
        .I1(word_couter_reg[30]),
        .I2(word_couter_reg[29]),
        .I3(word_couter_reg[28]),
        .O(m00_axis_tlast_INST_0_i_4_n_0));
  LUT6 #(
    .INIT(64'hF0FFF022F022F022)) 
    m00_axis_tlast_INST_0_i_5
       (.I0(\slv_reg0_reg[1] ),
        .I1(word_couter_reg[8]),
        .I2(m00_axis_tlast_INST_0_i_10_n_0),
        .I3(word_couter_reg[6]),
        .I4(m00_axis_tlast_INST_0_i_11_n_0),
        .I5(\slv_reg0_reg[1]_0 ),
        .O(m00_axis_tlast_INST_0_i_5_n_0));
  LUT5 #(
    .INIT(32'h00010000)) 
    m00_axis_tlast_INST_0_i_6
       (.I0(word_couter_reg[12]),
        .I1(word_couter_reg[13]),
        .I2(word_couter_reg[14]),
        .I3(word_couter_reg[15]),
        .I4(m00_axis_tlast_INST_0_i_13_n_0),
        .O(m00_axis_tlast_INST_0_i_6_n_0));
  LUT5 #(
    .INIT(32'h00010000)) 
    m00_axis_tlast_INST_0_i_7
       (.I0(word_couter_reg[20]),
        .I1(word_couter_reg[21]),
        .I2(word_couter_reg[22]),
        .I3(word_couter_reg[23]),
        .I4(m00_axis_tlast_INST_0_i_14_n_0),
        .O(m00_axis_tlast_INST_0_i_7_n_0));
  LUT4 #(
    .INIT(16'h1000)) 
    m00_axis_tlast_INST_0_i_8
       (.I0(word_couter_reg[11]),
        .I1(word_couter_reg[10]),
        .I2(word_couter_reg[5]),
        .I3(word_couter_reg[4]),
        .O(m00_axis_tlast_INST_0_i_8_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    m00_axis_tvalid_INST_0
       (.I0(out[1]),
        .I1(out[0]),
        .O(m00_axis_tvalid));
  LUT4 #(
    .INIT(16'hABA8)) 
    \poly_bram_address[0]_INST_0 
       (.I0(wAddrCounter_reg[0]),
        .I1(s_din_state[0]),
        .I2(s_din_state[1]),
        .I3(rAddress_next[0]),
        .O(poly_bram_address[0]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \poly_bram_address[10]_INST_0 
       (.I0(wAddrCounter_reg[10]),
        .I1(s_din_state[0]),
        .I2(s_din_state[1]),
        .I3(rAddress_next[10]),
        .O(poly_bram_address[10]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \poly_bram_address[11]_INST_0 
       (.I0(wAddrCounter_reg[11]),
        .I1(s_din_state[0]),
        .I2(s_din_state[1]),
        .I3(rAddress_next[11]),
        .O(poly_bram_address[11]));
  CARRY4 \poly_bram_address[11]_INST_0_i_1 
       (.CI(\poly_bram_address[7]_INST_0_i_1_n_0 ),
        .CO({\NLW_poly_bram_address[11]_INST_0_i_1_CO_UNCONNECTED [3],\poly_bram_address[11]_INST_0_i_1_n_1 ,\poly_bram_address[11]_INST_0_i_1_n_2 ,\poly_bram_address[11]_INST_0_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rAddress_next[11:8]),
        .S(\rAddress_reg[11]_0 [10:7]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \poly_bram_address[1]_INST_0 
       (.I0(wAddrCounter_reg[1]),
        .I1(s_din_state[0]),
        .I2(s_din_state[1]),
        .I3(rAddress_next[1]),
        .O(poly_bram_address[1]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \poly_bram_address[2]_INST_0 
       (.I0(wAddrCounter_reg[2]),
        .I1(s_din_state[0]),
        .I2(s_din_state[1]),
        .I3(rAddress_next[2]),
        .O(poly_bram_address[2]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \poly_bram_address[3]_INST_0 
       (.I0(wAddrCounter_reg[3]),
        .I1(s_din_state[0]),
        .I2(s_din_state[1]),
        .I3(rAddress_next[3]),
        .O(poly_bram_address[3]));
  CARRY4 \poly_bram_address[3]_INST_0_i_1 
       (.CI(1'b0),
        .CO({\poly_bram_address[3]_INST_0_i_1_n_0 ,\poly_bram_address[3]_INST_0_i_1_n_1 ,\poly_bram_address[3]_INST_0_i_1_n_2 ,\poly_bram_address[3]_INST_0_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,rAddress_reg}),
        .O(rAddress_next[3:0]),
        .S({\rAddress_reg[11]_0 [2:0],\poly_bram_address[3]_INST_0_i_2_n_0 }));
  LUT4 #(
    .INIT(16'hAA6A)) 
    \poly_bram_address[3]_INST_0_i_2 
       (.I0(rAddress_reg),
        .I1(m00_axis_tready),
        .I2(out[1]),
        .I3(out[0]),
        .O(\poly_bram_address[3]_INST_0_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hABA8)) 
    \poly_bram_address[4]_INST_0 
       (.I0(wAddrCounter_reg[4]),
        .I1(s_din_state[0]),
        .I2(s_din_state[1]),
        .I3(rAddress_next[4]),
        .O(poly_bram_address[4]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \poly_bram_address[5]_INST_0 
       (.I0(wAddrCounter_reg[5]),
        .I1(s_din_state[0]),
        .I2(s_din_state[1]),
        .I3(rAddress_next[5]),
        .O(poly_bram_address[5]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \poly_bram_address[6]_INST_0 
       (.I0(wAddrCounter_reg[6]),
        .I1(s_din_state[0]),
        .I2(s_din_state[1]),
        .I3(rAddress_next[6]),
        .O(poly_bram_address[6]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \poly_bram_address[7]_INST_0 
       (.I0(wAddrCounter_reg[7]),
        .I1(s_din_state[0]),
        .I2(s_din_state[1]),
        .I3(rAddress_next[7]),
        .O(poly_bram_address[7]));
  CARRY4 \poly_bram_address[7]_INST_0_i_1 
       (.CI(\poly_bram_address[3]_INST_0_i_1_n_0 ),
        .CO({\poly_bram_address[7]_INST_0_i_1_n_0 ,\poly_bram_address[7]_INST_0_i_1_n_1 ,\poly_bram_address[7]_INST_0_i_1_n_2 ,\poly_bram_address[7]_INST_0_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rAddress_next[7:4]),
        .S(\rAddress_reg[11]_0 [6:3]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \poly_bram_address[8]_INST_0 
       (.I0(wAddrCounter_reg[8]),
        .I1(s_din_state[0]),
        .I2(s_din_state[1]),
        .I3(rAddress_next[8]),
        .O(poly_bram_address[8]));
  LUT4 #(
    .INIT(16'hABA8)) 
    \poly_bram_address[9]_INST_0 
       (.I0(wAddrCounter_reg[9]),
        .I1(s_din_state[0]),
        .I2(s_din_state[1]),
        .I3(rAddress_next[9]),
        .O(poly_bram_address[9]));
  LUT3 #(
    .INIT(8'h40)) 
    poly_bram_we_INST_0
       (.I0(s_din_state[0]),
        .I1(s_din_state[1]),
        .I2(s00_axis_tvalid),
        .O(poly_bram_we));
  LUT1 #(
    .INIT(2'h1)) 
    \rAddress[0]_i_1 
       (.I0(m00_axis_aresetn),
        .O(\rAddress[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7F7F7080808F708)) 
    \rAddress[0]_i_7 
       (.I0(m00_axis_tready),
        .I1(out[1]),
        .I2(out[0]),
        .I3(command0[3]),
        .I4(\slv_reg0_reg[3]_0 ),
        .I5(rAddress_reg),
        .O(S));
  FDRE \rAddress_reg[0] 
       (.C(m00_axis_aclk),
        .CE(\FSM_sequential_s_dout_state_reg[1]_0 ),
        .D(O[0]),
        .Q(rAddress_reg),
        .R(\rAddress[0]_i_1_n_0 ));
  FDRE \rAddress_reg[10] 
       (.C(m00_axis_aclk),
        .CE(\FSM_sequential_s_dout_state_reg[1]_0 ),
        .D(\rAddress_reg[11]_1 [2]),
        .Q(\rAddress_reg[11]_0 [9]),
        .R(\rAddress[0]_i_1_n_0 ));
  FDRE \rAddress_reg[11] 
       (.C(m00_axis_aclk),
        .CE(\FSM_sequential_s_dout_state_reg[1]_0 ),
        .D(\rAddress_reg[11]_1 [3]),
        .Q(\rAddress_reg[11]_0 [10]),
        .R(\rAddress[0]_i_1_n_0 ));
  FDRE \rAddress_reg[1] 
       (.C(m00_axis_aclk),
        .CE(\FSM_sequential_s_dout_state_reg[1]_0 ),
        .D(O[1]),
        .Q(\rAddress_reg[11]_0 [0]),
        .R(\rAddress[0]_i_1_n_0 ));
  FDRE \rAddress_reg[2] 
       (.C(m00_axis_aclk),
        .CE(\FSM_sequential_s_dout_state_reg[1]_0 ),
        .D(O[2]),
        .Q(\rAddress_reg[11]_0 [1]),
        .R(\rAddress[0]_i_1_n_0 ));
  FDRE \rAddress_reg[3] 
       (.C(m00_axis_aclk),
        .CE(\FSM_sequential_s_dout_state_reg[1]_0 ),
        .D(O[3]),
        .Q(\rAddress_reg[11]_0 [2]),
        .R(\rAddress[0]_i_1_n_0 ));
  FDRE \rAddress_reg[4] 
       (.C(m00_axis_aclk),
        .CE(\FSM_sequential_s_dout_state_reg[1]_0 ),
        .D(\rAddress_reg[7]_0 [0]),
        .Q(\rAddress_reg[11]_0 [3]),
        .R(\rAddress[0]_i_1_n_0 ));
  FDRE \rAddress_reg[5] 
       (.C(m00_axis_aclk),
        .CE(\FSM_sequential_s_dout_state_reg[1]_0 ),
        .D(\rAddress_reg[7]_0 [1]),
        .Q(\rAddress_reg[11]_0 [4]),
        .R(\rAddress[0]_i_1_n_0 ));
  FDRE \rAddress_reg[6] 
       (.C(m00_axis_aclk),
        .CE(\FSM_sequential_s_dout_state_reg[1]_0 ),
        .D(\rAddress_reg[7]_0 [2]),
        .Q(\rAddress_reg[11]_0 [5]),
        .R(\rAddress[0]_i_1_n_0 ));
  FDRE \rAddress_reg[7] 
       (.C(m00_axis_aclk),
        .CE(\FSM_sequential_s_dout_state_reg[1]_0 ),
        .D(\rAddress_reg[7]_0 [3]),
        .Q(\rAddress_reg[11]_0 [6]),
        .R(\rAddress[0]_i_1_n_0 ));
  FDRE \rAddress_reg[8] 
       (.C(m00_axis_aclk),
        .CE(\FSM_sequential_s_dout_state_reg[1]_0 ),
        .D(\rAddress_reg[11]_1 [0]),
        .Q(\rAddress_reg[11]_0 [7]),
        .R(\rAddress[0]_i_1_n_0 ));
  FDRE \rAddress_reg[9] 
       (.C(m00_axis_aclk),
        .CE(\FSM_sequential_s_dout_state_reg[1]_0 ),
        .D(\rAddress_reg[11]_1 [1]),
        .Q(\rAddress_reg[11]_0 [8]),
        .R(\rAddress[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    s00_axis_tready_INST_0
       (.I0(s_din_state[1]),
        .I1(s_din_state[0]),
        .O(s00_axis_tready));
  LUT1 #(
    .INIT(2'h1)) 
    \wAddrCounter[0]_i_1 
       (.I0(s00_axis_aresetn),
        .O(\wAddrCounter[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \wAddrCounter[0]_i_10 
       (.I0(s_din_state[0]),
        .I1(s_din_state[1]),
        .O(\wAddrCounter_reg[3]_0 ));
  LUT4 #(
    .INIT(16'h08FF)) 
    \wAddrCounter[0]_i_2 
       (.I0(s00_axis_tvalid),
        .I1(s_din_state[1]),
        .I2(s_din_state[0]),
        .I3(\slv_reg0_reg[2]_0 ),
        .O(\wAddrCounter[0]_i_2_n_0 ));
  FDRE \wAddrCounter_reg[0] 
       (.C(s00_axis_aclk),
        .CE(\wAddrCounter[0]_i_2_n_0 ),
        .D(\slv_reg0_reg[2] [0]),
        .Q(wAddrCounter_reg[0]),
        .R(\wAddrCounter[0]_i_1_n_0 ));
  FDRE \wAddrCounter_reg[10] 
       (.C(s00_axis_aclk),
        .CE(\wAddrCounter[0]_i_2_n_0 ),
        .D(\wAddrCounter_reg[11]_0 [2]),
        .Q(wAddrCounter_reg[10]),
        .R(\wAddrCounter[0]_i_1_n_0 ));
  FDRE \wAddrCounter_reg[11] 
       (.C(s00_axis_aclk),
        .CE(\wAddrCounter[0]_i_2_n_0 ),
        .D(\wAddrCounter_reg[11]_0 [3]),
        .Q(wAddrCounter_reg[11]),
        .R(\wAddrCounter[0]_i_1_n_0 ));
  FDRE \wAddrCounter_reg[1] 
       (.C(s00_axis_aclk),
        .CE(\wAddrCounter[0]_i_2_n_0 ),
        .D(\slv_reg0_reg[2] [1]),
        .Q(wAddrCounter_reg[1]),
        .R(\wAddrCounter[0]_i_1_n_0 ));
  FDRE \wAddrCounter_reg[2] 
       (.C(s00_axis_aclk),
        .CE(\wAddrCounter[0]_i_2_n_0 ),
        .D(\slv_reg0_reg[2] [2]),
        .Q(wAddrCounter_reg[2]),
        .R(\wAddrCounter[0]_i_1_n_0 ));
  FDRE \wAddrCounter_reg[3] 
       (.C(s00_axis_aclk),
        .CE(\wAddrCounter[0]_i_2_n_0 ),
        .D(\slv_reg0_reg[2] [3]),
        .Q(wAddrCounter_reg[3]),
        .R(\wAddrCounter[0]_i_1_n_0 ));
  FDRE \wAddrCounter_reg[4] 
       (.C(s00_axis_aclk),
        .CE(\wAddrCounter[0]_i_2_n_0 ),
        .D(\wAddrCounter_reg[7]_0 [0]),
        .Q(wAddrCounter_reg[4]),
        .R(\wAddrCounter[0]_i_1_n_0 ));
  FDRE \wAddrCounter_reg[5] 
       (.C(s00_axis_aclk),
        .CE(\wAddrCounter[0]_i_2_n_0 ),
        .D(\wAddrCounter_reg[7]_0 [1]),
        .Q(wAddrCounter_reg[5]),
        .R(\wAddrCounter[0]_i_1_n_0 ));
  FDRE \wAddrCounter_reg[6] 
       (.C(s00_axis_aclk),
        .CE(\wAddrCounter[0]_i_2_n_0 ),
        .D(\wAddrCounter_reg[7]_0 [2]),
        .Q(wAddrCounter_reg[6]),
        .R(\wAddrCounter[0]_i_1_n_0 ));
  FDRE \wAddrCounter_reg[7] 
       (.C(s00_axis_aclk),
        .CE(\wAddrCounter[0]_i_2_n_0 ),
        .D(\wAddrCounter_reg[7]_0 [3]),
        .Q(wAddrCounter_reg[7]),
        .R(\wAddrCounter[0]_i_1_n_0 ));
  FDRE \wAddrCounter_reg[8] 
       (.C(s00_axis_aclk),
        .CE(\wAddrCounter[0]_i_2_n_0 ),
        .D(\wAddrCounter_reg[11]_0 [0]),
        .Q(wAddrCounter_reg[8]),
        .R(\wAddrCounter[0]_i_1_n_0 ));
  FDRE \wAddrCounter_reg[9] 
       (.C(s00_axis_aclk),
        .CE(\wAddrCounter[0]_i_2_n_0 ),
        .D(\wAddrCounter_reg[11]_0 [1]),
        .Q(wAddrCounter_reg[9]),
        .R(\wAddrCounter[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \word_couter[0]_i_2 
       (.I0(out[0]),
        .I1(out[1]),
        .I2(m00_axis_tready),
        .O(DI));
  LUT1 #(
    .INIT(2'h1)) 
    \word_couter[0]_i_5 
       (.I0(word_couter_reg[0]),
        .O(\word_couter[0]_i_5_n_0 ));
  FDRE \word_couter_reg[0] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[0]_i_3_n_7 ),
        .Q(word_couter_reg[0]),
        .R(\slv_reg0_reg[3] ));
  CARRY4 \word_couter_reg[0]_i_3 
       (.CI(1'b0),
        .CO({\word_couter_reg[0]_i_3_n_0 ,\word_couter_reg[0]_i_3_n_1 ,\word_couter_reg[0]_i_3_n_2 ,\word_couter_reg[0]_i_3_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\word_couter_reg[0]_i_3_n_4 ,\word_couter_reg[0]_i_3_n_5 ,\word_couter_reg[0]_i_3_n_6 ,\word_couter_reg[0]_i_3_n_7 }),
        .S({word_couter_reg[3:1],\word_couter[0]_i_5_n_0 }));
  FDRE \word_couter_reg[10] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[8]_i_1_n_5 ),
        .Q(word_couter_reg[10]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[11] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[8]_i_1_n_4 ),
        .Q(word_couter_reg[11]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[12] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[12]_i_1_n_7 ),
        .Q(word_couter_reg[12]),
        .R(\slv_reg0_reg[3] ));
  CARRY4 \word_couter_reg[12]_i_1 
       (.CI(\word_couter_reg[8]_i_1_n_0 ),
        .CO({\word_couter_reg[12]_i_1_n_0 ,\word_couter_reg[12]_i_1_n_1 ,\word_couter_reg[12]_i_1_n_2 ,\word_couter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_couter_reg[12]_i_1_n_4 ,\word_couter_reg[12]_i_1_n_5 ,\word_couter_reg[12]_i_1_n_6 ,\word_couter_reg[12]_i_1_n_7 }),
        .S(word_couter_reg[15:12]));
  FDRE \word_couter_reg[13] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[12]_i_1_n_6 ),
        .Q(word_couter_reg[13]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[14] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[12]_i_1_n_5 ),
        .Q(word_couter_reg[14]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[15] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[12]_i_1_n_4 ),
        .Q(word_couter_reg[15]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[16] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[16]_i_1_n_7 ),
        .Q(word_couter_reg[16]),
        .R(\slv_reg0_reg[3] ));
  CARRY4 \word_couter_reg[16]_i_1 
       (.CI(\word_couter_reg[12]_i_1_n_0 ),
        .CO({\word_couter_reg[16]_i_1_n_0 ,\word_couter_reg[16]_i_1_n_1 ,\word_couter_reg[16]_i_1_n_2 ,\word_couter_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_couter_reg[16]_i_1_n_4 ,\word_couter_reg[16]_i_1_n_5 ,\word_couter_reg[16]_i_1_n_6 ,\word_couter_reg[16]_i_1_n_7 }),
        .S(word_couter_reg[19:16]));
  FDRE \word_couter_reg[17] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[16]_i_1_n_6 ),
        .Q(word_couter_reg[17]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[18] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[16]_i_1_n_5 ),
        .Q(word_couter_reg[18]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[19] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[16]_i_1_n_4 ),
        .Q(word_couter_reg[19]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[1] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[0]_i_3_n_6 ),
        .Q(word_couter_reg[1]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[20] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[20]_i_1_n_7 ),
        .Q(word_couter_reg[20]),
        .R(\slv_reg0_reg[3] ));
  CARRY4 \word_couter_reg[20]_i_1 
       (.CI(\word_couter_reg[16]_i_1_n_0 ),
        .CO({\word_couter_reg[20]_i_1_n_0 ,\word_couter_reg[20]_i_1_n_1 ,\word_couter_reg[20]_i_1_n_2 ,\word_couter_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_couter_reg[20]_i_1_n_4 ,\word_couter_reg[20]_i_1_n_5 ,\word_couter_reg[20]_i_1_n_6 ,\word_couter_reg[20]_i_1_n_7 }),
        .S(word_couter_reg[23:20]));
  FDRE \word_couter_reg[21] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[20]_i_1_n_6 ),
        .Q(word_couter_reg[21]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[22] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[20]_i_1_n_5 ),
        .Q(word_couter_reg[22]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[23] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[20]_i_1_n_4 ),
        .Q(word_couter_reg[23]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[24] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[24]_i_1_n_7 ),
        .Q(word_couter_reg[24]),
        .R(\slv_reg0_reg[3] ));
  CARRY4 \word_couter_reg[24]_i_1 
       (.CI(\word_couter_reg[20]_i_1_n_0 ),
        .CO({\word_couter_reg[24]_i_1_n_0 ,\word_couter_reg[24]_i_1_n_1 ,\word_couter_reg[24]_i_1_n_2 ,\word_couter_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_couter_reg[24]_i_1_n_4 ,\word_couter_reg[24]_i_1_n_5 ,\word_couter_reg[24]_i_1_n_6 ,\word_couter_reg[24]_i_1_n_7 }),
        .S(word_couter_reg[27:24]));
  FDRE \word_couter_reg[25] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[24]_i_1_n_6 ),
        .Q(word_couter_reg[25]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[26] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[24]_i_1_n_5 ),
        .Q(word_couter_reg[26]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[27] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[24]_i_1_n_4 ),
        .Q(word_couter_reg[27]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[28] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[28]_i_1_n_7 ),
        .Q(word_couter_reg[28]),
        .R(\slv_reg0_reg[3] ));
  CARRY4 \word_couter_reg[28]_i_1 
       (.CI(\word_couter_reg[24]_i_1_n_0 ),
        .CO({\NLW_word_couter_reg[28]_i_1_CO_UNCONNECTED [3],\word_couter_reg[28]_i_1_n_1 ,\word_couter_reg[28]_i_1_n_2 ,\word_couter_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_couter_reg[28]_i_1_n_4 ,\word_couter_reg[28]_i_1_n_5 ,\word_couter_reg[28]_i_1_n_6 ,\word_couter_reg[28]_i_1_n_7 }),
        .S(word_couter_reg[31:28]));
  FDRE \word_couter_reg[29] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[28]_i_1_n_6 ),
        .Q(word_couter_reg[29]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[2] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[0]_i_3_n_5 ),
        .Q(word_couter_reg[2]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[30] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[28]_i_1_n_5 ),
        .Q(word_couter_reg[30]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[31] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[28]_i_1_n_4 ),
        .Q(word_couter_reg[31]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[3] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[0]_i_3_n_4 ),
        .Q(word_couter_reg[3]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[4] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[4]_i_1_n_7 ),
        .Q(word_couter_reg[4]),
        .R(\slv_reg0_reg[3] ));
  CARRY4 \word_couter_reg[4]_i_1 
       (.CI(\word_couter_reg[0]_i_3_n_0 ),
        .CO({\word_couter_reg[4]_i_1_n_0 ,\word_couter_reg[4]_i_1_n_1 ,\word_couter_reg[4]_i_1_n_2 ,\word_couter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_couter_reg[4]_i_1_n_4 ,\word_couter_reg[4]_i_1_n_5 ,\word_couter_reg[4]_i_1_n_6 ,\word_couter_reg[4]_i_1_n_7 }),
        .S({\word_couter_reg[11]_0 [0],word_couter_reg[6:4]}));
  FDRE \word_couter_reg[5] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[4]_i_1_n_6 ),
        .Q(word_couter_reg[5]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[6] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[4]_i_1_n_5 ),
        .Q(word_couter_reg[6]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[7] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[4]_i_1_n_4 ),
        .Q(\word_couter_reg[11]_0 [0]),
        .R(\slv_reg0_reg[3] ));
  FDRE \word_couter_reg[8] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[8]_i_1_n_7 ),
        .Q(word_couter_reg[8]),
        .R(\slv_reg0_reg[3] ));
  CARRY4 \word_couter_reg[8]_i_1 
       (.CI(\word_couter_reg[4]_i_1_n_0 ),
        .CO({\word_couter_reg[8]_i_1_n_0 ,\word_couter_reg[8]_i_1_n_1 ,\word_couter_reg[8]_i_1_n_2 ,\word_couter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\word_couter_reg[8]_i_1_n_4 ,\word_couter_reg[8]_i_1_n_5 ,\word_couter_reg[8]_i_1_n_6 ,\word_couter_reg[8]_i_1_n_7 }),
        .S({word_couter_reg[11:10],\word_couter_reg[11]_0 [1],word_couter_reg[8]}));
  FDRE \word_couter_reg[9] 
       (.C(m00_axis_aclk),
        .CE(DI),
        .D(\word_couter_reg[8]_i_1_n_6 ),
        .Q(\word_couter_reg[11]_0 [1]),
        .R(\slv_reg0_reg[3] ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
