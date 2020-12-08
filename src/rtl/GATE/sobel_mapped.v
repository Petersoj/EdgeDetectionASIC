/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP5-6
// Date      : Mon Dec  7 17:44:45 2020
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
  INVX2 U3 ( .A(B[7]), .Z(n3) );
  INVX2 U4 ( .A(B[6]), .Z(n4) );
  INVX2 U5 ( .A(B[5]), .Z(n5) );
  INVX2 U6 ( .A(B[4]), .Z(n6) );
  INVX2 U7 ( .A(B[3]), .Z(n7) );
  INVX2 U8 ( .A(B[2]), .Z(n8) );
  INVX2 U9 ( .A(B[1]), .Z(n9) );
  INVX2 U10 ( .A(B[0]), .Z(n10) );
  XOR2X1 U11 ( .A(n11), .B(n12), .Z(DIFF[9]) );
  XOR2X1 U12 ( .A(B[9]), .B(A[9]), .Z(n12) );
  NOR2X1 U13 ( .A(n13), .B(n14), .Z(n11) );
  AND2X1 U14 ( .A(n15), .B(A[8]), .Z(n14) );
  NOR2X1 U15 ( .A(B[8]), .B(n16), .Z(n13) );
  NOR2X1 U16 ( .A(A[8]), .B(n15), .Z(n16) );
  XOR2X1 U17 ( .A(n15), .B(n18), .Z(n17) );
  XOR2X1 U18 ( .A(A[8]), .B(B[8]), .Z(n18) );
  NAND2X1 U19 ( .A(n19), .B(n20), .Z(n15) );
  NAND2X1 U20 ( .A(n21), .B(n3), .Z(n20) );
  OR2X1 U21 ( .A(n22), .B(A[7]), .Z(n21) );
  NAND2X1 U22 ( .A(A[7]), .B(n22), .Z(n19) );
  XOR2X1 U23 ( .A(n22), .B(n23), .Z(DIFF[7]) );
  XOR2X1 U24 ( .A(A[7]), .B(n3), .Z(n23) );
  NAND2X1 U25 ( .A(n24), .B(n25), .Z(n22) );
  NAND2X1 U26 ( .A(n26), .B(n4), .Z(n25) );
  OR2X1 U27 ( .A(n27), .B(A[6]), .Z(n26) );
  NAND2X1 U28 ( .A(A[6]), .B(n27), .Z(n24) );
  XOR2X1 U29 ( .A(n27), .B(n28), .Z(DIFF[6]) );
  XOR2X1 U30 ( .A(A[6]), .B(n4), .Z(n28) );
  NAND2X1 U31 ( .A(n29), .B(n30), .Z(n27) );
  NAND2X1 U32 ( .A(n31), .B(n5), .Z(n30) );
  OR2X1 U33 ( .A(n32), .B(A[5]), .Z(n31) );
  NAND2X1 U34 ( .A(A[5]), .B(n32), .Z(n29) );
  XOR2X1 U35 ( .A(n32), .B(n33), .Z(DIFF[5]) );
  XOR2X1 U36 ( .A(A[5]), .B(n5), .Z(n33) );
  NAND2X1 U37 ( .A(n34), .B(n35), .Z(n32) );
  NAND2X1 U38 ( .A(n36), .B(n6), .Z(n35) );
  OR2X1 U39 ( .A(n37), .B(A[4]), .Z(n36) );
  NAND2X1 U40 ( .A(A[4]), .B(n37), .Z(n34) );
  XOR2X1 U41 ( .A(n37), .B(n38), .Z(DIFF[4]) );
  XOR2X1 U42 ( .A(A[4]), .B(n6), .Z(n38) );
  NAND2X1 U43 ( .A(n39), .B(n40), .Z(n37) );
  NAND2X1 U44 ( .A(n41), .B(n7), .Z(n40) );
  OR2X1 U45 ( .A(n42), .B(A[3]), .Z(n41) );
  NAND2X1 U46 ( .A(A[3]), .B(n42), .Z(n39) );
  XOR2X1 U47 ( .A(n42), .B(n43), .Z(DIFF[3]) );
  XOR2X1 U48 ( .A(A[3]), .B(n7), .Z(n43) );
  NAND2X1 U49 ( .A(n44), .B(n45), .Z(n42) );
  NAND2X1 U50 ( .A(n46), .B(n8), .Z(n45) );
  OR2X1 U51 ( .A(n47), .B(A[2]), .Z(n46) );
  NAND2X1 U52 ( .A(A[2]), .B(n47), .Z(n44) );
  XOR2X1 U53 ( .A(n47), .B(n48), .Z(DIFF[2]) );
  XOR2X1 U54 ( .A(A[2]), .B(n8), .Z(n48) );
  NAND2X1 U55 ( .A(n49), .B(n50), .Z(n47) );
  NAND2X1 U56 ( .A(n51), .B(n9), .Z(n50) );
  OR2X1 U57 ( .A(n2), .B(A[1]), .Z(n51) );
  NAND2X1 U58 ( .A(A[1]), .B(n2), .Z(n49) );
  XOR2X1 U59 ( .A(n52), .B(n53), .Z(DIFF[1]) );
  XOR2X1 U60 ( .A(B[1]), .B(A[1]), .Z(n53) );
  NAND2X1 U61 ( .A(n2), .B(n54), .Z(DIFF[0]) );
  NAND2X1 U62 ( .A(A[0]), .B(n10), .Z(n54) );
  NOR2X1 U63 ( .A(n10), .B(A[0]), .Z(n52) );
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
  INVX2 U2 ( .A(B[7]), .Z(n2) );
  INVX2 U3 ( .A(B[6]), .Z(n3) );
  INVX2 U4 ( .A(B[5]), .Z(n4) );
  INVX2 U5 ( .A(B[4]), .Z(n5) );
  INVX2 U6 ( .A(B[3]), .Z(n6) );
  INVX2 U7 ( .A(B[2]), .Z(n7) );
  INVX2 U8 ( .A(B[1]), .Z(n8) );
  INVX2 U9 ( .A(n52), .Z(n9) );
  INVX2 U10 ( .A(B[0]), .Z(n10) );
  XOR2X1 U11 ( .A(n11), .B(n12), .Z(DIFF[9]) );
  XOR2X1 U12 ( .A(B[9]), .B(A[9]), .Z(n12) );
  NOR2X1 U13 ( .A(n13), .B(n14), .Z(n11) );
  AND2X1 U14 ( .A(n15), .B(A[8]), .Z(n14) );
  NOR2X1 U15 ( .A(B[8]), .B(n16), .Z(n13) );
  NOR2X1 U16 ( .A(A[8]), .B(n15), .Z(n16) );
  XOR2X1 U17 ( .A(n15), .B(n18), .Z(n17) );
  XOR2X1 U18 ( .A(A[8]), .B(B[8]), .Z(n18) );
  NAND2X1 U19 ( .A(n19), .B(n20), .Z(n15) );
  NAND2X1 U20 ( .A(n21), .B(n2), .Z(n20) );
  OR2X1 U21 ( .A(n22), .B(A[7]), .Z(n21) );
  NAND2X1 U22 ( .A(A[7]), .B(n22), .Z(n19) );
  XOR2X1 U23 ( .A(n22), .B(n23), .Z(DIFF[7]) );
  XOR2X1 U24 ( .A(A[7]), .B(n2), .Z(n23) );
  NAND2X1 U25 ( .A(n24), .B(n25), .Z(n22) );
  NAND2X1 U26 ( .A(n26), .B(n3), .Z(n25) );
  OR2X1 U27 ( .A(n27), .B(A[6]), .Z(n26) );
  NAND2X1 U28 ( .A(A[6]), .B(n27), .Z(n24) );
  XOR2X1 U29 ( .A(n27), .B(n28), .Z(DIFF[6]) );
  XOR2X1 U30 ( .A(A[6]), .B(n3), .Z(n28) );
  NAND2X1 U31 ( .A(n29), .B(n30), .Z(n27) );
  NAND2X1 U32 ( .A(n31), .B(n4), .Z(n30) );
  OR2X1 U33 ( .A(n32), .B(A[5]), .Z(n31) );
  NAND2X1 U34 ( .A(A[5]), .B(n32), .Z(n29) );
  XOR2X1 U35 ( .A(n32), .B(n33), .Z(DIFF[5]) );
  XOR2X1 U36 ( .A(A[5]), .B(n4), .Z(n33) );
  NAND2X1 U37 ( .A(n34), .B(n35), .Z(n32) );
  NAND2X1 U38 ( .A(n36), .B(n5), .Z(n35) );
  OR2X1 U39 ( .A(n37), .B(A[4]), .Z(n36) );
  NAND2X1 U40 ( .A(A[4]), .B(n37), .Z(n34) );
  XOR2X1 U41 ( .A(n37), .B(n38), .Z(DIFF[4]) );
  XOR2X1 U42 ( .A(A[4]), .B(n5), .Z(n38) );
  NAND2X1 U43 ( .A(n39), .B(n40), .Z(n37) );
  NAND2X1 U44 ( .A(n41), .B(n6), .Z(n40) );
  OR2X1 U45 ( .A(n42), .B(A[3]), .Z(n41) );
  NAND2X1 U46 ( .A(A[3]), .B(n42), .Z(n39) );
  XOR2X1 U47 ( .A(n42), .B(n43), .Z(DIFF[3]) );
  XOR2X1 U48 ( .A(A[3]), .B(n6), .Z(n43) );
  NAND2X1 U49 ( .A(n44), .B(n45), .Z(n42) );
  NAND2X1 U50 ( .A(n46), .B(n7), .Z(n45) );
  OR2X1 U51 ( .A(n47), .B(A[2]), .Z(n46) );
  NAND2X1 U52 ( .A(A[2]), .B(n47), .Z(n44) );
  XOR2X1 U53 ( .A(n47), .B(n48), .Z(DIFF[2]) );
  XOR2X1 U54 ( .A(A[2]), .B(n7), .Z(n48) );
  NAND2X1 U55 ( .A(n49), .B(n50), .Z(n47) );
  NAND2X1 U56 ( .A(n51), .B(n8), .Z(n50) );
  OR2X1 U57 ( .A(n9), .B(A[1]), .Z(n51) );
  NAND2X1 U58 ( .A(A[1]), .B(n9), .Z(n49) );
  XOR2X1 U59 ( .A(n52), .B(n53), .Z(DIFF[1]) );
  XOR2X1 U60 ( .A(B[1]), .B(A[1]), .Z(n53) );
  NAND2X1 U61 ( .A(n9), .B(n54), .Z(DIFF[0]) );
  NAND2X1 U62 ( .A(A[0]), .B(n10), .Z(n54) );
  NOR2X1 U63 ( .A(n10), .B(A[0]), .Z(n52) );
endmodule


