`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/30/2023 11:02:53 AM
// Design Name: 
// Module Name: PCBranch
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


module PCBranch(
    output reg out,
    input equal,
    input greater,
    input less,
    input [2:0] funct3
    );

    always @(*)
        casex ({funct3[2], funct3[0]})
            2'b00 : out = equal;
            2'b01 : out = ~equal;
            2'b10 : out = less;
            2'b11 : out = equal | greater;
            default: out = 1'b0;
        endcase
endmodule
