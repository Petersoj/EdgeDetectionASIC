onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group tb /edge_detection_top_tb/reset
add wave -noupdate -expand -group tb /edge_detection_top_tb/clk_100
add wave -noupdate -expand -group tb /edge_detection_top_tb/istrb_clk_100
add wave -noupdate -expand -group DUT /edge_detection_top_tb/DUT/I_RST
add wave -noupdate -expand -group DUT /edge_detection_top_tb/DUT/I_CLK_100
add wave -noupdate -expand -group DUT /edge_detection_top_tb/DUT/I_PIX_DATA
add wave -noupdate -expand -group DUT /edge_detection_top_tb/DUT/I_VSYNC
add wave -noupdate -expand -group DUT /edge_detection_top_tb/DUT/I_HSYNC
add wave -noupdate -expand -group DUT /edge_detection_top_tb/DUT/I_DE
add wave -noupdate -expand -group DUT /edge_detection_top_tb/DUT/I_PCLK
add wave -noupdate -expand -group DUT /edge_detection_top_tb/DUT/O_PIX_DATA
add wave -noupdate -expand -group DUT /edge_detection_top_tb/DUT/O_VSYNC
add wave -noupdate -expand -group DUT /edge_detection_top_tb/DUT/O_HSYNC
add wave -noupdate -expand -group DUT /edge_detection_top_tb/DUT/O_DE
add wave -noupdate -expand -group DUT /edge_detection_top_tb/DUT/O_PCLK
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 140
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {10500 ns}
