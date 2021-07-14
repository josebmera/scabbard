-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
-- Date        : Wed Nov 27 18:51:27 2019
-- Host        : xellos running 64-bit Ubuntu 18.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/jose/vivado/hw_sw_interface/hw_sw_interface.srcs/sources_1/bd/design_1/ip/design_1_wrapper_0_0/design_1_wrapper_0_0_stub.vhdl
-- Design      : design_1_wrapper_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_wrapper_0_0 is
  Port ( 
    clock : in STD_LOGIC;
    resetn : in STD_LOGIC;
    poly_bram_address : in STD_LOGIC_VECTOR ( 11 downto 0 );
    poly_bram_din : in STD_LOGIC_VECTOR ( 63 downto 0 );
    poly_bram_we : in STD_LOGIC;
    poly_bram_dout : out STD_LOGIC_VECTOR ( 63 downto 0 );
    command0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    status0 : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end design_1_wrapper_0_0;

architecture stub of design_1_wrapper_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clock,resetn,poly_bram_address[11:0],poly_bram_din[63:0],poly_bram_we,poly_bram_dout[63:0],command0[31:0],status0[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "wrapper,Vivado 2018.1";
begin
end;
