connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-SMT1 210203A7BF7BA" && level==0 && jtag_device_ctx=="jsn-JTAG-SMT1-210203A7BF7BA-23727093-0"}
fpga -file C:/Users/Work/Desktop/XILINX_EXAMPLES/Projects/DmaExample/vitis/test_dma_ethernet/_ide/bitstream/DmaDesign_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/Work/Desktop/XILINX_EXAMPLES/Projects/DmaExample/vitis/DmaDesign_wrapper/export/DmaDesign_wrapper/hw/DmaDesign_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/Work/Desktop/XILINX_EXAMPLES/Projects/DmaExample/vitis/test_dma_ethernet/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/Work/Desktop/XILINX_EXAMPLES/Projects/DmaExample/vitis/test_dma_ethernet/Debug/test_dma_ethernet.elf
configparams force-mem-access 0
bpadd -addr &main
