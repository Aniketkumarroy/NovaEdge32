`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/22/2023 04:15:53 AM
// Design Name: 
// Module Name: shiftX32
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


module shiftX32(
    output [31:0] out,
    input [31:0] in,
    input [4:0] n,
    input rl,
    input sign
    );
    
    wire [31: 0] t0, t1, s_in, s_out;
    // rl = 0 for left shift, rl = 1 for right shift
    // sign = 0 for logical shift, sign = 1 for arithmetic shift
    wire s, rs;
    and(s, sign, in[31]);
    mux2x1 MUX_signed(.out(rs), .in0(1'b0), .in1(s), .sel(rl));
    swapX32 swap0(t0, in);
    mux_32bus_2x1 MUX1_2x1(.out(s_in), .in0(in), .in1(t0), .sel(rl));
    shift_leftX32 SHIFTX32(.out(s_out), .in(s_in), .n(n), .ctrl(rs));
    swapX32 swap1(t1, s_out);
    mux_32bus_2x1 MUX2_2x1(.out(out), .in0(s_out), .in1(t1), .sel(rl));
endmodule
