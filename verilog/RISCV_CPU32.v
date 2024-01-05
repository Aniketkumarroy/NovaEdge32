`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/25/2023 05:33:39 AM
// Design Name: 
// Module Name: RISCV_CPU32
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


module RISCV_CPU32(
    output [31:0] DataOut,
    input [31:0] DataIn,
    output DataRead,
    output DataWrite,
    output [31:0] DataAddr,
    output [31:0] InstrAddr,
    input [31:0] Instr,
    output Instr_read,
    input reset,
    input clock
    );
    
    parameter PC_Width = 32;
    parameter PC_Increment_Value = 32'h00000001; // since we are using a word addressible code memory

    wire [4:0] Opcode;
    wire [4:0] RegAddr1, RegAddr2, WriteRegAddr;
    wire [31:0] RegData1, RegData2;
    reg [31:0] WriteRegData;
    wire [31:0] alu_SrcA, alu_SrcB, ALU_result;
    wire Reg_write_en, ALU_en, ALU_func, opcode_funct7;
    wire [2:0] ALU_opcode, opcode_funct3;
    wire [PC_Width - 1:0] next_PC, Target_PC, Branched_Target_PC;
    reg [PC_Width - 1:0] PC;
    wire take_branch;
    wire [1:0] PCSrc;
    wire ALUSrcA, ALUSrcB;
    wire equal, greater, less;
    wire [1:0] RegWriteResultSrc;
    wire [31:0] Sign_extended_Immediate;
    wire [2:0] ImmSrc;
    wire ImmEnable;
    wire Mem_rd_wr;
    wire [31:0] Extended_data_memory, data_memory;

    // input
    assign Opcode = Instr[6:2];
    assign opcode_funct3 = Instr[14:12];
    assign opcode_funct7 = Instr[30];
    assign RegAddr1 = Instr[19:15];
    assign RegAddr2 = Instr[24:20];
    assign WriteRegAddr = Instr[11:7];

    //output
    assign InstrAddr = PC;
    assign DataAddr = ALU_result;
    assign DataOut = Extended_data_memory;
    assign data_memory = (Mem_rd_wr) ? RegData2 : DataIn;

    Mem_Load Memory_Load_Store(.out(Extended_data_memory), .in(data_memory), .op(opcode_funct3));
    // assign WriteRegData = (RegWriteResultSrc[0]) ? ((RegWriteResultSrc[1]) ? next_PC : DataIn) : (RegWriteResultSrc[1]) ? Sign_extended_Immediate : ALU_result;
    always @(RegWriteResultSrc, next_PC, DataIn, Sign_extended_Immediate, ALU_result)
        casex (RegWriteResultSrc)
            2'b00 : WriteRegData = ALU_result;
            2'b01 : WriteRegData = Sign_extended_Immediate;
            2'b10 : WriteRegData = Extended_data_memory;
            2'b11 : WriteRegData = next_PC;
            default: WriteRegData = 32'bz;
        endcase

    // alu src select
    assign alu_SrcA = (ALUSrcA) ? next_PC : RegData1;
    assign alu_SrcB = (ALUSrcB) ? Sign_extended_Immediate : RegData2;

    assign Branched_Target_PC = (take_branch) ? Target_PC : next_PC;

    Sign_Extender Sign_Extend_Immediate(.out(Sign_extended_Immediate), .in(Instr), .ctrl(ImmSrc), .en(ImmEnable));

    register_bank_32x32 RegisterFile(.Rdata_out1(RegData1),
                                     .Rdata_out2(RegData2), 
                                     .Wdata_in(WriteRegData), 
                                     .read_addr1(RegAddr1),
                                     .read_addr2(RegAddr2), 
                                     .write_addr(WriteRegAddr),
                                     .write_enable(Reg_write_en),
                                     .reset(reset),
                                     .clock(clock));

    ControlUnit Controller(.alu_en(ALU_en), 
                           .alu_func(ALU_func), 
                           .alu_opcode(ALU_opcode), 
                           .ALUSrcA(ALUSrcA), 
                           .ALUSrcB(ALUSrcB), 
                           .ImmSrc(ImmSrc),
                           .ImmEnable(ImmEnable),
                           .PCSrc(PCSrc), 
                           .Reg_write(Reg_write_en), 
                           .RegWriteResultSrc(RegWriteResultSrc),
                           .Mem_read_write(Mem_rd_wr),
                           .Mem_write(DataWrite), 
                           .Mem_read(DataRead), 
                           .Instr30(opcode_funct7), 
                           .Instr12_14(opcode_funct3), 
                           .opcode(Opcode));

    ALUx32 ALU(.alu_out(ALU_result),
               .greater(greater),
               .less(less),
               .equal(equal),
            //    .carry(),
            //    .sign(),
            //    .overflow(),
               .overflow(),
               .carry(),
               .alu_en(ALU_en),
               .alu_SrcA(alu_SrcA),
               .alu_SrcB(alu_SrcB),
               .opcode(ALU_opcode),
               .ctrl(ALU_func));

    Adder32 PC_Increment(.sum(next_PC), .x(PC), .y(PC_Increment_Value), .cin(1'b0));
    Adder32 PC_Target(.sum(Target_PC), .x(next_PC), .y(Sign_extended_Immediate), .cin(1'b0));
    PCBranch BranchEvaluate(.out(take_branch), .equal(equal), .greater(greater), .less(less), .funct3(opcode_funct3));

    always @(posedge clock, posedge reset)
        if (reset)
            PC = 32'b0;
        else 
            casex (PCSrc)
                2'b00 : PC = next_PC;
                2'b01 : PC = Target_PC;
                2'b10 : PC = Branched_Target_PC;
                2'b11 : PC = {ALU_result[31:1], 1'b0};
                default: PC = next_PC;
            endcase
        // if (PCSrc[0])
        //     if (PCSrc[1])
        //         PC = {ALU_result[31:1], 1'b0};
        //     else
        //         PC = Target_PC;
        // else
        //     PC = next_PC;

endmodule