module sobel_DW01_sub_2 ( A, B, CI, DIFF, CO );
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
  INVX2 U2 ( .A(B[7]), .Z(n2) );
  INVX2 U3 ( .A(B[6]), .Z(n3) );
  INVX2 U4 ( .A(B[5]), .Z(n4) );
  INVX2 U5 ( .A(B[4]), .Z(n5) );
  INVX2 U6 ( .A(B[3]), .Z(n6) );
  INVX2 U7 ( .A(B[2]), .Z(n7) );
  INVX2 U8 ( .A(B[1]), .Z(n8) );
  INVX2 U9 ( .A(n52), .Z(n9) );
  INVX2 U10 ( .A(B[0]), .Z(n10) );
  XOR2X1 U11 ( .A(n11), .B(n12), .Z(DIFF[9]) );
  XOR2X1 U12 ( .A(B[9]), .B(A[9]), .Z(n12) );
  NOR2X1 U13 ( .A(n13), .B(n14), .Z(n11) );
  AND2X1 U14 ( .A(n15), .B(A[8]), .Z(n14) );
  NOR2X1 U15 ( .A(B[8]), .B(n16), .Z(n13) );
  NOR2X1 U16 ( .A(A[8]), .B(n15), .Z(n16) );
  XOR2X1 U17 ( .A(n15), .B(n18), .Z(n17) );
  XOR2X1 U18 ( .A(A[8]), .B(B[8]), .Z(n18) );
  NAND2X1 U19 ( .A(n19), .B(n20), .Z(n15) );
  NAND2X1 U20 ( .A(n21), .B(n2), .Z(n20) );
  OR2X1 U21 ( .A(n22), .B(A[7]), .Z(n21) );
  NAND2X1 U22 ( .A(A[7]), .B(n22), .Z(n19) );
  XOR2X1 U23 ( .A(n22), .B(n23), .Z(DIFF[7]) );
  XOR2X1 U24 ( .A(A[7]), .B(n2), .Z(n23) );
  NAND2X1 U25 ( .A(n24), .B(n25), .Z(n22) );
  NAND2X1 U26 ( .A(n26), .B(n3), .Z(n25) );
  OR2X1 U27 ( .A(n27), .B(A[6]), .Z(n26) );
  NAND2X1 U28 ( .A(A[6]), .B(n27), .Z(n24) );
  XOR2X1 U29 ( .A(n27), .B(n28), .Z(DIFF[6]) );
  XOR2X1 U30 ( .A(A[6]), .B(n3), .Z(n28) );
  NAND2X1 U31 ( .A(n29), .B(n30), .Z(n27) );
  NAND2X1 U32 ( .A(n31), .B(n4), .Z(n30) );
  OR2X1 U33 ( .A(n32), .B(A[5]), .Z(n31) );
  NAND2X1 U34 ( .A(A[5]), .B(n32), .Z(n29) );
  XOR2X1 U35 ( .A(n32), .B(n33), .Z(DIFF[5]) );
  XOR2X1 U36 ( .A(A[5]), .B(n4), .Z(n33) );
  NAND2X1 U37 ( .A(n34), .B(n35), .Z(n32) );
  NAND2X1 U38 ( .A(n36), .B(n5), .Z(n35) );
  OR2X1 U39 ( .A(n37), .B(A[4]), .Z(n36) );
  NAND2X1 U40 ( .A(A[4]), .B(n37), .Z(n34) );
  XOR2X1 U41 ( .A(n37), .B(n38), .Z(DIFF[4]) );
  XOR2X1 U42 ( .A(A[4]), .B(n5), .Z(n38) );
  NAND2X1 U43 ( .A(n39), .B(n40), .Z(n37) );
  NAND2X1 U44 ( .A(n41), .B(n6), .Z(n40) );
  OR2X1 U45 ( .A(n42), .B(A[3]), .Z(n41) );
  NAND2X1 U46 ( .A(A[3]), .B(n42), .Z(n39) );
  XOR2X1 U47 ( .A(n42), .B(n43), .Z(DIFF[3]) );
  XOR2X1 U48 ( .A(A[3]), .B(n6), .Z(n43) );
  NAND2X1 U49 ( .A(n44), .B(n45), .Z(n42) );
  NAND2X1 U50 ( .A(n46), .B(n7), .Z(n45) );
  OR2X1 U51 ( .A(n47), .B(A[2]), .Z(n46) );
  NAND2X1 U52 ( .A(A[2]), .B(n47), .Z(n44) );
  XOR2X1 U53 ( .A(n47), .B(n48), .Z(DIFF[2]) );
  XOR2X1 U54 ( .A(A[2]), .B(n7), .Z(n48) );
  NAND2X1 U55 ( .A(n49), .B(n50), .Z(n47) );
  NAND2X1 U56 ( .A(n51), .B(n8), .Z(n50) );
  OR2X1 U57 ( .A(n9), .B(A[1]), .Z(n51) );
  NAND2X1 U58 ( .A(A[1]), .B(n9), .Z(n49) );
  XOR2X1 U59 ( .A(n52), .B(n53), .Z(DIFF[1]) );
  XOR2X1 U60 ( .A(B[1]), .B(A[1]), .Z(n53) );
  NAND2X1 U61 ( .A(n9), .B(n54), .Z(DIFF[0]) );
  NAND2X1 U62 ( .A(A[0]), .B(n10), .Z(n54) );
  NOR2X1 U63 ( .A(n10), .B(A[0]), .Z(n52) );
endmodule


module sobel_DW01_sub_3 ( A, B, CI, DIFF, CO );
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
  INVX2 U3 ( .A(B[7]), .Z(n3) );
  INVX2 U4 ( .A(B[6]), .Z(n4) );
  INVX2 U5 ( .A(B[5]), .Z(n5) );
  INVX2 U6 ( .A(B[4]), .Z(n6) );
  INVX2 U7 ( .A(B[3]), .Z(n7) );
  INVX2 U8 ( .A(B[2]), .Z(n8) );
  INVX2 U9 ( .A(B[1]), .Z(n9) );
  INVX2 U10 ( .A(B[0]), .Z(n10) );
  XOR2X1 U11 ( .A(n11), .B(n12), .Z(DIFF[9]) );
  XOR2X1 U12 ( .A(B[9]), .B(A[9]), .Z(n12) );
  NOR2X1 U13 ( .A(n13), .B(n14), .Z(n11) );
  AND2X1 U14 ( .A(n15), .B(A[8]), .Z(n14) );
  NOR2X1 U15 ( .A(B[8]), .B(n16), .Z(n13) );
  NOR2X1 U16 ( .A(A[8]), .B(n15), .Z(n16) );
  XOR2X1 U17 ( .A(n15), .B(n18), .Z(n17) );
  XOR2X1 U18 ( .A(A[8]), .B(B[8]), .Z(n18) );
  NAND2X1 U19 ( .A(n19), .B(n20), .Z(n15) );
  NAND2X1 U20 ( .A(n21), .B(n3), .Z(n20) );
  OR2X1 U21 ( .A(n22), .B(A[7]), .Z(n21) );
  NAND2X1 U22 ( .A(A[7]), .B(n22), .Z(n19) );
  XOR2X1 U23 ( .A(n22), .B(n23), .Z(DIFF[7]) );
  XOR2X1 U24 ( .A(A[7]), .B(n3), .Z(n23) );
  NAND2X1 U25 ( .A(n24), .B(n25), .Z(n22) );
  NAND2X1 U26 ( .A(n26), .B(n4), .Z(n25) );
  OR2X1 U27 ( .A(n27), .B(A[6]), .Z(n26) );
  NAND2X1 U28 ( .A(A[6]), .B(n27), .Z(n24) );
  XOR2X1 U29 ( .A(n27), .B(n28), .Z(DIFF[6]) );
  XOR2X1 U30 ( .A(A[6]), .B(n4), .Z(n28) );
  NAND2X1 U31 ( .A(n29), .B(n30), .Z(n27) );
  NAND2X1 U32 ( .A(n31), .B(n5), .Z(n30) );
  OR2X1 U33 ( .A(n32), .B(A[5]), .Z(n31) );
  NAND2X1 U34 ( .A(A[5]), .B(n32), .Z(n29) );
  XOR2X1 U35 ( .A(n32), .B(n33), .Z(DIFF[5]) );
  XOR2X1 U36 ( .A(A[5]), .B(n5), .Z(n33) );
  NAND2X1 U37 ( .A(n34), .B(n35), .Z(n32) );
  NAND2X1 U38 ( .A(n36), .B(n6), .Z(n35) );
  OR2X1 U39 ( .A(n37), .B(A[4]), .Z(n36) );
  NAND2X1 U40 ( .A(A[4]), .B(n37), .Z(n34) );
  XOR2X1 U41 ( .A(n37), .B(n38), .Z(DIFF[4]) );
  XOR2X1 U42 ( .A(A[4]), .B(n6), .Z(n38) );
  NAND2X1 U43 ( .A(n39), .B(n40), .Z(n37) );
  NAND2X1 U44 ( .A(n41), .B(n7), .Z(n40) );
  OR2X1 U45 ( .A(n42), .B(A[3]), .Z(n41) );
  NAND2X1 U46 ( .A(A[3]), .B(n42), .Z(n39) );
  XOR2X1 U47 ( .A(n42), .B(n43), .Z(DIFF[3]) );
  XOR2X1 U48 ( .A(A[3]), .B(n7), .Z(n43) );
  NAND2X1 U49 ( .A(n44), .B(n45), .Z(n42) );
  NAND2X1 U50 ( .A(n46), .B(n8), .Z(n45) );
  OR2X1 U51 ( .A(n47), .B(A[2]), .Z(n46) );
  NAND2X1 U52 ( .A(A[2]), .B(n47), .Z(n44) );
  XOR2X1 U53 ( .A(n47), .B(n48), .Z(DIFF[2]) );
  XOR2X1 U54 ( .A(A[2]), .B(n8), .Z(n48) );
  NAND2X1 U55 ( .A(n49), .B(n50), .Z(n47) );
  NAND2X1 U56 ( .A(n51), .B(n9), .Z(n50) );
  OR2X1 U57 ( .A(n2), .B(A[1]), .Z(n51) );
  NAND2X1 U58 ( .A(A[1]), .B(n2), .Z(n49) );
  XOR2X1 U59 ( .A(n52), .B(n53), .Z(DIFF[1]) );
  XOR2X1 U60 ( .A(B[1]), .B(A[1]), .Z(n53) );
  NAND2X1 U61 ( .A(n2), .B(n54), .Z(DIFF[0]) );
  NAND2X1 U62 ( .A(A[0]), .B(n10), .Z(n54) );
  NOR2X1 U63 ( .A(n10), .B(A[0]), .Z(n52) );
endmodule


module sobel_DW01_add_8 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;

  INVX2 U1 ( .A(A[7]), .Z(n1) );
  INVX2 U2 ( .A(n10), .Z(n2) );
  INVX2 U3 ( .A(A[5]), .Z(n3) );
  INVX2 U4 ( .A(n20), .Z(n4) );
  INVX2 U5 ( .A(A[3]), .Z(n5) );
  INVX2 U6 ( .A(n30), .Z(n6) );
  NAND2X1 U7 ( .A(n7), .B(n8), .Z(SUM[8]) );
  NAND2X1 U8 ( .A(B[7]), .B(n9), .Z(n8) );
  NAND2X1 U9 ( .A(n2), .B(n1), .Z(n9) );
  NAND2X1 U10 ( .A(A[7]), .B(n10), .Z(n7) );
  XOR2X1 U11 ( .A(n11), .B(n2), .Z(SUM[7]) );
  NAND2X1 U12 ( .A(n12), .B(n13), .Z(n10) );
  NAND2X1 U13 ( .A(B[6]), .B(n14), .Z(n13) );
  OR2X1 U14 ( .A(n15), .B(A[6]), .Z(n14) );
  NAND2X1 U15 ( .A(A[6]), .B(n15), .Z(n12) );
  XOR2X1 U16 ( .A(n1), .B(B[7]), .Z(n11) );
  XOR2X1 U17 ( .A(n15), .B(n16), .Z(SUM[6]) );
  XOR2X1 U18 ( .A(B[6]), .B(A[6]), .Z(n16) );
  NAND2X1 U19 ( .A(n17), .B(n18), .Z(n15) );
  NAND2X1 U20 ( .A(B[5]), .B(n19), .Z(n18) );
  NAND2X1 U21 ( .A(n4), .B(n3), .Z(n19) );
  NAND2X1 U22 ( .A(A[5]), .B(n20), .Z(n17) );
  XOR2X1 U23 ( .A(n21), .B(n4), .Z(SUM[5]) );
  NAND2X1 U24 ( .A(n22), .B(n23), .Z(n20) );
  NAND2X1 U25 ( .A(B[4]), .B(n24), .Z(n23) );
  OR2X1 U26 ( .A(n25), .B(A[4]), .Z(n24) );
  NAND2X1 U27 ( .A(A[4]), .B(n25), .Z(n22) );
  XOR2X1 U28 ( .A(n3), .B(B[5]), .Z(n21) );
  XOR2X1 U29 ( .A(n25), .B(n26), .Z(SUM[4]) );
  XOR2X1 U30 ( .A(B[4]), .B(A[4]), .Z(n26) );
  NAND2X1 U31 ( .A(n27), .B(n28), .Z(n25) );
  NAND2X1 U32 ( .A(B[3]), .B(n29), .Z(n28) );
  NAND2X1 U33 ( .A(n6), .B(n5), .Z(n29) );
  NAND2X1 U34 ( .A(A[3]), .B(n30), .Z(n27) );
  XOR2X1 U35 ( .A(n31), .B(n6), .Z(SUM[3]) );
  NAND2X1 U36 ( .A(n32), .B(n33), .Z(n30) );
  NAND2X1 U37 ( .A(B[2]), .B(n34), .Z(n33) );
  OR2X1 U38 ( .A(n35), .B(A[2]), .Z(n34) );
  NAND2X1 U39 ( .A(A[2]), .B(n35), .Z(n32) );
  XOR2X1 U40 ( .A(n5), .B(B[3]), .Z(n31) );
  XOR2X1 U41 ( .A(n35), .B(n36), .Z(SUM[2]) );
  XOR2X1 U42 ( .A(B[2]), .B(A[2]), .Z(n36) );
  NAND2X1 U43 ( .A(n37), .B(n38), .Z(n35) );
  NAND2X1 U44 ( .A(B[1]), .B(n39), .Z(n38) );
  OR2X1 U45 ( .A(A[1]), .B(n40), .Z(n39) );
  NAND2X1 U46 ( .A(A[1]), .B(n40), .Z(n37) );
  XOR2X1 U47 ( .A(n40), .B(n41), .Z(SUM[1]) );
  XOR2X1 U48 ( .A(B[1]), .B(A[1]), .Z(n41) );
  AND2X1 U49 ( .A(B[0]), .B(A[0]), .Z(n40) );
  XOR2X1 U50 ( .A(B[0]), .B(A[0]), .Z(SUM[0]) );
