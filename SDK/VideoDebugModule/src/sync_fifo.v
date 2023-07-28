`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Xilinx
// Engineer:       bwiec
// Create Date:    Fri Feb 21 09:09:57 MST 2014
// Design Name:    vid_dbg_module
// Module Name:    sync_fifo
// Project Name:   Video Debug Tools
// Target Devices: All
// Tool Versions:  Vivado 2013.4
// Description:    Synchronous FIFO
// 
// Dependencies:
//   - sync_fifo.v
//     |
//     |
//     +- ram.v
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

module sync_fifo
#(
    parameter FIFO_DEPTH = 1024
)
(
    // Global signals
    input         clk,
    input         rst,
        
    // Input interface
    input  [31:0] din,
    input         we,
    
    // Output interface
    output [31:0] dout,
    input         oe,
    
    // Flags
    output        full,
    output        empty
);
    
    // Internal signals
    reg [$clog2(FIFO_DEPTH)-1:0] wr_ptr = 0;
    reg [$clog2(FIFO_DEPTH)-1:0] rd_ptr = 0;
    
    // Instantiate RAM
    ram
    #(
        .DATA_WIDTH(32),
        .RAM_DEPTH(FIFO_DEPTH)
    )
    ram_inst
    (
        .clk(clk),
        .din(din),
        .waddr(wr_ptr),
        .we(we),
        .dout(dout),
        .raddr(rd_ptr),
        .oe(oe)
    );
    
    // Drive flags
    assign full  = (wr_ptr == rd_ptr-1'b1) ? 1'b1 : 1'b0;
    assign empty = (wr_ptr == rd_ptr)      ? 1'b1 : 1'b0;
    
    // Manage write pointer
    always @ (posedge clk) begin
        if (rst)
            wr_ptr <= 0;
        else if (we)
            if (!full)
                wr_ptr <= wr_ptr + 1'b1;
    end
    
    // Manage read pointer
    always @ (posedge clk) begin
        if (rst)
            rd_ptr <= 0;
        else if (oe)
            if (!empty)
                rd_ptr <= rd_ptr + 1'b1;
    end
                
            
endmodule

