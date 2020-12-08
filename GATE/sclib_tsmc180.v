//////////////////////////////////////////////////
//////////////////////////////////////////////////

`timescale 1ns/1ps
`define PROP_DELAY 			0.0

`define PERIOD 					0.0
`define WIDTH 					0.0
`define SETUP_TIME 			0.0
`define HOLD_TIME 			0.0
`define RECOVERY_TIME 	0.0
`define REMOVAL_TIME 		0.0
`define WIDTH_THD 			0.0
`define INVALID_DELAY 	0.0

`celldefine
module AND2X1 (A, B, Z);
    input A, B;
    output Z;
    and		(Z, A, B);

specify
(A => Z) = (`PROP_DELAY,`PROP_DELAY);
(B => Z) = (`PROP_DELAY,`PROP_DELAY);
endspecify
endmodule
`endcelldefine

`celldefine
module NAND2X1 (A, B, Z);
    input A, B;
    output Z;
    nand		(Z, A, B);

specify
(A => Z) = (`PROP_DELAY,`PROP_DELAY);
(B => Z) = (`PROP_DELAY,`PROP_DELAY);
endspecify
endmodule
`endcelldefine

`celldefine
module OR2X1 (A, B, Z);
    input A, B;
    output Z;
    or		(Z, A, B);

specify
(A => Z) = (`PROP_DELAY,`PROP_DELAY);
(B => Z) = (`PROP_DELAY,`PROP_DELAY);
endspecify
endmodule
`endcelldefine

`celldefine
module NOR2X1 (A, B, Z);
    input A, B;
    output Z;
    nor		(Z, A, B);

specify
(A => Z) = (`PROP_DELAY,`PROP_DELAY);
(B => Z) = (`PROP_DELAY,`PROP_DELAY);
endspecify

endmodule
`endcelldefine


`celldefine
module XOR2X1 (A, B, Z);
  input 	A, B;
  output 	Z;
  xor		(Z, A, B);

  specify
    if (~B)
    (A => Z) = (`PROP_DELAY,`PROP_DELAY);
    if (B)
    (A => Z) = (`PROP_DELAY,`PROP_DELAY);
    ifnone (A => Z) = (`PROP_DELAY,`PROP_DELAY);
    if (~A)
    (B => Z) = (`PROP_DELAY,`PROP_DELAY);
    if (A)
    (B => Z) = (`PROP_DELAY,`PROP_DELAY);
    ifnone (B => Z) = (`PROP_DELAY,`PROP_DELAY);
  endspecify

endmodule
`endcelldefine

`celldefine
module INVX1 (A, Z);
    input A;
    output Z;
    not		(Z, A);

specify
(A => Z) = (`PROP_DELAY,`PROP_DELAY);
endspecify
endmodule
`endcelldefine

`celldefine
module INVX2 (A, Z);
    input A;
    output Z;
    not		(Z, A);

specify
(A => Z) = (`PROP_DELAY,`PROP_DELAY);
endspecify
endmodule
`endcelldefine

`celldefine
module INVX4 (A, Z);
    input A;
    output Z;
    not		(Z, A);

specify
(A => Z) = (`PROP_DELAY,`PROP_DELAY);
endspecify
endmodule
`endcelldefine

`celldefine
module INVX8 (A, Z);
    input A;
    output Z;
    not		(Z, A);

specify
(A => Z) = (`PROP_DELAY,`PROP_DELAY);
endspecify
endmodule
`endcelldefine

`celldefine
module INVX16 (A, Z);
    input A;
    output Z;
    not		(Z, A);

specify
(A => Z) = (`PROP_DELAY,`PROP_DELAY);
endspecify
endmodule
`endcelldefine

`celldefine
module INVX32 (A, Z);
    input A;
    output Z;
    not		(Z, A);

specify
(A => Z) = (`PROP_DELAY,`PROP_DELAY);
endspecify
endmodule
`endcelldefine


`celldefine
module BUFX1 (A, Z);
    input A;
    output Z;
    buf		(Z, A);

specify
(A => Z) = (`PROP_DELAY,`PROP_DELAY);
endspecify
endmodule
`endcelldefine


`celldefine
module MUX2X1 (A, B, S, Z);
   input A, B, S;
   output Z;

   reg  Z;

 always @ (S, A, B) begin
   if (~S) Z = A;
   else Z = B ;
 end

specify
if (~B & ~S)
(A => Z) = (`PROP_DELAY,`PROP_DELAY);
if (B & ~S)
(A => Z) = (`PROP_DELAY,`PROP_DELAY);
ifnone (A => Z) = (`PROP_DELAY,`PROP_DELAY);
if (~A & S)
(B => Z) = (`PROP_DELAY,`PROP_DELAY);
if (A & S)
(B => Z) = (`PROP_DELAY,`PROP_DELAY);
ifnone (B => Z) = (`PROP_DELAY,`PROP_DELAY);
if (A & ~B)
(S => Z) = (`PROP_DELAY,`PROP_DELAY);
if (~A & B)
(S => Z) = (`PROP_DELAY,`PROP_DELAY);
ifnone (S => Z) = (`PROP_DELAY,`PROP_DELAY);
endspecify
endmodule
`endcelldefine

