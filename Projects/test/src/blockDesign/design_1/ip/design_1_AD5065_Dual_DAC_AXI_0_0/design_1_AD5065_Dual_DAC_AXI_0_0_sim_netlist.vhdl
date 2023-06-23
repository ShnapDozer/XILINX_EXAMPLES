-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Tue May 30 18:10:55 2023
-- Host        : DESKTOP-C24D4M0 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Work/Desktop/XILINX_EXAMPLES/Projects/test/src/blockDesign/design_1/ip/design_1_AD5065_Dual_DAC_AXI_0_0/design_1_AD5065_Dual_DAC_AXI_0_0_sim_netlist.vhdl
-- Design      : design_1_AD5065_Dual_DAC_AXI_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_AD5065_Dual_DAC_AXI_0_0_AD5065_Dual_DAC is
  port (
    sclk_reg_0 : out STD_LOGIC;
    sync : out STD_LOGIC;
    mosi : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 4 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 31 downto 0 );
    mosi_reg_0 : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_AD5065_Dual_DAC_AXI_0_0_AD5065_Dual_DAC : entity is "AD5065_Dual_DAC";
end design_1_AD5065_Dual_DAC_AXI_0_0_AD5065_Dual_DAC;

architecture STRUCTURE of design_1_AD5065_Dual_DAC_AXI_0_0_AD5065_Dual_DAC is
  signal \FSM_onehot_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[2]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \bcount[4]_i_1_n_0\ : STD_LOGIC;
  signal data_q : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \data_q0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \data_q0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \data_q0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \data_q0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \data_q0_carry__0_n_0\ : STD_LOGIC;
  signal \data_q0_carry__0_n_1\ : STD_LOGIC;
  signal \data_q0_carry__0_n_2\ : STD_LOGIC;
  signal \data_q0_carry__0_n_3\ : STD_LOGIC;
  signal \data_q0_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \data_q0_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \data_q0_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \data_q0_carry__1_n_1\ : STD_LOGIC;
  signal \data_q0_carry__1_n_2\ : STD_LOGIC;
  signal \data_q0_carry__1_n_3\ : STD_LOGIC;
  signal data_q0_carry_i_1_n_0 : STD_LOGIC;
  signal data_q0_carry_i_2_n_0 : STD_LOGIC;
  signal data_q0_carry_i_3_n_0 : STD_LOGIC;
  signal data_q0_carry_i_4_n_0 : STD_LOGIC;
  signal data_q0_carry_n_0 : STD_LOGIC;
  signal data_q0_carry_n_1 : STD_LOGIC;
  signal data_q0_carry_n_2 : STD_LOGIC;
  signal data_q0_carry_n_3 : STD_LOGIC;
  signal data_q_0 : STD_LOGIC;
  signal \^mosi\ : STD_LOGIC;
  signal mosi_i_1_n_0 : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal sclk_i_1_n_0 : STD_LOGIC;
  signal \^sclk_reg_0\ : STD_LOGIC;
  signal \^sync\ : STD_LOGIC;
  signal sync_i_1_n_0 : STD_LOGIC;
  signal NLW_data_q0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_data_q0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_data_q0_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_data_q0_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state[0]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \FSM_onehot_state[1]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \FSM_onehot_state[2]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \FSM_onehot_state[2]_i_4\ : label is "soft_lutpair6";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "start:001,send:010,stop:100,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "start:001,send:010,stop:100,";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "start:001,send:010,stop:100,";
  attribute SOFT_HLUTNM of \bcount[0]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \bcount[1]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \bcount[2]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \bcount[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \bcount[4]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of mosi_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of sclk_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of sync_i_1 : label is "soft_lutpair5";
begin
  Q(4 downto 0) <= \^q\(4 downto 0);
  mosi <= \^mosi\;
  sclk_reg_0 <= \^sclk_reg_0\;
  sync <= \^sync\;
\FSM_onehot_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => \FSM_onehot_state_reg_n_0_[0]\,
      O => \FSM_onehot_state[0]_i_1_n_0\
    );
\FSM_onehot_state[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[0]\,
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => \FSM_onehot_state_reg_n_0_[1]\,
      O => \FSM_onehot_state[1]_i_1_n_0\
    );
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => \FSM_onehot_state[2]_i_2_n_0\,
      I2 => \FSM_onehot_state_reg_n_0_[2]\,
      O => \FSM_onehot_state[2]_i_1_n_0\
    );
\FSM_onehot_state[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00EA2A00000000"
    )
        port map (
      I0 => \FSM_onehot_state[2]_i_3_n_0\,
      I1 => \FSM_onehot_state_reg_n_0_[2]\,
      I2 => \data_q0_carry__1_n_1\,
      I3 => \^sclk_reg_0\,
      I4 => \FSM_onehot_state_reg_n_0_[0]\,
      I5 => s00_axi_aresetn,
      O => \FSM_onehot_state[2]_i_2_n_0\
    );
