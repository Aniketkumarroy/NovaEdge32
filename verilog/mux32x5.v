`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/22/2023 03:40:15 AM
// Design Name: 
// Module Name: mux32x5
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


module mux32x5(
    output out,
    input [31:0] in,
    input [4:0] sel
    );
//    assign out = in[sel];

    wire t0, t1;
    
    mux16x4 MUX_16X4_15_0(.out(t0), .in(in[15:0]), .sel(sel[3:0]));
    mux16x4 MUX_16X4_31_16(.out(t1), .in(in[31:16]), .sel(sel[3:0]));
    mux2x1 MUX_2X1(.out(out), .in0(t0), .in1(t1), .sel(sel[4]));

endmodule
