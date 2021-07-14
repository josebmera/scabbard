-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
-- Date        : Fri Apr  5 14:48:35 2019
-- Host        : xellos running 64-bit Ubuntu 16.04.6 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top design_1_interfacer_ipcore_0_0_0 -prefix
--               design_1_interfacer_ipcore_0_0_0_ design_1_interfacer_ipcore_0_0_0_sim_netlist.vhdl
-- Design      : design_1_interfacer_ipcore_0_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_interfacer_ipcore_0_0_0_registers is
  port (
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    wAddrCounter_reg_3_sp_1 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 31 downto 0 );
    \FSM_sequential_s_dout_state_reg[1]\ : out STD_LOGIC;
    \FSM_sequential_s_din_state_reg[1]\ : out STD_LOGIC;
    \rAddress_reg[11]\ : out STD_LOGIC;
    \rAddress_reg[11]_0\ : out STD_LOGIC;
    \word_couter_reg[31]\ : out STD_LOGIC;
    \word_couter_reg[31]_0\ : out STD_LOGIC;
    done_read_reg : out STD_LOGIC;
    done_read_reg_0 : out STD_LOGIC;
    done_read_reg_1 : out STD_LOGIC;
    O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \rAddress_reg[7]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \rAddress_reg[11]_1\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \wAddrCounter_reg[3]_0\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \wAddrCounter_reg[7]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \wAddrCounter_reg[11]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    wAddrCounter_reg : in STD_LOGIC_VECTOR ( 11 downto 0 );
    \FSM_sequential_s_din_state_reg[0]\ : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m00_axis_aresetn : in STD_LOGIC;
    rAddress_reg : in STD_LOGIC_VECTOR ( 10 downto 0 );
    word_couter_reg : in STD_LOGIC_VECTOR ( 1 downto 0 );
    status0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    done_write : in STD_LOGIC;
    done_read : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 0 to 0 );
    S : in STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end design_1_interfacer_ipcore_0_0_0_registers;

architecture STRUCTURE of design_1_interfacer_ipcore_0_0_0_registers is
  signal \FSM_sequential_s_din_state[1]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_din_state[1]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_din_state[1]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_din_state[1]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_din_state[1]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_din_state[1]_i_8_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_din_state[1]_i_9_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal aw_en_i_1_n_0 : STD_LOGIC;
  signal aw_en_reg_n_0 : STD_LOGIC;
  signal axi_araddr : STD_LOGIC_VECTOR ( 5 downto 2 );
  signal axi_arready0 : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \axi_rdata[0]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[16]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_2_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_3_n_0\ : STD_LOGIC;
  signal \axi_rdata[31]_i_4_n_0\ : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_0_in_0 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \rAddress[0]_i_4_n_0\ : STD_LOGIC;
  signal \rAddress[0]_i_5_n_0\ : STD_LOGIC;
  signal \rAddress[0]_i_6_n_0\ : STD_LOGIC;
  signal \rAddress[4]_i_2_n_0\ : STD_LOGIC;
  signal \rAddress[4]_i_3_n_0\ : STD_LOGIC;
  signal \rAddress[4]_i_4_n_0\ : STD_LOGIC;
  signal \rAddress[4]_i_5_n_0\ : STD_LOGIC;
  signal \rAddress[8]_i_2_n_0\ : STD_LOGIC;
  signal \rAddress[8]_i_3_n_0\ : STD_LOGIC;
  signal \rAddress[8]_i_4_n_0\ : STD_LOGIC;
  signal \rAddress[8]_i_5_n_0\ : STD_LOGIC;
  signal \rAddress_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \rAddress_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \rAddress_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \rAddress_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \^raddress_reg[11]_0\ : STD_LOGIC;
  signal \rAddress_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \rAddress_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \rAddress_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \rAddress_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \rAddress_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \rAddress_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \rAddress_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \^s00_axi_arready\ : STD_LOGIC;
  signal \^s00_axi_awready\ : STD_LOGIC;
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal \^s00_axi_wready\ : STD_LOGIC;
  signal slv_reg0 : STD_LOGIC;
  signal \slv_reg0[31]_i_1_n_0\ : STD_LOGIC;
  signal slv_reg2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal slv_reg2_1 : STD_LOGIC;
  signal \slv_reg_rden__0\ : STD_LOGIC;
  signal \slv_reg_wren__0\ : STD_LOGIC;
  signal \wAddrCounter[0]_i_5_n_0\ : STD_LOGIC;
  signal \wAddrCounter[0]_i_6_n_0\ : STD_LOGIC;
  signal \wAddrCounter[0]_i_7_n_0\ : STD_LOGIC;
  signal \wAddrCounter[0]_i_8_n_0\ : STD_LOGIC;
  signal \wAddrCounter[0]_i_9_n_0\ : STD_LOGIC;
  signal \wAddrCounter[4]_i_2_n_0\ : STD_LOGIC;
  signal \wAddrCounter[4]_i_3_n_0\ : STD_LOGIC;
  signal \wAddrCounter[4]_i_4_n_0\ : STD_LOGIC;
  signal \wAddrCounter[4]_i_5_n_0\ : STD_LOGIC;
  signal \wAddrCounter[8]_i_2_n_0\ : STD_LOGIC;
  signal \wAddrCounter[8]_i_3_n_0\ : STD_LOGIC;
  signal \wAddrCounter[8]_i_4_n_0\ : STD_LOGIC;
  signal \wAddrCounter[8]_i_5_n_0\ : STD_LOGIC;
  signal \wAddrCounter_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \wAddrCounter_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \wAddrCounter_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \wAddrCounter_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \wAddrCounter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \wAddrCounter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \wAddrCounter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \wAddrCounter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \wAddrCounter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \wAddrCounter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \wAddrCounter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal wAddrCounter_reg_3_sn_1 : STD_LOGIC;
  signal \^word_couter_reg[31]_0\ : STD_LOGIC;
  signal \NLW_rAddress_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_wAddrCounter_reg[8]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_s_din_state[1]_i_8\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axi_wready_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of m00_axis_tlast_INST_0_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of m00_axis_tlast_INST_0_i_9 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \slv_reg0[31]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \wAddrCounter[0]_i_9\ : label is "soft_lutpair1";
begin
  Q(31 downto 0) <= \^q\(31 downto 0);
  \rAddress_reg[11]_0\ <= \^raddress_reg[11]_0\;
  s00_axi_arready <= \^s00_axi_arready\;
  s00_axi_awready <= \^s00_axi_awready\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
  s00_axi_wready <= \^s00_axi_wready\;
  wAddrCounter_reg_3_sp_1 <= wAddrCounter_reg_3_sn_1;
  \word_couter_reg[31]_0\ <= \^word_couter_reg[31]_0\;
\FSM_sequential_s_din_state[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \FSM_sequential_s_din_state[1]_i_3_n_0\,
      I1 => \FSM_sequential_s_din_state[1]_i_4_n_0\,
      I2 => \FSM_sequential_s_din_state[1]_i_5_n_0\,
      I3 => \FSM_sequential_s_din_state[1]_i_6_n_0\,
      O => \FSM_sequential_s_din_state_reg[1]\
    );
\FSM_sequential_s_din_state[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \^q\(14),
      I1 => \^q\(15),
      I2 => \^q\(12),
      I3 => \^q\(13),
      I4 => \FSM_sequential_s_din_state[1]_i_7_n_0\,
      O => \FSM_sequential_s_din_state[1]_i_3_n_0\
    );
\FSM_sequential_s_din_state[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \^q\(10),
      I1 => \^q\(11),
      I2 => \^q\(8),
      I3 => \^q\(9),
      I4 => \^raddress_reg[11]_0\,
      O => \FSM_sequential_s_din_state[1]_i_4_n_0\
    );
\FSM_sequential_s_din_state[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \^q\(30),
      I1 => \^q\(31),
      I2 => \^q\(28),
      I3 => \^q\(29),
      I4 => \^q\(3),
      I5 => \FSM_sequential_s_din_state[1]_i_8_n_0\,
      O => \FSM_sequential_s_din_state[1]_i_5_n_0\
    );
\FSM_sequential_s_din_state[1]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \^q\(22),
      I1 => \^q\(23),
      I2 => \^q\(20),
      I3 => \^q\(21),
      I4 => \FSM_sequential_s_din_state[1]_i_9_n_0\,
      O => \FSM_sequential_s_din_state[1]_i_6_n_0\
    );
\FSM_sequential_s_din_state[1]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^q\(17),
      I1 => \^q\(16),
      I2 => \^q\(19),
      I3 => \^q\(18),
      O => \FSM_sequential_s_din_state[1]_i_7_n_0\
    );
\FSM_sequential_s_din_state[1]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      O => \FSM_sequential_s_din_state[1]_i_8_n_0\
    );
\FSM_sequential_s_din_state[1]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^q\(25),
      I1 => \^q\(24),
      I2 => \^q\(27),
      I3 => \^q\(26),
      O => \FSM_sequential_s_din_state[1]_i_9_n_0\
    );
\FSM_sequential_s_dout_state[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFE000000000000"
    )
        port map (
      I0 => \FSM_sequential_s_din_state[1]_i_6_n_0\,
      I1 => \FSM_sequential_s_din_state[1]_i_5_n_0\,
      I2 => \FSM_sequential_s_din_state[1]_i_4_n_0\,
      I3 => \FSM_sequential_s_din_state[1]_i_3_n_0\,
      I4 => \out\(1),
      I5 => \out\(0),
      O => \FSM_sequential_s_dout_state_reg[1]\
    );
aw_en_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFC4CCC4CCC4CC"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => aw_en_reg_n_0,
      I2 => \^s00_axi_awready\,
      I3 => s00_axi_wvalid,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => aw_en_i_1_n_0
    );
aw_en_reg: unisim.vcomponents.FDSE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => aw_en_i_1_n_0,
      Q => aw_en_reg_n_0,
      S => \slv_reg0[31]_i_1_n_0\
    );
\axi_araddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(0),
      Q => axi_araddr(2),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_araddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(1),
      Q => axi_araddr(3),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_araddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(2),
      Q => axi_araddr(4),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_araddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_arready0,
      D => s00_axi_araddr(3),
      Q => axi_araddr(5),
      R => \slv_reg0[31]_i_1_n_0\
    );
axi_arready_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_arready\,
      O => axi_arready0
    );
axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_arready0,
      Q => \^s00_axi_arready\,
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(0),
      Q => p_0_in_0(0),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(1),
      Q => p_0_in_0(1),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_awaddr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(2),
      Q => p_0_in(1),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_awaddr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => axi_awready0,
      D => s00_axi_awaddr(3),
      Q => p_0_in(0),
      R => \slv_reg0[31]_i_1_n_0\
    );
