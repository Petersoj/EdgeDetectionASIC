//magnitude of two integers using Newton's Method.
//sqrt(val)~=a_1=a_0-(a_0^2-val)/(2*a_0)
//iterate 4 times
//output max is 255
//inputs:
//	a - 10 bit signed integer input
//	b - 10 bit signed integer input
//	start - flag to begin magnitude computation
//outputs:
//	out - output magnitude 0-255
//	outValid - flag when complete
module magnitude(a,b,start,out,outValid);
	input signed[10:0] 	a; 
	input signed[10:0] 	b; //max signed value 4*-255=-1020
	input	wire		start;
	output	reg[7:0]	out; //0-255 output
	output 	reg			outValid; //1 when magnitude is complete
	reg [10:0] 			seed; //max 2032 value (2*1020^2)/(2^10)
	wire [20:0] 		val; //max 21 bit value (signed 1020^2+1020^2)
	reg 				beginMSB; //1 to compute location of MSB
	reg					resetMSB; //1 to reset MSB module. Required between each use
	wire				validMSB; //1 when MSB is complete
	reg [4:0] 			MSB_Index; //index of MSB
	reg [2:0] 			i; //used in for loop

	assign val=a*a+b*b; //a^2+b^2, need to check if valid with signed bits
	positionOfMSB iMSB
		(.data			(val),
		 .start			(beginMSB),
		 .reset			(resetMSB),
		 .msbLocation	(MSB_Index),
		 .msbValid		(validMSB)
		 );
		 
	always @(posedge start) begin
		resetMSB <= 0;
		beginMSB <= 1;
		outValid <= 0;
	end
	
	always @(posedge validMSB) begin
	
		resetMSB = 1;
		beginMSB = 0;
		if(val==0) begin
			out = 8'b0;
		end
		else begin
			//Set initial seed to an estimated magnitude value. Divide original value by 2^(MSB_Index/2) where MSB_Index is highest bit that is a 1. This calculation will get the seed close enough for minimal interations
			MSB_Index = MSB_Index / 2;
			seed=val >> MSB_Index; 
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

//Calculates the location of the MSB that is a 1 in the given data.
//inputs:
//	data - 21 bit integer
//	start - flag to start the computation on posedge
//	reset - flag to reset location and valid flag. Reset is required before next use.
//outputs:
//	msbLocation - output 5 bit integer with the location of the MSB
//	msbValid - flag when computation is finished
module positionOfMSB(data,start,reset,msbLocation,msbValid);
	input [20:0]		data;
	input 				start;
	input				reset;
	output	reg[4:0] 	msbLocation; //location of the highest order 1.
	output 	reg 		msbValid; //output flag when finished
	integer i;
	
	always @(posedge start, posedge reset) begin
		if (reset) begin
			msbLocation <= 0;
			msbValid <= 0;
		end
		else if (start) begin
			//exit if data=0, otherwise compute MSB
			if(data==20'b0) begin
				msbValid <=1;
			end
			else begin	
				for (i = 20; i >= 0; i = i - 1) begin
					if (data[i] == 1) begin
						msbLocation <= i;
						msbValid <= 1;
					end
				end
			end
		end
	end
endmodule