\FSM_onehot_state[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => \^sclk_reg_0\,
      I1 => \^q\(3),
      I2 => \FSM_onehot_state[2]_i_4_n_0\,
      I3 => \^q\(2),
      I4 => \^q\(4),
      I5 => \FSM_onehot_state_reg_n_0_[1]\,
      O => \FSM_onehot_state[2]_i_3_n_0\
    );
\FSM_onehot_state[2]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \FSM_onehot_state[2]_i_4_n_0\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \FSM_onehot_state[0]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[0]\,
      R => '0'
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \FSM_onehot_state[1]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[1]\,
      R => '0'
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \FSM_onehot_state[2]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[2]\,
      R => '0'
    );
\bcount[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \p_0_in__0\(0)
    );
\bcount[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      O => \p_0_in__0\(1)
    );
\bcount[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A9"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      O => \p_0_in__0\(2)
    );
\bcount[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA9"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      O => \p_0_in__0\(3)
    );
\bcount[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => \^sclk_reg_0\,
      I2 => s00_axi_aresetn,
      O => \bcount[4]_i_1_n_0\
    );
\bcount[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^q\(1),
      I4 => \^q\(3),
      O => \p_0_in__0\(4)
    );
\bcount_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \bcount[4]_i_1_n_0\,
      D => \p_0_in__0\(0),
      Q => \^q\(0),
      R => '0'
    );
\bcount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \bcount[4]_i_1_n_0\,
      D => \p_0_in__0\(1),
      Q => \^q\(1),
      R => '0'
    );
\bcount_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \bcount[4]_i_1_n_0\,
      D => \p_0_in__0\(2),
      Q => \^q\(2),
      R => '0'
    );
\bcount_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \bcount[4]_i_1_n_0\,
      D => \p_0_in__0\(3),
      Q => \^q\(3),
      R => '0'
    );
\bcount_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => s00_axi_aclk,
      CE => \bcount[4]_i_1_n_0\,
      D => \p_0_in__0\(4),
      Q => \^q\(4),
      R => '0'
    );
data_q0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => data_q0_carry_n_0,
      CO(2) => data_q0_carry_n_1,
      CO(1) => data_q0_carry_n_2,
      CO(0) => data_q0_carry_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3 downto 0) => NLW_data_q0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => data_q0_carry_i_1_n_0,
      S(2) => data_q0_carry_i_2_n_0,
      S(1) => data_q0_carry_i_3_n_0,
      S(0) => data_q0_carry_i_4_n_0
    );
\data_q0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => data_q0_carry_n_0,
      CO(3) => \data_q0_carry__0_n_0\,
      CO(2) => \data_q0_carry__0_n_1\,
      CO(1) => \data_q0_carry__0_n_2\,
      CO(0) => \data_q0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"1111",
      O(3 downto 0) => \NLW_data_q0_carry__0_O_UNCONNECTED\(3 downto 0),
      S(3) => \data_q0_carry__0_i_1_n_0\,
      S(2) => \data_q0_carry__0_i_2_n_0\,
      S(1) => \data_q0_carry__0_i_3_n_0\,
      S(0) => \data_q0_carry__0_i_4_n_0\
    );
\data_q0_carry__0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8008200240041001"
    )
        port map (
      I0 => data_q(23),
      I1 => D(22),
      I2 => data_q(21),
      I3 => D(21),
      I4 => data_q(22),
      I5 => D(23),
      O => \data_q0_carry__0_i_1_n_0\
    );
\data_q0_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8008200240041001"
    )
        port map (
      I0 => data_q(20),
      I1 => D(19),
      I2 => data_q(18),
      I3 => D(18),
      I4 => data_q(19),
      I5 => D(20),
      O => \data_q0_carry__0_i_2_n_0\
    );
\data_q0_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8008200240041001"
    )
        port map (
      I0 => data_q(17),
      I1 => D(16),
      I2 => data_q(15),
      I3 => D(15),
      I4 => data_q(16),
      I5 => D(17),
      O => \data_q0_carry__0_i_3_n_0\
    );
\data_q0_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8008200240041001"
    )
        port map (
      I0 => data_q(14),
      I1 => D(13),
      I2 => data_q(12),
      I3 => D(12),
      I4 => data_q(13),
      I5 => D(14),
      O => \data_q0_carry__0_i_4_n_0\
    );
\data_q0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \data_q0_carry__0_n_0\,
      CO(3) => \NLW_data_q0_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \data_q0_carry__1_n_1\,
      CO(1) => \data_q0_carry__1_n_2\,
      CO(0) => \data_q0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0111",
      O(3 downto 0) => \NLW_data_q0_carry__1_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => \data_q0_carry__1_i_1_n_0\,
      S(1) => \data_q0_carry__1_i_2_n_0\,
      S(0) => \data_q0_carry__1_i_3_n_0\
    );
\data_q0_carry__1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8241"
    )
        port map (
      I0 => data_q(31),
      I1 => D(30),
      I2 => data_q(30),
      I3 => D(31),
      O => \data_q0_carry__1_i_1_n_0\
    );
