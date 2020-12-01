////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/27/2020
// Module Name: frame_buffer_tb
// Description: frame_buffer_tb module testbench
// Authors: Jacob Peterson
//
////

`timescale 1 ps / 1 ps

module frame_buffer_tb();

    // START local parameters
    parameter integer P_COLUMNS = 640;
    parameter integer P_ROWS = 3;
    parameter integer P_PIXEL_DEPTH = 24;
    parameter integer P_SUBPIXEL_DEPTH = P_PIXEL_DEPTH / 3;
    // END local parameters

    // START registers and wires
    logic clock;
    logic reset;
    logic [$clog2(P_COLUMNS) - 1 : 0] column;
    logic [$clog2(P_ROWS) - 1 : 0] row;
    logic [P_PIXEL_DEPTH - 1 : 0] pixel;
    logic write_enable;
    logic read_enable;
    logic [P_PIXEL_DEPTH - 1 : 0] output_pixel;
    // END registers and wires

    // START module instantiations
    frame_buffer #(
        .P_COLUMNS(P_COLUMNS),
        .P_ROWS(P_ROWS),
        .P_PIXEL_DEPTH(P_PIXEL_DEPTH)
        )
        DUT
        (
        .I_CLK(clock),
        .I_RESET(reset),
        .I_COLUMN(column),
        .I_ROW(row),
        .I_PIXEL(pixel),
        .I_WRITE_ENABLE(write_enable),
        .I_READ_ENABLE(read_enable),

        .O_PIXEL(output_pixel)
        );
    // END module instantiations

    // START initial blocks

    initial begin
        clock = 1'b1;
        reset = 1'b1;
        column = {$clog2(P_COLUMNS){1'b0}};
        row = {$clog2(P_ROWS){1'b0}};
        pixel = {P_PIXEL_DEPTH{1'b0}};
        write_enable = 1'b0;
        read_enable = 1'b0;
    end

    initial begin
        forever #5000 clock = ~clock; // 100MHz clock (period of 10ns)
    end

    initial begin
        $display("================================================================");
        $display("========================== BEGIN SIM ===========================");
        $display("================================================================");

        $display("Resetting DUT");
        #10000;
        reset = 1'b0;

        $display("Setting (0, 0) to white");
        #10000;
        column = {$clog2(P_COLUMNS){1'b0}};
        row = {$clog2(P_ROWS){1'b0}};
        pixel = {P_PIXEL_DEPTH{1'b1}}; // Color of white
        read_enable = 1'b0;
        write_enable = 1'b1;

        $display("Reading (0, 0)");
        #10000;
        read_enable = 1'b1;
        write_enable = 1'b0;

        $display("Setting (%0d, %0d) to red", P_COLUMNS - 1, P_ROWS - 1);
        #10000;
        column = P_COLUMNS - 1;
        row = P_ROWS - 1;
        pixel = {{P_SUBPIXEL_DEPTH{1'b1}}, {P_SUBPIXEL_DEPTH{1'b0}}, {P_SUBPIXEL_DEPTH{1'b0}}}; // Color of red
        read_enable = 1'b0;
        write_enable = 1'b1;

        $display("Reading (%0d, %0d)", P_COLUMNS - 1, P_ROWS - 1);
        #10000;
        read_enable = 1'b1;
        write_enable = 1'b0;

        #10000;

        $display("================================================================");
        $display("=========================== END SIM ============================");
        $display("================================================================");
        $stop;
    end

    // END initial blocks
endmodule
