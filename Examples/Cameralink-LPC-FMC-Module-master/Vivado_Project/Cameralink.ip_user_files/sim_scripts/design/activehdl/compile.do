vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_7
vlib activehdl/processing_system7_vip_v1_0_9
vlib activehdl/xil_defaultlib
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/lib_pkg_v1_0_2
vlib activehdl/fifo_generator_v13_2_5
vlib activehdl/lib_fifo_v1_0_14
vlib activehdl/lib_srl_fifo_v1_0_2
vlib activehdl/axi_datamover_v5_1_23
vlib activehdl/axi_sg_v4_1_13
vlib activehdl/axi_dma_v7_1_22
vlib activehdl/axis_infrastructure_v1_1_0
vlib activehdl/axis_data_fifo_v2_0_3
vlib activehdl/xlconcat_v2_1_3
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_register_slice_v2_1_21
vlib activehdl/axi_data_fifo_v2_1_20
vlib activehdl/axi_crossbar_v2_1_22
vlib activehdl/axi_protocol_converter_v2_1_21
vlib activehdl/axi_clock_converter_v2_1_20
vlib activehdl/blk_mem_gen_v8_4_4
vlib activehdl/axi_dwidth_converter_v2_1_21
vlib activehdl/axi_mmu_v2_1_19

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_7 activehdl/axi_vip_v1_1_7
vmap processing_system7_vip_v1_0_9 activehdl/processing_system7_vip_v1_0_9
vmap xil_defaultlib activehdl/xil_defaultlib
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap lib_pkg_v1_0_2 activehdl/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_5 activehdl/fifo_generator_v13_2_5
vmap lib_fifo_v1_0_14 activehdl/lib_fifo_v1_0_14
vmap lib_srl_fifo_v1_0_2 activehdl/lib_srl_fifo_v1_0_2
vmap axi_datamover_v5_1_23 activehdl/axi_datamover_v5_1_23
vmap axi_sg_v4_1_13 activehdl/axi_sg_v4_1_13
vmap axi_dma_v7_1_22 activehdl/axi_dma_v7_1_22
vmap axis_infrastructure_v1_1_0 activehdl/axis_infrastructure_v1_1_0
vmap axis_data_fifo_v2_0_3 activehdl/axis_data_fifo_v2_0_3
vmap xlconcat_v2_1_3 activehdl/xlconcat_v2_1_3
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_21 activehdl/axi_register_slice_v2_1_21
vmap axi_data_fifo_v2_1_20 activehdl/axi_data_fifo_v2_1_20
vmap axi_crossbar_v2_1_22 activehdl/axi_crossbar_v2_1_22
vmap axi_protocol_converter_v2_1_21 activehdl/axi_protocol_converter_v2_1_21
vmap axi_clock_converter_v2_1_20 activehdl/axi_clock_converter_v2_1_20
vmap blk_mem_gen_v8_4_4 activehdl/blk_mem_gen_v8_4_4
vmap axi_dwidth_converter_v2_1_21 activehdl/axi_dwidth_converter_v2_1_21
vmap axi_mmu_v2_1_19 activehdl/axi_mmu_v2_1_19

vlog -work xilinx_vip  -sv2k12 "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_7  -sv2k12 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ce6c/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_9  -sv2k12 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design/ip/design_processing_system7_1_0/sim/design_processing_system7_1_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design/ip/design_proc_sys_reset_0/sim/design_proc_sys_reset_0.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_14 -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_23 -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/af86/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_13 -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/4919/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_22 -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/0fb1/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design/ip/design_axi_dma_2_1/sim/design_axi_dma_2_1.vhd" \
"../../../../Cameralink.srcs/sources_1/ipshared/654a/hdl/FreqCalc.vhd" \
"../../../../Cameralink.srcs/sources_1/ipshared/654a/hdl/CLReceive_S00_AXI.vhd" \
"../../../../Cameralink.srcs/sources_1/ipshared/654a/hdl/CLReceive_M00_AXIS.vhd" \
"../../../../Cameralink.srcs/sources_1/ipshared/654a/hdl/CLReceive.vhd" \
"../../../bd/design/ip/design_CLReceive_0_0/sim/design_CLReceive_0_0.vhd" \

vlog -work axis_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_data_fifo_v2_0_3  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/50d0/hdl/axis_data_fifo_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design/ip/design_axis_data_fifo_1_1/sim/design_axis_data_fifo_1_1.v" \

vlog -work xlconcat_v2_1_3  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design/ip/design_xlconcat_0_0/sim/design_xlconcat_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design/ip/design_proc_sys_reset_1/sim/design_proc_sys_reset_1.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_21  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/2ef9/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_20  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/47c9/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_22  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/b68e/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design/ip/design_xbar_0/sim/design_xbar_0.v" \

vlog -work axi_protocol_converter_v2_1_21  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8dfa/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design/ip/design_auto_pc_0/sim/design_auto_pc_0.v" \

vlog -work axi_clock_converter_v2_1_20  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/7589/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_21  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/07be/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design/ip/design_auto_us_0/sim/design_auto_us_0.v" \
"../../../bd/design/ip/design_auto_pc_1/sim/design_auto_pc_1.v" \

vlog -work axi_mmu_v2_1_19  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/45eb/hdl/axi_mmu_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design/ip/design_s00_mmu_0/sim/design_s00_mmu_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design/sim/design.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

