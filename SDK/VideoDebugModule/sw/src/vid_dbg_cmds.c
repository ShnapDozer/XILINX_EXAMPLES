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
//   - None
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
//////////////////////////////////////////////////////////////////////////////////

// Includes
#include "vid_dbg_cmds.h"
#include "xil_printf.h"

// Soft reset of the video debug module. This will reset the entire core which
// will cause it to re-lock on the video stream and re-populate the fifo. The reset
// bit will automatically clear when reset is complete which happens on the next frame.
int rst_vid_dbg_module(unsigned int baseaddr)
{

	// Local variables
	volatile unsigned int* reg = (unsigned int*)(baseaddr+CR_ADDR_OFFSET);
	
	// Print banner
	xil_printf("----------------------------------------------------------------\n\r");
	xil_printf("- Resetting frame size history for Video Debug Module instance at address 0x%08X...\n\r", baseaddr);
	xil_printf("----------------------------------------------------------------\n\r");

	// Write to the control register
	*reg = SW_RST_MASK;
	
	xil_printf("Done resetting frame size history!\n\r");
	
	return 0;
	
}

// Read the entire frame size history buffer.
int read_frame_size_history(unsigned int baseaddr)
{

	// Local variables
	const unsigned int FIFO_DEPTH = 1024;
	unsigned int       reg;
	unsigned int       ii;
	unsigned int       err_eol_early;
	unsigned int       err_eol_late;
	unsigned int       err_sof_early;
	unsigned int       err_sof_late;
	unsigned int       line_cnt;
	unsigned int       pixel_cnt;

	// Bitmasks for frame size logger ONLY! Note these are different than
	// the global values above for the error register. These are not redundant
	// because they are the flags trapped on a per-frame basis, rather than the
	// latches. The register just reads the value of the latches.
	const unsigned int HIST_ERR_EOL_EARLY_MASK = 0x20000000;
	const unsigned int HIST_ERR_EOL_LATE_MASK  = 0x10000000;
	const unsigned int HIST_ERR_SOF_EARLY_MASK = 0x08000000;
	const unsigned int HIST_ERR_SOF_LATE_MASK  = 0x04000000;
	const unsigned int HIST_LINE_CNT_MASK      = 0x03FFE000;
	const unsigned int HIST_PIXEL_CNT_MASK     = 0x00001FFF;

	// Print banner
	xil_printf("----------------------------------------------------------------\n\r");
	xil_printf("- Reading frame size history for Video Debug Module instance at address 0x%08X...\n\r", baseaddr);
	xil_printf("----------------------------------------------------------------\n\r");

	// Read data
	for (ii = 0; ii < FIFO_DEPTH; ii++)
	{

		// Read Frame Size History register
		reg = *((unsigned int*)(baseaddr + FSIZE_HIST_ADDR_OFFSET));
		
		// Format results
		err_eol_early = reg & HIST_ERR_EOL_EARLY_MASK;
		err_eol_early = err_eol_early >> 29;
		err_eol_late  = reg & HIST_ERR_EOL_LATE_MASK;
		err_eol_late  = err_eol_late >> 28;
		err_sof_early = reg & HIST_ERR_SOF_EARLY_MASK;
		err_sof_early = err_sof_early >> 27;
		err_sof_late  = reg & HIST_ERR_SOF_LATE_MASK;
		err_sof_late  = err_sof_late >> 26;
		line_cnt      = reg & HIST_LINE_CNT_MASK;
		line_cnt      = line_cnt >> 13;
		line_cnt      = line_cnt + 1;
		pixel_cnt     = reg & HIST_PIXEL_CNT_MASK;
		pixel_cnt     = pixel_cnt >> 0;
		pixel_cnt     = pixel_cnt + 1;
		
		// Print results
		xil_printf("Frame %d is %dx%d with err_eol_early=%d, err_eol_late=%d, err_sof_early=%d, err_sof_late=%d.\n\r",
		            ii, pixel_cnt, line_cnt, err_eol_early, err_eol_late, err_sof_early, err_sof_late);
					
	}

	xil_printf("Done reading frame size history!\n\r");
	
	return 0;
}

