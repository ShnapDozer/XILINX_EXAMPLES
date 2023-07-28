`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Xilinx
// Engineer:       bwiec
// Create Date:    Fri Feb 21 09:09:57 MST 2014
// Design Name:    vid_dbg_module
// Module Name:    ram
// Project Name:   Video Debug Tools
// Target Devices: All
// Tool Versions:  Vivado 2013.4
// Description:    Random Access Memory
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
//   - 7 Series block ram supports 1kx36-bit so only uses 1 block ram
//
// To Do:
// 
//////////////////////////////////////////////////////////////////////////////////

module ram
#(
    parameter DATA_WIDTH = 36,
    parameter RAM_DEPTH  = 1024
)
(
    // Global signals
    input                          clk,
        
    // Input interface
    input  [DATA_WIDTH-1:0]        din,
    input  [$clog2(RAM_DEPTH)-1:0] waddr,
    input                          we,
    
    // Output interface
    output [DATA_WIDTH-1:0]        dout,
    input  [$clog2(RAM_DEPTH)-1:0] raddr,
    input                          oe
);
    
    // Internal signals
    reg [DATA_WIDTH-1:0] dout_i = 0;
    reg [DATA_WIDTH-1:0] ram [0:RAM_DEPTH-1];
    
    // Output wire constant assignments
    assign dout = dout_i;
    
    // RAM write-side
    always @ (posedge clk) begin
        if (we)
            ram[waddr] <= din;
    end
    
    // RAM read-side
    always @ (posedge clk) begin
        if (oe)
            dout_i <= ram[raddr];
    end
            
endmodule

