/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-6
// Date      : Mon Nov 30 16:09:33 2020
/////////////////////////////////////////////////////////////


module colorspace_converter_DW01_inc_0 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46;

  INVX2 U1 ( .A(A[2]), .Z(n1) );
  INVX2 U2 ( .A(n25), .Z(n2) );
  INVX2 U3 ( .A(n27), .Z(n3) );
  INVX2 U4 ( .A(n29), .Z(n4) );
  INVX2 U5 ( .A(n31), .Z(n5) );
  INVX2 U6 ( .A(n33), .Z(n6) );
  INVX2 U7 ( .A(n35), .Z(n7) );
  INVX2 U8 ( .A(n37), .Z(n8) );
  INVX2 U9 ( .A(n39), .Z(n9) );
  INVX2 U10 ( .A(n41), .Z(n10) );
  INVX2 U11 ( .A(n43), .Z(n11) );
  INVX2 U12 ( .A(n44), .Z(n12) );
  INVX2 U13 ( .A(n45), .Z(n13) );
  INVX2 U14 ( .A(n46), .Z(n14) );
  INVX2 U15 ( .A(A[29]), .Z(n15) );
  INVX2 U16 ( .A(A[0]), .Z(SUM[0]) );
  XOR2X1 U17 ( .A(A[9]), .B(n11), .Z(SUM[9]) );
  XOR2X1 U18 ( .A(A[8]), .B(n17), .Z(SUM[8]) );
  AND2X1 U19 ( .A(n12), .B(A[7]), .Z(n17) );
  XOR2X1 U20 ( .A(A[7]), .B(n12), .Z(SUM[7]) );
  XOR2X1 U21 ( .A(A[6]), .B(n18), .Z(SUM[6]) );
  AND2X1 U22 ( .A(n13), .B(A[5]), .Z(n18) );
  XOR2X1 U23 ( .A(A[5]), .B(n13), .Z(SUM[5]) );
  XOR2X1 U24 ( .A(A[4]), .B(n19), .Z(SUM[4]) );
  AND2X1 U25 ( .A(n14), .B(A[3]), .Z(n19) );
  XOR2X1 U26 ( .A(A[3]), .B(n14), .Z(SUM[3]) );
  XOR2X1 U27 ( .A(A[31]), .B(n20), .Z(SUM[31]) );
  AND2X1 U28 ( .A(n21), .B(A[30]), .Z(n20) );
  XOR2X1 U29 ( .A(A[30]), .B(n21), .Z(SUM[30]) );
  NOR2X1 U30 ( .A(n15), .B(n22), .Z(n21) );
  XOR2X1 U31 ( .A(n1), .B(n23), .Z(SUM[2]) );
  NAND2X1 U32 ( .A(A[1]), .B(A[0]), .Z(n23) );
  XOR2X1 U33 ( .A(n15), .B(n22), .Z(SUM[29]) );
  NAND3X1 U34 ( .A(A[27]), .B(n2), .C(A[28]), .Z(n22) );
  XOR2X1 U35 ( .A(A[28]), .B(n24), .Z(SUM[28]) );
  AND2X1 U36 ( .A(n2), .B(A[27]), .Z(n24) );
  XOR2X1 U37 ( .A(A[27]), .B(n2), .Z(SUM[27]) );
  NAND3X1 U38 ( .A(A[25]), .B(n3), .C(A[26]), .Z(n25) );
  XOR2X1 U39 ( .A(A[26]), .B(n26), .Z(SUM[26]) );
  AND2X1 U40 ( .A(n3), .B(A[25]), .Z(n26) );
  XOR2X1 U41 ( .A(A[25]), .B(n3), .Z(SUM[25]) );
  NAND3X1 U42 ( .A(A[23]), .B(n4), .C(A[24]), .Z(n27) );
  XOR2X1 U43 ( .A(A[24]), .B(n28), .Z(SUM[24]) );
  AND2X1 U44 ( .A(n4), .B(A[23]), .Z(n28) );
  XOR2X1 U45 ( .A(A[23]), .B(n4), .Z(SUM[23]) );
  NAND3X1 U46 ( .A(A[21]), .B(n5), .C(A[22]), .Z(n29) );
  XOR2X1 U47 ( .A(A[22]), .B(n30), .Z(SUM[22]) );
  AND2X1 U48 ( .A(n5), .B(A[21]), .Z(n30) );
  XOR2X1 U49 ( .A(A[21]), .B(n5), .Z(SUM[21]) );
  NAND3X1 U50 ( .A(A[19]), .B(n6), .C(A[20]), .Z(n31) );
  XOR2X1 U51 ( .A(A[20]), .B(n32), .Z(SUM[20]) );
  AND2X1 U52 ( .A(n6), .B(A[19]), .Z(n32) );
  XOR2X1 U53 ( .A(A[1]), .B(A[0]), .Z(SUM[1]) );
  XOR2X1 U54 ( .A(A[19]), .B(n6), .Z(SUM[19]) );
  NAND3X1 U55 ( .A(A[17]), .B(n7), .C(A[18]), .Z(n33) );
  XOR2X1 U56 ( .A(A[18]), .B(n34), .Z(SUM[18]) );
  AND2X1 U57 ( .A(n7), .B(A[17]), .Z(n34) );
  XOR2X1 U58 ( .A(A[17]), .B(n7), .Z(SUM[17]) );
  NAND3X1 U59 ( .A(A[15]), .B(n8), .C(A[16]), .Z(n35) );
  XOR2X1 U60 ( .A(A[16]), .B(n36), .Z(SUM[16]) );
  AND2X1 U61 ( .A(n8), .B(A[15]), .Z(n36) );
  XOR2X1 U62 ( .A(A[15]), .B(n8), .Z(SUM[15]) );
  NAND3X1 U63 ( .A(A[13]), .B(n9), .C(A[14]), .Z(n37) );
  XOR2X1 U64 ( .A(A[14]), .B(n38), .Z(SUM[14]) );
  AND2X1 U65 ( .A(n9), .B(A[13]), .Z(n38) );
  XOR2X1 U66 ( .A(A[13]), .B(n9), .Z(SUM[13]) );
  NAND3X1 U67 ( .A(A[11]), .B(n10), .C(A[12]), .Z(n39) );
  XOR2X1 U68 ( .A(A[12]), .B(n40), .Z(SUM[12]) );
  AND2X1 U69 ( .A(n10), .B(A[11]), .Z(n40) );
  XOR2X1 U70 ( .A(A[11]), .B(n10), .Z(SUM[11]) );
  NAND3X1 U71 ( .A(n11), .B(A[9]), .C(A[10]), .Z(n41) );
  XOR2X1 U72 ( .A(A[10]), .B(n42), .Z(SUM[10]) );
  AND2X1 U73 ( .A(A[9]), .B(n11), .Z(n42) );
  NAND3X1 U74 ( .A(A[7]), .B(n12), .C(A[8]), .Z(n43) );
  NAND3X1 U75 ( .A(A[5]), .B(n13), .C(A[6]), .Z(n44) );
  NAND3X1 U76 ( .A(A[3]), .B(n14), .C(A[4]), .Z(n45) );
  NAND3X1 U77 ( .A(A[1]), .B(A[0]), .C(A[2]), .Z(n46) );
endmodule


