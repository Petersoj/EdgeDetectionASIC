###################################################################

# Created by write_sdc on Fri Dec 4 17:55:23 2020

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_max_area 4000000
create_clock [get_ports I_PCLK]  -period 39.722  -waveform {0 19.861}
create_clock [get_ports I_CORE_CLK]  -period 6  -waveform {0 3}
set_clock_groups -asynchronous -name I_PCLK_1 -group [get_clocks I_PCLK] -group [get_clocks I_CORE_CLK]
