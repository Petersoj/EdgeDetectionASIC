////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 11/30/2020
// Module Name: frame_buffer_matrix3
// Description: A memory buffer for a 2D matrix/frame with a 3x3 matrix output
//              following the following format:
//              {top_left,    top,    top_right,
//               middle_left, 	      middle_right,
//               bottom_left, bottom, bottom_right}
//              NOTE the output matrix excludes the center pixel which yields a total of 8 pixels.
// Authors: Jacob Peterson
//
////

module frame_buffer_matrix3
    #(
    parameter integer P_COLUMNS = 640, // The number of columns in the frame
    parameter integer P_ROWS = 4, // The number of rows in the frame
    parameter integer P_PIXEL_DEPTH = 8, // The color depth of the pixel
    parameter integer P_MATRIX_PIXEL_DEPTH = 8, // pixel depth fed into sobel filter (P_PIXEL_DEPTH padded with 0s on LSBs)

    // START port list local parameters
    parameter integer P_COLUMNS_BITS = $clog2(P_COLUMNS),
    parameter integer P_ROWS_BITS = $clog2(P_ROWS),
    parameter integer P_O_PIXEL_MATRIX_BITS = P_MATRIX_PIXEL_DEPTH * 8
    // END port list local parameters
    )
    (
    input wire I_CLK, // Clock input
    input wire I_RESET, // Reset input
    input wire [P_COLUMNS_BITS - 1 : 0] I_COLUMN, // The column of the desired pixel
    input wire [P_ROWS_BITS - 1 : 0] I_ROW, // The row of the desired pixel
    input wire [P_PIXEL_DEPTH - 1 : 0] I_PIXEL, // The pixel data input
    input wire I_WRITE_ENABLE, // Enable writing of the pixel data at the associated row and column input
    input wire I_READ_ENABLE, // Enable reading of the pixel data at the associated row and column input

    output wire [P_O_PIXEL_MATRIX_BITS - 1 : 0] O_PIXEL_MATRIX // The 3x3 pixel data matrix output
    );

    // START registers and wires

    // The following is the 2D array of registers for the frame buffer accessed as [row][column].
    reg [P_PIXEL_DEPTH - 1 : 0] buffer_registers [0 : P_ROWS - 1][0 : P_COLUMNS - 1];

    wire [P_COLUMNS_BITS - 1 : 0] previous_column_index; // The index of the column before the column of the desired pixel
    wire [P_COLUMNS_BITS - 1 : 0] next_column_index; // The index of the column after the column of the desired pixel
    wire [P_ROWS_BITS - 1 : 0] previous_row_index; // The index of the row before the row of the desired pixel
    wire [P_ROWS_BITS - 1 : 0] next_row_index; // The index of the row after the row of the desired pixel

    // The following define the wires of the 3x3 matrix pixels as chosen by the desired row and column inputs.
    wire [P_MATRIX_PIXEL_DEPTH - 1 : 0] top_left_pixel;
    wire [P_MATRIX_PIXEL_DEPTH - 1 : 0] top_pixel;
    wire [P_MATRIX_PIXEL_DEPTH - 1 : 0] top_right_pixel;
    wire [P_MATRIX_PIXEL_DEPTH - 1 : 0] middle_left_pixel;
    wire [P_MATRIX_PIXEL_DEPTH - 1 : 0] middle_right_pixel;
    wire [P_MATRIX_PIXEL_DEPTH - 1 : 0] bottom_left_pixel;
    wire [P_MATRIX_PIXEL_DEPTH - 1 : 0] bottom_pixel;
    wire [P_MATRIX_PIXEL_DEPTH - 1 : 0] bottom_right_pixel;

    reg [P_O_PIXEL_MATRIX_BITS - 1 : 0] q_o_pixel_matrix; // The current state of the output pixel matrix
    wire [P_O_PIXEL_MATRIX_BITS - 1 : 0] n_o_pixel_matrix; // The next state of the output pixel matrix

    // END registers and wires

    // START output mapping
    assign O_PIXEL_MATRIX = q_o_pixel_matrix;
    // END output mapping

    // START RTL logic

    assign previous_column_index = (I_COLUMN == 0) ? (P_COLUMNS - 1) : I_COLUMN - 1;
    assign next_column_index = (I_COLUMN == (P_COLUMNS - 1)) ? {P_COLUMNS_BITS{1'b0}} : I_COLUMN + 1;
    assign previous_row_index = (I_ROW == 0) ? (P_ROWS - 1) : I_ROW - 1;
    assign next_row_index = (I_ROW == P_ROWS - 1) ? {P_ROWS_BITS{1'b0}} : I_ROW + 1;

    assign top_pixel =          {buffer_registers[previous_row_index][I_COLUMN], 5'h0};
    assign top_left_pixel =     {buffer_registers[previous_row_index][previous_column_index], 5'h0};
    assign top_right_pixel =    {buffer_registers[previous_row_index][next_column_index], 5'h0};
    assign middle_left_pixel =  {buffer_registers[I_ROW][previous_column_index], 5'h0};
    assign middle_right_pixel = {buffer_registers[I_ROW][next_column_index], 5'h0};
    assign bottom_left_pixel =  {buffer_registers[next_row_index][previous_column_index], 5'h0};
    assign bottom_pixel =       {buffer_registers[next_row_index][I_COLUMN], 5'h0};
    assign bottom_right_pixel = {buffer_registers[next_row_index][next_column_index], 5'h0};    
    

    assign n_o_pixel_matrix = (I_READ_ENABLE == 1'b1 && I_WRITE_ENABLE == 1'b0) ?
                        {
                            top_left_pixel, top_pixel, top_right_pixel,
                            middle_left_pixel, middle_right_pixel,
                            bottom_left_pixel, bottom_pixel, bottom_right_pixel
                        }
                        : q_o_pixel_matrix;
    // END RTL logic

    // Clock block
    always @(posedge I_CLK) begin
        if(I_RESET == 1'b1) begin
            q_o_pixel_matrix <= {P_O_PIXEL_MATRIX_BITS{1'b0}};
            reset_buffer_registers;
        end else begin
            q_o_pixel_matrix <= n_o_pixel_matrix;
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
