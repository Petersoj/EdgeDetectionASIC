////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/01/2020
// Module Name: edge_detection_top
// Description: The top module
// Authors: Jacob Peterson, Daryl Warner, Trent Bennet, Aaron Pettit
//
////

module edge_detection_top
  (
    input wire          I_RST,       // Input Reset
    input wire          I_CLK_100,   // Input Core Clock (100 MHz?)
                                     
    input wire  [23:0]  I_PIX_DATA,  // Input RGB Pixel Data
    input wire	        I_VSYNC,     // Input Vertical Sync
    input wire          I_HSYNC,     // Input Horizontal Sync
    input wire          I_DE,        // Input Data Enable (Data Valid)
    input wire          I_PCLK,      // Input Pixel Clock (25.175 MHz)
                                     
    output wire [23:0]  O_PIX_DATA,  // Output RGB Pixel Data
    output wire         O_VSYNC,     // Output Vertical Sync
    output wire         O_HSYNC,     // Output Horizontal Sync
    output wire         O_DE,        // Output Data Enable (Data Valid)
    output wire         O_PCLK       // Output Pixel Clock (25.175 MHz)
  );

  // Colorspace Converter
  // Line Buffer
  // Edge Detection
  // Video Sync and Timing Gen
endmodule
