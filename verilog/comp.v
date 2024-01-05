`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/22/2023 01:08:43 AM
// Design Name: 
// Module Name: comp
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


module comp(
    input a,
    input b,
    output reg [2:0] out
    );
    
    always @(*)
        begin
            if(a > b)
                out = {1'b1, 1'b0, 1'b0};
            else if (a < b)
                out = {1'b0, 1'b0, 1'b1};
            else
                out = {1'b0, 1'b1, 1'b0};
        end
endmodule
