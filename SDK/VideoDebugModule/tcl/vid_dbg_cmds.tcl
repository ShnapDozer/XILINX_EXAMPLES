##################################################################################
# Company:        Xilinx
# Engineer:       bwiec
# Create Date:    Mon Jun 16 16:17:00 MST 2014
# Design Name:    vid_dbg_module
# Module Name:    axi_dbg_cmds
# Project Name:   Video Debug Tools
# Target Devices: All
# Tool Versions:  Vivado 2013.4
# Description:    TCL API for interacting with the JTAG to AXI core inside the
#                 Video Debug Module.
# 
# Dependencies:
#   - None
# 
# Revision:
#   - Rev 0.10 - Behavior verified in hardware testcase
#   - Rev 0.01 - File Created
#
# Known Issues:
#   - Rev 0.10 - None
#   - Rev 0.01 - None
#
# Notes:
#   - Use this file by first running:
#       source -notrace vid_dbg_cmds.tcl
#     and then running any of the procedures as described below
# 
##################################################################################

#
# Global variables
#

# Control register 
set CR_ADDR_OFFSET         0x00
set SW_RST_MASK            0x00000001
set CLR_FLAGS_MASK         0x00000002

# Status register
set SR_ADDR_OFFSET         0x04
set FSIZE_HIST_EMPTY_MASK  0x00000001
set FSIZE_HIST_FULL_MASK   0x00000002

# Error register
set ERR_ADDR_OFFSET        0x08
set ERR_MASK               0x00000001
set ERR_EOL_EARLY_MASK     0x00000002
set ERR_EOL_LATE_MASK      0x00000004
set ERR_SOF_EARLY_MASK     0x00000008
set ERR_SOF_LATE_MASK      0x00000010

# Horizontal Size register
set HSIZE_ADDR_OFFSET      0x0C
set HSIZE_MASK             0xFFFFFFFF

# Vertical Size register
set VSIZE_ADDR_OFFSET      0x10
set VSIZE_MASK             0xFFFFFFFF

# Frame Size History register
set FSIZE_HIST_ADDR_OFFSET 0x14
set FSIZE_HIST_MASK        0xFFFFFFFF

#
# Soft reset of the video debug module. This will reset the entire core which
# will cause it to re-lock on the video stream and re-populate the fifo.
#
# Example: rst_vid_dbg_module [get_hw_axis hw_axi_1]
#
proc rst_vid_dbg_module {hw_axi_inst} {

	# Local variables
	upvar CR_ADDR_OFFSET CR_ADDR_OFFSET
	upvar SW_RST_MASK    SW_RST_MASK

	# Delete old hw_axi_txn objects in case of error
	if {[llength [get_hw_axi_txns]] > 0} {
		delete_hw_axi_txn [get_hw_axi_txns]
	}

	# Print banner
	puts "----------------------------------------------------------------"
	puts "- Resetting frame size history for $hw_axi_inst...             -"
	puts "----------------------------------------------------------------"

	# Setup single write command
	create_hw_axi_txn -address $CR_ADDR_OFFSET -data $SW_RST_MASK -type write txn0 $hw_axi_inst
	
	# Execute command
	run_hw_axi -quiet [get_hw_axi_txns]

	# Delete hw_axi_txn objects when we're done with them
	if {[llength [get_hw_axi_txns]] > 0} {
		 delete_hw_axi_txn [get_hw_axi_txns]
	}
	
	puts "Done resetting frame size history!"

}

