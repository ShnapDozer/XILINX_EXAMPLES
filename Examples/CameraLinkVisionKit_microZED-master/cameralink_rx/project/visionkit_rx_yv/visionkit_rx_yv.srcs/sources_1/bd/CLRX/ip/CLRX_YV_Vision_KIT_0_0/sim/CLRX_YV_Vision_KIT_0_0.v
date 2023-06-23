// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: YANTRAVISION:YV_CL:YV_Vision_KIT:1.0
// IP Revision: 2

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "IPI" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module CLRX_YV_Vision_KIT_0_0 (
  Ax_0,
  Bx_0,
  Cx_0,
  DATA_OUT0,
  DATA_OUT1_0,
  DATA_OUT2_0,
  Dy_0,
  EOL_dual_y,
  EOL_x,
  Ey_0,
  Fy_0,
  Gz_0,
  Hz_0,
  Iz_0,
  LFDSx_0,
  LFDSy_0,
  LFDSz_0,
  LOCKED_x,
  LOCKED_y,
  LOCKED_z,
  SOF_dual_y,
  SOF_x,
  S_AXI_GPIO_araddr,
  S_AXI_GPIO_arready,
  S_AXI_GPIO_arvalid,
  S_AXI_GPIO_awaddr,
  S_AXI_GPIO_awready,
  S_AXI_GPIO_awvalid,
  S_AXI_GPIO_bready,
  S_AXI_GPIO_bresp,
  S_AXI_GPIO_bvalid,
  S_AXI_GPIO_rdata,
  S_AXI_GPIO_rready,
  S_AXI_GPIO_rresp,
  S_AXI_GPIO_rvalid,
  S_AXI_GPIO_wdata,
  S_AXI_GPIO_wready,
  S_AXI_GPIO_wstrb,
  S_AXI_GPIO_wvalid,
  clk_idelay_ref,
  clk_x_n,
  clk_x_p,
  clk_y_n,
  clk_y_p,
  clk_z_n,
  clk_z_p,
  data_validx,
  data_validy_0,
  div2_clk_x,
  div2_clk_y,
  div2_clk_z,
  div8_clk_x,
  div8_clk_y,
  div8_clk_z,
  dna_high_0,
  dna_low_0,
  en_soc_0,
  ext_reset_n,
  fifo_rst_0,
  px_clk_x,
  px_clk_y,
  px_clk_z,
  serial_x_n,
  serial_x_p,
  serial_y_n,
  serial_y_p,
  serial_z_n,
  serial_z_p,
  singel_end_clk_x,
  singel_end_clk_y,
  singel_end_clk_z,
  strb_ABC_val_x,
  strb_DEF_val_y,
  strb_GHI_val_z,
  sys_clk,
  x_lcnt_0,
  x_pcnt_0,
  y_lcnt_0,
  y_pcnt_0
);

