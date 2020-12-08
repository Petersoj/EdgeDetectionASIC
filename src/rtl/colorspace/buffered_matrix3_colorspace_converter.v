////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/28/2020
// Module Name: buffered_matrix_colorspace_converter
// Description: Converts an RGB colorspace VGA input to a grayscaled pixel matrix output.
// Authors: Jacob Peterson
//
////

module buffered_matrix3_colorspace_converter
    #(
    parameter integer P_FRAME_COLUMNS = 640, // The number of columns in the frame
    parameter integer P_FRAME_ROWS = 480, // The number of rows in the frame
    parameter integer P_PIXEL_DEPTH = 24, // The color depth of the pixel (MUST be a multiple of 3)

    // START port list local parameters

    parameter integer P_FRAME_COLUMN_BITS = $clog2(P_FRAME_COLUMNS), // 10
    parameter integer P_FRAME_ROW_BITS = $clog2(P_FRAME_ROWS), // 9
    parameter integer P_SUBPIXEL_DEPTH = P_PIXEL_DEPTH / 3, // 8

    // This is the dimension size of the square 2D pixel matrix output.
    parameter integer P_OUTPUT_MATRIX_SIZE = 3,

    // The output matrix excludes the center grayscaled pixel so we subtract one P_SUBPIXEL_DEPTH.
    parameter integer P_PIXEL_MATRIX_BITS = (P_SUBPIXEL_DEPTH * P_OUTPUT_MATRIX_SIZE * P_OUTPUT_MATRIX_SIZE) - P_SUBPIXEL_DEPTH

    // END port list local parameters
    )
    (
    input wire I_CLK, // Clock input
    input wire I_RESET, // Reset input

    input wire I_PIXEL_CLK, // Pixel clock input
    input wire I_DATA_VALID, // The data valid input (should be asserted when in the active region of the frame)
    input wire [P_PIXEL_DEPTH - 1 : 0] I_PIXEL,  // RGB pixel input

    output wire [P_FRAME_COLUMN_BITS - 1 : 0] O_PIXEL_COLUMN, // The start column of the output matrix relative to the start column of the frame output
    output wire [P_FRAME_ROW_BITS - 1 : 0] O_PIXEL_ROW, // The start row of the output matrix relative to the start row of the frame output

    // The grayscaled pixel matrix output (excludes the center pixel for Sobel filter specification)
    // Format:
    // {top_left,    top,    top_right,
    //  middle_left, 	      middle_right,
    //  bottom_left, bottom, bottom_right}
    output wire [P_PIXEL_MATRIX_BITS - 1 : 0] O_PIXEL_MATRIX,
    output wire O_PIXEL_MATRIX_READY // Matrix ready output (asserted if outputs are ready/valid)
    );

    // START local parameters
    localparam P_HTOTAL = 800;
    localparam P_FRAME_BUFFER_ROWS = 3; // The number of rows to use for the internal grayscaled pixel buffer
    localparam P_FRAME_BUF_ROW_BITS = 2;
    localparam P_FRAME_BUFFER_REQUIRED_COLUMNS = 2; // The minimum number of columns required for a valid pixel matrix output
    localparam P_FRAME_BUFFER_REQUIRED_ROWS = 2; // The minimum number of rows required for a valid pixel matrix output
    localparam P_FRAME_BUFFER_COLUMN_END = P_FRAME_COLUMNS - 1 - P_FRAME_BUFFER_REQUIRED_COLUMNS - 1;
    localparam P_FRAME_BUFFER_ROW_END = P_FRAME_ROWS - 1 - P_FRAME_BUFFER_REQUIRED_ROWS - 1;
    // END local parameters

    // START registers and wires

    // States for input frame (synchronized with pixel clock)
    // reg q_frame_reset; // The current state of if current frame row and column should be reset to zero
    // wire n_frame_reset; // The next state of if current frame row and column should be reset to zero
    // reg [P_FRAME_COLUMN_BITS - 1 : 0] q_frame_column; // The current state of the current frame pixel column
    // wire [P_FRAME_COLUMN_BITS - 1 : 0] n_frame_column; // The next state of the current frame pixel column
    // reg [P_FRAME_ROW_BITS - 1 : 0] q_frame_row; // The current state of the current frame pixel row
    // wire [P_FRAME_ROW_BITS - 1 : 0] n_frame_row; // The next state of the current frame pixel row

    // Wires for iGrayscale
    wire [P_SUBPIXEL_DEPTH - 1 : 0] grayscaled_pixel; // Grayscale output of the directly-inputted pixel

    // START states/registers for iGrayscaledFrameBufferMatrix3

    // wire should_frame_buffer_index_increment; // Asserted if the frame buffer index should start counting/incrementing in sync with the input pixel clock

    reg q_i_pixel_clock_was_low; // The current state of if the pixel clock was low
    wire n_i_pixel_clock_was_low; // The next state of if the pixel clock was low
    reg q_i_pixel_clock_posedge_pulse; // The current state of the pixel clock positive edge assertion pulse
    wire n_i_pixel_clock_posedge_pulse; // The next state of the pixel clock positive edge assertion pulse

    reg q_frame_buffer_reset; // The current state of if current frame buffer row and column should be reset to zero
    wire n_frame_buffer_reset; // The next state of if current frame buffer row and column should be reset to zero
    reg [P_FRAME_COLUMN_BITS - 1 : 0] q_frame_buffer_column; // The current state of the frame buffer column index
    wire [P_FRAME_COLUMN_BITS - 1 : 0] n_frame_buffer_column;
    wire [P_FRAME_BUF_ROW_BITS - 1 : 0] frame_buffer_row; // The next state of the frame buffer row index

    reg q_frame_buffer_write_enable; // The current state of if the frame buffer should enable writing
    wire n_frame_buffer_write_enable; // The next state of if the frame buffer should enable writing
    reg q_frame_buffer_read_enable; // The current state of if the frame buffer should enable reading
    wire n_frame_buffer_read_enable; // The next state of if the frame buffer should enable reading

    // END states/registers for iGrayscaledFrameBufferMatrix3

    // States for output
    reg [P_FRAME_COLUMN_BITS - 1 : 0] q_o_pixel_column; // The current state of the output pixel column
    wire [P_FRAME_COLUMN_BITS - 1 : 0] n_o_pixel_column; // The next state of the output pixel column
    reg [P_FRAME_ROW_BITS - 1 : 0] q_o_pixel_row; // The current state of the output pixel row
    wire [P_FRAME_ROW_BITS - 1 : 0] n_o_pixel_row; // The next state of the output pixel row
    reg [P_PIXEL_MATRIX_BITS - 1 : 0] q_o_pixel_matrix; // The current state of the output pixel matrix
    wire [P_PIXEL_MATRIX_BITS - 1 : 0] n_o_pixel_matrix; // The next state of the output pixel matrix
    reg q_o_pixel_matrix_ready; // The current state of the output pixel matrix ready signal
    wire n_o_pixel_matrix_ready; // The next state of the output pixel matrix ready signal

    reg   [8:0]   q_row_ctr;
    wire  [8:0]   n_row_ctr;
    reg           q_row_rst_pulse;
    wire          n_row_rst_pulse;
    reg   [9:0]   q_col_ctr;
    wire  [9:0]   n_col_ctr;
    reg           q_col_rst_pulse;
    wire          n_col_rst_pulse;
    reg           q_de_dly;
    wire          n_de_dly;

    reg           q_pclk_dly;
    wire          n_pclk_dly;
    reg           q_pclk_posedge_pulse;
    wire          n_pclk_posedge_pulse;
    
    reg   [8:0]   q_rd_y_index_pclk;
    wire  [8:0]   n_rd_y_index_pclk;
    reg           q_y_rst_pulse;
    wire          n_y_rst_pulse;
    reg   [9:0]   q_rd_x_index_pclk;
    wire  [9:0]   n_rd_x_index_pclk;
    reg           q_x_rst_pulse;
    wire          n_x_rst_pulse;
    reg   [8:0]   q_rd_y_index;
    wire  [8:0]   n_rd_y_index;

    wire  [1:0]   n_frame_buffer_wr_row;
    reg   [1:0]   q_frame_buffer_wr_row;
    wire  [1:0]   n_frame_buffer_rd_row; 
    reg   [1:0]   q_frame_buffer_rd_row;
    wire  [1:0]   n_wr_y_ctr;
    reg   [1:0]   q_wr_y_ctr;
    wire  [1:0]   n_rd_y_ctr;
    reg   [1:0]   q_rd_y_ctr;

    reg         rst_pclk;
    reg         rst_cclk;
    
    always @(posedge I_PIXEL_CLK) begin
      rst_pclk <= I_RESET;
    end
    always @(posedge I_CLK) begin
      rst_cclk <= I_RESET;
    end

    // END registers and wires

    // START output mapping
    assign O_PIXEL_COLUMN = q_o_pixel_column;
    assign O_PIXEL_ROW = q_o_pixel_row;
    assign O_PIXEL_MATRIX = q_o_pixel_matrix;
    assign O_PIXEL_MATRIX_READY = q_o_pixel_matrix_ready;
    // END output mapping

    // START RTL logic
    assign n_row_ctr = (rst_pclk == 1'b1) ? 9'h0 :
                       (q_row_rst_pulse == 1'b1) ? 9'h0 :
                       (q_col_rst_pulse == 1'b1) ? q_row_ctr + 1 :
                       q_row_ctr;
    assign n_col_ctr = (rst_pclk == 1'b1) ? 10'h0 :
                       (I_DATA_VALID == 1'b0 || q_col_rst_pulse == 1'b1) ? 10'h0 :
                       q_col_ctr + 1;
    assign n_col_rst_pulse = (q_col_ctr == P_FRAME_COLUMNS) ? 1'b1 : 1'b0;
    assign n_row_rst_pulse = (q_row_ctr == P_FRAME_ROWS) ? 1'b1 : 1'b0;

    // the following signals and counters are used to get the read indicies
    assign n_de_dly = I_DATA_VALID;
    // same as n_row_rst_pulse
    // assign n_frame_reset = q_frame_column == P_FRAME_COLUMNS - 1 && q_frame_row == P_FRAME_ROWS - 1;
    // same as n_col_ctr
    // assign n_frame_column = q_frame_column == P_FRAME_COLUMNS - 1 ? {P_FRAME_COLUMN_BITS{1'b0}} :
    //             (I_DATA_VALID ? q_frame_column + 1'b1 : q_frame_column);
    // same as n_row_ctr
    // assign n_frame_row = q_frame_reset ? {P_FRAME_ROW_BITS{1'b0}} :
    //             (q_frame_column == P_FRAME_COLUMNS - 1 ? q_frame_row + 1'b1 : q_frame_row);
    // not used as far as I can tell
    // assign should_frame_buffer_index_increment = q_frame_column >= P_FRAME_BUFFER_REQUIRED_COLUMNS - 1 &&
    //             q_frame_row >= P_FRAME_BUFFER_REQUIRED_ROWS - 1;

    assign n_pclk_dly = I_PIXEL_CLK;
    assign n_pclk_posedge_pulse = (q_pclk_dly == 1'b0 && I_PIXEL_CLK == 1'b1) ? 1'b1 : 1'b0;

    // assign n_i_pixel_clock_was_low = ~I_PIXEL_CLK;
    // assign n_i_pixel_clock_posedge_pulse = q_i_pixel_clock_posedge_pulse ? 1'b0 :
    //             (I_PIXEL_CLK && n_i_pixel_clock_was_low);

    // NOTE this is a somewhat flawed implementation because this will stop counting prematurely
    // because the 'data valid' input will be low and we will still want to continue incrementing
    // our internal grayscale frame buffer even after that goes low. Instead, we'll just exclude
    // a margin of the frame border from consideration.
    // fixed, no longer used, may be needed to reset the frame buffer (pixels are no longer in active region)
    assign n_frame_buffer_reset = (q_frame_buffer_rd_row == P_FRAME_BUFFER_ROWS) ? 1'b1 : 1'b0;
    // fixed
    assign n_frame_buffer_column =  (q_frame_buffer_write_enable == 1'b1) ? q_col_ctr : q_frame_buffer_column;
    // fixed
    assign frame_buffer_row = (q_frame_buffer_write_enable == 1'b1) ? q_frame_buffer_wr_row : q_frame_buffer_rd_row;
    assign n_frame_buffer_wr_row =  (q_y_rst_pulse == 1'b1) ? 2'b0 :
                                    (q_frame_buffer_write_enable == 1'b1) ? q_wr_y_ctr : 
                                    q_frame_buffer_wr_row;
    assign n_frame_buffer_rd_row =  (q_y_rst_pulse == 1'b1) ? 2'b0 :
                                    (q_frame_buffer_read_enable == 1'b1) ? q_rd_y_ctr : 
                                    q_frame_buffer_rd_row;
    // fixed
    assign n_frame_buffer_write_enable = (I_DATA_VALID && q_pclk_posedge_pulse) ? 1'b1 : 1'b0;
    // fixed? 
    assign n_frame_buffer_read_enable = (I_DATA_VALID && q_pclk_posedge_pulse) ? 1'b0 : 1'b1;

    // assign n_rd_y_index = (q_row_ctr >= 2) ?  : q_rd_y_index;

    // q_col_ctr and q_row_ctr contain the WRITE location
    // q_wr_x_index and q_wr_y_index contain the WRITE locations
    // q_rd_x_index and q_rd_y_index contain the READ location

    assign n_rd_y_index = (q_row_ctr - 2 > 480) ? 10'b0 : q_row_ctr - 2;

    assign n_y_rst_pulse = (q_row_ctr == 0 && q_x_rst_pulse == 1'b1) ? 1'b1 : 
                            1'b0;
    assign n_x_rst_pulse = (q_de_dly == 1'b0 && I_DATA_VALID == 1'b1 && q_pclk_posedge_pulse == 1'b1) ? 1'b1 : 
                            1'b0;
    assign n_wr_y_ctr =    (q_y_rst_pulse == 1'b1 || q_wr_y_ctr == 2'd3) ? 2'b0 :
                           (q_x_rst_pulse == 1'b1) ? q_wr_y_ctr + 1 :
                           q_wr_y_ctr;
    assign n_rd_y_ctr =    (n_wr_y_ctr == 2'd0) ? 2'd1 :
                           (n_wr_y_ctr == 2'd1) ? 2'd2 :
                           2'd0;

    assign n_o_pixel_column = q_col_ctr;
    assign n_o_pixel_row = n_rd_y_index;

    // broken
    assign n_o_pixel_matrix_ready = I_DATA_VALID;
    // END RTL logic

    // START module instantiations
    grayscale #(
        .P_PIXEL_DEPTH(P_PIXEL_DEPTH)
        )
        iGrayscale
        (
        .I_CLK(I_CLK),
        .I_RESET(rst_cclk),
        .I_PIXEL(I_PIXEL),

        .O_PIXEL(grayscaled_pixel)
        );

    frame_buffer_matrix3 #(
        .P_COLUMNS(P_FRAME_COLUMNS),
        .P_ROWS(P_FRAME_BUFFER_ROWS),
        .P_PIXEL_DEPTH(4),
        .P_MATRIX_PIXEL_DEPTH(8)
        )
        iGrayscaledFrameBufferMatrix3
        (
        .I_CLK(I_CLK),
        .I_RESET(rst_cclk),
        .I_COLUMN(q_frame_buffer_column),
        .I_ROW(frame_buffer_row),
        .I_PIXEL(grayscaled_pixel[7:4]),
        .I_WRITE_ENABLE(q_frame_buffer_write_enable),
        .I_READ_ENABLE(q_frame_buffer_read_enable),

        .O_PIXEL_MATRIX(n_o_pixel_matrix)
        );
    // END module instantiations
    
    // Clock block
    always @(posedge I_CLK) begin
        if (rst_cclk) begin
            q_i_pixel_clock_was_low <= 1'b0;
            q_i_pixel_clock_posedge_pulse <= 1'b0;

            q_frame_buffer_write_enable <= 1'b0;
            q_frame_buffer_read_enable <= 1'b0;

            q_o_pixel_column <= {P_FRAME_COLUMN_BITS{1'b0}};
            q_o_pixel_row <= {P_FRAME_ROW_BITS{1'b0}};
            q_o_pixel_matrix <= {P_PIXEL_MATRIX_BITS{1'b0}};
            q_o_pixel_matrix_ready <= 1'b0;

            q_pclk_dly <= 1'b0;
            q_pclk_posedge_pulse <= 1'b0;            
            q_frame_buffer_reset <= 1'b0;
            q_frame_buffer_wr_row <= {P_FRAME_BUF_ROW_BITS{1'b0}};
            q_frame_buffer_rd_row <= {P_FRAME_BUF_ROW_BITS{1'b0}};
            q_frame_buffer_column <= 10'b0;
            q_rd_y_index <= 9'b0;
            q_x_rst_pulse <= 1'b0;
            q_y_rst_pulse <= 1'b0;
            q_wr_y_ctr <= 2'b0;
            q_rd_y_ctr <= 2'b0;
        end else begin
            q_i_pixel_clock_was_low <= n_i_pixel_clock_was_low;
            q_i_pixel_clock_posedge_pulse <= n_i_pixel_clock_posedge_pulse;

            q_frame_buffer_write_enable <= n_frame_buffer_write_enable;
            q_frame_buffer_read_enable <= n_frame_buffer_read_enable;

            q_o_pixel_column <= n_o_pixel_column;
            q_o_pixel_row <= n_o_pixel_row;
            q_o_pixel_matrix <= n_o_pixel_matrix;
            q_o_pixel_matrix_ready <= n_o_pixel_matrix_ready;

            q_pclk_dly <= n_pclk_dly;
            q_pclk_posedge_pulse <= n_pclk_posedge_pulse;
            q_frame_buffer_reset <= n_frame_buffer_reset;
            q_frame_buffer_wr_row <= n_frame_buffer_wr_row;
            q_frame_buffer_rd_row <= n_frame_buffer_rd_row;
            q_frame_buffer_column <= n_frame_buffer_column;
            q_rd_y_index <= n_rd_y_index;
            q_x_rst_pulse <= n_x_rst_pulse;
            q_y_rst_pulse <= n_y_rst_pulse;
            q_wr_y_ctr <= n_wr_y_ctr;
            q_rd_y_ctr <= n_rd_y_ctr;
        end
    end

    // Pixel clock block
    always @(posedge I_PIXEL_CLK) begin
        if (rst_pclk) begin
            // q_frame_reset <= 1'b0;
            // q_frame_column <= {P_FRAME_COLUMN_BITS{1'b0}};
            // q_frame_row <= {P_FRAME_ROW_BITS{1'b0}};

            q_de_dly <= 1'b0;
            q_row_rst_pulse <= 1'b0;
            q_col_ctr <= 10'h0;
            q_row_ctr <= 9'h0;
            q_col_rst_pulse <= 1'b0;
            q_rd_y_index_pclk <= 9'h0;
            q_rd_x_index_pclk <= 10'b0;
        end else begin
            // q_frame_reset <= n_frame_reset;
            // q_frame_column <= n_frame_column;
            // q_frame_row <= n_frame_row;

            q_de_dly <= n_de_dly;
            q_row_rst_pulse <= n_row_rst_pulse;
            q_col_ctr <= n_col_ctr;
            q_row_ctr <= n_row_ctr;
            q_col_rst_pulse <= n_col_rst_pulse;
            q_rd_y_index_pclk <= n_rd_y_index_pclk;
            q_rd_x_index_pclk <= n_rd_x_index_pclk;
        end
    end
endmodule
