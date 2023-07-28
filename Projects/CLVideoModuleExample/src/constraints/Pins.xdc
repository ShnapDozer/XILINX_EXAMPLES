# SWITCH
set_property PACKAGE_PIN G19 [get_ports {SW[0]}]
set_property PACKAGE_PIN F19 [get_ports {SW[1]}]

set_property IOSTANDARD LVCMOS25 [get_ports {SW[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {SW[1]}]

# LED
set_property PACKAGE_PIN E15 [get_ports {LED[0]}]
set_property PACKAGE_PIN D15 [get_ports {LED[1]}]
set_property PACKAGE_PIN W17 [get_ports {LED[2]}]
set_property PACKAGE_PIN W5 [get_ports {LED[3]}]
set_property PACKAGE_PIN V7 [get_ports {LED[4]}]
set_property PACKAGE_PIN W10 [get_ports {LED[5]}]
set_property PACKAGE_PIN P18 [get_ports {LED[6]}]
set_property PACKAGE_PIN P17 [get_ports {LED[7]}]

set_property IOSTANDARD LVCMOS25 [get_ports {LED[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED[7]}]

create_clock -period 11.765 -name CL_clk [get_ports CL_clk]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets n_0_SW_IBUF[0]_inst]


# FMC CONNECTOR CONFIGURATION "C22 FMC1_LPC_LA18_CC_P D20"
set_property PACKAGE_PIN D20 [get_ports CL_clk]
set_property IOSTANDARD LVCMOS25 [get_ports CL_clk]

# "C23 FMC1_LPC_LA18_CC_N C20"
set_property PACKAGE_PIN C20 [get_ports CL_ser_tx]
set_property IOSTANDARD LVCMOS25 [get_ports CL_ser_tx]

# "H29 FMC1_LPC_LA24_N A22"
set_property PACKAGE_PIN A22 [get_ports CL_ser_rx]
set_property IOSTANDARD LVCMOS25 [get_ports CL_ser_rx]

# "G2 FMC1_LPC_CLK1_M2C_P M19"
set_property PACKAGE_PIN M19 [get_ports {CL_CC[0]}]
# "D20 FMC1_LPC_LA17_CC_P B19"
set_property PACKAGE_PIN B19 [get_ports {CL_CC[1]}]
# "D21 FMC1_LPC_LA17_CC_N B20"
set_property PACKAGE_PIN B20 [get_ports {CL_CC[2]}]
# "G21 FMC1_LPC_LA20_P G20"
set_property PACKAGE_PIN G20 [get_ports {CL_CC[3]}]

set_property IOSTANDARD LVCMOS25 [get_ports {CL_CC[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_CC[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_CC[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_CC[3]}]

#FMC Data
# "G22 FMC1_LPC_LA20_N G21"
set_property PACKAGE_PIN G21 [get_ports {CL_data[0]}]
# "H22 FMC1_LPC_LA19_P E19"
set_property PACKAGE_PIN E19 [get_ports {CL_data[1]}]
# "D23 FMC1_LPC_LA23_P G15"
set_property PACKAGE_PIN G15 [get_ports {CL_data[2]}]
# "H23 FMC1_LPC_LA19_N E20"
set_property PACKAGE_PIN E20 [get_ports {CL_data[3]}]
# "D24 FMC1_LPC_LA23_N G16"
set_property PACKAGE_PIN G16 [get_ports {CL_data[4]}]
# "G24 FMC1_LPC_LA22_P G17"
set_property PACKAGE_PIN G17 [get_ports {CL_data[5]}]
# "C26 FMC1_LPC_LA27_P C17"
set_property PACKAGE_PIN C17 [get_ports {CL_data[6]}]
# "D26 FMC1_LPC_LA26_P F18"
set_property PACKAGE_PIN F18 [get_ports {CL_data[7]}]
# "H25 FMC1_LPC_LA21_P F21"
set_property PACKAGE_PIN F21 [get_ports {CL_data[8]}]
# "G25 FMC1_LPC_LA22_N F17"
set_property PACKAGE_PIN F17 [get_ports {CL_data[9]}]
# "H26 FMC1_LPC_LA21_N F22"
set_property PACKAGE_PIN F22 [get_ports {CL_data[10]}]
# "C27 FMC1_LPC_LA27_N C18"
set_property PACKAGE_PIN C18 [get_ports {CL_data[11]}]
# "D27 FMC1_LPC_LA26_N E18"
set_property PACKAGE_PIN E18 [get_ports {CL_data[12]}]
# "G27 FMC1_LPC_LA25_P C15"
set_property PACKAGE_PIN C15 [get_ports {CL_data[13]}]
# "G28 FMC1_LPC_LA25_N B15"
set_property PACKAGE_PIN B15 [get_ports {CL_data[14]}]
# "H28 FMC1_LPC_LA24_P A21"
set_property PACKAGE_PIN A21 [get_ports {CL_data[15]}]
# "G30 FMC1_LPC_LA29_P B16"
set_property PACKAGE_PIN B16 [get_ports {CL_data[16]}]
# "G31 FMC1_LPC_LA29_N B17"
set_property PACKAGE_PIN B17 [get_ports {CL_data[17]}]
# "H31 FMC1_LPC_LA28_P D22"
set_property PACKAGE_PIN D22 [get_ports {CL_data[18]}]
# "H32 FMC1_LPC_LA28_N C22"
set_property PACKAGE_PIN C22 [get_ports {CL_data[19]}]
# "G33 FMC1_LPC_LA31_P A16"
set_property PACKAGE_PIN A16 [get_ports {CL_data[20]}]
# "G34 FMC1_LPC_LA31_N A17"
set_property PACKAGE_PIN A17 [get_ports {CL_data[21]}]
# "H34 FMC1_LPC_LA30_P E21"
set_property PACKAGE_PIN E21 [get_ports {CL_data[22]}]
# "H35 FMC1_LPC_LA30_N D21"
set_property PACKAGE_PIN D21 [get_ports {CL_data[23]}]
# "G36 FMC1_LPC_LA33_P A18"
set_property PACKAGE_PIN A18 [get_ports {CL_data[24]}]
# "G37 FMC1_LPC_LA33_N A19"
set_property PACKAGE_PIN A19 [get_ports {CL_data[25]}]
# "H37 FMC1_LPC_LA32_P B21"
set_property PACKAGE_PIN B21 [get_ports {CL_data[26]}]
# "H38 FMC1_LPC_LA32_N B22"
set_property PACKAGE_PIN B22 [get_ports {CL_data[27]}]


set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[10]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[11]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[12]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[13]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[14]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[15]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[16]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[17]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[18]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[19]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[20]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[21]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[22]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[23]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[24]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[25]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[26]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CL_data[27]}]

set_clock_groups -name aync_clk -asynchronous -group [get_clocks CL_clk] -group [get_clocks clk_fpga_0]


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 32768 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list CL_clk_IBUF]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 1 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {design_1_i/CLReceive_0/inst/M00_AXIS_tuser[0]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 28 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {design_1_i/CLReceive_0/CL_data[0]} {design_1_i/CLReceive_0/CL_data[1]} {design_1_i/CLReceive_0/CL_data[2]} {design_1_i/CLReceive_0/CL_data[3]} {design_1_i/CLReceive_0/CL_data[4]} {design_1_i/CLReceive_0/CL_data[5]} {design_1_i/CLReceive_0/CL_data[6]} {design_1_i/CLReceive_0/CL_data[7]} {design_1_i/CLReceive_0/CL_data[8]} {design_1_i/CLReceive_0/CL_data[9]} {design_1_i/CLReceive_0/CL_data[10]} {design_1_i/CLReceive_0/CL_data[11]} {design_1_i/CLReceive_0/CL_data[12]} {design_1_i/CLReceive_0/CL_data[13]} {design_1_i/CLReceive_0/CL_data[14]} {design_1_i/CLReceive_0/CL_data[15]} {design_1_i/CLReceive_0/CL_data[16]} {design_1_i/CLReceive_0/CL_data[17]} {design_1_i/CLReceive_0/CL_data[18]} {design_1_i/CLReceive_0/CL_data[19]} {design_1_i/CLReceive_0/CL_data[20]} {design_1_i/CLReceive_0/CL_data[21]} {design_1_i/CLReceive_0/CL_data[22]} {design_1_i/CLReceive_0/CL_data[23]} {design_1_i/CLReceive_0/CL_data[24]} {design_1_i/CLReceive_0/CL_data[25]} {design_1_i/CLReceive_0/CL_data[26]} {design_1_i/CLReceive_0/CL_data[27]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA [get_debug_ports u_ila_0/probe2]
set_property port_width 16 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {design_1_i/CLReceive_0/inst/LineSize[0]} {design_1_i/CLReceive_0/inst/LineSize[1]} {design_1_i/CLReceive_0/inst/LineSize[2]} {design_1_i/CLReceive_0/inst/LineSize[3]} {design_1_i/CLReceive_0/inst/LineSize[4]} {design_1_i/CLReceive_0/inst/LineSize[5]} {design_1_i/CLReceive_0/inst/LineSize[6]} {design_1_i/CLReceive_0/inst/LineSize[7]} {design_1_i/CLReceive_0/inst/LineSize[8]} {design_1_i/CLReceive_0/inst/LineSize[9]} {design_1_i/CLReceive_0/inst/LineSize[10]} {design_1_i/CLReceive_0/inst/LineSize[11]} {design_1_i/CLReceive_0/inst/LineSize[12]} {design_1_i/CLReceive_0/inst/LineSize[13]} {design_1_i/CLReceive_0/inst/LineSize[14]} {design_1_i/CLReceive_0/inst/LineSize[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA [get_debug_ports u_ila_0/probe3]
set_property port_width 16 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {design_1_i/CLReceive_0/inst/FrameSize[0]} {design_1_i/CLReceive_0/inst/FrameSize[1]} {design_1_i/CLReceive_0/inst/FrameSize[2]} {design_1_i/CLReceive_0/inst/FrameSize[3]} {design_1_i/CLReceive_0/inst/FrameSize[4]} {design_1_i/CLReceive_0/inst/FrameSize[5]} {design_1_i/CLReceive_0/inst/FrameSize[6]} {design_1_i/CLReceive_0/inst/FrameSize[7]} {design_1_i/CLReceive_0/inst/FrameSize[8]} {design_1_i/CLReceive_0/inst/FrameSize[9]} {design_1_i/CLReceive_0/inst/FrameSize[10]} {design_1_i/CLReceive_0/inst/FrameSize[11]} {design_1_i/CLReceive_0/inst/FrameSize[12]} {design_1_i/CLReceive_0/inst/FrameSize[13]} {design_1_i/CLReceive_0/inst/FrameSize[14]} {design_1_i/CLReceive_0/inst/FrameSize[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 16 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {design_1_i/CLReceive_0/inst/M00_AXIS_tdata[0]} {design_1_i/CLReceive_0/inst/M00_AXIS_tdata[1]} {design_1_i/CLReceive_0/inst/M00_AXIS_tdata[2]} {design_1_i/CLReceive_0/inst/M00_AXIS_tdata[3]} {design_1_i/CLReceive_0/inst/M00_AXIS_tdata[4]} {design_1_i/CLReceive_0/inst/M00_AXIS_tdata[5]} {design_1_i/CLReceive_0/inst/M00_AXIS_tdata[6]} {design_1_i/CLReceive_0/inst/M00_AXIS_tdata[7]} {design_1_i/CLReceive_0/inst/M00_AXIS_tdata[8]} {design_1_i/CLReceive_0/inst/M00_AXIS_tdata[9]} {design_1_i/CLReceive_0/inst/M00_AXIS_tdata[10]} {design_1_i/CLReceive_0/inst/M00_AXIS_tdata[11]} {design_1_i/CLReceive_0/inst/M00_AXIS_tdata[12]} {design_1_i/CLReceive_0/inst/M00_AXIS_tdata[13]} {design_1_i/CLReceive_0/inst/M00_AXIS_tdata[14]} {design_1_i/CLReceive_0/inst/M00_AXIS_tdata[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list design_1_i/CLReceive_0/inst/M00_AXIS_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list design_1_i/CLReceive_0/inst/M00_AXIS_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list design_1_i/CLReceive_0_M00_AXIS_TREADY]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets CL_clk_IBUF]