module colorspace_converter_DW01_inc_1 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46;

  INVX2 U1 ( .A(n25), .Z(n1) );
  INVX2 U2 ( .A(n27), .Z(n2) );
  INVX2 U3 ( .A(n29), .Z(n3) );
  INVX2 U4 ( .A(n31), .Z(n4) );
  INVX2 U5 ( .A(n33), .Z(n5) );
  INVX2 U6 ( .A(n35), .Z(n6) );
  INVX2 U7 ( .A(n37), .Z(n7) );
  INVX2 U8 ( .A(n39), .Z(n8) );
  INVX2 U9 ( .A(n41), .Z(n9) );
  INVX2 U10 ( .A(n43), .Z(n10) );
  INVX2 U11 ( .A(n44), .Z(n11) );
  INVX2 U12 ( .A(n45), .Z(n12) );
  INVX2 U13 ( .A(n46), .Z(n13) );
  INVX2 U14 ( .A(A[0]), .Z(SUM[0]) );
  INVX2 U15 ( .A(A[2]), .Z(n15) );
  INVX2 U16 ( .A(A[29]), .Z(n16) );
  XOR2X1 U17 ( .A(A[9]), .B(n10), .Z(SUM[9]) );
  XOR2X1 U18 ( .A(A[8]), .B(n17), .Z(SUM[8]) );
  AND2X1 U19 ( .A(n11), .B(A[7]), .Z(n17) );
  XOR2X1 U20 ( .A(A[7]), .B(n11), .Z(SUM[7]) );
  XOR2X1 U21 ( .A(A[6]), .B(n18), .Z(SUM[6]) );
  AND2X1 U22 ( .A(n12), .B(A[5]), .Z(n18) );
  XOR2X1 U23 ( .A(A[5]), .B(n12), .Z(SUM[5]) );
  XOR2X1 U24 ( .A(A[4]), .B(n19), .Z(SUM[4]) );
  AND2X1 U25 ( .A(n13), .B(A[3]), .Z(n19) );
  XOR2X1 U26 ( .A(A[3]), .B(n13), .Z(SUM[3]) );
  XOR2X1 U27 ( .A(A[31]), .B(n20), .Z(SUM[31]) );
  AND2X1 U28 ( .A(n21), .B(A[30]), .Z(n20) );
  XOR2X1 U29 ( .A(A[30]), .B(n21), .Z(SUM[30]) );
  NOR2X1 U30 ( .A(n16), .B(n22), .Z(n21) );
  XOR2X1 U31 ( .A(n15), .B(n23), .Z(SUM[2]) );
  NAND2X1 U32 ( .A(A[1]), .B(A[0]), .Z(n23) );
  XOR2X1 U33 ( .A(n16), .B(n22), .Z(SUM[29]) );
  NAND3X1 U34 ( .A(A[27]), .B(n1), .C(A[28]), .Z(n22) );
  XOR2X1 U35 ( .A(A[28]), .B(n24), .Z(SUM[28]) );
  AND2X1 U36 ( .A(n1), .B(A[27]), .Z(n24) );
  XOR2X1 U37 ( .A(A[27]), .B(n1), .Z(SUM[27]) );
  NAND3X1 U38 ( .A(A[25]), .B(n2), .C(A[26]), .Z(n25) );
  XOR2X1 U39 ( .A(A[26]), .B(n26), .Z(SUM[26]) );
  AND2X1 U40 ( .A(n2), .B(A[25]), .Z(n26) );
  XOR2X1 U41 ( .A(A[25]), .B(n2), .Z(SUM[25]) );
  NAND3X1 U42 ( .A(A[23]), .B(n3), .C(A[24]), .Z(n27) );
  XOR2X1 U43 ( .A(A[24]), .B(n28), .Z(SUM[24]) );
  AND2X1 U44 ( .A(n3), .B(A[23]), .Z(n28) );
  XOR2X1 U45 ( .A(A[23]), .B(n3), .Z(SUM[23]) );
  NAND3X1 U46 ( .A(A[21]), .B(n4), .C(A[22]), .Z(n29) );
  XOR2X1 U47 ( .A(A[22]), .B(n30), .Z(SUM[22]) );
  AND2X1 U48 ( .A(n4), .B(A[21]), .Z(n30) );
  XOR2X1 U49 ( .A(A[21]), .B(n4), .Z(SUM[21]) );
  NAND3X1 U50 ( .A(A[19]), .B(n5), .C(A[20]), .Z(n31) );
  XOR2X1 U51 ( .A(A[20]), .B(n32), .Z(SUM[20]) );
  AND2X1 U52 ( .A(n5), .B(A[19]), .Z(n32) );
  XOR2X1 U53 ( .A(A[1]), .B(A[0]), .Z(SUM[1]) );
  XOR2X1 U54 ( .A(A[19]), .B(n5), .Z(SUM[19]) );
  NAND3X1 U55 ( .A(A[17]), .B(n6), .C(A[18]), .Z(n33) );
  XOR2X1 U56 ( .A(A[18]), .B(n34), .Z(SUM[18]) );
  AND2X1 U57 ( .A(n6), .B(A[17]), .Z(n34) );
  XOR2X1 U58 ( .A(A[17]), .B(n6), .Z(SUM[17]) );
  NAND3X1 U59 ( .A(A[15]), .B(n7), .C(A[16]), .Z(n35) );
  XOR2X1 U60 ( .A(A[16]), .B(n36), .Z(SUM[16]) );
  AND2X1 U61 ( .A(n7), .B(A[15]), .Z(n36) );
  XOR2X1 U62 ( .A(A[15]), .B(n7), .Z(SUM[15]) );
  NAND3X1 U63 ( .A(A[13]), .B(n8), .C(A[14]), .Z(n37) );
  XOR2X1 U64 ( .A(A[14]), .B(n38), .Z(SUM[14]) );
  AND2X1 U65 ( .A(n8), .B(A[13]), .Z(n38) );
  XOR2X1 U66 ( .A(A[13]), .B(n8), .Z(SUM[13]) );
  NAND3X1 U67 ( .A(A[11]), .B(n9), .C(A[12]), .Z(n39) );
  XOR2X1 U68 ( .A(A[12]), .B(n40), .Z(SUM[12]) );
  AND2X1 U69 ( .A(n9), .B(A[11]), .Z(n40) );
  XOR2X1 U70 ( .A(A[11]), .B(n9), .Z(SUM[11]) );
  NAND3X1 U71 ( .A(n10), .B(A[9]), .C(A[10]), .Z(n41) );
  XOR2X1 U72 ( .A(A[10]), .B(n42), .Z(SUM[10]) );
  AND2X1 U73 ( .A(A[9]), .B(n10), .Z(n42) );
  NAND3X1 U74 ( .A(A[7]), .B(n11), .C(A[8]), .Z(n43) );
  NAND3X1 U75 ( .A(A[5]), .B(n12), .C(A[6]), .Z(n44) );
  NAND3X1 U76 ( .A(A[3]), .B(n13), .C(A[4]), .Z(n45) );
  NAND3X1 U77 ( .A(A[1]), .B(A[0]), .C(A[2]), .Z(n46) );
endmodule