endmodule


module sobel_DW01_add_7 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  INVX2 U1 ( .A(A[8]), .Z(n1) );
  INVX2 U2 ( .A(n10), .Z(n2) );
  INVX2 U3 ( .A(A[6]), .Z(n3) );
  INVX2 U4 ( .A(n20), .Z(n4) );
  INVX2 U5 ( .A(A[4]), .Z(n5) );
  INVX2 U6 ( .A(n30), .Z(n6) );
  NAND2X1 U7 ( .A(n7), .B(n8), .Z(SUM[9]) );
  NAND2X1 U8 ( .A(B[8]), .B(n9), .Z(n8) );
  NAND2X1 U9 ( .A(n2), .B(n1), .Z(n9) );
  NAND2X1 U10 ( .A(A[8]), .B(n10), .Z(n7) );
  XOR2X1 U11 ( .A(n11), .B(n2), .Z(SUM[8]) );
  NAND2X1 U12 ( .A(n12), .B(n13), .Z(n10) );
  NAND2X1 U13 ( .A(B[7]), .B(n14), .Z(n13) );
  OR2X1 U14 ( .A(n15), .B(A[7]), .Z(n14) );
  NAND2X1 U15 ( .A(A[7]), .B(n15), .Z(n12) );
  XOR2X1 U16 ( .A(n1), .B(B[8]), .Z(n11) );
  XOR2X1 U17 ( .A(n15), .B(n16), .Z(SUM[7]) );
  XOR2X1 U18 ( .A(B[7]), .B(A[7]), .Z(n16) );
  NAND2X1 U19 ( .A(n17), .B(n18), .Z(n15) );
  NAND2X1 U20 ( .A(B[6]), .B(n19), .Z(n18) );
  NAND2X1 U21 ( .A(n4), .B(n3), .Z(n19) );
  NAND2X1 U22 ( .A(A[6]), .B(n20), .Z(n17) );
  XOR2X1 U23 ( .A(n21), .B(n4), .Z(SUM[6]) );
  NAND2X1 U24 ( .A(n22), .B(n23), .Z(n20) );
  NAND2X1 U25 ( .A(B[5]), .B(n24), .Z(n23) );
  OR2X1 U26 ( .A(n25), .B(A[5]), .Z(n24) );
  NAND2X1 U27 ( .A(A[5]), .B(n25), .Z(n22) );
  XOR2X1 U28 ( .A(n3), .B(B[6]), .Z(n21) );
  XOR2X1 U29 ( .A(n25), .B(n26), .Z(SUM[5]) );
  XOR2X1 U30 ( .A(B[5]), .B(A[5]), .Z(n26) );
  NAND2X1 U31 ( .A(n27), .B(n28), .Z(n25) );
  NAND2X1 U32 ( .A(B[4]), .B(n29), .Z(n28) );
  NAND2X1 U33 ( .A(n6), .B(n5), .Z(n29) );
  NAND2X1 U34 ( .A(A[4]), .B(n30), .Z(n27) );
  XOR2X1 U35 ( .A(n31), .B(n6), .Z(SUM[4]) );
  NAND2X1 U36 ( .A(n32), .B(n33), .Z(n30) );
  NAND2X1 U37 ( .A(B[3]), .B(n34), .Z(n33) );
  OR2X1 U38 ( .A(n35), .B(A[3]), .Z(n34) );
  NAND2X1 U39 ( .A(A[3]), .B(n35), .Z(n32) );
  XOR2X1 U40 ( .A(n5), .B(B[4]), .Z(n31) );
  XOR2X1 U41 ( .A(n35), .B(n36), .Z(SUM[3]) );
  XOR2X1 U42 ( .A(B[3]), .B(A[3]), .Z(n36) );
  NAND2X1 U43 ( .A(n37), .B(n38), .Z(n35) );
  NAND2X1 U44 ( .A(B[2]), .B(n39), .Z(n38) );
  OR2X1 U45 ( .A(A[2]), .B(n40), .Z(n39) );
  NAND2X1 U46 ( .A(A[2]), .B(n40), .Z(n37) );
  XOR2X1 U47 ( .A(n40), .B(n41), .Z(SUM[2]) );
  XOR2X1 U48 ( .A(B[2]), .B(A[2]), .Z(n41) );
  AND2X1 U49 ( .A(B[1]), .B(A[1]), .Z(n40) );
  XOR2X1 U50 ( .A(B[1]), .B(A[1]), .Z(SUM[1]) );
endmodule


module sobel_DW01_add_4 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;

  INVX2 U1 ( .A(A[7]), .Z(n1) );
  INVX2 U2 ( .A(n10), .Z(n2) );
  INVX2 U3 ( .A(A[5]), .Z(n3) );
  INVX2 U4 ( .A(n20), .Z(n4) );
  INVX2 U5 ( .A(A[3]), .Z(n5) );
  INVX2 U6 ( .A(n30), .Z(n6) );
  NAND2X1 U7 ( .A(n7), .B(n8), .Z(SUM[8]) );
  NAND2X1 U8 ( .A(B[7]), .B(n9), .Z(n8) );
  NAND2X1 U9 ( .A(n2), .B(n1), .Z(n9) );
  NAND2X1 U10 ( .A(A[7]), .B(n10), .Z(n7) );
  XOR2X1 U11 ( .A(n11), .B(n2), .Z(SUM[7]) );
  NAND2X1 U12 ( .A(n12), .B(n13), .Z(n10) );
  NAND2X1 U13 ( .A(B[6]), .B(n14), .Z(n13) );
  OR2X1 U14 ( .A(n15), .B(A[6]), .Z(n14) );
  NAND2X1 U15 ( .A(A[6]), .B(n15), .Z(n12) );
  XOR2X1 U16 ( .A(n1), .B(B[7]), .Z(n11) );
  XOR2X1 U17 ( .A(n15), .B(n16), .Z(SUM[6]) );
  XOR2X1 U18 ( .A(B[6]), .B(A[6]), .Z(n16) );
  NAND2X1 U19 ( .A(n17), .B(n18), .Z(n15) );
  NAND2X1 U20 ( .A(B[5]), .B(n19), .Z(n18) );
  NAND2X1 U21 ( .A(n4), .B(n3), .Z(n19) );
  NAND2X1 U22 ( .A(A[5]), .B(n20), .Z(n17) );
  XOR2X1 U23 ( .A(n21), .B(n4), .Z(SUM[5]) );
  NAND2X1 U24 ( .A(n22), .B(n23), .Z(n20) );
  NAND2X1 U25 ( .A(B[4]), .B(n24), .Z(n23) );
  OR2X1 U26 ( .A(n25), .B(A[4]), .Z(n24) );
  NAND2X1 U27 ( .A(A[4]), .B(n25), .Z(n22) );
  XOR2X1 U28 ( .A(n3), .B(B[5]), .Z(n21) );
  XOR2X1 U29 ( .A(n25), .B(n26), .Z(SUM[4]) );
  XOR2X1 U30 ( .A(B[4]), .B(A[4]), .Z(n26) );
  NAND2X1 U31 ( .A(n27), .B(n28), .Z(n25) );
  NAND2X1 U32 ( .A(B[3]), .B(n29), .Z(n28) );
  NAND2X1 U33 ( .A(n6), .B(n5), .Z(n29) );
  NAND2X1 U34 ( .A(A[3]), .B(n30), .Z(n27) );
  XOR2X1 U35 ( .A(n31), .B(n6), .Z(SUM[3]) );
  NAND2X1 U36 ( .A(n32), .B(n33), .Z(n30) );
  NAND2X1 U37 ( .A(B[2]), .B(n34), .Z(n33) );
  OR2X1 U38 ( .A(n35), .B(A[2]), .Z(n34) );
  NAND2X1 U39 ( .A(A[2]), .B(n35), .Z(n32) );
  XOR2X1 U40 ( .A(n5), .B(B[3]), .Z(n31) );
  XOR2X1 U41 ( .A(n35), .B(n36), .Z(SUM[2]) );
  XOR2X1 U42 ( .A(B[2]), .B(A[2]), .Z(n36) );
  NAND2X1 U43 ( .A(n37), .B(n38), .Z(n35) );
  NAND2X1 U44 ( .A(B[1]), .B(n39), .Z(n38) );
  OR2X1 U45 ( .A(A[1]), .B(n40), .Z(n39) );
  NAND2X1 U46 ( .A(A[1]), .B(n40), .Z(n37) );
  XOR2X1 U47 ( .A(n40), .B(n41), .Z(SUM[1]) );
  XOR2X1 U48 ( .A(B[1]), .B(A[1]), .Z(n41) );
  AND2X1 U49 ( .A(B[0]), .B(A[0]), .Z(n40) );
  XOR2X1 U50 ( .A(B[0]), .B(A[0]), .Z(SUM[0]) );
endmodule


module sobel_DW01_add_3 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  INVX2 U1 ( .A(n10), .Z(n1) );
  INVX2 U2 ( .A(n20), .Z(n2) );
  INVX2 U3 ( .A(n30), .Z(n3) );
  INVX2 U4 ( .A(A[8]), .Z(n4) );
  INVX2 U5 ( .A(A[6]), .Z(n5) );
  INVX2 U6 ( .A(A[4]), .Z(n6) );
  NAND2X1 U7 ( .A(n7), .B(n8), .Z(SUM[9]) );
  NAND2X1 U8 ( .A(B[8]), .B(n9), .Z(n8) );
  NAND2X1 U9 ( .A(n1), .B(n4), .Z(n9) );
  NAND2X1 U10 ( .A(A[8]), .B(n10), .Z(n7) );
  XOR2X1 U11 ( .A(n11), .B(n1), .Z(SUM[8]) );
  NAND2X1 U12 ( .A(n12), .B(n13), .Z(n10) );
  NAND2X1 U13 ( .A(B[7]), .B(n14), .Z(n13) );
  OR2X1 U14 ( .A(n15), .B(A[7]), .Z(n14) );
  NAND2X1 U15 ( .A(A[7]), .B(n15), .Z(n12) );
  XOR2X1 U16 ( .A(n4), .B(B[8]), .Z(n11) );
  XOR2X1 U17 ( .A(n15), .B(n16), .Z(SUM[7]) );
  XOR2X1 U18 ( .A(B[7]), .B(A[7]), .Z(n16) );
  NAND2X1 U19 ( .A(n17), .B(n18), .Z(n15) );
  NAND2X1 U20 ( .A(B[6]), .B(n19), .Z(n18) );
  NAND2X1 U21 ( .A(n2), .B(n5), .Z(n19) );
  NAND2X1 U22 ( .A(A[6]), .B(n20), .Z(n17) );
  XOR2X1 U23 ( .A(n21), .B(n2), .Z(SUM[6]) );
  NAND2X1 U24 ( .A(n22), .B(n23), .Z(n20) );
  NAND2X1 U25 ( .A(B[5]), .B(n24), .Z(n23) );
  OR2X1 U26 ( .A(n25), .B(A[5]), .Z(n24) );
  NAND2X1 U27 ( .A(A[5]), .B(n25), .Z(n22) );
  XOR2X1 U28 ( .A(n5), .B(B[6]), .Z(n21) );
  XOR2X1 U29 ( .A(n25), .B(n26), .Z(SUM[5]) );
  XOR2X1 U30 ( .A(B[5]), .B(A[5]), .Z(n26) );
  NAND2X1 U31 ( .A(n27), .B(n28), .Z(n25) );
  NAND2X1 U32 ( .A(B[4]), .B(n29), .Z(n28) );
  NAND2X1 U33 ( .A(n3), .B(n6), .Z(n29) );
  NAND2X1 U34 ( .A(A[4]), .B(n30), .Z(n27) );
  XOR2X1 U35 ( .A(n31), .B(n3), .Z(SUM[4]) );
  NAND2X1 U36 ( .A(n32), .B(n33), .Z(n30) );
  NAND2X1 U37 ( .A(B[3]), .B(n34), .Z(n33) );
  OR2X1 U38 ( .A(n35), .B(A[3]), .Z(n34) );
  NAND2X1 U39 ( .A(A[3]), .B(n35), .Z(n32) );
  XOR2X1 U40 ( .A(n6), .B(B[4]), .Z(n31) );
  XOR2X1 U41 ( .A(n35), .B(n36), .Z(SUM[3]) );
  XOR2X1 U42 ( .A(B[3]), .B(A[3]), .Z(n36) );
  NAND2X1 U43 ( .A(n37), .B(n38), .Z(n35) );
  NAND2X1 U44 ( .A(B[2]), .B(n39), .Z(n38) );
  OR2X1 U45 ( .A(A[2]), .B(n40), .Z(n39) );
  NAND2X1 U46 ( .A(A[2]), .B(n40), .Z(n37) );
  XOR2X1 U47 ( .A(n40), .B(n41), .Z(SUM[2]) );
  XOR2X1 U48 ( .A(B[2]), .B(A[2]), .Z(n41) );
  AND2X1 U49 ( .A(B[1]), .B(A[1]), .Z(n40) );
  XOR2X1 U50 ( .A(B[1]), .B(A[1]), .Z(SUM[1]) );
