if ![file exists work] {
    vlib work
}

vlog -f run_gate.f
vsim -voptargs=+acc top
do wave_gate.do
run 100 
run -continue