`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/20/2023 07:27:52 PM
// Design Name: 
// Module Name: carry_look_ahead4
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


module carry_look_ahead4(
    output c1,
    output c2,
    output c3,
    output c4,
    input c0,
    input p0,
    input g0,
    input p1,
    input g1,
    input p2,
    input g2,
    input p3,
    input g3
    );
    
    wire t11, t21, t22, t31, t32, t33, t41, t42, t43, t44;
    and(t11, p0, c0);
    or(c1, g0, t11); // c1 = g0 + p0c0
    
    and(t21, p1, g0);
    and(t22, p1, p0, c0);
    or(c2, g1, t21, t22); // c2 = g1 + p1g0 + p1p0c0
    
    and(t31, p2, g1);
    and(t32, p2, p1, g0);
    and(t33, p2, p1, p0, c0);
    or(c3, g2, t31, t32, t33); // c3 = g2 + p2g1 + p2p1g0 + p2p1p0c0
    
    and(t41, p3, g2);
    and(t42, p3, p2, g1);
    and(t43, p3, p2, p1, g0);
    and(t44, p3, p2, p1, p0, c0);
    or(c4, g3, t41); // c4 = g3 + p3g2 + p3p2g1 + p3p2p1g0 + p3p2p1p0c0
endmodule
