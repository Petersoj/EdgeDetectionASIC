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

  reg [23:0]  pix_data_dly;
  reg         pix_vsync_dly;

  // output mapping
  assign O_PCLK     = I_PCLK; // May need a clock buffer

  always @(posedge O_PCLK) begin
    if(I_RST == 1'b1) begin
      pix_data_dly  <= 24'h0;
      pix_vsync_dly <= 1'b0;
      // pix_hsync_dly <= 1'b0;
      // pix_de_dly    <= 1'b0;
    end
    else begin
      pix_data_dly  <= I_PIX_DATA; // Will be changed later
      pix_vsync_dly <= I_VSYNC;    // Will be changed later
    end
  end

  // Colorspace Converter
  // Line Buffer
  // Edge Detection
  // Video Sync and Timing Gen

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

  video_timing_gen iVidGen
    (
      .I_RST      (I_RST),
      .I_PCLK     (I_PCLK),
      .I_PIX_DATA (pix_data_dly), // Will need to be changed to Edge Detection Output
      .I_TP_EN    (1'b0),
      .I_HS_END   (VGA_HS_END),
      .I_HBP_END  (VGA_HBP_END),
      .I_HACT_END (VGA_HACT_END),
      .I_HFP_END  (VGA_HFP_END),
      .I_VS_END   (VGA_VS_END),
      .I_VBP_END  (VGA_VBP_END),
      .I_VACT_END (VGA_VACT_END),
      .I_VFP_END  (VGA_VFP_END),
      .I_VRST     (pix_vsync_dly), // Will need to be delayed to line up with incoming data
      .O_DE       (O_DE),
      .O_HS       (O_HSYNC),
      .O_VS       (O_VSYNC),
      .O_HCNT     (),
      .O_VCNT     (),
      .O_PIX_DATA (O_PIX_DATA)
    );

endmodule