endmodule


module sobel_DW01_add_6 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;

  INVX2 U1 ( .A(A[7]), .Z(n1) );
  INVX2 U2 ( .A(n10), .Z(n2) );
  INVX2 U3 ( .A(A[5]), .Z(n3) );
  INVX2 U4 ( .A(n20), .Z(n4) );
  INVX2 U5 ( .A(A[3]), .Z(n5) );
  INVX2 U6 ( .A(n30), .Z(n6) );
  NAND2X1 U7 ( .A(n7), .B(n8), .Z(SUM[8]) );
  NAND2X1 U8 ( .A(B[7]), .B(n9), .Z(n8) );
  NAND2X1 U9 ( .A(n2), .B(n1), .Z(n9) );
  NAND2X1 U10 ( .A(A[7]), .B(n10), .Z(n7) );
  XOR2X1 U11 ( .A(n11), .B(n2), .Z(SUM[7]) );
  NAND2X1 U12 ( .A(n12), .B(n13), .Z(n10) );
  NAND2X1 U13 ( .A(B[6]), .B(n14), .Z(n13) );
  OR2X1 U14 ( .A(n15), .B(A[6]), .Z(n14) );
  NAND2X1 U15 ( .A(A[6]), .B(n15), .Z(n12) );
  XOR2X1 U16 ( .A(n1), .B(B[7]), .Z(n11) );
  XOR2X1 U17 ( .A(n15), .B(n16), .Z(SUM[6]) );
  XOR2X1 U18 ( .A(B[6]), .B(A[6]), .Z(n16) );
  NAND2X1 U19 ( .A(n17), .B(n18), .Z(n15) );
  NAND2X1 U20 ( .A(B[5]), .B(n19), .Z(n18) );
  NAND2X1 U21 ( .A(n4), .B(n3), .Z(n19) );
  NAND2X1 U22 ( .A(A[5]), .B(n20), .Z(n17) );
  XOR2X1 U23 ( .A(n21), .B(n4), .Z(SUM[5]) );
  NAND2X1 U24 ( .A(n22), .B(n23), .Z(n20) );
  NAND2X1 U25 ( .A(B[4]), .B(n24), .Z(n23) );
  OR2X1 U26 ( .A(n25), .B(A[4]), .Z(n24) );
  NAND2X1 U27 ( .A(A[4]), .B(n25), .Z(n22) );
  XOR2X1 U28 ( .A(n3), .B(B[5]), .Z(n21) );
  XOR2X1 U29 ( .A(n25), .B(n26), .Z(SUM[4]) );
  XOR2X1 U30 ( .A(B[4]), .B(A[4]), .Z(n26) );
  NAND2X1 U31 ( .A(n27), .B(n28), .Z(n25) );
  NAND2X1 U32 ( .A(B[3]), .B(n29), .Z(n28) );
  NAND2X1 U33 ( .A(n6), .B(n5), .Z(n29) );
  NAND2X1 U34 ( .A(A[3]), .B(n30), .Z(n27) );
  XOR2X1 U35 ( .A(n31), .B(n6), .Z(SUM[3]) );
  NAND2X1 U36 ( .A(n32), .B(n33), .Z(n30) );
  NAND2X1 U37 ( .A(B[2]), .B(n34), .Z(n33) );
  OR2X1 U38 ( .A(n35), .B(A[2]), .Z(n34) );
  NAND2X1 U39 ( .A(A[2]), .B(n35), .Z(n32) );
  XOR2X1 U40 ( .A(n5), .B(B[3]), .Z(n31) );
  XOR2X1 U41 ( .A(n35), .B(n36), .Z(SUM[2]) );
  XOR2X1 U42 ( .A(B[2]), .B(A[2]), .Z(n36) );
  NAND2X1 U43 ( .A(n37), .B(n38), .Z(n35) );
  NAND2X1 U44 ( .A(B[1]), .B(n39), .Z(n38) );
  OR2X1 U45 ( .A(A[1]), .B(n40), .Z(n39) );
  NAND2X1 U46 ( .A(A[1]), .B(n40), .Z(n37) );
  XOR2X1 U47 ( .A(n40), .B(n41), .Z(SUM[1]) );
  XOR2X1 U48 ( .A(B[1]), .B(A[1]), .Z(n41) );
  AND2X1 U49 ( .A(B[0]), .B(A[0]), .Z(n40) );
  XOR2X1 U50 ( .A(B[0]), .B(A[0]), .Z(SUM[0]) );
endmodule


module sobel_DW01_add_5 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  INVX2 U1 ( .A(n10), .Z(n1) );
  INVX2 U2 ( .A(n20), .Z(n2) );
  INVX2 U3 ( .A(n30), .Z(n3) );
  INVX2 U4 ( .A(A[8]), .Z(n4) );
  INVX2 U5 ( .A(A[6]), .Z(n5) );
  INVX2 U6 ( .A(A[4]), .Z(n6) );
  NAND2X1 U7 ( .A(n7), .B(n8), .Z(SUM[9]) );
  NAND2X1 U8 ( .A(B[8]), .B(n9), .Z(n8) );
  NAND2X1 U9 ( .A(n1), .B(n4), .Z(n9) );
  NAND2X1 U10 ( .A(A[8]), .B(n10), .Z(n7) );
  XOR2X1 U11 ( .A(n11), .B(n1), .Z(SUM[8]) );
  NAND2X1 U12 ( .A(n12), .B(n13), .Z(n10) );
  NAND2X1 U13 ( .A(B[7]), .B(n14), .Z(n13) );
  OR2X1 U14 ( .A(n15), .B(A[7]), .Z(n14) );
  NAND2X1 U15 ( .A(A[7]), .B(n15), .Z(n12) );
  XOR2X1 U16 ( .A(n4), .B(B[8]), .Z(n11) );
  XOR2X1 U17 ( .A(n15), .B(n16), .Z(SUM[7]) );
  XOR2X1 U18 ( .A(B[7]), .B(A[7]), .Z(n16) );
  NAND2X1 U19 ( .A(n17), .B(n18), .Z(n15) );
  NAND2X1 U20 ( .A(B[6]), .B(n19), .Z(n18) );
  NAND2X1 U21 ( .A(n2), .B(n5), .Z(n19) );
  NAND2X1 U22 ( .A(A[6]), .B(n20), .Z(n17) );
  XOR2X1 U23 ( .A(n21), .B(n2), .Z(SUM[6]) );
  NAND2X1 U24 ( .A(n22), .B(n23), .Z(n20) );
  NAND2X1 U25 ( .A(B[5]), .B(n24), .Z(n23) );
  OR2X1 U26 ( .A(n25), .B(A[5]), .Z(n24) );
  NAND2X1 U27 ( .A(A[5]), .B(n25), .Z(n22) );
  XOR2X1 U28 ( .A(n5), .B(B[6]), .Z(n21) );
  XOR2X1 U29 ( .A(n25), .B(n26), .Z(SUM[5]) );
  XOR2X1 U30 ( .A(B[5]), .B(A[5]), .Z(n26) );
  NAND2X1 U31 ( .A(n27), .B(n28), .Z(n25) );
  NAND2X1 U32 ( .A(B[4]), .B(n29), .Z(n28) );
  NAND2X1 U33 ( .A(n3), .B(n6), .Z(n29) );
  NAND2X1 U34 ( .A(A[4]), .B(n30), .Z(n27) );
  XOR2X1 U35 ( .A(n31), .B(n3), .Z(SUM[4]) );
  NAND2X1 U36 ( .A(n32), .B(n33), .Z(n30) );
  NAND2X1 U37 ( .A(B[3]), .B(n34), .Z(n33) );
  OR2X1 U38 ( .A(n35), .B(A[3]), .Z(n34) );
  NAND2X1 U39 ( .A(A[3]), .B(n35), .Z(n32) );
  XOR2X1 U40 ( .A(n6), .B(B[4]), .Z(n31) );
  XOR2X1 U41 ( .A(n35), .B(n36), .Z(SUM[3]) );
  XOR2X1 U42 ( .A(B[3]), .B(A[3]), .Z(n36) );
  NAND2X1 U43 ( .A(n37), .B(n38), .Z(n35) );
  NAND2X1 U44 ( .A(B[2]), .B(n39), .Z(n38) );
  OR2X1 U45 ( .A(A[2]), .B(n40), .Z(n39) );
  NAND2X1 U46 ( .A(A[2]), .B(n40), .Z(n37) );
  XOR2X1 U47 ( .A(n40), .B(n41), .Z(SUM[2]) );
  XOR2X1 U48 ( .A(B[2]), .B(A[2]), .Z(n41) );
  AND2X1 U49 ( .A(B[1]), .B(A[1]), .Z(n40) );
  XOR2X1 U50 ( .A(B[1]), .B(A[1]), .Z(SUM[1]) );
endmodule


