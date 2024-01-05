`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/22/2023 02:21:13 AM
// Design Name: 
// Module Name: comparatorX32
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


module comparatorX32(
    output equal,
    output greater,
    output less,
    input [31:0] x,
    input [31:0] y,
    input sign
    );
    
    wire e0, e1;
    wire g0, g1;
    wire l0, l1;
    comparatorX16 Compare31_16(.greater(g1), .less(l1), .equal(e1), .x(x[31:16]), .y(y[31:16]), .sign(sign));
    comparatorX16 Compare15_0(.greater(g0), .less(l0), .equal(e0), .x(x[15:0]), .y(y[15:0]), .sign(1'b0));
    
    mux2x1 Equal(.out(equal), .in0(1'b0), .in1(e0), .sel(e1));
    mux2x1 Greater(.out(greater), .in0(g1), .in1(g0), .sel(e1));
    mux2x1 Less(.out(less), .in0(l1), .in1(l0), .sel(e1));
    
//    always @(*)
//        if (e1)
//            {greater, equal, less} = {g0, e0, l0};
//        else
//            {greater, equal, less} = {g1, e1, l1};
            
endmodule
