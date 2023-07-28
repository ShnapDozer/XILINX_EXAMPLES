`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Xilinx
// Engineer:       bwiec
// Create Date:    Fri Feb 21 09:09:57 MST 2014
// Design Name:    vid_dbg_module
// Module Name:    frame_size_logger
// Project Name:   Video Debug Tools
// Target Devices: All
// Tool Versions:  Vivado 2013.4
// Description:    Logs 1K previous frame sizes along with associated errors
// 
// Dependencies:
//   - frame_size_logger.v
//     |
//     |
//     +- axi_sync_fifo.v
//     |  |
//     |  |
//     |  +- sync_fifo.v
//     |     |
//     |     |
//     |     +- ram.v
//     |
//     |
//     +- cdn_axi_bfm_0.xci
//     |
//     |
//     +- jtag_axi_0.xci
// 
// Revision:
//   - Rev 2.00 - Complete re-vamp to support new architecture where AXI interface
//                and JTAG-to-AXI interface are handled external to this module.
//   - Rev 1.00 - Added the ability to do a full hardware reset from tcl so that
//                the flags can be cleared at run-time with a jtag-to-axi write
//                of any value to any address
//   - Rev 0.10 - Behavior verified in hardware testcase
//              - Behavior verified in behavioral simulation
//   - Rev 0.01 - File Created
//
// Known Issues:
//   - Rev 2.00 - None
//   - Rev 1.00 - None
//   - Rev 0.10 - None
//   - Rev 0.01 - None
//
// Additional Comments:
//   - Pushes last pixel count of the frame, so if there is an error indicated,
//     then pixel count should be taken with a grain of salt
//   - Since you need 1k images before you can read the fifo, you need to simulate
//     with very small frame sizes
//
// To Do:
//   - Should I trap the pixel count when a mid-frame line size error occurs?
//   - Add the option to save 32 frames instead of 1K
//   - Make payload 64-bits wide and add frame counter
// 
//////////////////////////////////////////////////////////////////////////////////

module frame_size_logger
#(
    parameter MAX_HSIZE = 1920,
    parameter MAX_VSIZE = 1080
)
(
    // Global signals
    input                          aclk,
    input                          resetn,
    
    // AXI4 Stream signals
    input                          s_axis_tvalid,
    input                          s_axis_tready,
    input                          s_axis_tlast,
    input                          s_axis_tuser,
    
    // Counters
    input  [31:0]                  frame_cnt,
    input  [$clog2(MAX_VSIZE)-1:0] line_cnt,
    input  [$clog2(MAX_HSIZE)-1:0] pixel_cnt,
    
    // Debug flags
    input                          err_eol_early_flag,
    input                          err_eol_late_flag,
    input                          err_sof_early_flag,
    input                          err_sof_late_flag,
	
	// FIFO read-side signals
	output [31:0]                  fsize_hist,
	input                          fsize_hist_rd_en,
	output                         fsize_hist_full,
	output                         fsize_hist_empty
);
    
    // Internal signals
    wire [31:0]               fifo_din;
    reg [$clog2(MAX_VSIZE):0] line_cnt_trapped           = 0;
    reg [$clog2(MAX_VSIZE):0] pixel_cnt_trapped          = 0;
    reg                       err_eol_early_flag_trapped = 0;
    reg                       err_eol_late_flag_trapped  = 0;
    
    // Assemble FIFO data
    assign fifo_din = 2'b00                              | // Extra
                      (err_eol_early_flag_trapped << 29) | // What if I am asserted in the middle of the frame?
                      (err_eol_late_flag_trapped  << 28) |
                      (err_sof_early_flag         << 27) |
                      (err_sof_late_flag          << 26) |
                      //(frame_cnt                << xx) | // If I am here, I need 64-bit data width
                      (line_cnt_trapped           << 13) |
                      (pixel_cnt_trapped          << 0); 
    
    // Instantiate synchronous FIFO
    sync_fifo
    #(
        .FIFO_DEPTH(1024)
    )
    sync_fifo_inst
    (
        .clk(aclk),
        .rst(~resetn),
        .din(fifo_din),
        .we(s_axis_tvalid & s_axis_tready & s_axis_tuser),
		.dout(fsize_hist),
        .oe(fsize_hist_rd_en),
        .full(fsize_hist_full),
        .empty(fsize_hist_empty)
    );
    
    // Trap counter values
    always @ (posedge aclk) begin
        if (~resetn)
            line_cnt_trapped <= MAX_VSIZE-1; // Get around startup condition where line_cnt is zero
        else if (s_axis_tlast & s_axis_tready & s_axis_tvalid)
            line_cnt_trapped <= line_cnt;
    end
    
    always @ (posedge aclk) begin
        if (~resetn)
            pixel_cnt_trapped <= MAX_HSIZE-1; // Get around startup condition where line_cnt is zero
        else if (s_axis_tlast & s_axis_tready & s_axis_tvalid)
            pixel_cnt_trapped <= pixel_cnt;
    end
    
    // Trap mid-frame line-size errors
    always @ (posedge aclk) begin
        if ((~resetn) || (s_axis_tuser & s_axis_tready & s_axis_tvalid)) begin
            err_eol_early_flag_trapped <= 0;
            err_eol_late_flag_trapped  <= 0;
        end
        else begin
            if (err_eol_early_flag)
                err_eol_early_flag_trapped <= 1'b1;
            if (err_eol_late_flag)
                err_eol_late_flag_trapped <= 1'b1;
        end
    end
            
endmodule

