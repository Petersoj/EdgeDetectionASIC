////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/28/2020
// Module Name: colorspace_converter
// Description: Converts a RGB colorspace VGA input to grayscale.
// Authors: Jacob Peterson
//
////

module colorspace_converter
    #(
    parameter integer P_COLUMNS = 32'd640, // The number of columns in the frame
    parameter integer P_ROWS = 32'd480, // The number of rows in the frame
    parameter integer P_PIXEL_DEPTH = 32'd24, // The color depth of the pixel

    parameter integer P_HACT = 32'd640, // The constant used for Horizontal Active (pixels)
    parameter integer P_HFP = 32'd16, // The constant used for Horizontal Front Porch (pixels)
    parameter integer P_HSW = 32'd96, // The constant used for Horizontal Sync Width (pixels)
    parameter integer P_HBP = 32'd48, // The constant used for Horizontal Back Porch (pixels)

    parameter integer P_VACT = 32'd480, // The constant used for Vertical Active (lines)
    parameter integer P_VFP = 32'd10, // The constant used for Vertical Front Porch (lines)
    parameter integer P_VSH = 32'd2, // The constant used for Vertical Sync Height (lines)
    parameter integer P_VBP = 32'd33 // The constant used for Vertical Back Porch (lines)
    )
    (
    input wire I_CLK, // Clock input
    input wire I_RESET, // Reset input
    input wire I_ENABLE, // Enable input

    input wire [P_PIXEL_DEPTH - 1:0] I_PIX_DATA,  // RGB pixel data input
    input wire I_VSYNC, // Vertical Sync input
    input wire I_HSYNC, // Horizontal Sync input
    input wire I_DE, // Data enable (data valid) input
    input wire I_PCLK, // Pixel clock input

    output reg [$clog2(P_COLUMNS) - 1:0] O_PIXEL_COL, // The column of the grayscaled pixel output
    output reg [$clog2(P_ROWS) - 1:0] O_PIXEL_ROW, // The row of the grayscaled pixel output
    output reg [P_PIXEL_DEPTH - 1:0] O_PIXEL, // The grayscaled pixel data output
    output reg O_PIXEL_WRITE_ENABLE // Asserted if outputs are ready/valid
    );

    //
    // TODO make synthesizable, implement as FSM, add useful comments, don't procrastinate final RTL :P
    //

    reg [31:0] current_column = 32'd0;
    reg [31:0] current_row = 32'd0;

    wire [P_PIXEL_DEPTH - 1:0] grayscale_output;

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

endmodule