axi_awready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => \^s00_axi_awready\,
      I2 => aw_en_reg_n_0,
      I3 => s00_axi_awvalid,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^s00_axi_awready\,
      R => \slv_reg0[31]_i_1_n_0\
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s00_axi_awready\,
      I3 => \^s00_axi_wready\,
      I4 => s00_axi_bready,
      I5 => \^s00_axi_bvalid\,
      O => axi_bvalid_i_1_n_0
    );
axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_bvalid_i_1_n_0,
      Q => \^s00_axi_bvalid\,
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \axi_rdata[0]_i_2_n_0\,
      I1 => \axi_rdata[31]_i_3_n_0\,
      I2 => status0(0),
      I3 => slv_reg2(0),
      I4 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(0)
    );
\axi_rdata[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0300000000020002"
    )
        port map (
      I0 => \^q\(0),
      I1 => axi_araddr(5),
      I2 => axi_araddr(4),
      I3 => axi_araddr(2),
      I4 => done_write,
      I5 => axi_araddr(3),
      O => \axi_rdata[0]_i_2_n_0\
    );
\axi_rdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(10),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(10),
      I4 => slv_reg2(10),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(10)
    );
\axi_rdata[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(11),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(11),
      I4 => slv_reg2(11),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(11)
    );
\axi_rdata[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(12),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(12),
      I4 => slv_reg2(12),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(12)
    );
\axi_rdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(13),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(13),
      I4 => slv_reg2(13),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(13)
    );
\axi_rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(14),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(14),
      I4 => slv_reg2(14),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(14)
    );
\axi_rdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(15),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(15),
      I4 => slv_reg2(15),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(15)
    );
\axi_rdata[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \axi_rdata[16]_i_2_n_0\,
      I1 => \axi_rdata[31]_i_3_n_0\,
      I2 => status0(16),
      I3 => slv_reg2(16),
      I4 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(16)
    );
\axi_rdata[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0300000000020002"
    )
        port map (
      I0 => \^q\(16),
      I1 => axi_araddr(5),
      I2 => axi_araddr(4),
      I3 => axi_araddr(2),
      I4 => done_read,
      I5 => axi_araddr(3),
      O => \axi_rdata[16]_i_2_n_0\
    );
\axi_rdata[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(17),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(17),
      I4 => slv_reg2(17),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(17)
    );
\axi_rdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(18),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(18),
      I4 => slv_reg2(18),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(18)
    );
\axi_rdata[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(19),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(19),
      I4 => slv_reg2(19),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(19)
    );
\axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(1),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(1),
      I4 => slv_reg2(1),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(1)
    );
\axi_rdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(20),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(20),
      I4 => slv_reg2(20),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(20)
    );
\axi_rdata[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(21),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(21),
      I4 => slv_reg2(21),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(21)
    );
\axi_rdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(22),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(22),
      I4 => slv_reg2(22),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(22)
    );
\axi_rdata[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(23),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(23),
      I4 => slv_reg2(23),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(23)
    );
\axi_rdata[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(24),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(24),
      I4 => slv_reg2(24),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(24)
    );
\axi_rdata[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(25),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(25),
      I4 => slv_reg2(25),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(25)
    );
\axi_rdata[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(26),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(26),
      I4 => slv_reg2(26),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(26)
    );
\axi_rdata[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(27),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(27),
      I4 => slv_reg2(27),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(27)
    );
\axi_rdata[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(28),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(28),
      I4 => slv_reg2(28),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(28)
    );
\axi_rdata[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(29),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(29),
      I4 => slv_reg2(29),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(29)
    );
\axi_rdata[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(2),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(2),
      I4 => slv_reg2(2),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(2)
    );
\axi_rdata[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(30),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(30),
      I4 => slv_reg2(30),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(30)
    );
\axi_rdata[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(31),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(31),
      I4 => slv_reg2(31),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(31)
    );
\axi_rdata[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => axi_araddr(2),
      I1 => axi_araddr(4),
      I2 => axi_araddr(5),
      I3 => axi_araddr(3),
      O => \axi_rdata[31]_i_2_n_0\
    );
\axi_rdata[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => axi_araddr(2),
      I1 => axi_araddr(4),
      I2 => axi_araddr(5),
      I3 => axi_araddr(3),
      O => \axi_rdata[31]_i_3_n_0\
    );
\axi_rdata[31]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => axi_araddr(2),
      I1 => axi_araddr(4),
      I2 => axi_araddr(5),
      I3 => axi_araddr(3),
      O => \axi_rdata[31]_i_4_n_0\
    );
\axi_rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(3),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(3),
      I4 => slv_reg2(3),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(3)
    );
\axi_rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(4),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(4),
      I4 => slv_reg2(4),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(4)
    );
\axi_rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(5),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(5),
      I4 => slv_reg2(5),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(5)
    );
\axi_rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(6),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(6),
      I4 => slv_reg2(6),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(6)
    );
\axi_rdata[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(7),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(7),
      I4 => slv_reg2(7),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(7)
    );
\axi_rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(8),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(8),
      I4 => slv_reg2(8),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(8)
    );
\axi_rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \axi_rdata[31]_i_2_n_0\,
      I1 => \^q\(9),
      I2 => \axi_rdata[31]_i_3_n_0\,
      I3 => status0(9),
      I4 => slv_reg2(9),
      I5 => \axi_rdata[31]_i_4_n_0\,
      O => p_1_in(9)
    );
\axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(0),
      Q => s00_axi_rdata(0),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(10),
      Q => s00_axi_rdata(10),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(11),
      Q => s00_axi_rdata(11),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(12),
      Q => s00_axi_rdata(12),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(13),
      Q => s00_axi_rdata(13),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(14),
      Q => s00_axi_rdata(14),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(15),
      Q => s00_axi_rdata(15),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(16),
      Q => s00_axi_rdata(16),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(17),
      Q => s00_axi_rdata(17),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(18),
      Q => s00_axi_rdata(18),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(19),
      Q => s00_axi_rdata(19),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(1),
      Q => s00_axi_rdata(1),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(20),
      Q => s00_axi_rdata(20),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(21),
      Q => s00_axi_rdata(21),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(22),
      Q => s00_axi_rdata(22),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(23),
      Q => s00_axi_rdata(23),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(24),
      Q => s00_axi_rdata(24),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(25),
      Q => s00_axi_rdata(25),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(26),
      Q => s00_axi_rdata(26),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(27),
      Q => s00_axi_rdata(27),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(28),
      Q => s00_axi_rdata(28),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(29),
      Q => s00_axi_rdata(29),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(2),
      Q => s00_axi_rdata(2),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(30),
      Q => s00_axi_rdata(30),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(31),
      Q => s00_axi_rdata(31),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(3),
      Q => s00_axi_rdata(3),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(4),
      Q => s00_axi_rdata(4),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(5),
      Q => s00_axi_rdata(5),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(6),
      Q => s00_axi_rdata(6),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(7),
      Q => s00_axi_rdata(7),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(8),
      Q => s00_axi_rdata(8),
      R => \slv_reg0[31]_i_1_n_0\
    );
\axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => \slv_reg_rden__0\,
      D => p_1_in(9),
      Q => s00_axi_rdata(9),
      R => \slv_reg0[31]_i_1_n_0\
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => \^s00_axi_arready\,
      I1 => s00_axi_arvalid,
      I2 => \^s00_axi_rvalid\,
      I3 => s00_axi_rready,
      O => axi_rvalid_i_1_n_0
    );
axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_rvalid_i_1_n_0,
      Q => \^s00_axi_rvalid\,
      R => \slv_reg0[31]_i_1_n_0\
    );
axi_wready_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => s00_axi_awvalid,
      I1 => s00_axi_wvalid,
      I2 => \^s00_axi_wready\,
      I3 => aw_en_reg_n_0,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^s00_axi_wready\,
      R => \slv_reg0[31]_i_1_n_0\
    );
done_read_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(5),
      I2 => \^q\(4),
      I3 => \^q\(7),
      I4 => \^q\(6),
      I5 => \out\(0),
      O => done_read_reg_0
    );
m00_axis_tlast_INST_0_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(7),
      I2 => \^q\(4),
      I3 => \^q\(5),
      I4 => \^q\(0),
      O => \^raddress_reg[11]_0\
    );
m00_axis_tlast_INST_0_i_12: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      O => done_read_reg_1
    );
m00_axis_tlast_INST_0_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01000080"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      I2 => word_couter_reg(0),
      I3 => word_couter_reg(1),
      I4 => \^q\(3),
      O => done_read_reg
    );
\rAddress[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEFEEEFEFEFEFEE"
    )
        port map (
      I0 => \out\(1),
      I1 => \out\(0),
      I2 => \^raddress_reg[11]_0\,
      I3 => \^q\(3),
      I4 => \^q\(1),
      I5 => \^q\(2),
      O => \rAddress_reg[11]\
    );
\rAddress[0]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rAddress_reg(2),
      I1 => \^word_couter_reg[31]_0\,
      I2 => \^q\(11),
      O => \rAddress[0]_i_4_n_0\
    );
\rAddress[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rAddress_reg(1),
      I1 => \^word_couter_reg[31]_0\,
      I2 => \^q\(10),
      O => \rAddress[0]_i_5_n_0\
    );
\rAddress[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rAddress_reg(0),
      I1 => \^word_couter_reg[31]_0\,
      I2 => \^q\(9),
      O => \rAddress[0]_i_6_n_0\
    );
\rAddress[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rAddress_reg(6),
      I1 => \^word_couter_reg[31]_0\,
      I2 => \^q\(15),
      O => \rAddress[4]_i_2_n_0\
    );
\rAddress[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rAddress_reg(5),
      I1 => \^word_couter_reg[31]_0\,
      I2 => \^q\(14),
      O => \rAddress[4]_i_3_n_0\
    );
\rAddress[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rAddress_reg(4),
      I1 => \^word_couter_reg[31]_0\,
      I2 => \^q\(13),
      O => \rAddress[4]_i_4_n_0\
    );
\rAddress[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rAddress_reg(3),
      I1 => \^word_couter_reg[31]_0\,
      I2 => \^q\(12),
      O => \rAddress[4]_i_5_n_0\
    );
\rAddress[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rAddress_reg(10),
      I1 => \^word_couter_reg[31]_0\,
      I2 => \^q\(19),
      O => \rAddress[8]_i_2_n_0\
    );
