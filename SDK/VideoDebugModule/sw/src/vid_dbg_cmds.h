//////////////////////////////////////////////////////////////////////////////////
// Company:        Xilinx
// Engineer:       bwiec
// Create Date:    Mon Jun 16 16:17:00 MST 2014
// Design Name:    vid_dbg_module
// Module Name:    axi_dbg_cmds
// Project Name:   Video Debug Tools
// Target Devices: All
// Tool Versions:  Vivado 2013.4
// Description:    C API for interacting with the JTAG to AXI core inside the
//                 Video Debug Module.
// 
// Dependencies:
//   - vid_dbg_cmds.c
// 
// Revision:
//   - Rev 0.10 - Behavior verified in hardware testcase
//   - Rev 0.01 - File Created
//
// Known Issues:
//   - Rev 0.10 - None
//   - Rev 0.01 - None
//
// Notes:
//
//   - I don't think you should ever need 'set vsize' procedures. They would be pointless because
//     the core automatically locks on the video anyway. They should be read-only
// 
//////////////////////////////////////////////////////////////////////////////////

#ifndef __VID_DBG_CMDS_H__
#define __VID_DBG_CMDS_H__

// Control register 
#define CR_ADDR_OFFSET         0x00
#define SW_RST_MASK            0x00000001 // Clears flags and resets HSIZE and VSIZE to initial values
#define CLR_FLAGS_MASK         0x00000002 // Clears flags, but HSIZE and VSIZE remain

// Status register
#define SR_ADDR_OFFSET         0x04       // Read-only
#define FSIZE_HIST_EMPTY_MASK  0x00000001
#define FSIZE_HIST_FULL_MASK   0x00000002

// Error register
#define ERR_ADDR_OFFSET        0x08         // Read-only
#define ERR_MASK               0x00000001
#define ERR_EOL_EARLY_MASK     0x00000002
#define ERR_EOL_LATE_MASK      0x00000004
#define ERR_SOF_EARLY_MASK     0x00000008
#define ERR_SOF_LATE_MASK      0x00000010

// Horizontal Size register
#define HSIZE_ADDR_OFFSET      0x0C
#define HSIZE_MASK             0xFFFFFFFF // Undefined results occur if HSIZE reg value exceeds MAX_HSZIE

// Vertical Size register
#define VSIZE_ADDR_OFFSET      0x10
#define VSIZE_MASK             0xFFFFFFFF // Undefined results occur if VSIZE reg value exceeds MAX_VSZIE

// Frame Size History register
#define FSIZE_HIST_ADDR_OFFSET 0x14
#define FSIZE_HIST_MASK        0xFFFFFFFF

// Soft reset of the video debug module. This will reset the entire core which
// will cause it to re-lock on the video stream and re-populate the fifo.
int rst_vid_dbg_module(unsigned int baseaddr);

// Read the entire frame size history buffer.
int read_frame_size_history(unsigned int baseaddr);

// Get current status of error latches.
int get_cur_errs(unsigned int baseaddr);

// Clear flags and frame size history FIFO, but don't reset VSIZE and HSIZE.
int clear_flags(unsigned int baseaddr);

// Get horizontal size.
int get_hsize(unsigned int baseaddr);

// Set horizontal size.
int set_hsize(unsigned int baseaddr, unsigned int new_hsize);

// Get vertical size.
int get_vsize(unsigned int baseaddr);

// Set vertical size.
int set_vsize(unsigned int baseaddr, unsigned int new_vsize);

#endif // __VID_DBG_CMDS_H__

