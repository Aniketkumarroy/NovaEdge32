`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/22/2023 12:44:41 PM
// Design Name: 
// Module Name: mux16x4
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


module mux16x4(
    output out,
    input [15:0] in,
    input [3:0] sel
    );
    
    wire t0, t1;
    
    mux8x3 MUX_8X3_7_0(.out(t0), .in(in[7:0]), .sel(sel[2:0]));
    mux8x3 MUX_8X3_15_8(.out(t1), .in(in[15:8]), .sel(sel[2:0]));
    mux2x1 MUX_2X1(.out(out), .in0(t0), .in1(t1), .sel(sel[3]));
endmodule
