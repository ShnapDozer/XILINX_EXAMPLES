`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Xilinx
// Engineer:       bwiec
// Create Date:    Fri Feb 21 09:09:57 MST 2014
// Design Name:    vid_dbg_module
// Module Name:    rst_driver
// Project Name:   Video Debug Tools
// Target Devices: All
// Tool Versions:  Vivado 2013.4
// Description:    Ensure reset releases on frame boundary
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
// Additional Comments:
//
// To Do:
// 
//////////////////////////////////////////////////////////////////////////////////

module rst_driver
(
    // Global signals
    input aclk,
    input resetn,
        
    // Input Video over AXI4S interface
    input s_axis_tvalid,
    input s_axis_tready,
    input s_axis_tuser,
    
    // Output reset
    output resetn_internal
);
    
    // Internal signals
    reg resetn_internal_i = 0;
    reg resetn_detected   = 0; // Somewhat confusing, but active high
    
    // Output wire constant assignments
    assign resetn_internal = resetn_internal_i;
    
    // If a reset is detected, hold it until the next SOF
    always @ (posedge aclk) begin
        if (s_axis_tuser & s_axis_tvalid & s_axis_tready)
            resetn_detected <= 1'b0;
        else
            if (~resetn)
                resetn_detected <= 1'b1;
    end
    
    always @ * begin
        if (resetn_detected)
            resetn_internal_i <= s_axis_tuser;
        else
            resetn_internal_i <= 1'b1;
    end
            
endmodule

