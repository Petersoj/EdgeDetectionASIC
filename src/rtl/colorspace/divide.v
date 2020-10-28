////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 10/28/2020
// Module Name: divide
// Description: Divides integers A by B (A is the numberator and B is the denominator) to get Y (the quotient) and R (the remainder).
//              Note: If B > A, then Y will be 0 and R will be B
// Authors: Jacob Peterson
// References: https://verilogcodes.blogspot.com/2015/11/synthesisable-verilog-code-for-division.html
//
////

module divide
    #(
    parameter integer WIDTH = 32'd8 // The width of A, B, and Y
    )
    (
    input wire [WIDTH - 1:0] I_A, // The A input (the numberator)
    input wire [WIDTH - 1:0] I_B, // The B input (the denominator)

    output reg [WIDTH - 1:0] O_Y, // The Y output (the quotient)
    output reg [WIDTH - 1:0] O_R, // The R output (the remainder)
    );

    integer i;

    always @(I_A, I_B) begin
        // TODO find best algorithm with min clock cycles
    end

endmodule