\data_q0_carry__1_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8008200240041001"
    )
        port map (
      I0 => data_q(29),
      I1 => D(28),
      I2 => data_q(27),
      I3 => D(27),
      I4 => data_q(28),
      I5 => D(29),
      O => \data_q0_carry__1_i_2_n_0\
    );
\data_q0_carry__1_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8008200240041001"
    )
        port map (
      I0 => data_q(26),
      I1 => D(25),
      I2 => data_q(24),
      I3 => D(24),
      I4 => data_q(25),
      I5 => D(26),
      O => \data_q0_carry__1_i_3_n_0\
    );
data_q0_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8008200240041001"
    )
        port map (
      I0 => data_q(11),
      I1 => D(10),
      I2 => data_q(9),
      I3 => D(9),
      I4 => data_q(10),
      I5 => D(11),
      O => data_q0_carry_i_1_n_0
    );
data_q0_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8008200240041001"
    )
        port map (
      I0 => data_q(8),
      I1 => D(7),
      I2 => data_q(6),
      I3 => D(6),
      I4 => data_q(7),
      I5 => D(8),
      O => data_q0_carry_i_2_n_0
    );
data_q0_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8008200240041001"
    )
        port map (
      I0 => data_q(5),
      I1 => D(4),
      I2 => data_q(3),
      I3 => D(3),
      I4 => data_q(4),
      I5 => D(5),
      O => data_q0_carry_i_3_n_0
    );
data_q0_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8008200240041001"
    )
        port map (
      I0 => data_q(2),
      I1 => D(1),
      I2 => data_q(0),
      I3 => D(0),
      I4 => data_q(1),
      I5 => D(2),
      O => data_q0_carry_i_4_n_0
    );
\data_q[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \data_q0_carry__1_n_1\,
      I1 => \^sclk_reg_0\,
      I2 => \FSM_onehot_state_reg_n_0_[2]\,
      O => data_q_0
    );
\data_q_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(0),
      Q => data_q(0),
      R => SR(0)
    );
\data_q_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(10),
      Q => data_q(10),
      R => SR(0)
    );
\data_q_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(11),
      Q => data_q(11),
      R => SR(0)
    );
\data_q_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(12),
      Q => data_q(12),
      R => SR(0)
    );
\data_q_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(13),
      Q => data_q(13),
      R => SR(0)
    );
\data_q_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(14),
      Q => data_q(14),
      R => SR(0)
    );
\data_q_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(15),
      Q => data_q(15),
      R => SR(0)
    );
\data_q_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(16),
      Q => data_q(16),
      R => SR(0)
    );
\data_q_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(17),
      Q => data_q(17),
      R => SR(0)
    );
\data_q_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(18),
      Q => data_q(18),
      R => SR(0)
    );
\data_q_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(19),
      Q => data_q(19),
      R => SR(0)
    );
\data_q_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(1),
      Q => data_q(1),
      R => SR(0)
    );
\data_q_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(20),
      Q => data_q(20),
      R => SR(0)
    );
\data_q_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(21),
      Q => data_q(21),
      R => SR(0)
    );
\data_q_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(22),
      Q => data_q(22),
      R => SR(0)
    );
\data_q_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(23),
      Q => data_q(23),
      R => SR(0)
    );
\data_q_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(24),
      Q => data_q(24),
      R => SR(0)
    );
\data_q_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(25),
      Q => data_q(25),
      R => SR(0)
    );
\data_q_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(26),
      Q => data_q(26),
      R => SR(0)
    );
\data_q_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(27),
      Q => data_q(27),
      R => SR(0)
    );
\data_q_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(28),
      Q => data_q(28),
      R => SR(0)
    );
\data_q_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(29),
      Q => data_q(29),
      R => SR(0)
    );
\data_q_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(2),
      Q => data_q(2),
      R => SR(0)
    );
\data_q_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(30),
      Q => data_q(30),
      R => SR(0)
    );
\data_q_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(31),
      Q => data_q(31),
      R => SR(0)
    );
\data_q_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(3),
      Q => data_q(3),
      R => SR(0)
    );
\data_q_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(4),
      Q => data_q(4),
      R => SR(0)
    );
\data_q_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(5),
      Q => data_q(5),
      R => SR(0)
    );
\data_q_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(6),
      Q => data_q(6),
      R => SR(0)
    );
\data_q_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(7),
      Q => data_q(7),
      R => SR(0)
    );
\data_q_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(8),
      Q => data_q(8),
      R => SR(0)
    );
\data_q_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => data_q_0,
      D => D(9),
      Q => data_q(9),
      R => SR(0)
    );
mosi_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFF2000"
    )
        port map (
      I0 => mosi_reg_0,
      I1 => \^sclk_reg_0\,
      I2 => \FSM_onehot_state_reg_n_0_[1]\,
      I3 => s00_axi_aresetn,
      I4 => \^mosi\,
      O => mosi_i_1_n_0
    );
