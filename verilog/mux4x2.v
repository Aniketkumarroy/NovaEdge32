`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/22/2023 12:28:39 PM
// Design Name: 
// Module Name: mux4X2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux4x2(
    output out,
    input [3:0] in,
    input [1:0] sel
    );
    
    wire t0, t1, t2, t3;
    
//    mux2x1 MUX_2X1_1_0(.out(t0), .in0(in[0]), .in1(in[1]), .sel(sel[0]));
//    mux2x1 MUX_2X1_3_2(.out(t1), .in0(in[2]), .in1(in[3]), .sel(sel[0]));
//    mux2x1 MUX_2X1(.out(out), .in0(t0), .in1(t1), .sel(sel[1]));
    
    and(t0, in[0], ~sel[0], ~sel[1]);
    and(t1, in[1], ~sel[0], sel[1]);
    and(t2, in[2], sel[0], ~sel[1]);
    and(t3, in[3], sel[0], sel[1]);
    
    or(out, t0, t1, t2, t3);
endmodule
