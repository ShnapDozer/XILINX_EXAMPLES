`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Xilinx
// Engineer:       bwiec
// Create Date:    Fri Feb 21 09:09:57 MST 2014
// Design Name:    vid_dbg_module
// Module Name:    axi_reg_defines
// Project Name:   Video Debug Tools
// Target Devices: All
// Tool Versions:  Vivado 2013.4
// Description:    Define address offsets and data masks for registers
// 
// Dependencies:
//   - None
// 
// Revision:
//   - Rev 0.10 - Behavior verified in hardware testcase
//              - Behavior verified in behavioral simulation
//   - Rev 0.01 - File Created
//
// Known Issues:
//   - Rev 0.10 - None
//   - Rev 0.01 - None
// 
//////////////////////////////////////////////////////////////////////////////////

// Control register 
`define CR_ADDR_OFFSET         8'h00
`define SW_RST_MASK            32'h0000_0001 // Clears flags and resets HSIZE and VSIZE to initial values
`define CLR_FLAGS_MASK         32'h0000_0002 // Clears flags, but HSIZE and VSIZE remain

// Status register
`define SR_ADDR_OFFSET         8'h04         // Read-only
`define FSIZE_HIST_EMPTY_MASK  32'h0000_0001
`define FSIZE_HIST_FULL_MASK   32'h0000_0002

// Error register
`define ERR_ADDR_OFFSET        8'h08         // Read-only
`define ERR_MASK               32'h0000_0001
`define ERR_EOL_EARLY_MASK     32'h0000_0002
`define ERR_EOL_LATE_MASK      32'h0000_0004
`define ERR_SOF_EARLY_MASK     32'h0000_0008
`define ERR_SOF_LATE_MASK      32'h0000_0010

// Horizontal Size register
`define HSIZE_ADDR_OFFSET      8'h0C
`define HSIZE_MASK             32'hFFFF_FFFF // Undefined results occur if HSIZE reg value exceeds MAX_HSZIE

// Vertical Size register
`define VSIZE_ADDR_OFFSET      8'h10
`define VSIZE_MASK             32'hFFFF_FFFF // Undefined results occur if VSIZE reg value exceeds MAX_VSZIE

// Frame Size History register
`define FSIZE_HIST_ADDR_OFFSET 8'h14
`define FSIZE_HIST_MASK        32'hFFFF_FFFF

