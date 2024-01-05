`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/25/2023 03:03:48 AM
// Design Name: 
// Module Name: mux_32bit_8x3
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


module mux_32bus_8x3(
    output [31:0] out,
    input [31:0] in0,
    input [31:0] in1,
    input [31:0] in2,
    input [31:0] in3,
    input [31:0] in4,
    input [31:0] in5,
    input [31:0] in6,
    input [31:0] in7,
    input [2:0] sel
    );

    mux8x3 MUX0(.out(out[0]), .in({in0[0], in1[0], in2[0], in3[0], in4[0], in5[0], in6[0], in7[0]}), .sel(sel));
    mux8x3 MUX1(.out(out[1]), .in({in0[1], in1[1], in2[1], in3[1], in4[1], in5[1], in6[1], in7[1]}), .sel(sel));
    mux8x3 MUX2(.out(out[2]), .in({in0[2], in1[2], in2[2], in3[2], in4[2], in5[2], in6[2], in7[2]}), .sel(sel));
    mux8x3 MUX3(.out(out[3]), .in({in0[3], in1[3], in2[3], in3[3], in4[3], in5[3], in6[3], in7[3]}), .sel(sel));
    mux8x3 MUX4(.out(out[4]), .in({in0[4], in1[4], in2[4], in3[4], in4[4], in5[4], in6[4], in7[4]}), .sel(sel));
    mux8x3 MUX5(.out(out[5]), .in({in0[5], in1[5], in2[5], in3[5], in4[5], in5[5], in6[5], in7[5]}), .sel(sel));
    mux8x3 MUX6(.out(out[6]), .in({in0[6], in1[6], in2[6], in3[6], in4[6], in5[6], in6[6], in7[6]}), .sel(sel));
    mux8x3 MUX7(.out(out[7]), .in({in0[7], in1[7], in2[7], in3[7], in4[7], in5[7], in6[7], in7[7]}), .sel(sel));
    mux8x3 MUX8(.out(out[8]), .in({in0[8], in1[8], in2[8], in3[8], in4[8], in5[8], in6[8], in7[8]}), .sel(sel));
    mux8x3 MUX9(.out(out[9]), .in({in0[9], in1[9], in2[9], in3[9], in4[9], in5[9], in6[9], in7[9]}), .sel(sel));
    mux8x3 MUX10(.out(out[10]), .in({in0[10], in1[10], in2[10], in3[10], in4[10], in5[10], in6[10], in7[10]}), .sel(sel));
    mux8x3 MUX11(.out(out[11]), .in({in0[11], in1[11], in2[11], in3[11], in4[11], in5[11], in6[11], in7[11]}), .sel(sel));
    mux8x3 MUX12(.out(out[12]), .in({in0[12], in1[12], in2[12], in3[12], in4[12], in5[12], in6[12], in7[12]}), .sel(sel));
    mux8x3 MUX13(.out(out[13]), .in({in0[13], in1[13], in2[13], in3[13], in4[13], in5[13], in6[13], in7[13]}), .sel(sel));
    mux8x3 MUX14(.out(out[14]), .in({in0[14], in1[14], in2[14], in3[14], in4[14], in5[14], in6[14], in7[14]}), .sel(sel));
    mux8x3 MUX15(.out(out[15]), .in({in0[15], in1[15], in2[15], in3[15], in4[15], in5[15], in6[15], in7[15]}), .sel(sel));
    mux8x3 MUX16(.out(out[16]), .in({in0[16], in1[16], in2[16], in3[16], in4[16], in5[16], in6[16], in7[16]}), .sel(sel));
    mux8x3 MUX17(.out(out[17]), .in({in0[17], in1[17], in2[17], in3[17], in4[17], in5[17], in6[17], in7[17]}), .sel(sel));
    mux8x3 MUX18(.out(out[18]), .in({in0[18], in1[18], in2[18], in3[18], in4[18], in5[18], in6[18], in7[18]}), .sel(sel));
    mux8x3 MUX19(.out(out[19]), .in({in0[19], in1[19], in2[19], in3[19], in4[19], in5[19], in6[19], in7[19]}), .sel(sel));
    mux8x3 MUX20(.out(out[20]), .in({in0[20], in1[20], in2[20], in3[20], in4[20], in5[20], in6[20], in7[20]}), .sel(sel));
    mux8x3 MUX21(.out(out[21]), .in({in0[21], in1[21], in2[21], in3[21], in4[21], in5[21], in6[21], in7[21]}), .sel(sel));
    mux8x3 MUX22(.out(out[22]), .in({in0[22], in1[22], in2[22], in3[22], in4[22], in5[22], in6[22], in7[22]}), .sel(sel));
    mux8x3 MUX23(.out(out[23]), .in({in0[23], in1[23], in2[23], in3[23], in4[23], in5[23], in6[23], in7[23]}), .sel(sel));
    mux8x3 MUX24(.out(out[24]), .in({in0[24], in1[24], in2[24], in3[24], in4[24], in5[24], in6[24], in7[24]}), .sel(sel));
    mux8x3 MUX25(.out(out[25]), .in({in0[25], in1[25], in2[25], in3[25], in4[25], in5[25], in6[25], in7[25]}), .sel(sel));
    mux8x3 MUX26(.out(out[26]), .in({in0[26], in1[26], in2[26], in3[26], in4[26], in5[26], in6[26], in7[26]}), .sel(sel));
    mux8x3 MUX27(.out(out[27]), .in({in0[27], in1[27], in2[27], in3[27], in4[27], in5[27], in6[27], in7[27]}), .sel(sel));
    mux8x3 MUX28(.out(out[28]), .in({in0[28], in1[28], in2[28], in3[28], in4[28], in5[28], in6[28], in7[28]}), .sel(sel));
    mux8x3 MUX29(.out(out[29]), .in({in0[29], in1[29], in2[29], in3[29], in4[29], in5[29], in6[29], in7[29]}), .sel(sel));
    mux8x3 MUX30(.out(out[30]), .in({in0[30], in1[30], in2[30], in3[30], in4[30], in5[30], in6[30], in7[30]}), .sel(sel));
    mux8x3 MUX31(.out(out[31]), .in({in0[31], in1[31], in2[31], in3[31], in4[31], in5[31], in6[31], in7[31]}), .sel(sel));
endmodule
