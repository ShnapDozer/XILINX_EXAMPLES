`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Xilinx
// Engineer:       bwiec
// Create Date:    Fri Feb 21 09:09:57 MST 2014
// Design Name:    vid_dbg_module
// Module Name:    axi_regs
// Project Name:   Video Debug Tools
// Target Devices: All
// Tool Versions:  Vivado 2013.4
// Description:    AXI Lite register interface for control of the video debug
//                 module and reading back the frame size logger data
// 
// Dependencies:
//   - axi_regs.v
//     |
//     |
//     +- axi_reg_defines.v
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

// Includes
`include "axi_reg_defines.v"

module axi_regs
#(
    parameter MAX_HSIZE  = 1920,
    parameter MAX_VSIZE  = 1080,
	parameter INIT_HSIZE = 1920,
    parameter INIT_VSIZE = 1080
)
(
    // Global signals
    input                        aclk,
    input                        resetn,	
	input                        resetn_fsync,       // Reset synchronized to the frame. Necessary for SW reset to come out of reset
	
    // AXI4-Lite interface
    input                        s_axi_lite_awvalid,
	output                       s_axi_lite_awready,
	input  [31:0]                s_axi_lite_awaddr,
	input                        s_axi_lite_wvalid,
	output                       s_axi_lite_wready,
	input  [31:0]                s_axi_lite_wdata,
	output                       s_axi_lite_bvalid,
	input                        s_axi_lite_bready,
	output [1:0]                 s_axi_lite_bresp,
	input                        s_axi_lite_arvalid,
    output                       s_axi_lite_arready,
    input  [31:0]                s_axi_lite_araddr,
    output                       s_axi_lite_rvalid,
    input                        s_axi_lite_rready,
    output [31:0]                s_axi_lite_rdata,
    output [1:0]                 s_axi_lite_rresp,
	
	// Errors
	input                        err_latch,           // Any frame-size error occurred (logical 'or' of all other flags)
    input                        err_eol_early_latch, // End of Line Early error occurred
    input                        err_eol_late_latch,  // End of Line Late error occurred
    input                        err_sof_early_latch, // Start of Frame Early error occurred
    input                        err_sof_late_latch,  // Start of Frame Late error occurred
	
	// Control
	output                       sw_resetn,
	output                       clr_flags,           // Clears flags and FIFO
	output [$clog2(MAX_HSIZE):0] hsize,
	output [$clog2(MAX_VSIZE):0] vsize,
	input  [31:0]                fsize_hist,
	output                       fsize_hist_rd_en,
	input                        fsize_hist_full,
	input                        fsize_hist_empty
);
	
    // Internal signals
	reg                       s_axi_lite_awready_i = 0;
	reg [31:0]                awaddr_i             = 0;
	reg                       s_axi_lite_bvalid_i  = 0;
	reg                       s_axi_lite_wready_i  = 0;
    reg                       sw_resetn_i          = 1'b1;
	reg                       clr_flags_i          = 0;
	reg [$clog2(MAX_HSIZE):0] hsize_i              = INIT_HSIZE;
	reg [$clog2(MAX_VSIZE):0] vsize_i              = INIT_VSIZE;
	reg                       s_axi_lite_arready_i = 0;
	reg [31:0]                araddr_i             = 0;
	reg                       s_axi_lite_rvalid_i  = 0;
	reg [31:0]                s_axi_lite_rdata_i   = 0;
	
	// Output wire constant assignments
	assign s_axi_lite_awready = s_axi_lite_awready_i;
	assign s_axi_lite_bvalid  = s_axi_lite_bvalid_i;
	assign s_axi_lite_wready  = s_axi_lite_wready_i;
	assign s_axi_lite_bresp   = 0;
	assign sw_resetn          = sw_resetn_i;
	assign clr_flags          = clr_flags_i;
	assign hsize              = hsize_i;
	assign vsize              = vsize_i;
	assign s_axi_lite_arready = s_axi_lite_arready_i;
	assign s_axi_lite_rvalid  = s_axi_lite_rvalid_i;
	assign s_axi_lite_rdata   = s_axi_lite_rdata_i;
	assign s_axi_lite_rresp   = 0;
	
	// Write FSM
	reg [1:0] state_wr         = 0;
	reg [1:0] next_state_wr    = 0;
	localparam [1:0] IDLE_WR   = 2'b00,
	                 ACCEPT_WR = 2'b01,
					 WAIT_WR   = 2'b10,
					 RESP_WR   = 2'b11;
	                 
	always @ * begin
		
		// Default assignments
		s_axi_lite_awready_i = 0;
		s_axi_lite_bvalid_i  = 0;
		s_axi_lite_wready_i  = 0;
		
		case (state_wr)
			
			IDLE_WR: begin
				if (s_axi_lite_awvalid)
					next_state_wr = ACCEPT_WR;
				else
					next_state_wr = IDLE_WR;
					
			end ACCEPT_WR: begin
				s_axi_lite_awready_i = 1'b1;
				next_state_wr        = WAIT_WR;
				
			end WAIT_WR: begin
				s_axi_lite_wready_i = 1'b1;
				if (s_axi_lite_wvalid)
					next_state_wr = RESP_WR;
				else
					next_state_wr = WAIT_WR;
					
			end RESP_WR: begin
				s_axi_lite_bvalid_i = 1'b1;
				if (s_axi_lite_bready)
					next_state_wr = IDLE_WR;
				else
					next_state_wr = RESP_WR;
					
			end default: begin
				next_state_wr = IDLE_WR;
			end
			
		endcase
	end
	
	always @ (posedge aclk)
		if (~resetn)
			state_wr <= IDLE_WR;
		else
			state_wr <= next_state_wr;
			
	// Latch write address
	always @ (posedge aclk) begin
		if (~resetn)
			awaddr_i <= 0;
		else
			if (s_axi_lite_awvalid & s_axi_lite_awready)
				awaddr_i <= s_axi_lite_awaddr;
	end	
	
	always @ (posedge aclk) begin
		if (~resetn_fsync) begin // SW reset causes this event to happen along with any external reset
			sw_resetn_i  <= 1'b1;
			clr_flags_i  <= 1'b0;
			hsize_i      <= INIT_HSIZE;
			vsize_i      <= INIT_VSIZE;
		end else begin
			if (s_axi_lite_wvalid & s_axi_lite_wready)
				case (awaddr_i[7:0])
					`CR_ADDR_OFFSET: begin
						sw_resetn_i  <= ~(s_axi_lite_wdata & `SW_RST_MASK); // Active low
						clr_flags_i  <= (s_axi_lite_wdata & `CLR_FLAGS_MASK) >> 1; // Needs to be explicitly de-asserted by software to release the rest from reset
					end `HSIZE_ADDR_OFFSET:
						hsize_i      <= s_axi_lite_wdata & `HSIZE_MASK;
					`VSIZE_ADDR_OFFSET:
						vsize_i      <= s_axi_lite_wdata & `VSIZE_MASK;
				endcase
		end
	end
	
	// Read FSM
	reg [1:0] state_rd         = 0;
	reg [1:0] next_state_rd    = 0;
	localparam [1:0] IDLE_RD   = 2'b00,
	                 ACCEPT_RD = 2'b01,
					 WAIT_RD   = 2'b10;
	                 
	always @ * begin
		
		// Default assignments
		s_axi_lite_arready_i = 0;
		s_axi_lite_rvalid_i  = 0;
		
		case (state_rd)
			
			IDLE_RD: begin
				if (s_axi_lite_arvalid)
					next_state_rd = ACCEPT_RD;
				else
					next_state_rd = IDLE_RD;
					
			end ACCEPT_RD: begin
				s_axi_lite_arready_i = 1'b1;
				next_state_rd        = WAIT_RD;
				
			end WAIT_RD: begin
				s_axi_lite_rvalid_i = 1'b1;
				if (s_axi_lite_rready)
					next_state_rd = IDLE_RD;
				else
					next_state_rd = WAIT_RD;
					
			end default: begin
				next_state_rd = IDLE_RD;
			end
			
		endcase
	end
	
	always @ (posedge aclk)
		if (~resetn)
			state_rd <= IDLE_RD;
		else
			state_rd <= next_state_rd;
			
	// Latch read address
	always @ (posedge aclk) begin
		if (~resetn)
			araddr_i <= 0;
		else
			if (s_axi_lite_arvalid & s_axi_lite_arready)
				araddr_i <= s_axi_lite_araddr;
	end
			
	// Mux read data
	always @ * begin
		case (araddr_i[7:0])
			`CR_ADDR_OFFSET:
				s_axi_lite_rdata_i = {clr_flags, ~sw_resetn}; // Reset is active low, but reg is active high to avoid confusion
			`SR_ADDR_OFFSET:
				s_axi_lite_rdata_i = {30'h0000_0000, fsize_hist_full, fsize_hist_empty};
			`ERR_ADDR_OFFSET:
				s_axi_lite_rdata_i = {err_sof_late_latch, err_sof_early_latch, err_eol_late_latch, err_eol_early_latch, err_latch};
			`HSIZE_ADDR_OFFSET:
				s_axi_lite_rdata_i = hsize;
			`VSIZE_ADDR_OFFSET:
				s_axi_lite_rdata_i = vsize;
			`FSIZE_HIST_ADDR_OFFSET:
				s_axi_lite_rdata_i = fsize_hist;
			default:
				s_axi_lite_rdata_i = 0;
		endcase
	end
	
	// Drive read enable for frame size history fifo
	assign fsize_hist_rd_en = s_axi_lite_arvalid & s_axi_lite_arready & (s_axi_lite_araddr[7:0] == `FSIZE_HIST_ADDR_OFFSET); // Should happen before read data cycle. What about FIFO read latency? I think I have at least 2 cycles to get the read data from the FIFO, so it should be okay
            
endmodule

