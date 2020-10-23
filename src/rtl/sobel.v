////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/7/2020
// Module Name: Sobel
// Description: Compute the sobel filter at given pixel location.
// Authors: Aaron Pettit
//
////

//This version tracks which edge the pixel is on and adjusts calculations accordingly
//inputs: row - row number starting from the top at 0
//	  col - column number starting from the left at 0
//	  clk - input clock. Pixel computed on rising edge
//output: out - filtered pixel at given [row,col]
module Sobel(row,col,clk,out);
	input [9:0] row, col;
	input clk;
	output [7:0] out; //0-255 edge value
	reg[7:0] out;
	reg signed[15:0] gx,gy;
	reg [7:0] inputPixel[8:0]; //pixel values in the order row1(col1-3),row2(col1-3),row3(col1-3)
	reg[7:0] val; //0-255 grey value
	reg memoryReady;
	wire[15:0] magnitudeVal; //sqrt value. Find out max number of bits needed for this.
	parameter maxRow = 480;
	parameter maxCol = 640;

	//flipped sobel filters
	//	  -1 0 1	  -1 -2 -1
	//hx= -2 0 2  hy=  0  0  0
	//	  -1 0 1	   1  2  1

	always @(posedge clk) begin
		gx=0;
		gy=0;
		memoryReady=0;
	//get surrounding pixels from memory

	//using pixel[i][j] for surrounding pixels

		memoryReady=1;
	end

	always @(posedge memoryReady) begin
	//compute filter
	//Note: could also be done with a case statement saying if pixel is on the edge/corner and which edge/corner
	//
	//	another simpler way can be to just make the output border black and only compute edge detection
	//	when all surrounding pixel values are valid
		if(col>0) begin //col 1 valid
			if(row>0)begin //row 1 col 1
				val=inputPixel[row-1][col-1];
				gx=gx-1*val;
				gy=gy-1*val;
			end
			gx=gx-2*inputPixel[row][col-1]; //row 2 col 1
			if(row<maxRow-1)begin //row 3 col 1
				val=inputPixel[row+1][col-1];
				gx=gx-1*val;
				gy=gy+1*val;
			end
		end
		else if(col<maxCol-1) begin //col 3 valid
			if(row>0) begin //row 1 col 3
				val=inputPixel[row-1][col+1];
				gx=gx+1*val;
				gy=gy-1*val;
			end
			gx=gx+2*inputPixel[row][col+1]; //row 2 col 3
			if(row<maxRow-1) begin //row 3 col 3
				val=inputPixel[row+1][col+1];
				gx=gx+1*val;
				gy=gy+1*val;
			end
		end

		if(row>0) gy=gy-2*inputPixel[row-1][col];//row 1 col 2
		if(row<maxRow-1) gy=gy-2*inputPixel[row+1][col]; //row 3 col 2

		magnitude(gx,gy,magnitudeVal);
	end

	//magnitude has been computed.
	always @(magnitudeVal) begin
		//uses a threshold of 128. This helps to remove noise where the filter resulted in a low non-zero value.
		if(magnitudeVal[7]) begin //result is greater than 127, set output to white.
			out=8'd255;
		end
		else begin
			out=8'd0;
		end
	end

endmodule


//Compute the sobel filter at given pixel location
//alternative sobel filter without bound checking and just makes the border black
//inputs: row - row number starting from the top at 0
//	  col - column number starting from the left at 0
//	  clk - input clock. Pixel computed on rising edge
//output: out - filtered pixel at given [row,col]
module sobel_blackBorder(row,col,clk,out);
	input [9:0] row, col;
	input clk;
	output [7:0] out; //0-255 edge value
	reg [7:0] out;
	reg [7:0] inputPixels[8:0]; //pixel values in the order row1(col1-3),row2(col1-3),row3(col1-3)
	wire[7:0] val; //0-255 grey value
	reg signed [10:0] gx,gy; //range of gx,gy [-1020 : 1020]
	wire[7:0] magnitudeVal; //value of the sqrt capped at 255
	wire onEdge;
	reg memoryReady;
	parameter maxRow = 480;
	parameter maxCol = 640;

	//determine if center pixel is on the border
	assign onEdge = row==0 || row==maxRow-1 || col==0 || col==maxCol-1;

	//get inputPixels[] from memory, could get from memory at posedge of clk, then a ready signal for another always@ block

	//flipped sobel filters
	//	  -1 0 1	  -1 -2 -1
	//hx= -2 0 2  hy=  0  0  0
	//	  -1 0 1	   1  2  1

	always @(posedge clk)begin
		if(onEdge) begin
			out = 8'd0;
		end
		else begin
			memoryReady=0;
			//TODO get inputPixels[] from memory

			memoryReady=1;
		end
	end

	always @(posedge memoryReady) begin
			/* gx11 <= -1*inputPixels[0];	//row 1
			gy11 <= -1*inputPixels[0];
			gy12 <= -2*inputPixels[1];
			gx13 <= 1*inputPixels[2];
			gy13 <= -1*inputPixels[2];
			gx21 <= -2*inputPixels[3];		//row 2
			gx23 <= 2*inputPixels[5];
			gx31 <= -1*inputPixels[6];		//row 3
			gy31 <= inputPixels[6];
			gy32 <= 2*inputPixels[7];
			gx33 <= inputPixels[8];
			gy33 <= inputPixels[9];
			//can this be done in parallel?
			gx <= gx11 + gx13 + gx21 + gx23 + gx31 + gx33;
			gy <= gy11 + gy12 + gy13 + gy31 + gy32 + gy33; //is this valid when using "<=" in the same block as computing gy11?
			*/
			gx <= -inputPixels[0] + inputPixels[2] - 2*inputPixels[3] + 2*inputPixels[5] - inputPixels[6] + inputPixels[8];
			gy <= -inputPixels[0] - 2*inputPixels[1] - inputPixels[2] + inputPixels[6] + 2*inputPixels[7] + inputPixels[8];
			magnitude(gx,gy,magnitudeVal);

	end

	//magnitude has been computed.
	always @(magnitudeVal) begin
		//uses a threshold of 128. This helps to remove noise where the filter resulted in a low non-zero value.
		if(magnitudeVal[7]) begin //result is greater than 127, set output to white.
			out=8'd255;
		end
		else begin
			out=8'd0;
		end
	end
endmodule