\rAddress[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rAddress_reg(9),
      I1 => \^word_couter_reg[31]_0\,
      I2 => \^q\(18),
      O => \rAddress[8]_i_3_n_0\
    );
\rAddress[8]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rAddress_reg(8),
      I1 => \^word_couter_reg[31]_0\,
      I2 => \^q\(17),
      O => \rAddress[8]_i_4_n_0\
    );
\rAddress[8]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rAddress_reg(7),
      I1 => \^word_couter_reg[31]_0\,
      I2 => \^q\(16),
      O => \rAddress[8]_i_5_n_0\
    );
\rAddress_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \rAddress_reg[0]_i_3_n_0\,
      CO(2) => \rAddress_reg[0]_i_3_n_1\,
      CO(1) => \rAddress_reg[0]_i_3_n_2\,
      CO(0) => \rAddress_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => DI(0),
      O(3 downto 0) => O(3 downto 0),
      S(3) => \rAddress[0]_i_4_n_0\,
      S(2) => \rAddress[0]_i_5_n_0\,
      S(1) => \rAddress[0]_i_6_n_0\,
      S(0) => S(0)
    );
\rAddress_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rAddress_reg[0]_i_3_n_0\,
      CO(3) => \rAddress_reg[4]_i_1_n_0\,
      CO(2) => \rAddress_reg[4]_i_1_n_1\,
      CO(1) => \rAddress_reg[4]_i_1_n_2\,
      CO(0) => \rAddress_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \rAddress_reg[7]\(3 downto 0),
      S(3) => \rAddress[4]_i_2_n_0\,
      S(2) => \rAddress[4]_i_3_n_0\,
      S(1) => \rAddress[4]_i_4_n_0\,
      S(0) => \rAddress[4]_i_5_n_0\
    );
\rAddress_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rAddress_reg[4]_i_1_n_0\,
      CO(3) => \NLW_rAddress_reg[8]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \rAddress_reg[8]_i_1_n_1\,
      CO(1) => \rAddress_reg[8]_i_1_n_2\,
      CO(0) => \rAddress_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \rAddress_reg[11]_1\(3 downto 0),
      S(3) => \rAddress[8]_i_2_n_0\,
      S(2) => \rAddress[8]_i_3_n_0\,
      S(1) => \rAddress[8]_i_4_n_0\,
      S(0) => \rAddress[8]_i_5_n_0\
    );
\slv_reg0[31]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(0),
      I2 => p_0_in(1),
      I3 => p_0_in_0(0),
      I4 => p_0_in_0(1),
      O => slv_reg0
    );
\slv_reg0[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^s00_axi_wready\,
      I1 => \^s00_axi_awready\,
      I2 => s00_axi_awvalid,
      I3 => s00_axi_wvalid,
      O => \slv_reg_wren__0\
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(0),
      Q => \^q\(0),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(10),
      Q => \^q\(10),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(11),
      Q => \^q\(11),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(12),
      Q => \^q\(12),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(13),
      Q => \^q\(13),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(14),
      Q => \^q\(14),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(15),
      Q => \^q\(15),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(16),
      Q => \^q\(16),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(17),
      Q => \^q\(17),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(18),
      Q => \^q\(18),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(19),
      Q => \^q\(19),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(1),
      Q => \^q\(1),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(20),
      Q => \^q\(20),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(21),
      Q => \^q\(21),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(22),
      Q => \^q\(22),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(23),
      Q => \^q\(23),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(24),
      Q => \^q\(24),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(25),
      Q => \^q\(25),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(26),
      Q => \^q\(26),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(27),
      Q => \^q\(27),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(28),
      Q => \^q\(28),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(29),
      Q => \^q\(29),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(2),
      Q => \^q\(2),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(30),
      Q => \^q\(30),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(31),
      Q => \^q\(31),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(3),
      Q => \^q\(3),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(4),
      Q => \^q\(4),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(5),
      Q => \^q\(5),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(6),
      Q => \^q\(6),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(7),
      Q => \^q\(7),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(8),
      Q => \^q\(8),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg0,
      D => s00_axi_wdata(9),
      Q => \^q\(9),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => p_0_in(0),
      I2 => p_0_in(1),
      I3 => p_0_in_0(1),
      I4 => p_0_in_0(0),
      O => slv_reg2_1
    );
\slv_reg2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(0),
      Q => slv_reg2(0),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(10),
      Q => slv_reg2(10),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(11),
      Q => slv_reg2(11),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(12),
      Q => slv_reg2(12),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(13),
      Q => slv_reg2(13),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(14),
      Q => slv_reg2(14),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(15),
      Q => slv_reg2(15),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(16),
      Q => slv_reg2(16),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(17),
      Q => slv_reg2(17),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(18),
      Q => slv_reg2(18),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(19),
      Q => slv_reg2(19),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(1),
      Q => slv_reg2(1),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(20),
      Q => slv_reg2(20),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(21),
      Q => slv_reg2(21),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(22),
      Q => slv_reg2(22),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(23),
      Q => slv_reg2(23),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(24),
      Q => slv_reg2(24),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(25),
      Q => slv_reg2(25),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(26),
      Q => slv_reg2(26),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(27),
      Q => slv_reg2(27),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(28),
      Q => slv_reg2(28),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(29),
      Q => slv_reg2(29),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(2),
      Q => slv_reg2(2),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(30),
      Q => slv_reg2(30),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(31),
      Q => slv_reg2(31),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(3),
      Q => slv_reg2(3),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(4),
      Q => slv_reg2(4),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(5),
      Q => slv_reg2(5),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(6),
      Q => slv_reg2(6),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(7),
      Q => slv_reg2(7),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(8),
      Q => slv_reg2(8),
      R => \slv_reg0[31]_i_1_n_0\
    );
\slv_reg2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => slv_reg2_1,
      D => s00_axi_wdata(9),
      Q => slv_reg2(9),
      R => \slv_reg0[31]_i_1_n_0\
    );
slv_reg_rden: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_rvalid\,
      I2 => \^s00_axi_arready\,
      O => \slv_reg_rden__0\
    );
\wAddrCounter[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFE0FFFF"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(3),
      I3 => \wAddrCounter[0]_i_9_n_0\,
      I4 => \^q\(0),
      I5 => \FSM_sequential_s_din_state_reg[0]\,
      O => wAddrCounter_reg_3_sn_1
    );
\wAddrCounter[0]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wAddrCounter_reg(3),
      I1 => wAddrCounter_reg_3_sn_1,
      I2 => \^q\(11),
      O => \wAddrCounter[0]_i_5_n_0\
    );
\wAddrCounter[0]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wAddrCounter_reg(2),
      I1 => wAddrCounter_reg_3_sn_1,
      I2 => \^q\(10),
      O => \wAddrCounter[0]_i_6_n_0\
    );
\wAddrCounter[0]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wAddrCounter_reg(1),
      I1 => wAddrCounter_reg_3_sn_1,
      I2 => \^q\(9),
      O => \wAddrCounter[0]_i_7_n_0\
    );
\wAddrCounter[0]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"3A"
    )
        port map (
      I0 => \^q\(8),
      I1 => wAddrCounter_reg(0),
      I2 => wAddrCounter_reg_3_sn_1,
      O => \wAddrCounter[0]_i_8_n_0\
    );
\wAddrCounter[0]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^q\(4),
      I2 => \^q\(7),
      I3 => \^q\(6),
      O => \wAddrCounter[0]_i_9_n_0\
    );
\wAddrCounter[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wAddrCounter_reg(7),
      I1 => wAddrCounter_reg_3_sn_1,
      I2 => \^q\(15),
      O => \wAddrCounter[4]_i_2_n_0\
    );
\wAddrCounter[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wAddrCounter_reg(6),
      I1 => wAddrCounter_reg_3_sn_1,
      I2 => \^q\(14),
      O => \wAddrCounter[4]_i_3_n_0\
    );
\wAddrCounter[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wAddrCounter_reg(5),
      I1 => wAddrCounter_reg_3_sn_1,
      I2 => \^q\(13),
      O => \wAddrCounter[4]_i_4_n_0\
    );
\wAddrCounter[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wAddrCounter_reg(4),
      I1 => wAddrCounter_reg_3_sn_1,
      I2 => \^q\(12),
      O => \wAddrCounter[4]_i_5_n_0\
    );
\wAddrCounter[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wAddrCounter_reg(11),
      I1 => wAddrCounter_reg_3_sn_1,
      I2 => \^q\(19),
      O => \wAddrCounter[8]_i_2_n_0\
    );
\wAddrCounter[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wAddrCounter_reg(10),
      I1 => wAddrCounter_reg_3_sn_1,
      I2 => \^q\(18),
      O => \wAddrCounter[8]_i_3_n_0\
    );
\wAddrCounter[8]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wAddrCounter_reg(9),
      I1 => wAddrCounter_reg_3_sn_1,
      I2 => \^q\(17),
      O => \wAddrCounter[8]_i_4_n_0\
    );
\wAddrCounter[8]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wAddrCounter_reg(8),
      I1 => wAddrCounter_reg_3_sn_1,
      I2 => \^q\(16),
      O => \wAddrCounter[8]_i_5_n_0\
    );
\wAddrCounter_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \wAddrCounter_reg[0]_i_3_n_0\,
      CO(2) => \wAddrCounter_reg[0]_i_3_n_1\,
      CO(1) => \wAddrCounter_reg[0]_i_3_n_2\,
      CO(0) => \wAddrCounter_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => wAddrCounter_reg_3_sn_1,
      O(3 downto 0) => \wAddrCounter_reg[3]_0\(3 downto 0),
      S(3) => \wAddrCounter[0]_i_5_n_0\,
      S(2) => \wAddrCounter[0]_i_6_n_0\,
      S(1) => \wAddrCounter[0]_i_7_n_0\,
      S(0) => \wAddrCounter[0]_i_8_n_0\
    );
\wAddrCounter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wAddrCounter_reg[0]_i_3_n_0\,
      CO(3) => \wAddrCounter_reg[4]_i_1_n_0\,
      CO(2) => \wAddrCounter_reg[4]_i_1_n_1\,
      CO(1) => \wAddrCounter_reg[4]_i_1_n_2\,
      CO(0) => \wAddrCounter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \wAddrCounter_reg[7]\(3 downto 0),
      S(3) => \wAddrCounter[4]_i_2_n_0\,
      S(2) => \wAddrCounter[4]_i_3_n_0\,
      S(1) => \wAddrCounter[4]_i_4_n_0\,
      S(0) => \wAddrCounter[4]_i_5_n_0\
    );
