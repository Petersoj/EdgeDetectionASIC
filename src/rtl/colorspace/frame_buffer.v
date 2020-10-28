////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/23/2020
// Module Name: frame_buffer
// Description: A memory buffer for a 2D matrix/frame.
// Authors: Jacob Peterson
//
////

module frame_buffer
    #(
    parameter integer P_COLUMNS = 32'd640, // The number of columns in the frame
    parameter integer P_ROWS = 32'd3, // The number of rows in the frame
    parameter integer P_PIXEL_DEPTH = 32'd24 // The color depth of the pixel
    )
    (
    input wire I_CLK, // Clock input for FSM
    input wire I_RESET, // Reset input
    input wire I_ENABLE, // Enable input
    input wire [$clog2(P_COLUMNS) - 1:0] I_PIXEL_COL, // The column of the desired pixel
    input wire [$clog2(P_ROWS) - 1:0] I_PIXEL_ROW, // The row of the desired pixel
    input wire [P_PIXEL_DEPTH - 1:0] I_PIXEL, // The pixel data input
    input wire I_WRITE_ENABLE, // Enable writing of the pixel data at the associated row and column input
    input wire I_READ_ENABLE, // Enable reading of the pixel data at the associated row and column input

    output wire [P_PIXEL_DEPTH - 1:0] O_PIXEL // The pixel data output
    );

    parameter integer P_TOTAL_PIXEL_COUNT = P_COLUMNS * P_ROWS; // The number of pixels in the frame

    reg [P_PIXEL_DEPTH - 1:0] buffer_registers [0:P_TOTAL_PIXEL_COUNT - 1]; // The array of registers for the frame buffer
    wire [$clog2(P_TOTAL_PIXEL_COUNT) - 1:0] buffer_registers_index; // The index of the desired pixel in the array of registers
    reg [P_PIXEL_DEPTH - 1:0] q_o_pixel; // The current state of the output pixel
    wire [P_PIXEL_DEPTH - 1:0] n_o_pixel; // The next state of the output pixel

    // Output mapping
    assign O_PIXEL = q_o_pixel;

    // RTL logic
    assign buffer_registers_index = (I_PIXEL_ROW * P_COLUMNS) + I_PIXEL_COL;
    assign n_o_pixel = (I_READ_ENABLE == 1'b1 && I_WRITE_ENABLE == 1'b0)
                        ? buffer_registers[buffer_registers_index]
                        : q_o_pixel;

    // Clock block
    always @(posedge I_CLK or posedge I_RESET) begin
        if (I_ENABLE == 1'b1) begin
            if(I_RESET == 1'b1) begin
                q_o_pixel <= {P_PIXEL_DEPTH{1'b0}};
                reset_buffer_registers;
            end
            else begin
                q_o_pixel <= n_o_pixel;
                set_buffer_registers;
            end
        end else begin
            q_o_pixel <= q_o_pixel;
        end
    end

    // Task to set all the buffer registers to 0
    task reset_buffer_registers;
        integer i;
        for (i = 0; i < P_TOTAL_PIXEL_COUNT; i = i + 1) begin
            buffer_registers[i] <= {P_PIXEL_DEPTH{1'b0}};
        end
    endtask

    // Task to set registers in the buffer to the input pixel
    task set_buffer_registers;
        if (I_READ_ENABLE == 1'b0 && I_WRITE_ENABLE == 1'b1) begin
            buffer_registers[buffer_registers_index] <= I_PIXEL;
        end
    endtask

endmodule