// Get current status of error latches.
int get_cur_errs(unsigned int baseaddr)
{
	
	// Local variables
	unsigned int reg;
	unsigned int err;
	unsigned int err_eol_early;
	unsigned int err_eol_late;
	unsigned int err_sof_early;
	unsigned int err_sof_late;
	
	// Print banner
	xil_printf("----------------------------------------------------------------\n\r");
	xil_printf("- Getting errors reported by Video Debug Module instance at address 0x%08X...\n\r", baseaddr);
	xil_printf("----------------------------------------------------------------\n\r");
	
	// Read Error register
	reg = *((unsigned int*)(baseaddr + ERR_ADDR_OFFSET));
	
	// Format results
	err           = reg & ERR_MASK;
	err           = err >> 0;
	err_eol_early = reg & ERR_EOL_EARLY_MASK;
	err_eol_early = err_eol_early >> 1;
	err_eol_late  = reg & ERR_EOL_LATE_MASK;
	err_eol_late  = err_eol_late >> 2;
	err_sof_early = reg & ERR_SOF_EARLY_MASK;
	err_sof_early = err_sof_early >> 3;
	err_sof_late  = reg & ERR_SOF_LATE_MASK;
	err_sof_late  = err_sof_late >> 4;
	
	// Print results
	xil_printf("Current error latches are: err=%d, err_eol_early=%d, err_eol_late=%d, err_sof_early=%d, err_sof_late=%d.\n\r",
	           err, err_eol_early, err_eol_late, err_sof_early, err_sof_late);
			   
	return 0;
	
}

// Clear flags and frame size history FIFO, but don't reset VSIZE and HSIZE.
int clear_flags(unsigned int baseaddr)
{

	// Local variables
	volatile unsigned int* reg = (unsigned int*)(baseaddr+CR_ADDR_OFFSET);
	volatile unsigned int  tmp;
	
	// Print banner
	xil_printf("----------------------------------------------------------------\n\r");
	xil_printf("- Clearing flags for Video Debug Module instance at address 0x%08X...\n\r", baseaddr);
	xil_printf("----------------------------------------------------------------\n\r");

	// Write to the control register
	tmp  = *reg;
	*reg = tmp | CLR_FLAGS_MASK;  // Assert clr_flags bit
	*reg = tmp & ~CLR_FLAGS_MASK; // De-assert clr_flags bit
	
	xil_printf("Done clearing flags!\n\r");
	
	return 0;
	
}

// Get horizontal size.
int get_hsize(unsigned int baseaddr)
{
	
	// Local variables
	unsigned int reg;
	
	// Print banner
	xil_printf("----------------------------------------------------------------\n\r");
	xil_printf("- Getting horizontal size for Video Debug Module instance at address 0x%08X...\n\r", baseaddr);
	xil_printf("----------------------------------------------------------------\n\r");
	
	// Read Horizontal Size register
	reg = *((unsigned int*)(baseaddr + HSIZE_ADDR_OFFSET));
		
	xil_printf("Current horizontal size is: %d\n\r", reg);

	return 0;
	
}

// Set horizontal size.
int set_hsize(unsigned int baseaddr, unsigned int new_hsize)
{
	
	// Local variables
	volatile unsigned int* reg = (unsigned int*)(baseaddr+HSIZE_ADDR_OFFSET);
	
	// Print banner
	xil_printf("----------------------------------------------------------------\n\r");
	xil_printf("- Setting horizontal size for Video Debug Module instance at address 0x%08X...\n\r", baseaddr);
	xil_printf("----------------------------------------------------------------\n\r");
	
	// Write to the Horizontal Size register
	*reg = new_hsize & HSIZE_MASK;
	
	xil_printf("Done setting horizontal size!\n\r");
	
	return 0;

}

// Get vertical size.
int get_vsize(unsigned int baseaddr)
{
	
	// Local variables
	unsigned int reg;
	
	// Print banner
	xil_printf("----------------------------------------------------------------\n\r");
	xil_printf("- Getting vertical size for Video Debug Module instance at address 0x%08X...\n\r", baseaddr);
	xil_printf("----------------------------------------------------------------\n\r");
	
	// Read Vertical Size register
	reg = *((unsigned int*)(baseaddr + VSIZE_ADDR_OFFSET));
		
	xil_printf("Current vertical size is: %d\n\r", reg);

	return 0;

}

// Set vertical size.
int set_vsize(unsigned int baseaddr, unsigned int new_vsize)
{
	
	// Local variables
	volatile unsigned int* reg = (unsigned int*)(baseaddr+VSIZE_ADDR_OFFSET);
	
	// Print banner
	xil_printf("----------------------------------------------------------------\n\r");
	xil_printf("- Setting vertical size for Video Debug Module instance at address 0x%08X...\n\r", baseaddr);
	xil_printf("----------------------------------------------------------------\n\r");
	
	// Write to the Vertical Size register
	*reg = new_vsize & VSIZE_MASK;
	
	xil_printf("Done setting vertical size!\n\r");
	
	return 0;

}

