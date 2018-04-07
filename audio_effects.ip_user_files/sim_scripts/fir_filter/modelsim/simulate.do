onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L secureip -L xbip_utils_v3_0_6 -L axi_utils_v2_0_2 -L fir_compiler_v7_2_6 -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.fir_filter

do {wave.do}

view wave
view structure
view signals

do {fir_filter.udo}

run -all

quit -force