`celldefine
module NAND3X1 (A, B, C, Z);
    input A, B, C;
    output Z;
    nand		(Z, A, B, C);

specify
(A => Z) = (`PROP_DELAY,`PROP_DELAY);
(B => Z) = (`PROP_DELAY,`PROP_DELAY);
(C => Z) = (`PROP_DELAY,`PROP_DELAY);
endspecify
endmodule
`endcelldefine


`celldefine
module DFFQX1 (D, CLK, Q);
    input D, CLK;
    output Q;

reg NOTIFIER;
supply1 xSN,xRN;
  buf     IC (clk, CLK);
  udp_dff I0 (n0, D, clk, xRN, xSN, NOTIFIER);
  buf     I1 (Q, n0);

specify
$width(posedge CLK,`WIDTH,`WIDTH_THD,NOTIFIER);
$width(negedge CLK,`WIDTH,`WIDTH_THD,NOTIFIER);
$setuphold(posedge CLK, posedge D, `SETUP_TIME, `HOLD_TIME, NOTIFIER);
$setuphold(posedge CLK, negedge D, `SETUP_TIME, `HOLD_TIME, NOTIFIER);
(posedge CLK => (Q:1'bx)) = (`PROP_DELAY,`PROP_DELAY);
endspecify
endmodule
`endcelldefine

`celldefine
module DFFQQBX1 (D, CLK, Q, QB);
    input D, CLK;
    output Q, QB;

reg NOTIFIER;
supply1 xSN,xRN;
  buf     IC (clk, CLK);
  udp_dff I0 (n0, D, clk, xRN, xSN, NOTIFIER);
  buf     I1 (Q, n0);
  not     I2 (QB, n0);

specify
$width(posedge CLK,`WIDTH,`WIDTH_THD,NOTIFIER);
$width(negedge CLK,`WIDTH,`WIDTH_THD,NOTIFIER);
$setuphold(posedge CLK, posedge D, `SETUP_TIME, `HOLD_TIME, NOTIFIER);
$setuphold(posedge CLK, negedge D, `SETUP_TIME, `HOLD_TIME, NOTIFIER);
(posedge CLK => (Q:1'bx)) = (`PROP_DELAY,`PROP_DELAY);
(posedge CLK => (QB:1'bx)) = (`PROP_DELAY,`PROP_DELAY);
endspecify
endmodule
`endcelldefine

`celldefine
module DFFQBX1 (D, CLK, QB);
    input D, CLK;
    output QB;

	reg NOTIFIER;
	supply1 xSN,xRN;
  buf     IC (clk, CLK);
  udp_dff I0 (n0, D, clk, xRN, xSN, NOTIFIER);
  not     I1 (QB, n0);

specify
$width(posedge CLK,`WIDTH,`WIDTH_THD,NOTIFIER);
$width(negedge CLK,`WIDTH,`WIDTH_THD,NOTIFIER);
$setuphold(posedge CLK, posedge D, `SETUP_TIME, `HOLD_TIME, NOTIFIER);
$setuphold(posedge CLK, negedge D, `SETUP_TIME, `HOLD_TIME, NOTIFIER);
(posedge CLK => (QB:1'bx)) = (`PROP_DELAY,`PROP_DELAY);
endspecify
endmodule
`endcelldefine


