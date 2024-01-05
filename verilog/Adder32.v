`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/20/2023 06:59:29 PM
// Design Name: 
// Module Name: Adder32
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


module Adder32(
    output [31:0] sum,
    output carry,
    input [31:0] x,
    input [31:0] y,
    input cin
    );
    wire c;
    
    Adder16 add0(.sum(sum[15:0]), .carry(c), .x(x[15:0]), .y(y[15:0]), .cin(cin));
    Adder16 add1(.sum(sum[31:16]), .carry(carry), .x(x[31:16]), .y(y[31:16]), .cin(c));
endmodule