mosi_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => mosi_i_1_n_0,
      Q => \^mosi\,
      R => '0'
    );
sclk_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => s00_axi_aresetn,
      I1 => \^sclk_reg_0\,
      O => sclk_i_1_n_0
    );
sclk_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axi_aclk,
      CE => '1',
      D => sclk_i_1_n_0,
      Q => \^sclk_reg_0\,
      R => '0'
    );
sync_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFE0"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_state_reg_n_0_[0]\,
      I2 => s00_axi_aresetn,
      I3 => \^sync\,
      O => sync_i_1_n_0
    );
sync_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => sync_i_1_n_0,
      Q => \^sync\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_AD5065_Dual_DAC_AXI_0_0_AD5065_Dual_DAC_AXI_v1_0_S00_AXI is
  port (
    s00_axi_awready : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    s00_axi_wready : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    \bcount_reg[4]\ : out STD_LOGIC;
    \data_o_reg[31]_0\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_AD5065_Dual_DAC_AXI_0_0_AD5065_Dual_DAC_AXI_v1_0_S00_AXI : entity is "AD5065_Dual_DAC_AXI_v1_0_S00_AXI";
end design_1_AD5065_Dual_DAC_AXI_0_0_AD5065_Dual_DAC_AXI_v1_0_S00_AXI;

architecture STRUCTURE of design_1_AD5065_Dual_DAC_AXI_0_0_AD5065_Dual_DAC_AXI_v1_0_S00_AXI is
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal axi_arready0 : STD_LOGIC;
  signal axi_awaddr : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \axi_awaddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \axi_awaddr[3]_i_1_n_0\ : STD_LOGIC;
  signal axi_awready0 : STD_LOGIC;
  signal axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal axi_wready0 : STD_LOGIC;
  signal \^data_o_reg[31]_0\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal mosi_i_10_n_0 : STD_LOGIC;
  signal mosi_i_3_n_0 : STD_LOGIC;
  signal mosi_i_4_n_0 : STD_LOGIC;
  signal mosi_i_5_n_0 : STD_LOGIC;
  signal mosi_i_6_n_0 : STD_LOGIC;
  signal mosi_i_7_n_0 : STD_LOGIC;
  signal mosi_i_8_n_0 : STD_LOGIC;
  signal mosi_i_9_n_0 : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal \^s00_axi_arready\ : STD_LOGIC;
  signal \^s00_axi_awready\ : STD_LOGIC;
  signal \^s00_axi_bvalid\ : STD_LOGIC;
  signal \^s00_axi_rvalid\ : STD_LOGIC;
  signal \^s00_axi_wready\ : STD_LOGIC;
  signal slv_reg0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \slv_reg_wren__0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of axi_arready_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \axi_awaddr[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axi_awready_i_2 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of axi_rvalid_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of axi_wready_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \slv_reg0[31]_i_2\ : label is "soft_lutpair2";
begin
  SR(0) <= \^sr\(0);
  \data_o_reg[31]_0\(31 downto 0) <= \^data_o_reg[31]_0\(31 downto 0);
  s00_axi_arready <= \^s00_axi_arready\;
  s00_axi_awready <= \^s00_axi_awready\;
  s00_axi_bvalid <= \^s00_axi_bvalid\;
  s00_axi_rvalid <= \^s00_axi_rvalid\;
  s00_axi_wready <= \^s00_axi_wready\;
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
      R => \^sr\(0)
    );
\axi_awaddr[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBF0080"
    )
        port map (
      I0 => s00_axi_awaddr(0),
      I1 => s00_axi_wvalid,
      I2 => s00_axi_awvalid,
      I3 => \^s00_axi_awready\,
      I4 => axi_awaddr(2),
      O => \axi_awaddr[2]_i_1_n_0\
    );
\axi_awaddr[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBF0080"
    )
        port map (
      I0 => s00_axi_awaddr(1),
      I1 => s00_axi_wvalid,
      I2 => s00_axi_awvalid,
      I3 => \^s00_axi_awready\,
      I4 => axi_awaddr(3),
      O => \axi_awaddr[3]_i_1_n_0\
    );
\axi_awaddr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[2]_i_1_n_0\,
      Q => axi_awaddr(2),
      R => \^sr\(0)
    );
\axi_awaddr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => \axi_awaddr[3]_i_1_n_0\,
      Q => axi_awaddr(3),
      R => \^sr\(0)
    );
axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axi_aresetn,
      O => \^sr\(0)
    );
axi_awready_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_awvalid,
      I2 => \^s00_axi_awready\,
      O => axi_awready0
    );
axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_awready0,
      Q => \^s00_axi_awready\,
      R => \^sr\(0)
    );
axi_bvalid_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFF80008000"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_awvalid,
      I2 => \^s00_axi_wready\,
      I3 => \^s00_axi_awready\,
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
      R => \^sr\(0)
    );
