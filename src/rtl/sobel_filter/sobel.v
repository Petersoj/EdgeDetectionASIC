////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/7/2020
// Module Name: sobel_blackBorder
// Description: Compute the sobel filter at given pixel location
// Authors: Aaron Pettit
//
////

//inputs:
//	row - row number starting from the top at 0
//	col - column number starting from the left at 0
//	inputPixels - 64 bit array holding the 3x3 input pixels. Must be passed in as one large array with the 8 bit pixels combined.
//		format: {top_left,top,top_right,mid_left,mid_right,bot_left,bot,bot_right}
//		
//	clk - input clock. Pixel computed on rising edge
//	reset - set to high to reset internal flags. Required before next clock cycle.
//outputs:
//	out - filtered pixel at given [row,col]
//	sobelFinished - set to 1 when the output is ready to be read
module sobel_blackBorder(row,col,inputPixels,clk,reset,out,sobelFinished);
	input 	wire [9:0] 	row;			//row number of output pixel
	input	wire [9:0]	col;			//column number of output pixel
	input 	wire [63:0] inputPixels; 	//Surrounding 8 bit pixel values combined. 
										//format:
										//	{top_left, top, top_right,
										//	 mid_left, 		mid_right,
										//	 bot_left, bot,	bot_right}
	input 	wire		clk;			//pixel clock (25.175 MHz)
	input	wire		reset;			//set to 1 to reset internal variables		
	output 	reg	[7:0]	out;		 	//0,255 sobel pixel value
	output	reg			sobelFinished;	//set to 1 when pixel is complete
	
	//variables
	reg signed [10:0]	gx;				//output of horizontal filter range:[-1020:1020]
	reg signed [10:0]	gy	;		 	//output of vertical filter range:[-1020 : 1020]
	wire [7:0]			magnitudeVal;	//value of the sqrt capped at 255
	wire [7:0]			pixelArray [7:0]; //array used to separate input pixel values
	
	//flags
	wire 				onEdge;			//1 if the output pixel is on the edge of the image
	reg					startMag;		//1 to compute the magnitude
	wire				magFinished;	//1 when magnitdue has been computed
	
	//parameters
	parameter [8:0]		MAX_ROW = 480;	//horizontal image dimension
	parameter [9:0]		MAX_COL = 640;	//vertical image dimension
	
	//flipped sobel filters
	//	  -1 0 1	  -1 -2 -1
	//hx= -2 0 2  hy=  0  0  0
	//	  -1 0 1	   1  2  1
	parameter 			HX_11 	= -1;
	parameter			HX_13	= 1;
	parameter			HX_21	= -2;
	parameter			HX_23	= 2;
	parameter			HX_31	= -1;
	parameter			HX_33	= 1;
	
	parameter			HY_11	= -1;
	parameter			HY_12	= -2;
	parameter			HY_13	= -1;
	parameter			HY_31	= 1;
	parameter			HY_32	= 2;
	parameter			HY_33	= 1;
	

	//compute if center pixel is on the border
	assign onEdge = (row==0) || (row==MAX_ROW-1) || (col==0) || (col==MAX_COL-1);
	assign {pixelArray[7],pixelArray[6],pixelArray[5],pixelArray[4],pixelArray[3],pixelArray[2],pixelArray[1],pixelArray[0]} = inputPixels;
	magnitdue Mag
		(.a			(gx),
		 .b			(gy),
		 .start 	(startMag),
		 .out		(magnitudeVal),
		 .outValid	(magFinished)
		 );
		 
	always @(posedge reset) begin
		startMag<=0;
		sobelFinished<=0;
	end
		 
	//calculate horizontal and vertical filters
	always @(posedge clk)begin
		if(onEdge) begin
			out <= 8'd0;
			sobelFinished<=1;
		end
		else begin
			gx <= HX_11*pixelArray[0] + HX_13*pixelArray[2] 
				+ HX_21*pixelArray[3] + HX_23*pixelArray[4] 
				+ HX_31*pixelArray[5] + HX_33*pixelArray[7];
			gy <= HY_11*pixelArray[0] + HY_12*pixelArray[1] + HY_13*pixelArray[2] 
				+ HY_31*pixelArray[5] + HY_32*pixelArray[6]	+ HY_33*pixelArray[7];
			startMag<=1;
		end
	end

	//magnitude has been computed and output is updated
	always @(posedge magFinished) begin
		sobelFinished<=1;
		//uses a threshold of 128. This helps to remove noise where the filter resulted in a low non-zero value.
		if(magnitudeVal[7]==1) begin //result is greater than 127, set output to white.
			out<=8'd255;
		end
		else begin
			out<=8'd0;
		end
	end
endmodule
