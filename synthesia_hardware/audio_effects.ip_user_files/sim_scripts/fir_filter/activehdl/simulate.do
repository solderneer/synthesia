onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+fir_filter -L secureip -L xbip_utils_v3_0_6 -L axi_utils_v2_0_2 -L fir_compiler_v7_2_6 -L xil_defaultlib -O5 xil_defaultlib.fir_filter

do {wave.do}

view wave
view structure
view signals

do {fir_filter.udo}

run -all

endsim

quit -force
