/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-6
// Date      : Tue Dec  1 18:05:46 2020
/////////////////////////////////////////////////////////////


module sobel_DW01_add_0 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38;

  XOR2X1 U1 ( .A(n1), .B(n2), .Z(SUM[9]) );
  XOR2X1 U2 ( .A(B[9]), .B(A[9]), .Z(n2) );
  XOR2X1 U3 ( .A(n3), .B(n4), .Z(SUM[8]) );
  XOR2X1 U4 ( .A(B[8]), .B(A[8]), .Z(n4) );
  XOR2X1 U5 ( .A(n5), .B(n6), .Z(SUM[7]) );
  XOR2X1 U6 ( .A(B[7]), .B(A[7]), .Z(n6) );
  NAND2X1 U7 ( .A(n7), .B(n8), .Z(SUM[10]) );
  NAND2X1 U8 ( .A(B[9]), .B(n9), .Z(n8) );
  OR2X1 U9 ( .A(n1), .B(A[9]), .Z(n9) );
  NAND2X1 U10 ( .A(A[9]), .B(n1), .Z(n7) );
  NAND2X1 U11 ( .A(n10), .B(n11), .Z(n1) );
  NAND2X1 U12 ( .A(B[8]), .B(n12), .Z(n11) );
  OR2X1 U13 ( .A(n3), .B(A[8]), .Z(n12) );
  NAND2X1 U14 ( .A(A[8]), .B(n3), .Z(n10) );
  NAND2X1 U15 ( .A(n13), .B(n14), .Z(n3) );
  NAND2X1 U16 ( .A(B[7]), .B(n15), .Z(n14) );
  OR2X1 U17 ( .A(n5), .B(A[7]), .Z(n15) );
  NAND2X1 U18 ( .A(A[7]), .B(n5), .Z(n13) );
  NAND2X1 U19 ( .A(n16), .B(n17), .Z(n5) );
  NAND2X1 U20 ( .A(B[6]), .B(n18), .Z(n17) );
  OR2X1 U21 ( .A(n19), .B(A[6]), .Z(n18) );
  NAND2X1 U22 ( .A(A[6]), .B(n19), .Z(n16) );
  NAND2X1 U23 ( .A(n20), .B(n21), .Z(n19) );
  NAND2X1 U24 ( .A(B[5]), .B(n22), .Z(n21) );
  OR2X1 U25 ( .A(n23), .B(A[5]), .Z(n22) );
  NAND2X1 U26 ( .A(A[5]), .B(n23), .Z(n20) );
  NAND2X1 U27 ( .A(n24), .B(n25), .Z(n23) );
  NAND2X1 U28 ( .A(B[4]), .B(n26), .Z(n25) );
  OR2X1 U29 ( .A(n27), .B(A[4]), .Z(n26) );
  NAND2X1 U30 ( .A(A[4]), .B(n27), .Z(n24) );
  NAND2X1 U31 ( .A(n28), .B(n29), .Z(n27) );
  NAND2X1 U32 ( .A(B[3]), .B(n30), .Z(n29) );
  OR2X1 U33 ( .A(n31), .B(A[3]), .Z(n30) );
  NAND2X1 U34 ( .A(A[3]), .B(n31), .Z(n28) );
  NAND2X1 U35 ( .A(n32), .B(n33), .Z(n31) );
  NAND2X1 U36 ( .A(B[2]), .B(n34), .Z(n33) );
  OR2X1 U37 ( .A(n35), .B(A[2]), .Z(n34) );
  NAND2X1 U38 ( .A(A[2]), .B(n35), .Z(n32) );
  NAND2X1 U39 ( .A(n36), .B(n37), .Z(n35) );
  NAND3X1 U40 ( .A(A[0]), .B(n38), .C(B[0]), .Z(n37) );
  OR2X1 U41 ( .A(B[1]), .B(A[1]), .Z(n38) );
  NAND2X1 U42 ( .A(B[1]), .B(A[1]), .Z(n36) );
endmodule


module sobel_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54;

  INVX2 U1 ( .A(n17), .Z(DIFF[8]) );
  INVX2 U2 ( .A(n52), .Z(n2) );
  INVX2 U3 ( .A(B[0]), .Z(n3) );
  INVX2 U4 ( .A(B[1]), .Z(n4) );
  INVX2 U5 ( .A(B[2]), .Z(n5) );
  INVX2 U6 ( .A(B[3]), .Z(n6) );
  INVX2 U7 ( .A(B[4]), .Z(n7) );
  INVX2 U8 ( .A(B[5]), .Z(n8) );
  INVX2 U9 ( .A(B[6]), .Z(n9) );
  INVX2 U10 ( .A(B[7]), .Z(n10) );
  XOR2X1 U11 ( .A(n11), .B(n12), .Z(DIFF[9]) );
  XOR2X1 U12 ( .A(B[9]), .B(A[9]), .Z(n12) );
  NOR2X1 U13 ( .A(n13), .B(n14), .Z(n11) );
  AND2X1 U14 ( .A(n15), .B(A[8]), .Z(n14) );
  NOR2X1 U15 ( .A(B[8]), .B(n16), .Z(n13) );
  NOR2X1 U16 ( .A(A[8]), .B(n15), .Z(n16) );
  XOR2X1 U17 ( .A(n15), .B(n18), .Z(n17) );
  XOR2X1 U18 ( .A(A[8]), .B(B[8]), .Z(n18) );
  NAND2X1 U19 ( .A(n19), .B(n20), .Z(n15) );
  NAND2X1 U20 ( .A(n21), .B(n10), .Z(n20) );
  OR2X1 U21 ( .A(n22), .B(A[7]), .Z(n21) );
  NAND2X1 U22 ( .A(A[7]), .B(n22), .Z(n19) );
  XOR2X1 U23 ( .A(n22), .B(n23), .Z(DIFF[7]) );
  XOR2X1 U24 ( .A(A[7]), .B(n10), .Z(n23) );
  NAND2X1 U25 ( .A(n24), .B(n25), .Z(n22) );
  NAND2X1 U26 ( .A(n26), .B(n9), .Z(n25) );
  OR2X1 U27 ( .A(n27), .B(A[6]), .Z(n26) );
  NAND2X1 U28 ( .A(A[6]), .B(n27), .Z(n24) );
  XOR2X1 U29 ( .A(n27), .B(n28), .Z(DIFF[6]) );
  XOR2X1 U30 ( .A(A[6]), .B(n9), .Z(n28) );
  NAND2X1 U31 ( .A(n29), .B(n30), .Z(n27) );
  NAND2X1 U32 ( .A(n31), .B(n8), .Z(n30) );
  OR2X1 U33 ( .A(n32), .B(A[5]), .Z(n31) );
  NAND2X1 U34 ( .A(A[5]), .B(n32), .Z(n29) );
  XOR2X1 U35 ( .A(n32), .B(n33), .Z(DIFF[5]) );
  XOR2X1 U36 ( .A(A[5]), .B(n8), .Z(n33) );
  NAND2X1 U37 ( .A(n34), .B(n35), .Z(n32) );
  NAND2X1 U38 ( .A(n36), .B(n7), .Z(n35) );
  OR2X1 U39 ( .A(n37), .B(A[4]), .Z(n36) );
  NAND2X1 U40 ( .A(A[4]), .B(n37), .Z(n34) );
  XOR2X1 U41 ( .A(n37), .B(n38), .Z(DIFF[4]) );
  XOR2X1 U42 ( .A(A[4]), .B(n7), .Z(n38) );
  NAND2X1 U43 ( .A(n39), .B(n40), .Z(n37) );
  NAND2X1 U44 ( .A(n41), .B(n6), .Z(n40) );
  OR2X1 U45 ( .A(n42), .B(A[3]), .Z(n41) );
  NAND2X1 U46 ( .A(A[3]), .B(n42), .Z(n39) );
  XOR2X1 U47 ( .A(n42), .B(n43), .Z(DIFF[3]) );
  XOR2X1 U48 ( .A(A[3]), .B(n6), .Z(n43) );
  NAND2X1 U49 ( .A(n44), .B(n45), .Z(n42) );
  NAND2X1 U50 ( .A(n46), .B(n5), .Z(n45) );
  OR2X1 U51 ( .A(n47), .B(A[2]), .Z(n46) );
  NAND2X1 U52 ( .A(A[2]), .B(n47), .Z(n44) );
  XOR2X1 U53 ( .A(n47), .B(n48), .Z(DIFF[2]) );
  XOR2X1 U54 ( .A(A[2]), .B(n5), .Z(n48) );
  NAND2X1 U55 ( .A(n49), .B(n50), .Z(n47) );
  NAND2X1 U56 ( .A(n51), .B(n4), .Z(n50) );
  OR2X1 U57 ( .A(n2), .B(A[1]), .Z(n51) );
  NAND2X1 U58 ( .A(A[1]), .B(n2), .Z(n49) );
  XOR2X1 U59 ( .A(n52), .B(n53), .Z(DIFF[1]) );
  XOR2X1 U60 ( .A(B[1]), .B(A[1]), .Z(n53) );
  NAND2X1 U61 ( .A(n2), .B(n54), .Z(DIFF[0]) );
  NAND2X1 U62 ( .A(A[0]), .B(n3), .Z(n54) );
  NOR2X1 U63 ( .A(n3), .B(A[0]), .Z(n52) );
endmodule


module sobel_DW01_add_1 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43;

  INVX2 U1 ( .A(n12), .Z(n1) );
  INVX2 U2 ( .A(n22), .Z(n2) );
  INVX2 U3 ( .A(n32), .Z(n3) );
  INVX2 U4 ( .A(A[3]), .Z(n4) );
  INVX2 U5 ( .A(A[5]), .Z(n5) );
  INVX2 U6 ( .A(A[7]), .Z(n6) );
  XOR2X1 U7 ( .A(B[9]), .B(n7), .Z(SUM[9]) );
  AND2X1 U8 ( .A(n8), .B(B[8]), .Z(n7) );
  XOR2X1 U9 ( .A(n8), .B(B[8]), .Z(SUM[8]) );
  NAND2X1 U10 ( .A(n9), .B(n10), .Z(n8) );
  NAND2X1 U11 ( .A(B[7]), .B(n11), .Z(n10) );
  NAND2X1 U12 ( .A(n1), .B(n6), .Z(n11) );
  NAND2X1 U13 ( .A(A[7]), .B(n12), .Z(n9) );
  XOR2X1 U14 ( .A(n13), .B(n1), .Z(SUM[7]) );
  NAND2X1 U15 ( .A(n14), .B(n15), .Z(n12) );
  NAND2X1 U16 ( .A(B[6]), .B(n16), .Z(n15) );
  OR2X1 U17 ( .A(n17), .B(A[6]), .Z(n16) );
  NAND2X1 U18 ( .A(A[6]), .B(n17), .Z(n14) );
  XOR2X1 U19 ( .A(n6), .B(B[7]), .Z(n13) );
  XOR2X1 U20 ( .A(n17), .B(n18), .Z(SUM[6]) );
  XOR2X1 U21 ( .A(B[6]), .B(A[6]), .Z(n18) );
  NAND2X1 U22 ( .A(n19), .B(n20), .Z(n17) );
  NAND2X1 U23 ( .A(B[5]), .B(n21), .Z(n20) );
  NAND2X1 U24 ( .A(n2), .B(n5), .Z(n21) );
  NAND2X1 U25 ( .A(A[5]), .B(n22), .Z(n19) );
  XOR2X1 U26 ( .A(n23), .B(n2), .Z(SUM[5]) );
  NAND2X1 U27 ( .A(n24), .B(n25), .Z(n22) );
  NAND2X1 U28 ( .A(B[4]), .B(n26), .Z(n25) );
  OR2X1 U29 ( .A(n27), .B(A[4]), .Z(n26) );
  NAND2X1 U30 ( .A(A[4]), .B(n27), .Z(n24) );
  XOR2X1 U31 ( .A(n5), .B(B[5]), .Z(n23) );
  XOR2X1 U32 ( .A(n27), .B(n28), .Z(SUM[4]) );
  XOR2X1 U33 ( .A(B[4]), .B(A[4]), .Z(n28) );
  NAND2X1 U34 ( .A(n29), .B(n30), .Z(n27) );
  NAND2X1 U35 ( .A(B[3]), .B(n31), .Z(n30) );
  NAND2X1 U36 ( .A(n3), .B(n4), .Z(n31) );
  NAND2X1 U37 ( .A(A[3]), .B(n32), .Z(n29) );
  XOR2X1 U38 ( .A(n33), .B(n3), .Z(SUM[3]) );
  NAND2X1 U39 ( .A(n34), .B(n35), .Z(n32) );
  NAND2X1 U40 ( .A(B[2]), .B(n36), .Z(n35) );
  OR2X1 U41 ( .A(n37), .B(A[2]), .Z(n36) );
  NAND2X1 U42 ( .A(A[2]), .B(n37), .Z(n34) );
  XOR2X1 U43 ( .A(n4), .B(B[3]), .Z(n33) );
  XOR2X1 U44 ( .A(n37), .B(n38), .Z(SUM[2]) );
  XOR2X1 U45 ( .A(B[2]), .B(A[2]), .Z(n38) );
  NAND2X1 U46 ( .A(n39), .B(n40), .Z(n37) );
  NAND2X1 U47 ( .A(B[1]), .B(n41), .Z(n40) );
  OR2X1 U48 ( .A(A[1]), .B(n42), .Z(n41) );
  NAND2X1 U49 ( .A(A[1]), .B(n42), .Z(n39) );
  XOR2X1 U50 ( .A(n42), .B(n43), .Z(SUM[1]) );
  XOR2X1 U51 ( .A(B[1]), .B(A[1]), .Z(n43) );
  AND2X1 U52 ( .A(B[0]), .B(A[0]), .Z(n42) );
  XOR2X1 U53 ( .A(B[0]), .B(A[0]), .Z(SUM[0]) );
endmodule


