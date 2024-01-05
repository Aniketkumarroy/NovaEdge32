`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/20/2023 08:38:28 PM
// Design Name: 
// Module Name: Adder16
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


module Adder16(
    output [15:0] sum,
    output carry,
    input [15:0] x,
    input [15:0] y,
    input cin
    );
    
    wire c0, c1, c2;
    Adder4 add0(.sum(sum[3:0]), .carry(c0), .x(x[3:0]), .y(y[3:0]), .cin(cin));
    Adder4 add1(.sum(sum[7:4]), .carry(c1), .x(x[7:4]), .y(y[7:4]), .cin(c0));
    Adder4 add2(.sum(sum[11:8]), .carry(c2), .x(x[11:8]), .y(y[11:8]), .cin(c1));
    Adder4 add3(.sum(sum[15:12]), .carry(carry), .x(x[15:12]), .y(y[15:12]), .cin(c2));
endmodule
