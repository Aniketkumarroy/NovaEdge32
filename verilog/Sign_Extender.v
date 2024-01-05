`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/25/2023 01:55:31 PM
// Design Name: 
// Module Name: Sign_Extender_12_32
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


module Sign_Extender(
    output reg [31:0] out,
    input [31:0] in,
    input [2:0] ctrl,
    input en    
    );
    
    always @(*)
        if (en)
            if (ctrl[0])
                out = {{20{in[31]}}, in[31:20]};
            else
                casex (ctrl[2:1])
                    3'b00 : out = {in[31:12], {12{1'b0}}};
                    3'b01 : out = {{20{in[31]}}, in[31:25], in[11:7]};
                    3'b10 : out = {{12{in[31]}}, in[31], in[19:12], in[20], in[30:21]};
                    3'b11 : out = {{20{in[31]}}, in[31], in[7], in[30:25], in[11:8]};
                    default: out = 32'bz;
                endcase
        else
            out = 32'bz;
endmodule
