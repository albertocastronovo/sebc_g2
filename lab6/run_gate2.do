if ![file exists work] {
    vlib work
}

vlog -f run_gate2.f
vsim -voptargs=+acc top
do wave_gate2.do
run 100 
run -continue