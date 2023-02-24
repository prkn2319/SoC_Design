onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc "  -L xpm -L axi_lite_ipif_v3_0_4 -L lib_pkg_v1_0_2 -L lib_srl_fifo_v1_0_2 -L lib_cdc_v1_0_2 -L axi_uartlite_v2_0_31 -L xil_defaultlib -L mdm_v3_2_23 -L microblaze_v11_0_10 -L lmb_v10_v3_0_12 -L lmb_bram_if_cntlr_v4_0_21 -L proc_sys_reset_v5_0_13 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.hw2_part2 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {hw2_part2.udo}

run 1000ns

quit -force
