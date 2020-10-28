////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/26/2020
// Module Name: magnitude_tb
// Description: Testbench for computing the magnitude or square root
// Authors: Jacob Peterson, Daryl Warner, Trent Bennet, Aaron Pettit
//
////

`timescale 1 ps / 1 ps

module magnitude_tb();
	reg signed [10:0] 	value1;
	reg signed [10:0]	value2;
	logic [7:0]		outValue;
	logic			clk;
	logic			mag_done;
	int			i;
	
	//clock
	initial clk = 0'b1;
	always begin
		#19861 clk = !clk;
	end

	magnitude MAG(
		.a		(value1),
		.b		(value2),
		.start		(clk),
		.out		(outValue),
		.outValid	(mag_done)
	);

	initial begin
		$display("================================================================");
		$display("========================== BEGIN SIM ===========================");
		$display("================================================================");
		
		tb_init;
		mag_test;
		
		$display("================================================================");
		$display("=========================== END SIM ============================");
		$display("================================================================");
	end
	
	task tb_init;
		begin
			value1 = 1;
			value2 = 1;		
		end
	endtask
	
	task mag_test; 
		begin
			//test some pos and neg values
			for(i=0; i<5;i=i+1) begin
				@(posedge mag_done);
				$display("Magnitude of %0d and %0d is %0d [max of 255]", value1,value2,outValue);
				value1=value1*7;
				value2=value2*-9;
			end
			//254
			value1=180;
			value2=179;
			@(posedge mag_done);
			$display("Magnitude of %0d and %0d is %0d [max of 255]", value1,value2,outValue);
			$display("	Expected value: 253.8");
			
			//max value from the filter
			value1=1020;
			value2=1020;
			@(posedge mag_done);
			$display("Magnitude of %0d and %0d is %0d [max of 255]", value1,value2,outValue);
			
			//max neg value from filter
			value1=-1020;
			value2=-1020;
			@(posedge mag_done);
			$display("Magnitude of %0d and %0d is %0d [max of 255]", value1,value2,outValue);
			
			//zero value
			value1=0;
			value2=0;
			@(posedge mag_done);
			$display("Magnitude of %0d and %0d is %0d [max of 255]", value1,value2,outValue);
			
			
		end
	endtask
	

endmodule