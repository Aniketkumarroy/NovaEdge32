`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/24/2023 11:14:58 PM
// Design Name: 
// Module Name: ram_32x1024
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


module ram_32x1024(
    output [31:0] data_out,
    input [31:0] data_in,
    input [9:0] addr,
    input read_en,
    input write_en,
    input cs,
    input clk
    );
    
    parameter size = 1024;
    reg [31:0] Data;
    reg [31:0] memory[0:size-1];
    
    assign data_out = (read_en && cs)? Data: 32'bz;

    
    always @(posedge clk)
        begin
            if (write_en && ~read_en)
                memory[addr] = data_in;
        end
    always @(addr)
        begin
//            if (read_en && ~write_en)
            Data = memory[addr];
        end
endmodule
