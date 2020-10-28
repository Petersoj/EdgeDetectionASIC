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
    input wire I_CLK, // Clock input
    input wire I_RESET, // Reset input
    input wire I_ENABLE, // Enable input
    input wire [P_PIXEL_DEPTH - 1:0] I_PIXEL, // The RGB pixel data input

    output wire [P_PIXEL_DEPTH - 1:0] O_PIXEL, // The grayscale pixel data output
    output reg O_DONE // Asserted when the conversion has completed (unasserts on the next clock cycle)
    );

endmodule