axi_rvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F8"
    )
        port map (
      I0 => s00_axi_arvalid,
      I1 => \^s00_axi_arready\,
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
      R => \^sr\(0)
    );
axi_wready_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => s00_axi_wvalid,
      I1 => s00_axi_awvalid,
      I2 => \^s00_axi_wready\,
      O => axi_wready0
    );
axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => axi_wready0,
      Q => \^s00_axi_wready\,
      R => \^sr\(0)
    );
\data_o_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(0),
      Q => \^data_o_reg[31]_0\(0),
      R => '0'
    );
\data_o_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(10),
      Q => \^data_o_reg[31]_0\(10),
      R => '0'
    );
\data_o_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(11),
      Q => \^data_o_reg[31]_0\(11),
      R => '0'
    );
\data_o_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(12),
      Q => \^data_o_reg[31]_0\(12),
      R => '0'
    );
\data_o_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(13),
      Q => \^data_o_reg[31]_0\(13),
      R => '0'
    );
\data_o_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(14),
      Q => \^data_o_reg[31]_0\(14),
      R => '0'
    );
\data_o_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(15),
      Q => \^data_o_reg[31]_0\(15),
      R => '0'
    );
\data_o_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(16),
      Q => \^data_o_reg[31]_0\(16),
      R => '0'
    );
\data_o_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(17),
      Q => \^data_o_reg[31]_0\(17),
      R => '0'
    );
\data_o_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(18),
      Q => \^data_o_reg[31]_0\(18),
      R => '0'
    );
\data_o_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(19),
      Q => \^data_o_reg[31]_0\(19),
      R => '0'
    );
\data_o_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(1),
      Q => \^data_o_reg[31]_0\(1),
      R => '0'
    );
\data_o_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(20),
      Q => \^data_o_reg[31]_0\(20),
      R => '0'
    );
\data_o_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(21),
      Q => \^data_o_reg[31]_0\(21),
      R => '0'
    );
\data_o_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(22),
      Q => \^data_o_reg[31]_0\(22),
      R => '0'
    );
\data_o_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(23),
      Q => \^data_o_reg[31]_0\(23),
      R => '0'
    );
\data_o_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(24),
      Q => \^data_o_reg[31]_0\(24),
      R => '0'
    );
\data_o_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(25),
      Q => \^data_o_reg[31]_0\(25),
      R => '0'
    );
\data_o_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(26),
      Q => \^data_o_reg[31]_0\(26),
      R => '0'
    );
\data_o_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(27),
      Q => \^data_o_reg[31]_0\(27),
      R => '0'
    );
\data_o_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(28),
      Q => \^data_o_reg[31]_0\(28),
      R => '0'
    );
\data_o_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(29),
      Q => \^data_o_reg[31]_0\(29),
      R => '0'
    );
\data_o_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(2),
      Q => \^data_o_reg[31]_0\(2),
      R => '0'
    );
\data_o_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(30),
      Q => \^data_o_reg[31]_0\(30),
      R => '0'
    );
\data_o_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(31),
      Q => \^data_o_reg[31]_0\(31),
      R => '0'
    );
\data_o_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(3),
      Q => \^data_o_reg[31]_0\(3),
      R => '0'
    );
\data_o_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(4),
      Q => \^data_o_reg[31]_0\(4),
      R => '0'
    );
\data_o_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(5),
      Q => \^data_o_reg[31]_0\(5),
      R => '0'
    );
\data_o_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(6),
      Q => \^data_o_reg[31]_0\(6),
      R => '0'
    );
\data_o_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(7),
      Q => \^data_o_reg[31]_0\(7),
      R => '0'
    );
\data_o_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(8),
      Q => \^data_o_reg[31]_0\(8),
      R => '0'
    );
\data_o_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => '1',
      D => slv_reg0(9),
      Q => \^data_o_reg[31]_0\(9),
      R => '0'
    );
mosi_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^data_o_reg[31]_0\(19),
      I1 => \^data_o_reg[31]_0\(18),
      I2 => Q(1),
      I3 => \^data_o_reg[31]_0\(17),
      I4 => Q(0),
      I5 => \^data_o_reg[31]_0\(16),
      O => mosi_i_10_n_0
    );
mosi_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFA0C0C0"
    )
        port map (
      I0 => mosi_i_5_n_0,
      I1 => mosi_i_6_n_0,
      I2 => Q(3),
      I3 => mosi_i_7_n_0,
      I4 => Q(2),
      O => mosi_i_3_n_0
    );
mosi_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => mosi_i_8_n_0,
      I1 => Q(3),
      I2 => mosi_i_9_n_0,
      I3 => Q(2),
      I4 => mosi_i_10_n_0,
      O => mosi_i_4_n_0
    );
mosi_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^data_o_reg[31]_0\(15),
      I1 => \^data_o_reg[31]_0\(14),
      I2 => Q(1),
      I3 => \^data_o_reg[31]_0\(13),
      I4 => Q(0),
      I5 => \^data_o_reg[31]_0\(12),
      O => mosi_i_5_n_0
    );