output wire [7 : 0] Ax_0;
output wire [7 : 0] Bx_0;
output wire [7 : 0] Cx_0;
output wire [27 : 0] DATA_OUT0;
output wire [27 : 0] DATA_OUT1_0;
output wire [27 : 0] DATA_OUT2_0;
output wire [7 : 0] Dy_0;
output wire EOL_dual_y;
output wire EOL_x;
output wire [7 : 0] Ey_0;
output wire [7 : 0] Fy_0;
output wire [7 : 0] Gz_0;
output wire [7 : 0] Hz_0;
output wire [7 : 0] Iz_0;
output wire [3 : 0] LFDSx_0;
output wire [3 : 0] LFDSy_0;
output wire [3 : 0] LFDSz_0;
input wire LOCKED_x;
input wire LOCKED_y;
input wire LOCKED_z;
output wire SOF_dual_y;
output wire SOF_x;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO ARADDR" *)
input wire [8 : 0] S_AXI_GPIO_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO ARREADY" *)
output wire S_AXI_GPIO_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO ARVALID" *)
input wire S_AXI_GPIO_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO AWADDR" *)
input wire [8 : 0] S_AXI_GPIO_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO AWREADY" *)
output wire S_AXI_GPIO_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO AWVALID" *)
input wire S_AXI_GPIO_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO BREADY" *)
input wire S_AXI_GPIO_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO BRESP" *)
output wire [1 : 0] S_AXI_GPIO_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO BVALID" *)
output wire S_AXI_GPIO_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO RDATA" *)
output wire [31 : 0] S_AXI_GPIO_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO RREADY" *)
input wire S_AXI_GPIO_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO RRESP" *)
output wire [1 : 0] S_AXI_GPIO_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO RVALID" *)
output wire S_AXI_GPIO_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO WDATA" *)
input wire [31 : 0] S_AXI_GPIO_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO WREADY" *)
output wire S_AXI_GPIO_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO WSTRB" *)
input wire [3 : 0] S_AXI_GPIO_wstrb;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_GPIO, DATA_WIDTH 32, PROTOCOL AXI4LITE, ID_WIDTH 0, ADDR_WIDTH 12, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, FREQ_HZ 1\
00000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_GPIO WVALID" *)
input wire S_AXI_GPIO_wvalid;
input wire clk_idelay_ref;
input wire clk_x_n;
input wire clk_x_p;
input wire clk_y_n;
input wire clk_y_p;
input wire clk_z_n;
input wire clk_z_p;
output wire data_validx;
output wire data_validy_0;
input wire div2_clk_x;
input wire div2_clk_y;
input wire div2_clk_z;
input wire div8_clk_x;
input wire div8_clk_y;
input wire div8_clk_z;
output wire [31 : 0] dna_high_0;
output wire [31 : 0] dna_low_0;
output wire en_soc_0;
input wire ext_reset_n;
output wire [31 : 0] fifo_rst_0;
input wire px_clk_x;
input wire px_clk_y;
input wire px_clk_z;
input wire [3 : 0] serial_x_n;
input wire [3 : 0] serial_x_p;
input wire [3 : 0] serial_y_n;
input wire [3 : 0] serial_y_p;
input wire [3 : 0] serial_z_n;
input wire [3 : 0] serial_z_p;
output wire singel_end_clk_x;
output wire singel_end_clk_y;
output wire singel_end_clk_z;
output wire strb_ABC_val_x;
output wire strb_DEF_val_y;
output wire strb_GHI_val_z;
input wire sys_clk;
output wire [15 : 0] x_lcnt_0;
output wire [15 : 0] x_pcnt_0;
output wire [15 : 0] y_lcnt_0;
output wire [15 : 0] y_pcnt_0;

  YV_Vision_KIT inst (
    .Ax_0(Ax_0),
    .Bx_0(Bx_0),
    .Cx_0(Cx_0),
    .DATA_OUT0(DATA_OUT0),
    .DATA_OUT1_0(DATA_OUT1_0),
    .DATA_OUT2_0(DATA_OUT2_0),
    .Dy_0(Dy_0),
    .EOL_dual_y(EOL_dual_y),
    .EOL_x(EOL_x),
    .Ey_0(Ey_0),
    .Fy_0(Fy_0),
    .Gz_0(Gz_0),
    .Hz_0(Hz_0),
    .Iz_0(Iz_0),
    .LFDSx_0(LFDSx_0),
    .LFDSy_0(LFDSy_0),
    .LFDSz_0(LFDSz_0),
    .LOCKED_x(LOCKED_x),
    .LOCKED_y(LOCKED_y),
    .LOCKED_z(LOCKED_z),
    .SOF_dual_y(SOF_dual_y),
    .SOF_x(SOF_x),
    .S_AXI_GPIO_araddr(S_AXI_GPIO_araddr),
    .S_AXI_GPIO_arready(S_AXI_GPIO_arready),
    .S_AXI_GPIO_arvalid(S_AXI_GPIO_arvalid),
    .S_AXI_GPIO_awaddr(S_AXI_GPIO_awaddr),
    .S_AXI_GPIO_awready(S_AXI_GPIO_awready),
    .S_AXI_GPIO_awvalid(S_AXI_GPIO_awvalid),
    .S_AXI_GPIO_bready(S_AXI_GPIO_bready),
    .S_AXI_GPIO_bresp(S_AXI_GPIO_bresp),
    .S_AXI_GPIO_bvalid(S_AXI_GPIO_bvalid),
    .S_AXI_GPIO_rdata(S_AXI_GPIO_rdata),
    .S_AXI_GPIO_rready(S_AXI_GPIO_rready),
    .S_AXI_GPIO_rresp(S_AXI_GPIO_rresp),
    .S_AXI_GPIO_rvalid(S_AXI_GPIO_rvalid),
    .S_AXI_GPIO_wdata(S_AXI_GPIO_wdata),
    .S_AXI_GPIO_wready(S_AXI_GPIO_wready),
    .S_AXI_GPIO_wstrb(S_AXI_GPIO_wstrb),
    .S_AXI_GPIO_wvalid(S_AXI_GPIO_wvalid),
    .clk_idelay_ref(clk_idelay_ref),
    .clk_x_n(clk_x_n),
    .clk_x_p(clk_x_p),
    .clk_y_n(clk_y_n),
    .clk_y_p(clk_y_p),
    .clk_z_n(clk_z_n),
    .clk_z_p(clk_z_p),
    .data_validx(data_validx),
    .data_validy_0(data_validy_0),
    .div2_clk_x(div2_clk_x),
    .div2_clk_y(div2_clk_y),
    .div2_clk_z(div2_clk_z),
    .div8_clk_x(div8_clk_x),
    .div8_clk_y(div8_clk_y),
    .div8_clk_z(div8_clk_z),
    .dna_high_0(dna_high_0),
    .dna_low_0(dna_low_0),
    .en_soc_0(en_soc_0),
    .ext_reset_n(ext_reset_n),
    .fifo_rst_0(fifo_rst_0),
    .px_clk_x(px_clk_x),
    .px_clk_y(px_clk_y),
    .px_clk_z(px_clk_z),
    .serial_x_n(serial_x_n),
    .serial_x_p(serial_x_p),
    .serial_y_n(serial_y_n),
    .serial_y_p(serial_y_p),
    .serial_z_n(serial_z_n),
    .serial_z_p(serial_z_p),
    .singel_end_clk_x(singel_end_clk_x),
    .singel_end_clk_y(singel_end_clk_y),
    .singel_end_clk_z(singel_end_clk_z),
    .strb_ABC_val_x(strb_ABC_val_x),
    .strb_DEF_val_y(strb_DEF_val_y),
    .strb_GHI_val_z(strb_GHI_val_z),
    .sys_clk(sys_clk),
    .x_lcnt_0(x_lcnt_0),
    .x_pcnt_0(x_pcnt_0),
    .y_lcnt_0(y_lcnt_0),
    .y_pcnt_0(y_pcnt_0)
  );
endmodule
