# Zynq FreeRTOS lwip Example Tutorial
## Vivado – Creating a Project
- Vivado version : v2020.1
- Project name : freertos_lwip
- Project location : D:/test/freertos_lwip
- Project Type : RTL Project
- Add Sources : [Next]
- Add Constraints : [Next]
- Default Part : Click the Boards, Select ZYNQ-7 ZC702 Evaluation Board

## Block Design
- IP INTEGRATOR -> Create Block Design
- Design name : design_top
- Add IP : ZYNQ7 Processing System
- Double-click the ZYNQ7 Processing System
- Click the Presets, Select ZC702
- Click [OK]
- Click the Run Block Automation -> [OK]
- Click the M_AXI_GP0_ACLK and drag to the FCLK_CLK0
- Click Validate Design (F6)
- Click the Sources tab
- Right-click design_top and select Create HDL Wrapper
- Select Let Vivado manage wrapper and auto-update
- Click Generate Bitstream
- zynq7_block_design_simple

## Exporting a Hardware Platform
- File -> Export -> Export Hardware
- Platform type : Fixed
- Output : Include bitstream
- Tools -> Launch Vitis IDE
- Workspace : D:/test/freertos_lwip/workspace

## Vitis – Creating a Platform Project
- File -> New -> Platform Project
- Platform project name : hw_platform
- Select Create a new platform from hardware (XSA) tab
- Browse to D:/test/freertos_lwip/design_top_wrapper.xsa
- Operating system : freertos10_xilinx

## Modify BSP Settings
- Explorer -> platform.spr -> hw_platform -> freertos10_xilinx on - ps7_cortexa9_0 -> Board Support Package -> Modify BSP Settings…
- Overview -> Select lwip211 and xilffs
- Overview -> freertos10_xilinx -> lwip211 -> api_mode
- Value = SOCKET_API (SOCKET_API)

## Compile hw_platform
- Explorer -> hw_platform -> Build Project

## Vitis – Creating a Application Project
- File -> New -> Application Project
- [Next] -> [Next]
- Application project name : freertos_lwip
- [Next] -> [Next]
- Select the FreeRTOS lwIP Echo Server and Finish
- Change ip address in the main.c
- IP4_ADDR(&ipaddr, 192, 168, 1, 10) -> IP4_ADDR(&ipaddr, 192, 168, 0, 100);
- Select the freertos_lwip and right-click Build Project

## Test
- SW16 : 00000
- SW10 : 01
- Connect a USB cable to connector U23 with PC (JTAG)
- Connect a USB cable to connector J17 with PC (Console/Terminal)
- Connect a LAN cable to connector P2/RJ45 with PC or Switch
- Select the freertos_lwip and right-click Run As -> Run Configurations
- Right-click Single Application Debug and click New Configuration
- Click the Target Setup tab and click Use FSBL flow for initialization
- [Apply] -> [Run]
- Run on linux terminal -> telnet 192.168.0.100 7