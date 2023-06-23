connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-SMT1 210203A7BF7BA" && level==0 && jtag_device_ctx=="jsn-JTAG-SMT1-210203A7BF7BA-23727093-0"}
fpga -file C:/Users/Work/Desktop/XILINX_EXAMPLES/Projects/EthernetExample/vitis/test_echo/_ide/bitstream/EthernetExampleDesign_hw.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/Work/Desktop/XILINX_EXAMPLES/Projects/EthernetExample/vitis/ethernet_OS/export/ethernet_OS/hw/EthernetExampleDesign_hw.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
targets -set -nocase -filter {name =~ "*A9*#0"}
rst -processor
dow C:/Users/Work/Desktop/XILINX_EXAMPLES/Projects/EthernetExample/vitis/ethernet_OS/export/ethernet_OS/sw/ethernet_OS/boot/fsbl.elf
set bp_29_59_fsbl_bp [bpadd -addr &FsblHandoffJtagExit]
con -block -timeout 60
bpremove $bp_29_59_fsbl_bp
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/Work/Desktop/XILINX_EXAMPLES/Projects/EthernetExample/vitis/test_echo/Debug/test_echo.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
