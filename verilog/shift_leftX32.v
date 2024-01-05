`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/22/2023 01:04:15 PM
// Design Name: 
// Module Name: shift_leftX32
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


module shift_leftX32(
    output [31:0] out,
    input [31:0] in,
    input [4:0] n,
    input ctrl
    );
    
    mux32x5 MUX31(.out(out[31]), .in(in), .sel(n));
    mux32x5 MUX30(.out(out[30]), .in({in[30:0], {1{ctrl}}}), .sel(n));
    mux32x5 MUX29(.out(out[29]), .in({in[29:0], {2{ctrl}}}), .sel(n));
    mux32x5 MUX28(.out(out[28]), .in({in[28:0], {3{ctrl}}}), .sel(n));
    mux32x5 MUX27(.out(out[27]), .in({in[27:0], {4{ctrl}}}), .sel(n));
    mux32x5 MUX26(.out(out[26]), .in({in[26:0], {5{ctrl}}}), .sel(n));
    mux32x5 MUX25(.out(out[25]), .in({in[25:0], {6{ctrl}}}), .sel(n));
    mux32x5 MUX24(.out(out[24]), .in({in[24:0], {7{ctrl}}}), .sel(n));
    mux32x5 MUX23(.out(out[23]), .in({in[23:0], {8{ctrl}}}), .sel(n));
    mux32x5 MUX22(.out(out[22]), .in({in[22:0], {9{ctrl}}}), .sel(n));
    mux32x5 MUX21(.out(out[21]), .in({in[21:0], {10{ctrl}}}), .sel(n));
    mux32x5 MUX20(.out(out[20]), .in({in[20:0], {11{ctrl}}}), .sel(n));
    mux32x5 MUX19(.out(out[19]), .in({in[19:0], {12{ctrl}}}), .sel(n));
    mux32x5 MUX18(.out(out[18]), .in({in[18:0], {13{ctrl}}}), .sel(n));
    mux32x5 MUX17(.out(out[17]), .in({in[17:0], {14{ctrl}}}), .sel(n));
    mux32x5 MUX16(.out(out[16]), .in({in[16:0], {15{ctrl}}}), .sel(n));
    mux32x5 MUX15(.out(out[15]), .in({in[15:0], {16{ctrl}}}), .sel(n));
    mux32x5 MUX14(.out(out[14]), .in({in[14:0], {17{ctrl}}}), .sel(n));
    mux32x5 MUX13(.out(out[13]), .in({in[13:0], {18{ctrl}}}), .sel(n));
    mux32x5 MUX12(.out(out[12]), .in({in[12:0], {19{ctrl}}}), .sel(n));
    mux32x5 MUX11(.out(out[11]), .in({in[11:0], {20{ctrl}}}), .sel(n));
    mux32x5 MUX10(.out(out[10]), .in({in[10:0], {21{ctrl}}}), .sel(n));
    mux32x5 MUX9(.out(out[9]), .in({in[9:0], {22{ctrl}}}), .sel(n));
    mux32x5 MUX8(.out(out[8]), .in({in[8:0], {23{ctrl}}}), .sel(n));
    mux32x5 MUX7(.out(out[7]), .in({in[7:0], {24{ctrl}}}), .sel(n));
    mux32x5 MUX6(.out(out[6]), .in({in[6:0], {25{ctrl}}}), .sel(n));
    mux32x5 MUX5(.out(out[5]), .in({in[5:0], {26{ctrl}}}), .sel(n));
    mux32x5 MUX4(.out(out[4]), .in({in[4:0], {27{ctrl}}}), .sel(n));
    mux32x5 MUX3(.out(out[3]), .in({in[3:0], {28{ctrl}}}), .sel(n));
    mux32x5 MUX2(.out(out[2]), .in({in[2:0], {29{ctrl}}}), .sel(n));
    mux32x5 MUX1(.out(out[1]), .in({in[1:0], {30{ctrl}}}), .sel(n));
    mux32x5 MUX0(.out(out[0]), .in({in[0], {31{ctrl}}}), .sel(n));
    
endmodule
