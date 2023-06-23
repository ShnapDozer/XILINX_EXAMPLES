onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib design_opt

do {wave.do}

view wave
view structure
view signals

do {design.udo}

run -all

quit -force
