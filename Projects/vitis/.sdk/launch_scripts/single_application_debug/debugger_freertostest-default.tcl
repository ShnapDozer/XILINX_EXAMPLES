connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-SMT1 210203A7BF7BA" && level==0 && jtag_device_ctx=="jsn-JTAG-SMT1-210203A7BF7BA-23727093-0"}
fpga -file C:/Users/Work/Downloads/Xilinx/Projects/vitis/freeRtosTest/_ide/bitstream/DAC_XADC_TestPlatform.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/Work/Downloads/Xilinx/Projects/vitis/DAC_XDAC_testPlatform/export/DAC_XDAC_testPlatform/hw/DAC_XADC_TestPlatform.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/Work/Downloads/Xilinx/Projects/vitis/freeRtosTest/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/Work/Downloads/Xilinx/Projects/vitis/freeRtosTest/Debug/freeRtosTest.elf
configparams force-mem-access 0
bpadd -addr &main
