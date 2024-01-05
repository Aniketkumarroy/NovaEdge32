`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/22/2023 02:41:46 PM
// Design Name: 
// Module Name: mux_32bus_2x
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


module mux_32bus_2x1(
    output [31:0] out,
    input [31:0] in0,
    input [31:0] in1,
    input sel
    );
    
    mux2x1 MUX0(.out(out[0]), .in0(in0[0]), .in1(in1[0]), .sel(sel));
    mux2x1 MUX1(.out(out[1]), .in0(in0[1]), .in1(in1[1]), .sel(sel));
    mux2x1 MUX2(.out(out[2]), .in0(in0[2]), .in1(in1[2]), .sel(sel));
    mux2x1 MUX3(.out(out[3]), .in0(in0[3]), .in1(in1[3]), .sel(sel));
    mux2x1 MUX4(.out(out[4]), .in0(in0[4]), .in1(in1[4]), .sel(sel));
    mux2x1 MUX5(.out(out[5]), .in0(in0[5]), .in1(in1[5]), .sel(sel));
    mux2x1 MUX6(.out(out[6]), .in0(in0[6]), .in1(in1[6]), .sel(sel));
    mux2x1 MUX7(.out(out[7]), .in0(in0[7]), .in1(in1[7]), .sel(sel));
    mux2x1 MUX8(.out(out[8]), .in0(in0[8]), .in1(in1[8]), .sel(sel));
    mux2x1 MUX9(.out(out[9]), .in0(in0[9]), .in1(in1[9]), .sel(sel));
    mux2x1 MUX10(.out(out[10]), .in0(in0[10]), .in1(in1[10]), .sel(sel));
    mux2x1 MUX11(.out(out[11]), .in0(in0[11]), .in1(in1[11]), .sel(sel));
    mux2x1 MUX12(.out(out[12]), .in0(in0[12]), .in1(in1[12]), .sel(sel));
    mux2x1 MUX13(.out(out[13]), .in0(in0[13]), .in1(in1[13]), .sel(sel));
    mux2x1 MUX14(.out(out[14]), .in0(in0[14]), .in1(in1[14]), .sel(sel));
    mux2x1 MUX15(.out(out[15]), .in0(in0[15]), .in1(in1[15]), .sel(sel));
    mux2x1 MUX16(.out(out[16]), .in0(in0[16]), .in1(in1[16]), .sel(sel));
    mux2x1 MUX17(.out(out[17]), .in0(in0[17]), .in1(in1[17]), .sel(sel));
    mux2x1 MUX18(.out(out[18]), .in0(in0[18]), .in1(in1[18]), .sel(sel));
    mux2x1 MUX19(.out(out[19]), .in0(in0[19]), .in1(in1[19]), .sel(sel));
    mux2x1 MUX20(.out(out[20]), .in0(in0[20]), .in1(in1[20]), .sel(sel));
    mux2x1 MUX21(.out(out[21]), .in0(in0[21]), .in1(in1[21]), .sel(sel));
    mux2x1 MUX22(.out(out[22]), .in0(in0[22]), .in1(in1[22]), .sel(sel));
    mux2x1 MUX23(.out(out[23]), .in0(in0[23]), .in1(in1[23]), .sel(sel));
    mux2x1 MUX24(.out(out[24]), .in0(in0[24]), .in1(in1[24]), .sel(sel));
    mux2x1 MUX25(.out(out[25]), .in0(in0[25]), .in1(in1[25]), .sel(sel));
    mux2x1 MUX26(.out(out[26]), .in0(in0[26]), .in1(in1[26]), .sel(sel));
    mux2x1 MUX27(.out(out[27]), .in0(in0[27]), .in1(in1[27]), .sel(sel));
    mux2x1 MUX28(.out(out[28]), .in0(in0[28]), .in1(in1[28]), .sel(sel));
    mux2x1 MUX29(.out(out[29]), .in0(in0[29]), .in1(in1[29]), .sel(sel));
    mux2x1 MUX30(.out(out[30]), .in0(in0[30]), .in1(in1[30]), .sel(sel));
    mux2x1 MUX31(.out(out[31]), .in0(in0[31]), .in1(in1[31]), .sel(sel));
    
endmodule
