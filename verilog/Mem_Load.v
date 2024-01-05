`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/28/2023 10:14:18 AM
// Design Name: 
// Module Name: Mem_Load
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


module Mem_Load(
    output reg [31:0] out,
    input [31:0] in,
    input [2:0] op
    );

    always @(*)
        if (op[1])
            out = in;
        else
            casex ({op[2], op[0]})
                2'b00 : out = {{24{in[7]}}, in[7:0]};
                2'b01 : out = {{16{in[15]}}, in[15:0]};
                2'b10 : out = {{24{1'b0}}, in[7:0]};
                2'b11 : out = {{16{1'b0}}, in[15:0]};
                default: out = 32'bz;
            endcase
endmodule
