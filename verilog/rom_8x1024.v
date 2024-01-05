`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/23/2023 08:15:42 PM
// Design Name: 
// Module Name: rom_8x1024
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


module rom_32x1024(
    output [31:0] instr,
    input [9:0] addr,
    input read_en,
    input cs
    );
    
    parameter size = 1024;
    reg [31:0] d_out;
    reg [31:0] memory[0:size-1];
    
    assign instr = (read_en && cs) ? d_out: 32'bz;
    
    initial
        $readmemh("Instruction_ROM_8x1024.mem", memory);
        
    always @(read_en)
//        if (read_en)
        begin
            d_out = memory[addr];
        end
endmodule
