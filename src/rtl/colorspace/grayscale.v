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
    parameter integer P_PIXEL_DEPTH = 32'd24, // The color depth of the pixel (MUST be a multiple of 3)

    // START port list local parameters
    parameter integer P_SUBPIXEL_DEPTH = P_PIXEL_DEPTH / 3
    // END port list local parameters
    )
    (
    input wire I_CLK, // Clock input
    input wire I_RESET, // Reset input
    input wire [P_PIXEL_DEPTH - 1 : 0] I_PIXEL, // The RGB pixel data input

    output wire [P_SUBPIXEL_DEPTH - 1 : 0] O_PIXEL // The grayscale pixel data output
    );

    // START local parameters
    localparam P_RED_MSB = P_SUBPIXEL_DEPTH * 3 - 1;
    localparam P_RED_LSB = P_SUBPIXEL_DEPTH * 3 - P_SUBPIXEL_DEPTH;
    localparam P_GREEN_MSB = P_SUBPIXEL_DEPTH * 2 - 1;
    localparam P_GREEN_LSB = P_SUBPIXEL_DEPTH * 2 - P_SUBPIXEL_DEPTH;
    localparam P_BLUE_MSB = P_SUBPIXEL_DEPTH - 1;
    localparam P_BLUE_LSB = 0;
    // END local parameters

    // START registers and wires
    wire [P_SUBPIXEL_DEPTH - 1 : 0] w_i_red = I_PIXEL[P_RED_MSB : P_RED_LSB];
    wire [P_SUBPIXEL_DEPTH - 1 : 0] w_i_green = I_PIXEL[P_GREEN_MSB : P_GREEN_LSB];
    wire [P_SUBPIXEL_DEPTH - 1: 0] w_i_blue = I_PIXEL[P_BLUE_MSB : P_BLUE_LSB];

    reg [P_PIXEL_DEPTH - 1 : 0] q_o_pixel; // The current state of the output pixel
    wire [P_PIXEL_DEPTH - 1 : 0] n_o_pixel; // The next state of the output pixel
    // END registers and wires

    // START output mapping
    assign O_PIXEL = q_o_pixel;
    // END output mapping

    // START RTL logic

    // NOTE The Luma coefficients are 0.299, 0.587, and 0.114 for red, green, and blue respectively,
    // but we are using approximations for this implementation to prevent the use
    // of floating point (or fixed point) numbers and division. Multiplying by fractional
    // cocoefficients is just division, but dividers generally take up multiple clock cycles and
    // take up lots of area (https://stackoverflow.com/a/11726261/4352701).
    // Addition is less expensive and can be done efficiently using various
    // optimized implementations (e.g. carry-look-ahead).
    // We'll instead use the same logic that used to implement floating point numbers,
    // that is, we use a 'mantissa' which represents the fractional part of a decimal
    // in binary to divide our number by a fraction.
    // e.g. 0.299 is pretty close to 2^(-2) + 2^(-5) + 2^(-6) + 2^(-9) where 2^(-exponent)
    // is simply right bit-shifting by that exponent integer. So we simply sum the bit-shifted
    // results together to appromate division.
    // You can use this easy-to-use floating point converter tool to see the mantissa
    // of various decimals (along with the IEEE spec for floating point
    // numbers): https://www.h-schmidt.net/FloatConverter/IEEE754.html
    // The implementation of addition here is done by the synthesizer, but, if necessary,
    // a fast and constant-coefficient multiplier algorithm can be done with
    // this algorithm: http://www.aoki.ecei.tohoku.ac.jp/arith/mg/algorithm.html#cmult
    // if multiplication is necessary for a different 'dividing' implementation.
    // Add all these calculated Luma coefficients together to produce
    // final grayscale pixel:
    assign n_o_pixel =
        // w_i_red * [2^(-2) + 2^(-5) + 2^(-6)]
        (w_i_red >> 2) + (w_i_red >> 5) + (w_i_red >> 6) +

        // w_i_green * [2^(-1) + 2^(-4) + 2^(-6) + 2^(-7)]
        (w_i_green >> 1) + (w_i_green >> 4) + (w_i_green >> 6) + (w_i_green >> 7) +

        // w_i_blue * [2^(-4) + 2^(-5) + 2^(-6)]
        (w_i_blue >> 4) + (w_i_blue >> 5) + (w_i_blue >> 6);
    // NOTE We don't have to check for overflow/carry of the above addition because
    // the max possible value is 255.
    // END RTL logic

    // Clock block
    always @(posedge I_CLK) begin
        if(I_RESET == 1'b1) begin
            q_o_pixel <= {P_PIXEL_DEPTH{1'b0}};
        end else begin
            q_o_pixel <= n_o_pixel;
        end
    end
endmodule