module sobel_DW01_add_2 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;

  INVX2 U1 ( .A(A[7]), .Z(n1) );
  INVX2 U2 ( .A(n10), .Z(n2) );
  INVX2 U3 ( .A(A[5]), .Z(n3) );
  INVX2 U4 ( .A(n20), .Z(n4) );
  INVX2 U5 ( .A(A[3]), .Z(n5) );
  INVX2 U6 ( .A(n30), .Z(n6) );
  NAND2X1 U7 ( .A(n7), .B(n8), .Z(SUM[8]) );
  NAND2X1 U8 ( .A(B[7]), .B(n9), .Z(n8) );
  NAND2X1 U9 ( .A(n2), .B(n1), .Z(n9) );
  NAND2X1 U10 ( .A(A[7]), .B(n10), .Z(n7) );
  XOR2X1 U11 ( .A(n11), .B(n2), .Z(SUM[7]) );
  NAND2X1 U12 ( .A(n12), .B(n13), .Z(n10) );
  NAND2X1 U13 ( .A(B[6]), .B(n14), .Z(n13) );
  OR2X1 U14 ( .A(n15), .B(A[6]), .Z(n14) );
  NAND2X1 U15 ( .A(A[6]), .B(n15), .Z(n12) );
  XOR2X1 U16 ( .A(n1), .B(B[7]), .Z(n11) );
  XOR2X1 U17 ( .A(n15), .B(n16), .Z(SUM[6]) );
  XOR2X1 U18 ( .A(B[6]), .B(A[6]), .Z(n16) );
  NAND2X1 U19 ( .A(n17), .B(n18), .Z(n15) );
  NAND2X1 U20 ( .A(B[5]), .B(n19), .Z(n18) );
  NAND2X1 U21 ( .A(n4), .B(n3), .Z(n19) );
  NAND2X1 U22 ( .A(A[5]), .B(n20), .Z(n17) );
  XOR2X1 U23 ( .A(n21), .B(n4), .Z(SUM[5]) );
  NAND2X1 U24 ( .A(n22), .B(n23), .Z(n20) );
  NAND2X1 U25 ( .A(B[4]), .B(n24), .Z(n23) );
  OR2X1 U26 ( .A(n25), .B(A[4]), .Z(n24) );
  NAND2X1 U27 ( .A(A[4]), .B(n25), .Z(n22) );
  XOR2X1 U28 ( .A(n3), .B(B[5]), .Z(n21) );
  XOR2X1 U29 ( .A(n25), .B(n26), .Z(SUM[4]) );
  XOR2X1 U30 ( .A(B[4]), .B(A[4]), .Z(n26) );
  NAND2X1 U31 ( .A(n27), .B(n28), .Z(n25) );
  NAND2X1 U32 ( .A(B[3]), .B(n29), .Z(n28) );
  NAND2X1 U33 ( .A(n6), .B(n5), .Z(n29) );
  NAND2X1 U34 ( .A(A[3]), .B(n30), .Z(n27) );
  XOR2X1 U35 ( .A(n31), .B(n6), .Z(SUM[3]) );
  NAND2X1 U36 ( .A(n32), .B(n33), .Z(n30) );
  NAND2X1 U37 ( .A(B[2]), .B(n34), .Z(n33) );
  OR2X1 U38 ( .A(n35), .B(A[2]), .Z(n34) );
  NAND2X1 U39 ( .A(A[2]), .B(n35), .Z(n32) );
  XOR2X1 U40 ( .A(n5), .B(B[3]), .Z(n31) );
  XOR2X1 U41 ( .A(n35), .B(n36), .Z(SUM[2]) );
  XOR2X1 U42 ( .A(B[2]), .B(A[2]), .Z(n36) );
  NAND2X1 U43 ( .A(n37), .B(n38), .Z(n35) );
  NAND2X1 U44 ( .A(B[1]), .B(n39), .Z(n38) );
  OR2X1 U45 ( .A(A[1]), .B(n40), .Z(n39) );
  NAND2X1 U46 ( .A(A[1]), .B(n40), .Z(n37) );
  XOR2X1 U47 ( .A(n40), .B(n41), .Z(SUM[1]) );
  XOR2X1 U48 ( .A(B[1]), .B(A[1]), .Z(n41) );
  AND2X1 U49 ( .A(B[0]), .B(A[0]), .Z(n40) );
  XOR2X1 U50 ( .A(B[0]), .B(A[0]), .Z(SUM[0]) );
endmodule


module sobel_DW01_add_1 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   \B[0] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;
  assign SUM[0] = \B[0] ;
  assign \B[0]  = B[0];

  INVX2 U1 ( .A(n10), .Z(n1) );
  INVX2 U2 ( .A(n20), .Z(n2) );
  INVX2 U3 ( .A(n30), .Z(n3) );
  INVX2 U4 ( .A(A[8]), .Z(n4) );
  INVX2 U5 ( .A(A[6]), .Z(n5) );
  INVX2 U6 ( .A(A[4]), .Z(n6) );
  NAND2X1 U7 ( .A(n7), .B(n8), .Z(SUM[9]) );
  NAND2X1 U8 ( .A(B[8]), .B(n9), .Z(n8) );
  NAND2X1 U9 ( .A(n1), .B(n4), .Z(n9) );
  NAND2X1 U10 ( .A(A[8]), .B(n10), .Z(n7) );
  XOR2X1 U11 ( .A(n11), .B(n1), .Z(SUM[8]) );
  NAND2X1 U12 ( .A(n12), .B(n13), .Z(n10) );
  NAND2X1 U13 ( .A(B[7]), .B(n14), .Z(n13) );
  OR2X1 U14 ( .A(n15), .B(A[7]), .Z(n14) );
  NAND2X1 U15 ( .A(A[7]), .B(n15), .Z(n12) );
  XOR2X1 U16 ( .A(n4), .B(B[8]), .Z(n11) );
  XOR2X1 U17 ( .A(n15), .B(n16), .Z(SUM[7]) );
  XOR2X1 U18 ( .A(B[7]), .B(A[7]), .Z(n16) );
  NAND2X1 U19 ( .A(n17), .B(n18), .Z(n15) );
  NAND2X1 U20 ( .A(B[6]), .B(n19), .Z(n18) );
  NAND2X1 U21 ( .A(n2), .B(n5), .Z(n19) );
  NAND2X1 U22 ( .A(A[6]), .B(n20), .Z(n17) );
  XOR2X1 U23 ( .A(n21), .B(n2), .Z(SUM[6]) );
  NAND2X1 U24 ( .A(n22), .B(n23), .Z(n20) );
  NAND2X1 U25 ( .A(B[5]), .B(n24), .Z(n23) );
  OR2X1 U26 ( .A(n25), .B(A[5]), .Z(n24) );
  NAND2X1 U27 ( .A(A[5]), .B(n25), .Z(n22) );
  XOR2X1 U28 ( .A(n5), .B(B[6]), .Z(n21) );
  XOR2X1 U29 ( .A(n25), .B(n26), .Z(SUM[5]) );
  XOR2X1 U30 ( .A(B[5]), .B(A[5]), .Z(n26) );
  NAND2X1 U31 ( .A(n27), .B(n28), .Z(n25) );
  NAND2X1 U32 ( .A(B[4]), .B(n29), .Z(n28) );
  NAND2X1 U33 ( .A(n3), .B(n6), .Z(n29) );
  NAND2X1 U34 ( .A(A[4]), .B(n30), .Z(n27) );
  XOR2X1 U35 ( .A(n31), .B(n3), .Z(SUM[4]) );
  NAND2X1 U36 ( .A(n32), .B(n33), .Z(n30) );
  NAND2X1 U37 ( .A(B[3]), .B(n34), .Z(n33) );
  OR2X1 U38 ( .A(n35), .B(A[3]), .Z(n34) );
  NAND2X1 U39 ( .A(A[3]), .B(n35), .Z(n32) );
  XOR2X1 U40 ( .A(n6), .B(B[4]), .Z(n31) );
  XOR2X1 U41 ( .A(n35), .B(n36), .Z(SUM[3]) );
  XOR2X1 U42 ( .A(B[3]), .B(A[3]), .Z(n36) );
  NAND2X1 U43 ( .A(n37), .B(n38), .Z(n35) );
  NAND2X1 U44 ( .A(B[2]), .B(n39), .Z(n38) );
  OR2X1 U45 ( .A(A[2]), .B(n40), .Z(n39) );
  NAND2X1 U46 ( .A(A[2]), .B(n40), .Z(n37) );
  XOR2X1 U47 ( .A(n40), .B(n41), .Z(SUM[2]) );
  XOR2X1 U48 ( .A(B[2]), .B(A[2]), .Z(n41) );
  AND2X1 U49 ( .A(B[1]), .B(A[1]), .Z(n40) );
  XOR2X1 U50 ( .A(B[1]), .B(A[1]), .Z(SUM[1]) );
endmodule


