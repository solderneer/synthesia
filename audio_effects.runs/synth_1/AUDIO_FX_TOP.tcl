# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Auora/Desktop/audio_effects/audio_effects.cache/wt [current_project]
set_property parent.project_path C:/Users/Auora/Desktop/audio_effects/audio_effects.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
add_files C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/sources_1/imports/synthesia-master/sin_lookup.coe
add_files -quiet C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/sources_1/ip/sin_lut/sin_lut.dcp
set_property used_in_implementation false [get_files C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/sources_1/ip/sin_lut/sin_lut.dcp]
add_files -quiet C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/sources_1/ip/fir_filter/fir_filter.dcp
set_property used_in_implementation false [get_files C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/sources_1/ip/fir_filter/fir_filter.dcp]
read_verilog -library xil_defaultlib {
  C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/sources_1/new/butter_filter.v
  C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/sources_1/new/flag_gen.v
  C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/sources_1/new/buffers.v
  C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/sources_1/new/signal_gen.v
  C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/sources_1/new/pitch_shift.v
  C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/sources_1/new/inst_decoder.v
  C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/sources_1/new/serial_rx.v
  C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/sources_1/new/clk_gen.v
  C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/sources_1/new/SPI.v
  C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/sources_1/new/AUDIO_FX_TOP.v
}
read_vhdl -library xil_defaultlib C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/sources_1/imports/audio_effects.srcs/DA2CompRef.vhd
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/constrs_1/imports/Learn/Basys3_Master.xdc
set_property used_in_implementation false [get_files C:/Users/Auora/Desktop/audio_effects/audio_effects.srcs/constrs_1/imports/Learn/Basys3_Master.xdc]


synth_design -top AUDIO_FX_TOP -part xc7a35tcpg236-1


write_checkpoint -force -noxdef AUDIO_FX_TOP.dcp

catch { report_utilization -file AUDIO_FX_TOP_utilization_synth.rpt -pb AUDIO_FX_TOP_utilization_synth.pb }