module sobel_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54;

  INVX2 U1 ( .A(n17), .Z(DIFF[8]) );
  INVX2 U2 ( .A(n52), .Z(n2) );
  INVX2 U3 ( .A(B[0]), .Z(n3) );
  INVX2 U4 ( .A(B[1]), .Z(n4) );
  INVX2 U5 ( .A(B[2]), .Z(n5) );
  INVX2 U6 ( .A(B[3]), .Z(n6) );
  INVX2 U7 ( .A(B[4]), .Z(n7) );
  INVX2 U8 ( .A(B[5]), .Z(n8) );
  INVX2 U9 ( .A(B[6]), .Z(n9) );
  INVX2 U10 ( .A(B[7]), .Z(n10) );
  XOR2X1 U11 ( .A(n11), .B(n12), .Z(DIFF[9]) );
  XOR2X1 U12 ( .A(B[9]), .B(A[9]), .Z(n12) );
  NOR2X1 U13 ( .A(n13), .B(n14), .Z(n11) );
  AND2X1 U14 ( .A(n15), .B(A[8]), .Z(n14) );
  NOR2X1 U15 ( .A(B[8]), .B(n16), .Z(n13) );
  NOR2X1 U16 ( .A(A[8]), .B(n15), .Z(n16) );
  XOR2X1 U17 ( .A(n15), .B(n18), .Z(n17) );
  XOR2X1 U18 ( .A(A[8]), .B(B[8]), .Z(n18) );
  NAND2X1 U19 ( .A(n19), .B(n20), .Z(n15) );
  NAND2X1 U20 ( .A(n21), .B(n10), .Z(n20) );
  OR2X1 U21 ( .A(n22), .B(A[7]), .Z(n21) );
  NAND2X1 U22 ( .A(A[7]), .B(n22), .Z(n19) );
  XOR2X1 U23 ( .A(n22), .B(n23), .Z(DIFF[7]) );
  XOR2X1 U24 ( .A(A[7]), .B(n10), .Z(n23) );
  NAND2X1 U25 ( .A(n24), .B(n25), .Z(n22) );
  NAND2X1 U26 ( .A(n26), .B(n9), .Z(n25) );
  OR2X1 U27 ( .A(n27), .B(A[6]), .Z(n26) );
  NAND2X1 U28 ( .A(A[6]), .B(n27), .Z(n24) );
  XOR2X1 U29 ( .A(n27), .B(n28), .Z(DIFF[6]) );
  XOR2X1 U30 ( .A(A[6]), .B(n9), .Z(n28) );
  NAND2X1 U31 ( .A(n29), .B(n30), .Z(n27) );
  NAND2X1 U32 ( .A(n31), .B(n8), .Z(n30) );
  OR2X1 U33 ( .A(n32), .B(A[5]), .Z(n31) );
  NAND2X1 U34 ( .A(A[5]), .B(n32), .Z(n29) );
  XOR2X1 U35 ( .A(n32), .B(n33), .Z(DIFF[5]) );
  XOR2X1 U36 ( .A(A[5]), .B(n8), .Z(n33) );
  NAND2X1 U37 ( .A(n34), .B(n35), .Z(n32) );
  NAND2X1 U38 ( .A(n36), .B(n7), .Z(n35) );
  OR2X1 U39 ( .A(n37), .B(A[4]), .Z(n36) );
  NAND2X1 U40 ( .A(A[4]), .B(n37), .Z(n34) );
  XOR2X1 U41 ( .A(n37), .B(n38), .Z(DIFF[4]) );
  XOR2X1 U42 ( .A(A[4]), .B(n7), .Z(n38) );
  NAND2X1 U43 ( .A(n39), .B(n40), .Z(n37) );
  NAND2X1 U44 ( .A(n41), .B(n6), .Z(n40) );
  OR2X1 U45 ( .A(n42), .B(A[3]), .Z(n41) );
  NAND2X1 U46 ( .A(A[3]), .B(n42), .Z(n39) );
  XOR2X1 U47 ( .A(n42), .B(n43), .Z(DIFF[3]) );
  XOR2X1 U48 ( .A(A[3]), .B(n6), .Z(n43) );
  NAND2X1 U49 ( .A(n44), .B(n45), .Z(n42) );
  NAND2X1 U50 ( .A(n46), .B(n5), .Z(n45) );
  OR2X1 U51 ( .A(n47), .B(A[2]), .Z(n46) );
  NAND2X1 U52 ( .A(A[2]), .B(n47), .Z(n44) );
  XOR2X1 U53 ( .A(n47), .B(n48), .Z(DIFF[2]) );
  XOR2X1 U54 ( .A(A[2]), .B(n5), .Z(n48) );
  NAND2X1 U55 ( .A(n49), .B(n50), .Z(n47) );
  NAND2X1 U56 ( .A(n51), .B(n4), .Z(n50) );
  OR2X1 U57 ( .A(n2), .B(A[1]), .Z(n51) );
  NAND2X1 U58 ( .A(A[1]), .B(n2), .Z(n49) );
  XOR2X1 U59 ( .A(n52), .B(n53), .Z(DIFF[1]) );
  XOR2X1 U60 ( .A(B[1]), .B(A[1]), .Z(n53) );
  NAND2X1 U61 ( .A(n2), .B(n54), .Z(DIFF[0]) );
  NAND2X1 U62 ( .A(A[0]), .B(n3), .Z(n54) );
  NOR2X1 U63 ( .A(n3), .B(A[0]), .Z(n52) );
endmodule


module sobel_DW01_add_2 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   \A[0] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36;
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  INVX2 U1 ( .A(n15), .Z(n1) );
  INVX2 U2 ( .A(n25), .Z(n2) );
  INVX2 U3 ( .A(A[4]), .Z(n3) );
  INVX2 U4 ( .A(A[6]), .Z(n4) );
  INVX2 U5 ( .A(B[8]), .Z(n5) );
  NOR2X1 U6 ( .A(n6), .B(n5), .Z(SUM[9]) );
  XOR2X1 U7 ( .A(n5), .B(n6), .Z(SUM[8]) );
  AND2X1 U8 ( .A(n7), .B(n8), .Z(n6) );
  NAND2X1 U9 ( .A(B[7]), .B(n9), .Z(n8) );
  OR2X1 U10 ( .A(n10), .B(A[7]), .Z(n9) );
  NAND2X1 U11 ( .A(A[7]), .B(n10), .Z(n7) );
  XOR2X1 U12 ( .A(n10), .B(n11), .Z(SUM[7]) );
  XOR2X1 U13 ( .A(B[7]), .B(A[7]), .Z(n11) );
  NAND2X1 U14 ( .A(n12), .B(n13), .Z(n10) );
  NAND2X1 U15 ( .A(B[6]), .B(n14), .Z(n13) );
  NAND2X1 U16 ( .A(n1), .B(n4), .Z(n14) );
  NAND2X1 U17 ( .A(A[6]), .B(n15), .Z(n12) );
  XOR2X1 U18 ( .A(n16), .B(n1), .Z(SUM[6]) );
  NAND2X1 U19 ( .A(n17), .B(n18), .Z(n15) );
  NAND2X1 U20 ( .A(B[5]), .B(n19), .Z(n18) );
  OR2X1 U21 ( .A(n20), .B(A[5]), .Z(n19) );
  NAND2X1 U22 ( .A(A[5]), .B(n20), .Z(n17) );
  XOR2X1 U23 ( .A(n4), .B(B[6]), .Z(n16) );
  XOR2X1 U24 ( .A(n20), .B(n21), .Z(SUM[5]) );
  XOR2X1 U25 ( .A(B[5]), .B(A[5]), .Z(n21) );
  NAND2X1 U26 ( .A(n22), .B(n23), .Z(n20) );
  NAND2X1 U27 ( .A(B[4]), .B(n24), .Z(n23) );
  NAND2X1 U28 ( .A(n2), .B(n3), .Z(n24) );
  NAND2X1 U29 ( .A(A[4]), .B(n25), .Z(n22) );
  XOR2X1 U30 ( .A(n26), .B(n2), .Z(SUM[4]) );
  NAND2X1 U31 ( .A(n27), .B(n28), .Z(n25) );
  NAND2X1 U32 ( .A(B[3]), .B(n29), .Z(n28) );
  OR2X1 U33 ( .A(n30), .B(A[3]), .Z(n29) );
  NAND2X1 U34 ( .A(A[3]), .B(n30), .Z(n27) );
  XOR2X1 U35 ( .A(n3), .B(B[4]), .Z(n26) );
  XOR2X1 U36 ( .A(n30), .B(n31), .Z(SUM[3]) );
  XOR2X1 U37 ( .A(B[3]), .B(A[3]), .Z(n31) );
  NAND2X1 U38 ( .A(n32), .B(n33), .Z(n30) );
  NAND2X1 U39 ( .A(B[2]), .B(n34), .Z(n33) );
  OR2X1 U40 ( .A(A[2]), .B(n35), .Z(n34) );
  NAND2X1 U41 ( .A(A[2]), .B(n35), .Z(n32) );
  XOR2X1 U42 ( .A(n35), .B(n36), .Z(SUM[2]) );
  XOR2X1 U43 ( .A(B[2]), .B(A[2]), .Z(n36) );
  AND2X1 U44 ( .A(B[1]), .B(A[1]), .Z(n35) );
  XOR2X1 U45 ( .A(B[1]), .B(A[1]), .Z(SUM[1]) );
endmodule


