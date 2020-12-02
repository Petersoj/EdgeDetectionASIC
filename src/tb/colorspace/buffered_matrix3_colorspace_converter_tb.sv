////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 11/30/2020
// Module Name: buffered_matrix3_colorspace_converter_tb
// Description: buffered_matrix3_colorspace_converter module testbench
// Authors: Jacob Peterson
//
////

`timescale 1 ps / 1 ps

module buffered_matrix3_colorspace_converter_tb();

    // START local parameters
    parameter integer P_FRAME_COLUMNS = 640;
    parameter integer P_FRAME_ROWS = 480;
    parameter integer P_PIXEL_DEPTH = 24;

    parameter integer P_FRAME_COLUMN_BITS = $clog2(P_FRAME_COLUMNS);
    parameter integer P_FRAME_ROW_BITS = $clog2(P_FRAME_ROWS);
    parameter integer P_SUBPIXEL_DEPTH = P_PIXEL_DEPTH / 3;

    parameter integer P_OUTPUT_MATRIX_SIZE = 3;
    parameter integer P_PIXEL_MATRIX_BITS = (P_SUBPIXEL_DEPTH * P_OUTPUT_MATRIX_SIZE * P_OUTPUT_MATRIX_SIZE) - P_SUBPIXEL_DEPTH;
    // END local parameters

    // START registers and wires
    logic clock;
    logic reset;
    logic enable;
    logic pixel_clock;
    logic data_valid;
    logic [P_PIXEL_DEPTH - 1 : 0] pixel;
    logic [P_FRAME_COLUMN_BITS - 1 : 0] frame_column;
    logic [P_FRAME_ROW_BITS - 1 : 0] frame_row;
    logic [P_PIXEL_MATRIX_BITS - 1 : 0] pixel_matrix_output;
    logic pixel_matrix_ready_output;
    // END registers and wires

    // START module instantiations
    buffered_matrix3_colorspace_converter #(
        .P_FRAME_COLUMNS(P_FRAME_COLUMNS),
        .P_FRAME_ROWS(P_FRAME_ROWS),
        .P_PIXEL_DEPTH(P_PIXEL_DEPTH)
        )
        DUT
        (
        .I_CLK(clock),
        .I_RESET(reset),
        .I_PIXEL_CLK(pixel_clock),
        .I_DATA_VALID(data_valid),
        .I_PIXEL(pixel),

        .O_PIXEL_COLUMN(frame_column),
        .O_PIXEL_ROW(frame_row),
        .O_PIXEL_MATRIX(pixel_matrix_output),
        .O_PIXEL_MATRIX_READY(pixel_matrix_ready_output)
        );
    // END module instantiations

    // START initial blocks

    initial begin
        clock = 1'b1;
        reset = 1'b1;
        enable = 1'b1;
        pixel_clock = 1'b1;
        data_valid = 1'b0;
        pixel = {P_PIXEL_DEPTH{1'b0}};
    end

    initial begin
        forever #3003 clock = ~clock; // 333 MHz clock (period of 6ns)
    end

    initial begin
        forever #39722 pixel_clock = ~pixel_clock; // 25.175 MHz clock (period of about 79.444ns)
    end

    initial begin
        $display("================================================================");
        $display("========================== BEGIN SIM ===========================");
        $display("================================================================");

        $display("Resetting DUT");
        #6006;
        reset = 1'b0;
        enable = 1'b1;
        #6006;

        #6006;
        // TODO

        $display("================================================================");
        $display("=========================== END SIM ============================");
        $display("================================================================");
        $stop;
    end

    // END initial blocks
endmodule