`celldefine
module DFFQSRX1 (CLK, D, SETB, RESETB, Q);

       output Q;
       input D, CLK, RESETB, SETB;

reg NOTIFIER;
  buf   XX0 (xSN, SETB);
  buf   XX1 (xRN, RESETB);
  buf     IC (clk, CLK);
  udp_dff I0 (n0, D, clk, xRN, xSN, NOTIFIER);
  buf     I1 (Q, n0);

wire ENABLE_RESETB_AND_SETB ;
wire ENABLE_D_AND_SETB ;
wire ENABLE_SETB ;
wire ENABLE_NOT_D_AND_RESETB ;
wire ENABLE_RESETB ;
assign ENABLE_RESETB_AND_SETB = (RESETB&SETB) ? 1'b1:1'b0;
assign ENABLE_D_AND_SETB = (D&SETB) ? 1'b1:1'b0;
assign ENABLE_SETB = (SETB) ? 1'b1:1'b0;
assign ENABLE_NOT_D_AND_RESETB = (!D&RESETB) ? 1'b1:1'b0;
assign ENABLE_RESETB = (RESETB) ? 1'b1:1'b0;

specify
$width(posedge CLK &&& (ENABLE_RESETB_AND_SETB), `WIDTH,`WIDTH_THD,NOTIFIER);
$width(negedge CLK &&& (ENABLE_RESETB_AND_SETB), `WIDTH,`WIDTH_THD,NOTIFIER);
$setuphold(posedge CLK &&& (ENABLE_RESETB_AND_SETB), posedge D, `SETUP_TIME, `HOLD_TIME, NOTIFIER);
$setuphold(posedge CLK &&& (ENABLE_RESETB_AND_SETB), negedge D, `SETUP_TIME, `HOLD_TIME, NOTIFIER);
$recrem(posedge RESETB, posedge CLK &&& (ENABLE_D_AND_SETB), `RECOVERY_TIME, `REMOVAL_TIME, NOTIFIER);
$width(negedge RESETB &&& (ENABLE_SETB), `WIDTH,`WIDTH_THD,NOTIFIER);
$recrem(posedge SETB, posedge CLK &&& (ENABLE_NOT_D_AND_RESETB), `RECOVERY_TIME, `REMOVAL_TIME, NOTIFIER);
$setuphold(posedge RESETB, posedge SETB, `SETUP_TIME, `HOLD_TIME, NOTIFIER);
$width(negedge SETB &&& (ENABLE_RESETB), `WIDTH,`WIDTH_THD,NOTIFIER);
if (RESETB && SETB)
(posedge CLK => (Q:1'bx)) = (`PROP_DELAY,`PROP_DELAY);
if (~CLK && ~D && SETB)
(negedge RESETB *> (Q +: 1'b0))=(`INVALID_DELAY, `PROP_DELAY);
if (~CLK && D && SETB)
(negedge RESETB *> (Q +: 1'b0))=(`INVALID_DELAY, `PROP_DELAY);
if (CLK && ~D && SETB)
(negedge RESETB *> (Q +: 1'b0))=(`INVALID_DELAY, `PROP_DELAY);
if (CLK && D && SETB)
(negedge RESETB *> (Q +: 1'b0))=(`INVALID_DELAY, `PROP_DELAY);
if (~CLK && ~D && ~RESETB)
(SETB => Q) = (`PROP_DELAY, `PROP_DELAY);
if (~CLK && ~D && RESETB)
(negedge SETB *> (Q +: 1'b1))=(`PROP_DELAY, `INVALID_DELAY);
if (~CLK && D && ~RESETB)
(SETB => Q) = (`PROP_DELAY, `PROP_DELAY);
if (~CLK && D && RESETB)
(negedge SETB *> (Q +: 1'b1))=(`PROP_DELAY, `INVALID_DELAY);
if (CLK && ~D && ~RESETB)
(SETB => Q) = (`PROP_DELAY, `PROP_DELAY);
if (CLK && ~D && RESETB)
(negedge SETB *> (Q +: 1'b1))=(`PROP_DELAY, `INVALID_DELAY);
if (CLK && D && ~RESETB)
(SETB => Q) = (`PROP_DELAY, `PROP_DELAY);
if (CLK && D && RESETB)
(negedge SETB *> (Q +: 1'b1))=(`PROP_DELAY, `INVALID_DELAY);
endspecify
endmodule
`endcelldefine

`celldefine
module TIE1 (Z);
  output  Z;
  buf (Z, 1'b1);

specify
endspecify
endmodule
`endcelldefine

`celldefine
module TIE0 (Z);
  output  Z;
  buf (Z, 1'b0);

specify
endspecify
endmodule
`endcelldefine

`celldefine
module ANTENNA (A);
  input A;

specify
endspecify
endmodule
`endcelldefine


primitive udp_dff (out, in, clk, clr_, set_, NOTIFIER);
   output out;  
   input  in, clk, clr_, set_, NOTIFIER;
   reg    out;

   table

// in  clk  clr_   set_  NOT  : Qt : Qt+1
//
   0  r   ?   1   ?   : ?  :  0  ; // clock in 0
   1  r   1   ?   ?   : ?  :  1  ; // clock in 1
   1  *   1   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   1   ?   : 0  :  0  ; // reduce pessimism
   ?  f   ?   ?   ?   : ?  :  -  ; // no changes on negedge clk
   *  b   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   0   ?   : ?  :  1  ; // set output
   ?  b   1   *   ?   : 1  :  1  ; // cover all transistions on set_
   1  x   1   *   ?   : 1  :  1  ; // cover all transistions on set_
   ?  ?   0   1   ?   : ?  :  0  ; // reset output
   ?  b   *   1   ?   : 0  :  0  ; // cover all transistions on clr_
   0  x   *   1   ?   : 0  :  0  ; // cover all transistions on clr_
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_dff