module sobel ( row, col, inputPixels, clk_pix, clk, start, reset, out, done );
  input [8:0] row;
  input [9:0] col;
  input [63:0] inputPixels;
  output [7:0] out;
  input clk_pix, clk, start, reset;
  output done;
  wire   n58, \filter_step[1] , N111, N112, N113, N114, N115, N116, N117, N118,
         N119, N120, N121, N122, N123, N124, N125, N126, N127, N128, N129,
         N130, N226, \U3/U1/Z_0 , \U3/U1/Z_1 , \U3/U1/Z_2 , \U3/U1/Z_3 ,
         \U3/U1/Z_4 , \U3/U1/Z_5 , \U3/U1/Z_6 , \U3/U1/Z_7 , \U3/U1/Z_8 ,
         \U3/U1/Z_9 , \U3/U2/Z_0 , \U3/U2/Z_1 , \U3/U2/Z_2 , \U3/U2/Z_3 ,
         \U3/U2/Z_4 , \U3/U2/Z_5 , \U3/U2/Z_6 , \U3/U2/Z_7 , \U3/U2/Z_8 ,
         \U3/U2/Z_9 , \U3/U3/Z_0 , \U3/U3/Z_1 , \U3/U3/Z_2 , \U3/U3/Z_3 ,
         \U3/U3/Z_4 , \U3/U3/Z_5 , \U3/U3/Z_6 , \U3/U3/Z_7 , \U3/U3/Z_8 ,
         \U3/U3/Z_9 , \U3/U4/Z_0 , \U3/U4/Z_1 , \U3/U4/Z_2 , \U3/U4/Z_3 ,
         \U3/U4/Z_4 , \U3/U4/Z_5 , \U3/U4/Z_6 , \U3/U4/Z_7 , \U3/U4/Z_8 ,
         \U3/U4/Z_9 , \U3/U5/Z_0 , \U3/U5/Z_1 , \U3/U5/Z_2 , \U3/U5/Z_3 ,
         \U3/U5/Z_4 , \U3/U5/Z_5 , \U3/U5/Z_6 , \U3/U5/Z_7 , \U3/U6/Z_1 ,
         \U3/U6/Z_2 , \U3/U6/Z_3 , \U3/U6/Z_4 , \U3/U6/Z_5 , \U3/U6/Z_6 ,
         \U3/U6/Z_7 , \U3/U6/Z_8 , \U3/U7/Z_0 , \U3/U7/Z_1 , \U3/U7/Z_2 ,
         \U3/U7/Z_3 , \U3/U7/Z_4 , \U3/U7/Z_5 , \U3/U7/Z_6 , \U3/U7/Z_7 , n121,
         n126, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n123,
         n124, n125, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323;
  wire   [9:0] gx1;
  wire   [9:0] gx2;
  wire   [9:0] gy1;
  wire   [9:0] gy2;
  wire   [9:0] gx;
  wire   [9:0] gy;
  wire   [10:7] g_mag;
  tri   [8:0] row;
  tri   [9:0] col;
  tri   [63:0] inputPixels;
  tri   clk_pix;
  tri   clk;
  tri   start;
  tri   reset;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6;

  DFFQBX1 busy_reg ( .D(n504), .CLK(clk), .QB(done) );
  DFFQBX1 setup_reg ( .D(n503), .CLK(clk), .QB(n126) );
  DFFQX1 \filter_step_reg[1]  ( .D(n501), .CLK(clk), .Q(\filter_step[1] ) );
  DFFQBX1 \filter_step_reg[0]  ( .D(n502), .CLK(clk), .QB(n121) );
  DFFQX1 \gx1_reg[0]  ( .D(n500), .CLK(clk), .Q(gx1[0]) );
  DFFQX1 \gx2_reg[0]  ( .D(n490), .CLK(clk), .Q(gx2[0]) );
  DFFQX1 \gy2_reg[0]  ( .D(n480), .CLK(clk), .Q(gy2[0]) );
  DFFQX1 \gx1_reg[1]  ( .D(n499), .CLK(clk), .Q(gx1[1]) );
  DFFQX1 \gx2_reg[1]  ( .D(n489), .CLK(clk), .Q(gx2[1]) );
  DFFQX1 \gy2_reg[1]  ( .D(n479), .CLK(clk), .Q(gy2[1]) );
  DFFQX1 \gx1_reg[2]  ( .D(n498), .CLK(clk), .Q(gx1[2]) );
  DFFQX1 \gx2_reg[2]  ( .D(n488), .CLK(clk), .Q(gx2[2]) );
  DFFQX1 \gy2_reg[2]  ( .D(n478), .CLK(clk), .Q(gy2[2]) );
  DFFQX1 \gx1_reg[3]  ( .D(n497), .CLK(clk), .Q(gx1[3]) );
  DFFQX1 \gx2_reg[3]  ( .D(n487), .CLK(clk), .Q(gx2[3]) );
  DFFQX1 \gy2_reg[3]  ( .D(n477), .CLK(clk), .Q(gy2[3]) );
  DFFQX1 \gx1_reg[4]  ( .D(n496), .CLK(clk), .Q(gx1[4]) );
  DFFQX1 \gx2_reg[4]  ( .D(n486), .CLK(clk), .Q(gx2[4]) );
  DFFQX1 \gy2_reg[4]  ( .D(n476), .CLK(clk), .Q(gy2[4]) );
  DFFQX1 \gx1_reg[5]  ( .D(n495), .CLK(clk), .Q(gx1[5]) );
  DFFQX1 \gx2_reg[5]  ( .D(n485), .CLK(clk), .Q(gx2[5]) );
  DFFQX1 \gy2_reg[5]  ( .D(n475), .CLK(clk), .Q(gy2[5]) );
  DFFQX1 \gx1_reg[6]  ( .D(n494), .CLK(clk), .Q(gx1[6]) );
  DFFQX1 \gx2_reg[6]  ( .D(n484), .CLK(clk), .Q(gx2[6]) );
  DFFQX1 \gy2_reg[6]  ( .D(n474), .CLK(clk), .Q(gy2[6]) );
  DFFQX1 \gx1_reg[7]  ( .D(n493), .CLK(clk), .Q(gx1[7]) );
  DFFQX1 \gx2_reg[7]  ( .D(n483), .CLK(clk), .Q(gx2[7]) );
  DFFQX1 \gy2_reg[7]  ( .D(n473), .CLK(clk), .Q(gy2[7]) );
  DFFQX1 \gx1_reg[8]  ( .D(n492), .CLK(clk), .Q(gx1[8]) );
  DFFQX1 \gx2_reg[8]  ( .D(n482), .CLK(clk), .Q(gx2[8]) );
  DFFQX1 \gy2_reg[8]  ( .D(n472), .CLK(clk), .Q(gy2[8]) );
  DFFQX1 \gx1_reg[9]  ( .D(n491), .CLK(clk), .Q(gx1[9]) );
  DFFQX1 \gx2_reg[9]  ( .D(n481), .CLK(clk), .Q(gx2[9]) );
  DFFQX1 \gy2_reg[9]  ( .D(n471), .CLK(clk), .Q(gy2[9]) );
  DFFQX1 \gy1_reg[9]  ( .D(n470), .CLK(clk), .Q(gy1[9]) );
  DFFQX1 \gy1_reg[8]  ( .D(n469), .CLK(clk), .Q(gy1[8]) );
  DFFQX1 \gy1_reg[7]  ( .D(n468), .CLK(clk), .Q(gy1[7]) );
  DFFQX1 \gy1_reg[6]  ( .D(n467), .CLK(clk), .Q(gy1[6]) );
  DFFQX1 \gy1_reg[5]  ( .D(n466), .CLK(clk), .Q(gy1[5]) );
  DFFQX1 \gy1_reg[4]  ( .D(n465), .CLK(clk), .Q(gy1[4]) );
  DFFQX1 \gy1_reg[3]  ( .D(n464), .CLK(clk), .Q(gy1[3]) );
  DFFQX1 \gy1_reg[2]  ( .D(n463), .CLK(clk), .Q(gy1[2]) );
  DFFQX1 \gy1_reg[1]  ( .D(n462), .CLK(clk), .Q(gy1[1]) );
  DFFQX1 \gy1_reg[0]  ( .D(n461), .CLK(clk), .Q(gy1[0]) );
  DFFQX1 \out_reg[7]  ( .D(N226), .CLK(clk_pix), .Q(out[7]) );
  DFFQX1 \out_reg[6]  ( .D(N226), .CLK(clk_pix), .Q(out[6]) );
  DFFQX1 \out_reg[5]  ( .D(N226), .CLK(clk_pix), .Q(out[5]) );
  DFFQX1 \out_reg[4]  ( .D(N226), .CLK(clk_pix), .Q(out[4]) );
  DFFQX1 \out_reg[3]  ( .D(N226), .CLK(clk_pix), .Q(out[3]) );
  DFFQX1 \out_reg[2]  ( .D(N226), .CLK(clk_pix), .Q(out[2]) );
  DFFQX1 \out_reg[1]  ( .D(N226), .CLK(clk_pix), .Q(out[1]) );
  DFFQX1 \out_reg[0]  ( .D(N226), .CLK(clk_pix), .Q(out[0]) );
  sobel_DW01_add_0 add_71 ( .A({n58, gy}), .B({n58, gx}), .CI(n58), .SUM({
        g_mag, SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6}) );
  sobel_DW01_sub_0 r465 ( .A({\U3/U3/Z_9 , \U3/U3/Z_8 , \U3/U3/Z_7 , 
        \U3/U3/Z_6 , \U3/U3/Z_5 , \U3/U3/Z_4 , \U3/U3/Z_3 , \U3/U3/Z_2 , 
        \U3/U3/Z_1 , \U3/U3/Z_0 }), .B({\U3/U4/Z_9 , \U3/U4/Z_8 , \U3/U4/Z_7 , 
        \U3/U4/Z_6 , \U3/U4/Z_5 , \U3/U4/Z_4 , \U3/U4/Z_3 , \U3/U4/Z_2 , 
        \U3/U4/Z_1 , \U3/U4/Z_0 }), .CI(n58), .DIFF(gy) );
  sobel_DW01_add_1 r459 ( .A({n58, n58, \U3/U7/Z_7 , \U3/U7/Z_6 , \U3/U7/Z_5 , 
        \U3/U7/Z_4 , \U3/U7/Z_3 , \U3/U7/Z_2 , \U3/U7/Z_1 , \U3/U7/Z_0 }), .B(
        {N120, N119, N118, N117, N116, N115, N114, N113, N112, N111}), .CI(n58), .SUM({N130, N129, N128, N127, N126, N125, N124, N123, N122, N121}) );
  sobel_DW01_sub_1 r51 ( .A({\U3/U1/Z_9 , \U3/U1/Z_8 , \U3/U1/Z_7 , 
        \U3/U1/Z_6 , \U3/U1/Z_5 , \U3/U1/Z_4 , \U3/U1/Z_3 , \U3/U1/Z_2 , 
        \U3/U1/Z_1 , \U3/U1/Z_0 }), .B({\U3/U2/Z_9 , \U3/U2/Z_8 , \U3/U2/Z_7 , 
        \U3/U2/Z_6 , \U3/U2/Z_5 , \U3/U2/Z_4 , \U3/U2/Z_3 , \U3/U2/Z_2 , 
        \U3/U2/Z_1 , \U3/U2/Z_0 }), .CI(n58), .DIFF(gx) );
  sobel_DW01_add_2 r50 ( .A({n58, n58, \U3/U5/Z_7 , \U3/U5/Z_6 , \U3/U5/Z_5 , 
        \U3/U5/Z_4 , \U3/U5/Z_3 , \U3/U5/Z_2 , \U3/U5/Z_1 , \U3/U5/Z_0 }), .B(
        {n58, \U3/U6/Z_8 , \U3/U6/Z_7 , \U3/U6/Z_6 , \U3/U6/Z_5 , \U3/U6/Z_4 , 
        \U3/U6/Z_3 , \U3/U6/Z_2 , \U3/U6/Z_1 , n58}), .CI(n58), .SUM({N120, 
        N119, N118, N117, N116, N115, N114, N113, N112, N111}) );
  TIE0 U3 ( .Z(n58) );
  NAND2X1 U4 ( .A(n1), .B(n2), .Z(n504) );
  NAND3X1 U5 ( .A(n3), .B(n4), .C(n5), .Z(n2) );
  NAND2X1 U6 ( .A(n6), .B(n7), .Z(n4) );
  OR2X1 U7 ( .A(n8), .B(reset), .Z(n1) );
  MUX2X1 U8 ( .A(n9), .B(n10), .S(n8), .Z(n503) );
  NOR2X1 U9 ( .A(n126), .B(n11), .Z(n10) );
  NOR2X1 U10 ( .A(clk_pix), .B(n12), .Z(n11) );
  INVX1 U11 ( .A(done), .Z(n12) );
  MUX2X1 U12 ( .A(n13), .B(n14), .S(n15), .Z(n502) );
  NOR2X1 U13 ( .A(n6), .B(n16), .Z(n13) );
  MUX2X1 U14 ( .A(n17), .B(\filter_step[1] ), .S(n15), .Z(n501) );
  AND2X1 U15 ( .A(n8), .B(n18), .Z(n15) );
  NAND2X1 U16 ( .A(n5), .B(n3), .Z(n18) );
  NAND2X1 U17 ( .A(n16), .B(n19), .Z(n8) );
  NAND2X1 U18 ( .A(n20), .B(n9), .Z(n19) );
  INVX1 U19 ( .A(reset), .Z(n9) );
  NAND3X1 U20 ( .A(n126), .B(clk_pix), .C(start), .Z(n20) );
  NOR2X1 U21 ( .A(n21), .B(n16), .Z(n17) );
  INVX1 U22 ( .A(n5), .Z(n16) );
  NOR2X1 U23 ( .A(n22), .B(n23), .Z(n21) );
  NAND2X1 U24 ( .A(n24), .B(n25), .Z(n500) );
  NAND2X1 U25 ( .A(N121), .B(n26), .Z(n25) );
  NAND2X1 U26 ( .A(gx1[0]), .B(n27), .Z(n24) );
  NAND2X1 U27 ( .A(n28), .B(n29), .Z(n499) );
  NAND2X1 U28 ( .A(N122), .B(n26), .Z(n29) );
  NAND2X1 U29 ( .A(gx1[1]), .B(n27), .Z(n28) );
  NAND2X1 U30 ( .A(n30), .B(n31), .Z(n498) );
  NAND2X1 U31 ( .A(N123), .B(n26), .Z(n31) );
  NAND2X1 U32 ( .A(gx1[2]), .B(n27), .Z(n30) );
  NAND2X1 U33 ( .A(n32), .B(n33), .Z(n497) );
  NAND2X1 U34 ( .A(N124), .B(n26), .Z(n33) );
  NAND2X1 U35 ( .A(gx1[3]), .B(n27), .Z(n32) );
  NAND2X1 U36 ( .A(n34), .B(n35), .Z(n496) );
  NAND2X1 U37 ( .A(N125), .B(n26), .Z(n35) );
  NAND2X1 U38 ( .A(gx1[4]), .B(n27), .Z(n34) );
  NAND2X1 U39 ( .A(n36), .B(n37), .Z(n495) );
  NAND2X1 U40 ( .A(N126), .B(n26), .Z(n37) );
  NAND2X1 U41 ( .A(gx1[5]), .B(n27), .Z(n36) );
  NAND2X1 U42 ( .A(n38), .B(n39), .Z(n494) );
  NAND2X1 U43 ( .A(N127), .B(n26), .Z(n39) );
  NAND2X1 U44 ( .A(gx1[6]), .B(n27), .Z(n38) );
  NAND2X1 U45 ( .A(n40), .B(n41), .Z(n493) );
  NAND2X1 U46 ( .A(N128), .B(n26), .Z(n41) );
  NAND2X1 U47 ( .A(gx1[7]), .B(n27), .Z(n40) );
  NAND2X1 U48 ( .A(n42), .B(n43), .Z(n492) );
  NAND2X1 U49 ( .A(N129), .B(n26), .Z(n43) );
  NAND2X1 U50 ( .A(gx1[8]), .B(n27), .Z(n42) );
  NAND2X1 U51 ( .A(n44), .B(n45), .Z(n491) );
  NAND2X1 U52 ( .A(N130), .B(n26), .Z(n45) );
  NOR2X1 U53 ( .A(n27), .B(n46), .Z(n26) );
  NAND2X1 U54 ( .A(gx1[9]), .B(n27), .Z(n44) );
  NAND2X1 U55 ( .A(n5), .B(n47), .Z(n27) );
  OR2X1 U56 ( .A(n46), .B(n48), .Z(n47) );
  NAND2X1 U57 ( .A(n49), .B(n50), .Z(n490) );
  NAND2X1 U58 ( .A(n51), .B(N121), .Z(n50) );
  NAND2X1 U59 ( .A(gx2[0]), .B(n52), .Z(n49) );
  NAND2X1 U60 ( .A(n53), .B(n54), .Z(n489) );
  NAND2X1 U61 ( .A(n51), .B(N122), .Z(n54) );
  NAND2X1 U62 ( .A(gx2[1]), .B(n52), .Z(n53) );
  NAND2X1 U63 ( .A(n55), .B(n56), .Z(n488) );
  NAND2X1 U64 ( .A(n51), .B(N123), .Z(n56) );
  NAND2X1 U65 ( .A(gx2[2]), .B(n52), .Z(n55) );
  NAND2X1 U66 ( .A(n57), .B(n59), .Z(n487) );
  NAND2X1 U67 ( .A(n51), .B(N124), .Z(n59) );
  NAND2X1 U68 ( .A(gx2[3]), .B(n52), .Z(n57) );
  NAND2X1 U69 ( .A(n60), .B(n61), .Z(n486) );
  NAND2X1 U70 ( .A(n51), .B(N125), .Z(n61) );
  NAND2X1 U71 ( .A(gx2[4]), .B(n52), .Z(n60) );
  NAND2X1 U72 ( .A(n62), .B(n63), .Z(n485) );
  NAND2X1 U73 ( .A(n51), .B(N126), .Z(n63) );
  NAND2X1 U74 ( .A(gx2[5]), .B(n52), .Z(n62) );
  NAND2X1 U75 ( .A(n64), .B(n65), .Z(n484) );
  NAND2X1 U76 ( .A(n51), .B(N127), .Z(n65) );
  NAND2X1 U77 ( .A(gx2[6]), .B(n52), .Z(n64) );
  NAND2X1 U78 ( .A(n66), .B(n67), .Z(n483) );
  NAND2X1 U79 ( .A(n51), .B(N128), .Z(n67) );
  NAND2X1 U80 ( .A(gx2[7]), .B(n52), .Z(n66) );
  NAND2X1 U81 ( .A(n68), .B(n69), .Z(n482) );
  NAND2X1 U82 ( .A(n51), .B(N129), .Z(n69) );
  NAND2X1 U83 ( .A(gx2[8]), .B(n52), .Z(n68) );
  NAND2X1 U84 ( .A(n70), .B(n71), .Z(n481) );
  NAND2X1 U85 ( .A(n51), .B(N130), .Z(n71) );
  NOR2X1 U86 ( .A(n52), .B(n46), .Z(n51) );
  NAND2X1 U87 ( .A(gx2[9]), .B(n52), .Z(n70) );
  NAND2X1 U88 ( .A(n5), .B(n72), .Z(n52) );
  NAND2X1 U89 ( .A(n3), .B(n7), .Z(n72) );
  NAND2X1 U90 ( .A(n73), .B(n74), .Z(n480) );
  NAND2X1 U91 ( .A(n75), .B(N121), .Z(n74) );
  NAND2X1 U92 ( .A(gy2[0]), .B(n76), .Z(n73) );
  NAND2X1 U93 ( .A(n77), .B(n78), .Z(n479) );
  NAND2X1 U94 ( .A(n75), .B(N122), .Z(n78) );
  NAND2X1 U95 ( .A(gy2[1]), .B(n76), .Z(n77) );
  NAND2X1 U96 ( .A(n79), .B(n80), .Z(n478) );
  NAND2X1 U97 ( .A(n75), .B(N123), .Z(n80) );
  NAND2X1 U98 ( .A(gy2[2]), .B(n76), .Z(n79) );
  NAND2X1 U99 ( .A(n81), .B(n82), .Z(n477) );
  NAND2X1 U100 ( .A(n75), .B(N124), .Z(n82) );
  NAND2X1 U101 ( .A(gy2[3]), .B(n76), .Z(n81) );
  NAND2X1 U102 ( .A(n83), .B(n84), .Z(n476) );
  NAND2X1 U103 ( .A(n75), .B(N125), .Z(n84) );
  NAND2X1 U104 ( .A(gy2[4]), .B(n76), .Z(n83) );
  NAND2X1 U105 ( .A(n85), .B(n86), .Z(n475) );
  NAND2X1 U106 ( .A(n75), .B(N126), .Z(n86) );
  NAND2X1 U107 ( .A(gy2[5]), .B(n76), .Z(n85) );
  NAND2X1 U108 ( .A(n87), .B(n88), .Z(n474) );
  NAND2X1 U109 ( .A(n75), .B(N127), .Z(n88) );
  NAND2X1 U110 ( .A(gy2[6]), .B(n76), .Z(n87) );
  NAND2X1 U111 ( .A(n89), .B(n90), .Z(n473) );
  NAND2X1 U112 ( .A(n75), .B(N128), .Z(n90) );
  NAND2X1 U113 ( .A(gy2[7]), .B(n76), .Z(n89) );
  NAND2X1 U114 ( .A(n91), .B(n92), .Z(n472) );
  NAND2X1 U115 ( .A(n75), .B(N129), .Z(n92) );
  NAND2X1 U116 ( .A(gy2[8]), .B(n76), .Z(n91) );
  NAND2X1 U117 ( .A(n93), .B(n94), .Z(n471) );
  NAND2X1 U118 ( .A(n75), .B(N130), .Z(n94) );
  NOR2X1 U119 ( .A(n76), .B(n46), .Z(n75) );
  NAND2X1 U120 ( .A(gy2[9]), .B(n76), .Z(n93) );
  NAND2X1 U121 ( .A(n5), .B(n95), .Z(n76) );
  NAND2X1 U122 ( .A(n3), .B(n96), .Z(n95) );
  INVX1 U123 ( .A(n46), .Z(n3) );
  NAND2X1 U124 ( .A(n97), .B(n98), .Z(n470) );
  NAND2X1 U125 ( .A(n99), .B(N130), .Z(n98) );
  NAND2X1 U126 ( .A(gy1[9]), .B(n100), .Z(n97) );
  NAND2X1 U127 ( .A(n101), .B(n102), .Z(n469) );
  NAND2X1 U128 ( .A(n99), .B(N129), .Z(n102) );
  NAND2X1 U129 ( .A(gy1[8]), .B(n100), .Z(n101) );
  NAND2X1 U130 ( .A(n103), .B(n104), .Z(n468) );
  NAND2X1 U131 ( .A(n99), .B(N128), .Z(n104) );
  NAND2X1 U132 ( .A(gy1[7]), .B(n100), .Z(n103) );
  NAND2X1 U133 ( .A(n105), .B(n106), .Z(n467) );
  NAND2X1 U134 ( .A(n99), .B(N127), .Z(n106) );
  NAND2X1 U135 ( .A(gy1[6]), .B(n100), .Z(n105) );
  NAND2X1 U136 ( .A(n107), .B(n108), .Z(n466) );
  NAND2X1 U137 ( .A(n99), .B(N126), .Z(n108) );
  NAND2X1 U138 ( .A(gy1[5]), .B(n100), .Z(n107) );
  NAND2X1 U139 ( .A(n109), .B(n110), .Z(n465) );
  NAND2X1 U140 ( .A(n99), .B(N125), .Z(n110) );
  NAND2X1 U141 ( .A(gy1[4]), .B(n100), .Z(n109) );
  NAND2X1 U142 ( .A(n111), .B(n112), .Z(n464) );
  NAND2X1 U143 ( .A(n99), .B(N124), .Z(n112) );
  NAND2X1 U144 ( .A(gy1[3]), .B(n100), .Z(n111) );
  NAND2X1 U145 ( .A(n113), .B(n114), .Z(n463) );
  NAND2X1 U146 ( .A(n99), .B(N123), .Z(n114) );
  NAND2X1 U147 ( .A(gy1[2]), .B(n100), .Z(n113) );
  NAND2X1 U148 ( .A(n115), .B(n116), .Z(n462) );
  NAND2X1 U149 ( .A(n99), .B(N122), .Z(n116) );
  NAND2X1 U150 ( .A(gy1[1]), .B(n100), .Z(n115) );
  NAND2X1 U151 ( .A(n117), .B(n118), .Z(n461) );
  NAND2X1 U152 ( .A(n99), .B(N121), .Z(n118) );
  NOR2X1 U153 ( .A(n100), .B(n46), .Z(n99) );
  NAND2X1 U154 ( .A(gy1[0]), .B(n100), .Z(n117) );
  NAND2X1 U155 ( .A(n5), .B(n119), .Z(n100) );
  OR2X1 U156 ( .A(n46), .B(n23), .Z(n119) );
  NAND2X1 U157 ( .A(n120), .B(n123), .Z(n46) );
  NAND2X1 U158 ( .A(n124), .B(n125), .Z(n123) );
  MUX2X1 U159 ( .A(n127), .B(n128), .S(col[0]), .Z(n125) );
  NOR2X1 U160 ( .A(n129), .B(n130), .Z(n128) );
  NAND3X1 U161 ( .A(col[6]), .B(col[5]), .C(col[9]), .Z(n130) );
  NAND3X1 U162 ( .A(col[4]), .B(col[3]), .C(n131), .Z(n129) );
  NOR2X1 U163 ( .A(n132), .B(n133), .Z(n131) );
  NOR2X1 U164 ( .A(n134), .B(n135), .Z(n127) );
  NAND3X1 U165 ( .A(n133), .B(n136), .C(n132), .Z(n135) );
  INVX1 U166 ( .A(col[1]), .Z(n132) );
  INVX1 U167 ( .A(col[3]), .Z(n136) );
  INVX1 U168 ( .A(col[2]), .Z(n133) );
  NAND3X1 U169 ( .A(n137), .B(n138), .C(n139), .Z(n134) );
  NOR2X1 U170 ( .A(col[9]), .B(col[6]), .Z(n139) );
  INVX1 U171 ( .A(col[5]), .Z(n138) );
  INVX1 U172 ( .A(col[4]), .Z(n137) );
  NOR2X1 U173 ( .A(col[8]), .B(col[7]), .Z(n124) );
  OR2X1 U174 ( .A(row[5]), .B(n140), .Z(n120) );
  MUX2X1 U175 ( .A(n141), .B(n142), .S(row[0]), .Z(n140) );
  OR2X1 U176 ( .A(n143), .B(n144), .Z(n142) );
  NAND3X1 U177 ( .A(row[7]), .B(row[6]), .C(row[8]), .Z(n144) );
  NAND3X1 U178 ( .A(row[4]), .B(row[3]), .C(n145), .Z(n143) );
  NOR2X1 U179 ( .A(n146), .B(n147), .Z(n145) );
  OR2X1 U180 ( .A(n148), .B(n149), .Z(n141) );
  NAND3X1 U181 ( .A(n147), .B(n150), .C(n146), .Z(n149) );
  INVX1 U182 ( .A(row[1]), .Z(n146) );
  INVX1 U183 ( .A(row[3]), .Z(n150) );
  INVX1 U184 ( .A(row[2]), .Z(n147) );
  NAND3X1 U185 ( .A(n151), .B(n152), .C(n153), .Z(n148) );
  NOR2X1 U186 ( .A(row[8]), .B(row[7]), .Z(n153) );
  INVX1 U187 ( .A(row[6]), .Z(n152) );
  INVX1 U188 ( .A(row[4]), .Z(n151) );
  NOR2X1 U189 ( .A(reset), .B(done), .Z(n5) );
  NAND3X1 U190 ( .A(n154), .B(n155), .C(n156), .Z(\U3/U7/Z_7 ) );
  NAND2X1 U191 ( .A(inputPixels[23]), .B(n23), .Z(n156) );
  NAND2X1 U192 ( .A(inputPixels[63]), .B(n157), .Z(n155) );
  NAND2X1 U193 ( .A(inputPixels[31]), .B(n48), .Z(n154) );
  NAND3X1 U194 ( .A(n158), .B(n159), .C(n160), .Z(\U3/U7/Z_6 ) );
  NAND2X1 U195 ( .A(inputPixels[22]), .B(n23), .Z(n160) );
  NAND2X1 U196 ( .A(inputPixels[62]), .B(n157), .Z(n159) );
  NAND2X1 U197 ( .A(inputPixels[30]), .B(n48), .Z(n158) );
  NAND3X1 U198 ( .A(n161), .B(n162), .C(n163), .Z(\U3/U7/Z_5 ) );
  NAND2X1 U199 ( .A(inputPixels[21]), .B(n23), .Z(n163) );
  NAND2X1 U200 ( .A(inputPixels[61]), .B(n157), .Z(n162) );
  NAND2X1 U201 ( .A(inputPixels[29]), .B(n48), .Z(n161) );
  NAND3X1 U202 ( .A(n164), .B(n165), .C(n166), .Z(\U3/U7/Z_4 ) );
  NAND2X1 U203 ( .A(inputPixels[20]), .B(n23), .Z(n166) );
  NAND2X1 U204 ( .A(inputPixels[60]), .B(n157), .Z(n165) );
  NAND2X1 U205 ( .A(inputPixels[28]), .B(n48), .Z(n164) );
  NAND3X1 U206 ( .A(n167), .B(n168), .C(n169), .Z(\U3/U7/Z_3 ) );
  NAND2X1 U207 ( .A(inputPixels[19]), .B(n23), .Z(n169) );
  NAND2X1 U208 ( .A(inputPixels[59]), .B(n157), .Z(n168) );
  NAND2X1 U209 ( .A(inputPixels[27]), .B(n48), .Z(n167) );
  NAND3X1 U210 ( .A(n170), .B(n171), .C(n172), .Z(\U3/U7/Z_2 ) );
  NAND2X1 U211 ( .A(inputPixels[18]), .B(n23), .Z(n172) );
  NAND2X1 U212 ( .A(inputPixels[58]), .B(n157), .Z(n171) );
  NAND2X1 U213 ( .A(inputPixels[26]), .B(n48), .Z(n170) );
  NAND3X1 U214 ( .A(n173), .B(n174), .C(n175), .Z(\U3/U7/Z_1 ) );
  NAND2X1 U215 ( .A(inputPixels[17]), .B(n23), .Z(n175) );
  NAND2X1 U216 ( .A(inputPixels[57]), .B(n157), .Z(n174) );
  NAND2X1 U217 ( .A(inputPixels[25]), .B(n48), .Z(n173) );
  NAND3X1 U218 ( .A(n176), .B(n177), .C(n178), .Z(\U3/U7/Z_0 ) );
  NAND2X1 U219 ( .A(inputPixels[16]), .B(n23), .Z(n178) );
  NAND2X1 U220 ( .A(inputPixels[56]), .B(n157), .Z(n177) );
  NAND2X1 U221 ( .A(n96), .B(n7), .Z(n157) );
  INVX1 U222 ( .A(n22), .Z(n7) );
  INVX1 U223 ( .A(n179), .Z(n96) );
  NAND2X1 U224 ( .A(inputPixels[24]), .B(n48), .Z(n176) );
  NAND3X1 U225 ( .A(n180), .B(n181), .C(n182), .Z(\U3/U6/Z_8 ) );
  AND2X1 U226 ( .A(n183), .B(n184), .Z(n182) );
  NAND2X1 U227 ( .A(inputPixels[39]), .B(n22), .Z(n184) );
  NAND2X1 U228 ( .A(inputPixels[47]), .B(n48), .Z(n183) );
  NAND2X1 U229 ( .A(inputPixels[15]), .B(n23), .Z(n181) );
  NAND2X1 U230 ( .A(inputPixels[55]), .B(n179), .Z(n180) );
  NAND3X1 U231 ( .A(n185), .B(n186), .C(n187), .Z(\U3/U6/Z_7 ) );
  AND2X1 U232 ( .A(n188), .B(n189), .Z(n187) );
  NAND2X1 U233 ( .A(inputPixels[38]), .B(n22), .Z(n189) );
  NAND2X1 U234 ( .A(inputPixels[46]), .B(n48), .Z(n188) );
  NAND2X1 U235 ( .A(inputPixels[14]), .B(n23), .Z(n186) );
  NAND2X1 U236 ( .A(inputPixels[54]), .B(n179), .Z(n185) );
  NAND3X1 U237 ( .A(n190), .B(n191), .C(n192), .Z(\U3/U6/Z_6 ) );
  AND2X1 U238 ( .A(n193), .B(n194), .Z(n192) );
  NAND2X1 U239 ( .A(inputPixels[37]), .B(n22), .Z(n194) );
  NAND2X1 U240 ( .A(inputPixels[45]), .B(n48), .Z(n193) );
  NAND2X1 U241 ( .A(inputPixels[13]), .B(n23), .Z(n191) );
  NAND2X1 U242 ( .A(inputPixels[53]), .B(n179), .Z(n190) );
  NAND3X1 U243 ( .A(n195), .B(n196), .C(n197), .Z(\U3/U6/Z_5 ) );
  AND2X1 U244 ( .A(n198), .B(n199), .Z(n197) );
  NAND2X1 U245 ( .A(inputPixels[36]), .B(n22), .Z(n199) );
  NAND2X1 U246 ( .A(inputPixels[44]), .B(n48), .Z(n198) );
  NAND2X1 U247 ( .A(inputPixels[12]), .B(n23), .Z(n196) );
  NAND2X1 U248 ( .A(inputPixels[52]), .B(n179), .Z(n195) );
  NAND3X1 U249 ( .A(n200), .B(n201), .C(n202), .Z(\U3/U6/Z_4 ) );
  AND2X1 U250 ( .A(n203), .B(n204), .Z(n202) );
  NAND2X1 U251 ( .A(inputPixels[35]), .B(n22), .Z(n204) );
  NAND2X1 U252 ( .A(inputPixels[43]), .B(n48), .Z(n203) );
  NAND2X1 U253 ( .A(inputPixels[11]), .B(n23), .Z(n201) );
  NAND2X1 U254 ( .A(inputPixels[51]), .B(n179), .Z(n200) );
  NAND3X1 U255 ( .A(n205), .B(n206), .C(n207), .Z(\U3/U6/Z_3 ) );
  AND2X1 U256 ( .A(n208), .B(n209), .Z(n207) );
  NAND2X1 U257 ( .A(inputPixels[34]), .B(n22), .Z(n209) );
  NAND2X1 U258 ( .A(inputPixels[42]), .B(n48), .Z(n208) );
  NAND2X1 U259 ( .A(inputPixels[10]), .B(n23), .Z(n206) );
  NAND2X1 U260 ( .A(inputPixels[50]), .B(n179), .Z(n205) );
  NAND3X1 U261 ( .A(n210), .B(n211), .C(n212), .Z(\U3/U6/Z_2 ) );
  AND2X1 U262 ( .A(n213), .B(n214), .Z(n212) );
  NAND2X1 U263 ( .A(inputPixels[33]), .B(n22), .Z(n214) );
  NAND2X1 U264 ( .A(inputPixels[41]), .B(n48), .Z(n213) );
  NAND2X1 U265 ( .A(inputPixels[9]), .B(n23), .Z(n211) );
  NAND2X1 U266 ( .A(inputPixels[49]), .B(n179), .Z(n210) );
  NAND3X1 U267 ( .A(n215), .B(n216), .C(n217), .Z(\U3/U6/Z_1 ) );
  AND2X1 U268 ( .A(n218), .B(n219), .Z(n217) );
  NAND2X1 U269 ( .A(inputPixels[32]), .B(n22), .Z(n219) );
  NAND2X1 U270 ( .A(inputPixels[40]), .B(n48), .Z(n218) );
  NAND2X1 U271 ( .A(inputPixels[8]), .B(n23), .Z(n216) );
  NAND2X1 U272 ( .A(inputPixels[48]), .B(n179), .Z(n215) );
  NAND3X1 U273 ( .A(n220), .B(n221), .C(n222), .Z(\U3/U5/Z_7 ) );
  NAND2X1 U274 ( .A(n179), .B(inputPixels[47]), .Z(n222) );
  NAND2X1 U275 ( .A(n22), .B(inputPixels[23]), .Z(n221) );
  NAND2X1 U276 ( .A(inputPixels[7]), .B(n223), .Z(n220) );
  NAND3X1 U277 ( .A(n224), .B(n225), .C(n226), .Z(\U3/U5/Z_6 ) );
  NAND2X1 U278 ( .A(inputPixels[46]), .B(n179), .Z(n226) );
  NAND2X1 U279 ( .A(n22), .B(inputPixels[22]), .Z(n225) );
  NAND2X1 U280 ( .A(inputPixels[6]), .B(n223), .Z(n224) );
  NAND3X1 U281 ( .A(n227), .B(n228), .C(n229), .Z(\U3/U5/Z_5 ) );
  NAND2X1 U282 ( .A(inputPixels[45]), .B(n179), .Z(n229) );
  NAND2X1 U283 ( .A(n22), .B(inputPixels[21]), .Z(n228) );
  NAND2X1 U284 ( .A(inputPixels[5]), .B(n223), .Z(n227) );
  NAND3X1 U285 ( .A(n230), .B(n231), .C(n232), .Z(\U3/U5/Z_4 ) );
  NAND2X1 U286 ( .A(inputPixels[44]), .B(n179), .Z(n232) );
  NAND2X1 U287 ( .A(n22), .B(inputPixels[20]), .Z(n231) );
  NAND2X1 U288 ( .A(inputPixels[4]), .B(n223), .Z(n230) );
  NAND3X1 U289 ( .A(n233), .B(n234), .C(n235), .Z(\U3/U5/Z_3 ) );
  NAND2X1 U290 ( .A(inputPixels[43]), .B(n179), .Z(n235) );
  NAND2X1 U291 ( .A(n22), .B(inputPixels[19]), .Z(n234) );
  NAND2X1 U292 ( .A(inputPixels[3]), .B(n223), .Z(n233) );
  NAND3X1 U293 ( .A(n236), .B(n237), .C(n238), .Z(\U3/U5/Z_2 ) );
  NAND2X1 U294 ( .A(inputPixels[42]), .B(n179), .Z(n238) );
  NAND2X1 U295 ( .A(n22), .B(inputPixels[18]), .Z(n237) );
  NAND2X1 U296 ( .A(inputPixels[2]), .B(n223), .Z(n236) );
  NAND3X1 U297 ( .A(n239), .B(n240), .C(n241), .Z(\U3/U5/Z_1 ) );
  NAND2X1 U298 ( .A(inputPixels[41]), .B(n179), .Z(n241) );
  NAND2X1 U299 ( .A(n22), .B(inputPixels[17]), .Z(n240) );
  NAND2X1 U300 ( .A(inputPixels[1]), .B(n223), .Z(n239) );
  NAND3X1 U301 ( .A(n242), .B(n243), .C(n244), .Z(\U3/U5/Z_0 ) );
  NAND2X1 U302 ( .A(inputPixels[40]), .B(n179), .Z(n244) );
  NOR2X1 U303 ( .A(n245), .B(n121), .Z(n179) );
  NAND2X1 U304 ( .A(n22), .B(inputPixels[16]), .Z(n243) );
  NOR2X1 U305 ( .A(\filter_step[1] ), .B(n121), .Z(n22) );
  NAND2X1 U306 ( .A(inputPixels[0]), .B(n223), .Z(n242) );
  INVX1 U307 ( .A(n6), .Z(n223) );
  NOR2X1 U308 ( .A(n23), .B(n48), .Z(n6) );
  NOR2X1 U309 ( .A(n14), .B(\filter_step[1] ), .Z(n48) );
  NOR2X1 U310 ( .A(n245), .B(n14), .Z(n23) );
  INVX1 U311 ( .A(n121), .Z(n14) );
  INVX1 U312 ( .A(\filter_step[1] ), .Z(n245) );
  MUX2X1 U313 ( .A(gy2[9]), .B(gy1[9]), .S(n246), .Z(\U3/U4/Z_9 ) );
  MUX2X1 U314 ( .A(gy2[8]), .B(gy1[8]), .S(n246), .Z(\U3/U4/Z_8 ) );
  MUX2X1 U315 ( .A(gy2[7]), .B(gy1[7]), .S(n246), .Z(\U3/U4/Z_7 ) );
  MUX2X1 U316 ( .A(gy2[6]), .B(gy1[6]), .S(n246), .Z(\U3/U4/Z_6 ) );
  MUX2X1 U317 ( .A(gy2[5]), .B(gy1[5]), .S(n246), .Z(\U3/U4/Z_5 ) );
  MUX2X1 U318 ( .A(gy2[4]), .B(gy1[4]), .S(n246), .Z(\U3/U4/Z_4 ) );
  MUX2X1 U319 ( .A(gy2[3]), .B(gy1[3]), .S(n246), .Z(\U3/U4/Z_3 ) );
  MUX2X1 U320 ( .A(gy2[2]), .B(gy1[2]), .S(n246), .Z(\U3/U4/Z_2 ) );
  MUX2X1 U321 ( .A(gy2[1]), .B(gy1[1]), .S(n246), .Z(\U3/U4/Z_1 ) );
  MUX2X1 U322 ( .A(gy2[0]), .B(gy1[0]), .S(n246), .Z(\U3/U4/Z_0 ) );
  NAND2X1 U323 ( .A(n247), .B(n248), .Z(\U3/U3/Z_9 ) );
  MUX2X1 U324 ( .A(gy1[8]), .B(gy2[8]), .S(n246), .Z(\U3/U3/Z_8 ) );
  MUX2X1 U325 ( .A(gy1[7]), .B(gy2[7]), .S(n246), .Z(\U3/U3/Z_7 ) );
  MUX2X1 U326 ( .A(gy1[6]), .B(gy2[6]), .S(n246), .Z(\U3/U3/Z_6 ) );
  MUX2X1 U327 ( .A(gy1[5]), .B(gy2[5]), .S(n246), .Z(\U3/U3/Z_5 ) );
  MUX2X1 U328 ( .A(gy1[4]), .B(gy2[4]), .S(n246), .Z(\U3/U3/Z_4 ) );
  MUX2X1 U329 ( .A(gy1[3]), .B(gy2[3]), .S(n246), .Z(\U3/U3/Z_3 ) );
  MUX2X1 U330 ( .A(gy1[2]), .B(gy2[2]), .S(n246), .Z(\U3/U3/Z_2 ) );
  MUX2X1 U331 ( .A(gy1[1]), .B(gy2[1]), .S(n246), .Z(\U3/U3/Z_1 ) );
  MUX2X1 U332 ( .A(gy1[0]), .B(gy2[0]), .S(n246), .Z(\U3/U3/Z_0 ) );
  AND2X1 U333 ( .A(n249), .B(n250), .Z(n246) );
  NAND2X1 U334 ( .A(n251), .B(n252), .Z(n250) );
  NAND2X1 U335 ( .A(gy2[9]), .B(n247), .Z(n252) );
  INVX1 U336 ( .A(gy1[9]), .Z(n247) );
  NAND2X1 U337 ( .A(n253), .B(n254), .Z(n251) );
  NAND2X1 U338 ( .A(gy1[8]), .B(n255), .Z(n254) );
  NAND3X1 U339 ( .A(n256), .B(n257), .C(n258), .Z(n253) );
  OR2X1 U340 ( .A(n255), .B(gy1[8]), .Z(n258) );
  INVX1 U341 ( .A(gy2[8]), .Z(n255) );
  NAND3X1 U342 ( .A(n259), .B(n260), .C(n261), .Z(n257) );
  NAND2X1 U343 ( .A(gy1[7]), .B(n262), .Z(n261) );
  NAND3X1 U344 ( .A(n263), .B(n264), .C(n265), .Z(n260) );
  NAND2X1 U345 ( .A(gy2[6]), .B(n266), .Z(n265) );
  NAND3X1 U346 ( .A(n267), .B(n268), .C(n269), .Z(n264) );
  NAND2X1 U347 ( .A(gy1[5]), .B(n270), .Z(n269) );
  NAND3X1 U348 ( .A(n271), .B(n272), .C(n273), .Z(n268) );
  NAND2X1 U349 ( .A(gy2[4]), .B(n274), .Z(n273) );
  NAND3X1 U350 ( .A(n275), .B(n276), .C(n277), .Z(n272) );
  NAND2X1 U351 ( .A(gy1[3]), .B(n278), .Z(n277) );
  NAND3X1 U352 ( .A(n279), .B(n280), .C(n281), .Z(n276) );
  NAND2X1 U353 ( .A(gy2[2]), .B(n282), .Z(n281) );
  NAND2X1 U354 ( .A(gy2[1]), .B(n283), .Z(n280) );
  NAND2X1 U355 ( .A(gy1[0]), .B(gy1[1]), .Z(n283) );
  OR2X1 U356 ( .A(gy1[0]), .B(gy1[1]), .Z(n279) );
  OR2X1 U357 ( .A(n282), .B(gy2[2]), .Z(n275) );
  INVX1 U358 ( .A(gy1[2]), .Z(n282) );
  OR2X1 U359 ( .A(n278), .B(gy1[3]), .Z(n271) );
  INVX1 U360 ( .A(gy2[3]), .Z(n278) );
  OR2X1 U361 ( .A(n274), .B(gy2[4]), .Z(n267) );
  INVX1 U362 ( .A(gy1[4]), .Z(n274) );
  OR2X1 U363 ( .A(n270), .B(gy1[5]), .Z(n263) );
  INVX1 U364 ( .A(gy2[5]), .Z(n270) );
  OR2X1 U365 ( .A(n266), .B(gy2[6]), .Z(n259) );
  INVX1 U366 ( .A(gy1[6]), .Z(n266) );
  OR2X1 U367 ( .A(n262), .B(gy1[7]), .Z(n256) );
  INVX1 U368 ( .A(gy2[7]), .Z(n262) );
  NAND2X1 U369 ( .A(gy1[9]), .B(n248), .Z(n249) );
  INVX1 U370 ( .A(gy2[9]), .Z(n248) );
  MUX2X1 U371 ( .A(gx2[9]), .B(gx1[9]), .S(n284), .Z(\U3/U2/Z_9 ) );
  MUX2X1 U372 ( .A(gx2[8]), .B(gx1[8]), .S(n284), .Z(\U3/U2/Z_8 ) );
  MUX2X1 U373 ( .A(gx2[7]), .B(gx1[7]), .S(n284), .Z(\U3/U2/Z_7 ) );
  MUX2X1 U374 ( .A(gx2[6]), .B(gx1[6]), .S(n284), .Z(\U3/U2/Z_6 ) );
  MUX2X1 U375 ( .A(gx2[5]), .B(gx1[5]), .S(n284), .Z(\U3/U2/Z_5 ) );
  MUX2X1 U376 ( .A(gx2[4]), .B(gx1[4]), .S(n284), .Z(\U3/U2/Z_4 ) );
  MUX2X1 U377 ( .A(gx2[3]), .B(gx1[3]), .S(n284), .Z(\U3/U2/Z_3 ) );
  MUX2X1 U378 ( .A(gx2[2]), .B(gx1[2]), .S(n284), .Z(\U3/U2/Z_2 ) );
  MUX2X1 U379 ( .A(gx2[1]), .B(gx1[1]), .S(n284), .Z(\U3/U2/Z_1 ) );
  MUX2X1 U380 ( .A(gx2[0]), .B(gx1[0]), .S(n284), .Z(\U3/U2/Z_0 ) );
  NAND2X1 U381 ( .A(n285), .B(n286), .Z(\U3/U1/Z_9 ) );
  MUX2X1 U382 ( .A(gx1[8]), .B(gx2[8]), .S(n284), .Z(\U3/U1/Z_8 ) );
  MUX2X1 U383 ( .A(gx1[7]), .B(gx2[7]), .S(n284), .Z(\U3/U1/Z_7 ) );
  MUX2X1 U384 ( .A(gx1[6]), .B(gx2[6]), .S(n284), .Z(\U3/U1/Z_6 ) );
  MUX2X1 U385 ( .A(gx1[5]), .B(gx2[5]), .S(n284), .Z(\U3/U1/Z_5 ) );
  MUX2X1 U386 ( .A(gx1[4]), .B(gx2[4]), .S(n284), .Z(\U3/U1/Z_4 ) );
  MUX2X1 U387 ( .A(gx1[3]), .B(gx2[3]), .S(n284), .Z(\U3/U1/Z_3 ) );
  MUX2X1 U388 ( .A(gx1[2]), .B(gx2[2]), .S(n284), .Z(\U3/U1/Z_2 ) );
  MUX2X1 U389 ( .A(gx1[1]), .B(gx2[1]), .S(n284), .Z(\U3/U1/Z_1 ) );
  MUX2X1 U390 ( .A(gx1[0]), .B(gx2[0]), .S(n284), .Z(\U3/U1/Z_0 ) );
  AND2X1 U391 ( .A(n287), .B(n288), .Z(n284) );
  NAND2X1 U392 ( .A(n289), .B(n290), .Z(n288) );
  NAND2X1 U393 ( .A(gx2[9]), .B(n285), .Z(n290) );
  INVX1 U394 ( .A(gx1[9]), .Z(n285) );
  NAND2X1 U395 ( .A(n291), .B(n292), .Z(n289) );
  NAND2X1 U396 ( .A(gx1[8]), .B(n293), .Z(n292) );
  NAND3X1 U397 ( .A(n294), .B(n295), .C(n296), .Z(n291) );
  OR2X1 U398 ( .A(n293), .B(gx1[8]), .Z(n296) );
  INVX1 U399 ( .A(gx2[8]), .Z(n293) );
  NAND3X1 U400 ( .A(n297), .B(n298), .C(n299), .Z(n295) );
  NAND2X1 U401 ( .A(gx1[7]), .B(n300), .Z(n299) );
  NAND3X1 U402 ( .A(n301), .B(n302), .C(n303), .Z(n298) );
  NAND2X1 U403 ( .A(gx2[6]), .B(n304), .Z(n303) );
  NAND3X1 U404 ( .A(n305), .B(n306), .C(n307), .Z(n302) );
  NAND2X1 U405 ( .A(gx1[5]), .B(n308), .Z(n307) );
  NAND3X1 U406 ( .A(n309), .B(n310), .C(n311), .Z(n306) );
  NAND2X1 U407 ( .A(gx2[4]), .B(n312), .Z(n311) );
  NAND3X1 U408 ( .A(n313), .B(n314), .C(n315), .Z(n310) );
  NAND2X1 U409 ( .A(gx1[3]), .B(n316), .Z(n315) );
  NAND3X1 U410 ( .A(n317), .B(n318), .C(n319), .Z(n314) );
  NAND2X1 U411 ( .A(gx2[2]), .B(n320), .Z(n319) );
  NAND2X1 U412 ( .A(gx2[1]), .B(n321), .Z(n318) );
  NAND2X1 U413 ( .A(gx1[1]), .B(gx1[0]), .Z(n321) );
  OR2X1 U414 ( .A(gx1[0]), .B(gx1[1]), .Z(n317) );
  OR2X1 U415 ( .A(n320), .B(gx2[2]), .Z(n313) );
  INVX1 U416 ( .A(gx1[2]), .Z(n320) );
  OR2X1 U417 ( .A(n316), .B(gx1[3]), .Z(n309) );
  INVX1 U418 ( .A(gx2[3]), .Z(n316) );
  OR2X1 U419 ( .A(n312), .B(gx2[4]), .Z(n305) );
  INVX1 U420 ( .A(gx1[4]), .Z(n312) );
  OR2X1 U421 ( .A(n308), .B(gx1[5]), .Z(n301) );
  INVX1 U422 ( .A(gx2[5]), .Z(n308) );
  OR2X1 U423 ( .A(n304), .B(gx2[6]), .Z(n297) );
  INVX1 U424 ( .A(gx1[6]), .Z(n304) );
  OR2X1 U425 ( .A(n300), .B(gx1[7]), .Z(n294) );
  INVX1 U426 ( .A(gx2[7]), .Z(n300) );
  NAND2X1 U427 ( .A(gx1[9]), .B(n286), .Z(n287) );
  INVX1 U428 ( .A(gx2[9]), .Z(n286) );
  NAND2X1 U429 ( .A(n322), .B(n323), .Z(N226) );
  NOR2X1 U430 ( .A(g_mag[9]), .B(g_mag[8]), .Z(n323) );
  NOR2X1 U431 ( .A(g_mag[7]), .B(g_mag[10]), .Z(n322) );
