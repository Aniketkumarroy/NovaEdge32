`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/20/2023 07:05:03 PM
// Design Name: 
// Module Name: mux2x1
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


module mux2x1(
    output out,
    input in0,
    input in1,
    input sel
    );
    
    wire t0, t1;
    and(t0, ~sel, in0);
    and(t1, sel, in1);
    or(out, t0, t1);
endmodule