mosi_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^data_o_reg[31]_0\(11),
      I1 => \^data_o_reg[31]_0\(10),
      I2 => Q(1),
      I3 => \^data_o_reg[31]_0\(9),
      I4 => Q(0),
      I5 => \^data_o_reg[31]_0\(8),
      O => mosi_i_6_n_0
    );
mosi_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^data_o_reg[31]_0\(7),
      I1 => \^data_o_reg[31]_0\(6),
      I2 => Q(1),
      I3 => \^data_o_reg[31]_0\(5),
      I4 => Q(0),
      I5 => \^data_o_reg[31]_0\(4),
      O => mosi_i_7_n_0
    );
mosi_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^data_o_reg[31]_0\(27),
      I1 => \^data_o_reg[31]_0\(26),
      I2 => Q(1),
      I3 => \^data_o_reg[31]_0\(25),
      I4 => Q(0),
      I5 => \^data_o_reg[31]_0\(24),
      O => mosi_i_8_n_0
    );
mosi_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^data_o_reg[31]_0\(23),
      I1 => \^data_o_reg[31]_0\(22),
      I2 => Q(1),
      I3 => \^data_o_reg[31]_0\(21),
      I4 => Q(0),
      I5 => \^data_o_reg[31]_0\(20),
      O => mosi_i_9_n_0
    );
mosi_reg_i_2: unisim.vcomponents.MUXF7
     port map (
      I0 => mosi_i_3_n_0,
      I1 => mosi_i_4_n_0,
      O => \bcount_reg[4]\,
      S => Q(4)
    );
\slv_reg0[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(2),
      I3 => s00_axi_wstrb(1),
      O => p_1_in(8)
    );
\slv_reg0[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(2),
      I3 => s00_axi_wstrb(2),
      O => p_1_in(16)
    );
\slv_reg0[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(2),
      I3 => s00_axi_wstrb(3),
      O => p_1_in(24)
    );
\slv_reg0[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \^s00_axi_awready\,
      I1 => \^s00_axi_wready\,
      I2 => s00_axi_wvalid,
      I3 => s00_axi_awvalid,
      O => \slv_reg_wren__0\
    );
\slv_reg0[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \slv_reg_wren__0\,
      I1 => axi_awaddr(3),
      I2 => axi_awaddr(2),
      I3 => s00_axi_wstrb(0),
      O => p_1_in(0)
    );
\slv_reg0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(0),
      Q => slv_reg0(0),
      R => \^sr\(0)
    );
\slv_reg0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(8),
      D => s00_axi_wdata(10),
      Q => slv_reg0(10),
      R => \^sr\(0)
    );
\slv_reg0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(8),
      D => s00_axi_wdata(11),
      Q => slv_reg0(11),
      R => \^sr\(0)
    );
\slv_reg0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(8),
      D => s00_axi_wdata(12),
      Q => slv_reg0(12),
      R => \^sr\(0)
    );
\slv_reg0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(8),
      D => s00_axi_wdata(13),
      Q => slv_reg0(13),
      R => \^sr\(0)
    );
\slv_reg0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(8),
      D => s00_axi_wdata(14),
      Q => slv_reg0(14),
      R => \^sr\(0)
    );
\slv_reg0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(8),
      D => s00_axi_wdata(15),
      Q => slv_reg0(15),
      R => \^sr\(0)
    );
\slv_reg0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(16),
      D => s00_axi_wdata(16),
      Q => slv_reg0(16),
      R => \^sr\(0)
    );
\slv_reg0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(16),
      D => s00_axi_wdata(17),
      Q => slv_reg0(17),
      R => \^sr\(0)
    );
\slv_reg0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(16),
      D => s00_axi_wdata(18),
      Q => slv_reg0(18),
      R => \^sr\(0)
    );
\slv_reg0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(16),
      D => s00_axi_wdata(19),
      Q => slv_reg0(19),
      R => \^sr\(0)
    );
\slv_reg0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(1),
      Q => slv_reg0(1),
      R => \^sr\(0)
    );
\slv_reg0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(16),
      D => s00_axi_wdata(20),
      Q => slv_reg0(20),
      R => \^sr\(0)
    );
\slv_reg0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(16),
      D => s00_axi_wdata(21),
      Q => slv_reg0(21),
      R => \^sr\(0)
    );
\slv_reg0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(16),
      D => s00_axi_wdata(22),
      Q => slv_reg0(22),
      R => \^sr\(0)
    );
\slv_reg0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(16),
      D => s00_axi_wdata(23),
      Q => slv_reg0(23),
      R => \^sr\(0)
    );
\slv_reg0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(24),
      D => s00_axi_wdata(24),
      Q => slv_reg0(24),
      R => \^sr\(0)
    );
\slv_reg0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(24),
      D => s00_axi_wdata(25),
      Q => slv_reg0(25),
      R => \^sr\(0)
    );
\slv_reg0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(24),
      D => s00_axi_wdata(26),
      Q => slv_reg0(26),
      R => \^sr\(0)
    );
