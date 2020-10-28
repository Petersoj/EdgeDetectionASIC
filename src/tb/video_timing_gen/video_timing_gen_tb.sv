////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/01/2020
// Module Name: video_timing_gen_tb
// Description: The top module testbench
// Authors: Jacob Peterson, Daryl Warner, Trent Bennet, Aaron Pettit
//
////

`timescale 1 ps / 1 ps
`define H_PIXELS  640
`define V_LINES   480

module video_timing_gen_tb();

  logic [2000:0]  in_vector_file_name =   "vectors/rocks.ppm";
  logic [2000:0]  out_vector_1_file_name =  "vectors/rocks_out_1.ppm";
  logic [2000:0]  out_vector_2_file_name =  "vectors/tp_out_2.ppm";
  logic [23:0]    pixel_input_data[`V_LINES][`H_PIXELS];
  logic [23:0]    pixel_output_data[`V_LINES][`H_PIXELS];
  logic [23:0]    pixel_vidgen_output_data[`V_LINES][`H_PIXELS];
  logic [100:0]   vid_x, vid_y, o_vid_x, o_vid_y;
  logic           reset;
  logic           clk_100, clk_pix, o_clk_pix;
  logic           istrb_clk_100, istrb_clk_pix;
  logic           i_de, i_vs, i_hs, o_de, o_vs, o_hs;
  logic [23:0]    i_pix_data, o_pix_data, o_vidgen_pix;

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

  parameter [11:0] VGA_HACT   = 640; // Horizontal Active (pixels)
  parameter [11:0] VGA_HFP    = 16;  // Horizontal Front Porch (pixels)
  parameter [11:0] VGA_HSW    = 96;  // Horizontal Sync Width (pixels)
  parameter [11:0] VGA_HBP    = 48;  // Horizontal Back Porch (pixels)
  parameter [11:0] VGA_VACT   = 480; // Vertical Active (lines)
  parameter [11:0] VGA_VFP    = 10;  // Vertical Front Porch (lines)
  parameter [11:0] VGA_VSW    = 2;   // Vertical Sync Width (lines)
  parameter [11:0] VGA_VBP    = 33;  // Vertical Back Porch (lines)

  parameter [11:0] VGA_HS_END   = VGA_HSW - 1;
  parameter [11:0] VGA_HBP_END  = VGA_HSW + VGA_HBP - 1;
  parameter [11:0] VGA_HACT_END = VGA_HSW + VGA_HBP + VGA_HACT - 1;
  parameter [11:0] VGA_HFP_END  = VGA_HSW + VGA_HBP + VGA_HACT + VGA_HFP - 1;
  parameter [11:0] VGA_VS_END   = VGA_VSW;
  parameter [11:0] VGA_VBP_END  = VGA_VSW + VGA_VBP;
  parameter [11:0] VGA_VACT_END = VGA_VSW + VGA_VBP + VGA_VACT;
  parameter [11:0] VGA_VFP_END  = VGA_VSW + VGA_VBP + VGA_VACT + VGA_VFP;

  video_timing_gen DUT
    (
      .I_RST      (reset),
      .I_PCLK     (clk_pix),
      .I_PIX_DATA (i_pix_data),
      .I_TP_EN    (1'b0),
      .I_HS_END   (VGA_HS_END),
      .I_HBP_END  (VGA_HBP_END),
      .I_HACT_END (VGA_HACT_END),
      .I_HFP_END  (VGA_HFP_END),
      .I_VS_END   (VGA_VS_END),
      .I_VBP_END  (VGA_VBP_END),
      .I_VACT_END (VGA_VACT_END),
      .I_VFP_END  (VGA_VFP_END),
      .I_VRST     (1'b0),
      .O_DE       (i_de),
      .O_HS       (i_hs),
      .O_VS       (i_vs),
      .O_HCNT     (),
      .O_VCNT     (),
      .O_PIX_DATA (o_pix_data)
    );

  assign o_de = i_de;

  initial begin
    $display("================================================================");
    $display("========================== BEGIN SIM ===========================");
    $display("================================================================");

    tb_init;
    fork
      // run tests
      video_input_stream;
      video_output_stream;
    join
    write_ppm_file(out_vector_2_file_name, pixel_output_data);
    $display("================================================================");
    $display("=========================== END SIM ============================");
    $display("================================================================");
    $stop;
  end

  task tb_init;
    begin
      read_ppm_file(in_vector_file_name, pixel_input_data);
      reset = 1'b1;
      repeat(10) @(posedge clk_100);
      reset = 1'b0;
      repeat(10) @(posedge clk_100);
    end
  endtask

  task video_input_stream;
    begin
      @(posedge clk_pix);
      // i_de = 1'b1; // TO BE REMOVED
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

  task video_output_stream;
    begin
      $display ("+++ video_output_stream");
      o_vid_x = 0;
      o_vid_y = 0;
      while(o_vid_y < `V_LINES) begin
        @(posedge istrb_clk_pix);
        if(o_de == 1'b1)
        begin
          pixel_output_data[o_vid_y][o_vid_x] = o_pix_data;
          @(posedge clk_pix);
          if(o_vid_x < `H_PIXELS - 1)
            o_vid_x = o_vid_x + 1;
          else
          begin
            o_vid_x = 0;
            o_vid_y = o_vid_y + 1;
          end
        end
        else
          @(posedge clk_pix);
      end
    end
    $display ("--- video_output_stream");
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
          r = $fscanf(fd, "%d", pix_r);
          r = $fscanf(fd, "%d", pix_g);
          r = $fscanf(fd, "%d", pix_b);
          pixel_data[i][j] = {pix_r, pix_g, pix_b};
        end
      end
      $fclose(fd);
      $display("--- read_ppm_file (Read File Done)");
    end
  endtask

  task write_ppm_file
    (
      input   [2000:0]  file_name,
      input   [23:0]    pixel_data[`V_LINES][`H_PIXELS]
    );
    begin
      integer fd;
      $display("+++ write_ppm_file");
      fd = $fopen(file_name, "w");
      $fwrite(fd, "P3\n640 480\n255\n");
      for(int i = 0; i < `V_LINES; i++) begin
        for(int j = 0; j < `H_PIXELS; j++) begin
          if (pixel_data[i][j] === {24{1'bx}} || pixel_data[i][j] === {24{1'bz}}) begin
            pixel_data[i][j] = {24{1'b0}};
          end
          $fwrite(fd, "%0d\n", pixel_data[i][j][23:16]);
          $fwrite(fd, "%0d\n", pixel_data[i][j][15:8]);
          $fwrite(fd, "%0d\n", pixel_data[i][j][7:0]);
        end
      end
      $fclose(fd);
      $display("--- write_ppm_file");
    end
  endtask
endmodule