#
# Read the entire frame size history buffer.
#
# Example: read_frame_size_history [get_hw_axis hw_axi_1]
#
proc read_frame_size_history {hw_axi_inst} {

	# Local variables
	set   FIFO_DEPTH             1024
	upvar FSIZE_HIST_ADDR_OFFSET FSIZE_HIST_ADDR_OFFSET

	# Bitmasks for frame size logger ONLY! Note these are different than
	# the global values above for the error register. These are not redundant
	# because they are the flags trapped on a per-frame basis, rather than the
	# latches. The register just reads the value of the latches.
	set HIST_ERR_EOL_EARLY_MASK 0x20000000
	set HIST_ERR_EOL_LATE_MASK  0x10000000
	set HIST_ERR_SOF_EARLY_MASK 0x08000000
	set HIST_ERR_SOF_LATE_MASK  0x04000000
	set HIST_LINE_CNT_MASK      0x03FFE000
	set HIST_PIXEL_CNT_MASK     0x00001FFF
	
	# Delete old hw_axi_txn objects in case of error
	if {[llength [get_hw_axi_txns]] > 0} {
		delete_hw_axi_txn [get_hw_axi_txns]
	}

	# Print banner
	puts ""
	puts "----------------------------------------------------------------"
	puts "- Reading frame size history for $hw_axi_inst...               -"
	puts "----------------------------------------------------------------"

	# Read data
	for {set ii 0} {$ii < $FIFO_DEPTH} {incr ii} {

		# Setup single read command
		create_hw_axi_txn -address $FSIZE_HIST_ADDR_OFFSET -type read txn00 $hw_axi_inst
		
		# Execute read command
		run_hw_axi -quiet [get_hw_axi_txns]
		
		# Format results
		set read_result   [lindex [report_hw_axi_txn -t d4 [get_hw_axi_txns txn00]] 1]
		set err_eol_early [expr $read_result & $HIST_ERR_EOL_EARLY_MASK]
		set err_eol_early [expr $err_eol_early >> 29]
		set err_eol_late  [expr $read_result & $HIST_ERR_EOL_LATE_MASK]
		set err_eol_late  [expr $err_eol_late >> 28]
		set err_sof_early [expr $read_result & $HIST_ERR_SOF_EARLY_MASK]
		set err_sof_early [expr $err_sof_early >> 27]
		set err_sof_late  [expr $read_result & $HIST_ERR_SOF_LATE_MASK]
		set err_sof_late  [expr $err_sof_late >> 26]
		set line_cnt      [expr $read_result & $HIST_LINE_CNT_MASK]
		set line_cnt      [expr $line_cnt >> 13]
		set line_cnt      [expr $line_cnt + 1]
		set pixel_cnt     [expr $read_result & $HIST_PIXEL_CNT_MASK]
		set pixel_cnt     [expr $pixel_cnt >> 0]	
		set pixel_cnt     [expr $pixel_cnt + 1]
		
		# Print results
		puts "Frame $ii is ${pixel_cnt}x$line_cnt with err_eol_early=$err_eol_early, err_eol_late=$err_eol_late, err_sof_early=$err_sof_early, err_sof_late=$err_sof_late."
		
		# Clear single read command so it can be used again on the next iteration
		delete_hw_axi_txn [get_hw_axi_txns txn00]
	}
	
	# Delete hw_axi_txn objects
	if {[llength [get_hw_axi_txns]] > 0} {
		delete_hw_axi_txn [get_hw_axi_txns]
	}

	puts "Done reading frame size history!"
}