\slv_reg0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(24),
      D => s00_axi_wdata(27),
      Q => slv_reg0(27),
      R => \^sr\(0)
    );
\slv_reg0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(24),
      D => s00_axi_wdata(28),
      Q => slv_reg0(28),
      R => \^sr\(0)
    );
\slv_reg0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(24),
      D => s00_axi_wdata(29),
      Q => slv_reg0(29),
      R => \^sr\(0)
    );
\slv_reg0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(2),
      Q => slv_reg0(2),
      R => \^sr\(0)
    );
\slv_reg0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(24),
      D => s00_axi_wdata(30),
      Q => slv_reg0(30),
      R => \^sr\(0)
    );
\slv_reg0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(24),
      D => s00_axi_wdata(31),
      Q => slv_reg0(31),
      R => \^sr\(0)
    );
\slv_reg0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(3),
      Q => slv_reg0(3),
      R => \^sr\(0)
    );
\slv_reg0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(4),
      Q => slv_reg0(4),
      R => \^sr\(0)
    );
\slv_reg0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(5),
      Q => slv_reg0(5),
      R => \^sr\(0)
    );
\slv_reg0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(6),
      Q => slv_reg0(6),
      R => \^sr\(0)
    );
\slv_reg0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(0),
      D => s00_axi_wdata(7),
      Q => slv_reg0(7),
      R => \^sr\(0)
    );
\slv_reg0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(8),
      D => s00_axi_wdata(8),
      Q => slv_reg0(8),
      R => \^sr\(0)
    );
