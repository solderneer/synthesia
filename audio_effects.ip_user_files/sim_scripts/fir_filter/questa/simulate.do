onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fir_filter_opt

do {wave.do}

view wave
view structure
view signals

do {fir_filter.udo}

run -all

quit -force
