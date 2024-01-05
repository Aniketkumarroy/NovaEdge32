`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/24/2023 11:51:21 PM
// Design Name: 
// Module Name: ALUx32
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


module ALUx32(
    output [31:0] alu_out,
    output greater,
    output less,
    output equal,
    output sign,
    output overflow,
    output carry,
    input alu_en,
    input [31:0] alu_SrcA,
    input [31:0] alu_SrcB,
    input [2:0] opcode,
    input ctrl
    );
    
    wire [31:0] AddSub_out, Shift_out, or_out, and_out, xor_out, compare_out;
    wire right_shift; // right_shift = 1 for right shift, right_shift = 0 for left shift
    wire signed_compare; // signed_compare = 1 for signed comparison, signed_compare = 0 for unsigned comparison
    
    reg [31:0] result;
    wire e, g, l; // e = equal flag, g = greater flag, l = less flag
    wire c, o, s; // c = carry flag, o = overflow flag, s = sign flag
    
//    assign right_shift = (opcode == 3'b101) ? 1'b1 : 1'b0; // opcode for right shift is 101, for left shift is 001
    assign right_shift = opcode[2] && (~opcode[1]) && opcode[0];
//    assign signed_compare = (opcode == 3'b010) ? 1'b1 : 1'b0; // opcode for signed comparison is 010, for unsigned comparison is 011
    assign signed_compare = (~opcode[2]) && opcode[1] && (~opcode[0]);
    
    assign alu_out = (alu_en) ? result : 32'bz;

    bufif1 compare_equal_en(equal, e, (alu_en & (((~opcode[2]) & (opcode[2]) & (~opcode[2])) | ((~opcode[2]) & (opcode[2]) & (opcode[2])))));
    bufif1 compare_greater_en(greater, g, (alu_en & (((~opcode[2]) & (opcode[2]) & (~opcode[2])) | ((~opcode[2]) & (opcode[2]) & (opcode[2])))));
    bufif1 compare_less_en(less, l, (alu_en & (((~opcode[2]) & (opcode[2]) & (~opcode[2])) | ((~opcode[2]) & (opcode[2]) & (opcode[2])))));

    bufif1 adder_carry_en(carry, c, (alu_en & ((~opcode[2]) & (~opcode[1]) & (~opcode[0]))));
    bufif1 adder_overflow_en(overflow, o, (alu_en & ((~opcode[2]) & (~opcode[1]) & (~opcode[0]))));
    bufif1 adder_sign_en(sign, s, (alu_en & ((~opcode[2]) & (~opcode[1]) & (~opcode[0]))));
    
    AddSubb32 ADDSUBB(.result(AddSub_out), .sign(s), .carry(c), .overflow(o), .x(alu_SrcA), .y(alu_SrcB), .ctrl(ctrl)); // ctrl = 1 for subtraction, ctrl = 0 for addition
    shiftX32 SHIFT(.out(Shift_out), .in(alu_SrcA), .n(alu_SrcB[4:0]), .rl(right_shift), .sign(right_shift && ctrl)); // ctrl = 1 for arithmetic sift, ctrl = 0 for logical
    and_32bit_bus AND(.out(and_out), .in0(alu_SrcA), .in1(alu_SrcB));
    or_32bit_bus OR(.out(or_out), .in0(alu_SrcA), .in1(alu_SrcB));
    xor_32bit_bus XOR(.out(xor_out), .in0(alu_SrcA), .in1(alu_SrcB));
    comparatorX32 COMPARE(.equal(e), .greater(g), .less(l), .x(alu_SrcA), .y(alu_SrcB), .sign(signed_compare));
    mux_32bus_2x1 MUX32bit(.out(compare_out), .in1({{31{1'b0}}, 1'b1}), .in0({32{1'b0}}), .sel(less));
    
//    mux_32bus_8x3 MUX32bit_8X3(.out(result), .in0(AddSub_out), .in1(Shift_out), .in2(compare_out), .in3(compare_out), .in4(xor_out), .in5(Shift_out), .in6(or_out), .in7(and_out), .sel(opcode));
    
    always @(*)
        casex(opcode)
            3'b000: result = AddSub_out;
            3'b001: result = Shift_out;
            3'b010: result = compare_out;
            3'b011: result = compare_out;
            3'b100: result = xor_out;
            3'b101: result = Shift_out;
            3'b110: result = or_out;
            3'b111: result = and_out;
            default: result = 32'bz;
        endcase

endmodule
