`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/22/2023 12:39:34 PM
// Design Name: 
// Module Name: mux8x3
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


module mux8x3(
    output out,
    input [7:0] in,
    input [2:0] sel
    );
    
    wire t0, t1;
    
    mux4x2 MUX_4X2_3_0(.out(t0), .in(in[3:0]), .sel(sel[1:0]));
    mux4x2 MUX_4X2_7_4(.out(t1), .in(in[7:4]), .sel(sel[1:0]));
    mux2x1 MUX_2X1(.out(out), .in0(t0), .in1(t1), .sel(sel[2]));
endmodule
