////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/28/2020
// Module Name: buffered_matrix_colorspace_converter
// Description: Converts an RGB colorspace VGA input to a grayscaled pixel matrix output.
// Authors: Jacob Peterson
//
////

module buffered_matrix_colorspace_converter
    #(
    parameter integer P_FRAME_COLUMNS = 32'd640, // The number of columns in the frame
    parameter integer P_FRAME_ROWS = 32'd480, // The number of rows in the frame
    parameter integer P_PIXEL_DEPTH = 32'd24, // The color depth of the pixel (MUST be a multiple of 3)

    parameter integer P_HACT = 32'd640, // The constant used for Horizontal Active (pixels)
    parameter integer P_HFP = 32'd16, // The constant used for Horizontal Front Porch (pixels)
    parameter integer P_HSW = 32'd96, // The constant used for Horizontal Sync Width (pixels)
    parameter integer P_HBP = 32'd48, // The constant used for Horizontal Back Porch (pixels)

    parameter integer P_VACT = 32'd480, // The constant used for Vertical Active (lines)
    parameter integer P_VFP = 32'd10, // The constant used for Vertical Front Porch (lines)
    parameter integer P_VSH = 32'd2, // The constant used for Vertical Sync Height (lines)
    parameter integer P_VBP = 32'd33 // The constant used for Vertical Back Porch (lines)

    // This is the dimension size of the square 2D pixel matrix output (this is also the number of rows for the internal buffer)
    parameter integer P_OUTPUT_MATRIX_SIZE = 32'd3,
    )
    (
    input wire I_CLK, // Clock input
    input wire I_RESET, // Reset input
    input wire I_ENABLE, // Enable input

    input wire [P_PIXEL_DEPTH - 1 : 0] I_PIXEL,  // RGB pixel input
    input wire I_VSYNC, // Vertical Sync input
    input wire I_HSYNC, // Horizontal Sync input
    input wire I_DATA_ENABLE, // Data enable (data valid) input
    input wire I_PIXEL_CLK, // Pixel clock input

    // The start column of the output matrix relative to the start column of the frame
    output reg [$clog2(P_COLUMNS) - 1 : 0] O_PIXEL_COL,
    // The start row of the output matrix relative to the start row of the frame
    output reg [$clog2(P_ROWS) - 1 : 0] O_PIXEL_ROW,
    // The grayscaled pixel matrix output
    output reg [P_SUBPIXEL_DEPTH - 1 : 0] O_PIXEL_MATRIX [P_OUTPUT_MATRIX_SIZE - 1 : 0][P_OUTPUT_MATRIX_SIZE - 1 : 0],
    // Asserted if outputs are ready/valid
    output reg O_PIXEL_MATRIX_READY
    );

    parameter integer P_SUBPIXEL_DEPTH = P_PIXEL_DEPTH / 3;

    reg [31:0] current_column = 32'd0;
    reg [31:0] current_row = 32'd0;

    wire [P_PIXEL_DEPTH - 1:0] grayscale_output;

    /*
    grayscale grayscale(
        .I_PIXEL(I_PIX_DATA),

        .O_PIXEL(grayscale_output)
        );

    always @(posedge I_PCLK) begin
        if (I_ENABLE == 1'b1 && I_DE == 1'b1) begin
            if (I_HSYNC == 1'b1) begin
                if (current_column >= P_HFP + P_HACT + P_HBP) begin
                    current_column = 32'd0;
                    current_row = current_row + 32'd1;
                end else begin
                    current_column = current_column + 32'd1;
                end

                if (current_column >= P_HFP && current_column < P_HFP + P_HACT + P_HBP) begin
                    O_PIXEL_COL = current_column;
                    O_PIXEL_ROW = current_row;
                    O_PIXEL_WRITE_ENABLE = 1'b1;
                end else begin
                    O_PIXEL_COL = 32'd0;
                    O_PIXEL_ROW = 32'd0;
                    O_PIXEL_WRITE_ENABLE = 1'b0;
                end
            end

            if (I_VSYNC == 1'b1) begin
                if (current_row >= P_VFP + P_VACT + P_VBP) begin
                    current_row = 32'd0;
                end else begin
                    current_row = current_row + 32'd1;
                end
            end
        end
    end
    */
endmodule
