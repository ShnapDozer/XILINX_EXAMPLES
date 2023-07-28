//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Thu Jun 29 15:14:42 2023
//Host        : DESKTOP-C24D4M0 running 64-bit major release  (build 9200)
//Command     : generate_target JamboEthernetDeign_wrapper.bd
//Design      : JamboEthernetDeign_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module JamboEthernetDeign_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    mdio_io_port_0_mdc,
    mdio_io_port_0_mdio_io,
    mdio_io_port_3_mdc,
    mdio_io_port_3_mdio_io,
    reset_port_0,
    reset_port_3,
    rgmii_port_0_rd,
    rgmii_port_0_rx_ctl,
    rgmii_port_0_rxc,
    rgmii_port_0_td,
    rgmii_port_0_tx_ctl,
    rgmii_port_0_txc,
    rgmii_port_3_rd,
    rgmii_port_3_rx_ctl,
    rgmii_port_3_rxc,
    rgmii_port_3_td,
    rgmii_port_3_tx_ctl,
    rgmii_port_3_txc);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output mdio_io_port_0_mdc;
  inout mdio_io_port_0_mdio_io;
  output mdio_io_port_3_mdc;
  inout mdio_io_port_3_mdio_io;
  output [0:0]reset_port_0;
  output reset_port_3;
  input [3:0]rgmii_port_0_rd;
  input rgmii_port_0_rx_ctl;
  input rgmii_port_0_rxc;
  output [3:0]rgmii_port_0_td;
  output rgmii_port_0_tx_ctl;
  output rgmii_port_0_txc;
  input [3:0]rgmii_port_3_rd;
  input rgmii_port_3_rx_ctl;
  input rgmii_port_3_rxc;
  output [3:0]rgmii_port_3_td;
  output rgmii_port_3_tx_ctl;
  output rgmii_port_3_txc;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire mdio_io_port_0_mdc;
  wire mdio_io_port_0_mdio_i;
  wire mdio_io_port_0_mdio_io;
  wire mdio_io_port_0_mdio_o;
  wire mdio_io_port_0_mdio_t;
  wire mdio_io_port_3_mdc;
  wire mdio_io_port_3_mdio_i;
  wire mdio_io_port_3_mdio_io;
  wire mdio_io_port_3_mdio_o;
  wire mdio_io_port_3_mdio_t;
  wire [0:0]reset_port_0;
  wire reset_port_3;
  wire [3:0]rgmii_port_0_rd;
  wire rgmii_port_0_rx_ctl;
  wire rgmii_port_0_rxc;
  wire [3:0]rgmii_port_0_td;
  wire rgmii_port_0_tx_ctl;
  wire rgmii_port_0_txc;
  wire [3:0]rgmii_port_3_rd;
  wire rgmii_port_3_rx_ctl;
  wire rgmii_port_3_rxc;
  wire [3:0]rgmii_port_3_td;
  wire rgmii_port_3_tx_ctl;
  wire rgmii_port_3_txc;

  JamboEthernetDeign JamboEthernetDeign_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .mdio_io_port_0_mdc(mdio_io_port_0_mdc),
        .mdio_io_port_0_mdio_i(mdio_io_port_0_mdio_i),
        .mdio_io_port_0_mdio_o(mdio_io_port_0_mdio_o),
        .mdio_io_port_0_mdio_t(mdio_io_port_0_mdio_t),
        .mdio_io_port_3_mdc(mdio_io_port_3_mdc),
        .mdio_io_port_3_mdio_i(mdio_io_port_3_mdio_i),
        .mdio_io_port_3_mdio_o(mdio_io_port_3_mdio_o),
        .mdio_io_port_3_mdio_t(mdio_io_port_3_mdio_t),
        .reset_port_0(reset_port_0),
        .reset_port_3(reset_port_3),
        .rgmii_port_0_rd(rgmii_port_0_rd),
        .rgmii_port_0_rx_ctl(rgmii_port_0_rx_ctl),
        .rgmii_port_0_rxc(rgmii_port_0_rxc),
        .rgmii_port_0_td(rgmii_port_0_td),
        .rgmii_port_0_tx_ctl(rgmii_port_0_tx_ctl),
        .rgmii_port_0_txc(rgmii_port_0_txc),
        .rgmii_port_3_rd(rgmii_port_3_rd),
        .rgmii_port_3_rx_ctl(rgmii_port_3_rx_ctl),
        .rgmii_port_3_rxc(rgmii_port_3_rxc),
        .rgmii_port_3_td(rgmii_port_3_td),
        .rgmii_port_3_tx_ctl(rgmii_port_3_tx_ctl),
        .rgmii_port_3_txc(rgmii_port_3_txc));
  IOBUF mdio_io_port_0_mdio_iobuf
       (.I(mdio_io_port_0_mdio_o),
        .IO(mdio_io_port_0_mdio_io),
        .O(mdio_io_port_0_mdio_i),
        .T(mdio_io_port_0_mdio_t));
  IOBUF mdio_io_port_3_mdio_iobuf
       (.I(mdio_io_port_3_mdio_o),
        .IO(mdio_io_port_3_mdio_io),
        .O(mdio_io_port_3_mdio_i),
        .T(mdio_io_port_3_mdio_t));
endmodule
