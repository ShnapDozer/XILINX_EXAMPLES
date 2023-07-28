`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Xilinx
// Engineer:       bwiec
// Create Date:    Fri Feb 21 09:09:57 MST 2014
// Design Name:    vid_dbg_module
// Module Name:    error_checker
// Project Name:   Video Debug Tools
// Target Devices: All
// Tool Versions:  Vivado 2013.4
// Description:    Frame size error checker
// 
// Dependencies:
//   - None
// 
// Revision:
//   - Rev 0.30 - Added separate 'latch' and 'flag' signals where latch signals
//                trap errors forever (until reset) but flag signals only assert
//                during error condition
//              - Fixed bug in sof_early condition where 'if' was used instead of
//                'else if'
//              - Behavior verified in hardware testcase
//              - Behavior verified in behavioral simulation
//   - Rev 0.20 - Behavior verified in hardware testcase
//              - Removed clog2 function in favor of $clog2 system call
//   - Rev 0.10 - Behavior verified in behavioral simulation
//   - Rev 0.01 - File Created
//
// Known Issues:
//   - Rev 0.30 - None
//   - Rev 0.20 - None
//   - Rev 0.10 - None
//   - Rev 0.01 - None
//
// Additional Comments:
//
// To Do:
// 
//////////////////////////////////////////////////////////////////////////////////

module error_checker
#(
    parameter MAX_HSIZE = 1920,
    parameter MAX_VSIZE = 1080
)
(
    // Global signals
    input                       aclk,
    input                       resetn,
	
	// Input frame size
	input [$clog2(MAX_VSIZE):0] vsize,
	input [$clog2(MAX_HSIZE):0] hsize,
        
    // Input Video over AXI4S interface    
    input                       s_axis_tvalid,
    input                       s_axis_tready,
    input                       s_axis_tlast,
    input                       s_axis_tuser,
    
    // Input counters
    input [31:0]                frame_cnt,
    input [$clog2(MAX_VSIZE):0] line_cnt,
    input [$clog2(MAX_HSIZE):0] pixel_cnt,
    
    // Output errors
    output                      err_flag,
    output                      err_latch,
    output                      err_eol_early_flag,
    output                      err_eol_early_latch,
    output                      err_eol_late_flag,
    output                      err_eol_late_latch,
    output                      err_sof_early_flag,
    output                      err_sof_early_latch,
    output                      err_sof_late_flag,
    output                      err_sof_late_latch
);
    
    // Internal signals
    reg err_latch_i           = 0;
    reg err_eol_early_latch_i = 0;
    reg err_eol_late_latch_i  = 0;
    reg err_sof_early_latch_i = 0;
    reg err_sof_late_latch_i  = 0;
    
    // Output wire constant assignments
    assign err_latch           = err_latch_i;
    assign err_eol_early_latch = err_eol_early_latch_i;
    assign err_eol_late_latch  = err_eol_late_latch_i;
    assign err_sof_early_latch = err_sof_early_latch_i;
    assign err_sof_late_latch  = err_sof_late_latch_i;
    
    // Drive err (use flags instead of latches to reduce latency)
    assign err_flag = (err_eol_early_flag | err_eol_late_flag | err_sof_early_flag | err_sof_late_flag) & resetn;
    always @ (posedge aclk) begin
        if (~resetn)
            err_latch_i <= 1'b0;
        else
            if (err_flag)
                err_latch_i <= 1'b1;
    end
    
    // Drive err_eol_early
    assign err_eol_early_flag = ((s_axis_tlast & s_axis_tready & s_axis_tvalid) && (pixel_cnt < hsize-1)) & resetn;
    always @ (posedge aclk) begin
        if (~resetn)
            err_eol_early_latch_i <= 1'b0;
        else
            if (err_eol_early_flag)
                err_eol_early_latch_i <= 1'b1;
    end
    
    // Drive err_eol_late
    //assign err_eol_late_flag = ((s_axis_tlast & s_axis_tready & s_axis_tvalid) && (pixel_cnt > hsize-1)) & resetn;
    assign err_eol_late_flag = ((s_axis_tready & s_axis_tvalid) && (pixel_cnt > hsize-1)) & resetn;
    always @ (posedge aclk) begin
        if (~resetn)
            err_eol_late_latch_i <= 1'b0;
        else
            if (err_eol_late_flag)
                err_eol_late_latch_i <= 1'b1;
    end

    // Drive err_sof_early
    reg [$clog2(MAX_VSIZE):0] line_cnt_trapped = 0;
    always @ (posedge aclk) begin
        if (~resetn)
            line_cnt_trapped <= vsize-1; // Get around startup condition where line_cnt is zero
        else if (s_axis_tlast & s_axis_tready & s_axis_tvalid)
            line_cnt_trapped <= line_cnt;
    end
    
    assign err_sof_early_flag = ((s_axis_tuser & s_axis_tready & s_axis_tvalid) && (line_cnt_trapped < vsize-1)) & resetn; 
    always @ (posedge aclk) begin
        if (~resetn)
            err_sof_early_latch_i <= 1'b0;
        else
            if (err_sof_early_flag)
                err_sof_early_latch_i <= 1'b1;
    end
    
    // Drive err_sof_late
    assign err_sof_late_flag = ((s_axis_tready & s_axis_tvalid) && (line_cnt > vsize-1)) & resetn;
    always @ (posedge aclk) begin
        if (~resetn)
            err_sof_late_latch_i <= 1'b0;
        else
            if (err_sof_late_flag)
                err_sof_late_latch_i <= 1'b1;
    end
    
endmodule

