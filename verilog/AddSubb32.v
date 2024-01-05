`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/21/2023 09:01:08 PM
// Design Name: 
// Module Name: AddSubb32
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


module AddSubb32(
    output [31:0] result,
    output sign,
    output carry,
    output overflow,
    input [31:0] x,
    input [31:0] y,
    input ctrl
    );
    
    // for calculating the initial sum
    wire y_b;
    wire [31:0] sum_out;
    xor_bus ADD_SUBB_control(.out(y_b), .in(y), .ctrl(ctrl)); // ctrl = 1 for subb, ctrl = 0 for add
    Adder32 ADD(.sum(sum_out), .carry(carry), .x(x), .y(y_b), .cin(1'b0));
    and(sign, ~carry, ctrl);
    
    // for sign correction
    wire y_c;
    xor_bus Sign_Complement_Control(.out(y_c), .in(sum_out), .ctrl(sign));
    Adder32 Sign_Complement(.sum(result), .x({32{1'b0}}), .y(y_c), .cin(sign));
    
    // for generating overflow
    wire t1, t2;
    and(t1, x[31], y[31], ~sum_out);
    and(t2, ~x[31], ~y[31], sum_out);
    or(overflow, t1, t2);
endmodule