endmodule


module video_timing_gen_05f_08f_30f_31f_002_023_203_20d_0_DW01_inc_0 ( A, SUM
 );
  input [11:0] A;
  output [11:0] SUM;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;

  INVX2 U1 ( .A(n13), .Z(n1) );
  INVX2 U2 ( .A(n14), .Z(n2) );
  INVX2 U3 ( .A(n15), .Z(n3) );
  INVX2 U4 ( .A(n16), .Z(n4) );
  INVX2 U5 ( .A(A[0]), .Z(SUM[0]) );
  INVX2 U6 ( .A(A[2]), .Z(n6) );
  XOR2X1 U7 ( .A(A[9]), .B(n1), .Z(SUM[9]) );
  XOR2X1 U8 ( .A(A[8]), .B(n7), .Z(SUM[8]) );
  AND2X1 U9 ( .A(n2), .B(A[7]), .Z(n7) );
  XOR2X1 U10 ( .A(A[7]), .B(n2), .Z(SUM[7]) );
  XOR2X1 U11 ( .A(A[6]), .B(n8), .Z(SUM[6]) );
  AND2X1 U12 ( .A(n3), .B(A[5]), .Z(n8) );
  XOR2X1 U13 ( .A(A[5]), .B(n3), .Z(SUM[5]) );
  XOR2X1 U14 ( .A(A[4]), .B(n9), .Z(SUM[4]) );
  AND2X1 U15 ( .A(n4), .B(A[3]), .Z(n9) );
  XOR2X1 U16 ( .A(A[3]), .B(n4), .Z(SUM[3]) );
  XOR2X1 U17 ( .A(n6), .B(n10), .Z(SUM[2]) );
  NAND2X1 U18 ( .A(A[1]), .B(A[0]), .Z(n10) );
  XOR2X1 U19 ( .A(A[1]), .B(A[0]), .Z(SUM[1]) );
  XOR2X1 U20 ( .A(A[11]), .B(n11), .Z(SUM[11]) );
  AND2X1 U21 ( .A(n12), .B(A[10]), .Z(n11) );
  XOR2X1 U22 ( .A(A[10]), .B(n12), .Z(SUM[10]) );
  AND2X1 U23 ( .A(n1), .B(A[9]), .Z(n12) );
  NAND3X1 U24 ( .A(A[7]), .B(n2), .C(A[8]), .Z(n13) );
  NAND3X1 U25 ( .A(A[5]), .B(n3), .C(A[6]), .Z(n14) );
  NAND3X1 U26 ( .A(A[3]), .B(n4), .C(A[4]), .Z(n15) );
  NAND3X1 U27 ( .A(A[1]), .B(A[0]), .C(A[2]), .Z(n16) );
