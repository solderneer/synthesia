vlib work
vlib riviera

vlib riviera/xbip_utils_v3_0_6
vlib riviera/axi_utils_v2_0_2
vlib riviera/fir_compiler_v7_2_6
vlib riviera/xil_defaultlib

vmap xbip_utils_v3_0_6 riviera/xbip_utils_v3_0_6
vmap axi_utils_v2_0_2 riviera/axi_utils_v2_0_2
vmap fir_compiler_v7_2_6 riviera/fir_compiler_v7_2_6
vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xbip_utils_v3_0_6 -93 \
"../../../ipstatic/xbip_utils_v3_0_6/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_2 -93 \
"../../../ipstatic/axi_utils_v2_0_2/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work fir_compiler_v7_2_6 -93 \
"../../../ipstatic/fir_compiler_v7_2_6/hdl/fir_compiler_v7_2_vh_rfs.vhd" \
"../../../ipstatic/fir_compiler_v7_2_6/hdl/fir_compiler_v7_2.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../audio_effects.srcs/sources_1/ip/fir_filter/sim/fir_filter.vhd" \

