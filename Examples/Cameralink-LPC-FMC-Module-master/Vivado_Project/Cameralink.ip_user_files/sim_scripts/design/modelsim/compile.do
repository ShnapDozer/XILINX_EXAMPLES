vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_7
vlib modelsim_lib/msim/processing_system7_vip_v1_0_9
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/lib_pkg_v1_0_2
vlib modelsim_lib/msim/fifo_generator_v13_2_5
vlib modelsim_lib/msim/lib_fifo_v1_0_14
vlib modelsim_lib/msim/lib_srl_fifo_v1_0_2
vlib modelsim_lib/msim/axi_datamover_v5_1_23
vlib modelsim_lib/msim/axi_sg_v4_1_13
vlib modelsim_lib/msim/axi_dma_v7_1_22
vlib modelsim_lib/msim/axis_infrastructure_v1_1_0
vlib modelsim_lib/msim/axis_data_fifo_v2_0_3
vlib modelsim_lib/msim/xlconcat_v2_1_3
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_21
vlib modelsim_lib/msim/axi_data_fifo_v2_1_20
vlib modelsim_lib/msim/axi_crossbar_v2_1_22
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_21
vlib modelsim_lib/msim/axi_clock_converter_v2_1_20
vlib modelsim_lib/msim/blk_mem_gen_v8_4_4
vlib modelsim_lib/msim/axi_dwidth_converter_v2_1_21
vlib modelsim_lib/msim/axi_mmu_v2_1_19

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_7 modelsim_lib/msim/axi_vip_v1_1_7
vmap processing_system7_vip_v1_0_9 modelsim_lib/msim/processing_system7_vip_v1_0_9
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap lib_pkg_v1_0_2 modelsim_lib/msim/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_5 modelsim_lib/msim/fifo_generator_v13_2_5
vmap lib_fifo_v1_0_14 modelsim_lib/msim/lib_fifo_v1_0_14
vmap lib_srl_fifo_v1_0_2 modelsim_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_datamover_v5_1_23 modelsim_lib/msim/axi_datamover_v5_1_23
vmap axi_sg_v4_1_13 modelsim_lib/msim/axi_sg_v4_1_13
vmap axi_dma_v7_1_22 modelsim_lib/msim/axi_dma_v7_1_22
vmap axis_infrastructure_v1_1_0 modelsim_lib/msim/axis_infrastructure_v1_1_0
vmap axis_data_fifo_v2_0_3 modelsim_lib/msim/axis_data_fifo_v2_0_3
vmap xlconcat_v2_1_3 modelsim_lib/msim/xlconcat_v2_1_3
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_21 modelsim_lib/msim/axi_register_slice_v2_1_21
vmap axi_data_fifo_v2_1_20 modelsim_lib/msim/axi_data_fifo_v2_1_20
vmap axi_crossbar_v2_1_22 modelsim_lib/msim/axi_crossbar_v2_1_22
vmap axi_protocol_converter_v2_1_21 modelsim_lib/msim/axi_protocol_converter_v2_1_21
vmap axi_clock_converter_v2_1_20 modelsim_lib/msim/axi_clock_converter_v2_1_20
vmap blk_mem_gen_v8_4_4 modelsim_lib/msim/blk_mem_gen_v8_4_4
vmap axi_dwidth_converter_v2_1_21 modelsim_lib/msim/axi_dwidth_converter_v2_1_21
vmap axi_mmu_v2_1_19 modelsim_lib/msim/axi_mmu_v2_1_19

vlog -work xilinx_vip  -incr -sv -L axi_vip_v1_1_7 -L processing_system7_vip_v1_0_9 -L xilinx_vip "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -sv -L axi_vip_v1_1_7 -L processing_system7_vip_v1_0_9 -L xilinx_vip "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_7  -incr -sv -L axi_vip_v1_1_7 -L processing_system7_vip_v1_0_9 -L xilinx_vip "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ce6c/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_9  -incr -sv -L axi_vip_v1_1_7 -L processing_system7_vip_v1_0_9 -L xilinx_vip "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design/ip/design_processing_system7_1_0/sim/design_processing_system7_1_0.v" \

vcom -work lib_cdc_v1_0_2  -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13  -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/design/ip/design_proc_sys_reset_0/sim/design_proc_sys_reset_0.vhd" \

vcom -work lib_pkg_v1_0_2  -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5  -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_14  -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2  -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_23  -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/af86/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_13  -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/4919/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_22  -93 \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/0fb1/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/design/ip/design_axi_dma_2_1/sim/design_axi_dma_2_1.vhd" \
"../../../../Cameralink.srcs/sources_1/ipshared/654a/hdl/FreqCalc.vhd" \
"../../../../Cameralink.srcs/sources_1/ipshared/654a/hdl/CLReceive_S00_AXI.vhd" \
"../../../../Cameralink.srcs/sources_1/ipshared/654a/hdl/CLReceive_M00_AXIS.vhd" \
"../../../../Cameralink.srcs/sources_1/ipshared/654a/hdl/CLReceive.vhd" \
"../../../bd/design/ip/design_CLReceive_0_0/sim/design_CLReceive_0_0.vhd" \

vlog -work axis_infrastructure_v1_1_0  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_data_fifo_v2_0_3  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/50d0/hdl/axis_data_fifo_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design/ip/design_axis_data_fifo_1_1/sim/design_axis_data_fifo_1_1.v" \

vlog -work xlconcat_v2_1_3  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design/ip/design_xlconcat_0_0/sim/design_xlconcat_0_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/design/ip/design_proc_sys_reset_1/sim/design_proc_sys_reset_1.vhd" \

vlog -work generic_baseblocks_v2_1_0  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_21  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/2ef9/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_20  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/47c9/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_22  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/b68e/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design/ip/design_xbar_0/sim/design_xbar_0.v" \

vlog -work axi_protocol_converter_v2_1_21  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8dfa/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design/ip/design_auto_pc_0/sim/design_auto_pc_0.v" \

vlog -work axi_clock_converter_v2_1_20  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/7589/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_4  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_21  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/07be/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design/ip/design_auto_us_0/sim/design_auto_us_0.v" \
"../../../bd/design/ip/design_auto_pc_1/sim/design_auto_pc_1.v" \

vlog -work axi_mmu_v2_1_19  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../../Cameralink.srcs/sources_1/bd/design/ipshared/45eb/hdl/axi_mmu_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl" "+incdir+../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl" "+incdir+C:/Xilinx/Vivado/2020.1/data/xilinx_vip/include" \
"../../../bd/design/ip/design_s00_mmu_0/sim/design_s00_mmu_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/design/sim/design.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