endmodule


module video_timing_gen_05f_08f_30f_31f_002_023_203_20d_0_DW01_inc_1 ( A, SUM
 );
  input [11:0] A;
  output [11:0] SUM;
  wire   n1, n2, n3, n4, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;

  INVX2 U1 ( .A(n13), .Z(n1) );
  INVX2 U2 ( .A(n14), .Z(n2) );
  INVX2 U3 ( .A(n15), .Z(n3) );
  INVX2 U4 ( .A(n16), .Z(n4) );
  INVX2 U5 ( .A(A[0]), .Z(SUM[0]) );
  INVX2 U6 ( .A(A[2]), .Z(n6) );
  XOR2X1 U7 ( .A(A[9]), .B(n1), .Z(SUM[9]) );
  XOR2X1 U8 ( .A(A[8]), .B(n7), .Z(SUM[8]) );
  AND2X1 U9 ( .A(n2), .B(A[7]), .Z(n7) );
  XOR2X1 U10 ( .A(A[7]), .B(n2), .Z(SUM[7]) );
  XOR2X1 U11 ( .A(A[6]), .B(n8), .Z(SUM[6]) );
  AND2X1 U12 ( .A(n3), .B(A[5]), .Z(n8) );
  XOR2X1 U13 ( .A(A[5]), .B(n3), .Z(SUM[5]) );
  XOR2X1 U14 ( .A(A[4]), .B(n9), .Z(SUM[4]) );
  AND2X1 U15 ( .A(n4), .B(A[3]), .Z(n9) );
  XOR2X1 U16 ( .A(A[3]), .B(n4), .Z(SUM[3]) );
  XOR2X1 U17 ( .A(n6), .B(n10), .Z(SUM[2]) );
  NAND2X1 U18 ( .A(A[1]), .B(A[0]), .Z(n10) );
  XOR2X1 U19 ( .A(A[1]), .B(A[0]), .Z(SUM[1]) );
  XOR2X1 U20 ( .A(A[11]), .B(n11), .Z(SUM[11]) );
  AND2X1 U21 ( .A(n12), .B(A[10]), .Z(n11) );
  XOR2X1 U22 ( .A(A[10]), .B(n12), .Z(SUM[10]) );
  AND2X1 U23 ( .A(n1), .B(A[9]), .Z(n12) );
  NAND3X1 U24 ( .A(A[7]), .B(n2), .C(A[8]), .Z(n13) );
  NAND3X1 U25 ( .A(A[5]), .B(n3), .C(A[6]), .Z(n14) );
  NAND3X1 U26 ( .A(A[3]), .B(n4), .C(A[4]), .Z(n15) );
  NAND3X1 U27 ( .A(A[1]), .B(A[0]), .C(A[2]), .Z(n16) );
