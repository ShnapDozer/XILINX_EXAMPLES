`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Xilinx
// Engineer:       bwiec
// Create Date:    Fri Feb 21 09:09:57 MST 2014
// Design Name:    vid_dbg_module
// Module Name:    ctrs
// Project Name:   Video Debug Tools
// Target Devices: All
// Tool Versions:  Vivado 2013.4
// Description:    These are the main frame, line, and pixel counters
// 
// Dependencies:
//   - None 
// 
// Revision:
//   - Rev 0.20 - Behavior verified in hardware testcase
//              - Removed clog2 function in favor of $clog2 system call
//   - Rev 0.10 - Behavior verified in behavioral simulation
//   - Rev 0.01 - File Created
//
// Known Issues:
//   - Rev 0.20 - None
//   - Rev 0.10 - None
//   - Rev 0.01 - None
//
// Additional Comments:
//
// To Do:
// 
//////////////////////////////////////////////////////////////////////////////////

module ctrs
#(
    parameter MAX_HSIZE = 1920,
    parameter MAX_VSIZE = 1080
)
(
    // Global signals
    input                        aclk,
    input                        resetn,    
    
    // Input Video over AXI4S interface
    input                        s_axis_tvalid,
    input                        s_axis_tready,
    input                        s_axis_tlast,
    input                        s_axis_tuser,
    
    // Output counters
    output [31:0]                frame_cnt,
    output [$clog2(MAX_VSIZE):0] line_cnt,
    output [$clog2(MAX_HSIZE):0] pixel_cnt
);
    
    // Internal signals
    reg [31:0]                frame_cnt_i   = 0;
    reg [$clog2(MAX_VSIZE):0] line_cnt_i    = 0;
    reg [$clog2(MAX_HSIZE):0] pixel_cnt_i   = 0;
    
    // Output wire constant assignments
    assign frame_cnt = (s_axis_tvalid & s_axis_tready & s_axis_tuser) ? frame_cnt_i : frame_cnt_i-1'b1;
    assign line_cnt  = (s_axis_tvalid & s_axis_tready & s_axis_tuser) ? 0           : line_cnt_i;
    assign pixel_cnt = pixel_cnt_i;
    
    // Frame counter
    always @ (posedge aclk) begin
        if (~resetn)
            frame_cnt_i <= 0;
        else
            if (s_axis_tuser & s_axis_tvalid & s_axis_tready)
                frame_cnt_i <= frame_cnt_i + 1'b1;
    end
    
    // Line counter
    always @ (posedge aclk) begin
        if ((~resetn) | (s_axis_tuser & s_axis_tvalid & s_axis_tready))
            line_cnt_i <= 0;
        else
            if (s_axis_tlast & s_axis_tvalid & s_axis_tready)
                line_cnt_i <= line_cnt_i + 1'b1;
    end
    
    // Pixel counter
    always @ (posedge aclk) begin
        if ((~resetn) | (s_axis_tlast & s_axis_tvalid & s_axis_tready))
            pixel_cnt_i <= 0;
        else
            if (s_axis_tvalid & s_axis_tready)
                pixel_cnt_i <= pixel_cnt_i + 1'b1;
    end

endmodule