\wAddrCounter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \wAddrCounter_reg[4]_i_1_n_0\,
      CO(3) => \NLW_wAddrCounter_reg[8]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \wAddrCounter_reg[8]_i_1_n_1\,
      CO(1) => \wAddrCounter_reg[8]_i_1_n_2\,
      CO(0) => \wAddrCounter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \wAddrCounter_reg[11]\(3 downto 0),
      S(3) => \wAddrCounter[8]_i_2_n_0\,
      S(2) => \wAddrCounter[8]_i_3_n_0\,
      S(1) => \wAddrCounter[8]_i_4_n_0\,
      S(0) => \wAddrCounter[8]_i_5_n_0\
    );
\word_couter[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^word_couter_reg[31]_0\,
      I1 => m00_axis_aresetn,
      O => \word_couter_reg[31]\
    );
\word_couter[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFA1"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(2),
      I3 => \out\(1),
      I4 => \out\(0),
      I5 => \^raddress_reg[11]_0\,
      O => \^word_couter_reg[31]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_interfacer_ipcore_0_0_0_streamer is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \word_couter_reg[11]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DI : out STD_LOGIC_VECTOR ( 0 to 0 );
    \rAddress_reg[11]_0\ : out STD_LOGIC_VECTOR ( 10 downto 0 );
    wAddrCounter_reg : out STD_LOGIC_VECTOR ( 11 downto 0 );
    done_write : out STD_LOGIC;
    done_read : out STD_LOGIC;
    poly_bram_we : out STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    poly_bram_address : out STD_LOGIC_VECTOR ( 11 downto 0 );
    \wAddrCounter_reg[3]_0\ : out STD_LOGIC;
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    \slv_reg0_reg[3]\ : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    \FSM_sequential_s_dout_state_reg[1]_0\ : in STD_LOGIC;
    O : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \rAddress_reg[7]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \rAddress_reg[11]_1\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \slv_reg0_reg[2]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_aclk : in STD_LOGIC;
    \wAddrCounter_reg[7]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    \wAddrCounter_reg[11]_0\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_tvalid : in STD_LOGIC;
    \slv_reg0_reg[2]_0\ : in STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    \slv_reg0_reg[3]_0\ : in STD_LOGIC;
    \slv_reg0_reg[6]\ : in STD_LOGIC;
    \slv_reg0_reg[1]\ : in STD_LOGIC;
    \slv_reg0_reg[1]_0\ : in STD_LOGIC;
    command0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_aresetn : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC;
    s00_axis_tlast : in STD_LOGIC;
    \slv_reg0_reg[0]\ : in STD_LOGIC;
    \slv_reg0_reg[14]\ : in STD_LOGIC;
    \FSM_sequential_s_dout_state_reg[1]_1\ : in STD_LOGIC
  );
end design_1_interfacer_ipcore_0_0_0_streamer;

architecture STRUCTURE of design_1_interfacer_ipcore_0_0_0_streamer is
  signal \^di\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \FSM_sequential_s_din_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_din_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_din_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_dout_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_dout_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_s_dout_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \^done_read\ : STD_LOGIC;
  signal done_read_i_1_n_0 : STD_LOGIC;
  signal \^done_write\ : STD_LOGIC;
  signal done_write_i_1_n_0 : STD_LOGIC;
  signal m00_axis_tlast_INST_0_i_10_n_0 : STD_LOGIC;
  signal m00_axis_tlast_INST_0_i_11_n_0 : STD_LOGIC;
  signal m00_axis_tlast_INST_0_i_13_n_0 : STD_LOGIC;
  signal m00_axis_tlast_INST_0_i_14_n_0 : STD_LOGIC;
  signal m00_axis_tlast_INST_0_i_2_n_0 : STD_LOGIC;
  signal m00_axis_tlast_INST_0_i_3_n_0 : STD_LOGIC;
  signal m00_axis_tlast_INST_0_i_4_n_0 : STD_LOGIC;
  signal m00_axis_tlast_INST_0_i_5_n_0 : STD_LOGIC;
  signal m00_axis_tlast_INST_0_i_6_n_0 : STD_LOGIC;
  signal m00_axis_tlast_INST_0_i_7_n_0 : STD_LOGIC;
  signal m00_axis_tlast_INST_0_i_8_n_0 : STD_LOGIC;
  signal \^out\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \^out\ : signal is "yes";
  signal \poly_bram_address[11]_INST_0_i_1_n_1\ : STD_LOGIC;
  signal \poly_bram_address[11]_INST_0_i_1_n_2\ : STD_LOGIC;
  signal \poly_bram_address[11]_INST_0_i_1_n_3\ : STD_LOGIC;
  signal \poly_bram_address[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \poly_bram_address[3]_INST_0_i_1_n_1\ : STD_LOGIC;
  signal \poly_bram_address[3]_INST_0_i_1_n_2\ : STD_LOGIC;
  signal \poly_bram_address[3]_INST_0_i_1_n_3\ : STD_LOGIC;
  signal \poly_bram_address[3]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \poly_bram_address[7]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \poly_bram_address[7]_INST_0_i_1_n_1\ : STD_LOGIC;
  signal \poly_bram_address[7]_INST_0_i_1_n_2\ : STD_LOGIC;
  signal \poly_bram_address[7]_INST_0_i_1_n_3\ : STD_LOGIC;
  signal \rAddress[0]_i_1_n_0\ : STD_LOGIC;
  signal rAddress_next : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal rAddress_reg : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^raddress_reg[11]_0\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal s_din_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP of s_din_state : signal is "yes";
  signal \wAddrCounter[0]_i_1_n_0\ : STD_LOGIC;
  signal \wAddrCounter[0]_i_2_n_0\ : STD_LOGIC;
  signal \^waddrcounter_reg\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \word_couter[0]_i_5_n_0\ : STD_LOGIC;
  signal word_couter_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \word_couter_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \word_couter_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \word_couter_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \word_couter_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \word_couter_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \word_couter_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \word_couter_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \word_couter_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \^word_couter_reg[11]_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \word_couter_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \word_couter_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \word_couter_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \word_couter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \word_couter_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \word_couter_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \word_couter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \word_couter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \word_couter_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \word_couter_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \word_couter_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \word_couter_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \word_couter_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \word_couter_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \word_couter_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \word_couter_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \word_couter_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \word_couter_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \word_couter_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \word_couter_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \word_couter_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \word_couter_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \word_couter_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \word_couter_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \word_couter_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \word_couter_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \word_couter_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \word_couter_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \word_couter_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \word_couter_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \word_couter_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \word_couter_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \word_couter_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \word_couter_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \word_couter_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \word_couter_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \word_couter_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \word_couter_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \word_couter_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \word_couter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \word_couter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \word_couter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \word_couter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \word_couter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \word_couter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \word_couter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \word_couter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \word_couter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \word_couter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \word_couter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \word_couter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \word_couter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \word_couter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \word_couter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \word_couter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \NLW_poly_bram_address[11]_INST_0_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_word_couter_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_s_din_state_reg[0]\ : label is "s_din_wait_data:01,s_din_read_data:10,s_din_wait_release:11,s_din_wait_command:00";
  attribute KEEP : string;
  attribute KEEP of \FSM_sequential_s_din_state_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_s_din_state_reg[1]\ : label is "s_din_wait_data:01,s_din_read_data:10,s_din_wait_release:11,s_din_wait_command:00";
  attribute KEEP of \FSM_sequential_s_din_state_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_s_dout_state_reg[0]\ : label is "s_dout_wait_ready:01,s_dout_write_data:10,s_dout_wait_release:11,s_dout_wait_command:00";
  attribute KEEP of \FSM_sequential_s_dout_state_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_sequential_s_dout_state_reg[1]\ : label is "s_dout_wait_ready:01,s_dout_write_data:10,s_dout_wait_release:11,s_dout_wait_command:00";
  attribute KEEP of \FSM_sequential_s_dout_state_reg[1]\ : label is "yes";
begin
  DI(0) <= \^di\(0);
  done_read <= \^done_read\;
  done_write <= \^done_write\;
  \out\(1 downto 0) <= \^out\(1 downto 0);
  \rAddress_reg[11]_0\(10 downto 0) <= \^raddress_reg[11]_0\(10 downto 0);
  wAddrCounter_reg(11 downto 0) <= \^waddrcounter_reg\(11 downto 0);
  \word_couter_reg[11]_0\(1 downto 0) <= \^word_couter_reg[11]_0\(1 downto 0);
\FSM_sequential_s_din_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFA0C000000000"
    )
        port map (
      I0 => \slv_reg0_reg[14]\,
      I1 => s00_axis_tlast,
      I2 => s_din_state(1),
      I3 => s_din_state(0),
      I4 => \FSM_sequential_s_din_state[0]_i_2_n_0\,
      I5 => s00_axis_aresetn,
      O => \FSM_sequential_s_din_state[0]_i_1_n_0\
    );
\FSM_sequential_s_din_state[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"14FF"
    )
        port map (
      I0 => s00_axis_tvalid,
      I1 => s_din_state(0),
      I2 => s_din_state(1),
      I3 => \slv_reg0_reg[2]_0\,
      O => \FSM_sequential_s_din_state[0]_i_2_n_0\
    );
\FSM_sequential_s_din_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFF0A0C000000000"
    )
        port map (
      I0 => \slv_reg0_reg[14]\,
      I1 => s00_axis_tlast,
      I2 => s_din_state(1),
      I3 => s_din_state(0),
      I4 => s00_axis_tvalid,
      I5 => s00_axis_aresetn,
      O => \FSM_sequential_s_din_state[1]_i_1_n_0\
    );
\FSM_sequential_s_din_state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \FSM_sequential_s_din_state[0]_i_1_n_0\,
      Q => s_din_state(0),
      R => '0'
    );
\FSM_sequential_s_din_state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \FSM_sequential_s_din_state[1]_i_1_n_0\,
      Q => s_din_state(1),
      R => '0'
    );
\FSM_sequential_s_dout_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFAAEA00000000"
    )
        port map (
      I0 => \FSM_sequential_s_dout_state[0]_i_2_n_0\,
      I1 => m00_axis_tlast_INST_0_i_2_n_0,
      I2 => \^out\(1),
      I3 => \slv_reg0_reg[6]\,
      I4 => \FSM_sequential_s_dout_state_reg[1]_1\,
      I5 => m00_axis_aresetn,
      O => \FSM_sequential_s_dout_state[0]_i_1_n_0\
    );
\FSM_sequential_s_dout_state[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"14FF"
    )
        port map (
      I0 => m00_axis_tready,
      I1 => \^out\(0),
      I2 => \^out\(1),
      I3 => \slv_reg0_reg[3]_0\,
      O => \FSM_sequential_s_dout_state[0]_i_2_n_0\
    );
