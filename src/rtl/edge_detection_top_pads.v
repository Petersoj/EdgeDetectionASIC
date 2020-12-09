`include "/research/ece/lnis-teaching/5710_6710_F20/Lab_files/HDL/padlib_tsmc180_innovus.v"

`include "/home/u0629525/ece5710/EdgeDetectionASIC/src/rtl/GATE/edge_detection_top_mapped.v"

module edge_detection_top_pads (
        input I_RST, 
        input I_CORE_CLK, 
        input [23:0] I_PIX_DATA,
        input I_VSYNC,
        input I_HSYNC,
        input I_DE,
        input I_PCLK,

        output [11:0] O_PIX_DATA,
        output O_VSYNC,
        output O_HSYNC,
        output O_DE
        // output O_PCLK
    );
    pad_in pad_in24 (.pad(I_RST), .DataIn(I_RST_pad));
    pad_in pad_in25 (.pad(I_CORE_CLK), .DataIn(I_CORE_CLK_pad));

    pad_in pad_in0  (.pad(I_PIX_DATA[0]),  .DataIn(I_PIX_DATA_pad_0));
    pad_in pad_in1  (.pad(I_PIX_DATA[1]),  .DataIn(I_PIX_DATA_pad_1));
    pad_in pad_in2  (.pad(I_PIX_DATA[2]),  .DataIn(I_PIX_DATA_pad_2));
    pad_in pad_in3  (.pad(I_PIX_DATA[3]),  .DataIn(I_PIX_DATA_pad_3));
    pad_in pad_in4  (.pad(I_PIX_DATA[4]),  .DataIn(I_PIX_DATA_pad_4));
    pad_in pad_in5  (.pad(I_PIX_DATA[5]),  .DataIn(I_PIX_DATA_pad_5));
    pad_in pad_in6  (.pad(I_PIX_DATA[6]),  .DataIn(I_PIX_DATA_pad_6));
    pad_in pad_in7  (.pad(I_PIX_DATA[7]),  .DataIn(I_PIX_DATA_pad_7));
    pad_in pad_in8  (.pad(I_PIX_DATA[8]),  .DataIn(I_PIX_DATA_pad_8));
    pad_in pad_in9  (.pad(I_PIX_DATA[9]),  .DataIn(I_PIX_DATA_pad_9));
    pad_in pad_in10 (.pad(I_PIX_DATA[10]), .DataIn(I_PIX_DATA_pad_10));
    pad_in pad_in11 (.pad(I_PIX_DATA[11]), .DataIn(I_PIX_DATA_pad_11));
    pad_in pad_in12 (.pad(I_PIX_DATA[12]), .DataIn(I_PIX_DATA_pad_12));
    pad_in pad_in13 (.pad(I_PIX_DATA[13]), .DataIn(I_PIX_DATA_pad_13));
    pad_in pad_in14 (.pad(I_PIX_DATA[14]), .DataIn(I_PIX_DATA_pad_14));
    pad_in pad_in15 (.pad(I_PIX_DATA[15]), .DataIn(I_PIX_DATA_pad_15));
    pad_in pad_in16 (.pad(I_PIX_DATA[16]), .DataIn(I_PIX_DATA_pad_16));
    pad_in pad_in17 (.pad(I_PIX_DATA[17]), .DataIn(I_PIX_DATA_pad_17));
    pad_in pad_in18 (.pad(I_PIX_DATA[18]), .DataIn(I_PIX_DATA_pad_18));
    pad_in pad_in19 (.pad(I_PIX_DATA[19]), .DataIn(I_PIX_DATA_pad_19));
    pad_in pad_in20 (.pad(I_PIX_DATA[20]), .DataIn(I_PIX_DATA_pad_20));
    pad_in pad_in21 (.pad(I_PIX_DATA[21]), .DataIn(I_PIX_DATA_pad_21));
    pad_in pad_in22 (.pad(I_PIX_DATA[22]), .DataIn(I_PIX_DATA_pad_22));
    pad_in pad_in23 (.pad(I_PIX_DATA[23]), .DataIn(I_PIX_DATA_pad_23));

    
    // pad_in pad_in25 (.pad(I_PIX_DATA), .DataIn(I_PIX_DATA_pad));
    pad_in pad_in26 (.pad(I_VSYNC), .DataIn(I_VSYNC_pad));
    pad_in pad_in27 (.pad(I_HSYNC), .DataIn(I_HSYNC_pad));
    pad_in pad_in28 (.pad(I_DE), .DataIn(I_DE_pad));
    pad_in pad_in29 (.pad(I_PCLK), .DataIn(I_PCLK_pad));

    pad_out pad_out0  (.pad(O_PIX_DATA[0]),  .DataOut(O_PIX_DATA_pad_0));
    pad_out pad_out1  (.pad(O_PIX_DATA[1]),  .DataOut(O_PIX_DATA_pad_1));
    pad_out pad_out2  (.pad(O_PIX_DATA[2]),  .DataOut(O_PIX_DATA_pad_2));
    pad_out pad_out3  (.pad(O_PIX_DATA[3]),  .DataOut(O_PIX_DATA_pad_3));
    pad_out pad_out4  (.pad(O_PIX_DATA[4]),  .DataOut(O_PIX_DATA_pad_4));
    pad_out pad_out5  (.pad(O_PIX_DATA[5]),  .DataOut(O_PIX_DATA_pad_5));
    pad_out pad_out6  (.pad(O_PIX_DATA[6]),  .DataOut(O_PIX_DATA_pad_6));
    pad_out pad_out7  (.pad(O_PIX_DATA[7]),  .DataOut(O_PIX_DATA_pad_7));
    pad_out pad_out8  (.pad(O_PIX_DATA[8]),  .DataOut(O_PIX_DATA_pad_8));
    pad_out pad_out9  (.pad(O_PIX_DATA[9]),  .DataOut(O_PIX_DATA_pad_9));
    pad_out pad_out10 (.pad(O_PIX_DATA[10]), .DataOut(O_PIX_DATA_pad_10));
    pad_out pad_out11 (.pad(O_PIX_DATA[11]), .DataOut(O_PIX_DATA_pad_11));
    // pad_out pad_out12 (.pad(O_PIX_DATA[12]), .DataOut(O_PIX_DATA_pad_12));
    // pad_out pad_out13 (.pad(O_PIX_DATA[13]), .DataOut(O_PIX_DATA_pad_13));
    // pad_out pad_out14 (.pad(O_PIX_DATA[14]), .DataOut(O_PIX_DATA_pad_14));
    // pad_out pad_out15 (.pad(O_PIX_DATA[15]), .DataOut(O_PIX_DATA_pad_15));
    // pad_out pad_out16 (.pad(O_PIX_DATA[16]), .DataOut(O_PIX_DATA_pad_16));
    // pad_out pad_out17 (.pad(O_PIX_DATA[17]), .DataOut(O_PIX_DATA_pad_17));
    // pad_out pad_out18 (.pad(O_PIX_DATA[18]), .DataOut(O_PIX_DATA_pad_18));
    // pad_out pad_out19 (.pad(O_PIX_DATA[19]), .DataOut(O_PIX_DATA_pad_19));
    // pad_out pad_out20 (.pad(O_PIX_DATA[20]), .DataOut(O_PIX_DATA_pad_20));
    // pad_out pad_out21 (.pad(O_PIX_DATA[21]), .DataOut(O_PIX_DATA_pad_21));
    // pad_out pad_out22 (.pad(O_PIX_DATA[22]), .DataOut(O_PIX_DATA_pad_22));
    // pad_out pad_out23 (.pad(O_PIX_DATA[23]), .DataOut(O_PIX_DATA_pad_23));
    

    pad_out pad_out24 (.pad(O_VSYNC), .DataOut(O_VSYNC_pad));
    pad_out pad_out25 (.pad(O_HSYNC), .DataOut(O_HSYNC_pad));
    pad_out pad_out26 (.pad(O_DE), .DataOut(O_DE_pad));
    // pad_out pad_out27 (.pad(O_PCLK), .DataOut(O_PCLK_pad));

    //VDD and GND pads
    pad_vdd pad_vdd0 ();
    pad_gnd pad_gnd0 ();

    //corners
    pad_corner corner0 ();
    pad_corner corner1 ();
    pad_corner corner2 ();
    pad_corner corner3 ();
    

    edge_detection_top dut(
        .I_RST (I_RST_pad),
        .I_CORE_CLK (I_CORE_CLK_pad),
        .I_PIX_DATA ({
            I_PIX_DATA_pad_23,
            I_PIX_DATA_pad_22,
            I_PIX_DATA_pad_21,
            I_PIX_DATA_pad_20,
            I_PIX_DATA_pad_19,
            I_PIX_DATA_pad_18,
            I_PIX_DATA_pad_17,
            I_PIX_DATA_pad_16,
            I_PIX_DATA_pad_15,
            I_PIX_DATA_pad_14,
            I_PIX_DATA_pad_13,
            I_PIX_DATA_pad_12,
            I_PIX_DATA_pad_11,
            I_PIX_DATA_pad_10,
            I_PIX_DATA_pad_9,
            I_PIX_DATA_pad_8,
            I_PIX_DATA_pad_7,
            I_PIX_DATA_pad_6,
            I_PIX_DATA_pad_5,
            I_PIX_DATA_pad_4,
            I_PIX_DATA_pad_3,
            I_PIX_DATA_pad_2,
            I_PIX_DATA_pad_1,
            I_PIX_DATA_pad_0
        }),
        .I_VSYNC (I_VSYNC_pad),
        .I_HSYNC (I_HSYNC_pad),
        .I_DE (I_DE_pad),
        .I_PCLK (I_PCLK_pad),
        .O_PIX_DATA (
            {
                O_PIX_DATA_pad_11,
                O_PIX_DATA_pad_10,
                O_PIX_DATA_pad_9,
                O_PIX_DATA_pad_8,
                O_PIX_DATA_pad_7,
                O_PIX_DATA_pad_6,
                O_PIX_DATA_pad_5,
                O_PIX_DATA_pad_4,
                O_PIX_DATA_pad_3,
                O_PIX_DATA_pad_2,
                O_PIX_DATA_pad_1,
                O_PIX_DATA_pad_0
            }
        ),
        .O_VSYNC (O_VSYNC_pad),
        .O_HSYNC (O_HSYNC_pad),
        .O_DE (O_DE_pad)
        // .O_PCLK (O_PCLK_pad)
        );
endmodule