#
# Get current status of error latches.
#
# Example: get_cur_errs [get_hw_axis hw_axi_1]
#
proc get_cur_errs {hw_axi_inst} {
	
	# Local variables
	upvar ERR_ADDR_OFFSET    ERR_ADDR_OFFSET
	upvar ERR_MASK           ERR_MASK
	upvar ERR_EOL_EARLY_MASK ERR_EOL_EARLY_MASK
	upvar ERR_EOL_LATE_MASK  ERR_EOL_LATE_MASK
	upvar ERR_SOF_EARLY_MASK ERR_SOF_EARLY_MASK
	upvar ERR_SOF_LATE_MASK  ERR_SOF_LATE_MASK
	
	# Delete old hw_axi_txn objects in case of error
	if {[llength [get_hw_axi_txns]] > 0} {
		delete_hw_axi_txn [get_hw_axi_txns]
	}
	
	# Print banner
	puts "----------------------------------------------------------------"
	puts "- Getting errors reported by $hw_axi_inst...                   -"
	puts "----------------------------------------------------------------"
	
	# Setup single read command
	create_hw_axi_txn -address $ERR_ADDR_OFFSET -type read txn0 $hw_axi_inst
	
	# Execute command
	run_hw_axi -quiet [get_hw_axi_txns]

	# Store read result
	set read_result [lindex [report_hw_axi_txn -t d4 [get_hw_axi_txns txn0]] 1]
	
	# Delete hw_axi_txn objects when we're done with them
	if {[llength [get_hw_axi_txns]] > 0} {
		 delete_hw_axi_txn [get_hw_axi_txns]
	}
	
	# Format results
	set err           [expr $read_result & $ERR_MASK]
	set err           [expr $err >> 0]
	set err_eol_early [expr $read_result & $ERR_EOL_EARLY_MASK]
	set err_eol_early [expr $err_eol_early >> 1]
	set err_eol_late  [expr $read_result & $ERR_EOL_LATE_MASK]
	set err_eol_late  [expr $err_eol_late >> 2]
	set err_sof_early [expr $read_result & $ERR_SOF_EARLY_MASK]
	set err_sof_early [expr $err_sof_early >> 3]
	set err_sof_late  [expr $read_result & $ERR_SOF_LATE_MASK]
	set err_sof_late  [expr $err_sof_late >> 4]
	
	# Print results
	puts "Current error latches are: err=$err, err_eol_early=$err_eol_early, err_eol_late=$err_eol_late, err_sof_early=$err_sof_early, err_sof_late=$err_sof_late."
	
}

#
# Clear flags and frame size history FIFO, but don't reset VSIZE and HSIZE.
#
# Example: clear_flags [get_hw_axis hw_axi_1]
#
proc clear_flags {hw_axi_inst} {

	# Local variables
	upvar CR_ADDR_OFFSET CR_ADDR_OFFSET
	upvar CLR_FLAGS_MASK CLR_FLAGS_MASK
	
	# Delete old hw_axi_txn objects in case of error
	if {[llength [get_hw_axi_txns]] > 0} {
		delete_hw_axi_txn [get_hw_axi_txns]
	}
	
	# Print banner
	puts "----------------------------------------------------------------"
	puts "- Clearing flags for $hw_axi_inst...                           -"
	puts "----------------------------------------------------------------"

	# Setup single read command
	create_hw_axi_txn -address $CR_ADDR_OFFSET -type read txn0 $hw_axi_inst
	
	# Execute command
	run_hw_axi -quiet [get_hw_axi_txns]
	
	# Store read result
	set read_result [lindex [report_hw_axi_txn -t d4 [get_hw_axi_txns txn0]] 1]	
	
	# Setup single write command to assert clr_flags_bit
	set tmp [expr $read_result | $CLR_FLAGS_MASK]
	
	# Hack to avoid error
	set tmp 0x0000000$tmp
	create_hw_axi_txn -address $CR_ADDR_OFFSET -data $tmp -type write txn1 $hw_axi_inst
	
	# Setup single write command to de-assert clr_flags_bit
	
	# Hack to avoid error
	set tmp [expr $read_result & ~$CLR_FLAGS_MASK]
	set tmp 0x0000000$tmp
	create_hw_axi_txn -address $CR_ADDR_OFFSET -data $tmp -type write txn2 $hw_axi_inst
	
	# Execute commands
	run_hw_axi -quiet [get_hw_axi_txns]

	# Delete hw_axi_txn objects when we're done with them
	if {[llength [get_hw_axi_txns]] > 0} {
		 delete_hw_axi_txn [get_hw_axi_txns]
	}
	
	puts "Done clearing flags!"
	
}

#
# Get horizontal size.
#
# Example: get_hsize [get_hw_axis hw_axi_1]
#
proc get_hsize {hw_axi_inst} {
	
	# Local variables
	upvar HSIZE_ADDR_OFFSET HSIZE_ADDR_OFFSET
	
	# Delete old hw_axi_txn objects in case of error
	if {[llength [get_hw_axi_txns]] > 0} {
		delete_hw_axi_txn [get_hw_axi_txns]
	}
	
	# Print banner
	puts "----------------------------------------------------------------"
	puts "- Getting horizontal size for $hw_axi_inst...                  -"
	puts "----------------------------------------------------------------"
	
	# Setup single read command
	create_hw_axi_txn -address $HSIZE_ADDR_OFFSET -type read txn0 $hw_axi_inst
	
	# Execute command
	run_hw_axi -quiet [get_hw_axi_txns]

	# Store read result
	set read_result [lindex [report_hw_axi_txn -t d4 [get_hw_axi_txns txn0]] 1]
	
	# Delete hw_axi_txn objects when we're done with them
	if {[llength [get_hw_axi_txns]] > 0} {
		 delete_hw_axi_txn [get_hw_axi_txns]
	}
	
	puts "Current horizontal size is: $read_result"

}

