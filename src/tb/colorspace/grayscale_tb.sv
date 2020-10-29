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

    parameter integer PIXEL_DEPTH = 24;

    logic clock;
    logic [PIXEL_DEPTH - 1:0] pixel;
    logic [PIXEL_DEPTH - 1:0] output_pixel;

    initial begin
        clock = 1'b1;
        pixel = {PIXEL_DEPTH{1'b0}};
    end

    initial begin
        forever #5000 clock = ~clock; // 5ns or 200MHz clock
    end

    grayscale #(
        .P_PIXEL_DEPTH(PIXEL_DEPTH)
        )
        DUT
        (
        .I_PIXEL(pixel),

        .O_PIXEL(output_pixel)
        );

    initial begin
        $display("================================================================");
        $display("========================== BEGIN SIM ===========================");
        $display("================================================================");

        $display("Grayscale of (255, 127, 0)");
        pixel = {8'hff, 8'h7F, 8'h00};
        #10000;

        $display("================================================================");
        $display("=========================== END SIM ============================");
        $display("================================================================");
        $stop;
    end

endmodule