module sobel ( row, col, inputPixels, clk_pix, clk, start, reset, out, done );
  input [8:0] row;
  input [9:0] col;
  input [63:0] inputPixels;
  output [7:0] out;
  input clk_pix, clk, start, reset;
  output done;
  wire   N11, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25,
         N26, N27, N28, N29, N30, N31, N32, N33, N35, N36, N37, N38, N39, N40,
         N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54,
         \filter_step[1] , N81, N82, N83, N84, N85, N86, N87, N88, N89, N90,
         N101, N102, N103, N104, N105, N106, N107, N108, N109, N110, N121,
         N122, N123, N124, N125, N126, N127, N128, N129, N130, N141, N142,
         N143, N144, N145, N146, N147, N148, N149, N150, N214, N226, n57, n62,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, N140, N79, N78, N77, N76, N75, N74, N73, N72,
         N71, N99, N98, N97, N96, N95, N94, N93, N92, N91, N119, N118, N117,
         N116, N115, N114, N113, N112, N111, N139, N138, N137, N136, N135,
         N134, N133, N132, N131, n310, n311, n312, n313, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368, n369, n370, n371,
         n372, n373, n374, n375, n376, n377, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413;
  wire   [9:0] gx1;
  wire   [9:0] gx2;
  wire   [9:0] gy1;
  wire   [9:0] gy2;
  wire   [9:0] gx;
  wire   [9:0] gy;
  wire   [10:7] g_mag;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10;

  DFFQX1 \filter_step_reg[1]  ( .D(n306), .CLK(clk), .Q(\filter_step[1] ) );
  DFFQX1 \gx1_reg[9]  ( .D(n296), .CLK(clk), .Q(gx1[9]) );
  DFFQX1 \gx1_reg[8]  ( .D(n297), .CLK(clk), .Q(gx1[8]) );
  DFFQX1 \gx1_reg[7]  ( .D(n298), .CLK(clk), .Q(gx1[7]) );
  DFFQX1 \gx1_reg[6]  ( .D(n299), .CLK(clk), .Q(gx1[6]) );
  DFFQX1 \gx1_reg[5]  ( .D(n300), .CLK(clk), .Q(gx1[5]) );
  DFFQX1 \gx1_reg[4]  ( .D(n301), .CLK(clk), .Q(gx1[4]) );
  DFFQX1 \gx1_reg[3]  ( .D(n302), .CLK(clk), .Q(gx1[3]) );
  DFFQX1 \gx1_reg[2]  ( .D(n303), .CLK(clk), .Q(gx1[2]) );
  DFFQX1 \gx1_reg[1]  ( .D(n304), .CLK(clk), .Q(gx1[1]) );
  DFFQX1 \gx1_reg[0]  ( .D(n305), .CLK(clk), .Q(gx1[0]) );
  DFFQX1 \gx2_reg[9]  ( .D(n286), .CLK(clk), .Q(gx2[9]) );
  DFFQX1 \gx2_reg[8]  ( .D(n287), .CLK(clk), .Q(gx2[8]) );
  DFFQX1 \gx2_reg[7]  ( .D(n288), .CLK(clk), .Q(gx2[7]) );
  DFFQX1 \gx2_reg[6]  ( .D(n289), .CLK(clk), .Q(gx2[6]) );
  DFFQX1 \gx2_reg[5]  ( .D(n290), .CLK(clk), .Q(gx2[5]) );
  DFFQX1 \gx2_reg[4]  ( .D(n291), .CLK(clk), .Q(gx2[4]) );
  DFFQX1 \gx2_reg[3]  ( .D(n292), .CLK(clk), .Q(gx2[3]) );
  DFFQX1 \gx2_reg[2]  ( .D(n293), .CLK(clk), .Q(gx2[2]) );
  DFFQX1 \gx2_reg[1]  ( .D(n294), .CLK(clk), .Q(gx2[1]) );
  DFFQX1 \gx2_reg[0]  ( .D(n295), .CLK(clk), .Q(gx2[0]) );
  DFFQX1 \gy2_reg[9]  ( .D(n276), .CLK(clk), .Q(gy2[9]) );
  DFFQX1 \gy2_reg[8]  ( .D(n277), .CLK(clk), .Q(gy2[8]) );
  DFFQX1 \gy2_reg[7]  ( .D(n278), .CLK(clk), .Q(gy2[7]) );
  DFFQX1 \gy2_reg[6]  ( .D(n279), .CLK(clk), .Q(gy2[6]) );
  DFFQX1 \gy2_reg[5]  ( .D(n280), .CLK(clk), .Q(gy2[5]) );
  DFFQX1 \gy2_reg[4]  ( .D(n281), .CLK(clk), .Q(gy2[4]) );
  DFFQX1 \gy2_reg[3]  ( .D(n282), .CLK(clk), .Q(gy2[3]) );
  DFFQX1 \gy2_reg[2]  ( .D(n283), .CLK(clk), .Q(gy2[2]) );
  DFFQX1 \gy2_reg[1]  ( .D(n284), .CLK(clk), .Q(gy2[1]) );
  DFFQX1 \gy2_reg[0]  ( .D(n285), .CLK(clk), .Q(gy2[0]) );
  DFFQX1 \gy1_reg[9]  ( .D(n275), .CLK(clk), .Q(gy1[9]) );
  DFFQX1 \gy1_reg[8]  ( .D(n274), .CLK(clk), .Q(gy1[8]) );
  DFFQX1 \gy1_reg[7]  ( .D(n273), .CLK(clk), .Q(gy1[7]) );
  DFFQX1 \gy1_reg[6]  ( .D(n272), .CLK(clk), .Q(gy1[6]) );
  DFFQX1 \gy1_reg[5]  ( .D(n271), .CLK(clk), .Q(gy1[5]) );
  DFFQX1 \gy1_reg[4]  ( .D(n270), .CLK(clk), .Q(gy1[4]) );
  DFFQX1 \gy1_reg[3]  ( .D(n269), .CLK(clk), .Q(gy1[3]) );
  DFFQX1 \gy1_reg[2]  ( .D(n268), .CLK(clk), .Q(gy1[2]) );
  DFFQX1 \gy1_reg[1]  ( .D(n267), .CLK(clk), .Q(gy1[1]) );
  DFFQX1 \gy1_reg[0]  ( .D(n266), .CLK(clk), .Q(gy1[0]) );
  DFFQX1 \out_reg[7]  ( .D(N226), .CLK(clk_pix), .Q(out[7]) );
  DFFQX1 \out_reg[6]  ( .D(N226), .CLK(clk_pix), .Q(out[6]) );
  DFFQX1 \out_reg[5]  ( .D(N226), .CLK(clk_pix), .Q(out[5]) );
  DFFQX1 \out_reg[4]  ( .D(N226), .CLK(clk_pix), .Q(out[4]) );
  DFFQX1 \out_reg[3]  ( .D(N226), .CLK(clk_pix), .Q(out[3]) );
  DFFQX1 \out_reg[2]  ( .D(N226), .CLK(clk_pix), .Q(out[2]) );
  DFFQX1 \out_reg[1]  ( .D(N226), .CLK(clk_pix), .Q(out[1]) );
  DFFQX1 \out_reg[0]  ( .D(N226), .CLK(clk_pix), .Q(out[0]) );
  NAND2X1 U34 ( .A(n79), .B(n80), .Z(n266) );
  NAND2X1 U35 ( .A(N121), .B(n81), .Z(n80) );
  NAND2X1 U36 ( .A(gy1[0]), .B(n82), .Z(n79) );
  NAND2X1 U37 ( .A(n83), .B(n84), .Z(n267) );
  NAND2X1 U38 ( .A(N122), .B(n81), .Z(n84) );
  NAND2X1 U39 ( .A(gy1[1]), .B(n82), .Z(n83) );
  NAND2X1 U40 ( .A(n85), .B(n86), .Z(n268) );
  NAND2X1 U41 ( .A(N123), .B(n81), .Z(n86) );
  NAND2X1 U42 ( .A(gy1[2]), .B(n82), .Z(n85) );
  NAND2X1 U43 ( .A(n87), .B(n88), .Z(n269) );
  NAND2X1 U44 ( .A(N124), .B(n81), .Z(n88) );
  NAND2X1 U45 ( .A(gy1[3]), .B(n82), .Z(n87) );
  NAND2X1 U46 ( .A(n89), .B(n90), .Z(n270) );
  NAND2X1 U47 ( .A(N125), .B(n81), .Z(n90) );
  NAND2X1 U48 ( .A(gy1[4]), .B(n82), .Z(n89) );
  NAND2X1 U49 ( .A(n91), .B(n92), .Z(n271) );
  NAND2X1 U50 ( .A(N126), .B(n81), .Z(n92) );
  NAND2X1 U51 ( .A(gy1[5]), .B(n82), .Z(n91) );
  NAND2X1 U52 ( .A(n93), .B(n94), .Z(n272) );
  NAND2X1 U53 ( .A(N127), .B(n81), .Z(n94) );
  NAND2X1 U54 ( .A(gy1[6]), .B(n82), .Z(n93) );
  NAND2X1 U55 ( .A(n95), .B(n96), .Z(n273) );
  NAND2X1 U56 ( .A(N128), .B(n81), .Z(n96) );
  NAND2X1 U57 ( .A(gy1[7]), .B(n82), .Z(n95) );
  NAND2X1 U58 ( .A(n97), .B(n98), .Z(n274) );
  NAND2X1 U59 ( .A(N129), .B(n81), .Z(n98) );
  NAND2X1 U60 ( .A(gy1[8]), .B(n82), .Z(n97) );
  NAND2X1 U61 ( .A(n99), .B(n100), .Z(n275) );
  NAND2X1 U62 ( .A(N130), .B(n81), .Z(n100) );
  NOR2X1 U63 ( .A(n101), .B(n82), .Z(n81) );
  NAND2X1 U64 ( .A(gy1[9]), .B(n82), .Z(n99) );
  AND2X1 U65 ( .A(n102), .B(n103), .Z(n82) );
  NAND2X1 U66 ( .A(n407), .B(n105), .Z(n103) );
  NAND2X1 U67 ( .A(n106), .B(n107), .Z(n276) );
  NAND2X1 U68 ( .A(N150), .B(n108), .Z(n107) );
  NAND2X1 U69 ( .A(gy2[9]), .B(n109), .Z(n106) );
  NAND2X1 U70 ( .A(n110), .B(n111), .Z(n277) );
  NAND2X1 U71 ( .A(N149), .B(n108), .Z(n111) );
  NAND2X1 U72 ( .A(gy2[8]), .B(n109), .Z(n110) );
  NAND2X1 U73 ( .A(n112), .B(n113), .Z(n278) );
  NAND2X1 U74 ( .A(N148), .B(n108), .Z(n113) );
  NAND2X1 U75 ( .A(gy2[7]), .B(n109), .Z(n112) );
  NAND2X1 U76 ( .A(n114), .B(n115), .Z(n279) );
  NAND2X1 U77 ( .A(N147), .B(n108), .Z(n115) );
  NAND2X1 U78 ( .A(gy2[6]), .B(n109), .Z(n114) );
  NAND2X1 U79 ( .A(n116), .B(n117), .Z(n280) );
  NAND2X1 U80 ( .A(N146), .B(n108), .Z(n117) );
  NAND2X1 U81 ( .A(gy2[5]), .B(n109), .Z(n116) );
  NAND2X1 U82 ( .A(n118), .B(n119), .Z(n281) );
  NAND2X1 U83 ( .A(N145), .B(n108), .Z(n119) );
  NAND2X1 U84 ( .A(gy2[4]), .B(n109), .Z(n118) );
  NAND2X1 U85 ( .A(n120), .B(n121), .Z(n282) );
  NAND2X1 U86 ( .A(N144), .B(n108), .Z(n121) );
  NAND2X1 U87 ( .A(gy2[3]), .B(n109), .Z(n120) );
  NAND2X1 U88 ( .A(n122), .B(n123), .Z(n283) );
  NAND2X1 U89 ( .A(N143), .B(n108), .Z(n123) );
  NAND2X1 U90 ( .A(gy2[2]), .B(n109), .Z(n122) );
  NAND2X1 U91 ( .A(n124), .B(n125), .Z(n284) );
  NAND2X1 U92 ( .A(N142), .B(n108), .Z(n125) );
  NAND2X1 U93 ( .A(gy2[1]), .B(n109), .Z(n124) );
  NAND2X1 U94 ( .A(n126), .B(n127), .Z(n285) );
  NAND2X1 U95 ( .A(N141), .B(n108), .Z(n127) );
  NOR2X1 U96 ( .A(n101), .B(n109), .Z(n108) );
  NAND2X1 U97 ( .A(gy2[0]), .B(n109), .Z(n126) );
  AND2X1 U98 ( .A(n102), .B(n128), .Z(n109) );
  NAND3X1 U99 ( .A(n407), .B(\filter_step[1] ), .C(n413), .Z(n128) );
  NAND2X1 U100 ( .A(n129), .B(n130), .Z(n286) );
  NAND2X1 U101 ( .A(N110), .B(n131), .Z(n130) );
  NAND2X1 U102 ( .A(gx2[9]), .B(n132), .Z(n129) );
  NAND2X1 U103 ( .A(n133), .B(n134), .Z(n287) );
  NAND2X1 U104 ( .A(N109), .B(n131), .Z(n134) );
  NAND2X1 U105 ( .A(gx2[8]), .B(n132), .Z(n133) );
  NAND2X1 U106 ( .A(n135), .B(n136), .Z(n288) );
  NAND2X1 U107 ( .A(N108), .B(n131), .Z(n136) );
  NAND2X1 U108 ( .A(gx2[7]), .B(n132), .Z(n135) );
  NAND2X1 U109 ( .A(n137), .B(n138), .Z(n289) );
  NAND2X1 U110 ( .A(N107), .B(n131), .Z(n138) );
  NAND2X1 U111 ( .A(gx2[6]), .B(n132), .Z(n137) );
  NAND2X1 U112 ( .A(n139), .B(n140), .Z(n290) );
  NAND2X1 U113 ( .A(N106), .B(n131), .Z(n140) );
  NAND2X1 U114 ( .A(gx2[5]), .B(n132), .Z(n139) );
  NAND2X1 U115 ( .A(n141), .B(n142), .Z(n291) );
  NAND2X1 U116 ( .A(N105), .B(n131), .Z(n142) );
  NAND2X1 U117 ( .A(gx2[4]), .B(n132), .Z(n141) );
  NAND2X1 U118 ( .A(n143), .B(n144), .Z(n292) );
  NAND2X1 U119 ( .A(N104), .B(n131), .Z(n144) );
  NAND2X1 U120 ( .A(gx2[3]), .B(n132), .Z(n143) );
  NAND2X1 U121 ( .A(n145), .B(n146), .Z(n293) );
  NAND2X1 U122 ( .A(N103), .B(n131), .Z(n146) );
  NAND2X1 U123 ( .A(gx2[2]), .B(n132), .Z(n145) );
  NAND2X1 U124 ( .A(n147), .B(n148), .Z(n294) );
  NAND2X1 U125 ( .A(N102), .B(n131), .Z(n148) );
  NAND2X1 U126 ( .A(gx2[1]), .B(n132), .Z(n147) );
  NAND2X1 U127 ( .A(n149), .B(n150), .Z(n295) );
  NAND2X1 U128 ( .A(N101), .B(n131), .Z(n150) );
  NOR2X1 U129 ( .A(n101), .B(n132), .Z(n131) );
  NAND2X1 U130 ( .A(gx2[0]), .B(n132), .Z(n149) );
  AND2X1 U131 ( .A(n102), .B(n151), .Z(n132) );
  NAND2X1 U132 ( .A(n152), .B(n407), .Z(n151) );
  NAND2X1 U133 ( .A(n153), .B(n154), .Z(n296) );
  NAND2X1 U134 ( .A(N90), .B(n155), .Z(n154) );
  NAND2X1 U135 ( .A(gx1[9]), .B(n156), .Z(n153) );
  NAND2X1 U136 ( .A(n157), .B(n158), .Z(n297) );
  NAND2X1 U137 ( .A(N89), .B(n155), .Z(n158) );
  NAND2X1 U138 ( .A(gx1[8]), .B(n156), .Z(n157) );
  NAND2X1 U139 ( .A(n159), .B(n160), .Z(n298) );
  NAND2X1 U140 ( .A(N88), .B(n155), .Z(n160) );
  NAND2X1 U141 ( .A(gx1[7]), .B(n156), .Z(n159) );
  NAND2X1 U142 ( .A(n161), .B(n162), .Z(n299) );
  NAND2X1 U143 ( .A(N87), .B(n155), .Z(n162) );
  NAND2X1 U144 ( .A(gx1[6]), .B(n156), .Z(n161) );
  NAND2X1 U145 ( .A(n163), .B(n164), .Z(n300) );
  NAND2X1 U146 ( .A(N86), .B(n155), .Z(n164) );
  NAND2X1 U147 ( .A(gx1[5]), .B(n156), .Z(n163) );
  NAND2X1 U148 ( .A(n165), .B(n166), .Z(n301) );
  NAND2X1 U149 ( .A(N85), .B(n155), .Z(n166) );
  NAND2X1 U150 ( .A(gx1[4]), .B(n156), .Z(n165) );
  NAND2X1 U151 ( .A(n167), .B(n168), .Z(n302) );
  NAND2X1 U152 ( .A(N84), .B(n155), .Z(n168) );
  NAND2X1 U153 ( .A(gx1[3]), .B(n156), .Z(n167) );
  NAND2X1 U154 ( .A(n169), .B(n170), .Z(n303) );
  NAND2X1 U155 ( .A(N83), .B(n155), .Z(n170) );
  NAND2X1 U156 ( .A(gx1[2]), .B(n156), .Z(n169) );
  NAND2X1 U157 ( .A(n171), .B(n172), .Z(n304) );
  NAND2X1 U158 ( .A(N82), .B(n155), .Z(n172) );
  NAND2X1 U159 ( .A(gx1[1]), .B(n156), .Z(n171) );
  NAND2X1 U160 ( .A(n173), .B(n174), .Z(n305) );
  NAND2X1 U161 ( .A(N81), .B(n155), .Z(n174) );
  NOR2X1 U162 ( .A(n101), .B(n156), .Z(n155) );
  NAND2X1 U163 ( .A(gx1[0]), .B(n156), .Z(n173) );
  AND2X1 U164 ( .A(n102), .B(n175), .Z(n156) );
  NAND2X1 U165 ( .A(n176), .B(n407), .Z(n175) );
  NAND2X1 U166 ( .A(n407), .B(n101), .Z(n102) );
  NAND3X1 U167 ( .A(n177), .B(n178), .C(n179), .Z(n306) );
  NAND2X1 U168 ( .A(\filter_step[1] ), .B(n396), .Z(n179) );
  NAND2X1 U169 ( .A(n180), .B(n152), .Z(n177) );
  NAND3X1 U170 ( .A(n181), .B(n178), .C(n182), .Z(n307) );
  NAND2X1 U171 ( .A(n413), .B(n396), .Z(n182) );
  NAND2X1 U172 ( .A(n180), .B(n105), .Z(n178) );
  NAND2X1 U173 ( .A(n180), .B(n176), .Z(n181) );
  AND2X1 U174 ( .A(n407), .B(N214), .Z(n180) );
  NAND2X1 U176 ( .A(n184), .B(n185), .Z(n308) );
  OR2X1 U177 ( .A(n62), .B(n186), .Z(n185) );
  NAND2X1 U178 ( .A(n406), .B(n186), .Z(n184) );
  NAND2X1 U179 ( .A(n187), .B(n188), .Z(n186) );
  OR2X1 U180 ( .A(n409), .B(clk_pix), .Z(n188) );
  NAND2X1 U181 ( .A(n189), .B(n190), .Z(n309) );
  OR2X1 U182 ( .A(n191), .B(n192), .Z(n190) );
  NAND2X1 U183 ( .A(n191), .B(n409), .Z(n189) );
  NAND2X1 U184 ( .A(n193), .B(n194), .Z(n191) );
  NAND3X1 U185 ( .A(n407), .B(n195), .C(n397), .Z(n194) );
  NAND3X1 U186 ( .A(n412), .B(n411), .C(n410), .Z(n195) );
  AND2X1 U188 ( .A(\filter_step[1] ), .B(n57), .Z(n105) );
  NOR2X1 U189 ( .A(n57), .B(\filter_step[1] ), .Z(n152) );
  NOR2X1 U190 ( .A(\filter_step[1] ), .B(n413), .Z(n176) );
  NAND2X1 U191 ( .A(n187), .B(n183), .Z(n193) );
  NAND2X1 U192 ( .A(n197), .B(n198), .Z(gy[9]) );
  NAND2X1 U193 ( .A(N54), .B(n384), .Z(n198) );
  NAND2X1 U194 ( .A(N44), .B(N33), .Z(n197) );
  NAND2X1 U195 ( .A(n199), .B(n200), .Z(gy[8]) );
  NAND2X1 U196 ( .A(N53), .B(n384), .Z(n200) );
  NAND2X1 U197 ( .A(N43), .B(N33), .Z(n199) );
  NAND2X1 U198 ( .A(n201), .B(n202), .Z(gy[7]) );
  NAND2X1 U199 ( .A(N52), .B(n384), .Z(n202) );
  NAND2X1 U200 ( .A(N42), .B(N33), .Z(n201) );
  NAND2X1 U201 ( .A(n203), .B(n204), .Z(gy[6]) );
  NAND2X1 U202 ( .A(N51), .B(n384), .Z(n204) );
  NAND2X1 U203 ( .A(N41), .B(N33), .Z(n203) );
  NAND2X1 U204 ( .A(n205), .B(n206), .Z(gy[5]) );
  NAND2X1 U205 ( .A(N50), .B(n384), .Z(n206) );
  NAND2X1 U206 ( .A(N40), .B(N33), .Z(n205) );
  NAND2X1 U207 ( .A(n207), .B(n208), .Z(gy[4]) );
  NAND2X1 U208 ( .A(N49), .B(n384), .Z(n208) );
  NAND2X1 U209 ( .A(N39), .B(N33), .Z(n207) );
  NAND2X1 U210 ( .A(n209), .B(n210), .Z(gy[3]) );
  NAND2X1 U211 ( .A(N48), .B(n384), .Z(n210) );
  NAND2X1 U212 ( .A(N38), .B(N33), .Z(n209) );
  NAND2X1 U213 ( .A(n211), .B(n212), .Z(gy[2]) );
  NAND2X1 U214 ( .A(N47), .B(n384), .Z(n212) );
  NAND2X1 U215 ( .A(N37), .B(N33), .Z(n211) );
  NAND2X1 U216 ( .A(n213), .B(n214), .Z(gy[1]) );
  NAND2X1 U217 ( .A(N46), .B(n384), .Z(n214) );
  NAND2X1 U218 ( .A(N36), .B(N33), .Z(n213) );
  NAND2X1 U219 ( .A(n215), .B(n216), .Z(gy[0]) );
  NAND2X1 U220 ( .A(N45), .B(n384), .Z(n216) );
  NAND2X1 U221 ( .A(N35), .B(N33), .Z(n215) );
  NAND2X1 U222 ( .A(n217), .B(n218), .Z(gx[9]) );
  NAND2X1 U223 ( .A(N32), .B(n341), .Z(n218) );
  NAND2X1 U224 ( .A(N22), .B(N11), .Z(n217) );
  NAND2X1 U225 ( .A(n219), .B(n220), .Z(gx[8]) );
  NAND2X1 U226 ( .A(N31), .B(n341), .Z(n220) );
  NAND2X1 U227 ( .A(N21), .B(N11), .Z(n219) );
  NAND2X1 U228 ( .A(n221), .B(n222), .Z(gx[7]) );
  NAND2X1 U229 ( .A(N30), .B(n341), .Z(n222) );
  NAND2X1 U230 ( .A(N20), .B(N11), .Z(n221) );
  NAND2X1 U231 ( .A(n223), .B(n224), .Z(gx[6]) );
  NAND2X1 U232 ( .A(N29), .B(n341), .Z(n224) );
  NAND2X1 U233 ( .A(N19), .B(N11), .Z(n223) );
  NAND2X1 U234 ( .A(n225), .B(n226), .Z(gx[5]) );
  NAND2X1 U235 ( .A(N28), .B(n341), .Z(n226) );
  NAND2X1 U236 ( .A(N18), .B(N11), .Z(n225) );
  NAND2X1 U237 ( .A(n227), .B(n228), .Z(gx[4]) );
  NAND2X1 U238 ( .A(N27), .B(n341), .Z(n228) );
  NAND2X1 U239 ( .A(N17), .B(N11), .Z(n227) );
  NAND2X1 U240 ( .A(n229), .B(n230), .Z(gx[3]) );
  NAND2X1 U241 ( .A(N26), .B(n341), .Z(n230) );
  NAND2X1 U242 ( .A(N16), .B(N11), .Z(n229) );
  NAND2X1 U243 ( .A(n231), .B(n232), .Z(gx[2]) );
  NAND2X1 U244 ( .A(N25), .B(n341), .Z(n232) );
  NAND2X1 U245 ( .A(N15), .B(N11), .Z(n231) );
  NAND2X1 U246 ( .A(n233), .B(n234), .Z(gx[1]) );
  NAND2X1 U247 ( .A(N24), .B(n341), .Z(n234) );
  NAND2X1 U248 ( .A(N14), .B(N11), .Z(n233) );
  NAND2X1 U249 ( .A(n235), .B(n236), .Z(gx[0]) );
  NAND2X1 U250 ( .A(N23), .B(n341), .Z(n236) );
  NAND2X1 U251 ( .A(N13), .B(N11), .Z(n235) );
  NAND2X1 U252 ( .A(n237), .B(n238), .Z(N226) );
  NOR2X1 U253 ( .A(g_mag[9]), .B(g_mag[8]), .Z(n238) );
  NOR2X1 U254 ( .A(g_mag[7]), .B(g_mag[10]), .Z(n237) );
  NAND2X1 U255 ( .A(n187), .B(n239), .Z(N214) );
  NAND2X1 U256 ( .A(n397), .B(n407), .Z(n239) );
  NAND2X1 U257 ( .A(n409), .B(n408), .Z(n183) );
  NAND2X1 U258 ( .A(n240), .B(n241), .Z(n101) );
  NAND2X1 U259 ( .A(n242), .B(n243), .Z(n241) );
  OR2X1 U260 ( .A(n244), .B(n245), .Z(n243) );
  NOR2X1 U261 ( .A(n246), .B(n247), .Z(n245) );
  NAND3X1 U262 ( .A(col[9]), .B(col[6]), .C(n248), .Z(n247) );
  NOR2X1 U263 ( .A(n403), .B(n402), .Z(n248) );
  NAND3X1 U264 ( .A(col[3]), .B(col[2]), .C(n249), .Z(n246) );
  NOR2X1 U265 ( .A(n405), .B(n404), .Z(n249) );
  NOR2X1 U266 ( .A(n250), .B(n251), .Z(n244) );
  NAND3X1 U267 ( .A(n405), .B(n404), .C(n252), .Z(n251) );
  NOR2X1 U268 ( .A(col[3]), .B(col[2]), .Z(n252) );
  NAND3X1 U269 ( .A(n403), .B(n402), .C(n253), .Z(n250) );
  NOR2X1 U270 ( .A(col[9]), .B(col[6]), .Z(n253) );
  NOR2X1 U271 ( .A(col[8]), .B(col[7]), .Z(n242) );
  OR2X1 U272 ( .A(row[5]), .B(n254), .Z(n240) );
  NOR2X1 U273 ( .A(n255), .B(n256), .Z(n254) );
  NOR2X1 U274 ( .A(n257), .B(n258), .Z(n256) );
  NAND3X1 U275 ( .A(row[8]), .B(row[7]), .C(n259), .Z(n258) );
  NOR2X1 U276 ( .A(n399), .B(n398), .Z(n259) );
  NAND3X1 U277 ( .A(row[3]), .B(row[2]), .C(n260), .Z(n257) );
  NOR2X1 U278 ( .A(n401), .B(n400), .Z(n260) );
  NOR2X1 U279 ( .A(n261), .B(n262), .Z(n255) );
  NAND3X1 U280 ( .A(n401), .B(n400), .C(n263), .Z(n262) );
  NOR2X1 U281 ( .A(row[3]), .B(row[2]), .Z(n263) );
  NAND3X1 U282 ( .A(n399), .B(n398), .C(n264), .Z(n261) );
  NOR2X1 U283 ( .A(row[8]), .B(row[7]), .Z(n264) );
  AND2X1 U284 ( .A(n408), .B(n265), .Z(n187) );
  NAND3X1 U285 ( .A(n406), .B(n62), .C(start), .Z(n265) );
  NAND3X1 U286 ( .A(done), .B(n408), .C(clk_pix), .Z(n192) );
  sobel_DW01_add_0 add_71 ( .A({N140, gy}), .B({N140, gx}), .CI(N140), .SUM({
        g_mag, SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6}) );
  sobel_DW01_sub_0 sub_69 ( .A(gy2), .B(gy1), .CI(N140), .DIFF({N54, N53, N52, 
        N51, N50, N49, N48, N47, N46, N45}) );
  sobel_DW01_sub_1 sub_68_S2 ( .A(gy1), .B(gy2), .CI(N140), .DIFF({N44, N43, 
        N42, N41, N40, N39, N38, N37, N36, N35}) );
  sobel_DW01_sub_2 sub_67 ( .A(gx2), .B(gx1), .CI(N140), .DIFF({N32, N31, N30, 
        N29, N28, N27, N26, N25, N24, N23}) );
  sobel_DW01_sub_3 sub_66_S2 ( .A(gx1), .B(gx2), .CI(N140), .DIFF({N22, N21, 
        N20, N19, N18, N17, N16, N15, N14, N13}) );
  sobel_DW01_add_8 add_1_root_add_0_root_add_109_2 ( .A({N140, N140, 
        inputPixels[31:24]}), .B({N140, N140, inputPixels[7:0]}), .CI(N140), 
        .SUM({SYNOPSYS_UNCONNECTED__7, N79, N78, N77, N76, N75, N74, N73, N72, 
        N71}) );
  sobel_DW01_add_7 add_0_root_add_0_root_add_109_2 ( .A({N140, 
        inputPixels[47:40], N140}), .B({N140, N79, N78, N77, N76, N75, N74, 
        N73, N72, N71}), .CI(N140), .SUM({N90, N89, N88, N87, N86, N85, N84, 
        N83, N82, N81}) );
  sobel_DW01_add_4 add_1_root_add_0_root_add_119_2 ( .A({N140, N140, 
        inputPixels[63:56]}), .B({N140, N140, inputPixels[23:16]}), .CI(N140), 
        .SUM({SYNOPSYS_UNCONNECTED__8, N99, N98, N97, N96, N95, N94, N93, N92, 
        N91}) );
  sobel_DW01_add_3 add_0_root_add_0_root_add_119_2 ( .A({N140, 
        inputPixels[39:32], N140}), .B({N140, N99, N98, N97, N96, N95, N94, 
        N93, N92, N91}), .CI(N140), .SUM({N110, N109, N108, N107, N106, N105, 
        N104, N103, N102, N101}) );
  sobel_DW01_add_6 add_1_root_add_0_root_add_129_2 ( .A({N140, N140, 
        inputPixels[23:16]}), .B({N140, N140, inputPixels[7:0]}), .CI(N140), 
        .SUM({SYNOPSYS_UNCONNECTED__9, N119, N118, N117, N116, N115, N114, 
        N113, N112, N111}) );
  sobel_DW01_add_5 add_0_root_add_0_root_add_129_2 ( .A({N140, 
        inputPixels[15:8], N140}), .B({N140, N119, N118, N117, N116, N115, 
        N114, N113, N112, N111}), .CI(N140), .SUM({N130, N129, N128, N127, 
        N126, N125, N124, N123, N122, N121}) );
  sobel_DW01_add_2 add_1_root_add_0_root_add_142_2 ( .A({N140, N140, 
        inputPixels[63:56]}), .B({N140, N140, inputPixels[47:40]}), .CI(N140), 
        .SUM({SYNOPSYS_UNCONNECTED__10, N139, N138, N137, N136, N135, N134, 
        N133, N132, N131}) );
  sobel_DW01_add_1 add_0_root_add_0_root_add_142_2 ( .A({N140, 
        inputPixels[55:48], N140}), .B({N140, N139, N138, N137, N136, N135, 
        N134, N133, N132, N131}), .CI(N140), .SUM({N150, N149, N148, N147, 
        N146, N145, N144, N143, N142, N141}) );
  DFFQQBX1 setup_reg ( .D(n308), .CLK(clk), .QB(n62) );
  DFFQQBX1 busy_reg ( .D(n309), .CLK(clk), .Q(n409), .QB(done) );
  DFFQQBX1 \filter_step_reg[0]  ( .D(n307), .CLK(clk), .Q(n413), .QB(n57) );
  INVX2 U287 ( .A(n341), .Z(N11) );
  INVX2 U288 ( .A(n384), .Z(N33) );
  TIE0 U289 ( .Z(N140) );
  OR2X1 U290 ( .A(n345), .B(gx1[9]), .Z(n340) );
  OR2X1 U291 ( .A(n352), .B(gx2[8]), .Z(n336) );
  NAND2X1 U292 ( .A(gx1[9]), .B(n345), .Z(n337) );
  OR2X1 U293 ( .A(n344), .B(gx1[3]), .Z(n319) );
  OR2X1 U294 ( .A(n346), .B(gx2[2]), .Z(n315) );
  NAND2X1 U295 ( .A(gx1[3]), .B(n344), .Z(n316) );
  OR2X1 U296 ( .A(n343), .B(gx1[1]), .Z(n313) );
  NAND2X1 U297 ( .A(gx1[0]), .B(n342), .Z(n311) );
  NAND2X1 U298 ( .A(gx1[1]), .B(n343), .Z(n310) );
  NAND2X1 U299 ( .A(n311), .B(n310), .Z(n312) );
  NAND2X1 U300 ( .A(n313), .B(n312), .Z(n314) );
  NAND3X1 U301 ( .A(n315), .B(n316), .C(n314), .Z(n318) );
  NAND3X1 U302 ( .A(n316), .B(n346), .C(gx2[2]), .Z(n317) );
  NAND3X1 U303 ( .A(n319), .B(n318), .C(n317), .Z(n323) );
  OR2X1 U304 ( .A(n348), .B(gx2[5]), .Z(n326) );
  NOR2X1 U305 ( .A(gx2[4]), .B(n347), .Z(n321) );
  OR2X1 U306 ( .A(n349), .B(gx2[6]), .Z(n320) );
  OR2X1 U307 ( .A(n350), .B(gx2[7]), .Z(n324) );
  NAND2X1 U308 ( .A(n320), .B(n324), .Z(n325) );
  NOR2X1 U309 ( .A(n321), .B(n325), .Z(n322) );
  NAND3X1 U310 ( .A(n323), .B(n326), .C(n322), .Z(n334) );
  NAND3X1 U311 ( .A(n324), .B(n349), .C(gx2[6]), .Z(n333) );
  NAND2X1 U312 ( .A(gx2[7]), .B(n350), .Z(n331) );
  NAND2X1 U313 ( .A(gx2[5]), .B(n348), .Z(n328) );
  NAND3X1 U314 ( .A(n326), .B(n347), .C(gx2[4]), .Z(n327) );
  NAND2X1 U315 ( .A(n328), .B(n327), .Z(n329) );
  NAND2X1 U316 ( .A(n351), .B(n329), .Z(n330) );
  AND2X1 U317 ( .A(n331), .B(n330), .Z(n332) );
  NAND3X1 U318 ( .A(n334), .B(n333), .C(n332), .Z(n335) );
  NAND3X1 U319 ( .A(n336), .B(n337), .C(n335), .Z(n339) );
  NAND3X1 U320 ( .A(n337), .B(n352), .C(gx2[8]), .Z(n338) );
  NAND3X1 U321 ( .A(n340), .B(n339), .C(n338), .Z(n341) );
  INVX2 U322 ( .A(gx2[0]), .Z(n342) );
  INVX2 U323 ( .A(gx2[1]), .Z(n343) );
  INVX2 U324 ( .A(gx2[3]), .Z(n344) );
  INVX2 U325 ( .A(gx2[9]), .Z(n345) );
  INVX2 U326 ( .A(gx1[2]), .Z(n346) );
  INVX2 U327 ( .A(gx1[4]), .Z(n347) );
  INVX2 U328 ( .A(gx1[5]), .Z(n348) );
  INVX2 U329 ( .A(gx1[6]), .Z(n349) );
  INVX2 U330 ( .A(gx1[7]), .Z(n350) );
  INVX2 U331 ( .A(n325), .Z(n351) );
  INVX2 U332 ( .A(gx1[8]), .Z(n352) );
  OR2X1 U333 ( .A(n395), .B(gy1[9]), .Z(n383) );
  OR2X1 U334 ( .A(n390), .B(gy2[8]), .Z(n379) );
  NAND2X1 U335 ( .A(gy1[9]), .B(n395), .Z(n380) );
  OR2X1 U336 ( .A(n393), .B(gy1[3]), .Z(n362) );
  OR2X1 U337 ( .A(n385), .B(gy2[2]), .Z(n358) );
  NAND2X1 U338 ( .A(gy1[3]), .B(n393), .Z(n359) );
  OR2X1 U339 ( .A(n392), .B(gy1[1]), .Z(n356) );
  NAND2X1 U340 ( .A(gy1[0]), .B(n391), .Z(n354) );
  NAND2X1 U341 ( .A(gy1[1]), .B(n392), .Z(n353) );
  NAND2X1 U342 ( .A(n354), .B(n353), .Z(n355) );
  NAND2X1 U343 ( .A(n356), .B(n355), .Z(n357) );
  NAND3X1 U344 ( .A(n358), .B(n359), .C(n357), .Z(n361) );
  NAND3X1 U345 ( .A(n359), .B(n385), .C(gy2[2]), .Z(n360) );
  NAND3X1 U346 ( .A(n362), .B(n361), .C(n360), .Z(n366) );
  OR2X1 U347 ( .A(n387), .B(gy2[5]), .Z(n369) );
  NOR2X1 U348 ( .A(gy2[4]), .B(n386), .Z(n364) );
  OR2X1 U349 ( .A(n388), .B(gy2[6]), .Z(n363) );
  OR2X1 U350 ( .A(n389), .B(gy2[7]), .Z(n367) );
  NAND2X1 U351 ( .A(n363), .B(n367), .Z(n368) );
  NOR2X1 U352 ( .A(n364), .B(n368), .Z(n365) );
  NAND3X1 U353 ( .A(n366), .B(n369), .C(n365), .Z(n377) );
  NAND3X1 U354 ( .A(n367), .B(n388), .C(gy2[6]), .Z(n376) );
  NAND2X1 U355 ( .A(gy2[7]), .B(n389), .Z(n374) );
  NAND2X1 U356 ( .A(gy2[5]), .B(n387), .Z(n371) );
  NAND3X1 U357 ( .A(n369), .B(n386), .C(gy2[4]), .Z(n370) );
  NAND2X1 U358 ( .A(n371), .B(n370), .Z(n372) );
  NAND2X1 U359 ( .A(n394), .B(n372), .Z(n373) );
  AND2X1 U360 ( .A(n374), .B(n373), .Z(n375) );
  NAND3X1 U361 ( .A(n377), .B(n376), .C(n375), .Z(n378) );
  NAND3X1 U362 ( .A(n379), .B(n380), .C(n378), .Z(n382) );
  NAND3X1 U363 ( .A(n380), .B(n390), .C(gy2[8]), .Z(n381) );
  NAND3X1 U364 ( .A(n383), .B(n382), .C(n381), .Z(n384) );
  INVX2 U365 ( .A(gy1[2]), .Z(n385) );
  INVX2 U366 ( .A(gy1[4]), .Z(n386) );
  INVX2 U367 ( .A(gy1[5]), .Z(n387) );
  INVX2 U368 ( .A(gy1[6]), .Z(n388) );
  INVX2 U369 ( .A(gy1[7]), .Z(n389) );
  INVX2 U370 ( .A(gy1[8]), .Z(n390) );
  INVX2 U371 ( .A(gy2[0]), .Z(n391) );
  INVX2 U372 ( .A(gy2[1]), .Z(n392) );
  INVX2 U373 ( .A(gy2[3]), .Z(n393) );
  INVX2 U374 ( .A(n368), .Z(n394) );
  INVX2 U375 ( .A(gy2[9]), .Z(n395) );
  INVX2 U376 ( .A(N214), .Z(n396) );
  INVX2 U377 ( .A(n101), .Z(n397) );
  INVX2 U378 ( .A(row[6]), .Z(n398) );
  INVX2 U379 ( .A(row[4]), .Z(n399) );
  INVX2 U380 ( .A(row[1]), .Z(n400) );
  INVX2 U381 ( .A(row[0]), .Z(n401) );
  INVX2 U382 ( .A(col[5]), .Z(n402) );
  INVX2 U383 ( .A(col[4]), .Z(n403) );
  INVX2 U384 ( .A(col[1]), .Z(n404) );
  INVX2 U385 ( .A(col[0]), .Z(n405) );
  INVX2 U386 ( .A(n192), .Z(n406) );
  INVX2 U387 ( .A(n183), .Z(n407) );
  INVX2 U388 ( .A(reset), .Z(n408) );
  INVX2 U389 ( .A(n105), .Z(n410) );
  INVX2 U390 ( .A(n152), .Z(n411) );
  INVX2 U391 ( .A(n176), .Z(n412) );
endmodule

