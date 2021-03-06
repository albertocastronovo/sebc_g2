onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/dut/a
add wave -noupdate /top/dut/b
add wave -noupdate /top/dut/ci
add wave -noupdate /top/dut/sum
add wave -noupdate /top/dut/co
add wave -noupdate /top/dut/n1
add wave -noupdate /top/dut/n2
add wave -noupdate /top/dut/n3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ns} {1 us}