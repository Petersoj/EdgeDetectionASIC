////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/17/2020
// Module Name: video_timing_gen
// Description: Module for creating Horizontal and Vertical syncs,
// Authors: Jacob Peterson, Daryl Warner, Trent Bennet, Aaron Pettit
//
////

module video_timing_gen
  (
    input   wire        I_RST;    // Reset
    input   wire        I_PCLK;     // Pixel Clock (25.175 MHz)
    input   wire        I_PIX_DATA; // Input Pixel Data (Asyncronus)
    input   wire        I_TP_EN;    // Test Pattern Enable
    input   wire [11:0] I_HS_END;   // Constant used for Horizontal Sync Counter
    input   wire [11:0] I_HBP_END;  // Constant used for Horizontal Back Porch Counter
    input   wire [11:0] I_HACT_END; // Constant used for Horizontal Active Counter
    input   wire [11:0] I_HFP_END;  // Constant used for Horizontal Front Porch Counter
    input   wire [11:0] I_VS_END;   // Constant used for Vertical Sync Counter
    input   wire [11:0] I_VBP_END;  // Constant used for Vertical Back Porch Counter
    input   wire [11:0] I_VACT_END; // Constant used for Vertical Active Counter
    input   wire [11:0] I_VFP_END;  // Constant used for Vertical Front Porch Counter
    input   wire        I_VRST;     // Incoming Vertical Sync (used to reset counters)
    output  wire        O_DE;       // Output Data Enable
    output  wire        O_HS;       // Output Horizontal Sync
    output  wire        O_VS;       // Output Vertical Sync
    output  wire [11:0] O_HCNT;     // Output Horizontal Pixel Counter
    output  wire [11:0] O_VCNT;     // Output Vertical Line Counter
    output  wire [23:0] O_PIX_DATA  // Output Pixel Data
  );

  // State Parameters

  parameter [2:0]   S_HRESET      = 3'b000;
  parameter [2:0]   S_HSYNC       = 3'b001;
  parameter [2:0]   S_HBACK       = 3'b010;
  parameter [2:0]   S_HACT        = 3'b011;
  parameter [2:0]   S_HFRONT      = 3'b100;

  parameter [2:0]   S_VRESET      = 3'b000;
  parameter [2:0]   S_VSYNC       = 3'b001;
  parameter [2:0]   S_VBACK_START = 3'b010;
  parameter [2:0]   S_VBACK       = 3'b011;
  parameter [2:0]   S_VACT        = 3'b100;
  parameter [2:0]   S_VFRONT      = 3'b101;

  wire        n_hs_done;
  wire        n_hbp_done;
  wire        n_hact_done;
  wire        n_hfp_done;
  wire        n_vs_done;
  wire        n_vbp_done;
  wire        n_vact_done;
  wire        n_vfp_done;
  wire [11:0] n_hctr;
  wire [11:0] n_vctr;
  wire [2:0]  n_hstate;
  wire [2:0]  n_vstate;

  reg         q_hs_done;
  reg         q_hbp_done;
  reg         q_hact_done;
  reg         q_hfp_done;
  reg         q_vs_done;
  reg         q_vbp_done;
  reg         q_vact_done;
  reg         q_vfp_done;
  reg [11:0]  q_hctr;
  reg [11:0]  q_vctr;
  reg [2:0]   q_hstate;
  reg [2:0]   q_vstate;

  wire        n_hde;
  wire        n_vde;
  wire        n_hsync;
  wire        n_vsync;
  wire        n_hrst;
  wire        n_vrst;
  wire [2:0]  n_hsDly;
  wire [2:0]  n_deDly;
  wire        n_de;
  wire [23:0] n_tstpat;
  wire [23:0] n_pix_data;

  reg         q_hde;
  reg         q_vde;
  reg         q_hsync;
  reg         q_vsync;
  reg         q_hrst;
  reg         q_vrst;
  reg [2:0]   q_hsDly;
  reg [2:0]   q_deDly;
  reg         q_de;
  reg [23:0]  q_tstpat;
  reg [23:0]  q_pix_data;

  // Output Mapping
  O_DE        <= q_deDly[2];
  O_HS        <= q_hsDly[2];
  O_VS        <= q_vsync;
  O_PIX_DATA  <= (I_TP_EN) ? (q_tstpat) : (q_pix_data);
  O_HCNT      <= q_hctr - I_HBP_END; // may need to be delayed to line up with DE
  O_VCNT      <= q_vctr - I_VBP_END;

  // RTL Logic

  assign n_hs_done    = (n_hctr == I_HS_END)    ? 1'b1 : 1'b0;
  assign n_hbp_done   = (n_hctr >= I_HBP_END)   ? 1'b1 : 1'b0;
  assign n_hact_done  = (n_hctr >= I_HACT_END)  ? 1'b1 : 1'b0;
  assign n_hfp_done   = (n_hctr >= I_HFP_END)   ? 1'b1 : 1'b0;

  assign n_vs_done    = (q_vctr >= I_VS_END)    ? 1'b1 : 1'b0; 
  assign n_vbp_done   = (q_vctr >= I_VBP_END)   ? 1'b1 : 1'b0; 
  assign n_vact_done  = (q_vctr >= I_VACT_END)  ? 1'b1 : 1'b0; 
  assign n_vfp_done   = (q_vctr >= I_VFP_END)   ? 1'b1 : 1'b0; 

  assign n_vctr       = (I_VRST == 1'b1) ? 12'h0 :        // Force the line counter to 0
                        (n_vrst == 1'b1) ? 12'h0 :        // Reset the line counter, starting new field
                        (n_hrst == 1'b1) ? q_vctr + 1 :   // Increment line counter if hrst is asserted
                        q_vctr;                           // Otherwise keep old value
  assign n_hctr       = (I_RST == 1'b1 || n_hrst == 1'b1) ? 12'h0 : // Reset pixel counter, starting new line
                        q_hctr + 1;                                 // otherwise increment pixel counter
  assign n_de         = q_hde & q_vde;  // Data Enable
  assign n_hsDly      = {q_hsDly[1:0], n_hsync};  // Delay pipe for hsync
  assign n_deDly      = {q_deDly[1:0], n_de};     // Delay pipe for de
  assign n_tstpat     = (q_deDly[2] == 1'b1) ? {O_VCNT[7:0], // Pixel color depends on vertical
                                                O_HCNT[7:0], // counter and horizontal counter
                                                O_HCNT[7:0]} : 
                        24'h0;
  assign n_pix_data   = (q_deDly[2] == 1'b1) ? I_PIX_DATA : // Incoming pixel data (will need to be modifed)
                        24'h0;                              // Async fifo output?

  // Horizontal State Machine

  always @(q_hstate, q_hs_done, q_hbp_done, q_hact_done, q_hfp_done) begin
    // Default values
    n_hstate  = q_hstate;
    n_hsync   = 1'b0;
    n_hde     = 1'b0;
    n_hrst    = 1'b0;

    case (q_hstate)
      S_HRESET :
        n_hstate = S_HSYNC;
      S_HSYNC :
        n_hsync = 1'b1;
        if (q_hs_done == 1'b1) begin
          n_hstate = S_HBACK;
        end
      S_HBACK :
        if (q_hbp_done == 1'b1) begin
          n_hstate = S_HACT;
        end
      S_HACT :
        n_hde = 1'b1;
        if (q_hact_done == 1'b1) begin
          n_hstate = S_HFRONT;
        end
      S_HFRONT :
        if (q_hfp_done == 1'b1) begin
          n_hstate = S_HSYNC;
          n_hrst = 1'b1;
        end
      default :
        n_hstate = S_HRESET;
    endcase
  end

  // Vertical State Machine
  always @(q_vstate, q_vs_done, q_vbp_done, q_vact_done, q_vfp_done) begin
    // Defaults
    n_vstate = q_vstate;
    n_vsync  = 1'b0;
    n_vde    = 1'b0;
    n_vrst   = 1'b0;
    case (q_vstate)
      S_VRESET :
        n_vstate = S_VSYNC;
      S_VSYNC :
        n_vsync = 1'b1;
        if(q_vs_done == 1'b1) begin
          n_vstate = S_VBACK_START;
        end
      S_VBACK_START :
        n_vsync = 1'b1;
        n_vstate = S_VBACK;
      S_VBACK :
        if(q_vbp_done == 1'b1) begin
          n_vstate = S_VACT;
        end
      S_VACT :
        n_vde = 1'b1;
        if (q_vact_done == 1'b1) begin
          n_vstate = S_VFRONT;
        end
      S_VFRONT :
        if(q_vfp_done == 1'b1) begin
          n_vstate = S_VSYNC;
          n_vrst = 1'b1;
        end
      default :
        n_vstate = S_VRESET;
    endcase
  end

  // Clocked always block
  always @(posedge I_PCLK) begin
    if(I_RST == 1'b1) begin
      q_hs_done   <= 1'b0;
      q_hbp_done  <= 1'b0;
      q_hact_done <= 1'b0;
      q_hfp_done  <= 1'b0;
      q_vs_done   <= 1'b0;
      q_vbp_done  <= 1'b0;
      q_vact_done <= 1'b0;
      q_vfp_done  <= 1'b0;
      q_hctr      <= 12'b0;
      q_vctr      <= 12'b0;
      q_hstate    <= 3'b0;
      q_vstate    <= 3'b0;
      q_hde       <= 1'b0;
      q_vde       <= 1'b0;
      q_hsync     <= 1'b0;
      q_vsync     <= 1'b0;
      q_hrst      <= 1'b0;
      q_vrst      <= 1'b0;
      q_hsDly     <= 3'b0;
      q_deDly     <= 3'b0;
      q_de        <= 1'b0;
      q_tstpat    <= 24'b0;
      q_pix_data  <= 24'b0;
    end
    else begin
      q_hs_done   <= n_hs_done;
      q_hbp_done  <= n_hbp_done;
      q_hact_done <= n_hact_done;
      q_hfp_done  <= n_hfp_done;
      q_vs_done   <= n_vs_done;
      q_vbp_done  <= n_vbp_done;
      q_vact_done <= n_vact_done;
      q_vfp_done  <= n_vfp_done;
      q_hctr      <= n_hctr;
      q_vctr      <= n_vctr;
      q_hstate    <= n_hstate;
      q_vstate    <= n_vstate;
      q_hde       <= n_hde;
      q_vde       <= n_vde;
      q_hsync     <= n_hsync;
      q_vsync     <= n_vsync;
      q_hrst      <= n_hrst;
      q_vrst      <= n_vrst;
      q_hsDly     <= n_hsDly;
      q_deDly     <= n_deDly;
      q_de        <= n_de;
      q_tstpat    <= n_tstpat;
      q_pix_data  <= n_pix_data;
    end
  end


endmodule