\FSM_sequential_s_dout_state[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF600000"
    )
        port map (
      I0 => \^out\(1),
      I1 => \^out\(0),
      I2 => m00_axis_tready,
      I3 => \FSM_sequential_s_dout_state_reg[1]_1\,
      I4 => m00_axis_aresetn,
      O => \FSM_sequential_s_dout_state[1]_i_1_n_0\
    );
\FSM_sequential_s_dout_state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \FSM_sequential_s_dout_state[0]_i_1_n_0\,
      Q => \^out\(0),
      R => '0'
    );
\FSM_sequential_s_dout_state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \FSM_sequential_s_dout_state[1]_i_1_n_0\,
      Q => \^out\(1),
      R => '0'
    );
done_read_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88F88808FFFFFFFF"
    )
        port map (
      I0 => \^done_read\,
      I1 => \slv_reg0_reg[3]_0\,
      I2 => m00_axis_tlast_INST_0_i_2_n_0,
      I3 => \slv_reg0_reg[0]\,
      I4 => \^out\(1),
      I5 => m00_axis_aresetn,
      O => done_read_i_1_n_0
    );
done_read_reg: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => '1',
      D => done_read_i_1_n_0,
      Q => \^done_read\,
      R => '0'
    );
done_write_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8F888888FFFFFFFF"
    )
        port map (
      I0 => \^done_write\,
      I1 => \slv_reg0_reg[2]_0\,
      I2 => s_din_state(0),
      I3 => s_din_state(1),
      I4 => s00_axis_tlast,
      I5 => s00_axis_aresetn,
      O => done_write_i_1_n_0
    );
done_write_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => '1',
      D => done_write_i_1_n_0,
      Q => \^done_write\,
      R => '0'
    );
m00_axis_tlast_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => \slv_reg0_reg[6]\,
      I1 => \^out\(0),
      I2 => \^out\(1),
      I3 => m00_axis_tlast_INST_0_i_2_n_0,
      O => m00_axis_tlast
    );
m00_axis_tlast_INST_0_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000100"
    )
        port map (
      I0 => word_couter_reg(8),
      I1 => \^word_couter_reg[11]_0\(1),
      I2 => command0(0),
      I3 => command0(1),
      I4 => \^word_couter_reg[11]_0\(0),
      I5 => command0(2),
      O => m00_axis_tlast_INST_0_i_10_n_0
    );
m00_axis_tlast_INST_0_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \^word_couter_reg[11]_0\(1),
      I1 => word_couter_reg(8),
      I2 => \^word_couter_reg[11]_0\(0),
      I3 => command0(2),
      O => m00_axis_tlast_INST_0_i_11_n_0
    );
m00_axis_tlast_INST_0_i_13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => word_couter_reg(19),
      I1 => word_couter_reg(18),
      I2 => word_couter_reg(17),
      I3 => word_couter_reg(16),
      O => m00_axis_tlast_INST_0_i_13_n_0
    );
m00_axis_tlast_INST_0_i_14: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => word_couter_reg(27),
      I1 => word_couter_reg(26),
      I2 => word_couter_reg(25),
      I3 => word_couter_reg(24),
      O => m00_axis_tlast_INST_0_i_14_n_0
    );
m00_axis_tlast_INST_0_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => m00_axis_tlast_INST_0_i_3_n_0,
      I1 => m00_axis_tlast_INST_0_i_4_n_0,
      I2 => m00_axis_tlast_INST_0_i_5_n_0,
      I3 => m00_axis_tlast_INST_0_i_6_n_0,
      I4 => m00_axis_tlast_INST_0_i_7_n_0,
      O => m00_axis_tlast_INST_0_i_2_n_0
    );
m00_axis_tlast_INST_0_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => word_couter_reg(0),
      I1 => word_couter_reg(1),
      I2 => word_couter_reg(2),
      I3 => word_couter_reg(3),
      I4 => m00_axis_tlast_INST_0_i_8_n_0,
      O => m00_axis_tlast_INST_0_i_3_n_0
    );
m00_axis_tlast_INST_0_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => word_couter_reg(31),
      I1 => word_couter_reg(30),
      I2 => word_couter_reg(29),
      I3 => word_couter_reg(28),
      O => m00_axis_tlast_INST_0_i_4_n_0
    );
m00_axis_tlast_INST_0_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FFF022F022F022"
    )
        port map (
      I0 => \slv_reg0_reg[1]\,
      I1 => word_couter_reg(8),
      I2 => m00_axis_tlast_INST_0_i_10_n_0,
      I3 => word_couter_reg(6),
      I4 => m00_axis_tlast_INST_0_i_11_n_0,
      I5 => \slv_reg0_reg[1]_0\,
      O => m00_axis_tlast_INST_0_i_5_n_0
    );
m00_axis_tlast_INST_0_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => word_couter_reg(12),
      I1 => word_couter_reg(13),
      I2 => word_couter_reg(14),
      I3 => word_couter_reg(15),
      I4 => m00_axis_tlast_INST_0_i_13_n_0,
      O => m00_axis_tlast_INST_0_i_6_n_0
    );
m00_axis_tlast_INST_0_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => word_couter_reg(20),
      I1 => word_couter_reg(21),
      I2 => word_couter_reg(22),
      I3 => word_couter_reg(23),
      I4 => m00_axis_tlast_INST_0_i_14_n_0,
      O => m00_axis_tlast_INST_0_i_7_n_0
    );
m00_axis_tlast_INST_0_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => word_couter_reg(11),
      I1 => word_couter_reg(10),
      I2 => word_couter_reg(5),
      I3 => word_couter_reg(4),
      O => m00_axis_tlast_INST_0_i_8_n_0
    );
m00_axis_tvalid_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^out\(1),
      I1 => \^out\(0),
      O => m00_axis_tvalid
    );
\poly_bram_address[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \^waddrcounter_reg\(0),
      I1 => s_din_state(0),
      I2 => s_din_state(1),
      I3 => rAddress_next(0),
      O => poly_bram_address(0)
    );
\poly_bram_address[10]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \^waddrcounter_reg\(10),
      I1 => s_din_state(0),
      I2 => s_din_state(1),
      I3 => rAddress_next(10),
      O => poly_bram_address(10)
    );
\poly_bram_address[11]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \^waddrcounter_reg\(11),
      I1 => s_din_state(0),
      I2 => s_din_state(1),
      I3 => rAddress_next(11),
      O => poly_bram_address(11)
    );
\poly_bram_address[11]_INST_0_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \poly_bram_address[7]_INST_0_i_1_n_0\,
      CO(3) => \NLW_poly_bram_address[11]_INST_0_i_1_CO_UNCONNECTED\(3),
      CO(2) => \poly_bram_address[11]_INST_0_i_1_n_1\,
      CO(1) => \poly_bram_address[11]_INST_0_i_1_n_2\,
      CO(0) => \poly_bram_address[11]_INST_0_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => rAddress_next(11 downto 8),
      S(3 downto 0) => \^raddress_reg[11]_0\(10 downto 7)
    );
\poly_bram_address[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \^waddrcounter_reg\(1),
      I1 => s_din_state(0),
      I2 => s_din_state(1),
      I3 => rAddress_next(1),
      O => poly_bram_address(1)
    );
\poly_bram_address[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \^waddrcounter_reg\(2),
      I1 => s_din_state(0),
      I2 => s_din_state(1),
      I3 => rAddress_next(2),
      O => poly_bram_address(2)
    );
\poly_bram_address[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \^waddrcounter_reg\(3),
      I1 => s_din_state(0),
      I2 => s_din_state(1),
      I3 => rAddress_next(3),
      O => poly_bram_address(3)
    );
\poly_bram_address[3]_INST_0_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \poly_bram_address[3]_INST_0_i_1_n_0\,
      CO(2) => \poly_bram_address[3]_INST_0_i_1_n_1\,
      CO(1) => \poly_bram_address[3]_INST_0_i_1_n_2\,
      CO(0) => \poly_bram_address[3]_INST_0_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => rAddress_reg(0),
      O(3 downto 0) => rAddress_next(3 downto 0),
      S(3 downto 1) => \^raddress_reg[11]_0\(2 downto 0),
      S(0) => \poly_bram_address[3]_INST_0_i_2_n_0\
    );
\poly_bram_address[3]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA6A"
    )
        port map (
      I0 => rAddress_reg(0),
      I1 => m00_axis_tready,
      I2 => \^out\(1),
      I3 => \^out\(0),
      O => \poly_bram_address[3]_INST_0_i_2_n_0\
    );
\poly_bram_address[4]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \^waddrcounter_reg\(4),
      I1 => s_din_state(0),
      I2 => s_din_state(1),
      I3 => rAddress_next(4),
      O => poly_bram_address(4)
    );
\poly_bram_address[5]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \^waddrcounter_reg\(5),
      I1 => s_din_state(0),
      I2 => s_din_state(1),
      I3 => rAddress_next(5),
      O => poly_bram_address(5)
    );
\poly_bram_address[6]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \^waddrcounter_reg\(6),
      I1 => s_din_state(0),
      I2 => s_din_state(1),
      I3 => rAddress_next(6),
      O => poly_bram_address(6)
    );
\poly_bram_address[7]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \^waddrcounter_reg\(7),
      I1 => s_din_state(0),
      I2 => s_din_state(1),
      I3 => rAddress_next(7),
      O => poly_bram_address(7)
    );
\poly_bram_address[7]_INST_0_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \poly_bram_address[3]_INST_0_i_1_n_0\,
      CO(3) => \poly_bram_address[7]_INST_0_i_1_n_0\,
      CO(2) => \poly_bram_address[7]_INST_0_i_1_n_1\,
      CO(1) => \poly_bram_address[7]_INST_0_i_1_n_2\,
      CO(0) => \poly_bram_address[7]_INST_0_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => rAddress_next(7 downto 4),
      S(3 downto 0) => \^raddress_reg[11]_0\(6 downto 3)
    );
\poly_bram_address[8]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \^waddrcounter_reg\(8),
      I1 => s_din_state(0),
      I2 => s_din_state(1),
      I3 => rAddress_next(8),
      O => poly_bram_address(8)
    );
\poly_bram_address[9]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ABA8"
    )
        port map (
      I0 => \^waddrcounter_reg\(9),
      I1 => s_din_state(0),
      I2 => s_din_state(1),
      I3 => rAddress_next(9),
      O => poly_bram_address(9)
    );
