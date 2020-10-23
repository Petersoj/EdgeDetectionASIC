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
//Uses integer division so there will be some error, but it shouldn't matter.
//output max is 255
module magnitude(a,b,out);
	input signed[10:0] a,b; //max signed value 4*255=1020
	output[7:0] out; //0-255 output\
	reg[7:0] out;
	reg [10:0] seed; //max 2032 value (2*1020^2)/(2^10)
	wire [20:0] val; //max 21 bit value (signed 1020^2+1020^2)
	reg [2:0] i;

	assign val=a*a+b*b; //a^2+b^2, need to check if valid with signed bits

	always @(val) begin
		if(val!=0) begin
		//TODO calculate location of where MSB=1 and use Val/(2^(MSB/2)) to calculate the seed
			seed=val/4; //could use case statement with different division factors to get closer to result.
						//Larger seed values need to have higher division factors.
						//possible division factor is 2^(n/2) where n is the msb thats a 1 (0010110 -> n=2)
			//4 iterations
			for(i=0;i<4;i=i+1)begin
				seed=seed-(seed*seed-val)/(2*seed); //integer division
			end
			if(seed[10:8]>0) out=8'd255; //magnitude > 255
			else out = seed[7:0];
		end
	end
endmodule
