////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/27/2020
// Module Name: frame_buffer_tb
// Description: A memory buffer for a 2D matrix/frame testbench.
// Authors: Jacob Peterson
//
////

`timescale 1 ps / 1 ps

module frame_buffer_tb();

    parameter integer COLUMNS = 640;
    parameter integer ROWS = 3;
    parameter integer PIXEL_DEPTH = 24;
    parameter integer PIXEL_RGB_WIDTH = PIXEL_DEPTH/3;

    logic clock;
    logic reset;
    logic enable;
    logic [$clog2(COLUMNS) - 1:0] column;
    logic [$clog2(ROWS) - 1:0] row;
    logic [PIXEL_DEPTH - 1:0] pixel;
    logic write_enable;
    logic read_enable;
    logic [PIXEL_DEPTH - 1:0] output_pixel;

    initial begin
        clock = 1'b1;
        reset = 1'b1;
        enable = 1'b1;
        column = {$clog2(COLUMNS){1'b0}};
        row = {$clog2(ROWS){1'b0}};
        pixel = {PIXEL_DEPTH{1'b0}};
        write_enable = 1'b0;
        read_enable = 1'b0;
    end

    initial begin
        forever #5000 clock = ~clock; // 5ns or 200MHz clock
    end

    frame_buffer #(
        .P_COLUMNS(COLUMNS),
        .P_ROWS(ROWS),
        .P_PIXEL_DEPTH(PIXEL_DEPTH)
        )
        DUT
        (
        .I_CLK(clock),
        .I_RESET(reset),
        .I_ENABLE(enable),
        .I_PIXEL_COL(column),
        .I_PIXEL_ROW(row),
        .I_PIXEL(pixel),
        .I_WRITE_ENABLE(write_enable),
        .I_READ_ENABLE(read_enable),

        .O_PIXEL(output_pixel)
        );

    initial begin
        $display("================================================================");
        $display("========================== BEGIN SIM ===========================");
        $display("================================================================");

        $display("Resetting DUT");
        #10000;
        reset = 1'b0;

        $display("Setting (0, 0) to white");
        #10000;
        column = {$clog2(COLUMNS){1'b0}};
        row = {$clog2(ROWS){1'b0}};
        pixel = {PIXEL_DEPTH{1'b1}}; // Color of white
        read_enable = 1'b0;
        write_enable = 1'b1;

        $display("Reading (0, 0)");
        #10000;
        read_enable = 1'b1;
        write_enable = 1'b0;

        $display("Setting (%0d, %0d) to red", COLUMNS - 1, ROWS - 1);
        #10000;
        column = COLUMNS - 1;
        row = ROWS - 1;
        pixel = {{PIXEL_RGB_WIDTH{1'b1}}, {PIXEL_RGB_WIDTH{1'b0}}, {PIXEL_RGB_WIDTH{1'b0}}}; // Color of red
        read_enable = 1'b0;
        write_enable = 1'b1;

        $display("Reading (%0d, %0d)", COLUMNS - 1, ROWS - 1);
        #10000;
        read_enable = 1'b1;
        write_enable = 1'b0;

        #10000;

        $display("================================================================");
        $display("=========================== END SIM ============================");
        $display("================================================================");
        $stop;
    end

endmodule