module colorspace_converter ( I_CLK, I_RESET, I_ENABLE, I_PIX_DATA, I_VSYNC, 
        I_HSYNC, I_DE, I_PCLK, O_PIXEL_COL, O_PIXEL_ROW, O_PIXEL, 
        O_PIXEL_WRITE_ENABLE );
  input [23:0] I_PIX_DATA;
  output [9:0] O_PIXEL_COL;
  output [8:0] O_PIXEL_ROW;
  output [23:0] O_PIXEL;
  input I_CLK, I_RESET, I_ENABLE, I_VSYNC, I_HSYNC, I_DE, I_PCLK;
  output O_PIXEL_WRITE_ENABLE;
  wire   N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60,
         N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, N72, N73, N74,
         N75, N76, N77, N78, N143, N144, N145, N146, N147, N148, N149, N150,
         N151, N152, N153, N154, N155, N156, N157, N158, N159, N160, N161,
         N162, N163, N164, N165, N166, N167, N168, N169, N170, N171, N172,
         N173, N174, N179, N180, N181, N182, N183, N184, N185, N186, N187,
         N188, N189, N190, N191, N192, N193, N194, N195, N196, N197, N198,
         N199, N200, N201, N202, N203, N204, N205, N206, N207, N208, N209,
         N210, \U3/U1/Z_0 , \U3/U1/Z_1 , \U3/U1/Z_2 , \U3/U1/Z_3 , \U3/U1/Z_4 ,
         \U3/U1/Z_5 , \U3/U1/Z_6 , \U3/U1/Z_7 , \U3/U1/Z_8 , \U3/U1/Z_9 ,
         \U3/U1/Z_10 , \U3/U1/Z_11 , \U3/U1/Z_12 , \U3/U1/Z_13 , \U3/U1/Z_14 ,
         \U3/U1/Z_15 , \U3/U1/Z_16 , \U3/U1/Z_17 , \U3/U1/Z_18 , \U3/U1/Z_19 ,
         \U3/U1/Z_20 , \U3/U1/Z_21 , \U3/U1/Z_22 , \U3/U1/Z_23 , \U3/U1/Z_24 ,
         \U3/U1/Z_25 , \U3/U1/Z_26 , \U3/U1/Z_27 , \U3/U1/Z_28 , \U3/U1/Z_29 ,
         \U3/U1/Z_30 , \U3/U1/Z_31 , n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366;
  wire   [31:0] current_column;
  wire   [31:0] current_row;
  tri   I_PCLK;
  tri   [9:0] O_PIXEL_COL;
  tri   [8:0] O_PIXEL_ROW;
  tri   O_PIXEL_WRITE_ENABLE;

  DFFQX1 \current_row_reg[0]  ( .D(n526), .CLK(I_PCLK), .Q(current_row[0]) );
  DFFQX1 \current_column_reg[31]  ( .D(n494), .CLK(I_PCLK), .Q(
        current_column[31]) );
  DFFQX1 \current_column_reg[21]  ( .D(n504), .CLK(I_PCLK), .Q(
        current_column[21]) );
  DFFQX1 \current_column_reg[22]  ( .D(n503), .CLK(I_PCLK), .Q(
        current_column[22]) );
  DFFQX1 \current_column_reg[23]  ( .D(n502), .CLK(I_PCLK), .Q(
        current_column[23]) );
  DFFQX1 \current_column_reg[24]  ( .D(n501), .CLK(I_PCLK), .Q(
        current_column[24]) );
  DFFQX1 \current_column_reg[25]  ( .D(n500), .CLK(I_PCLK), .Q(
        current_column[25]) );
  DFFQX1 \current_column_reg[26]  ( .D(n499), .CLK(I_PCLK), .Q(
        current_column[26]) );
  DFFQX1 \current_column_reg[27]  ( .D(n498), .CLK(I_PCLK), .Q(
        current_column[27]) );
  DFFQX1 \current_column_reg[28]  ( .D(n497), .CLK(I_PCLK), .Q(
        current_column[28]) );
  DFFQX1 \current_column_reg[29]  ( .D(n496), .CLK(I_PCLK), .Q(
        current_column[29]) );
  DFFQX1 \current_column_reg[30]  ( .D(n495), .CLK(I_PCLK), .Q(
        current_column[30]) );
  DFFQX1 \current_column_reg[0]  ( .D(n525), .CLK(I_PCLK), .Q(
        current_column[0]) );
  DFFQX1 \current_column_reg[1]  ( .D(n524), .CLK(I_PCLK), .Q(
        current_column[1]) );
  DFFQX1 \current_column_reg[2]  ( .D(n523), .CLK(I_PCLK), .Q(
        current_column[2]) );
  DFFQX1 \current_column_reg[3]  ( .D(n522), .CLK(I_PCLK), .Q(
        current_column[3]) );
  DFFQX1 \current_column_reg[4]  ( .D(n521), .CLK(I_PCLK), .Q(
        current_column[4]) );
  DFFQX1 \current_column_reg[5]  ( .D(n520), .CLK(I_PCLK), .Q(
        current_column[5]) );
  DFFQX1 \current_column_reg[6]  ( .D(n519), .CLK(I_PCLK), .Q(
        current_column[6]) );
  DFFQX1 \current_column_reg[7]  ( .D(n518), .CLK(I_PCLK), .Q(
        current_column[7]) );
  DFFQX1 \current_column_reg[8]  ( .D(n517), .CLK(I_PCLK), .Q(
        current_column[8]) );
  DFFQX1 \current_column_reg[9]  ( .D(n516), .CLK(I_PCLK), .Q(
        current_column[9]) );
  DFFQX1 \current_column_reg[10]  ( .D(n515), .CLK(I_PCLK), .Q(
        current_column[10]) );
  DFFQX1 \current_column_reg[11]  ( .D(n514), .CLK(I_PCLK), .Q(
        current_column[11]) );
  DFFQX1 \current_column_reg[12]  ( .D(n513), .CLK(I_PCLK), .Q(
        current_column[12]) );
  DFFQX1 \current_column_reg[13]  ( .D(n512), .CLK(I_PCLK), .Q(
        current_column[13]) );
  DFFQX1 \current_column_reg[14]  ( .D(n511), .CLK(I_PCLK), .Q(
        current_column[14]) );
  DFFQX1 \current_column_reg[15]  ( .D(n510), .CLK(I_PCLK), .Q(
        current_column[15]) );
  DFFQX1 \current_column_reg[16]  ( .D(n509), .CLK(I_PCLK), .Q(
        current_column[16]) );
  DFFQX1 \current_column_reg[17]  ( .D(n508), .CLK(I_PCLK), .Q(
        current_column[17]) );
  DFFQX1 \current_column_reg[18]  ( .D(n507), .CLK(I_PCLK), .Q(
        current_column[18]) );
  DFFQX1 \current_column_reg[19]  ( .D(n506), .CLK(I_PCLK), .Q(
        current_column[19]) );
  DFFQX1 \current_column_reg[20]  ( .D(n505), .CLK(I_PCLK), .Q(
        current_column[20]) );
  DFFQX1 \current_row_reg[31]  ( .D(n454), .CLK(I_PCLK), .Q(current_row[31])
         );
  DFFQX1 \current_row_reg[30]  ( .D(n455), .CLK(I_PCLK), .Q(current_row[30])
         );
  DFFQX1 \current_row_reg[1]  ( .D(n493), .CLK(I_PCLK), .Q(current_row[1]) );
  DFFQX1 \O_PIXEL_ROW_reg[1]  ( .D(n484), .CLK(I_PCLK), .Q(O_PIXEL_ROW[1]) );
  DFFQX1 \current_row_reg[2]  ( .D(n492), .CLK(I_PCLK), .Q(current_row[2]) );
  DFFQX1 \O_PIXEL_ROW_reg[2]  ( .D(n483), .CLK(I_PCLK), .Q(O_PIXEL_ROW[2]) );
  DFFQX1 \current_row_reg[3]  ( .D(n491), .CLK(I_PCLK), .Q(current_row[3]) );
  DFFQX1 \O_PIXEL_ROW_reg[3]  ( .D(n482), .CLK(I_PCLK), .Q(O_PIXEL_ROW[3]) );
  DFFQX1 \current_row_reg[4]  ( .D(n490), .CLK(I_PCLK), .Q(current_row[4]) );
  DFFQX1 \O_PIXEL_ROW_reg[4]  ( .D(n481), .CLK(I_PCLK), .Q(O_PIXEL_ROW[4]) );
  DFFQX1 \current_row_reg[5]  ( .D(n489), .CLK(I_PCLK), .Q(current_row[5]) );
  DFFQX1 \O_PIXEL_ROW_reg[5]  ( .D(n480), .CLK(I_PCLK), .Q(O_PIXEL_ROW[5]) );
  DFFQX1 \current_row_reg[6]  ( .D(n488), .CLK(I_PCLK), .Q(current_row[6]) );
  DFFQX1 \O_PIXEL_ROW_reg[6]  ( .D(n479), .CLK(I_PCLK), .Q(O_PIXEL_ROW[6]) );
  DFFQX1 \current_row_reg[7]  ( .D(n487), .CLK(I_PCLK), .Q(current_row[7]) );
  DFFQX1 \O_PIXEL_ROW_reg[7]  ( .D(n478), .CLK(I_PCLK), .Q(O_PIXEL_ROW[7]) );
  DFFQX1 \current_row_reg[8]  ( .D(n486), .CLK(I_PCLK), .Q(current_row[8]) );
  DFFQX1 \O_PIXEL_ROW_reg[8]  ( .D(n477), .CLK(I_PCLK), .Q(O_PIXEL_ROW[8]) );
  DFFQX1 \current_row_reg[9]  ( .D(n476), .CLK(I_PCLK), .Q(current_row[9]) );
  DFFQX1 \current_row_reg[10]  ( .D(n475), .CLK(I_PCLK), .Q(current_row[10])
         );
  DFFQX1 \current_row_reg[11]  ( .D(n474), .CLK(I_PCLK), .Q(current_row[11])
         );
  DFFQX1 \current_row_reg[12]  ( .D(n473), .CLK(I_PCLK), .Q(current_row[12])
         );
  DFFQX1 \current_row_reg[13]  ( .D(n472), .CLK(I_PCLK), .Q(current_row[13])
         );
  DFFQX1 \current_row_reg[14]  ( .D(n471), .CLK(I_PCLK), .Q(current_row[14])
         );
  DFFQX1 \current_row_reg[15]  ( .D(n470), .CLK(I_PCLK), .Q(current_row[15])
         );
  DFFQX1 \current_row_reg[16]  ( .D(n469), .CLK(I_PCLK), .Q(current_row[16])
         );
  DFFQX1 \current_row_reg[17]  ( .D(n468), .CLK(I_PCLK), .Q(current_row[17])
         );
  DFFQX1 \current_row_reg[18]  ( .D(n467), .CLK(I_PCLK), .Q(current_row[18])
         );
  DFFQX1 \current_row_reg[19]  ( .D(n466), .CLK(I_PCLK), .Q(current_row[19])
         );
  DFFQX1 \current_row_reg[20]  ( .D(n465), .CLK(I_PCLK), .Q(current_row[20])
         );
  DFFQX1 \current_row_reg[21]  ( .D(n464), .CLK(I_PCLK), .Q(current_row[21])
         );
  DFFQX1 \current_row_reg[22]  ( .D(n463), .CLK(I_PCLK), .Q(current_row[22])
         );
  DFFQX1 \current_row_reg[23]  ( .D(n462), .CLK(I_PCLK), .Q(current_row[23])
         );
  DFFQX1 \current_row_reg[24]  ( .D(n461), .CLK(I_PCLK), .Q(current_row[24])
         );
  DFFQX1 \current_row_reg[25]  ( .D(n460), .CLK(I_PCLK), .Q(current_row[25])
         );
  DFFQX1 \current_row_reg[26]  ( .D(n459), .CLK(I_PCLK), .Q(current_row[26])
         );
  DFFQX1 \current_row_reg[27]  ( .D(n458), .CLK(I_PCLK), .Q(current_row[27])
         );
  DFFQX1 \current_row_reg[28]  ( .D(n457), .CLK(I_PCLK), .Q(current_row[28])
         );
  DFFQX1 \current_row_reg[29]  ( .D(n456), .CLK(I_PCLK), .Q(current_row[29])
         );
  DFFQX1 \O_PIXEL_ROW_reg[0]  ( .D(n485), .CLK(I_PCLK), .Q(O_PIXEL_ROW[0]) );
  DFFQX1 \O_PIXEL_COL_reg[9]  ( .D(n453), .CLK(I_PCLK), .Q(O_PIXEL_COL[9]) );
  DFFQX1 \O_PIXEL_COL_reg[8]  ( .D(n452), .CLK(I_PCLK), .Q(O_PIXEL_COL[8]) );
  DFFQX1 \O_PIXEL_COL_reg[7]  ( .D(n451), .CLK(I_PCLK), .Q(O_PIXEL_COL[7]) );
  DFFQX1 \O_PIXEL_COL_reg[6]  ( .D(n450), .CLK(I_PCLK), .Q(O_PIXEL_COL[6]) );
  DFFQX1 \O_PIXEL_COL_reg[5]  ( .D(n449), .CLK(I_PCLK), .Q(O_PIXEL_COL[5]) );
  DFFQX1 \O_PIXEL_COL_reg[4]  ( .D(n448), .CLK(I_PCLK), .Q(O_PIXEL_COL[4]) );
  DFFQX1 \O_PIXEL_COL_reg[3]  ( .D(n447), .CLK(I_PCLK), .Q(O_PIXEL_COL[3]) );
  DFFQX1 \O_PIXEL_COL_reg[2]  ( .D(n446), .CLK(I_PCLK), .Q(O_PIXEL_COL[2]) );
  DFFQX1 \O_PIXEL_COL_reg[1]  ( .D(n445), .CLK(I_PCLK), .Q(O_PIXEL_COL[1]) );
  DFFQX1 \O_PIXEL_COL_reg[0]  ( .D(n444), .CLK(I_PCLK), .Q(O_PIXEL_COL[0]) );
  DFFQX1 O_PIXEL_WRITE_ENABLE_reg ( .D(n443), .CLK(I_PCLK), .Q(
        O_PIXEL_WRITE_ENABLE) );
  colorspace_converter_DW01_inc_0 add_85 ( .A({N143, N144, N145, N146, N147, 
        N148, N149, N150, N151, N152, N153, N154, N155, N156, N157, N158, N159, 
        N160, N161, N162, N163, N164, N165, N166, N167, N168, N169, N170, N171, 
        N172, N173, N174}), .SUM({N210, N209, N208, N207, N206, N205, N204, 
        N203, N202, N201, N200, N199, N198, N197, N196, N195, N194, N193, N192, 
        N191, N190, N189, N188, N187, N186, N185, N184, N183, N182, N181, N180, 
        N179}) );
  colorspace_converter_DW01_inc_1 r330 ( .A({\U3/U1/Z_31 , \U3/U1/Z_30 , 
        \U3/U1/Z_29 , \U3/U1/Z_28 , \U3/U1/Z_27 , \U3/U1/Z_26 , \U3/U1/Z_25 , 
        \U3/U1/Z_24 , \U3/U1/Z_23 , \U3/U1/Z_22 , \U3/U1/Z_21 , \U3/U1/Z_20 , 
        \U3/U1/Z_19 , \U3/U1/Z_18 , \U3/U1/Z_17 , \U3/U1/Z_16 , \U3/U1/Z_15 , 
        \U3/U1/Z_14 , \U3/U1/Z_13 , \U3/U1/Z_12 , \U3/U1/Z_11 , \U3/U1/Z_10 , 
        \U3/U1/Z_9 , \U3/U1/Z_8 , \U3/U1/Z_7 , \U3/U1/Z_6 , \U3/U1/Z_5 , 
        \U3/U1/Z_4 , \U3/U1/Z_3 , \U3/U1/Z_2 , \U3/U1/Z_1 , \U3/U1/Z_0 }), 
        .SUM({N78, N77, N76, N75, N74, N73, N72, N71, N70, N69, N68, N67, N66, 
        N65, N64, N63, N62, N61, N60, N59, N58, N57, N56, N55, N54, N53, N52, 
        N51, N50, N49, N48, N47}) );
  INVX2 U3 ( .A(n330), .Z(n208) );
  NAND3X1 U4 ( .A(n1), .B(n2), .C(n3), .Z(n526) );
  NAND2X1 U5 ( .A(current_row[0]), .B(n4), .Z(n3) );
  NAND2X1 U6 ( .A(N47), .B(n5), .Z(n2) );
  NAND2X1 U7 ( .A(N179), .B(n6), .Z(n1) );
  NAND2X1 U8 ( .A(n7), .B(n8), .Z(n525) );
  NAND2X1 U9 ( .A(n9), .B(N47), .Z(n8) );
  NAND2X1 U10 ( .A(current_column[0]), .B(n10), .Z(n7) );
  NAND2X1 U11 ( .A(n11), .B(n12), .Z(n524) );
  NAND2X1 U12 ( .A(n9), .B(N48), .Z(n12) );
  NAND2X1 U13 ( .A(current_column[1]), .B(n10), .Z(n11) );
  NAND2X1 U14 ( .A(n13), .B(n14), .Z(n523) );
  NAND2X1 U15 ( .A(N49), .B(n9), .Z(n14) );
  NAND2X1 U16 ( .A(current_column[2]), .B(n10), .Z(n13) );
  NAND2X1 U17 ( .A(n15), .B(n16), .Z(n522) );
  NAND2X1 U18 ( .A(n9), .B(N50), .Z(n16) );
  NAND2X1 U19 ( .A(current_column[3]), .B(n10), .Z(n15) );
  NAND2X1 U20 ( .A(n17), .B(n18), .Z(n521) );
  NAND2X1 U21 ( .A(n9), .B(N51), .Z(n18) );
  NAND2X1 U22 ( .A(current_column[4]), .B(n10), .Z(n17) );
  NAND2X1 U23 ( .A(n19), .B(n20), .Z(n520) );
  NAND2X1 U24 ( .A(n9), .B(N52), .Z(n20) );
  NAND2X1 U25 ( .A(current_column[5]), .B(n10), .Z(n19) );
  MUX2X1 U26 ( .A(current_column[6]), .B(n21), .S(n22), .Z(n519) );
  NAND2X1 U27 ( .A(n23), .B(n24), .Z(n518) );
  NAND2X1 U28 ( .A(n9), .B(N54), .Z(n24) );
  NAND2X1 U29 ( .A(current_column[7]), .B(n10), .Z(n23) );
  NAND2X1 U30 ( .A(n25), .B(n26), .Z(n517) );
  NAND2X1 U31 ( .A(n9), .B(N55), .Z(n26) );
  NAND2X1 U32 ( .A(current_column[8]), .B(n10), .Z(n25) );
  NAND2X1 U33 ( .A(n27), .B(n28), .Z(n516) );
  NAND2X1 U34 ( .A(n9), .B(N56), .Z(n28) );
  NAND2X1 U35 ( .A(current_column[9]), .B(n10), .Z(n27) );
  NAND2X1 U36 ( .A(n29), .B(n30), .Z(n515) );
  NAND2X1 U37 ( .A(n9), .B(N57), .Z(n30) );
  NAND2X1 U38 ( .A(current_column[10]), .B(n10), .Z(n29) );
  NAND2X1 U39 ( .A(n31), .B(n32), .Z(n514) );
  NAND2X1 U40 ( .A(n9), .B(N58), .Z(n32) );
  NAND2X1 U41 ( .A(current_column[11]), .B(n10), .Z(n31) );
  NAND2X1 U42 ( .A(n33), .B(n34), .Z(n513) );
  NAND2X1 U43 ( .A(n9), .B(N59), .Z(n34) );
  NAND2X1 U44 ( .A(current_column[12]), .B(n10), .Z(n33) );
  INVX1 U45 ( .A(n35), .Z(n512) );
  MUX2X1 U46 ( .A(n36), .B(n37), .S(n22), .Z(n35) );
  NAND2X1 U47 ( .A(n38), .B(n39), .Z(n511) );
  NAND2X1 U48 ( .A(n9), .B(N61), .Z(n39) );
  NAND2X1 U49 ( .A(current_column[14]), .B(n10), .Z(n38) );
  NAND2X1 U50 ( .A(n40), .B(n41), .Z(n510) );
  NAND2X1 U51 ( .A(n9), .B(N62), .Z(n41) );
  NAND2X1 U52 ( .A(current_column[15]), .B(n10), .Z(n40) );
  NAND2X1 U53 ( .A(n42), .B(n43), .Z(n509) );
  NAND2X1 U54 ( .A(n9), .B(N63), .Z(n43) );
  NAND2X1 U55 ( .A(current_column[16]), .B(n10), .Z(n42) );
  NAND2X1 U56 ( .A(n44), .B(n45), .Z(n508) );
  NAND2X1 U57 ( .A(n9), .B(N64), .Z(n45) );
  NAND2X1 U58 ( .A(current_column[17]), .B(n10), .Z(n44) );
  NAND2X1 U59 ( .A(n46), .B(n47), .Z(n507) );
  NAND2X1 U60 ( .A(n9), .B(N65), .Z(n47) );
  NAND2X1 U61 ( .A(current_column[18]), .B(n10), .Z(n46) );
  NAND2X1 U62 ( .A(n48), .B(n49), .Z(n506) );
  NAND2X1 U63 ( .A(n9), .B(N66), .Z(n49) );
  NAND2X1 U64 ( .A(current_column[19]), .B(n10), .Z(n48) );
  INVX1 U65 ( .A(n50), .Z(n505) );
  MUX2X1 U66 ( .A(n51), .B(n52), .S(n22), .Z(n50) );
  NAND2X1 U67 ( .A(n53), .B(n54), .Z(n504) );
  NAND2X1 U68 ( .A(n9), .B(N68), .Z(n54) );
  NAND2X1 U69 ( .A(current_column[21]), .B(n10), .Z(n53) );
  NAND2X1 U70 ( .A(n55), .B(n56), .Z(n503) );
  NAND2X1 U71 ( .A(n9), .B(N69), .Z(n56) );
  NAND2X1 U72 ( .A(current_column[22]), .B(n10), .Z(n55) );
  NAND2X1 U73 ( .A(n57), .B(n58), .Z(n502) );
  NAND2X1 U74 ( .A(n9), .B(N70), .Z(n58) );
  NAND2X1 U75 ( .A(current_column[23]), .B(n10), .Z(n57) );
  NAND2X1 U76 ( .A(n59), .B(n60), .Z(n501) );
  NAND2X1 U77 ( .A(n9), .B(N71), .Z(n60) );
  NAND2X1 U78 ( .A(current_column[24]), .B(n10), .Z(n59) );
  NAND2X1 U79 ( .A(n61), .B(n62), .Z(n500) );
  NAND2X1 U80 ( .A(n9), .B(N72), .Z(n62) );
  NAND2X1 U81 ( .A(current_column[25]), .B(n10), .Z(n61) );
  NAND2X1 U82 ( .A(n63), .B(n64), .Z(n499) );
  NAND2X1 U83 ( .A(n9), .B(N73), .Z(n64) );
  NAND2X1 U84 ( .A(current_column[26]), .B(n10), .Z(n63) );
  INVX1 U85 ( .A(n65), .Z(n498) );
  MUX2X1 U86 ( .A(n66), .B(n67), .S(n22), .Z(n65) );
  NAND2X1 U87 ( .A(n68), .B(n69), .Z(n497) );
  NAND2X1 U88 ( .A(n9), .B(N75), .Z(n69) );
  NAND2X1 U89 ( .A(current_column[28]), .B(n10), .Z(n68) );
  NAND2X1 U90 ( .A(n70), .B(n71), .Z(n496) );
  NAND2X1 U91 ( .A(n9), .B(N76), .Z(n71) );
  NAND2X1 U92 ( .A(current_column[29]), .B(n10), .Z(n70) );
  NAND2X1 U93 ( .A(n72), .B(n73), .Z(n495) );
  NAND2X1 U94 ( .A(n9), .B(N77), .Z(n73) );
  NAND2X1 U95 ( .A(current_column[30]), .B(n10), .Z(n72) );
  NAND2X1 U96 ( .A(n74), .B(n75), .Z(n494) );
  NAND2X1 U97 ( .A(n9), .B(N78), .Z(n75) );
  NOR2X1 U98 ( .A(n76), .B(n10), .Z(n9) );
  NAND2X1 U99 ( .A(current_column[31]), .B(n10), .Z(n74) );
  NAND3X1 U100 ( .A(n77), .B(n78), .C(n79), .Z(n493) );
  NAND2X1 U101 ( .A(current_row[1]), .B(n4), .Z(n79) );
  NAND2X1 U102 ( .A(N48), .B(n5), .Z(n78) );
  NAND2X1 U103 ( .A(N180), .B(n6), .Z(n77) );
  NAND3X1 U104 ( .A(n80), .B(n81), .C(n82), .Z(n492) );
  NAND2X1 U105 ( .A(current_row[2]), .B(n4), .Z(n82) );
  NAND2X1 U106 ( .A(N49), .B(n5), .Z(n81) );
  NAND2X1 U107 ( .A(N181), .B(n6), .Z(n80) );
  NAND3X1 U108 ( .A(n83), .B(n84), .C(n85), .Z(n491) );
  NAND2X1 U109 ( .A(current_row[3]), .B(n4), .Z(n85) );
  NAND2X1 U110 ( .A(N50), .B(n5), .Z(n84) );
  NAND2X1 U111 ( .A(N182), .B(n6), .Z(n83) );
  NAND3X1 U112 ( .A(n86), .B(n87), .C(n88), .Z(n490) );
  NAND2X1 U113 ( .A(current_row[4]), .B(n4), .Z(n88) );
  NAND2X1 U114 ( .A(N51), .B(n5), .Z(n87) );
  NAND2X1 U115 ( .A(N183), .B(n6), .Z(n86) );
  NAND3X1 U116 ( .A(n89), .B(n90), .C(n91), .Z(n489) );
  NAND2X1 U117 ( .A(current_row[5]), .B(n4), .Z(n91) );
  NAND2X1 U118 ( .A(N52), .B(n5), .Z(n90) );
  NAND2X1 U119 ( .A(N184), .B(n6), .Z(n89) );
  NAND3X1 U120 ( .A(n92), .B(n93), .C(n94), .Z(n488) );
  NAND2X1 U121 ( .A(current_row[6]), .B(n4), .Z(n94) );
  NAND2X1 U122 ( .A(N53), .B(n5), .Z(n93) );
  NAND2X1 U123 ( .A(N185), .B(n6), .Z(n92) );
  NAND3X1 U124 ( .A(n95), .B(n96), .C(n97), .Z(n487) );
  NAND2X1 U125 ( .A(current_row[7]), .B(n4), .Z(n97) );
  NAND2X1 U126 ( .A(N54), .B(n5), .Z(n96) );
  NAND2X1 U127 ( .A(N186), .B(n6), .Z(n95) );
  NAND3X1 U128 ( .A(n98), .B(n99), .C(n100), .Z(n486) );
  NAND2X1 U129 ( .A(current_row[8]), .B(n4), .Z(n100) );
  NAND2X1 U130 ( .A(N55), .B(n5), .Z(n99) );
  NAND2X1 U131 ( .A(N187), .B(n6), .Z(n98) );
  NAND2X1 U132 ( .A(n101), .B(n102), .Z(n485) );
  NAND2X1 U133 ( .A(n103), .B(current_row[0]), .Z(n102) );
  NAND2X1 U134 ( .A(O_PIXEL_ROW[0]), .B(n10), .Z(n101) );
  NAND2X1 U135 ( .A(n104), .B(n105), .Z(n484) );
  NAND2X1 U136 ( .A(n103), .B(current_row[1]), .Z(n105) );
  NAND2X1 U137 ( .A(O_PIXEL_ROW[1]), .B(n10), .Z(n104) );
  NAND2X1 U138 ( .A(n106), .B(n107), .Z(n483) );
  NAND2X1 U139 ( .A(n103), .B(current_row[2]), .Z(n107) );
  NAND2X1 U140 ( .A(O_PIXEL_ROW[2]), .B(n10), .Z(n106) );
  NAND2X1 U141 ( .A(n108), .B(n109), .Z(n482) );
  NAND2X1 U142 ( .A(n103), .B(current_row[3]), .Z(n109) );
  NAND2X1 U143 ( .A(O_PIXEL_ROW[3]), .B(n10), .Z(n108) );
  NAND2X1 U144 ( .A(n110), .B(n111), .Z(n481) );
  NAND2X1 U145 ( .A(n103), .B(current_row[4]), .Z(n111) );
  NAND2X1 U146 ( .A(O_PIXEL_ROW[4]), .B(n10), .Z(n110) );
  NAND2X1 U147 ( .A(n112), .B(n113), .Z(n480) );
  NAND2X1 U148 ( .A(n103), .B(current_row[5]), .Z(n113) );
  NAND2X1 U149 ( .A(O_PIXEL_ROW[5]), .B(n10), .Z(n112) );
  NAND2X1 U150 ( .A(n114), .B(n115), .Z(n479) );
  NAND2X1 U151 ( .A(n103), .B(current_row[6]), .Z(n115) );
  NAND2X1 U152 ( .A(O_PIXEL_ROW[6]), .B(n10), .Z(n114) );
  NAND2X1 U153 ( .A(n116), .B(n117), .Z(n478) );
  NAND2X1 U154 ( .A(n103), .B(current_row[7]), .Z(n117) );
  NAND2X1 U155 ( .A(O_PIXEL_ROW[7]), .B(n10), .Z(n116) );
  NAND2X1 U156 ( .A(n118), .B(n119), .Z(n477) );
  NAND2X1 U157 ( .A(n103), .B(current_row[8]), .Z(n119) );
  NAND2X1 U158 ( .A(O_PIXEL_ROW[8]), .B(n10), .Z(n118) );
  NAND3X1 U159 ( .A(n120), .B(n121), .C(n122), .Z(n476) );
  NAND2X1 U160 ( .A(current_row[9]), .B(n4), .Z(n122) );
  NAND2X1 U161 ( .A(N56), .B(n5), .Z(n121) );
  NAND2X1 U162 ( .A(N188), .B(n6), .Z(n120) );
  NAND3X1 U163 ( .A(n123), .B(n124), .C(n125), .Z(n475) );
  NAND2X1 U164 ( .A(current_row[10]), .B(n4), .Z(n125) );
  NAND2X1 U165 ( .A(N57), .B(n5), .Z(n124) );
  NAND2X1 U166 ( .A(N189), .B(n6), .Z(n123) );
  NAND3X1 U167 ( .A(n126), .B(n127), .C(n128), .Z(n474) );
  NAND2X1 U168 ( .A(current_row[11]), .B(n4), .Z(n128) );
  NAND2X1 U169 ( .A(N58), .B(n5), .Z(n127) );
  NAND2X1 U170 ( .A(N190), .B(n6), .Z(n126) );
  NAND3X1 U171 ( .A(n129), .B(n130), .C(n131), .Z(n473) );
  NAND2X1 U172 ( .A(current_row[12]), .B(n4), .Z(n131) );
  NAND2X1 U173 ( .A(N59), .B(n5), .Z(n130) );
  NAND2X1 U174 ( .A(N191), .B(n6), .Z(n129) );
  NAND3X1 U175 ( .A(n132), .B(n133), .C(n134), .Z(n472) );
  NAND2X1 U176 ( .A(current_row[13]), .B(n4), .Z(n134) );
  NAND2X1 U177 ( .A(N60), .B(n5), .Z(n133) );
  NAND2X1 U178 ( .A(N192), .B(n6), .Z(n132) );
  NAND3X1 U179 ( .A(n135), .B(n136), .C(n137), .Z(n471) );
  NAND2X1 U180 ( .A(current_row[14]), .B(n4), .Z(n137) );
  NAND2X1 U181 ( .A(N61), .B(n5), .Z(n136) );
  NAND2X1 U182 ( .A(N193), .B(n6), .Z(n135) );
  NAND3X1 U183 ( .A(n138), .B(n139), .C(n140), .Z(n470) );
  NAND2X1 U184 ( .A(current_row[15]), .B(n4), .Z(n140) );
  NAND2X1 U185 ( .A(N62), .B(n5), .Z(n139) );
  NAND2X1 U186 ( .A(N194), .B(n6), .Z(n138) );
  NAND3X1 U187 ( .A(n141), .B(n142), .C(n143), .Z(n469) );
  NAND2X1 U188 ( .A(current_row[16]), .B(n4), .Z(n143) );
  NAND2X1 U189 ( .A(N63), .B(n5), .Z(n142) );
  NAND2X1 U190 ( .A(N195), .B(n6), .Z(n141) );
  NAND3X1 U191 ( .A(n144), .B(n145), .C(n146), .Z(n468) );
  NAND2X1 U192 ( .A(current_row[17]), .B(n4), .Z(n146) );
  NAND2X1 U193 ( .A(N64), .B(n5), .Z(n145) );
  NAND2X1 U194 ( .A(N196), .B(n6), .Z(n144) );
  NAND3X1 U195 ( .A(n147), .B(n148), .C(n149), .Z(n467) );
  NAND2X1 U196 ( .A(current_row[18]), .B(n4), .Z(n149) );
  NAND2X1 U197 ( .A(N65), .B(n5), .Z(n148) );
  NAND2X1 U198 ( .A(N197), .B(n6), .Z(n147) );
  NAND3X1 U199 ( .A(n150), .B(n151), .C(n152), .Z(n466) );
  NAND2X1 U200 ( .A(current_row[19]), .B(n4), .Z(n152) );
  NAND2X1 U201 ( .A(N66), .B(n5), .Z(n151) );
  NAND2X1 U202 ( .A(N198), .B(n6), .Z(n150) );
  NAND3X1 U203 ( .A(n153), .B(n154), .C(n155), .Z(n465) );
  NAND2X1 U204 ( .A(current_row[20]), .B(n4), .Z(n155) );
  NAND2X1 U205 ( .A(N67), .B(n5), .Z(n154) );
  NAND2X1 U206 ( .A(N199), .B(n6), .Z(n153) );
  NAND3X1 U207 ( .A(n156), .B(n157), .C(n158), .Z(n464) );
  NAND2X1 U208 ( .A(current_row[21]), .B(n4), .Z(n158) );
  NAND2X1 U209 ( .A(N68), .B(n5), .Z(n157) );
  NAND2X1 U210 ( .A(N200), .B(n6), .Z(n156) );
  NAND3X1 U211 ( .A(n159), .B(n160), .C(n161), .Z(n463) );
  NAND2X1 U212 ( .A(current_row[22]), .B(n4), .Z(n161) );
  NAND2X1 U213 ( .A(N69), .B(n5), .Z(n160) );
  NAND2X1 U214 ( .A(N201), .B(n6), .Z(n159) );
  NAND3X1 U215 ( .A(n162), .B(n163), .C(n164), .Z(n462) );
  NAND2X1 U216 ( .A(current_row[23]), .B(n4), .Z(n164) );
  NAND2X1 U217 ( .A(N70), .B(n5), .Z(n163) );
  NAND2X1 U218 ( .A(N202), .B(n6), .Z(n162) );
  NAND3X1 U219 ( .A(n165), .B(n166), .C(n167), .Z(n461) );
  NAND2X1 U220 ( .A(current_row[24]), .B(n4), .Z(n167) );
  NAND2X1 U221 ( .A(N71), .B(n5), .Z(n166) );
  NAND2X1 U222 ( .A(N203), .B(n6), .Z(n165) );
  NAND3X1 U223 ( .A(n168), .B(n169), .C(n170), .Z(n460) );
  NAND2X1 U224 ( .A(current_row[25]), .B(n4), .Z(n170) );
  NAND2X1 U225 ( .A(N72), .B(n5), .Z(n169) );
  NAND2X1 U226 ( .A(N204), .B(n6), .Z(n168) );
  NAND3X1 U227 ( .A(n171), .B(n172), .C(n173), .Z(n459) );
  NAND2X1 U228 ( .A(current_row[26]), .B(n4), .Z(n173) );
  NAND2X1 U229 ( .A(N73), .B(n5), .Z(n172) );
  NAND2X1 U230 ( .A(N205), .B(n6), .Z(n171) );
  NAND3X1 U231 ( .A(n174), .B(n175), .C(n176), .Z(n458) );
  NAND2X1 U232 ( .A(current_row[27]), .B(n4), .Z(n176) );
  NAND2X1 U233 ( .A(N74), .B(n5), .Z(n175) );
  NAND2X1 U234 ( .A(N206), .B(n6), .Z(n174) );
  NAND3X1 U235 ( .A(n177), .B(n178), .C(n179), .Z(n457) );
  NAND2X1 U236 ( .A(current_row[28]), .B(n4), .Z(n179) );
  NAND2X1 U237 ( .A(N75), .B(n5), .Z(n178) );
  NAND2X1 U238 ( .A(N207), .B(n6), .Z(n177) );
  NAND3X1 U239 ( .A(n180), .B(n181), .C(n182), .Z(n456) );
  NAND2X1 U240 ( .A(current_row[29]), .B(n4), .Z(n182) );
  NAND2X1 U241 ( .A(N76), .B(n5), .Z(n181) );
  NAND2X1 U242 ( .A(N208), .B(n6), .Z(n180) );
  NAND3X1 U243 ( .A(n183), .B(n184), .C(n185), .Z(n455) );
  NAND2X1 U244 ( .A(current_row[30]), .B(n4), .Z(n185) );
  NAND2X1 U245 ( .A(N77), .B(n5), .Z(n184) );
  NAND2X1 U246 ( .A(N209), .B(n6), .Z(n183) );
  NAND3X1 U247 ( .A(n186), .B(n187), .C(n188), .Z(n454) );
  NAND2X1 U248 ( .A(current_row[31]), .B(n4), .Z(n188) );
  NAND2X1 U249 ( .A(N78), .B(n5), .Z(n187) );
  NOR2X1 U250 ( .A(n4), .B(I_VSYNC), .Z(n5) );
  NAND2X1 U251 ( .A(N210), .B(n6), .Z(n186) );
  INVX1 U252 ( .A(n189), .Z(n6) );
  NAND3X1 U253 ( .A(n190), .B(n191), .C(n192), .Z(n189) );
  AND2X1 U254 ( .A(n193), .B(n194), .Z(n192) );
  NOR2X1 U255 ( .A(n195), .B(n196), .Z(n194) );
  NAND3X1 U256 ( .A(n197), .B(n198), .C(n199), .Z(n196) );
  NAND3X1 U257 ( .A(n200), .B(n201), .C(n202), .Z(n195) );
  NOR2X1 U258 ( .A(n203), .B(n204), .Z(n193) );
  NAND3X1 U259 ( .A(n205), .B(n206), .C(I_VSYNC), .Z(n204) );
  INVX1 U260 ( .A(n4), .Z(n206) );
  NAND3X1 U261 ( .A(I_DE), .B(n207), .C(I_ENABLE), .Z(n4) );
  OR2X1 U262 ( .A(n208), .B(I_VSYNC), .Z(n207) );
  NAND3X1 U263 ( .A(n209), .B(n210), .C(n211), .Z(n203) );
  INVX1 U264 ( .A(N161), .Z(n210) );
  NOR2X1 U265 ( .A(n212), .B(n213), .Z(n191) );
  NAND3X1 U266 ( .A(n214), .B(n215), .C(n216), .Z(n213) );
  INVX1 U267 ( .A(N147), .Z(n214) );
  NAND3X1 U268 ( .A(n217), .B(n218), .C(n219), .Z(n212) );
  NOR2X1 U269 ( .A(n220), .B(N143), .Z(n219) );
  NOR2X1 U270 ( .A(n221), .B(n222), .Z(n220) );
  INVX1 U271 ( .A(N165), .Z(n222) );
  NOR2X1 U272 ( .A(n223), .B(n224), .Z(n221) );
  NAND3X1 U273 ( .A(n225), .B(n226), .C(n227), .Z(n224) );
  MUX2X1 U274 ( .A(n228), .B(n229), .S(n208), .Z(n227) );
  NAND2X1 U275 ( .A(N50), .B(n230), .Z(n229) );
  NAND2X1 U276 ( .A(n231), .B(n232), .Z(n230) );
  NAND2X1 U277 ( .A(N48), .B(N174), .Z(n232) );
  INVX1 U278 ( .A(N49), .Z(n231) );
  NAND2X1 U279 ( .A(current_row[3]), .B(n233), .Z(n228) );
  NAND2X1 U280 ( .A(n234), .B(n235), .Z(n233) );
  NAND2X1 U281 ( .A(current_row[1]), .B(N174), .Z(n235) );
  INVX1 U282 ( .A(current_row[2]), .Z(n234) );
  INVX1 U283 ( .A(N169), .Z(n226) );
  INVX1 U284 ( .A(N170), .Z(n225) );
  NAND3X1 U285 ( .A(n236), .B(n237), .C(n238), .Z(n223) );
  INVX1 U286 ( .A(N168), .Z(n238) );
  INVX1 U287 ( .A(N166), .Z(n237) );
  INVX1 U288 ( .A(N167), .Z(n236) );
  INVX1 U289 ( .A(N144), .Z(n218) );
  NOR2X1 U290 ( .A(n239), .B(n240), .Z(n190) );
  NAND3X1 U291 ( .A(n241), .B(n242), .C(n243), .Z(n240) );
  INVX1 U292 ( .A(N154), .Z(n243) );
  NAND3X1 U293 ( .A(n244), .B(n245), .C(n246), .Z(n239) );
  NAND2X1 U294 ( .A(n247), .B(n248), .Z(n453) );
  NAND2X1 U295 ( .A(n103), .B(N56), .Z(n248) );
  NAND2X1 U296 ( .A(O_PIXEL_COL[9]), .B(n10), .Z(n247) );
  NAND2X1 U297 ( .A(n249), .B(n250), .Z(n452) );
  NAND2X1 U298 ( .A(n103), .B(N55), .Z(n250) );
  NAND2X1 U299 ( .A(O_PIXEL_COL[8]), .B(n10), .Z(n249) );
  NAND2X1 U300 ( .A(n251), .B(n252), .Z(n451) );
  NAND2X1 U301 ( .A(n103), .B(N54), .Z(n252) );
  NAND2X1 U302 ( .A(O_PIXEL_COL[7]), .B(n10), .Z(n251) );
  NAND2X1 U303 ( .A(n253), .B(n254), .Z(n450) );
  NAND2X1 U304 ( .A(n103), .B(n21), .Z(n254) );
  NAND2X1 U305 ( .A(O_PIXEL_COL[6]), .B(n10), .Z(n253) );
  NAND2X1 U306 ( .A(n255), .B(n256), .Z(n449) );
  NAND2X1 U307 ( .A(n103), .B(N52), .Z(n256) );
  NAND2X1 U308 ( .A(O_PIXEL_COL[5]), .B(n10), .Z(n255) );
  NAND2X1 U309 ( .A(n257), .B(n258), .Z(n448) );
  NAND2X1 U310 ( .A(n103), .B(N51), .Z(n258) );
  NAND2X1 U311 ( .A(O_PIXEL_COL[4]), .B(n10), .Z(n257) );
  NAND2X1 U312 ( .A(n259), .B(n260), .Z(n447) );
  NAND2X1 U313 ( .A(n103), .B(N50), .Z(n260) );
  NAND2X1 U314 ( .A(O_PIXEL_COL[3]), .B(n10), .Z(n259) );
  NAND2X1 U315 ( .A(n261), .B(n262), .Z(n446) );
  NAND2X1 U316 ( .A(n103), .B(N49), .Z(n262) );
  NAND2X1 U317 ( .A(O_PIXEL_COL[2]), .B(n10), .Z(n261) );
  NAND2X1 U318 ( .A(n263), .B(n264), .Z(n445) );
  NAND2X1 U319 ( .A(n103), .B(N48), .Z(n264) );
  NAND2X1 U320 ( .A(O_PIXEL_COL[1]), .B(n10), .Z(n263) );
  NAND2X1 U321 ( .A(n265), .B(n266), .Z(n444) );
  NAND2X1 U322 ( .A(n103), .B(N47), .Z(n266) );
  INVX1 U323 ( .A(n267), .Z(n103) );
  NAND2X1 U324 ( .A(O_PIXEL_COL[0]), .B(n10), .Z(n265) );
  NAND2X1 U325 ( .A(n267), .B(n268), .Z(n443) );
  NAND2X1 U326 ( .A(O_PIXEL_WRITE_ENABLE), .B(n10), .Z(n268) );
  NAND3X1 U327 ( .A(n269), .B(n270), .C(n271), .Z(n267) );
  AND2X1 U328 ( .A(n272), .B(n273), .Z(n271) );
  NOR2X1 U329 ( .A(n274), .B(n275), .Z(n273) );
  NAND3X1 U330 ( .A(n276), .B(n277), .C(n278), .Z(n275) );
  NAND3X1 U331 ( .A(n279), .B(n280), .C(n281), .Z(n274) );
  NOR2X1 U332 ( .A(N78), .B(N77), .Z(n281) );
  NOR2X1 U333 ( .A(n282), .B(n283), .Z(n272) );
  NAND3X1 U334 ( .A(n284), .B(n285), .C(n286), .Z(n283) );
  NAND3X1 U335 ( .A(n287), .B(n288), .C(n289), .Z(n282) );
  NOR2X1 U336 ( .A(n290), .B(n291), .Z(n270) );
  NAND3X1 U337 ( .A(n292), .B(n293), .C(n294), .Z(n291) );
  NAND3X1 U338 ( .A(n295), .B(n296), .C(n297), .Z(n290) );
  NOR2X1 U339 ( .A(n298), .B(n299), .Z(n269) );
  NAND3X1 U340 ( .A(n300), .B(n301), .C(n22), .Z(n299) );
  INVX1 U341 ( .A(n10), .Z(n22) );
  NAND3X1 U342 ( .A(I_DE), .B(I_HSYNC), .C(I_ENABLE), .Z(n10) );
  NAND2X1 U343 ( .A(N56), .B(n302), .Z(n301) );
  NAND2X1 U344 ( .A(n303), .B(n304), .Z(n302) );
  NAND2X1 U345 ( .A(n21), .B(N54), .Z(n304) );
  INVX1 U346 ( .A(n305), .Z(n21) );
  NAND3X1 U347 ( .A(n306), .B(n305), .C(n307), .Z(n300) );
  NAND2X1 U348 ( .A(n308), .B(n309), .Z(n307) );
  OR2X1 U349 ( .A(N51), .B(N52), .Z(n309) );
  NAND2X1 U350 ( .A(n308), .B(N53), .Z(n305) );
  NAND2X1 U351 ( .A(n308), .B(n310), .Z(n306) );
  NAND3X1 U352 ( .A(n303), .B(n311), .C(n312), .Z(n310) );
  INVX1 U353 ( .A(N54), .Z(n312) );
  INVX1 U354 ( .A(N56), .Z(n311) );
  INVX1 U355 ( .A(N55), .Z(n303) );
  NAND3X1 U356 ( .A(n37), .B(n67), .C(n52), .Z(n298) );
  NAND2X1 U357 ( .A(n308), .B(N67), .Z(n52) );
  NAND2X1 U358 ( .A(n308), .B(N74), .Z(n67) );
  NAND2X1 U359 ( .A(n308), .B(N60), .Z(n37) );
  MUX2X1 U360 ( .A(current_row[9]), .B(current_column[9]), .S(n308), .Z(
        \U3/U1/Z_9 ) );
  MUX2X1 U361 ( .A(current_row[8]), .B(current_column[8]), .S(n308), .Z(
        \U3/U1/Z_8 ) );
  MUX2X1 U362 ( .A(current_row[7]), .B(current_column[7]), .S(n308), .Z(
        \U3/U1/Z_7 ) );
  MUX2X1 U363 ( .A(current_row[6]), .B(current_column[6]), .S(n308), .Z(
        \U3/U1/Z_6 ) );
  MUX2X1 U364 ( .A(current_row[5]), .B(current_column[5]), .S(n308), .Z(
        \U3/U1/Z_5 ) );
  MUX2X1 U365 ( .A(current_row[4]), .B(current_column[4]), .S(n308), .Z(
        \U3/U1/Z_4 ) );
  AND2X1 U366 ( .A(n76), .B(current_row[31]), .Z(\U3/U1/Z_31 ) );
  AND2X1 U367 ( .A(n76), .B(current_row[30]), .Z(\U3/U1/Z_30 ) );
  MUX2X1 U368 ( .A(current_row[3]), .B(current_column[3]), .S(n308), .Z(
        \U3/U1/Z_3 ) );
  NOR2X1 U369 ( .A(n308), .B(n313), .Z(\U3/U1/Z_29 ) );
  NOR2X1 U370 ( .A(n308), .B(n314), .Z(\U3/U1/Z_28 ) );
  AND2X1 U371 ( .A(n76), .B(current_row[27]), .Z(\U3/U1/Z_27 ) );
  NOR2X1 U372 ( .A(n308), .B(n315), .Z(\U3/U1/Z_26 ) );
  NOR2X1 U373 ( .A(n308), .B(n316), .Z(\U3/U1/Z_25 ) );
  NOR2X1 U374 ( .A(n308), .B(n317), .Z(\U3/U1/Z_24 ) );
  NOR2X1 U375 ( .A(n308), .B(n318), .Z(\U3/U1/Z_23 ) );
  NOR2X1 U376 ( .A(n308), .B(n319), .Z(\U3/U1/Z_22 ) );
  NOR2X1 U377 ( .A(n308), .B(n320), .Z(\U3/U1/Z_21 ) );
  AND2X1 U378 ( .A(n76), .B(current_row[20]), .Z(\U3/U1/Z_20 ) );
  MUX2X1 U379 ( .A(current_row[2]), .B(current_column[2]), .S(n308), .Z(
        \U3/U1/Z_2 ) );
  NOR2X1 U380 ( .A(n308), .B(n321), .Z(\U3/U1/Z_19 ) );
  NOR2X1 U381 ( .A(n308), .B(n322), .Z(\U3/U1/Z_18 ) );
  NOR2X1 U382 ( .A(n308), .B(n323), .Z(\U3/U1/Z_17 ) );
  NOR2X1 U383 ( .A(n308), .B(n324), .Z(\U3/U1/Z_16 ) );
  NOR2X1 U384 ( .A(n308), .B(n325), .Z(\U3/U1/Z_15 ) );
  NOR2X1 U385 ( .A(n308), .B(n326), .Z(\U3/U1/Z_14 ) );
  AND2X1 U386 ( .A(n76), .B(current_row[13]), .Z(\U3/U1/Z_13 ) );
  NOR2X1 U387 ( .A(n308), .B(n327), .Z(\U3/U1/Z_12 ) );
  NOR2X1 U388 ( .A(n308), .B(n328), .Z(\U3/U1/Z_11 ) );
  NOR2X1 U389 ( .A(n308), .B(n329), .Z(\U3/U1/Z_10 ) );
  MUX2X1 U390 ( .A(current_row[1]), .B(current_column[1]), .S(n308), .Z(
        \U3/U1/Z_1 ) );
  MUX2X1 U391 ( .A(current_row[0]), .B(current_column[0]), .S(n308), .Z(
        \U3/U1/Z_0 ) );
  INVX1 U392 ( .A(n76), .Z(n308) );
  MUX2X1 U393 ( .A(N47), .B(current_row[0]), .S(n330), .Z(N174) );
  MUX2X1 U394 ( .A(current_row[1]), .B(N48), .S(n208), .Z(N173) );
  MUX2X1 U395 ( .A(current_row[2]), .B(N49), .S(n208), .Z(N172) );
  MUX2X1 U396 ( .A(current_row[3]), .B(N50), .S(n208), .Z(N171) );
  MUX2X1 U397 ( .A(current_row[4]), .B(N51), .S(n208), .Z(N170) );
  MUX2X1 U398 ( .A(current_row[5]), .B(N52), .S(n208), .Z(N169) );
  MUX2X1 U399 ( .A(current_row[6]), .B(N53), .S(n208), .Z(N168) );
  MUX2X1 U400 ( .A(current_row[7]), .B(N54), .S(n208), .Z(N167) );
  MUX2X1 U401 ( .A(current_row[8]), .B(N55), .S(n208), .Z(N166) );
  MUX2X1 U402 ( .A(current_row[9]), .B(N56), .S(n208), .Z(N165) );
  INVX1 U403 ( .A(n205), .Z(N164) );
  MUX2X1 U404 ( .A(n329), .B(n294), .S(n208), .Z(n205) );
  INVX1 U405 ( .A(N57), .Z(n294) );
  INVX1 U406 ( .A(current_row[10]), .Z(n329) );
  INVX1 U407 ( .A(n211), .Z(N163) );
  MUX2X1 U408 ( .A(n328), .B(n292), .S(n208), .Z(n211) );
  INVX1 U409 ( .A(N58), .Z(n292) );
  INVX1 U410 ( .A(current_row[11]), .Z(n328) );
  INVX1 U411 ( .A(n209), .Z(N162) );
  MUX2X1 U412 ( .A(n327), .B(n293), .S(n208), .Z(n209) );
  INVX1 U413 ( .A(N59), .Z(n293) );
  INVX1 U414 ( .A(current_row[12]), .Z(n327) );
  MUX2X1 U415 ( .A(current_row[13]), .B(N60), .S(n208), .Z(N161) );
  INVX1 U416 ( .A(n199), .Z(N160) );
  MUX2X1 U417 ( .A(n326), .B(n297), .S(n208), .Z(n199) );
  INVX1 U418 ( .A(N61), .Z(n297) );
  INVX1 U419 ( .A(current_row[14]), .Z(n326) );
  INVX1 U420 ( .A(n197), .Z(N159) );
  MUX2X1 U421 ( .A(n325), .B(n295), .S(n208), .Z(n197) );
  INVX1 U422 ( .A(N62), .Z(n295) );
  INVX1 U423 ( .A(current_row[15]), .Z(n325) );
  INVX1 U424 ( .A(n198), .Z(N158) );
  MUX2X1 U425 ( .A(n324), .B(n296), .S(n208), .Z(n198) );
  INVX1 U426 ( .A(N63), .Z(n296) );
  INVX1 U427 ( .A(current_row[16]), .Z(n324) );
  INVX1 U428 ( .A(n202), .Z(N157) );
  MUX2X1 U429 ( .A(n323), .B(n286), .S(n208), .Z(n202) );
  INVX1 U430 ( .A(N64), .Z(n286) );
  INVX1 U431 ( .A(current_row[17]), .Z(n323) );
  INVX1 U432 ( .A(n200), .Z(N156) );
  MUX2X1 U433 ( .A(n322), .B(n284), .S(n208), .Z(n200) );
  INVX1 U434 ( .A(N65), .Z(n284) );
  INVX1 U435 ( .A(current_row[18]), .Z(n322) );
  INVX1 U436 ( .A(n201), .Z(N155) );
  MUX2X1 U437 ( .A(n321), .B(n285), .S(n208), .Z(n201) );
  INVX1 U438 ( .A(N66), .Z(n285) );
  INVX1 U439 ( .A(current_row[19]), .Z(n321) );
  MUX2X1 U440 ( .A(current_row[20]), .B(N67), .S(n208), .Z(N154) );
  INVX1 U441 ( .A(n241), .Z(N153) );
  MUX2X1 U442 ( .A(n320), .B(n289), .S(n208), .Z(n241) );
  INVX1 U443 ( .A(N68), .Z(n289) );
  INVX1 U444 ( .A(current_row[21]), .Z(n320) );
  INVX1 U445 ( .A(n242), .Z(N152) );
  MUX2X1 U446 ( .A(n319), .B(n287), .S(n208), .Z(n242) );
  INVX1 U447 ( .A(N69), .Z(n287) );
  INVX1 U448 ( .A(current_row[22]), .Z(n319) );
  INVX1 U449 ( .A(n246), .Z(N151) );
  MUX2X1 U450 ( .A(n318), .B(n288), .S(n208), .Z(n246) );
  INVX1 U451 ( .A(N70), .Z(n288) );
  INVX1 U452 ( .A(current_row[23]), .Z(n318) );
  INVX1 U453 ( .A(n244), .Z(N150) );
  MUX2X1 U454 ( .A(n317), .B(n278), .S(n208), .Z(n244) );
  INVX1 U455 ( .A(N71), .Z(n278) );
  INVX1 U456 ( .A(current_row[24]), .Z(n317) );
  INVX1 U457 ( .A(n245), .Z(N149) );
  MUX2X1 U458 ( .A(n316), .B(n276), .S(n208), .Z(n245) );
  INVX1 U459 ( .A(N72), .Z(n276) );
  INVX1 U460 ( .A(current_row[25]), .Z(n316) );
  INVX1 U461 ( .A(n216), .Z(N148) );
  MUX2X1 U462 ( .A(n315), .B(n277), .S(n208), .Z(n216) );
  INVX1 U463 ( .A(N73), .Z(n277) );
  INVX1 U464 ( .A(current_row[26]), .Z(n315) );
  MUX2X1 U465 ( .A(current_row[27]), .B(N74), .S(n208), .Z(N147) );
  INVX1 U466 ( .A(n215), .Z(N146) );
  MUX2X1 U467 ( .A(n314), .B(n279), .S(n208), .Z(n215) );
  INVX1 U468 ( .A(N75), .Z(n279) );
  INVX1 U469 ( .A(current_row[28]), .Z(n314) );
  INVX1 U470 ( .A(n217), .Z(N145) );
  MUX2X1 U471 ( .A(n313), .B(n280), .S(n208), .Z(n217) );
  INVX1 U472 ( .A(N76), .Z(n280) );
  INVX1 U473 ( .A(current_row[29]), .Z(n313) );
  MUX2X1 U474 ( .A(current_row[30]), .B(N77), .S(n208), .Z(N144) );
  MUX2X1 U475 ( .A(N78), .B(current_row[31]), .S(n330), .Z(N143) );
  NAND2X1 U476 ( .A(I_HSYNC), .B(n76), .Z(n330) );
  NAND3X1 U477 ( .A(n331), .B(n332), .C(n333), .Z(n76) );
  AND2X1 U478 ( .A(n334), .B(n335), .Z(n333) );
  NOR2X1 U479 ( .A(n336), .B(n337), .Z(n335) );
  NAND3X1 U480 ( .A(n66), .B(n338), .C(n339), .Z(n337) );
  INVX1 U481 ( .A(current_column[26]), .Z(n339) );
  INVX1 U482 ( .A(current_column[28]), .Z(n338) );
  INVX1 U483 ( .A(current_column[27]), .Z(n66) );
  NAND3X1 U484 ( .A(n340), .B(n341), .C(n342), .Z(n336) );
  INVX1 U485 ( .A(current_column[29]), .Z(n342) );
  INVX1 U486 ( .A(current_column[31]), .Z(n341) );
  INVX1 U487 ( .A(current_column[30]), .Z(n340) );
  NOR2X1 U488 ( .A(n343), .B(n344), .Z(n334) );
  NAND3X1 U489 ( .A(n345), .B(n346), .C(n51), .Z(n344) );
  INVX1 U490 ( .A(current_column[20]), .Z(n51) );
  INVX1 U491 ( .A(current_column[22]), .Z(n346) );
  INVX1 U492 ( .A(current_column[21]), .Z(n345) );
  NAND3X1 U493 ( .A(n347), .B(n348), .C(n349), .Z(n343) );
  INVX1 U494 ( .A(current_column[23]), .Z(n349) );
  INVX1 U495 ( .A(current_column[25]), .Z(n348) );
  INVX1 U496 ( .A(current_column[24]), .Z(n347) );
  NOR2X1 U497 ( .A(n350), .B(n351), .Z(n332) );
  NAND3X1 U498 ( .A(n352), .B(n353), .C(n354), .Z(n351) );
  INVX1 U499 ( .A(current_column[14]), .Z(n354) );
  INVX1 U500 ( .A(current_column[16]), .Z(n353) );
  INVX1 U501 ( .A(current_column[15]), .Z(n352) );
  NAND3X1 U502 ( .A(n355), .B(n356), .C(n357), .Z(n350) );
  INVX1 U503 ( .A(current_column[17]), .Z(n357) );
  INVX1 U504 ( .A(current_column[19]), .Z(n356) );
  INVX1 U505 ( .A(current_column[18]), .Z(n355) );
  NOR2X1 U506 ( .A(n358), .B(n359), .Z(n331) );
  NAND2X1 U507 ( .A(n360), .B(n361), .Z(n359) );
  INVX1 U508 ( .A(current_column[10]), .Z(n361) );
  NAND2X1 U509 ( .A(current_column[9]), .B(n362), .Z(n360) );
  NAND2X1 U510 ( .A(n363), .B(n364), .Z(n362) );
  NAND2X1 U511 ( .A(current_column[7]), .B(current_column[6]), .Z(n364) );
  INVX1 U512 ( .A(current_column[8]), .Z(n363) );
  NAND3X1 U513 ( .A(n365), .B(n36), .C(n366), .Z(n358) );
  INVX1 U514 ( .A(current_column[11]), .Z(n366) );
  INVX1 U515 ( .A(current_column[13]), .Z(n36) );
  INVX1 U516 ( .A(current_column[12]), .Z(n365) );
