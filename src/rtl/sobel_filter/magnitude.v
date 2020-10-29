////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/7/2020
// Module Name: magnitude
// Description: Calculates the magnitude of two integers using Newton's Method.
// Authors: Aaron Pettit
//
////

//sqrt(val)~=a1=a0-(a0^2-val)/2*a0
//iterate 4 times
//output max is 255
//inputs:
//	a - 10 bit signed integer input
//	b - 10 bit signed integer input
//	start - flag to begin magnitude computation
//outputs:
//	out - output magnitude 8 bit 0-255
//	outValid - flag when complete
module magnitude(a,b,start,out,outValid);
	input signed[10:0] 	a; 
	input signed[10:0] 	b; 			//max signed value 4*-255=-1020
	input	wire		start;
	output	reg[7:0]	out; 		//0-255 output
	output 	reg			outValid; 	//1 when magnitude is complete
	reg [10:0] 			seed;		//max 2032 value (2*1020^2)/(2^10)
	wire [20:0] 		val; 		//max 21 bit value (signed 1020^2+1020^2)
	reg 				beginMSB; 	//1 to compute location of MSB
	reg					resetMSB; 	//1 to reset MSB module. Required between each use
	wire				validMSB; 	//1 when MSB is complete
	wire [4:0] 			MSB_Index; 	//index of MSB
	reg [2:0] 			i; 			//used in for loop

	assign val=a*a+b*b; //a^2+b^2, need to check if valid with signed bits
	positionOfMSB iMSB
		(.data			(val),
		 .start			(beginMSB),
		 .reset			(resetMSB),
		 .msbIndex		(MSB_Index),
		 .msbValid		(validMSB)
		 );
		 
	always @(posedge start) begin
		//resetMSB <= 0;
		beginMSB <= 1;
		outValid <= 0;
	end
	
	always @(posedge validMSB) begin
	
		//resetMSB = 1;
		beginMSB = 0;
		if(val==0) begin
			out = 8'b0;
		end
		else begin
			//Set initial seed to an estimated magnitude value. Divide original value by 2^(MSB_Index/2) where MSB_Index is highest bit that is a 1. This calculation will get the seed close enough for minimal interations
			//MSB_Index = MSB_Index / 2;
			seed=val >> (MSB_Index >> 1); 
			
			//4 iterations needed to get within a few pixel values
			for(i=0;i<4;i=i+1)begin
				seed=seed-(seed*seed-val)/(2*seed); //Newton's Method
			end
			
			if(seed[10:8]>0) out=8'd255; //magnitude > 255
			else out = seed[7:0];
		end
		outValid = 1;
		
	end
endmodule

//requires 16 clock cycles
// module magnitude_new(a,b,start,clk,out,done);

// assign val=a*a+b*b;

// always @(posedge clk, posedge reset) begin
	// if(reset) begin
	
	// end
	// else if(start) begin
		// if(active)begin
			// q <= {q[14:0],!r[17]); //old r
			// if(r[17]==1) //add if r is negative
				// r <= left + right;	//uses old left and right values
			// else
				// r <= left - right;
				
			// right <={q,r[17],1'b1};
			// left <= {r[15:0],a[31:30]};
			// a <= {a[29:0],2'b00};	//left shift by 2 bits
			
			// if(cycle==0) begin
				// active<=0;
				// done<=1;
			// end
				
			// cycle <= cycle - 5'd1;
		// end
		// else if(done) begin
			// out<=q;
		// end
		// else begin
			// //initialize variables
			// a<=val;
			// q<=0;
			// i<=0;
			// left<=0;
			// right<=0;
			// r<=0;
			// active<=1;
			// done<=0;
			// cycle<= 5'd15;
		// end
	// end
	
// end

// endmodule

//Design and Implementation of Modified Non-Restoring Square Root Calculator Based on Verilog HDL
//International Journal of Scientific Engineering and Technology Research
//Volume.03, IssueNo.09, May-2014, Pages: 1694-1697

module sqrt #(parameter DATA_WIDTH= 20,	ANSWER_WIDTH= 8,TRIAL_WIDTH = 8 )
(clk,data,start,answer,done);
	input clk;
	input start;
	input wire[DATA_WIDTH-1:0] data; 
	output reg [ANSWER_WIDTH-1:0] answer; 
	output done;
	reg busy; 
	reg [2:0] bit; 				//number of clock cycles
	wire [TRIAL_WIDTH-1:0] trial;
	
	assign trial = answer | (1 << bit);
	
	always @ (posedge clk) begin
		if (busy) begin
			if (bit == 0) busy <= 0;
			else bit <= bit - 1;
			if (trial*trial <= data)
				answer <= trial;
		end
		else if (start) begin
			busy <= 1;
			answer <= 0;
			bit <= 7; 
		end
	end
	
	assign done = ~busy;
endmodule

////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/23/2020
// Module Name: positionOfMSB
// Description: Calculates the index of the MSB that is a 1 in the given data.
// Authors: Aaron Pettit
//
////

//
//inputs:
//	data - 21 bit integer
//	start - flag to start the computation on posedge
//	reset - flag to reset location and valid flag. Reset is required before next use.
//outputs:
//	msbIndex - output 5 bit integer with the location of the MSB
//	msbValid - flag when computation is finished
module positionOfMSB(data,start,reset,msbIndex,msbValid);
	input [20:0]		data;
	input 				start;
	input				reset;
	output	reg[4:0] 	msbIndex; //location of the highest order 1.
	output 	reg 		msbValid; //output flag when finished
	integer 			i;
	
	always @(posedge start, posedge reset) begin
		if (reset) begin
			msbIndex = 0;
			msbValid = 0;
		end
		else if (start) begin
			msbIndex = 0;
			msbValid = 0;
			//exit if data=0, otherwise compute MSB
			if(data==20'b0) begin
				msbValid =1;
			end
			else begin
				//start from the end of the array check if MSB bit is a 1
				for (i = 20; i >= 0; i = i - 1) begin
					if (data[i] == 1 && msbValid!=1) begin
						msbIndex = i;
						msbValid = 1;
					end
				end
				//could also just use lookup table 
				/*case (data)
					21b'1_xxxx_xxxx_xxxx_xxxx_xxxx: msbIndex <= 5'd20;
					.
					.
					.
				*/
			end
			
		end
		
	end
endmodule
