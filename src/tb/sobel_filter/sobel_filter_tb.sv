////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/26/2020
// Module Name: sobel_filter_tb
// Description: Testbench for computing the sobel filter image
// Authors: Jacob Peterson, Daryl Warner, Trent Bennet, Aaron Pettit
//
////

`timescale 1 ps / 1 ps
`define H_PIXELS  640
`define V_LINES   480

module sobel_filter_tb();
	logic [2000:0]  in_vector_file_name =   "D:/Workspace/EdgeDetectionASIC/vectors/metal.ppm";			//temporary, set to "../../vectors/rocks.ppm"
	logic [2000:0]  out_vector_file_name =  "D:/Workspace/EdgeDetectionASIC/vectors/metal_edge_detection.pgm";	//temporary, set to "../../vectors/rocks_edge_detection.pgm"
	logic [7:0] 	pixel_input_data[`V_LINES][`H_PIXELS];
	logic [7:0] 	pixel_output_data[`V_LINES][`H_PIXELS];
	logic [63:0]	sobel_input;
	logic [7:0]		sobel_output;
	logic			sobel_reset;
	logic			clk_pix;
	logic			clk;
	logic			pixel_finished;
	logic			start;
	logic [9:0]		row;
	logic [9:0]		col;
	
	
	//clock 25.175 MHz
	initial clk_pix=1'b1; //start with slight delay
	always begin
		#19861 clk_pix=!clk_pix;
	end
	//system clock 302.1 MHz
	initial clk = 1'b1;
	always begin
		#3310 clk=!clk;
	end
	

	sobel_blackBorder iSobel
	(
		.row			(row),
		.col			(col),
		.inputPixels		(sobel_input),
		.clk_pix		(clk_pix),
		.clk			(clk),
		.start			(start),
		.out			(sobel_output),
		.done			(pixel_finished)
	);
	
	initial begin
		$display("================================================================");
		$display("========================== BEGIN SIM ===========================");
		$display("================================================================");
		
		tb_init;
		sobel_test;
		write_ppm_file(out_vector_file_name, pixel_output_data);
		$display("================================================================");
		$display("=========================== END SIM ============================");
		$display("================================================================");
	end

	task tb_init;
	    begin
	      read_ppm_file(in_vector_file_name, pixel_input_data);
	    end
	endtask

	task sobel_test; 
	begin
		$display("+++ sobel filter start");
		start=1;
		for(row=0; row < `V_LINES; row++) begin
			for(col=0; col < `H_PIXELS; col++) begin
				sobel_input = {pixel_input_data[row-1][col-1],
					pixel_input_data[row-1][col],
					pixel_input_data[row-1][col+1],
					pixel_input_data[row][col-1],
					pixel_input_data[row][col+1],
					pixel_input_data[row+1][col-1],
					pixel_input_data[row+1][col],
					pixel_input_data[row+1][col+1] };
				@(posedge pixel_finished);
				pixel_output_data[row][col]=sobel_output;
				

			end
		end
		$display("--- sobel filter end");
	end
	endtask
	
	task read_ppm_file
	(
		input   [2000:0]  file_name,
		output  [7:0]    pixel_data[`V_LINES][`H_PIXELS]
	);
	begin
		string temp;
		integer fd, r;
		reg [7:0] pix_r, pix_g, pix_b;
		reg [11:0] pixel_count, line_count, pixel_depth;
		$display("+++ read_ppm_file");
		fd = $fopen(file_name, "r");
		// Strip off the header from file
		$fgets(temp, fd); // Read the 'P3'
		// Read the number of pixels, number of lines, pixel depth
		r = $fscanf(fd, "%d %d %d", pixel_count, line_count, pixel_depth);
		$display("Number of Pixels - %0d", pixel_count);
		$display("Number of Lines  - %0d", line_count);
		$display("Color depth      - %0d", pixel_depth);

		for(int i = 0; i < line_count; i++) begin
			for(int j = 0; j < pixel_count; j++) begin
				r = $fscanf(fd, "%d", pix_r);
				r = $fscanf(fd, "%d", pix_g);
				r = $fscanf(fd, "%d", pix_b);
				pixel_data[i][j] = (114*pix_r + 587*pix_g + 299*pix_b)/1000;
			end
		end
		$fclose(fd);
		$display("--- read_ppm_file (Read File Done)");
	end
	endtask

	task write_ppm_file
    (
      input   [2000:0]  file_name,
      input   [7:0]    pixel_data[`V_LINES][`H_PIXELS]
    );
    begin
		integer fd;
		$display("+++ write_pgm_file");
		fd = $fopen(file_name, "w");
		$fwrite(fd, "P2\n640 480\n255\n");
		for(int i = 0; i < `V_LINES; i++) begin
			for(int j = 0; j < `H_PIXELS; j++) begin
				$fwrite(fd, "%d\n", pixel_data[i][j]);
			end
		end
		$fclose(fd);
		$display("--- write_ppm_file");
    end
	endtask
endmodule