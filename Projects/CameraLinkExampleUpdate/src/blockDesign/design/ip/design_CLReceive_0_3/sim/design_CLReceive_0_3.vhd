-- (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:CLReceive:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_CLReceive_0_3 IS
  PORT (
    CL_clk : IN STD_LOGIC;
    CL_rstn : IN STD_LOGIC;
    CL_CC_aresetn : IN STD_LOGIC;
    CL_data : IN STD_LOGIC_VECTOR(27 DOWNTO 0);
    CL_CC : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    Switches : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    Leds : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    S00_AXI_aclk : IN STD_LOGIC;
    S00_AXI_aresetn : IN STD_LOGIC;
    S00_AXI_arvalid : IN STD_LOGIC;
    S00_AXI_awvalid : IN STD_LOGIC;
    S00_AXI_bready : IN STD_LOGIC;
    S00_AXI_rready : IN STD_LOGIC;
    S00_AXI_wvalid : IN STD_LOGIC;
    S00_AXI_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S00_AXI_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    S00_AXI_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S00_AXI_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    S00_AXI_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    S00_AXI_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    S00_AXI_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S00_AXI_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S00_AXI_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    S00_AXI_arready : OUT STD_LOGIC;
    S00_AXI_awready : OUT STD_LOGIC;
    S00_AXI_bvalid : OUT STD_LOGIC;
    S00_AXI_rvalid : OUT STD_LOGIC;
    S00_AXI_wready : OUT STD_LOGIC;
    M00_AXIS_aclk : IN STD_LOGIC;
    M00_AXIS_aresetn : IN STD_LOGIC;
    M00_AXIS_tready : IN STD_LOGIC;
    M00_AXIS_tstrb : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    M00_AXIS_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    M00_AXIS_tlast : OUT STD_LOGIC;
    M00_AXIS_tvalid : OUT STD_LOGIC;
    M00_AXIS_tuser : OUT STD_LOGIC
  );
END design_CLReceive_0_3;

ARCHITECTURE design_CLReceive_0_3_arch OF design_CLReceive_0_3 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_CLReceive_0_3_arch: ARCHITECTURE IS "yes";
  COMPONENT CLReceive IS
    GENERIC (
      C_S00_AXI_DATA_WIDTH : INTEGER;
      C_S00_AXI_ADDR_WIDTH : INTEGER;
      C_M00_AXIS_TDATA_WIDTH : INTEGER
    );
    PORT (
      CL_clk : IN STD_LOGIC;
      CL_rstn : IN STD_LOGIC;
      CL_CC_aresetn : IN STD_LOGIC;
      CL_data : IN STD_LOGIC_VECTOR(27 DOWNTO 0);
      CL_CC : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      Switches : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      Leds : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      S00_AXI_aclk : IN STD_LOGIC;
      S00_AXI_aresetn : IN STD_LOGIC;
      S00_AXI_arvalid : IN STD_LOGIC;
      S00_AXI_awvalid : IN STD_LOGIC;
      S00_AXI_bready : IN STD_LOGIC;
      S00_AXI_rready : IN STD_LOGIC;
      S00_AXI_wvalid : IN STD_LOGIC;
      S00_AXI_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S00_AXI_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      S00_AXI_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      S00_AXI_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      S00_AXI_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      S00_AXI_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      S00_AXI_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      S00_AXI_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      S00_AXI_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      S00_AXI_arready : OUT STD_LOGIC;
      S00_AXI_awready : OUT STD_LOGIC;
      S00_AXI_bvalid : OUT STD_LOGIC;
      S00_AXI_rvalid : OUT STD_LOGIC;
      S00_AXI_wready : OUT STD_LOGIC;
      M00_AXIS_aclk : IN STD_LOGIC;
      M00_AXIS_aresetn : IN STD_LOGIC;
      M00_AXIS_tready : IN STD_LOGIC;
      M00_AXIS_tstrb : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      M00_AXIS_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      M00_AXIS_tlast : OUT STD_LOGIC;
      M00_AXIS_tvalid : OUT STD_LOGIC;
      M00_AXIS_tuser : OUT STD_LOGIC
    );
  END COMPONENT CLReceive;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF design_CLReceive_0_3_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXIS_tuser: SIGNAL IS "xilinx.com:interface:axis:1.0 M00_AXIS TUSER";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXIS_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 M00_AXIS TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXIS_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 M00_AXIS TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXIS_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 M00_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXIS_tstrb: SIGNAL IS "xilinx.com:interface:axis:1.0 M00_AXIS TSTRB";
  ATTRIBUTE X_INTERFACE_PARAMETER OF M00_AXIS_tready: SIGNAL IS "XIL_INTERFACENAME M00_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 85000000, PHASE 0.000, CLK_DOMAIN design_CL_clk, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXIS_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 M00_AXIS TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF M00_AXIS_aresetn: SIGNAL IS "XIL_INTERFACENAME M00_AXIS_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXIS_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 M00_AXIS_aresetn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF M00_AXIS_aclk: SIGNAL IS "XIL_INTERFACENAME M00_AXIS_aclk, ASSOCIATED_BUSIF M00_AXIS, ASSOCIATED_RESET M00_AXIS_aresetn, FREQ_HZ 85000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_CL_clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF M00_AXIS_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 M00_AXIS_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF S00_AXI_arvalid: SIGNAL IS "XIL_INTERFACENAME S00_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 5, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS" & 
" 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF S00_AXI_aresetn: SIGNAL IS "XIL_INTERFACENAME S00_AXI_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 S00_AXI_aresetn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF S00_AXI_aclk: SIGNAL IS "XIL_INTERFACENAME S00_AXI_aclk, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET S00_AXI_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF S00_AXI_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 S00_AXI_aclk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF CL_CC_aresetn: SIGNAL IS "XIL_INTERFACENAME CL_CC_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF CL_CC_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 CL_CC_aresetn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF CL_rstn: SIGNAL IS "XIL_INTERFACENAME CL_rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF CL_rstn: SIGNAL IS "xilinx.com:signal:reset:1.0 CL_rstn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF CL_clk: SIGNAL IS "XIL_INTERFACENAME CL_clk, ASSOCIATED_RESET CL_CC_aresetn, FREQ_HZ 85000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_CL_clk, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF CL_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 CL_clk CLK";
BEGIN
  U0 : CLReceive
    GENERIC MAP (
      C_S00_AXI_DATA_WIDTH => 32,
      C_S00_AXI_ADDR_WIDTH => 5,
      C_M00_AXIS_TDATA_WIDTH => 16
    )
    PORT MAP (
      CL_clk => CL_clk,
      CL_rstn => CL_rstn,
      CL_CC_aresetn => CL_CC_aresetn,
      CL_data => CL_data,
      CL_CC => CL_CC,
      Switches => Switches,
      Leds => Leds,
      S00_AXI_aclk => S00_AXI_aclk,
      S00_AXI_aresetn => S00_AXI_aresetn,
      S00_AXI_arvalid => S00_AXI_arvalid,
      S00_AXI_awvalid => S00_AXI_awvalid,
      S00_AXI_bready => S00_AXI_bready,
      S00_AXI_rready => S00_AXI_rready,
      S00_AXI_wvalid => S00_AXI_wvalid,
      S00_AXI_arprot => S00_AXI_arprot,
      S00_AXI_awprot => S00_AXI_awprot,
      S00_AXI_wstrb => S00_AXI_wstrb,
      S00_AXI_araddr => S00_AXI_araddr,
      S00_AXI_awaddr => S00_AXI_awaddr,
      S00_AXI_wdata => S00_AXI_wdata,
      S00_AXI_bresp => S00_AXI_bresp,
      S00_AXI_rresp => S00_AXI_rresp,
      S00_AXI_rdata => S00_AXI_rdata,
      S00_AXI_arready => S00_AXI_arready,
      S00_AXI_awready => S00_AXI_awready,
      S00_AXI_bvalid => S00_AXI_bvalid,
      S00_AXI_rvalid => S00_AXI_rvalid,
      S00_AXI_wready => S00_AXI_wready,
      M00_AXIS_aclk => M00_AXIS_aclk,
      M00_AXIS_aresetn => M00_AXIS_aresetn,
      M00_AXIS_tready => M00_AXIS_tready,
      M00_AXIS_tstrb => M00_AXIS_tstrb,
      M00_AXIS_tdata => M00_AXIS_tdata,
      M00_AXIS_tlast => M00_AXIS_tlast,
      M00_AXIS_tvalid => M00_AXIS_tvalid,
      M00_AXIS_tuser => M00_AXIS_tuser
    );
END design_CLReceive_0_3_arch;
