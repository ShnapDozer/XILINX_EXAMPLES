`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Xilinx
// Engineer:       bwiec
// Create Date:    Fri Feb 21 09:09:57 MST 2014
// Design Name:    vid_dbg_module
// Module Name:    vid_dbg_module_top
// Project Name:   Video Debug Tools
// Target Devices: All
// Tool Versions:  Vivado 2013.4
// Description:    This design provides utilities for debugging existing video
//                 designs which are based on Xilinx Video over AXI4 Stream
//                 protocol for the datapath. It keeps track of the number of
//                 frames, keeps track of the frame size, checks for frame size
//                 errors, and allows the user to select a certain pixel upon
//                 which to trigger a flag. This flag can be used as an interrupt
//                 or in conjunction with other tools such as Vivado Logic
//                 Analyzer for capturing specific portions of the video frame.
//                 This design can also optionally keep track of 1024 previous
//                 frame sizes as well as associated errors in a BRAM. This BRAM
//                 can then be accessed via a TCL script when using Vivado
//                 hardware debug flows.
//                
// Dependencies:   
//   - vid_dbg_module_top.v
//     |
//     |
//     +- axi_reg_defines.v
//     |
//     |
//     +- rst_driver.v
//     |
//     |
//     +- ctrs.v
//     |
//     |
//     +- error_checker.v
//     |
//     |
//     + axi_regs.v
//     |
//     |
//     +- jtag_axi_0.xci
//     |
//     |
//     +- frame_size_logger.v
//        |
//        |
//        +- sync_fifo.v
//           |
//           |
//           +- ram.v
//
// Revision:
//   - Rev 2.00 - Added ability to expose AXI Lite interface for processor access
//              - Added numerous registers accessible at run-time
//              - Added the ability to change the frame size at run-time when
//                AXI Lite or jtag-to-axi are used.
//              - Removed sim-only option to include BFM instead of JTAG-to-AXI
//              - Removed tkeep
//   - Rev 1.00 - Removed the m_axis interface so that the IP can be treated
//                as a 'monitor' rather than a 'pass through'
//              - Added capability to issue a full hardware reset from tcl
//                via GPIO
//              - Behavior verified in hardware testcase
//   - Rev 0.40 - Added 1K deep 'frame history' memory and AXI to JTAG core
//              - Added AXI BFM for simulating the 'frame history' capability
//              - Removed MARK_DEBUG attributes since synthesis mangles them
//              - Behavior verified in behavioral simulation
//              - Behavior verified in hardware testcase
//   - Rev 0.35 - Added error flags in addition to latched outputs
//              - Verified error flag behavior in simulation
//              - Verfied frame logger in simulation
//              - Added dont_touch attributes
//   - Rev 0.30 - Added MARK_DEBUG attributes to debug ports
//   - Rev 0.20 - Behavior verified in hardware testcase
//              - Added Master AXIS interface for ease of IPI integration
//              - Removed clog2 function in favor of $clog2 system call
//   - Rev 0.10 - Behavior verified in behavioral simulation
//   - Rev 0.01 - File Created
//
// Known Issues:
//   - Rev 2.00 - None
//   - Rev 1.00 - None
//   - Rev 0.40 - None
//   - Rev 0.35 - None
//   - Rev 0.30 - None
//   - Rev 0.20 - None
//   - Rev 0.10 - None
//   - Rev 0.01 - None
//
// Additional Comments:
//   - You must drive reset at least once for proper behavior of flags
//   - All error latches with *_latch suffix are sticky. Once asserted, they stay
//     asserted until reset
//   - All error flags with *_flag suffix are combinatorial. They are asserted for
//     one clock cycle with additional 1-2 clock cycles of latency
//   - The programmable flag is only asserted for one clock cycle 
//   - Null bytes (via tkeep) currently not supported
//   - Only 1 pixel per beat currently supported
//   - Interlaced video currently not supported
//   - Line counter is a bit odd and could potentially get to MAX_VSIZE instead
//     of MAX_VSIZE-1. However, as long as you only check it against
//     tvalid & tready, it will be fine. This is what the internal frame size
//     error checker does.
//
// To Do:
//   - Add support for interlaced video
//   - Add option for frame_size_logger to support 32 frames of storage instead of
//     1K
//   - Add ability to start trapping frames in the frame_size_logger module on the
//     assertion of the programmable flag
//   - Reduce area by pulling SOF and EOL signals to the top and distributing them
//     as necessary. Same for trapped error signals.
// 
//////////////////////////////////////////////////////////////////////////////////

module vid_dbg_module_top
#(
    parameter TDATA_WIDTH               = 16,
    parameter MAX_HSIZE                 = 1920, // Maximum number of pixels per line (ignored if jtag/axi interface is disabled)
    parameter MAX_VSIZE                 = 1080, // Maximum number of lines per frame (ignored if jtag/axi interface is disabled)
	parameter INIT_HSIZE                = 1920, // Initial number of pixels per line
    parameter INIT_VSIZE                = 1080, // Initial number of lines per frame
    parameter FRAME_TO_TRIGGER          = 0,    // Which frame to trigger flag
    parameter LINE_TO_TRIGGER           = 0,    // Which line to trigger flag
    parameter PIXEL_TO_TRIGGER          = 0,    // Which pixel to trigger flag
    parameter INCLUDE_FRAME_SIZE_LOGGER = 1,    // Include frame size logger logic
	parameter WHICH_INTERFACE           = 0     // For accessing reset, dynamic frame size, and (optionally) frame size logger logic. 0 = none, 1 = jtag, 2 = AXI Lite
)
(
    // Global signals
    input                          aclk,                // Video over AXI4 Stream interface clock
    input                          resetn,              // Reset (active low)
	
	// AXI4-Lite interface
    input                          s_axi_lite_awvalid,
	output                         s_axi_lite_awready,
	input  [31:0]                  s_axi_lite_awaddr,
	input                          s_axi_lite_wvalid,
	output                         s_axi_lite_wready,
	input  [31:0]                  s_axi_lite_wdata,
	output                         s_axi_lite_bvalid,
	input                          s_axi_lite_bready,
	output [1:0]                   s_axi_lite_bresp,
	input                          s_axi_lite_arvalid,
    output                         s_axi_lite_arready,
    input  [31:0]                  s_axi_lite_araddr,
    output                         s_axi_lite_rvalid,
    input                          s_axi_lite_rready,
    output [31:0]                  s_axi_lite_rdata,
    output [1:0]                   s_axi_lite_rresp,
    
    // Input Video over AXI4 Stream interface
    input                          s_axis_tvalid,       // Video over AXI4 Stream valid indicator
    input                          s_axis_tready,       // Video over AXI4 Stream ready indicator
    input                          s_axis_tlast,        // Video over AXI4 Stream end of line indicator
    input                          s_axis_tuser,        // Video over AXI4 Stream start of frame indicator
    input  [TDATA_WIDTH-1:0]       s_axis_tdata,        // Video over AXI4 Stream pixel data
    
    // Output counters
    output [31:0]                  frame_cnt,           // Number of frames that have passed since last reset
    output [$clog2(MAX_VSIZE):0]   line_cnt,            // Number of active lines that have passed since the start of the frame
    output [$clog2(MAX_HSIZE):0]   pixel_cnt,           // Number of active pixels that have passed since the start of the line
    
    // Output flags
    output                         prog_flag,           // User-programmable pixel flag
	output                         fsize_hist_full,     // Interrupt to indicate the frame history logger is full
    
    // Output errors
    output                         err_flag,            // Any frame-size error occurred (logical 'or' of all other flags)
    output                         err_latch,           // Any frame-size error occurred (logical 'or' of all other flags)
    output                         err_eol_early_flag,  // End of Line Early error occurred
    output                         err_eol_early_latch, // End of Line Early error occurred
    output                         err_eol_late_flag,   // End of Line Late error occurred
    output                         err_eol_late_latch,  // End of Line Late error occurred
    output                         err_sof_early_flag,  // Start of Frame Early error occurred
    output                         err_sof_early_latch, // Start of Frame Early error occurred
    output                         err_sof_late_flag,   // Start of Frame Late error occurred
    output                         err_sof_late_latch   // Start of Frame Late error occurred
);
    
    // Internal signals
	wire [$clog2(MAX_VSIZE):0] vsize;
	wire [$clog2(MAX_HSIZE):0] hsize;
    reg                        prog_flag_i = 0;
    wire                       resetn_internal;
    wire                       sw_resetn;
	wire                       clr_flags;
    wire                       s_axi_lite_awvalid_i;
	wire                       s_axi_lite_awready_i;
	wire [31:0]                s_axi_lite_awaddr_i;
	wire                       s_axi_lite_wvalid_i;
	wire                       s_axi_lite_wready_i;
	wire [31:0]                s_axi_lite_wdata_i;
	wire                       s_axi_lite_bvalid_i;
	wire                       s_axi_lite_bready_i;
	wire [1:0]                 s_axi_lite_bresp_i;
	wire                       s_axi_lite_arvalid_i;
    wire                       s_axi_lite_arready_i;
    wire [31:0]                s_axi_lite_araddr_i;
    wire                       s_axi_lite_rvalid_i;
    wire                       s_axi_lite_rready_i;
    wire [31:0]                s_axi_lite_rdata_i;
    wire [1:0]                 s_axi_lite_rresp_i;
	wire [31:0]                fsize_hist;
	wire                       fsize_hist_rd_en;
	wire                       fsize_hist_empty;
    
    // Output wire constant assignments
    assign prog_flag = prog_flag_i;

    // Reset module
    rst_driver rst_driver_inst
    (
        .aclk(aclk),
        .resetn(resetn & sw_resetn),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tready(s_axis_tready),
        .s_axis_tuser(s_axis_tuser),
        .resetn_internal(resetn_internal)
    );

    // Counter module
    ctrs
    #(
        .MAX_HSIZE(MAX_HSIZE),
        .MAX_VSIZE(MAX_VSIZE)
    )
    ctrs_inst
    (
        .aclk(aclk),
        .resetn(resetn_internal),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tready(s_axis_tready),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tuser(s_axis_tuser),
        .frame_cnt(frame_cnt),
        .line_cnt(line_cnt),
        .pixel_cnt(pixel_cnt)
    );
    
    // Drive programmable flag
    always @ * begin
        if ((frame_cnt == FRAME_TO_TRIGGER) &&
            (line_cnt  == LINE_TO_TRIGGER)  &&
            (pixel_cnt == PIXEL_TO_TRIGGER))
            prog_flag_i = 1'b1;
        else
            prog_flag_i = 1'b0;
    end
    
    // Frame size error checker
    error_checker
    #(
        .MAX_HSIZE(MAX_HSIZE),
        .MAX_VSIZE(MAX_VSIZE)
    )
    error_checker_inst
    (
        .aclk(aclk),
        .resetn(resetn_internal & ~clr_flags),
		.vsize(vsize),
		.hsize(hsize),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tready(s_axis_tready),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tuser(s_axis_tuser),
        .frame_cnt(frame_cnt),
        .line_cnt(line_cnt),
        .pixel_cnt(pixel_cnt),
        .err_flag(err_flag),
        .err_latch(err_latch),
        .err_eol_early_flag(err_eol_early_flag),
        .err_eol_early_latch(err_eol_early_latch),
        .err_eol_late_flag(err_eol_late_flag),
        .err_eol_late_latch(err_eol_late_latch),
        .err_sof_early_flag(err_sof_early_flag),
        .err_sof_early_latch(err_sof_early_latch),
        .err_sof_late_flag(err_sof_late_flag),
        .err_sof_late_latch(err_sof_late_latch)
    );

	// AXI Register set
	axi_regs
    #(
        .MAX_HSIZE(MAX_HSIZE),
        .MAX_VSIZE(MAX_VSIZE),
        .INIT_HSIZE(INIT_HSIZE),
        .INIT_VSIZE(INIT_VSIZE)
    )
    axi_regs_inst
    (
        // Global signals
        .aclk(aclk),
        .resetn(resetn), // I don't need to be synchronized to the frame. Also, we don't want a SW reset to affect this state machine because it will hang the AXI Lite interface because it won't ever bresp
    	.resetn_fsync(resetn_internal), // Reset synchronized to the frame. Necessary for SW reset to come out of reset
		
        // AXI4-Lite interface
        .s_axi_lite_awvalid(s_axi_lite_awvalid_i),
        .s_axi_lite_awready(s_axi_lite_awready_i),
        .s_axi_lite_awaddr(s_axi_lite_awaddr_i),
        .s_axi_lite_wvalid(s_axi_lite_wvalid_i),
        .s_axi_lite_wready(s_axi_lite_wready_i),
        .s_axi_lite_wdata(s_axi_lite_wdata_i),
        .s_axi_lite_bvalid(s_axi_lite_bvalid_i),
        .s_axi_lite_bready(s_axi_lite_bready_i),
        .s_axi_lite_bresp(s_axi_lite_bresp_i),
        .s_axi_lite_arvalid(s_axi_lite_arvalid_i),
        .s_axi_lite_arready(s_axi_lite_arready_i),
        .s_axi_lite_araddr(s_axi_lite_araddr_i),
        .s_axi_lite_rvalid(s_axi_lite_rvalid_i),
        .s_axi_lite_rready(s_axi_lite_rready_i),
        .s_axi_lite_rdata(s_axi_lite_rdata_i),
        .s_axi_lite_rresp(s_axi_lite_rresp_i),
		
		// Errors
    	.err_latch(err_latch),
        .err_eol_early_latch(err_eol_early_latch),
        .err_eol_late_latch(err_eol_late_latch),
        .err_sof_early_latch(err_sof_early_latch),
        .err_sof_late_latch(err_sof_late_latch),
		
    	// Control
    	.sw_resetn(sw_resetn),
		.clr_flags(clr_flags),
    	.hsize(hsize),
    	.vsize(vsize),
    	.fsize_hist(fsize_hist),
    	.fsize_hist_rd_en(fsize_hist_rd_en),
    	.fsize_hist_full(fsize_hist_full),
    	.fsize_hist_empty(fsize_hist_empty)
    );
	
	// Jtag to AXI
	generate
		if (WHICH_INTERFACE == 0) begin
			assign s_axi_lite_awvalid_i = 0;
			assign s_axi_lite_awaddr_i  = 0;
			assign s_axi_lite_wvalid_i  = 0;
			assign s_axi_lite_wdata_i   = 0;
			assign s_axi_lite_bready_i  = 0;
			assign s_axi_lite_arvalid_i = 0;
			assign s_axi_lite_araddr_i  = 0;
			assign s_axi_lite_rready_i  = 0;
        end else if (WHICH_INTERFACE == 1) begin
			jtag_axi_0 jtag_axi_master_inst
            (
                .aclk(aclk),                          // input wire aclk
                .aresetn(resetn),            // input wire aresetn
                .m_axi_awaddr(s_axi_lite_awaddr_i),   // output wire [31 : 0] m_axi_awaddr
                .m_axi_awprot(),                      // output wire [2 : 0] m_axi_awprot
                .m_axi_awvalid(s_axi_lite_awvalid_i), // output wire m_axi_awvalid
                .m_axi_awready(s_axi_lite_awready_i), // input wire m_axi_awready
                .m_axi_wdata(s_axi_lite_wdata_i),     // output wire [31 : 0] m_axi_wdata
                .m_axi_wstrb(),                       // output wire [3 : 0] m_axi_wstrb
                .m_axi_wvalid(s_axi_lite_wvalid_i),   // output wire m_axi_wvalid
                .m_axi_wready(s_axi_lite_wready_i),   // input wire m_axi_wready
                .m_axi_bresp(s_axi_lite_bresp_i),     // input wire [1 : 0] m_axi_bresp
                .m_axi_bvalid(s_axi_lite_bvalid_i),   // input wire m_axi_bvalid
                .m_axi_bready(s_axi_lite_bready_i),   // output wire m_axi_bready
                .m_axi_araddr(s_axi_lite_araddr_i),   // output wire [31 : 0] m_axi_araddr
                .m_axi_arprot(),                      // output wire [2 : 0] m_axi_arprot
                .m_axi_arvalid(s_axi_lite_arvalid_i), // output wire m_axi_arvalid
                .m_axi_arready(s_axi_lite_arready_i), // input wire m_axi_arready
                .m_axi_rdata(s_axi_lite_rdata_i),     // input wire [31 : 0] m_axi_rdata
                .m_axi_rresp(s_axi_lite_rresp_i),     // input wire [1 : 0] m_axi_rresp
                .m_axi_rvalid(s_axi_lite_rvalid_i),   // input wire m_axi_rvalid
                .m_axi_rready(s_axi_lite_rready_i)    // output wire m_axi_rready
            );
		end else if (WHICH_INTERFACE == 2) begin
			assign s_axi_lite_awvalid_i = s_axi_lite_awvalid;
			assign s_axi_lite_awready   = s_axi_lite_awready_i;
			assign s_axi_lite_awaddr_i  = s_axi_lite_awaddr;
			assign s_axi_lite_wvalid_i  = s_axi_lite_wvalid;
			assign s_axi_lite_wready    = s_axi_lite_wready_i;
			assign s_axi_lite_wdata_i   = s_axi_lite_wdata;
			assign s_axi_lite_bvalid    = s_axi_lite_bvalid_i;
			assign s_axi_lite_bready_i  = s_axi_lite_bready;
			assign s_axi_lite_bresp     = s_axi_lite_bresp_i;
			assign s_axi_lite_arvalid_i = s_axi_lite_arvalid;
			assign s_axi_lite_arready   = s_axi_lite_arready_i;
			assign s_axi_lite_araddr_i  = s_axi_lite_araddr;
			assign s_axi_lite_rvalid    = s_axi_lite_rvalid_i;
			assign s_axi_lite_rready_i  = s_axi_lite_rready;
			assign s_axi_lite_rdata     = s_axi_lite_rdata_i;
			assign s_axi_lite_rresp     = s_axi_lite_rresp_i;
		end
	endgenerate
	
	// Frame size logger
	generate
		if (INCLUDE_FRAME_SIZE_LOGGER == 1) begin
			frame_size_logger
            #(
                .MAX_HSIZE(MAX_HSIZE),
                .MAX_VSIZE(MAX_VSIZE)
            )
            frame_size_logger_inst
            (
                .aclk(aclk),
                .resetn(resetn_internal & ~clr_flags),
                .s_axis_tvalid(s_axis_tvalid),
                .s_axis_tready(s_axis_tready),
                .s_axis_tlast(s_axis_tlast),
                .s_axis_tuser(s_axis_tuser),
                .frame_cnt(frame_cnt),
                .line_cnt(line_cnt),
                .pixel_cnt(pixel_cnt),
                .err_eol_early_flag(err_eol_early_flag),
                .err_eol_late_flag(err_eol_late_flag),
                .err_sof_early_flag(err_sof_early_flag),
                .err_sof_late_flag(err_sof_late_flag),
				.fsize_hist(fsize_hist),
				.fsize_hist_rd_en(fsize_hist_rd_en),
				.fsize_hist_full(fsize_hist_full),
				.fsize_hist_empty(fsize_hist_empty)
            );
	    end
    endgenerate

endmodule

