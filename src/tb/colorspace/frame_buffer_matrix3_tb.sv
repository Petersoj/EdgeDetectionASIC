////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 12/01/2020
// Module Name: frame_buffer_matrix3
// Description: frame_buffer_matrix3 module testbench
// Authors: Jacob Peterson
//
////

`timescale 1 ps / 1 ps

module frame_buffer_matrix3_tb();

    // START local parameters
    localparam P_COLUMNS = 640;
    localparam P_ROWS = 3;
    localparam P_PIXEL_DEPTH = 8;
    localparam P_O_PIXEL_MATRIX_BITS = P_PIXEL_DEPTH * 8;
    // END local parameters

    // START registers and wires
    logic clock;
    logic reset;
    logic [$clog2(P_COLUMNS) - 1 : 0] column;
    logic [$clog2(P_ROWS) - 1 : 0] row;
    logic [P_PIXEL_DEPTH - 1 : 0] pixel;
    logic write_enable;
    logic read_enable;
    logic [P_O_PIXEL_MATRIX_BITS - 1 : 0] output_pixel_matrix;
    logic [P_PIXEL_DEPTH - 1 : 0] top_left_pixel;
    logic [P_PIXEL_DEPTH - 1 : 0] top_pixel;
    logic [P_PIXEL_DEPTH - 1 : 0] top_right_pixel;
    logic [P_PIXEL_DEPTH - 1 : 0] middle_left_pixel;
    logic [P_PIXEL_DEPTH - 1 : 0] middle_right_pixel;
    logic [P_PIXEL_DEPTH - 1 : 0] bottom_left_pixel;
    logic [P_PIXEL_DEPTH - 1 : 0] bottom_pixel;
    logic [P_PIXEL_DEPTH - 1 : 0] bottom_right_pixel;
    // END registers and wires

    // START Output mapping
    assign top_left_pixel = output_pixel_matrix[P_O_PIXEL_MATRIX_BITS * 8/8 - 1 :
                                                P_O_PIXEL_MATRIX_BITS * 7/8];
    assign top_pixel = output_pixel_matrix[P_O_PIXEL_MATRIX_BITS * 7/8 - 1 :
                                                P_O_PIXEL_MATRIX_BITS * 6/8];
    assign top_right_pixel = output_pixel_matrix[P_O_PIXEL_MATRIX_BITS * 6/8 - 1 :
                                                P_O_PIXEL_MATRIX_BITS * 5/8];
    assign middle_left_pixel = output_pixel_matrix[P_O_PIXEL_MATRIX_BITS * 5/8 - 1 :
                                                P_O_PIXEL_MATRIX_BITS * 4/8];
    assign middle_right_pixel = output_pixel_matrix[P_O_PIXEL_MATRIX_BITS * 4/8 - 1 :
                                                P_O_PIXEL_MATRIX_BITS * 3/8];
    assign bottom_left_pixel = output_pixel_matrix[P_O_PIXEL_MATRIX_BITS * 3/8 - 1 :
                                                P_O_PIXEL_MATRIX_BITS * 2/8];
    assign bottom_pixel = output_pixel_matrix[P_O_PIXEL_MATRIX_BITS * 2/8 - 1 :
                                                P_O_PIXEL_MATRIX_BITS * 1/8];
    assign bottom_right_pixel = output_pixel_matrix[P_O_PIXEL_MATRIX_BITS * 1/8 - 1 :
                                                P_O_PIXEL_MATRIX_BITS * 0/8];
    // END Output mapping

    // START module instantiations
    frame_buffer_o_matrix3 #(
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

        .O_PIXEL_MATRIX(output_pixel_matrix)
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

        $display("Setting (1, 1) to white (0xFF)");
        #10000;
        column = 1'b1;
        row = 1'b1;
        pixel = {P_PIXEL_DEPTH{1'b1}}; // Color of white
        read_enable = 1'b0;
        write_enable = 1'b1;
        #10000;

        $display("Reading (0, 0)");
        #10000;
        column = 1'b0;
        row = 1'b0;
        read_enable = 1'b1;
        write_enable = 1'b0;
        #10000;

        $display("Reading (2, 2)");
        #10000;
        column = 2'd2;
        row = 2'd2;
        read_enable = 1'b1;
        write_enable = 1'b0;
        #10000;

        $display("Setting (%0d, %0d) to 0x7F", P_COLUMNS - 1, P_ROWS - 1);
        #10000;
        column = P_COLUMNS - 1;
        row = P_ROWS - 1;
        pixel = 8'h7F;
        read_enable = 1'b0;
        write_enable = 1'b1;
        #10000;

        $display("Reading (%0d, %0d)", P_COLUMNS - 1, P_ROWS - 1);
        #10000;
        read_enable = 1'b1;
        write_enable = 1'b0;
        #10000;

        $display("Setting (%0d, %0d) to 0x7F", P_COLUMNS - 2, P_ROWS - 2);
        #10000;
        column = P_COLUMNS - 2;
        row = P_ROWS - 2;
        pixel = 8'h7F;
        read_enable = 1'b0;
        write_enable = 1'b1;
        #10000;

        $display("Reading (%0d, %0d)", P_COLUMNS - 2, P_ROWS - 2);
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
