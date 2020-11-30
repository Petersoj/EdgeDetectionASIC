###################################################################

# Created by write_sdc on Mon Nov 30 11:51:31 2020

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_max_area 0
create_clock [get_ports clk_pix]  -period 19.861  -waveform {0 9.9305}
create_clock [get_ports clk]  -period 3  -waveform {0 1.5}
set_clock_groups -asynchronous -name clk_pix_1 -group [get_clocks clk_pix] -group [get_clocks clk]
