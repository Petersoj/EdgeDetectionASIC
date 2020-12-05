# The period has to be changed to see if the design can meet the timing constraint
#Same for the clk_name when using a different design.
set pix_clk_period 19.861
#need 6 clock cycles between pixels, slowest speed: 3.31
set logic_clk_period 3 

set clk_name I_PCLK
set clk_name_fast I_CORE_CLK

#  Define the name of the top module to be synthesized.
set design edge_detection_top

# Define the directory paths
set BASE_DIR	 	[pwd]
set RPT_DIR         "${BASE_DIR}/RPT/Edge_RPT"
set RTL_DIR 	 	"${BASE_DIR}/HDL/Edge_RTL"
set GATE_DIR 	 	"${BASE_DIR}/HDL/Edge_RTL/GATE"
set SDF_DIR 	 	"${BASE_DIR}/SDF/Edge_SDF"
set SDC_DIR 	 	"${BASE_DIR}/SDC/Edge_SDC"
set DDC_DIR 	 	"${BASE_DIR}/DDC/Edge_DDC"
set DESIGN_LIB	    "${BASE_DIR}/DESIGN_LIBS/$design"

# Define the verilog file list.
set HDL_FILES [subst {$RTL_DIR/edge_detection_top.v $RTL_DIR/sobel_filter/sobel.v $RTL_DIR/video_timing_gen/video_timing_gen.v $RTL_DIR/colorspace/buffered_matrix3_colorspace_converter.v $RTL_DIR/colorspace/frame_buffer.v $RTL_DIR/colorspace/frame_buffer_matrix3.v $RTL_DIR/colorspace/grayscale.v}]

# Create the directories if they do no exist
exec mkdir -p $RPT_DIR
exec mkdir -p $DDC_DIR
exec mkdir -p $SDF_DIR
exec mkdir -p $SDC_DIR
exec mkdir -p $DESIGN_LIB

#  Start from fresh state
remove_design -designs

#Define a design library specific to the current design. Otherwise, when runing 2 synthesis in parallel, intermediate files get mixed.
define_design_lib $design -path $DESIGN_LIB

#  Analyze the Verilog sources
puts "-i- Analyze Verilog sources"
puts $HDL_FILES
analyze -format verilog $HDL_FILES -library $design

#  Elaborate the design
puts "-i- Elaborate design"
elaborate ${design} -library $design

#  Save the elaborated design
puts "-i- Save elaborated design"
write -hierarchy -format ddc -output ${DDC_DIR}/${design}_elab.ddc

#  Link the design
puts "-i- Linking the design"
link

#  Define constraints
puts "-i- Define constraints"
puts "-i- set_max_area 0"
puts "-i- set_clock"
set_max_area 0
create_clock -name $clk_name -period $pix_clk_period $clk_name
create_clock -name $clk_name_fast -period $logic_clk_period $clk_name_fast
set_clock_groups -asynchronous -group $clk_name -group $clk_name_fast

#Check the design for warnings
check_design

#  Do not ungroup the hierarchy
set_ungroup [get_designs *] false

#  Map and optimize the design
puts "-i- Map and optimize design"
compile

#  Save the mapped design
puts "-i- Save mapped design"
write -hierarchy -format ddc -output ${DDC_DIR}/${design}_mapped.ddc

#  Generate reports
puts "-i- Generate reports"
report_constraint -nosplit -all_violators > ${RPT_DIR}/${design}_mapped_allviol.rpt
report_area > ${RPT_DIR}/${design}_mapped_area.rpt
report_timing > ${RPT_DIR}/${design}_mapped_timing.rpt
report_power -nosplit -analysis_effort low > ${RPT_DIR}/${design}_mapped_power.rpt

#  Generate the Verilog netlist
puts "-i- Generate Verilog netlist"
write_file -format verilog -hierarchy -output ${GATE_DIR}/${design}_mapped.v

#  Generate the design constraint file
puts "-i- Generate SDC design constraint file"
write_sdc -nosplit ${SDC_DIR}/${design}_mapped.sdc

#  Generate the sdf file
puts "-i- Generate the SDF file"
write_sdf -version 2.1 ${SDF_DIR}/${design}_mapped.sdf

puts "-i- Finished"