poly_bram_we_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => s_din_state(0),
      I1 => s_din_state(1),
      I2 => s00_axis_tvalid,
      O => poly_bram_we
    );
\rAddress[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => m00_axis_aresetn,
      O => \rAddress[0]_i_1_n_0\
    );
\rAddress[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7F7F7080808F708"
    )
        port map (
      I0 => m00_axis_tready,
      I1 => \^out\(1),
      I2 => \^out\(0),
      I3 => command0(3),
      I4 => \slv_reg0_reg[3]_0\,
      I5 => rAddress_reg(0),
      O => S(0)
    );
\rAddress_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \FSM_sequential_s_dout_state_reg[1]_0\,
      D => O(0),
      Q => rAddress_reg(0),
      R => \rAddress[0]_i_1_n_0\
    );
\rAddress_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \FSM_sequential_s_dout_state_reg[1]_0\,
      D => \rAddress_reg[11]_1\(2),
      Q => \^raddress_reg[11]_0\(9),
      R => \rAddress[0]_i_1_n_0\
    );
\rAddress_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \FSM_sequential_s_dout_state_reg[1]_0\,
      D => \rAddress_reg[11]_1\(3),
      Q => \^raddress_reg[11]_0\(10),
      R => \rAddress[0]_i_1_n_0\
    );
\rAddress_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \FSM_sequential_s_dout_state_reg[1]_0\,
      D => O(1),
      Q => \^raddress_reg[11]_0\(0),
      R => \rAddress[0]_i_1_n_0\
    );
\rAddress_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \FSM_sequential_s_dout_state_reg[1]_0\,
      D => O(2),
      Q => \^raddress_reg[11]_0\(1),
      R => \rAddress[0]_i_1_n_0\
    );
\rAddress_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \FSM_sequential_s_dout_state_reg[1]_0\,
      D => O(3),
      Q => \^raddress_reg[11]_0\(2),
      R => \rAddress[0]_i_1_n_0\
    );
\rAddress_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \FSM_sequential_s_dout_state_reg[1]_0\,
      D => \rAddress_reg[7]_0\(0),
      Q => \^raddress_reg[11]_0\(3),
      R => \rAddress[0]_i_1_n_0\
    );
\rAddress_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \FSM_sequential_s_dout_state_reg[1]_0\,
      D => \rAddress_reg[7]_0\(1),
      Q => \^raddress_reg[11]_0\(4),
      R => \rAddress[0]_i_1_n_0\
    );
\rAddress_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \FSM_sequential_s_dout_state_reg[1]_0\,
      D => \rAddress_reg[7]_0\(2),
      Q => \^raddress_reg[11]_0\(5),
      R => \rAddress[0]_i_1_n_0\
    );
\rAddress_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \FSM_sequential_s_dout_state_reg[1]_0\,
      D => \rAddress_reg[7]_0\(3),
      Q => \^raddress_reg[11]_0\(6),
      R => \rAddress[0]_i_1_n_0\
    );
\rAddress_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \FSM_sequential_s_dout_state_reg[1]_0\,
      D => \rAddress_reg[11]_1\(0),
      Q => \^raddress_reg[11]_0\(7),
      R => \rAddress[0]_i_1_n_0\
    );
\rAddress_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \FSM_sequential_s_dout_state_reg[1]_0\,
      D => \rAddress_reg[11]_1\(1),
      Q => \^raddress_reg[11]_0\(8),
      R => \rAddress[0]_i_1_n_0\
    );
s00_axis_tready_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => s_din_state(1),
      I1 => s_din_state(0),
      O => s00_axis_tready
    );
\wAddrCounter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axis_aresetn,
      O => \wAddrCounter[0]_i_1_n_0\
    );
\wAddrCounter[0]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => s_din_state(0),
      I1 => s_din_state(1),
      O => \wAddrCounter_reg[3]_0\
    );
\wAddrCounter[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08FF"
    )
        port map (
      I0 => s00_axis_tvalid,
      I1 => s_din_state(1),
      I2 => s_din_state(0),
      I3 => \slv_reg0_reg[2]_0\,
      O => \wAddrCounter[0]_i_2_n_0\
    );
\wAddrCounter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \wAddrCounter[0]_i_2_n_0\,
      D => \slv_reg0_reg[2]\(0),
      Q => \^waddrcounter_reg\(0),
      R => \wAddrCounter[0]_i_1_n_0\
    );
\wAddrCounter_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \wAddrCounter[0]_i_2_n_0\,
      D => \wAddrCounter_reg[11]_0\(2),
      Q => \^waddrcounter_reg\(10),
      R => \wAddrCounter[0]_i_1_n_0\
    );
\wAddrCounter_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \wAddrCounter[0]_i_2_n_0\,
      D => \wAddrCounter_reg[11]_0\(3),
      Q => \^waddrcounter_reg\(11),
      R => \wAddrCounter[0]_i_1_n_0\
    );
\wAddrCounter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \wAddrCounter[0]_i_2_n_0\,
      D => \slv_reg0_reg[2]\(1),
      Q => \^waddrcounter_reg\(1),
      R => \wAddrCounter[0]_i_1_n_0\
    );
\wAddrCounter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \wAddrCounter[0]_i_2_n_0\,
      D => \slv_reg0_reg[2]\(2),
      Q => \^waddrcounter_reg\(2),
      R => \wAddrCounter[0]_i_1_n_0\
    );
\wAddrCounter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \wAddrCounter[0]_i_2_n_0\,
      D => \slv_reg0_reg[2]\(3),
      Q => \^waddrcounter_reg\(3),
      R => \wAddrCounter[0]_i_1_n_0\
    );
\wAddrCounter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \wAddrCounter[0]_i_2_n_0\,
      D => \wAddrCounter_reg[7]_0\(0),
      Q => \^waddrcounter_reg\(4),
      R => \wAddrCounter[0]_i_1_n_0\
    );
\wAddrCounter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \wAddrCounter[0]_i_2_n_0\,
      D => \wAddrCounter_reg[7]_0\(1),
      Q => \^waddrcounter_reg\(5),
      R => \wAddrCounter[0]_i_1_n_0\
    );
\wAddrCounter_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \wAddrCounter[0]_i_2_n_0\,
      D => \wAddrCounter_reg[7]_0\(2),
      Q => \^waddrcounter_reg\(6),
      R => \wAddrCounter[0]_i_1_n_0\
    );
\wAddrCounter_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \wAddrCounter[0]_i_2_n_0\,
      D => \wAddrCounter_reg[7]_0\(3),
      Q => \^waddrcounter_reg\(7),
      R => \wAddrCounter[0]_i_1_n_0\
    );
\wAddrCounter_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \wAddrCounter[0]_i_2_n_0\,
      D => \wAddrCounter_reg[11]_0\(0),
      Q => \^waddrcounter_reg\(8),
      R => \wAddrCounter[0]_i_1_n_0\
    );
\wAddrCounter_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axis_aclk,
      CE => \wAddrCounter[0]_i_2_n_0\,
      D => \wAddrCounter_reg[11]_0\(1),
      Q => \^waddrcounter_reg\(9),
      R => \wAddrCounter[0]_i_1_n_0\
    );
\word_couter[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^out\(0),
      I1 => \^out\(1),
      I2 => m00_axis_tready,
      O => \^di\(0)
    );
\word_couter[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => word_couter_reg(0),
      O => \word_couter[0]_i_5_n_0\
    );
\word_couter_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[0]_i_3_n_7\,
      Q => word_couter_reg(0),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[0]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \word_couter_reg[0]_i_3_n_0\,
      CO(2) => \word_couter_reg[0]_i_3_n_1\,
      CO(1) => \word_couter_reg[0]_i_3_n_2\,
      CO(0) => \word_couter_reg[0]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \word_couter_reg[0]_i_3_n_4\,
      O(2) => \word_couter_reg[0]_i_3_n_5\,
      O(1) => \word_couter_reg[0]_i_3_n_6\,
      O(0) => \word_couter_reg[0]_i_3_n_7\,
      S(3 downto 1) => word_couter_reg(3 downto 1),
      S(0) => \word_couter[0]_i_5_n_0\
    );
\word_couter_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[8]_i_1_n_5\,
      Q => word_couter_reg(10),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[8]_i_1_n_4\,
      Q => word_couter_reg(11),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[12]_i_1_n_7\,
      Q => word_couter_reg(12),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_couter_reg[8]_i_1_n_0\,
      CO(3) => \word_couter_reg[12]_i_1_n_0\,
      CO(2) => \word_couter_reg[12]_i_1_n_1\,
      CO(1) => \word_couter_reg[12]_i_1_n_2\,
      CO(0) => \word_couter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_couter_reg[12]_i_1_n_4\,
      O(2) => \word_couter_reg[12]_i_1_n_5\,
      O(1) => \word_couter_reg[12]_i_1_n_6\,
      O(0) => \word_couter_reg[12]_i_1_n_7\,
      S(3 downto 0) => word_couter_reg(15 downto 12)
    );
\word_couter_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[12]_i_1_n_6\,
      Q => word_couter_reg(13),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[12]_i_1_n_5\,
      Q => word_couter_reg(14),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[12]_i_1_n_4\,
      Q => word_couter_reg(15),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[16]_i_1_n_7\,
      Q => word_couter_reg(16),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_couter_reg[12]_i_1_n_0\,
      CO(3) => \word_couter_reg[16]_i_1_n_0\,
      CO(2) => \word_couter_reg[16]_i_1_n_1\,
      CO(1) => \word_couter_reg[16]_i_1_n_2\,
      CO(0) => \word_couter_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_couter_reg[16]_i_1_n_4\,
      O(2) => \word_couter_reg[16]_i_1_n_5\,
      O(1) => \word_couter_reg[16]_i_1_n_6\,
      O(0) => \word_couter_reg[16]_i_1_n_7\,
      S(3 downto 0) => word_couter_reg(19 downto 16)
    );
\word_couter_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[16]_i_1_n_6\,
      Q => word_couter_reg(17),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[16]_i_1_n_5\,
      Q => word_couter_reg(18),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[16]_i_1_n_4\,
      Q => word_couter_reg(19),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[0]_i_3_n_6\,
      Q => word_couter_reg(1),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[20]_i_1_n_7\,
      Q => word_couter_reg(20),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_couter_reg[16]_i_1_n_0\,
      CO(3) => \word_couter_reg[20]_i_1_n_0\,
      CO(2) => \word_couter_reg[20]_i_1_n_1\,
      CO(1) => \word_couter_reg[20]_i_1_n_2\,
      CO(0) => \word_couter_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_couter_reg[20]_i_1_n_4\,
      O(2) => \word_couter_reg[20]_i_1_n_5\,
      O(1) => \word_couter_reg[20]_i_1_n_6\,
      O(0) => \word_couter_reg[20]_i_1_n_7\,
      S(3 downto 0) => word_couter_reg(23 downto 20)
    );
