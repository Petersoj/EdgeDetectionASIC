////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 11/30/2020
// Module Name: frame_buffer_o_matrix3
// Description: A memory buffer for a 2D matrix/frame with a 3x3 matrix output
//              following the following format:
//              {top_left,    top,    top_right,
//               middle_left, 	      middle_right,
//               bottom_left, bottom, bottom_right}
//              NOTE the output matrix excludes the center pixel which yields a total of 8 pixels.
// Authors: Jacob Peterson
//
////

module frame_buffer_o_matrix3
    // #(
    // parameter integer P_COLUMNS = 32'd640, // The number of columns in the frame
    // parameter integer P_ROWS = 32'd4, // The number of rows in the frame
    // parameter integer P_PIXEL_DEPTH = 32'd8 // The color depth of the pixel
    // )
    (
    I_CLK, // Clock input
    I_RESET, // Reset input
    I_COLUMN, // The column of the desired pixel
    I_ROW, // The row of the desired pixel
    I_PIXEL, // The pixel data input
    I_WRITE_ENABLE, // Enable writing of the pixel data at the associated row and column input
    I_READ_ENABLE, // Enable reading of the pixel data at the associated row and column input

    O_PIXEL_MATRIX // The 3x3 pixel data matrix output
    );

    // START local parameters
    //moved input parameters here due to synthesis warnings
    localparam integer P_COLUMNS = 32'd640; // The number of columns in the frame
    localparam integer P_ROWS = 32'd4; // The number of rows in the frame
    localparam integer P_PIXEL_DEPTH = 32'd8; // The color depth of the pixel

    localparam integer P_COLUMNS_BIT_COUNT = $clog2(P_COLUMNS);
    localparam integer P_ROWS_BIT_COUNT = $clog2(P_ROWS);
    localparam integer P_O_PIXEL_MATRIX_BIT_COUNT = P_PIXEL_DEPTH * 8;
    // END local parameters

    // START port declarations
    input wire I_CLK;
    input wire I_RESET;
    input wire [P_COLUMNS_BIT_COUNT - 1 : 0] I_COLUMN;
    input wire [P_ROWS_BIT_COUNT - 1 : 0] I_ROW;
    input wire [P_PIXEL_DEPTH - 1 : 0] I_PIXEL;
    input wire I_WRITE_ENABLE;
    input wire I_READ_ENABLE;

    output wire [P_O_PIXEL_MATRIX_BIT_COUNT - 1 : 0] O_PIXEL_MATRIX;
    // END port declarations

    // START registers and wires

    // The following is the 2D array of registers for the frame buffer accessed as [row][column].
    reg [P_PIXEL_DEPTH - 1 : 0] buffer_registers [0 : P_ROWS - 1][0 : P_COLUMNS - 1];

    wire previous_column_valid; // Asserted if the column before the column of the desired pixel is valid
    wire next_column_valid; // Asserted if the column after the column of the desired pixel is valid
    wire previous_row_valid; // Asserted if the row above the row of the desired pixel is valid
    wire next_row_valid; // Asserted if the row below the row of the desired pixel is valid

    wire previous_column_index; // The index of the column before the column of the desired pixel
    wire next_column_index; // The index of the column after the column of the desired pixel
    wire previous_row_index; // The index of the row before the row of the desired pixel
    wire next_row_index; // The index of the row after the row of the desired pixel

    // The following define the wires of the 3x3 matrix pixels as chosen by the desired row and column inputs.
    wire [P_PIXEL_DEPTH - 1 : 0] top_left_pixel;
    wire [P_PIXEL_DEPTH - 1 : 0] top_pixel;
    wire [P_PIXEL_DEPTH - 1 : 0] top_right_pixel;
    wire [P_PIXEL_DEPTH - 1 : 0] middle_left_pixel;
    wire [P_PIXEL_DEPTH - 1 : 0] middle_right_pixel;
    wire [P_PIXEL_DEPTH - 1 : 0] bottom_left_pixel;
    wire [P_PIXEL_DEPTH - 1 : 0] bottom_pixel;
    wire [P_PIXEL_DEPTH - 1 : 0] bottom_right_pixel;

    reg [P_O_PIXEL_MATRIX_BIT_COUNT - 1 : 0] q_o_pixel; // The current state of the output pixel
    wire [P_O_PIXEL_MATRIX_BIT_COUNT - 1 : 0] n_o_pixel; // The next state of the output pixel

    // END registers and wires

    // START output mapping
    assign O_PIXEL = q_o_pixel;
    // END output mapping

    // START RTL logic
    assign previous_column_valid = I_COLUMN == {P_COLUMNS_BIT_COUNT{1'b0}} ? 1'b0 : 1'b1;
    assign next_column_valid = I_COLUMN == P_COLUMNS - 1 ? 1'b0 : 1'b1;
    assign previous_row_valid = I_ROW == {P_ROWS_BIT_COUNT{1'b0}} ? 1'b0 : 1'b1;
    assign next_row_valid = I_ROW == P_ROWS - 1 ? 1'b0 : 1'b1;

    assign previous_column_index = I_COLUMN - 1;
    assign next_column_index = I_COLUMN + 1;
    assign previous_row_index = I_ROW - 1;
    assign next_row_index = I_ROW + 1;

    assign top_left_pixel = previous_column_valid && previous_row_valid ?
            buffer_registers[previous_row_index][previous_column_index] : {P_PIXEL_DEPTH{1'b0}};

    assign top_pixel = previous_row_valid ?
            buffer_registers[previous_row_index][I_COLUMN] : {P_PIXEL_DEPTH{1'b0}};

    assign top_right_pixel = next_column_valid && previous_row_valid ?
            buffer_registers[previous_row_index][next_column_index] : {P_PIXEL_DEPTH{1'b0}};

    assign middle_left_pixel = previous_column_valid ?
            buffer_registers[I_ROW][previous_column_index] : {P_PIXEL_DEPTH{1'b0}};

    assign middle_right_pixel = next_column_valid ?
            buffer_registers[I_ROW][next_column_index] : {P_PIXEL_DEPTH{1'b0}};

    assign bottom_left_pixel = previous_column_valid && next_row_valid ?
            buffer_registers[next_row_index][previous_column_index] : {P_PIXEL_DEPTH{1'b0}};

    assign bottom_pixel = next_row_valid ?
            buffer_registers[next_row_index][I_COLUMN] : {P_PIXEL_DEPTH{1'b0}};

    assign bottom_right_pixel = next_column_valid && next_row_valid ?
            buffer_registers[next_row_index][next_column_index] : {P_PIXEL_DEPTH{1'b0}};

    assign n_o_pixel = (I_READ_ENABLE == 1'b1 && I_WRITE_ENABLE == 1'b0) ?
                        {
                            top_left_pixel, top_pixel, top_right_pixel,
                            middle_left_pixel, middle_right_pixel,
                            bottom_left_pixel, bottom_pixel, bottom_right_pixel
                        }
                        : q_o_pixel;
    // END RTL logic

    // Clock block
    always @(posedge I_CLK) begin
        if(I_RESET == 1'b1) begin
            q_o_pixel <= {P_O_PIXEL_MATRIX_BIT_COUNT{1'b0}};
            reset_buffer_registers;
        end else begin
            q_o_pixel <= n_o_pixel;
            set_buffer_registers;
        end
    end

    // START tasks

    // Task to set all the buffer registers to 0
    task reset_buffer_registers;
        // TODO determine if the synthesizer will implement this 'mass' reset
        // of the buffer_registers properly.
        integer row, column;
        for (row = 0; row < P_ROWS; row = row + 1) begin
            for (column = 0; column < P_COLUMNS; column = column + 1) begin
                buffer_registers[row][column] <= {P_PIXEL_DEPTH{1'b0}};
            end
        end
    endtask

    // Task to set registers in the buffer to the input pixel
    task set_buffer_registers;
        if (I_READ_ENABLE == 1'b0 && I_WRITE_ENABLE == 1'b1) begin
            buffer_registers[I_ROW][I_COLUMN] <= I_PIXEL;
        end
    endtask

    // END tasks
endmodule
