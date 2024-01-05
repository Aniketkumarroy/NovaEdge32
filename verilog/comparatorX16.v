`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/22/2023 01:48:57 AM
// Design Name: 
// Module Name: comparatorX16
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


module comparatorX16(
    output greater,
    output less,
    output equal,
    input [15:0] x,
    input [15:0] y,
    input sign
    );
    
    wire e0, e1;
    wire g0, g1;
    wire l0, l1;
    comparatorX8 Compare15_8(.greater(g1), .less(l1), .equal(e1), .x(x[15:8]), .y(y[15:8]), .sign(sign));
    comparatorX8 Compare7_0(.greater(g0), .less(l0), .equal(e0), .x(x[7:0]), .y(y[7:0]), .sign(1'b0));
    
    mux2x1 Equal(.out(equal), .in0(1'b0), .in1(e0), .sel(e1));
    mux2x1 Greater(.out(greater), .in0(g1), .in1(g0), .sel(e1));
    mux2x1 Less(.out(less), .in0(l1), .in1(l0), .sel(e1));
    
//    wire g0, g1, g2, g3;
//    wire l0, l1, l2, l3;
//    wire e0, e1, e2, e3;
    
//    comparatorX4 Compare15_12(.equal(e3), .greater(g3), .less(l3), .x(x[15:12]), .y(y[15:12]), .sign(sign));
//    comparatorX4 Compare11_8(.equal(e2), .greater(g2), .less(l2), .x(x[11:8]), .y(y[11:8]), .sign(1'b0));
//    comparatorX4 Compare7_4(.equal(e1), .greater(g1), .less(l1), .x(x[7:4]), .y(y[7:4]), .sign(1'b0));
//    comparatorX4 Compare3_0(.equal(e0), .greater(g0), .less(l0), .x(x[3:0]), .y(y[3:0]), .sign(1'b0));
    
//    always @(*)
//        if (e3)
//            begin
//                if (e2)
//                    begin
//                        if (e1)
//                            begin
//                                {greater, equal, less} = {g0, e0, l0};
//                            end
//                        else
//                            {greater, equal, less} = {g1, e1, l1};
//                    end
//                else
//                    {greater, equal, less} = {g2, e2, l2};
//            end
//        else
//            {greater, equal, less} = {g3, e3, l3};
endmodule
