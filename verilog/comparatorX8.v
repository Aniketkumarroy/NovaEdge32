`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/22/2023 03:01:27 AM
// Design Name: 
// Module Name: comparatorX8
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


module comparatorX8(
    output equal,
    output greater,
    output less,
    input [7:0] x,
    input [7:0] y,
    input sign
    );
    
    wire e0, e1;
    wire g0, g1;
    wire l0, l1;
    comparatorX4 Compare7_4(.greater(g1), .less(l1), .equal(e1), .x(x[7:4]), .y(y[7:4]), .sign(sign));
    comparatorX4 Compare3_0(.greater(g0), .less(l0), .equal(e0), .x(x[3:0]), .y(y[3:0]), .sign(1'b0));
    
    mux2x1 Equal(.out(equal), .in0(1'b0), .in1(e0), .sel(e1));
    mux2x1 Greater(.out(greater), .in0(g1), .in1(g0), .sel(e1));
    mux2x1 Less(.out(less), .in0(l1), .in1(l0), .sel(e1));
endmodule
