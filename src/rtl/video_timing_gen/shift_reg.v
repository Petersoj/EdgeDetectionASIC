////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/17/2020
// Module Name: shift_reg
// Description: Parameterizable shift register.
// Authors: Jacob Peterson, Daryl Warner, Trent Bennet, Aaron Pettit
//
////

module shift_reg
  #(
    parameter G_INIT  = 1'b0,
    parameter G_WIDTH = 1,
    parameter G_DEPTH = 1
  ) (
    input   wire                  I_CLK;   // Clock for Register
    input   wire                  I_RESET; // Reset
    input   wire                  I_EN;    // Enable
    input   wire  [G_WIDTH-1:0]   I_DATA;  // Input Data Bus
    output  wire  [G_WIDTH-1:0]   O_DATA   // Output Data Bus
  );

  reg [G_WIDTH-1:0]     q_reg[G_DEPTH-1:0];
  reg [G_WIDTH-1:0]     n_reg[G_DEPTH-1:0];

  // Output mapping
  assign O_DATA = q_reg[G_DEPTH-1];

  // Shift chain when enabled.
  assign n_reg = (I_EN == 1'b1) ? {q_reg[G_DEPTH-2:0], I_DATA} : q_reg;

  always @(posedge I_CLK) begin
    if(I_RESET == 1'b1) begin
      q_reg <= 0;
    end
    else begin
      q_reg <= n_reg;
    end

  end

endmodule