\slv_reg0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s00_axi_aclk,
      CE => p_1_in(8),
      D => s00_axi_wdata(9),
      Q => slv_reg0(9),
      R => \^sr\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_AD5065_Dual_DAC_AXI_0_0_AD5065_Dual_DAC_AXI_v1_0 is
  port (
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    sclk_reg : out STD_LOGIC;
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_rvalid : out STD_LOGIC;
    mosi : out STD_LOGIC;
    sync : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_AD5065_Dual_DAC_AXI_0_0_AD5065_Dual_DAC_AXI_v1_0 : entity is "AD5065_Dual_DAC_AXI_v1_0";
end design_1_AD5065_Dual_DAC_AXI_0_0_AD5065_Dual_DAC_AXI_v1_0;

architecture STRUCTURE of design_1_AD5065_Dual_DAC_AXI_0_0_AD5065_Dual_DAC_AXI_v1_0 is
  signal AD5065_Dual_DAC_AXI_v1_0_S00_AXI_inst_n_6 : STD_LOGIC;
  signal bcount_reg : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal data_o : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_0_in : STD_LOGIC;
begin
AD5065_Dual_DAC_AXI_v1_0_S00_AXI_inst: entity work.design_1_AD5065_Dual_DAC_AXI_0_0_AD5065_Dual_DAC_AXI_v1_0_S00_AXI
     port map (
      Q(4 downto 0) => bcount_reg(4 downto 0),
      SR(0) => p_0_in,
      \bcount_reg[4]\ => AD5065_Dual_DAC_AXI_v1_0_S00_AXI_inst_n_6,
      \data_o_reg[31]_0\(31 downto 0) => data_o(31 downto 0),
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arready => s00_axi_arready,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(1 downto 0),
      s00_axi_awready => s00_axi_awready,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid
    );
AD5065_Dual_DAC_inst: entity work.design_1_AD5065_Dual_DAC_AXI_0_0_AD5065_Dual_DAC
     port map (
      D(31 downto 0) => data_o(31 downto 0),
      Q(4 downto 0) => bcount_reg(4 downto 0),
      SR(0) => p_0_in,
      mosi => mosi,
      mosi_reg_0 => AD5065_Dual_DAC_AXI_v1_0_S00_AXI_inst_n_6,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      sclk_reg_0 => sclk_reg,
      sync => sync
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_AD5065_Dual_DAC_AXI_0_0 is
  port (
    sclk : out STD_LOGIC;
    sync : out STD_LOGIC;
    mosi : out STD_LOGIC;
    ldac : out STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
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
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_AD5065_Dual_DAC_AXI_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_AD5065_Dual_DAC_AXI_0_0 : entity is "design_1_AD5065_Dual_DAC_AXI_0_0,AD5065_Dual_DAC_AXI_v1_0,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_AD5065_Dual_DAC_AXI_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of design_1_AD5065_Dual_DAC_AXI_0_0 : entity is "package_project";
  attribute x_core_info : string;
  attribute x_core_info of design_1_AD5065_Dual_DAC_AXI_0_0 : entity is "AD5065_Dual_DAC_AXI_v1_0,Vivado 2020.1";
end design_1_AD5065_Dual_DAC_AXI_0_0;

architecture STRUCTURE of design_1_AD5065_Dual_DAC_AXI_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of s00_axi_aclk : signal is "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of s00_axi_aclk : signal is "XIL_INTERFACENAME s00_axi_aclk, ASSOCIATED_BUSIF s00_axi, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of s00_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 s00_axi_aresetn RST";
  attribute x_interface_parameter of s00_axi_aresetn : signal is "XIL_INTERFACENAME s00_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of s00_axi_arready : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARREADY";
  attribute x_interface_info of s00_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARVALID";
  attribute x_interface_info of s00_axi_awready : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWREADY";
  attribute x_interface_info of s00_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWVALID";
  attribute x_interface_info of s00_axi_bready : signal is "xilinx.com:interface:aximm:1.0 s00_axi BREADY";
  attribute x_interface_info of s00_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi BVALID";
  attribute x_interface_info of s00_axi_rready : signal is "xilinx.com:interface:aximm:1.0 s00_axi RREADY";
  attribute x_interface_info of s00_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi RVALID";
  attribute x_interface_info of s00_axi_wready : signal is "xilinx.com:interface:aximm:1.0 s00_axi WREADY";
  attribute x_interface_info of s00_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 s00_axi WVALID";
  attribute x_interface_info of s00_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARADDR";
  attribute x_interface_info of s00_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 s00_axi ARPROT";
  attribute x_interface_info of s00_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWADDR";
  attribute x_interface_parameter of s00_axi_awaddr : signal is "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of s00_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 s00_axi AWPROT";
  attribute x_interface_info of s00_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 s00_axi BRESP";
  attribute x_interface_info of s00_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 s00_axi RDATA";
  attribute x_interface_info of s00_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 s00_axi RRESP";
  attribute x_interface_info of s00_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 s00_axi WDATA";
  attribute x_interface_info of s00_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 s00_axi WSTRB";
begin
  ldac <= \<const0>\;
  s00_axi_bresp(1) <= \<const0>\;
  s00_axi_bresp(0) <= \<const0>\;
  s00_axi_rdata(31) <= \<const0>\;
  s00_axi_rdata(30) <= \<const0>\;
  s00_axi_rdata(29) <= \<const0>\;
  s00_axi_rdata(28) <= \<const0>\;
  s00_axi_rdata(27) <= \<const0>\;
  s00_axi_rdata(26) <= \<const0>\;
  s00_axi_rdata(25) <= \<const0>\;
  s00_axi_rdata(24) <= \<const0>\;
  s00_axi_rdata(23) <= \<const0>\;
  s00_axi_rdata(22) <= \<const0>\;
  s00_axi_rdata(21) <= \<const0>\;
  s00_axi_rdata(20) <= \<const0>\;
  s00_axi_rdata(19) <= \<const0>\;
  s00_axi_rdata(18) <= \<const0>\;
  s00_axi_rdata(17) <= \<const0>\;
  s00_axi_rdata(16) <= \<const0>\;
  s00_axi_rdata(15) <= \<const0>\;
  s00_axi_rdata(14) <= \<const0>\;
  s00_axi_rdata(13) <= \<const0>\;
  s00_axi_rdata(12) <= \<const0>\;
  s00_axi_rdata(11) <= \<const0>\;
  s00_axi_rdata(10) <= \<const0>\;
  s00_axi_rdata(9) <= \<const0>\;
  s00_axi_rdata(8) <= \<const0>\;
  s00_axi_rdata(7) <= \<const0>\;
  s00_axi_rdata(6) <= \<const0>\;
  s00_axi_rdata(5) <= \<const0>\;
  s00_axi_rdata(4) <= \<const0>\;
  s00_axi_rdata(3) <= \<const0>\;
  s00_axi_rdata(2) <= \<const0>\;
  s00_axi_rdata(1) <= \<const0>\;
  s00_axi_rdata(0) <= \<const0>\;
  s00_axi_rresp(1) <= \<const0>\;
  s00_axi_rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.design_1_AD5065_Dual_DAC_AXI_0_0_AD5065_Dual_DAC_AXI_v1_0
     port map (
      mosi => mosi,
      s00_axi_aclk => s00_axi_aclk,
      s00_axi_aresetn => s00_axi_aresetn,
      s00_axi_arready => s00_axi_arready,
      s00_axi_arvalid => s00_axi_arvalid,
      s00_axi_awaddr(1 downto 0) => s00_axi_awaddr(3 downto 2),
      s00_axi_awready => s00_axi_awready,
      s00_axi_awvalid => s00_axi_awvalid,
      s00_axi_bready => s00_axi_bready,
      s00_axi_bvalid => s00_axi_bvalid,
      s00_axi_rready => s00_axi_rready,
      s00_axi_rvalid => s00_axi_rvalid,
      s00_axi_wdata(31 downto 0) => s00_axi_wdata(31 downto 0),
      s00_axi_wready => s00_axi_wready,
      s00_axi_wstrb(3 downto 0) => s00_axi_wstrb(3 downto 0),
      s00_axi_wvalid => s00_axi_wvalid,
      sclk_reg => sclk,
      sync => sync
    );
end STRUCTURE;
