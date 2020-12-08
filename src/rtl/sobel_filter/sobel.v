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
//	done - set to 1 when the output is ready to be read
module sobel(row,col,inputPixels,clk_pix,clk,start,reset,out);
	input 	wire [8:0] 	row;			//row number of output pixel
	input	wire [9:0]	col;			//column number of output pixel
	input 	wire [63:0] inputPixels;	//Surrounding 8 bit pixel values combined. 
										//format:
										//	{top_left, top, top_right,
										//	 mid_left, 		mid_right,
										//	 bot_left, bot,	bot_right}
	input 	wire		clk_pix;		//pixel clock (25.175 MHz)
	input	wire		clk;			//system clock (302.1 MHz)
	input	wire		start;			//start when buffer is ready
	input	wire		reset;
	output 	reg	[7:0]	out;		 	//0,255 sobel pixel value
	
	//variables
	wire [7:0]			pixelArray [7:0];//array used to separate input pixel values
	reg [9:0] 			gx1,gx2,gy1,gy2;//holds values of the steps of the filter
	reg [9:0] 			gx,gy;			//combined values of filter steps
	wire [10:0] 		g_mag;			//approximate magnitude
	reg [1:0] 			filter_step;	//current filter computation step

	//flags
	wire				onEdge;			//1 if the output pixel is on the edge of the image
	reg					busy;			//1 when computing pixel
	reg 				setup;			//1 when the filter has been setup and is ready to do work
	
	//parameters
	parameter [8:0]		MAX_ROW = 480;	//horizontal image dimension
	parameter [9:0]		MAX_COL = 640;	//vertical image dimension
	
	//flipped sobel filters
	//	  -1 0 1	  -1 -2 -1
	//hx= -2 0 2  hy=  0  0  0
	//	  -1 0 1	   1  2  1	

	//compute if center pixel is on the border
	assign onEdge = (row==0) || (row==MAX_ROW-1) || (col==0) || (col==MAX_COL-1);
	assign {pixelArray[7],pixelArray[6],pixelArray[5],pixelArray[4],pixelArray[3],pixelArray[2],pixelArray[1],pixelArray[0]} = inputPixels;

	//find approximate magnitude 
	always @(gx1,gx2,gy1,gy2) begin
		if(gx1>gx2) gx=gx1-gx2;
		else	gx=gx2-gx1;
		if(gy1>gy2)	gy=gy1-gy2;
		else	gy=gy2-gy1;
	end
	assign 	g_mag=gy+gx;

	//compute filter
	always @(posedge clk) begin
		if(reset) begin
				busy<=0;
				setup<=0;
				filter_step<=0;
		end
		else if(busy)begin
			if(onEdge) begin
				gx1<=0;
				gx2<=0;
				gy1<=0;
				gy2<=0;	
				busy<=0;
			end 
			else begin
				case(filter_step)
				0: begin
					gx1<=pixelArray[0]+(pixelArray[5]<<1)+pixelArray[3];
					filter_step<=1;
					busy<=busy;
				end
				1: begin
					gx2<=pixelArray[2]+(pixelArray[4]<<1)+pixelArray[7];
					filter_step<=2;
					busy<=busy;
				end
				2: begin 
					gy1<=pixelArray[0]+(pixelArray[1]<<1)+pixelArray[2];
					filter_step<=3;
					busy<=busy;
				end
				3: begin 
					gy2<=pixelArray[5]+(pixelArray[6]<<1)+pixelArray[7];
					
					filter_step<=0;
					busy<=~busy;
				end	
				default: begin
					filter_step<=0;
					busy<=busy;
				end		
				endcase
			end
		end	
		else if(clk_pix) begin //pixel clock, setup filter computation 
			if(start&~setup)begin //initial setup to start the filter
				busy<=1;
				setup<=1;
				filter_step<=0;			
			end
		end
		else setup<=0;
	end
	
	//output pixel value
	always @(posedge clk_pix) begin
		if(g_mag[10:7]>0) out<=8'd255;
		else	out<=8'd0;
	end
endmodule