\word_couter_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[20]_i_1_n_6\,
      Q => word_couter_reg(21),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[20]_i_1_n_5\,
      Q => word_couter_reg(22),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[20]_i_1_n_4\,
      Q => word_couter_reg(23),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[24]_i_1_n_7\,
      Q => word_couter_reg(24),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_couter_reg[20]_i_1_n_0\,
      CO(3) => \word_couter_reg[24]_i_1_n_0\,
      CO(2) => \word_couter_reg[24]_i_1_n_1\,
      CO(1) => \word_couter_reg[24]_i_1_n_2\,
      CO(0) => \word_couter_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_couter_reg[24]_i_1_n_4\,
      O(2) => \word_couter_reg[24]_i_1_n_5\,
      O(1) => \word_couter_reg[24]_i_1_n_6\,
      O(0) => \word_couter_reg[24]_i_1_n_7\,
      S(3 downto 0) => word_couter_reg(27 downto 24)
    );
\word_couter_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[24]_i_1_n_6\,
      Q => word_couter_reg(25),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[24]_i_1_n_5\,
      Q => word_couter_reg(26),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[24]_i_1_n_4\,
      Q => word_couter_reg(27),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[28]_i_1_n_7\,
      Q => word_couter_reg(28),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_couter_reg[24]_i_1_n_0\,
      CO(3) => \NLW_word_couter_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \word_couter_reg[28]_i_1_n_1\,
      CO(1) => \word_couter_reg[28]_i_1_n_2\,
      CO(0) => \word_couter_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_couter_reg[28]_i_1_n_4\,
      O(2) => \word_couter_reg[28]_i_1_n_5\,
      O(1) => \word_couter_reg[28]_i_1_n_6\,
      O(0) => \word_couter_reg[28]_i_1_n_7\,
      S(3 downto 0) => word_couter_reg(31 downto 28)
    );
\word_couter_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[28]_i_1_n_6\,
      Q => word_couter_reg(29),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[0]_i_3_n_5\,
      Q => word_couter_reg(2),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[28]_i_1_n_5\,
      Q => word_couter_reg(30),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[28]_i_1_n_4\,
      Q => word_couter_reg(31),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[0]_i_3_n_4\,
      Q => word_couter_reg(3),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[4]_i_1_n_7\,
      Q => word_couter_reg(4),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_couter_reg[0]_i_3_n_0\,
      CO(3) => \word_couter_reg[4]_i_1_n_0\,
      CO(2) => \word_couter_reg[4]_i_1_n_1\,
      CO(1) => \word_couter_reg[4]_i_1_n_2\,
      CO(0) => \word_couter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_couter_reg[4]_i_1_n_4\,
      O(2) => \word_couter_reg[4]_i_1_n_5\,
      O(1) => \word_couter_reg[4]_i_1_n_6\,
      O(0) => \word_couter_reg[4]_i_1_n_7\,
      S(3) => \^word_couter_reg[11]_0\(0),
      S(2 downto 0) => word_couter_reg(6 downto 4)
    );
\word_couter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[4]_i_1_n_6\,
      Q => word_couter_reg(5),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[4]_i_1_n_5\,
      Q => word_couter_reg(6),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[4]_i_1_n_4\,
      Q => \^word_couter_reg[11]_0\(0),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[8]_i_1_n_7\,
      Q => word_couter_reg(8),
      R => \slv_reg0_reg[3]\
    );
\word_couter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \word_couter_reg[4]_i_1_n_0\,
      CO(3) => \word_couter_reg[8]_i_1_n_0\,
      CO(2) => \word_couter_reg[8]_i_1_n_1\,
      CO(1) => \word_couter_reg[8]_i_1_n_2\,
      CO(0) => \word_couter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \word_couter_reg[8]_i_1_n_4\,
      O(2) => \word_couter_reg[8]_i_1_n_5\,
      O(1) => \word_couter_reg[8]_i_1_n_6\,
      O(0) => \word_couter_reg[8]_i_1_n_7\,
      S(3 downto 2) => word_couter_reg(11 downto 10),
      S(1) => \^word_couter_reg[11]_0\(1),
      S(0) => word_couter_reg(8)
    );
