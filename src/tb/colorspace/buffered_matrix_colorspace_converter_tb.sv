////
//
// University of Utah ECE 5710/6710 Edge Detection ASIC
//
// Create Date: 11/30/2020
// Module Name: buffered_matrix_colorspace_converter_tb
// Description: buffered_matrix_colorspace_converter module testbench
// Authors: Jacob Peterson
//
////

`timescale 1 ps / 1 ps

module buffered_matrix_colorspace_converter_tb();

    // START local parameters
    // TODO
    // END local parameters

    // START registers and wires
    logic clock;
    logic reset;
    logic enable;
    // END registers and wires

    // START module instantiations
    // TODO
    DUT #(

        )
        DUT
        (

        );
    // END module instantiations

    // START initial blocks

    initial begin
        clock = 1'b1;
        reset = 1'b1;
        enable = 1'b1;
    end

    initial begin
        forever #5000 clock = ~clock; // 100MHz clock (period of 10ns)
        // TODO create pixel clock
    end

    initial begin
        $display("================================================================");
        $display("========================== BEGIN SIM ===========================");
        $display("================================================================");

        $display("Resetting DUT");
        #10000;
        reset = 1'b0;
        enable = 1'b1;

        // TODO

        $display("================================================================");
        $display("=========================== END SIM ============================");
        $display("================================================================");
        $stop;
    end

    // END initial blocks
endmodule
