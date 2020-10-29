////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/28/2020
// Module Name: grayscale
// Description: Converts an RGB pixel input to grayscale.
//              Note that this will use the Luma cocoefficients for the CCIR 601 digital format as
//              described here: https://en.wikipedia.org/wiki/Luma_(video)#Rec._601_luma_versus_Rec._709_luma_coefficients
// Authors: Jacob Peterson
//
////

module grayscale
    #(
    parameter integer P_PIXEL_DEPTH = 32'd24 // The color depth of the pixel
    )
    (
    //input wire I_CLK, // Clock input
    //input wire I_RESET, // Reset input
    //input wire I_ENABLE, // Enable input
    input wire [P_PIXEL_DEPTH - 1:0] I_PIXEL, // The RGB pixel data input

    output wire [P_PIXEL_DEPTH - 1:0] O_PIXEL // The grayscale pixel data output
    // output reg O_DONE // Asserted when the conversion has completed (unasserts on the next clock cycle)
    );

    parameter P_PIXEL_RGB_WIDTH = P_PIXEL_DEPTH / 3;

    // TODO make synthesizable
    // TODO implement ALU/multiplication module for '*' operator instead of leaving it up to the synthesizer

    wire [P_PIXEL_RGB_WIDTH:0] red = I_PIXEL[P_PIXEL_RGB_WIDTH * 3 - 1 : P_PIXEL_RGB_WIDTH * 3 - P_PIXEL_RGB_WIDTH];
    wire [P_PIXEL_RGB_WIDTH:0] green = I_PIXEL[P_PIXEL_RGB_WIDTH * 2 - 1 :P_PIXEL_RGB_WIDTH * 2 - P_PIXEL_RGB_WIDTH];
    wire [P_PIXEL_RGB_WIDTH:0] blue = I_PIXEL[P_PIXEL_RGB_WIDTH - 1 : 0];

    assign O_PIXEL = 0.299*red + 0.587*green + 0.114*blue;

endmodule