#
# Set horizontal size.
#
# Example: set_hsize [get_hw_axis hw_axi_1] 0x00000780
#
proc set_hsize {hw_axi_inst new_hsize} {
	
	# Local variables
	upvar HSIZE_ADDR_OFFSET HSIZE_ADDR_OFFSET
	
	# Delete old hw_axi_txn objects in case of error
	if {[llength [get_hw_axi_txns]] > 0} {
		delete_hw_axi_txn [get_hw_axi_txns]
	}
	
	# Print banner
	puts "----------------------------------------------------------------"
	puts "- Setting horizontal size for $hw_axi_inst to $new_hsize...      -"
	puts "----------------------------------------------------------------"
	
	# Setup single write command
	create_hw_axi_txn -address $HSIZE_ADDR_OFFSET -data $new_hsize -type write txn0 $hw_axi_inst
	
	# Execute command
	run_hw_axi -quiet [get_hw_axi_txns]

	# Delete hw_axi_txn objects when we're done with them
	if {[llength [get_hw_axi_txns]] > 0} {
		 delete_hw_axi_txn [get_hw_axi_txns]
	}
	
	puts "Done setting horizontal size!"

}

#
# Get vertical size.
#
# Example: get_vsize [get_hw_axis hw_axi_1]
#
proc get_vsize {hw_axi_inst} {
	
	# Local variables
	upvar VSIZE_ADDR_OFFSET VSIZE_ADDR_OFFSET
	
	# Delete old hw_axi_txn objects in case of error
	if {[llength [get_hw_axi_txns]] > 0} {
		delete_hw_axi_txn [get_hw_axi_txns]
	}
	
	# Print banner
	puts "----------------------------------------------------------------"
	puts "- Getting vertical size for $hw_axi_inst...                    -"
	puts "----------------------------------------------------------------"
	
	# Setup single read command
	create_hw_axi_txn -address $VSIZE_ADDR_OFFSET -type read txn0 $hw_axi_inst
	
	# Execute command
	run_hw_axi -quiet [get_hw_axi_txns]

	# Store read result
	set read_result [lindex [report_hw_axi_txn -t d4 [get_hw_axi_txns txn0]] 1]
	
	# Delete hw_axi_txn objects when we're done with them
	if {[llength [get_hw_axi_txns]] > 0} {
		 delete_hw_axi_txn [get_hw_axi_txns]
	}
	
	puts "Current vertical size is: $read_result"

}

#
# Set vertical size.
#
# Example: set_vsize [get_hw_axis hw_axi_1] 0x00000438
#
proc set_vsize {hw_axi_inst new_vsize} {
	
	# Local variables
	upvar VSIZE_ADDR_OFFSET VSIZE_ADDR_OFFSET
	
	# Delete old hw_axi_txn objects in case of error
	if {[llength [get_hw_axi_txns]] > 0} {
		delete_hw_axi_txn [get_hw_axi_txns]
	}
	
	# Print banner
	puts "----------------------------------------------------------------"
	puts "- Setting vertical size for $hw_axi_inst to $new_vsize...      -"
	puts "----------------------------------------------------------------"
	
	# Setup single write command
	create_hw_axi_txn -address $VSIZE_ADDR_OFFSET -data $new_vsize -type write txn0 $hw_axi_inst
	
	# Execute command
	run_hw_axi -quiet [get_hw_axi_txns]

	# Delete hw_axi_txn objects when we're done with them
	if {[llength [get_hw_axi_txns]] > 0} {
		 delete_hw_axi_txn [get_hw_axi_txns]
	}
	
	puts "Done setting vertical size!"

}

