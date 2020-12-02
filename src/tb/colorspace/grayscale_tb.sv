////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/28/2020
// Module Name: grayscale_tb
// Description: grayscale module testbench
// Authors: Jacob Peterson
//
////

`timescale 1 ps / 1 ps

module grayscale_tb();

    // START local parameters
    localparam P_PIXEL_DEPTH = 24;
    localparam P_SUBPIXEL_DEPTH = P_PIXEL_DEPTH / 3;
    // END local parameters

    // START registers and wires
    logic clock;
    logic reset;
    logic [P_PIXEL_DEPTH - 1 : 0] pixel;
    logic [P_SUBPIXEL_DEPTH - 1 : 0] output_pixel;
    // END registers and wires

    // START module instantiations
    grayscale #(
        .P_PIXEL_DEPTH(P_PIXEL_DEPTH)
        )
        DUT
        (
        .I_CLK(clock),
        .I_RESET(reset),
        .I_PIXEL(pixel),

        .O_PIXEL(output_pixel)
        );
    // END module instantiations

    // START initial blocks

    initial begin
        clock = 1'b1;
        reset = 1'b1;
        pixel = {P_PIXEL_DEPTH{1'b0}};
    end

    initial begin
        forever #5000 clock = ~clock; // 200MHz clock (period of 10ns)
    end

    initial begin
        $display("================================================================");
        $display("========================== BEGIN SIM ===========================");
        $display("================================================================");

        $display("Resetting DUT");
        #10000;
        reset = 1'b0;
        #10000;

        $display("Grayscale of (255, 127, 0)");
        #10000;
        pixel = {8'hff, 8'h7F, 8'h00};
        #10000;

        $display("================================================================");
        $display("=========================== END SIM ============================");
        $display("================================================================");
        $stop;
    end

    // END initial blocks
endmodule
