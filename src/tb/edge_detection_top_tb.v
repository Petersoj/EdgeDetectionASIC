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

module edge_detection_top_tb();

  reg   reset;
  reg   clk_100;
  wire  istrb_clk_100;

  // generate clock
  initial clk_100 = 1'b1;
  always
  begin
    #5000 clk_100 = 1'b0;
    #5000 clk_100 = 1'b1;
  end
  assign #300 istrb_clk_100 = clk_50;

edge_detection_top DUT
  (
  .I_RST          (reset),     // Input Reset
  .I_CLK_100      (clk_100),     // Input Core Clock (100 MHz?)
  .I_PIX_DATA     (24'h0),     // Input RGB Pixel Data
  .I_VSYNC        (1'b0),     // Input Vertical Sync
  .I_HSYNC        (1'b0),     // Input Horizontal Sync
  .I_DE           (1'b0),     // Input Data Enable (Data Valid)
  .I_PCLK         (1'b0),     // Input Pixel Clock (25.175 MHz)
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
    reset = 1'b0;
    repeat(10) @(posedge clk_100);
    reset = 1'b1;
    repeat(10) @(posedge clk_100);

    // run tests

    $display("================================================================");
    $display("=========================== END SIM ============================");
    $display("================================================================");
  end

endmodule
