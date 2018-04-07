vlib work
vlib activehdl

vlib activehdl/xbip_utils_v3_0_6
vlib activehdl/axi_utils_v2_0_2
vlib activehdl/fir_compiler_v7_2_6
vlib activehdl/xil_defaultlib

vmap xbip_utils_v3_0_6 activehdl/xbip_utils_v3_0_6
vmap axi_utils_v2_0_2 activehdl/axi_utils_v2_0_2
vmap fir_compiler_v7_2_6 activehdl/fir_compiler_v7_2_6
vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xbip_utils_v3_0_6 -93 \
"../../../ipstatic/xbip_utils_v3_0_6/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_2 -93 \
"../../../ipstatic/axi_utils_v2_0_2/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work fir_compiler_v7_2_6 -93 \
"../../../ipstatic/fir_compiler_v7_2_6/hdl/fir_compiler_v7_2_vh_rfs.vhd" \
"../../../ipstatic/fir_compiler_v7_2_6/hdl/fir_compiler_v7_2.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../audio_effects.srcs/sources_1/ip/pitch_filter/sim/pitch_filter.vhd" \

