-makelib xcelium_lib/xilinx_vip -sv \
  "C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "C:/Xilinx/Vivado/2020.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2020.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_7 -sv \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ce6c/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_9 -sv \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/6b56/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design/ip/design_processing_system7_1_0/sim/design_processing_system7_1_0.v" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design/ip/design_proc_sys_reset_0/sim/design_proc_sys_reset_0.vhd" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/lib_fifo_v1_0_14 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/a5cb/hdl/lib_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_srl_fifo_v1_0_2 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_datamover_v5_1_23 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/af86/hdl/axi_datamover_v5_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_sg_v4_1_13 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/4919/hdl/axi_sg_v4_1_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_dma_v7_1_22 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/0fb1/hdl/axi_dma_v7_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design/ip/design_axi_dma_2_1/sim/design_axi_dma_2_1.vhd" \
  "../../../../Cameralink.srcs/sources_1/ipshared/654a/hdl/FreqCalc.vhd" \
  "../../../../Cameralink.srcs/sources_1/ipshared/654a/hdl/CLReceive_S00_AXI.vhd" \
  "../../../../Cameralink.srcs/sources_1/ipshared/654a/hdl/CLReceive_M00_AXIS.vhd" \
  "../../../../Cameralink.srcs/sources_1/ipshared/654a/hdl/CLReceive.vhd" \
  "../../../bd/design/ip/design_CLReceive_0_0/sim/design_CLReceive_0_0.vhd" \
-endlib
-makelib xcelium_lib/axis_infrastructure_v1_1_0 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axis_data_fifo_v2_0_3 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/50d0/hdl/axis_data_fifo_v2_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design/ip/design_axis_data_fifo_1_1/sim/design_axis_data_fifo_1_1.v" \
-endlib
-makelib xcelium_lib/xlconcat_v2_1_3 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design/ip/design_xlconcat_0_0/sim/design_xlconcat_0_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design/ip/design_proc_sys_reset_1/sim/design_proc_sys_reset_1.vhd" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_21 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/2ef9/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_20 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/47c9/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_22 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/b68e/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design/ip/design_xbar_0/sim/design_xbar_0.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_21 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/8dfa/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design/ip/design_auto_pc_0/sim/design_auto_pc_0.v" \
-endlib
-makelib xcelium_lib/axi_clock_converter_v2_1_20 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/7589/hdl/axi_clock_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_4 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/axi_dwidth_converter_v2_1_21 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/07be/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design/ip/design_auto_us_0/sim/design_auto_us_0.v" \
  "../../../bd/design/ip/design_auto_pc_1/sim/design_auto_pc_1.v" \
-endlib
-makelib xcelium_lib/axi_mmu_v2_1_19 \
  "../../../../Cameralink.srcs/sources_1/bd/design/ipshared/45eb/hdl/axi_mmu_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design/ip/design_s00_mmu_0/sim/design_s00_mmu_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design/sim/design.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

