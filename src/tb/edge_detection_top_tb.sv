////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/01/2020
// Module Name: edge_detection_top_tb
// Description: The top module testbench
// Authors: Jacob Peterson, Daryl Warner, Trent Bennet, Aaron Pettit
//
////

`timescale 1 ps / 1 ps
`define H_PIXELS  640
`define V_LINES   480

module edge_detection_top_tb();

  logic [2000:0]  vector_file_name = "../../vectors/rocks.ppm";
  logic [23:0]    pixel_input_data[`V_LINES][`H_PIXELS];
  logic [100:0]   vid_x, vid_y;
  logic           reset;
  logic           clk_100, clk_pix;
  logic           istrb_clk_100, istrb_clk_pix;
  logic           i_de, i_vs, i_hs;
  logic [23:0]    i_pix_data;
  // generate clock
  initial clk_100 = 1'b1;
  always
  begin
    #5000 clk_100 = 1'b0;
    #5000 clk_100 = 1'b1;
  end
  assign #300 istrb_clk_100 = clk_100;

  initial clk_pix = 1'b1; // 25.175 MHz Pixel Clock
  always
  begin
    #19861 clk_pix = 1'b0;
    #19861 clk_pix = 1'b1;
  end
  assign #300 istrb_clk_pix = clk_pix;

edge_detection_top DUT
  (
  .I_RST          (reset),     // Input Reset
  .I_CLK_100      (clk_100),     // Input Core Clock (100 MHz?)
  .I_PIX_DATA     (i_pix_data),     // Input RGB Pixel Data
  .I_VSYNC        (i_vs),     // Input Vertical Sync
  .I_HSYNC        (i_hs),     // Input Horizontal Sync
  .I_DE           (i_de),     // Input Data Enable (Data Valid)
  .I_PCLK         (clk_pix),     // Input Pixel Clock (25.175 MHz)
  .O_PIX_DATA     (),     // Output RGB Pixel Data
  .O_VSYNC        (),     // Output Vertical Sync
  .O_HSYNC        (),     // Output Horizontal Sync
  .O_DE           (),     // Output Data Enable (Data Valid)
  .O_PCLK         ()      // Output Pixel Clock (25.175 MHz)
  );

  initial begin
    $display("================================================================");
    $display("========================== BEGIN SIM ===========================");
    $display("================================================================");
    
    tb_init;
    fork
      // run tests
      video_input_stream;
    join
    $display("================================================================");
    $display("=========================== END SIM ============================");
    $display("================================================================");
  end

  task tb_init;
    begin
      read_ppm_file(vector_file_name, pixel_input_data);
      reset = 1'b1;
      repeat(10) @(posedge clk_100);
      reset = 1'b0;
      repeat(10) @(posedge clk_100);
    end
  endtask

  task video_input_stream;
    i_de = 1'b1; // TO BE REMOVED
    begin
      $display ("+++ video_input_stream");
      vid_x = 0;
      vid_y = 0;
      while(vid_y < `V_LINES) begin
        @(posedge istrb_clk_pix);
        if(i_de == 1'b1)
        begin
          i_pix_data = pixel_input_data[vid_y][vid_x];
          @(posedge clk_pix);
          if(vid_x < `H_PIXELS - 1)
            vid_x = vid_x + 1;
          else
          begin
            vid_x = 0;
            vid_y = vid_y + 1;
          end
        end
        else
          @(posedge clk_pix);
      end
    end
    $display ("--- video_input_stream");
  endtask

  task read_ppm_file
    (
      input   [2000:0]  file_name,
      output  [23:0]    pixel_data[`V_LINES][`H_PIXELS]
    );
    begin
      string temp;
      integer fd, r;
      reg [7:0] pix_r, pix_g, pix_b;
      reg [11:0] pixel_count, line_count, pixel_depth;
      $display("+++ read_ppm_file");
      fd = $fopen(file_name, "r");
      // Strip off the header from file
      $fgets(temp, fd); // Read the 'P3'
      // Read the number of pixels, number of lines, pixel depth
      r = $fscanf(fd, "%d %d %d", pixel_count, line_count, pixel_depth);
      $display("Number of Pixels - %0d", pixel_count);
      $display("Number of Lines  - %0d", line_count);
      $display("Color depth      - %0d", pixel_depth);
      
      for(int i = 0; i < line_count; i++) begin
        for(int j = 0; j < pixel_count; j++) begin
          for(int k = 0; k < 3; k++) begin
            if (k == 0)
              r = $fscanf(fd, "%d", pix_r);
            if (k == 1)
              r = $fscanf(fd, "%d", pix_g);
            if (k == 2)
              r = $fscanf(fd, "%d", pix_b);
          end
          pixel_data[i][j] = {pix_r, pix_g, pix_b};
        end
      end
      $fclose(fd);
      $display("--- read_ppm_file (Read File Done)");
    end
  endtask

endmodule
