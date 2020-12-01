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
    parameter integer P_VBP = 32'd33, // The constant used for Vertical Back Porch (lines)

    // This is the dimension size of the square 2D pixel matrix output (this is also the number of rows for the internal buffer)
    parameter integer P_OUTPUT_MATRIX_SIZE = 32'd3
    )
    (
    I_CLK, // Clock input
    I_RESET, // Reset input
    I_ENABLE, // Enable input

    I_PIXEL,  // RGB pixel input
    I_VSYNC, // Vertical Sync input
    I_HSYNC, // Horizontal Sync input
    I_DATA_ENABLE, // Data enable (data valid) input
    I_PIXEL_CLK, // Pixel clock input

    O_PIXEL_COLUMN, // The start column of the output matrix relative to the start column of the frame
    O_PIXEL_ROW, // The start row of the output matrix relative to the start row of the frame
    O_PIXEL_MATRIX, // The grayscaled pixel matrix output (excludes the center pixel for Sobel filter specification)
                    // Format:
                    // {top_left,    top,    top_right,
                    //  middle_left, 	      middle_right,
                    //  bottom_left, bottom, bottom_right}
    O_PIXEL_MATRIX_READY // Asserted if outputs are ready/valid
    );

    // START local parameters
    parameter integer P_SUBPIXEL_DEPTH = P_PIXEL_DEPTH / 3;
    parameter integer P_FRAME_COLUMN_BITS = $clog2(P_FRAME_COLUMNS);
    parameter integer P_FRAME_ROW_BITS = $clog2(P_FRAME_ROWS);

    // The output matrix excludes the center grayscaled pixel so we subtract one P_SUBPIXEL_DEPTH.
    parameter integer P_MATRIX_BITS = (P_SUBPIXEL_DEPTH * P_OUTPUT_MATRIX_SIZE * P_OUTPUT_MATRIX_SIZE) - P_SUBPIXEL_DEPTH;
    // END local parameters

    // START port declarations
    input wire I_CLK;
    input wire I_RESET;
    input wire I_ENABLE;

    input wire [P_PIXEL_DEPTH - 1 : 0] I_PIXEL;
    input wire I_VSYNC;
    input wire I_HSYNC;
    input wire I_DATA_ENABLE;
    input wire I_PIXEL_CLK;

    output wire [P_FRAME_COLUMN_BITS - 1 : 0] O_PIXEL_COLUMN;
    output wire [P_FRAME_ROW_BITS - 1 : 0] O_PIXEL_ROW;
    output wire [P_MATRIX_BITS - 1 : 0] O_PIXEL_MATRIX;
    output wire O_PIXEL_MATRIX_READY;
    // END port declarations

    // START registers and wires
    reg [P_FRAME_COLUMN_BITS - 1 : 0] q_o_pixel_column; // The current state of the output pixel column
    reg [P_FRAME_COLUMN_BITS - 1 : 0] n_o_pixel_column; // The next state of the output pixel column
    reg [P_FRAME_COLUMN_BITS - 1 : 0] q_o_pixel_row; // The current state of the output pixel row
    reg [P_FRAME_COLUMN_BITS - 1 : 0] n_o_pixel_row; // The next state of the output pixel row
    reg [P_MATRIX_BITS - 1 : 0] q_o_pixel_matrix; // The current state of the output pixel matrix
    reg [P_MATRIX_BITS - 1 : 0] n_o_pixel_matrix; // The next state of the output pixel matrix
    reg q_o_pixel_matrix_ready; // The current state of the output pixel matrix ready signal
    reg n_o_pixel_matrix_ready; // The next state of the output pixel matrix ready signal
    // END registers and wires

    // START output mapping
    assign O_PIXEL_COLUMN = q_o_pixel_column;
    assign O_PIXEL_ROW = q_o_pixel_row;
    assign O_PIXEL_MATRIX = q_o_pixel_matrix;
    assign O_PIXEL_MATRIX_READY = q_o_pixel_matrix_ready;
    // END output mapping

    // START module instantiations
    grayscale #(
        .P_PIXEL_DEPTH(P_PIXEL_DEPTH)
        )
        iGrayscale
        (
        .I_CLK(I_CLK),
        .I_RESET(I_RESET),
        .I_ENABLE(I_ENABLE),
        .I_PIXEL(),

        .O_PIXEL()
        );

    frame_buffer #(
        .P_COLUMNS(P_FRAME_COLUMNS),
        .P_ROWS(),
        .P_PIXEL_DEPTH(P_PIXEL_DEPTH)
        )
        iGrayscaledFrameBuffer
        (
        .I_CLK(I_CLK),
        .I_RESET(I_RESET),
        .I_ENABLE(I_ENABLE),
        .I_PIXEL_COL(),
        .I_PIXEL_ROW(),
        .I_PIXEL(),
        .I_WRITE_ENABLE(),
        .I_READ_ENABLE(),

        .O_PIXEL()
        );
    // END module instantiations

    // Clock block
    always @(posedge I_CLK) begin

    end

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
