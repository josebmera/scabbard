
`timescale 1 ns / 1 ps

module interfacer_v1_0 #
(
    parameter integer STREAM_DATA_WIDTH        = 64  ,
    parameter integer STREAM_ADDR_WIDTH        = 10  ,

    parameter integer NUMWORDS_64	           = 64  ,
    parameter integer NUMWORDS_128	           = 128 ,
    parameter integer NUMWORDS_192	           = 192 ,
    parameter integer NUMWORDS_576	           = 576 ,
    parameter integer NUMWORDS_1024	           = 1024,

    parameter integer REG_DATA_WIDTH           = 32  ,
    parameter integer REG_ADDR_WIDTH           = 4
)
(
    // Users to add ports here
    
    output wire [STREAM_ADDR_WIDTH-1:0]  poly_bram_address, 
    output wire [STREAM_DATA_WIDTH-1:0]  poly_bram_din,
    output wire                          poly_bram_we  ,
    input  wire [STREAM_DATA_WIDTH-1:0]  poly_bram_dout,
    
    output wire [REG_DATA_WIDTH-1:0]     command0,
    input wire  [REG_DATA_WIDTH-1:0]     status0, 
    
    // User ports ends
    
    // Ports of Axi Slave Bus Interface S00_AXI
    input wire  s00_axi_aclk,
    input wire  s00_axi_aresetn,
    input wire [REG_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
    input wire [2 : 0] s00_axi_awprot,
    input wire  s00_axi_awvalid,
    output wire  s00_axi_awready,
    input wire [REG_DATA_WIDTH-1 : 0] s00_axi_wdata,
    input wire [(REG_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
    input wire  s00_axi_wvalid,
    output wire  s00_axi_wready,
    output wire [1 : 0] s00_axi_bresp,
    output wire  s00_axi_bvalid,
    input wire  s00_axi_bready,
    input wire [REG_ADDR_WIDTH-1 : 0] s00_axi_araddr,
    input wire [2 : 0] s00_axi_arprot,
    input wire  s00_axi_arvalid,
    output wire  s00_axi_arready,
    output wire [REG_DATA_WIDTH-1 : 0] s00_axi_rdata,
    output wire [1 : 0] s00_axi_rresp,
    output wire  s00_axi_rvalid,
    input wire  s00_axi_rready,

    // Ports of Axi Slave Bus Interface S00_AXIS
    input wire  s00_axis_aclk,
    input wire  s00_axis_aresetn,
    output wire  s00_axis_tready,
    input wire [STREAM_DATA_WIDTH-1 : 0] s00_axis_tdata,
    input wire [(STREAM_DATA_WIDTH/8)-1 : 0] s00_axis_tkeep,
    input wire  s00_axis_tlast,
    input wire  s00_axis_tvalid,

    // Ports of Axi Master Bus Interface M00_AXIS
    input wire  m00_axis_aclk,
    input wire  m00_axis_aresetn,
    output wire  m00_axis_tvalid,
    output wire [STREAM_DATA_WIDTH-1 : 0] m00_axis_tdata,
    output wire [(STREAM_DATA_WIDTH/8)-1 : 0] m00_axis_tkeep,
    output wire  m00_axis_tlast,
    input wire  m00_axis_tready
);

assign command0 = command0_w;
assign status0_w = status0;

wire [REG_DATA_WIDTH-1:0] command0_w;
wire [REG_DATA_WIDTH-1:0] status0_w;
wire [REG_DATA_WIDTH-1:0] status1_w;

streamer # (
    .DATA_WIDTH         (STREAM_DATA_WIDTH         ),
    .ADDR_WIDTH         (STREAM_ADDR_WIDTH         ),

    .NUMWORDS_64        (NUMWORDS_64               ),    
    .NUMWORDS_128       (NUMWORDS_128              ),    
    .NUMWORDS_192       (NUMWORDS_192              ),    
    .NUMWORDS_576       (NUMWORDS_576              ),    
    .NUMWORDS_1024      (NUMWORDS_1024             )
) 
streamer_inst (
    
    .Command0           (command0_w         ),
    .Status0            (status1_w          ),

    .dout_ACLK          (m00_axis_aclk      ),
    .dout_ARESETN       (m00_axis_aresetn   ),
    .dout_TVALID        (m00_axis_tvalid    ),
    .dout_TDATA         (m00_axis_tdata     ),
    .dout_TKEEP         (m00_axis_tkeep     ),
    .dout_TLAST         (m00_axis_tlast     ),
    .dout_TREADY        (m00_axis_tready    ),

    .din_ACLK           (s00_axis_aclk      ),
    .din_ARESETN        (s00_axis_aresetn   ),
    .din_TREADY         (s00_axis_tready    ),
    .din_TDATA          (s00_axis_tdata     ),
    .din_TKEEP          (s00_axis_tkeep     ),
    .din_TLAST          (s00_axis_tlast     ),
    .din_TVALID         (s00_axis_tvalid    ),
    
    .poly_bram_address  (poly_bram_address  ),
    .poly_bram_din      (poly_bram_din      ),      
    .poly_bram_we       (poly_bram_we       ),
    .poly_bram_dout     (poly_bram_dout     )
);

registers # ( 
    .C_S_AXI_DATA_WIDTH ( REG_DATA_WIDTH    ),
    .C_S_AXI_ADDR_WIDTH ( REG_ADDR_WIDTH    )
) registers_inst (
    .command0           ( command0_w        ),  // Address 0
    .status0            ( status0_w         ),  // Address 1
    .command1           (                   ),  // Address 2
    .status1            ( status1_w         ),  // Address 3

    .S_AXI_ACLK         ( s00_axi_aclk      ),
    .S_AXI_ARESETN      ( s00_axi_aresetn   ),
    .S_AXI_AWADDR       ( s00_axi_awaddr    ),
    .S_AXI_AWPROT       ( s00_axi_awprot    ),
    .S_AXI_AWVALID      ( s00_axi_awvalid   ),
    .S_AXI_AWREADY      ( s00_axi_awready   ),
    .S_AXI_WDATA        ( s00_axi_wdata     ),
    .S_AXI_WSTRB        ( s00_axi_wstrb     ),
    .S_AXI_WVALID       ( s00_axi_wvalid    ),
    .S_AXI_WREADY       ( s00_axi_wready    ),
    .S_AXI_BRESP        ( s00_axi_bresp     ),
    .S_AXI_BVALID       ( s00_axi_bvalid    ),
    .S_AXI_BREADY       ( s00_axi_bready    ),
    .S_AXI_ARADDR       ( s00_axi_araddr    ),
    .S_AXI_ARPROT       ( s00_axi_arprot    ),
    .S_AXI_ARVALID      ( s00_axi_arvalid   ),
    .S_AXI_ARREADY      ( s00_axi_arready   ),
    .S_AXI_RDATA        ( s00_axi_rdata     ),
    .S_AXI_RRESP        ( s00_axi_rresp     ),
    .S_AXI_RVALID       ( s00_axi_rvalid    ),
    .S_AXI_RREADY       ( s00_axi_rready    )
);

endmodule