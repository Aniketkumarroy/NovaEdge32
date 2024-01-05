`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/21/2023 05:42:53 PM
// Design Name: 
// Module Name: xor_bus
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


module xor_bus(
    output [31:0] out,
    input [31:0] in,
    input ctrl
    );
    
    xor(out[0], in[0], ctrl);
    xor(out[1], in[1], ctrl);
    xor(out[2], in[2], ctrl);
    xor(out[3], in[3], ctrl);
    xor(out[4], in[4], ctrl);
    xor(out[5], in[5], ctrl);
    xor(out[6], in[6], ctrl);
    xor(out[7], in[7], ctrl);
    xor(out[8], in[7], ctrl);
    xor(out[9], in[9], ctrl);
    xor(out[10], in[10], ctrl);
    xor(out[11], in[11], ctrl);
    xor(out[12], in[12], ctrl);
    xor(out[13], in[13], ctrl);
    xor(out[14], in[14], ctrl);
    xor(out[15], in[15], ctrl);
    xor(out[16], in[16], ctrl);
    xor(out[17], in[17], ctrl);
    xor(out[18], in[18], ctrl);
    xor(out[19], in[19], ctrl);
    xor(out[20], in[20], ctrl);
    xor(out[21], in[21], ctrl);
    xor(out[22], in[22], ctrl);
    xor(out[23], in[23], ctrl);
    xor(out[24], in[24], ctrl);
    xor(out[25], in[25], ctrl);
    xor(out[26], in[26], ctrl);
    xor(out[27], in[27], ctrl);
    xor(out[28], in[28], ctrl);
    xor(out[29], in[29], ctrl);
    xor(out[30], in[30], ctrl);
    xor(out[31], in[31], ctrl);
    
endmodule
