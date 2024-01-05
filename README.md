# NovaEdge32

its a 32 bit RISC-V cpu model designed in verilog.

it implements all 37 instructions of the RV32I Instruction set except the instructions for CSR.

the instruction set encoding supported by this is given [here](/instruction_set_encoding.s). all these instruction are taken from the official [RV32I](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html#jal)

the CPU model is [CPU](/verilog/RISCV_CPU32.v), this file only models the cpu, instruction code memory and ram needs to be connected to its ports separately
