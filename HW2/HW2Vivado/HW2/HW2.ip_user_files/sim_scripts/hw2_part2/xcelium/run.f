-makelib xcelium_lib/xpm -sv \
  "E:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "E:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "E:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_srl_fifo_v1_0_2 \
  "../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_uartlite_v2_0_31 \
  "../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/67a1/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/hw2_part2/ip/hw2_part2_axi_uartlite_0_0/sim/hw2_part2_axi_uartlite_0_0.vhd" \
  "../../../bd/hw2_part2/ip/hw2_part2_clk_wiz_0_0/hw2_part2_clk_wiz_0_0_sim_netlist.vhdl" \
-endlib
-makelib xcelium_lib/mdm_v3_2_23 \
  "../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/b8f4/hdl/mdm_v3_2_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/hw2_part2/ip/hw2_part2_mdm_1_0/sim/hw2_part2_mdm_1_0.vhd" \
-endlib
-makelib xcelium_lib/microblaze_v11_0_10 \
  "../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/1f7b/hdl/microblaze_v11_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/hw2_part2/ip/hw2_part2_microblaze_0_0/sim/hw2_part2_microblaze_0_0.vhd" \
-endlib
-makelib xcelium_lib/lmb_v10_v3_0_12 \
  "../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/cd1d/hdl/lmb_v10_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/hw2_part2/ip/hw2_part2_dlmb_v10_0/sim/hw2_part2_dlmb_v10_0.vhd" \
  "../../../bd/hw2_part2/ip/hw2_part2_ilmb_v10_0/sim/hw2_part2_ilmb_v10_0.vhd" \
-endlib
-makelib xcelium_lib/lmb_bram_if_cntlr_v4_0_21 \
  "../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/a177/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/hw2_part2/ip/hw2_part2_dlmb_bram_if_cntlr_0/sim/hw2_part2_dlmb_bram_if_cntlr_0.vhd" \
  "../../../bd/hw2_part2/ip/hw2_part2_ilmb_bram_if_cntlr_0/sim/hw2_part2_ilmb_bram_if_cntlr_0.vhd" \
  "../../../bd/hw2_part2/ip/hw2_part2_lmb_bram_0/hw2_part2_lmb_bram_0_sim_netlist.vhdl" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/hw2_part2/ip/hw2_part2_rst_clk_wiz_0_100M_0/sim/hw2_part2_rst_clk_wiz_0_100M_0.vhd" \
  "../../../bd/hw2_part2/ip/hw2_part2_xbar_0/hw2_part2_xbar_0_sim_netlist.vhdl" \
  "../../../bd/hw2_part2/ipshared/e366/hdl/RSA_v1_0_S00_AXI.vhd" \
  "../../../bd/hw2_part2/ipshared/e366/src/modmult.vhd" \
  "../../../bd/hw2_part2/ipshared/e366/src/rsacypher.vhd" \
  "../../../bd/hw2_part2/ipshared/e366/hdl/RSA_v1_0.vhd" \
  "../../../bd/hw2_part2/ip/hw2_part2_RSA_0_0/sim/hw2_part2_RSA_0_0.vhd" \
  "../../../bd/hw2_part2/sim/hw2_part2.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

