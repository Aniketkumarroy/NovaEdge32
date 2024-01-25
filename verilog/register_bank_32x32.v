`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Aniket Kumar Roy
// 
// Create Date: 12/21/2023 01:02:49 PM
// Design Name: 
// Module Name: register_bank_32x32
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


module register_bank_32x32(
    output [31:0] Rdata_out1,
    output [31:0] Rdata_out2,
    input [31:0] Wdata_in,
    input [4:0] read_addr1,
    input [4:0] read_addr2,
    input [4:0] write_addr,
    input write_enable,
    input reset,
    input clock
    );
    
//    reg [31:0] Rdata_out1, Rdata_out2;
    reg [31:0] reg_file[0:31];
    integer k;
    
    assign Rdata_out1 = reg_file[read_addr1];
    assign Rdata_out2 = reg_file[read_addr2];
    
    always @(negedge clock)
        begin
            reg_file[5'b00000] = 32'b0; // since in RV32I r0 is hard wired to zero
            if (reset)
                begin
                    for(k = 0; k < 32; k = k+1)
                        reg_file[k] = 32'b0;
                end
            else if (write_enable && |write_addr) // | write_addr means that the address should not be 5'b00000 since r0 cannot be overwritten
                reg_file[write_addr] = Wdata_in;
        end
endmodule