endmodule


module video_timing_gen_05f_08f_30f_31f_002_023_203_20d_0 ( I_RST, I_PCLK, 
        I_PIX_DATA, I_VRST, O_DE, O_HS, O_VS, O_HCNT, O_VCNT, O_PIX_DATA );
  input [23:0] I_PIX_DATA;
  output [11:0] O_HCNT;
  output [11:0] O_VCNT;
  output [23:0] O_PIX_DATA;
  input I_RST, I_PCLK, I_VRST;
  output O_DE, O_HS, O_VS;
  wire   \q_vctr[0] , N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41,
         N42, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70,
         q_hde, q_vde, q_hs_done, q_hbp_done, q_hact_done, \q_vstate[2] ,
         q_vbp_done, q_vact_done, N122, N123, N124, N125, N126, N127, N128,
         N141, N142, N143, N144, N145, N146, N147, N148, N149, N150, N151,
         N152, N159, N161, N163, N164, N165, N167, N168, N169, N170, N171,
         N172, N173, N174, N175, N176, N177, N178, N179, N180, N181, N182,
         N183, N184, N185, N186, N187, N188, N189, N190, N191, N192, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n47, n50, n167, n168, n169, n170, n171, n172, \gte_129/B[1] ,
         \gte_129/B[2] , \gte_129/B[3] , \gte_129/B[4] , \gte_129/B[5] ,
         \gte_129/B[6] , \gte_129/B[7] , \gte_129/B[8] , \gte_129/B[9] ,
         \gte_129/B[10] , \gte_129/B[11] , n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n45, n46, n48, n49, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158;
  wire   [11:0] q_hctr;
  wire   [11:0] n_hctr;
  wire   [3:0] n_hsDly;
  wire   [2:0] n_deDly;
  tri   I_RST;
  tri   I_PCLK;

  DFFQBX1 \q_hstate_reg[0]  ( .D(n172), .CLK(I_PCLK), .QB(n44) );
  DFFQBX1 \q_hstate_reg[1]  ( .D(n171), .CLK(I_PCLK), .QB(n43) );
  DFFQX1 \q_hctr_reg[6]  ( .D(n_hctr[6]), .CLK(I_PCLK), .Q(q_hctr[6]) );
  DFFQX1 \q_hctr_reg[0]  ( .D(n_hctr[0]), .CLK(I_PCLK), .Q(q_hctr[0]) );
  DFFQX1 \q_hctr_reg[1]  ( .D(n_hctr[1]), .CLK(I_PCLK), .Q(q_hctr[1]) );
  DFFQX1 \q_hctr_reg[2]  ( .D(n_hctr[2]), .CLK(I_PCLK), .Q(q_hctr[2]) );
  DFFQX1 \q_hctr_reg[3]  ( .D(n_hctr[3]), .CLK(I_PCLK), .Q(q_hctr[3]) );
  DFFQX1 \q_hctr_reg[4]  ( .D(n_hctr[4]), .CLK(I_PCLK), .Q(q_hctr[4]) );
  DFFQX1 \q_hctr_reg[5]  ( .D(n_hctr[5]), .CLK(I_PCLK), .Q(q_hctr[5]) );
  DFFQX1 \q_hctr_reg[7]  ( .D(n_hctr[7]), .CLK(I_PCLK), .Q(q_hctr[7]) );
  DFFQX1 \q_hctr_reg[8]  ( .D(n_hctr[8]), .CLK(I_PCLK), .Q(q_hctr[8]) );
  DFFQX1 \q_hctr_reg[9]  ( .D(n_hctr[9]), .CLK(I_PCLK), .Q(q_hctr[9]) );
  DFFQX1 \q_hctr_reg[10]  ( .D(n_hctr[10]), .CLK(I_PCLK), .Q(q_hctr[10]) );
  DFFQX1 q_hact_done_reg ( .D(N124), .CLK(I_PCLK), .Q(q_hact_done) );
  DFFQX1 q_hbp_done_reg ( .D(N123), .CLK(I_PCLK), .Q(q_hbp_done) );
  DFFQBX1 q_hfp_done_reg ( .D(N125), .CLK(I_PCLK), .QB(n47) );
  DFFQX1 \q_hctr_reg[11]  ( .D(n_hctr[11]), .CLK(I_PCLK), .Q(q_hctr[11]) );
  DFFQX1 q_hs_done_reg ( .D(N122), .CLK(I_PCLK), .Q(q_hs_done) );
  DFFQBX1 \q_hstate_reg[2]  ( .D(n170), .CLK(I_PCLK), .QB(n42) );
  DFFQBX1 \q_vstate_reg[0]  ( .D(n169), .CLK(I_PCLK), .QB(n41) );
  DFFQBX1 \q_vstate_reg[1]  ( .D(n168), .CLK(I_PCLK), .QB(n40) );
  DFFQX1 \q_vstate_reg[2]  ( .D(n167), .CLK(I_PCLK), .Q(\q_vstate[2] ) );
  DFFQBX1 \q_vctr_reg[11]  ( .D(N152), .CLK(I_PCLK), .QB(n39) );
  DFFQX1 \q_vctr_reg[0]  ( .D(N141), .CLK(I_PCLK), .Q(\q_vctr[0] ) );
  DFFQBX1 \q_vctr_reg[1]  ( .D(N142), .CLK(I_PCLK), .QB(n38) );
  DFFQBX1 \q_vctr_reg[2]  ( .D(N143), .CLK(I_PCLK), .QB(n37) );
  DFFQBX1 \q_vctr_reg[3]  ( .D(N144), .CLK(I_PCLK), .QB(n36) );
  DFFQBX1 \q_vctr_reg[4]  ( .D(N145), .CLK(I_PCLK), .QB(n35) );
  DFFQBX1 \q_vctr_reg[5]  ( .D(N146), .CLK(I_PCLK), .QB(n34) );
  DFFQBX1 \q_vctr_reg[6]  ( .D(N147), .CLK(I_PCLK), .QB(n33) );
  DFFQBX1 \q_vctr_reg[7]  ( .D(N148), .CLK(I_PCLK), .QB(n32) );
  DFFQBX1 \q_vctr_reg[8]  ( .D(N149), .CLK(I_PCLK), .QB(n31) );
  DFFQBX1 \q_vctr_reg[9]  ( .D(N150), .CLK(I_PCLK), .QB(n30) );
  DFFQBX1 \q_vctr_reg[10]  ( .D(N151), .CLK(I_PCLK), .QB(n29) );
  DFFQBX1 q_vfp_done_reg ( .D(N128), .CLK(I_PCLK), .QB(n50) );
  DFFQX1 q_vbp_done_reg ( .D(N126), .CLK(I_PCLK), .Q(q_vbp_done) );
  DFFQX1 q_vact_done_reg ( .D(N127), .CLK(I_PCLK), .Q(q_vact_done) );
  DFFQX1 q_hde_reg ( .D(N159), .CLK(I_PCLK), .Q(q_hde) );
  DFFQX1 q_vde_reg ( .D(n157), .CLK(I_PCLK), .Q(q_vde) );
  DFFQX1 \q_deDly_reg[0]  ( .D(n158), .CLK(I_PCLK), .Q(n_deDly[1]) );
  DFFQX1 \q_deDly_reg[1]  ( .D(N167), .CLK(I_PCLK), .Q(n_deDly[2]) );
  DFFQX1 \q_deDly_reg[2]  ( .D(N168), .CLK(I_PCLK), .Q(O_DE) );
  DFFQX1 \q_pix_data_reg[0]  ( .D(N169), .CLK(I_PCLK), .Q(O_PIX_DATA[0]) );
  DFFQX1 \q_pix_data_reg[1]  ( .D(N170), .CLK(I_PCLK), .Q(O_PIX_DATA[1]) );
  DFFQX1 \q_pix_data_reg[2]  ( .D(N171), .CLK(I_PCLK), .Q(O_PIX_DATA[2]) );
  DFFQX1 \q_pix_data_reg[3]  ( .D(N172), .CLK(I_PCLK), .Q(O_PIX_DATA[3]) );
  DFFQX1 \q_pix_data_reg[4]  ( .D(N173), .CLK(I_PCLK), .Q(O_PIX_DATA[4]) );
  DFFQX1 \q_pix_data_reg[5]  ( .D(N174), .CLK(I_PCLK), .Q(O_PIX_DATA[5]) );
  DFFQX1 \q_pix_data_reg[6]  ( .D(N175), .CLK(I_PCLK), .Q(O_PIX_DATA[6]) );
  DFFQX1 \q_pix_data_reg[7]  ( .D(N176), .CLK(I_PCLK), .Q(O_PIX_DATA[7]) );
  DFFQX1 \q_pix_data_reg[8]  ( .D(N177), .CLK(I_PCLK), .Q(O_PIX_DATA[8]) );
  DFFQX1 \q_pix_data_reg[9]  ( .D(N178), .CLK(I_PCLK), .Q(O_PIX_DATA[9]) );
  DFFQX1 \q_pix_data_reg[10]  ( .D(N179), .CLK(I_PCLK), .Q(O_PIX_DATA[10]) );
  DFFQX1 \q_pix_data_reg[11]  ( .D(N180), .CLK(I_PCLK), .Q(O_PIX_DATA[11]) );
  DFFQX1 \q_pix_data_reg[12]  ( .D(N181), .CLK(I_PCLK), .Q(O_PIX_DATA[12]) );
  DFFQX1 \q_pix_data_reg[13]  ( .D(N182), .CLK(I_PCLK), .Q(O_PIX_DATA[13]) );
  DFFQX1 \q_pix_data_reg[14]  ( .D(N183), .CLK(I_PCLK), .Q(O_PIX_DATA[14]) );
  DFFQX1 \q_pix_data_reg[15]  ( .D(N184), .CLK(I_PCLK), .Q(O_PIX_DATA[15]) );
  DFFQX1 \q_pix_data_reg[16]  ( .D(N185), .CLK(I_PCLK), .Q(O_PIX_DATA[16]) );
  DFFQX1 \q_pix_data_reg[17]  ( .D(N186), .CLK(I_PCLK), .Q(O_PIX_DATA[17]) );
  DFFQX1 \q_pix_data_reg[18]  ( .D(N187), .CLK(I_PCLK), .Q(O_PIX_DATA[18]) );
  DFFQX1 \q_pix_data_reg[19]  ( .D(N188), .CLK(I_PCLK), .Q(O_PIX_DATA[19]) );
  DFFQX1 \q_pix_data_reg[20]  ( .D(N189), .CLK(I_PCLK), .Q(O_PIX_DATA[20]) );
  DFFQX1 \q_pix_data_reg[21]  ( .D(N190), .CLK(I_PCLK), .Q(O_PIX_DATA[21]) );
  DFFQX1 \q_pix_data_reg[22]  ( .D(N191), .CLK(I_PCLK), .Q(O_PIX_DATA[22]) );
  DFFQX1 \q_pix_data_reg[23]  ( .D(N192), .CLK(I_PCLK), .Q(O_PIX_DATA[23]) );
  DFFQX1 q_vsync_reg ( .D(N161), .CLK(I_PCLK), .Q(O_VS) );
  DFFQX1 \q_hsDly_reg[0]  ( .D(n156), .CLK(I_PCLK), .Q(n_hsDly[1]) );
  DFFQX1 \q_hsDly_reg[1]  ( .D(N163), .CLK(I_PCLK), .Q(n_hsDly[2]) );
  DFFQX1 \q_hsDly_reg[2]  ( .D(N164), .CLK(I_PCLK), .Q(n_hsDly[3]) );
  DFFQX1 \q_hsDly_reg[3]  ( .D(N165), .CLK(I_PCLK), .Q(O_HS) );
  video_timing_gen_05f_08f_30f_31f_002_023_203_20d_0_DW01_inc_0 add_135 ( .A(
        q_hctr), .SUM({N70, N69, N68, N67, N66, N65, N64, N63, N62, N61, N60, 
        N59}) );
  video_timing_gen_05f_08f_30f_31f_002_023_203_20d_0_DW01_inc_1 add_131 ( .A({
        \gte_129/B[11] , \gte_129/B[10] , \gte_129/B[9] , \gte_129/B[8] , 
        \gte_129/B[7] , \gte_129/B[6] , \gte_129/B[5] , \gte_129/B[4] , 
        \gte_129/B[3] , \gte_129/B[2] , \gte_129/B[1] , \q_vctr[0] }), .SUM({
        N42, N41, N40, N39, N38, N37, N36, N35, N34, N33, N32, N31}) );
  INVX1 U3 ( .A(n1), .Z(n158) );
  NAND3X1 U4 ( .A(q_hde), .B(n2), .C(q_vde), .Z(n1) );
  AND2X1 U5 ( .A(n3), .B(N63), .Z(n_hctr[4]) );
  AND2X1 U6 ( .A(n3), .B(N61), .Z(n_hctr[2]) );
  AND2X1 U7 ( .A(n3), .B(N60), .Z(n_hctr[1]) );
  NOR2X1 U8 ( .A(n4), .B(n5), .Z(n_hctr[11]) );
  NOR2X1 U9 ( .A(n4), .B(n6), .Z(n_hctr[10]) );
  AND2X1 U10 ( .A(n3), .B(N59), .Z(n_hctr[0]) );
  MUX2X1 U11 ( .A(n7), .B(n8), .S(n9), .Z(n172) );
  NOR2X1 U12 ( .A(n10), .B(n11), .Z(n8) );
  NOR2X1 U13 ( .A(n42), .B(n43), .Z(n10) );
  NAND2X1 U14 ( .A(n12), .B(n13), .Z(n171) );
  NAND2X1 U15 ( .A(n14), .B(n15), .Z(n13) );
  NAND2X1 U16 ( .A(n9), .B(n16), .Z(n14) );
  NAND2X1 U17 ( .A(n17), .B(n42), .Z(n16) );
  NAND2X1 U18 ( .A(n9), .B(n156), .Z(n12) );
  MUX2X1 U19 ( .A(n18), .B(N159), .S(n9), .Z(n170) );
  INVX1 U20 ( .A(n19), .Z(n9) );
  NAND3X1 U21 ( .A(n20), .B(n21), .C(n22), .Z(n19) );
  NAND2X1 U22 ( .A(n23), .B(N159), .Z(n22) );
  INVX1 U23 ( .A(q_hact_done), .Z(n23) );
  NAND2X1 U24 ( .A(n24), .B(n17), .Z(n21) );
  MUX2X1 U25 ( .A(n25), .B(n26), .S(n43), .Z(n24) );
  NOR2X1 U26 ( .A(n42), .B(n27), .Z(n26) );
  NOR2X1 U27 ( .A(q_hbp_done), .B(n18), .Z(n25) );
  NAND2X1 U28 ( .A(n28), .B(n156), .Z(n20) );
  NOR2X1 U29 ( .A(n15), .B(n45), .Z(n156) );
  INVX1 U30 ( .A(q_hs_done), .Z(n28) );
  NAND2X1 U31 ( .A(n46), .B(n48), .Z(n169) );
  OR2X1 U32 ( .A(n49), .B(I_RST), .Z(n48) );
  MUX2X1 U33 ( .A(n41), .B(n51), .S(n52), .Z(n46) );
  NOR2X1 U34 ( .A(n53), .B(n157), .Z(n51) );
  INVX1 U35 ( .A(n54), .Z(n157) );
  MUX2X1 U36 ( .A(n55), .B(n56), .S(n40), .Z(n168) );
  OR2X1 U37 ( .A(n57), .B(n53), .Z(n55) );
  NOR2X1 U38 ( .A(n58), .B(n59), .Z(n53) );
  NAND3X1 U39 ( .A(n60), .B(n54), .C(n61), .Z(n167) );
  NAND2X1 U40 ( .A(\q_vstate[2] ), .B(n57), .Z(n61) );
  NAND2X1 U41 ( .A(n56), .B(n62), .Z(n60) );
  INVX1 U42 ( .A(n63), .Z(n56) );
  NAND3X1 U43 ( .A(n64), .B(n59), .C(n52), .Z(n63) );
  INVX1 U44 ( .A(n57), .Z(n52) );
  NAND2X1 U45 ( .A(n65), .B(n66), .Z(n57) );
  NAND3X1 U46 ( .A(n2), .B(n59), .C(n67), .Z(n66) );
  MUX2X1 U47 ( .A(n68), .B(n69), .S(\q_vstate[2] ), .Z(n67) );
  AND2X1 U48 ( .A(n40), .B(n50), .Z(n69) );
  MUX2X1 U49 ( .A(n70), .B(n71), .S(n40), .Z(n68) );
  NOR2X1 U50 ( .A(n72), .B(n73), .Z(n71) );
  NAND3X1 U51 ( .A(n38), .B(n37), .C(n74), .Z(n73) );
  INVX1 U52 ( .A(n75), .Z(n74) );
  NAND3X1 U53 ( .A(n35), .B(n34), .C(n36), .Z(n72) );
  INVX1 U54 ( .A(q_vbp_done), .Z(n70) );
  OR2X1 U55 ( .A(q_vact_done), .B(n54), .Z(n65) );
  NAND3X1 U56 ( .A(\q_vstate[2] ), .B(n41), .C(n76), .Z(n54) );
  NOR2X1 U57 ( .A(I_RST), .B(n62), .Z(n76) );
  INVX1 U58 ( .A(q_hctr[0]), .Z(O_HCNT[0]) );
  AND2X1 U59 ( .A(I_PIX_DATA[23]), .B(N168), .Z(N192) );
  AND2X1 U60 ( .A(I_PIX_DATA[22]), .B(N168), .Z(N191) );
  AND2X1 U61 ( .A(I_PIX_DATA[21]), .B(N168), .Z(N190) );
  AND2X1 U62 ( .A(I_PIX_DATA[20]), .B(N168), .Z(N189) );
  AND2X1 U63 ( .A(I_PIX_DATA[19]), .B(N168), .Z(N188) );
  AND2X1 U64 ( .A(I_PIX_DATA[18]), .B(N168), .Z(N187) );
  AND2X1 U65 ( .A(I_PIX_DATA[17]), .B(N168), .Z(N186) );
  AND2X1 U66 ( .A(I_PIX_DATA[16]), .B(N168), .Z(N185) );
  AND2X1 U67 ( .A(I_PIX_DATA[15]), .B(N168), .Z(N184) );
  AND2X1 U68 ( .A(I_PIX_DATA[14]), .B(N168), .Z(N183) );
  AND2X1 U69 ( .A(I_PIX_DATA[13]), .B(N168), .Z(N182) );
  AND2X1 U70 ( .A(I_PIX_DATA[12]), .B(N168), .Z(N181) );
  AND2X1 U71 ( .A(I_PIX_DATA[11]), .B(N168), .Z(N180) );
  AND2X1 U72 ( .A(I_PIX_DATA[10]), .B(N168), .Z(N179) );
  AND2X1 U73 ( .A(I_PIX_DATA[9]), .B(N168), .Z(N178) );
  AND2X1 U74 ( .A(I_PIX_DATA[8]), .B(N168), .Z(N177) );
  AND2X1 U75 ( .A(I_PIX_DATA[7]), .B(N168), .Z(N176) );
  AND2X1 U76 ( .A(I_PIX_DATA[6]), .B(N168), .Z(N175) );
  AND2X1 U77 ( .A(I_PIX_DATA[5]), .B(N168), .Z(N174) );
  AND2X1 U78 ( .A(I_PIX_DATA[4]), .B(N168), .Z(N173) );
  AND2X1 U79 ( .A(I_PIX_DATA[3]), .B(N168), .Z(N172) );
  AND2X1 U80 ( .A(I_PIX_DATA[2]), .B(N168), .Z(N171) );
  AND2X1 U81 ( .A(I_PIX_DATA[1]), .B(N168), .Z(N170) );
  AND2X1 U82 ( .A(I_PIX_DATA[0]), .B(N168), .Z(N169) );
  AND2X1 U83 ( .A(n_deDly[2]), .B(n2), .Z(N168) );
  AND2X1 U84 ( .A(n_deDly[1]), .B(n2), .Z(N167) );
  AND2X1 U85 ( .A(n_hsDly[3]), .B(n2), .Z(N165) );
  AND2X1 U86 ( .A(n_hsDly[2]), .B(n2), .Z(N164) );
  AND2X1 U87 ( .A(n_hsDly[1]), .B(n2), .Z(N163) );
  NOR2X1 U88 ( .A(n77), .B(n58), .Z(N161) );
  INVX1 U89 ( .A(n64), .Z(n58) );
  NOR2X1 U90 ( .A(I_RST), .B(\q_vstate[2] ), .Z(n64) );
  XOR2X1 U91 ( .A(n62), .B(n41), .Z(n77) );
  INVX1 U92 ( .A(n40), .Z(n62) );
  NOR2X1 U93 ( .A(n45), .B(n43), .Z(N159) );
  NAND3X1 U94 ( .A(n2), .B(n7), .C(n42), .Z(n45) );
  INVX1 U95 ( .A(n44), .Z(n7) );
  NAND2X1 U96 ( .A(n78), .B(n79), .Z(N152) );
  NAND2X1 U97 ( .A(n80), .B(\gte_129/B[11] ), .Z(n79) );
  INVX1 U98 ( .A(n39), .Z(\gte_129/B[11] ) );
  NAND2X1 U99 ( .A(N42), .B(n81), .Z(n78) );
  NAND2X1 U100 ( .A(n82), .B(n83), .Z(N151) );
  NAND2X1 U101 ( .A(n80), .B(\gte_129/B[10] ), .Z(n83) );
  NAND2X1 U102 ( .A(N41), .B(n81), .Z(n82) );
  NAND2X1 U103 ( .A(n84), .B(n85), .Z(N150) );
  NAND2X1 U104 ( .A(n80), .B(\gte_129/B[9] ), .Z(n85) );
  NAND2X1 U105 ( .A(N40), .B(n81), .Z(n84) );
  NAND2X1 U106 ( .A(n86), .B(n87), .Z(N149) );
  NAND2X1 U107 ( .A(n80), .B(\gte_129/B[8] ), .Z(n87) );
  INVX1 U108 ( .A(n31), .Z(\gte_129/B[8] ) );
  NAND2X1 U109 ( .A(N39), .B(n81), .Z(n86) );
  NAND2X1 U110 ( .A(n88), .B(n89), .Z(N148) );
  NAND2X1 U111 ( .A(n80), .B(\gte_129/B[7] ), .Z(n89) );
  INVX1 U112 ( .A(n32), .Z(\gte_129/B[7] ) );
  NAND2X1 U113 ( .A(N38), .B(n81), .Z(n88) );
  NAND2X1 U114 ( .A(n90), .B(n91), .Z(N147) );
  NAND2X1 U115 ( .A(n80), .B(\gte_129/B[6] ), .Z(n91) );
  INVX1 U116 ( .A(n33), .Z(\gte_129/B[6] ) );
  NAND2X1 U117 ( .A(N37), .B(n81), .Z(n90) );
  NAND2X1 U118 ( .A(n92), .B(n93), .Z(N146) );
  NAND2X1 U119 ( .A(n80), .B(\gte_129/B[5] ), .Z(n93) );
  NAND2X1 U120 ( .A(N36), .B(n81), .Z(n92) );
  NAND2X1 U121 ( .A(n94), .B(n95), .Z(N145) );
  NAND2X1 U122 ( .A(n80), .B(\gte_129/B[4] ), .Z(n95) );
  NAND2X1 U123 ( .A(N35), .B(n81), .Z(n94) );
  NAND2X1 U124 ( .A(n96), .B(n97), .Z(N144) );
  NAND2X1 U125 ( .A(n80), .B(\gte_129/B[3] ), .Z(n97) );
  NAND2X1 U126 ( .A(N34), .B(n81), .Z(n96) );
  NAND2X1 U127 ( .A(n98), .B(n99), .Z(N143) );
  NAND2X1 U128 ( .A(n80), .B(\gte_129/B[2] ), .Z(n99) );
  NAND2X1 U129 ( .A(N33), .B(n81), .Z(n98) );
  NAND2X1 U130 ( .A(n100), .B(n101), .Z(N142) );
  NAND2X1 U131 ( .A(n80), .B(\gte_129/B[1] ), .Z(n101) );
  NAND2X1 U132 ( .A(N32), .B(n81), .Z(n100) );
  NAND2X1 U133 ( .A(n102), .B(n103), .Z(N141) );
  NAND2X1 U134 ( .A(n80), .B(\q_vctr[0] ), .Z(n103) );
  AND2X1 U135 ( .A(n104), .B(n3), .Z(n80) );
  NAND2X1 U136 ( .A(N31), .B(n81), .Z(n102) );
  INVX1 U137 ( .A(n105), .Z(n81) );
  NAND3X1 U138 ( .A(n104), .B(n17), .C(n106), .Z(n105) );
  NOR2X1 U139 ( .A(n15), .B(n107), .Z(n106) );
  NAND2X1 U140 ( .A(n18), .B(n27), .Z(n107) );
  INVX1 U141 ( .A(n47), .Z(n27) );
  INVX1 U142 ( .A(n42), .Z(n18) );
  INVX1 U143 ( .A(n43), .Z(n15) );
  INVX1 U144 ( .A(n11), .Z(n17) );
  NAND2X1 U145 ( .A(n44), .B(n2), .Z(n11) );
  NOR2X1 U146 ( .A(n108), .B(I_VRST), .Z(n104) );
  NOR2X1 U147 ( .A(n50), .B(n49), .Z(n108) );
  NAND3X1 U148 ( .A(n40), .B(n59), .C(\q_vstate[2] ), .Z(n49) );
  INVX1 U149 ( .A(n41), .Z(n59) );
  AND2X1 U150 ( .A(n109), .B(n2), .Z(N128) );
  NAND2X1 U151 ( .A(n110), .B(n111), .Z(n109) );
  NAND2X1 U152 ( .A(n112), .B(\gte_129/B[9] ), .Z(n111) );
  NAND2X1 U153 ( .A(n113), .B(n35), .Z(n112) );
  NAND3X1 U154 ( .A(\gte_129/B[3] ), .B(\gte_129/B[2] ), .C(n114), .Z(n113) );
  NAND2X1 U155 ( .A(n38), .B(O_VCNT[0]), .Z(n114) );
  INVX1 U156 ( .A(\q_vctr[0] ), .Z(O_VCNT[0]) );
  INVX1 U157 ( .A(n37), .Z(\gte_129/B[2] ) );
  INVX1 U158 ( .A(n115), .Z(n110) );
  NOR2X1 U159 ( .A(I_RST), .B(n116), .Z(N127) );
  NOR2X1 U160 ( .A(n117), .B(n115), .Z(n116) );
  NAND3X1 U161 ( .A(n29), .B(n39), .C(n118), .Z(n115) );
  NAND2X1 U162 ( .A(n119), .B(\gte_129/B[9] ), .Z(n118) );
  INVX1 U163 ( .A(n30), .Z(\gte_129/B[9] ) );
  OR2X1 U164 ( .A(n120), .B(\gte_129/B[5] ), .Z(n119) );
  INVX1 U165 ( .A(n34), .Z(\gte_129/B[5] ) );
  NOR2X1 U166 ( .A(n30), .B(n121), .Z(n117) );
  NOR2X1 U167 ( .A(I_RST), .B(n122), .Z(N126) );
  NOR2X1 U168 ( .A(n123), .B(n75), .Z(n122) );
  NAND3X1 U169 ( .A(n39), .B(n30), .C(n124), .Z(n75) );
  NOR2X1 U170 ( .A(\gte_129/B[10] ), .B(n120), .Z(n124) );
  NAND3X1 U171 ( .A(n32), .B(n31), .C(n33), .Z(n120) );
  INVX1 U172 ( .A(n29), .Z(\gte_129/B[10] ) );
  NOR2X1 U173 ( .A(n34), .B(n121), .Z(n123) );
  INVX1 U174 ( .A(n125), .Z(n121) );
  NAND3X1 U175 ( .A(n126), .B(n37), .C(n127), .Z(n125) );
  NOR2X1 U176 ( .A(\gte_129/B[4] ), .B(\gte_129/B[3] ), .Z(n127) );
  INVX1 U177 ( .A(n36), .Z(\gte_129/B[3] ) );
  INVX1 U178 ( .A(n35), .Z(\gte_129/B[4] ) );
  NAND2X1 U179 ( .A(\q_vctr[0] ), .B(\gte_129/B[1] ), .Z(n126) );
  INVX1 U180 ( .A(n38), .Z(\gte_129/B[1] ) );
  NAND2X1 U181 ( .A(n128), .B(n129), .Z(N125) );
  NAND3X1 U182 ( .A(N67), .B(n130), .C(n_hctr[9]), .Z(n129) );
  NAND3X1 U183 ( .A(n131), .B(n132), .C(n133), .Z(n130) );
  NOR2X1 U184 ( .A(n_hctr[7]), .B(n_hctr[5]), .Z(n133) );
  NOR2X1 U185 ( .A(n134), .B(n4), .Z(n_hctr[5]) );
  NAND2X1 U186 ( .A(n135), .B(N63), .Z(n131) );
  INVX1 U187 ( .A(n136), .Z(n135) );
  NAND2X1 U188 ( .A(n128), .B(n137), .Z(N124) );
  NAND3X1 U189 ( .A(N67), .B(n138), .C(n_hctr[9]), .Z(n137) );
  OR2X1 U190 ( .A(n139), .B(N66), .Z(n138) );
  NAND3X1 U191 ( .A(n140), .B(n128), .C(n141), .Z(N123) );
  NOR2X1 U192 ( .A(n_hctr[9]), .B(n_hctr[8]), .Z(n141) );
  AND2X1 U193 ( .A(N67), .B(n3), .Z(n_hctr[8]) );
  NOR2X1 U194 ( .A(n142), .B(n4), .Z(n_hctr[9]) );
  NAND2X1 U195 ( .A(n3), .B(n143), .Z(n128) );
  NAND2X1 U196 ( .A(n6), .B(n5), .Z(n143) );
  INVX1 U197 ( .A(N70), .Z(n5) );
  INVX1 U198 ( .A(N69), .Z(n6) );
  NAND2X1 U199 ( .A(n_hctr[7]), .B(n139), .Z(n140) );
  NAND3X1 U200 ( .A(n132), .B(n136), .C(n144), .Z(n139) );
  NOR2X1 U201 ( .A(N64), .B(N63), .Z(n144) );
  NAND2X1 U202 ( .A(n_hctr[3]), .B(n145), .Z(n136) );
  NOR2X1 U203 ( .A(n146), .B(n4), .Z(n_hctr[3]) );
  AND2X1 U204 ( .A(N66), .B(n3), .Z(n_hctr[7]) );
  NOR2X1 U205 ( .A(n147), .B(n148), .Z(N122) );
  NAND3X1 U206 ( .A(n_hctr[6]), .B(n145), .C(n149), .Z(n148) );
  NOR2X1 U207 ( .A(n146), .B(n150), .Z(n149) );
  NAND2X1 U208 ( .A(N63), .B(n134), .Z(n150) );
  INVX1 U209 ( .A(N64), .Z(n134) );
  INVX1 U210 ( .A(N62), .Z(n146) );
  INVX1 U211 ( .A(n151), .Z(n145) );
  NAND3X1 U212 ( .A(N60), .B(N61), .C(N59), .Z(n151) );
  INVX1 U213 ( .A(n132), .Z(n_hctr[6]) );
  NAND2X1 U214 ( .A(N65), .B(n3), .Z(n132) );
  INVX1 U215 ( .A(n4), .Z(n3) );
  NAND2X1 U216 ( .A(n2), .B(n152), .Z(n4) );
  NAND3X1 U217 ( .A(n44), .B(n43), .C(n153), .Z(n152) );
  NOR2X1 U218 ( .A(n47), .B(n42), .Z(n153) );
  INVX1 U219 ( .A(I_RST), .Z(n2) );
  NAND3X1 U220 ( .A(n154), .B(n142), .C(n155), .Z(n147) );
  NOR2X1 U221 ( .A(N67), .B(N66), .Z(n155) );
  INVX1 U222 ( .A(N68), .Z(n142) );
  NOR2X1 U223 ( .A(N70), .B(N69), .Z(n154) );
