onerror {quit -f}
vlib work
vlog -work work riscv-fpga.vo
vlog -work work riscv-fpga.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.adder64_vlg_vec_tst
vcd file -direction riscv-fpga.msim.vcd
vcd add -internal adder64_vlg_vec_tst/*
vcd add -internal adder64_vlg_vec_tst/i1/*
add wave /*
run -all
