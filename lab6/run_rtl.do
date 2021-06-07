if ![file exists work] {
    vlib work
}
vlog -f run_rtl.f
vsim -voptargs=+acc top
do wave_rtl.do
run 100 
run -continue