endmodule


module edge_detection_top ( I_RST, I_CORE_CLK, I_PIX_DATA, I_VSYNC, I_HSYNC, 
        I_DE, I_PCLK, O_PIX_DATA, O_VSYNC, O_HSYNC, O_DE, O_PCLK );
  input [23:0] I_PIX_DATA;
  output [23:0] O_PIX_DATA;
  input I_RST, I_CORE_CLK, I_VSYNC, I_HSYNC, I_DE, I_PCLK;
  output O_VSYNC, O_HSYNC, O_DE, O_PCLK;
  wire   pix_vsync_dly, N4, n2;
  wire   [7:0] out;
  tri   I_RST;
  tri   I_CORE_CLK;
  tri   [23:0] I_PIX_DATA;
  tri   I_VSYNC;
  tri   I_DE;
  tri   O_PCLK;
  tri   [9:0] colorspace_converter_pixel_col;
  tri   [8:0] colorspace_converter_pixel_row;
  tri   [63:0] colorspace_converter_pixel_matrix;
  tri   colorspace_converter_pixel_matrix_ready;
  tri   n3;
  assign O_PCLK = I_PCLK;

  DFFQX1 pix_vsync_dly_reg ( .D(N4), .CLK(O_PCLK), .Q(pix_vsync_dly) );
  buffered_matrix_colorspace_converter iBMCC ( .I_CLK(I_CORE_CLK), .I_RESET(
        I_RST), .I_ENABLE(1'b1), .I_PIXEL(I_PIX_DATA), .I_VSYNC(I_VSYNC), 
        .I_HSYNC(I_VSYNC), .I_DATA_ENABLE(I_DE), .I_PIXEL_CLK(O_PCLK), 
        .O_PIXEL_COLUMN(colorspace_converter_pixel_col), .O_PIXEL_ROW(
        colorspace_converter_pixel_row), .O_PIXEL_MATRIX(
        colorspace_converter_pixel_matrix), .O_PIXEL_MATRIX_READY(
        colorspace_converter_pixel_matrix_ready) );
  sobel iSobel ( .row(colorspace_converter_pixel_row), .col(
        colorspace_converter_pixel_col), .inputPixels(
        colorspace_converter_pixel_matrix), .clk_pix(O_PCLK), .clk(I_CORE_CLK), 
        .start(colorspace_converter_pixel_matrix_ready), .reset(I_RST), .out(
        out) );
  video_timing_gen_05f_08f_30f_31f_002_023_203_20d_0 iVidGen ( .I_RST(I_RST), 
        .I_PCLK(O_PCLK), .I_PIX_DATA({out, out, out}), .I_VRST(pix_vsync_dly), 
        .O_DE(O_DE), .O_HS(O_HSYNC), .O_VS(O_VSYNC), .O_PIX_DATA(O_PIX_DATA)
         );
  NOR2X1 U5 ( .A(I_RST), .B(n2), .Z(N4) );
  INVX1 U6 ( .A(I_VSYNC), .Z(n2) );
endmodule

