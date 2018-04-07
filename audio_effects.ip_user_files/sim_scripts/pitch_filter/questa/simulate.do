onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib pitch_filter_opt

do {wave.do}

view wave
view structure
view signals

do {pitch_filter.udo}

run -all

quit -force