endmodule


module edge_detection_top ( I_RST, I_CLK_100, I_PIX_DATA, I_VSYNC, I_HSYNC, 
        I_DE, I_PCLK, O_PIX_DATA, O_VSYNC, O_HSYNC, O_DE, O_PCLK );
  input [23:0] I_PIX_DATA;
  output [23:0] O_PIX_DATA;
  input I_RST, I_CLK_100, I_VSYNC, I_HSYNC, I_DE, I_PCLK;
  output O_VSYNC, O_HSYNC, O_DE, O_PCLK;
  wire   \*Logic1* , N4, n2;
  tri   I_RST;
  tri   I_CLK_100;
  tri   [23:0] O_PIX_DATA;
  tri   O_VSYNC;
  tri   O_HSYNC;
  tri   O_DE;
  tri   O_PCLK;
  tri   pix_vsync_dly;
  tri   [9:0] colorspace_converter_pixel_col;
  tri   [8:0] colorspace_converter_pixel_row;
  tri   [23:0] colorspace_converter_pixel;
  tri   colorspace_converter_pixel_write_enable;
  tri   \out[7] ;
  tri   \out[6] ;
  tri   \out[5] ;
  tri   \out[4] ;
  tri   \out[3] ;
  tri   \out[2] ;
  tri   \out[1] ;
  tri   \out[0] ;
  tri   n3;
  tri   n4;
  assign O_PCLK = I_PCLK;

  DFFQX1 pix_vsync_dly_reg ( .D(N4), .CLK(O_PCLK), .Q(pix_vsync_dly) );
  colorspace_converter iColorspaceConverter ( .I_CLK(I_CLK_100), .I_RESET(
        I_RST), .I_ENABLE(\*Logic1* ), .I_PIX_DATA(I_PIX_DATA), .I_VSYNC(
        I_VSYNC), .I_HSYNC(I_HSYNC), .I_DE(I_DE), .I_PCLK(O_PCLK), 
        .O_PIXEL_COL(colorspace_converter_pixel_col), .O_PIXEL_ROW(
        colorspace_converter_pixel_row), .O_PIXEL(colorspace_converter_pixel), 
        .O_PIXEL_WRITE_ENABLE(colorspace_converter_pixel_write_enable) );
  frame_buffer iFrameBuffer ( .I_CLK(I_CLK_100), .I_RESET(I_RST), .I_ENABLE(
        1'b1), .I_PIXEL_COL(colorspace_converter_pixel_col), .I_PIXEL_ROW(
        colorspace_converter_pixel_row), .I_PIXEL(colorspace_converter_pixel), 
        .I_WRITE_ENABLE(colorspace_converter_pixel_write_enable) );
  sobel iSobel ( .row(colorspace_converter_pixel_row), .col(
        colorspace_converter_pixel_col), .clk_pix(O_PCLK), .clk(I_CLK_100), 
        .out({\out[7] , \out[6] , \out[5] , \out[4] , \out[3] , \out[2] , 
        \out[1] , \out[0] }) );
  video_timing_gen iVidGen ( .I_RST(I_RST), .I_PCLK(O_PCLK), .I_PIX_DATA({
        \out[7] , \out[6] , \out[5] , \out[4] , \out[3] , \out[2] , \out[1] , 
        \out[0] }), .I_TP_EN(1'b0), .I_HS_END({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b1, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .I_HBP_END({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1}), 
        .I_HACT_END({1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 
        1'b1, 1'b1, 1'b1}), .I_HFP_END({1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 
        1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .I_VS_END({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0}), .I_VBP_END({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1}), .I_VACT_END({1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b1, 1'b1}), .I_VFP_END({1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b1, 1'b1, 1'b0, 1'b1}), .I_VRST(pix_vsync_dly), .O_DE(O_DE), 
        .O_HS(O_HSYNC), .O_VS(O_VSYNC), .O_PIX_DATA(O_PIX_DATA) );
  TIE1 U5 ( .Z(\*Logic1* ) );
  NOR2X1 U6 ( .A(I_RST), .B(n2), .Z(N4) );
  INVX1 U7 ( .A(I_VSYNC), .Z(n2) );
endmodule

