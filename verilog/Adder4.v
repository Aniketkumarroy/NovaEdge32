`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/20/2023 07:45:35 PM
// Design Name: 
// Module Name: Adder4
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


module Adder4(
    output [3:0] sum,
    output carry,
    input [3:0] x,
    input [3:0] y,
    input cin
    );
    
    wire p0, p1, p2, p3, g0, g1, g2, g3;
    
    xor(p0, x[0], y[0]);
    xor(p1, x[1], y[1]);
    xor(p2, x[2], y[2]);
    xor(p3, x[3], y[3]);
    
    and(g0, x[0], y[0]);
    and(g1, x[1], y[1]);
    and(g2, x[2], y[2]);
    and(g3, x[3], y[3]);
    
    wire c1, c2, c3, c4;
    
    carry_look_ahead4 CLA_circuit(.c1(c1), .c2(c2), .c3(c3), .c4(c4),
                      .c0(cin), .p0(p0), .g0(g0), .p1(p1),
                      .g1(g1), .p2(p2), .g2(g2), .p3(p3), .g3(g3));

    assign carry = c4;
    xor(sum[0], cin, p0);
    xor(sum[1], c1, p1);
    xor(sum[2], c2, p2);
    xor(sum[3], c3, p3);
endmodule
