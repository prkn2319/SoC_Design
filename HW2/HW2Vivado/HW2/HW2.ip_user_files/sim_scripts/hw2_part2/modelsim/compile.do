vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/lib_pkg_v1_0_2
vlib modelsim_lib/msim/lib_srl_fifo_v1_0_2
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/axi_uartlite_v2_0_31
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/mdm_v3_2_23
vlib modelsim_lib/msim/microblaze_v11_0_10
vlib modelsim_lib/msim/lmb_v10_v3_0_12
vlib modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_21
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13

vmap xpm modelsim_lib/msim/xpm
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_pkg_v1_0_2 modelsim_lib/msim/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 modelsim_lib/msim/lib_srl_fifo_v1_0_2
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap axi_uartlite_v2_0_31 modelsim_lib/msim/axi_uartlite_v2_0_31
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap mdm_v3_2_23 modelsim_lib/msim/mdm_v3_2_23
vmap microblaze_v11_0_10 modelsim_lib/msim/microblaze_v11_0_10
vmap lmb_v10_v3_0_12 modelsim_lib/msim/lmb_v10_v3_0_12
vmap lmb_bram_if_cntlr_v4_0_21 modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_21
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/7698" "+incdir+../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/ec67/hdl" \
"E:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"E:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"E:/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work axi_lite_ipif_v3_0_4  -93  \
"../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_pkg_v1_0_2  -93  \
"../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2  -93  \
"../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2  -93  \
"../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_31  -93  \
"../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/67a1/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/hw2_part2/ip/hw2_part2_axi_uartlite_0_0/sim/hw2_part2_axi_uartlite_0_0.vhd" \
"../../../bd/hw2_part2/ip/hw2_part2_clk_wiz_0_0/hw2_part2_clk_wiz_0_0_sim_netlist.vhdl" \

vcom -work mdm_v3_2_23  -93  \
"../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/b8f4/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/hw2_part2/ip/hw2_part2_mdm_1_0/sim/hw2_part2_mdm_1_0.vhd" \

vcom -work microblaze_v11_0_10  -93  \
"../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/1f7b/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/hw2_part2/ip/hw2_part2_microblaze_0_0/sim/hw2_part2_microblaze_0_0.vhd" \

vcom -work lmb_v10_v3_0_12  -93  \
"../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/cd1d/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/hw2_part2/ip/hw2_part2_dlmb_v10_0/sim/hw2_part2_dlmb_v10_0.vhd" \
"../../../bd/hw2_part2/ip/hw2_part2_ilmb_v10_0/sim/hw2_part2_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_21  -93  \
"../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/a177/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/hw2_part2/ip/hw2_part2_dlmb_bram_if_cntlr_0/sim/hw2_part2_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/hw2_part2/ip/hw2_part2_ilmb_bram_if_cntlr_0/sim/hw2_part2_ilmb_bram_if_cntlr_0.vhd" \
"../../../bd/hw2_part2/ip/hw2_part2_lmb_bram_0/hw2_part2_lmb_bram_0_sim_netlist.vhdl" \

vcom -work proc_sys_reset_v5_0_13  -93  \
"../../../../HW2.gen/sources_1/bd/hw2_part2/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/hw2_part2/ip/hw2_part2_rst_clk_wiz_0_100M_0/sim/hw2_part2_rst_clk_wiz_0_100M_0.vhd" \
"../../../bd/hw2_part2/ip/hw2_part2_xbar_0/hw2_part2_xbar_0_sim_netlist.vhdl" \
"../../../bd/hw2_part2/ipshared/e366/hdl/RSA_v1_0_S00_AXI.vhd" \
"../../../bd/hw2_part2/ipshared/e366/src/modmult.vhd" \
"../../../bd/hw2_part2/ipshared/e366/src/rsacypher.vhd" \
"../../../bd/hw2_part2/ipshared/e366/hdl/RSA_v1_0.vhd" \
"../../../bd/hw2_part2/ip/hw2_part2_RSA_0_0/sim/hw2_part2_RSA_0_0.vhd" \
"../../../bd/hw2_part2/sim/hw2_part2.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

