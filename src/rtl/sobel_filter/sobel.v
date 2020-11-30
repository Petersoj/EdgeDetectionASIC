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
module sobel(row,col,inputPixels,clk_pix,clk,start,reset,out,done);
	input 	wire [9:0] 	row;			//row number of output pixel
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
	output	wire			done;			//1 when pixel is complete
	
	//variables
	reg signed [10:0]	gx;				//output of horizontal filter range:[-1020:1020]
	reg signed [10:0]	gy;				//output of vertical filter range:[-1020 : 1020]
	wire [19:0]			gx2gy2;			//value of gx^2+gy^2
	wire [7:0]			magnitudeVal;	//value of the sqrt capped at 255
	wire [7:0]			pixelArray [7:0];	//array used to separate input pixel values
	
	//flags
	wire				onEdge;			//1 if the output pixel is on the edge of the image
	reg					startMag;		//1 to compute the magnitude
	wire				magFinished;	//1 when magnitdue has been computed
	reg					busy;			//1 when computing pixel
	
	//experimental
	reg [9:0] gx1,gx2,gy1,gy2;
	reg [9:0] gx_ex,gy_ex;
	wire [10:0] g_mag;
	reg [9:0] shiftedVal;
	reg [2:0] filter_step;
	reg setup;
	
	always @(gx1,gx2,gy1,gy2) begin
		if(gx1>gx2) gx_ex=gx1-gx2;
		else	gx_ex=gx2-gx1;
		if(gy1>gy2)	gy_ex=gy1-gy2;
		else	gy_ex=gy2-gy1;
	end
	assign 	g_mag=gy_ex+gx_ex;
	
	
	
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
	//assign gx2gy2 = gx*gx+gy*gy;
	assign done = ~busy;

//	magnitude Mag
//		(.a		(gx),
//		 .b		(gy),
//		 .start 	(startMag),
//		 .out		(magnitudeVal),
//		 .outValid	(magFinished)
//		 );
	// sqrt root(
		// .clk	(clk),
		// .data	(gx2gy2),
		// .start	(startMag),
		// .answer	(magnitudeVal),
		// .done	(magFinished)
		// );
 
	// reg [10:0] alu_a,alu_b,alu_result;
	// reg [1:0] alu_mode;
	
	// ALU iALU
	// 	(.a (alu_a),
	// 	 .b	(alu_b),
	// 	 .alu_sel	(alu_mode),
	// 	 .result	(alu_result)
	// 	)

	//calculate horizontal and vertical filters
	 /*always @(posedge clk_pix)begin
	 	if(start) begin
	 		 if(onEdge) begin
	 		 	// out <= 8'd0;
	 		 	// done<=1;
	 		 	//gx<=0;
	 		 	//gy<=0;
	 		 	 gx1<=0;
	 		 	 gx2<=0;
	 		 	 gy1<=0;
	 		 	 gy2<=0;
	 		 end
	 		 else begin
//	 			 gx <= HX_11*pixelArray[0] + HX_13*pixelArray[2] 
//	 				 + HX_21*pixelArray[3] + HX_23*pixelArray[4] 
//	 				 + HX_31*pixelArray[5] + HX_33*pixelArray[7];
//	 			 gy <= HY_11*pixelArray[0] + HY_12*pixelArray[1] + HY_13*pixelArray[2] 
//	 				 + HY_31*pixelArray[5] + HY_32*pixelArray[6]	+ HY_33*pixelArray[7];
	 			 gx1<=pixelArray[0]+(pixelArray[5]<<1)+pixelArray[3];
	 			 gx2<=pixelArray[2]+(pixelArray[4]<<1)+pixelArray[7];
	 			 gy1<=pixelArray[0]+(pixelArray[1]<<1)+pixelArray[2];
	 			 gy2<=pixelArray[5]+(pixelArray[6]<<1)+pixelArray[7];
	 			 startMag<=1;
	 		 end
	 		startMag <= 1;
	 		if(g_mag[10:7]>0) out<=8'd255;
	 		else	out<=8'd0;
			
	 	end
	 end*/

	// reg [10:0] filter0,filter1,filter2;
	// wire [10:0] filter_result;


	// filter_line ifilter_line(
	// 	.a(filter0),
	// 	.b(filter1),
	// 	.c(filter2),
	// 	.result(filter_result)
	// );

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
					//uncomment the ALU code and comment the direct g computation for a slight area improvement (18k->17k)
					//however the ALU requires 1 additional clock cycle making the timing tighter (slack: 1.74->0.01)
					case(filter_step)
					0: begin
						// filter0<=pixelArray[0];
						// filter1<=pixelArray[5];	//ALU
						// filter2<=pixelArray[3];
						
						gx1<=pixelArray[0]+(pixelArray[5]<<1)+pixelArray[3];
						filter_step<=1;
						busy<=busy;
					end
					1: begin
						// gx1<=filter_result; 
						// filter0<=pixelArray[2];
						// filter1<=pixelArray[4];	//ALU
						// filter2<=pixelArray[7];
						
						gx2<=pixelArray[2]+(pixelArray[4]<<1)+pixelArray[7];
						filter_step<=2;
						busy<=busy;
					end
					2: begin 
						// gx2<=filter_result;
						// filter0<=pixelArray[0];
						// filter1<=pixelArray[1];	//ALU
						// filter2<=pixelArray[2];
						
						gy1<=pixelArray[0]+(pixelArray[1]<<1)+pixelArray[2];
						filter_step<=3;
						busy<=busy;
					end
					3: begin 
						// gy1<=filter_result;
						// filter0<=pixelArray[5];
						// filter1<=pixelArray[6];	//ALU
						// filter2<=pixelArray[7];
						//filter_step<=4;
						//busy<=busy;


						gy2<=pixelArray[5]+(pixelArray[6]<<1)+pixelArray[7];
						
						filter_step<=0;
						busy<=~busy;
					end
					// 4: begin
					// 	gy2<=filter_result;
					// 	filter_step<=0;			//ALU
					// 	busy<=~busy;
					// end	
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
			else setup<=0;	//if not busy and clk_pix is low, then the filter will reset on next posedge clk_pix
	end
	
	//output pixel value
	always @(posedge clk_pix) begin
		if(g_mag[10:7]>0) out<=8'd255;
		else	out<=8'd0;
	end
endmodule



//specific ALU for computing one row of the filter
// module filter_line(a, b, c, result);
// 	input [10:0] a,b,c;
// 	output [10:0] result;
// 	//reg [10:0] ALU_result;

// 	//assign result=ALU_result;
// 	//always @(a,b,c)
// 		assign result=a+(b<<1)+c;

// endmodule
