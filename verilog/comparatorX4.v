`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/22/2023 01:16:44 AM
// Design Name: 
// Module Name: comparatorX4
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


module comparatorX4(
    output equal,
    output greater,
    output less,
    input [3:0] x,
    input [3:0] y,
    input sign
    );
    
    // sign = 1 for signed numbers, for unsigned numbers sign = 0
    wire x3, y3;
    xor(x3, x[3], sign);
    xor(y3, y[3], sign);
    
    // for checking for equality
    wire eq0, eq1, eq2, eq3;
    xor(eq0, x[0], y[0]);
    xor(eq1, x[1], y[1]);
    xor(eq2, x[2], y[2]);
    xor(eq3, x3, y3);
    
    and(equal, eq0, eq1, eq2, eq3);
    
    // for checking for x > y
    wire gr0, gr1, gr2, gr3;
    and(gr3, x3, ~y3);
    and(gr2, x[2], ~y[2], eq3);
    and(gr1, x[1], ~y[1], eq3, eq2);
    and(gr0, x[0], ~y[0], eq3, eq2, eq1);
    
    or(greater, gr0, gr1, gr2, gr3);
    
    // for checking x < y
    wire le0, le1, le2, le3;
    and(le3, ~x3, y3);
    and(le2, ~x[2], y[2], eq3);
    and(le1, ~x[1], y[1], eq3, eq2);
    and(le0, ~x[0], y[0], eq3, eq2, eq1);
    
    or(less, le0, le1, le2, le3);
endmodule