\word_couter_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => m00_axis_aclk,
      CE => \^di\(0),
      D => \word_couter_reg[8]_i_1_n_6\,
      Q => \^word_couter_reg[11]_0\(1),
      R => \slv_reg0_reg[3]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_interfacer_ipcore_0_0_0_interfacer_v1_0 is
  port (
    command0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    poly_bram_we : out STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    poly_bram_address : out STD_LOGIC_VECTOR ( 11 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    status0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
end design_1_interfacer_ipcore_0_0_0_interfacer_v1_0;

architecture STRUCTURE of design_1_interfacer_ipcore_0_0_0_interfacer_v1_0 is
  signal \^command0\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal done_read : STD_LOGIC;
  signal done_write : STD_LOGIC;
  signal rAddress_next1 : STD_LOGIC;
  signal rAddress_reg : STD_LOGIC_VECTOR ( 11 downto 1 );
  signal registers_inst_n_38 : STD_LOGIC;
  signal registers_inst_n_39 : STD_LOGIC;
  signal registers_inst_n_40 : STD_LOGIC;
  signal registers_inst_n_41 : STD_LOGIC;
  signal registers_inst_n_42 : STD_LOGIC;
  signal registers_inst_n_43 : STD_LOGIC;
  signal registers_inst_n_44 : STD_LOGIC;
  signal registers_inst_n_45 : STD_LOGIC;
  signal registers_inst_n_46 : STD_LOGIC;
  signal registers_inst_n_47 : STD_LOGIC;
  signal registers_inst_n_48 : STD_LOGIC;
  signal registers_inst_n_49 : STD_LOGIC;
  signal registers_inst_n_5 : STD_LOGIC;
  signal registers_inst_n_50 : STD_LOGIC;
  signal registers_inst_n_51 : STD_LOGIC;
  signal registers_inst_n_52 : STD_LOGIC;
  signal registers_inst_n_53 : STD_LOGIC;
  signal registers_inst_n_54 : STD_LOGIC;
  signal registers_inst_n_55 : STD_LOGIC;
  signal registers_inst_n_56 : STD_LOGIC;
  signal registers_inst_n_57 : STD_LOGIC;
  signal registers_inst_n_58 : STD_LOGIC;
  signal registers_inst_n_59 : STD_LOGIC;
  signal registers_inst_n_60 : STD_LOGIC;
  signal registers_inst_n_61 : STD_LOGIC;
  signal registers_inst_n_62 : STD_LOGIC;
  signal registers_inst_n_63 : STD_LOGIC;
  signal registers_inst_n_64 : STD_LOGIC;
  signal registers_inst_n_65 : STD_LOGIC;
  signal registers_inst_n_66 : STD_LOGIC;
  signal registers_inst_n_67 : STD_LOGIC;
  signal registers_inst_n_68 : STD_LOGIC;
  signal registers_inst_n_69 : STD_LOGIC;
  signal registers_inst_n_70 : STD_LOGIC;
  signal streamer_inst_n_0 : STD_LOGIC;
  signal streamer_inst_n_1 : STD_LOGIC;
  signal streamer_inst_n_44 : STD_LOGIC;
  signal streamer_inst_n_47 : STD_LOGIC;
  signal wAddrCounter_reg : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal word_couter_reg : STD_LOGIC_VECTOR ( 9 downto 7 );
begin
  command0(31 downto 0) <= \^command0\(31 downto 0);
registers_inst: entity work.design_1_interfacer_ipcore_0_0_0_registers
     port map (
      DI(0) => rAddress_next1,
      \FSM_sequential_s_din_state_reg[0]\ => streamer_inst_n_44,
      \FSM_sequential_s_din_state_reg[1]\ => registers_inst_n_39,
      \FSM_sequential_s_dout_state_reg[1]\ => registers_inst_n_38,
      O(3) => registers_inst_n_47,
      O(2) => registers_inst_n_48,
      O(1) => registers_inst_n_49,
      O(0) => registers_inst_n_50,
      Q(31 downto 0) => \^command0\(31 downto 0),
      S(0) => streamer_inst_n_47,
      done_read => done_read,
      done_read_reg => registers_inst_n_44,
      done_read_reg_0 => registers_inst_n_45,
      done_read_reg_1 => registers_inst_n_46,
      done_write => done_write,
      m00_axis_aresetn => m00_axis_aresetn,
      \out\(1) => streamer_inst_n_0,
      \out\(0) => streamer_inst_n_1,
      rAddress_reg(10 downto 0) => rAddress_reg(11 downto 1),
      \rAddress_reg[11]\ => registers_inst_n_40,
      \rAddress_reg[11]_0\ => registers_inst_n_41,
      \rAddress_reg[11]_1\(3) => registers_inst_n_55,
      \rAddress_reg[11]_1\(2) => registers_inst_n_56,
      \rAddress_reg[11]_1\(1) => registers_inst_n_57,
      \rAddress_reg[11]_1\(0) => registers_inst_n_58,
      \rAddress_reg[7]\(3) => registers_inst_n_51,
      \rAddress_reg[7]\(2) => registers_inst_n_52,
      \rAddress_reg[7]\(1) => registers_inst_n_53,
      \rAddress_reg[7]\(0) => registers_inst_n_54,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(3 downto 0) => s00_axi_araddr(3 downto 0),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arready => s00_axi_arready,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(3 downto 0) => s00_axi_awaddr(3 downto 0),
      s00_axi_awready => s00_axi_awready,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wvalid => s00_axi_wvalid,
      status0(31 downto 0) => status0(31 downto 0),
      wAddrCounter_reg(11 downto 0) => wAddrCounter_reg(11 downto 0),
      \wAddrCounter_reg[11]\(3) => registers_inst_n_67,
      \wAddrCounter_reg[11]\(2) => registers_inst_n_68,
      \wAddrCounter_reg[11]\(1) => registers_inst_n_69,
      \wAddrCounter_reg[11]\(0) => registers_inst_n_70,
      \wAddrCounter_reg[3]_0\(3) => registers_inst_n_59,
      \wAddrCounter_reg[3]_0\(2) => registers_inst_n_60,
      \wAddrCounter_reg[3]_0\(1) => registers_inst_n_61,
      \wAddrCounter_reg[3]_0\(0) => registers_inst_n_62,
      \wAddrCounter_reg[7]\(3) => registers_inst_n_63,
      \wAddrCounter_reg[7]\(2) => registers_inst_n_64,
      \wAddrCounter_reg[7]\(1) => registers_inst_n_65,
      \wAddrCounter_reg[7]\(0) => registers_inst_n_66,
      wAddrCounter_reg_3_sp_1 => registers_inst_n_5,
      word_couter_reg(1) => word_couter_reg(9),
      word_couter_reg(0) => word_couter_reg(7),
      \word_couter_reg[31]\ => registers_inst_n_42,
      \word_couter_reg[31]_0\ => registers_inst_n_43
    );
streamer_inst: entity work.design_1_interfacer_ipcore_0_0_0_streamer
     port map (
      DI(0) => rAddress_next1,
      \FSM_sequential_s_dout_state_reg[1]_0\ => registers_inst_n_40,
      \FSM_sequential_s_dout_state_reg[1]_1\ => registers_inst_n_38,
      O(3) => registers_inst_n_47,
      O(2) => registers_inst_n_48,
      O(1) => registers_inst_n_49,
      O(0) => registers_inst_n_50,
      S(0) => streamer_inst_n_47,
      command0(3) => \^command0\(8),
      command0(2 downto 0) => \^command0\(3 downto 1),
      done_read => done_read,
      done_write => done_write,
      m00_axis_aclk => m00_axis_aclk,
      m00_axis_aresetn => m00_axis_aresetn,
      m00_axis_tlast => m00_axis_tlast,
      m00_axis_tready => m00_axis_tready,
      m00_axis_tvalid => m00_axis_tvalid,
      \out\(1) => streamer_inst_n_0,
      \out\(0) => streamer_inst_n_1,
      poly_bram_address(11 downto 0) => poly_bram_address(11 downto 0),
      poly_bram_we => poly_bram_we,
      \rAddress_reg[11]_0\(10 downto 0) => rAddress_reg(11 downto 1),
      \rAddress_reg[11]_1\(3) => registers_inst_n_55,
      \rAddress_reg[11]_1\(2) => registers_inst_n_56,
      \rAddress_reg[11]_1\(1) => registers_inst_n_57,
      \rAddress_reg[11]_1\(0) => registers_inst_n_58,
      \rAddress_reg[7]_0\(3) => registers_inst_n_51,
      \rAddress_reg[7]_0\(2) => registers_inst_n_52,
      \rAddress_reg[7]_0\(1) => registers_inst_n_53,
      \rAddress_reg[7]_0\(0) => registers_inst_n_54,
      s00_axis_aclk => s00_axis_aclk,
      s00_axis_aresetn => s00_axis_aresetn,
      s00_axis_tlast => s00_axis_tlast,
      s00_axis_tready => s00_axis_tready,
      s00_axis_tvalid => s00_axis_tvalid,
      \slv_reg0_reg[0]\ => registers_inst_n_45,
      \slv_reg0_reg[14]\ => registers_inst_n_39,
      \slv_reg0_reg[1]\ => registers_inst_n_44,
      \slv_reg0_reg[1]_0\ => registers_inst_n_46,
      \slv_reg0_reg[2]\(3) => registers_inst_n_59,
      \slv_reg0_reg[2]\(2) => registers_inst_n_60,
      \slv_reg0_reg[2]\(1) => registers_inst_n_61,
      \slv_reg0_reg[2]\(0) => registers_inst_n_62,
      \slv_reg0_reg[2]_0\ => registers_inst_n_5,
      \slv_reg0_reg[3]\ => registers_inst_n_42,
      \slv_reg0_reg[3]_0\ => registers_inst_n_43,
      \slv_reg0_reg[6]\ => registers_inst_n_41,
      wAddrCounter_reg(11 downto 0) => wAddrCounter_reg(11 downto 0),
      \wAddrCounter_reg[11]_0\(3) => registers_inst_n_67,
      \wAddrCounter_reg[11]_0\(2) => registers_inst_n_68,
      \wAddrCounter_reg[11]_0\(1) => registers_inst_n_69,
      \wAddrCounter_reg[11]_0\(0) => registers_inst_n_70,
      \wAddrCounter_reg[3]_0\ => streamer_inst_n_44,
      \wAddrCounter_reg[7]_0\(3) => registers_inst_n_63,
      \wAddrCounter_reg[7]_0\(2) => registers_inst_n_64,
      \wAddrCounter_reg[7]_0\(1) => registers_inst_n_65,
      \wAddrCounter_reg[7]_0\(0) => registers_inst_n_66,
      \word_couter_reg[11]_0\(1) => word_couter_reg(9),
      \word_couter_reg[11]_0\(0) => word_couter_reg(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_interfacer_ipcore_0_0_0 is
  port (
    poly_bram_address : out STD_LOGIC_VECTOR ( 11 downto 0 );
    poly_bram_din : out STD_LOGIC_VECTOR ( 63 downto 0 );
    poly_bram_we : out STD_LOGIC;
    poly_bram_dout : in STD_LOGIC_VECTOR ( 63 downto 0 );
    command0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    status0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m00_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s00_axis_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_interfacer_ipcore_0_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_interfacer_ipcore_0_0_0 : entity is "design_1_interfacer_ipcore_0_0_0,interfacer_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_interfacer_ipcore_0_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_interfacer_ipcore_0_0_0 : entity is "interfacer_v1_0,Vivado 2018.1";
end design_1_interfacer_ipcore_0_0_0;

architecture STRUCTURE of design_1_interfacer_ipcore_0_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^poly_bram_dout\ : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal \^s00_axis_tdata\ : STD_LOGIC_VECTOR ( 63 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of m00_axis_aclk : signal is "xilinx.com:signal:clock:1.0 M00_AXIS_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of m00_axis_aclk : signal is "XIL_INTERFACENAME M00_AXIS_CLK, ASSOCIATED_BUSIF M00_AXIS, ASSOCIATED_RESET m00_axis_aresetn, FREQ_HZ 125000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of m00_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 M00_AXIS_RST RST";
  attribute X_INTERFACE_PARAMETER of m00_axis_aresetn : signal is "XIL_INTERFACENAME M00_AXIS_RST, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of m00_axis_tlast : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TLAST";
  attribute X_INTERFACE_INFO of m00_axis_tready : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TREADY";
  attribute X_INTERFACE_PARAMETER of m00_axis_tready : signal is "XIL_INTERFACENAME M00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 125000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of m00_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TVALID";
  attribute X_INTERFACE_INFO of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK";
  attribute X_INTERFACE_PARAMETER of s00_axi_aclk : signal is "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 125000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXI_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axi_aresetn : signal is "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  attribute X_INTERFACE_INFO of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  attribute X_INTERFACE_INFO of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  attribute X_INTERFACE_INFO of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  attribute X_INTERFACE_INFO of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  attribute X_INTERFACE_INFO of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  attribute X_INTERFACE_INFO of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  attribute X_INTERFACE_PARAMETER of s00_axi_rready : signal is "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 125000000, ID_WIDTH 0, ADDR_WIDTH 6, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0";
  attribute X_INTERFACE_INFO of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  attribute X_INTERFACE_INFO of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  attribute X_INTERFACE_INFO of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  attribute X_INTERFACE_INFO of s00_axis_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXIS_CLK CLK";
  attribute X_INTERFACE_PARAMETER of s00_axis_aclk : signal is "XIL_INTERFACENAME S00_AXIS_CLK, ASSOCIATED_BUSIF S00_AXIS, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 125000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of s00_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXIS_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axis_aresetn : signal is "XIL_INTERFACENAME S00_AXIS_RST, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of s00_axis_tlast : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TLAST";
  attribute X_INTERFACE_INFO of s00_axis_tready : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TREADY";
  attribute X_INTERFACE_PARAMETER of s00_axis_tready : signal is "XIL_INTERFACENAME S00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 125000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of s00_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TVALID";
  attribute X_INTERFACE_INFO of m00_axis_tdata : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TDATA";
  attribute X_INTERFACE_INFO of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  attribute X_INTERFACE_INFO of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  attribute X_INTERFACE_INFO of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  attribute X_INTERFACE_INFO of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  attribute X_INTERFACE_INFO of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  attribute X_INTERFACE_INFO of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  attribute X_INTERFACE_INFO of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  attribute X_INTERFACE_INFO of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  attribute X_INTERFACE_INFO of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
  attribute X_INTERFACE_INFO of s00_axis_tdata : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TDATA";
begin
  \^poly_bram_dout\(63 downto 0) <= poly_bram_dout(63 downto 0);
  \^s00_axis_tdata\(63 downto 0) <= s00_axis_tdata(63 downto 0);
  m00_axis_tdata(63 downto 0) <= \^poly_bram_dout\(63 downto 0);
  m00_axis_tkeep(7) <= \<const1>\;
  m00_axis_tkeep(6) <= \<const1>\;
  m00_axis_tkeep(5) <= \<const1>\;
  m00_axis_tkeep(4) <= \<const1>\;
  m00_axis_tkeep(3) <= \<const1>\;
  m00_axis_tkeep(2) <= \<const1>\;
  m00_axis_tkeep(1) <= \<const1>\;
  m00_axis_tkeep(0) <= \<const1>\;
  poly_bram_din(63 downto 0) <= \^s00_axis_tdata\(63 downto 0);
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.design_1_interfacer_ipcore_0_0_0_interfacer_v1_0
     port map (
      command0(31 downto 0) => command0(31 downto 0),
      m00_axis_aclk => m00_axis_aclk,
      m00_axis_aresetn => m00_axis_aresetn,
      m00_axis_tlast => m00_axis_tlast,
      m00_axis_tready => m00_axis_tready,
      m00_axis_tvalid => m00_axis_tvalid,
      poly_bram_address(11 downto 0) => poly_bram_address(11 downto 0),
      poly_bram_we => poly_bram_we,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_araddr(3 downto 0) => s00_axi_araddr(5 downto 2),
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arready => s00_axi_arready,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(3 downto 0) => s00_axi_awaddr(5 downto 2),
      s00_axi_awready => s00_axi_awready,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rdata(31 downto 0) => s00_axi_rdata(31 downto 0),
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wvalid => s00_axi_wvalid,
      s00_axis_aclk => s00_axis_aclk,
      s00_axis_aresetn => s00_axis_aresetn,
      s00_axis_tlast => s00_axis_tlast,
      s00_axis_tready => s00_axis_tready,
      s00_axis_tvalid => s00_axis_tvalid,
      status0(31 downto 0) => status0(31 downto 0)
    );
end STRUCTURE;
