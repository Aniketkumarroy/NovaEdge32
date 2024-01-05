`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/25/2023 03:55:37 AM
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    output alu_en,
    output alu_func,
    output [2:0] alu_opcode,
    output ALUSrcA,
    output ALUSrcB,
    output [2:0] ImmSrc,
    output ImmEnable,
    output [1:0] PCSrc,
    output Reg_write,
    output [1:0] RegWriteResultSrc,
    output Mem_write,
    output Mem_read,
    output Mem_read_write,
    input Instr30,
    input [2:0] Instr12_14,
    input [4:0] opcode
    );
    
//    we will use a AND plane and a OR plane for the microcode
//                 supported opcodes and microcode:
//    0 1 1 0 1 ---|--------|--------|---------x-------------|------------|----------|---------x---------|----------|----------|------------|---------|-------------|--------------------x-------------- row0
//    0 0 1 0 1 ---x--------x--------x---------x-------------|------------|----------|---------x---------|----------|----------|------------|---------|-------------|--------------------|-------------- row1
//    0 0 1 0 0 ---x--------|--------x---------x-------------|------------|----------|---------x---------|----------|----------x------------|---------|-------------|--------------------|-------------- row2
//    0 1 1 0 0 ---x--------|--------|---------x-------------|------------|----------|---------|---------|----------|----------|------------|---------|-------------|--------------------|-------------- row3
//    0 0 0 0 0 ---x--------|--------x---------x-------------|------------|----------x---------x---------|----------|----------x------------|---------|-------------x--------------------|-------------- row4
//    0 1 0 0 0 ---x--------|--------x---------|-------------x------------x----------|---------x---------|----------x----------|------------|---------|-------------|--------------------|-------------- row5   
//    1 1 0 0 0 ---x--------|--------|---------|-------------|------------|----------|---------x---------x----------x----------|------------|---------x-------------|--------------------|-------------- row6
//    1 1 0 0 1 ---x--------|--------x---------x-------------|------------|----------|---------x---------|----------|----------x------------x---------x-------------x--------------------x-------------- row7   
//    1 1 0 1 1 ---|--------|--------|---------x-------------|------------|----------|---------x---------x----------|----------|------------x---------|-------------x--------------------x-------------- row8
//                 |        |        |         |             |            |          |         |         |          |          |            |         |             |                    |
//               alu_en  ALUSrcA  ALUSrcB  Reg_write  Mem_read_write  Mem_write  Mem_read  ImmEnable  ImmSrc[2]  ImmSrc[1]  ImmSrc[0]  PCSrc[0]  PCSrc[1]  RegWriteResultSrc[1]  RegWriteResultSrc[0]


//                                                _________
// Instr30 --------------------------------------|         |
//                ________                       |         |
// row2----------|        |                      |         |
//               |   OR   |----------------------|   AND   |--------------- alu_func
// row3----------|        |                      |         |
//                ‾‾‾‾‾‾‾‾               ┌-------|         | 
//                                       |        ‾‾‾‾‾‾‾‾‾
//                         ________      |
// row2----------------|>o|        |     |
//                        |   OR   |-----┘
// code for right shift---|        |          
//                         ‾‾‾‾‾‾‾‾ 


//                                                 _________
// Instr12_14------------------------/------------|         |                                _________
//                            _________           | bitwise |----------------/--------------| bitwise |
// {row2, row2, row2}---/----| bitwise |          |   AND   |                               |   OR    |------/-------- alu_opcode
//                           |   OR    |----/-----|         |                       ┌---/---|         |
// {row3, row3, row3}---/----|         |           ‾‾‾‾‾‾‾‾‾         _________      |        ‾‾‾‾‾‾‾‾‾
//                            ‾‾‾‾‾‾‾‾‾   {row6, row6, row6}---/----| bitwise |     |
//                                                                  |   AND   |-----┘
//                                     {0, 1, Instr12_14[1]}---/----|         |
//                                                                   ‾‾‾‾‾‾‾‾‾
    
    wire row0, row1, row2, row3, row4, row5, row6, row7, row8, row9;

//  the AND plane
    and(row0, ~opcode[0],  opcode[1],  opcode[2], ~opcode[3],  opcode[4]);
    and(row1, ~opcode[0], ~opcode[1],  opcode[2], ~opcode[3],  opcode[4]);
    and(row2, ~opcode[0], ~opcode[1],  opcode[2], ~opcode[3], ~opcode[4]);
    and(row3, ~opcode[0],  opcode[1],  opcode[2], ~opcode[3], ~opcode[4]);
    and(row4, ~opcode[0], ~opcode[1], ~opcode[2], ~opcode[3], ~opcode[4]);
    and(row5, ~opcode[0],  opcode[1], ~opcode[2], ~opcode[3], ~opcode[4]);
    and(row6,  opcode[0],  opcode[1], ~opcode[2], ~opcode[3], ~opcode[4]);
    and(row7,  opcode[0],  opcode[1], ~opcode[2], ~opcode[3],  opcode[4]);
    assign row8 = ~row2; // and(row8,  opcode[0],  opcode[1], ~opcode[2],  opcode[3],  opcode[4]);

//  the OR plane
    nand(alu_en, row0, row8); // or(alu_en, row1, row2, row3, row4, row5, row6, row7);
    assign ALUSrcA = row1;
    or(ALUSrcB, row1, row2, row4, row5, row7);
    or(Reg_write, row0, row1, row2, row3, row4, row7, row8);
    or(RegWriteResultSrc[1], row7, row4, row8);
    or(RegWriteResultSrc[0], row0, row7, row8);
    or(ImmSrc[0], row2, row4, row7);
    or(ImmSrc[1], row6, row5);
    or(ImmSrc[2], row6, row8);
    assign ImmEnable = ~row3; // or(ImmEnable, row0, row1, row2, row4, row5, row6, row7, row8);
    or(PCSrc[0], row7, row8);
    or(PCSrc[1], row7, row6);
    assign alu_func = (Instr30) && (row2 || row3) && ((~row2) || ((Instr12_14[2]) && (~Instr12_14[1]) && (Instr12_14[0])));
    assign alu_opcode = (Instr12_14 & ({row2, row2, row2} | {row3, row3, row3})) | ({row6, row6, row6} & {1'b0, 1'b1, Instr12_14[1]});
    assign Mem_read = row4;
    assign Mem_read_write = row5;
    assign Mem_write = row5;


endmodule
