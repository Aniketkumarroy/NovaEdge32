# NovaEdge32

It is a 32-bit RISC-V cpu model designed in Verilog.

it implements all 37 instructions of the RV32I Instruction set except the instructions for CSR.

the CPU model is [CPU](/verilog/RISCV_CPU32.v), this file only models the cpu, instruction code memory and ram needs to be connected to its ports separately

(image)[vivado-schematic.png]
=======
the instruction set encoding supported by this is given [here](/instruction_set_encoding.s). all these instructions are taken from the official [RV32I](https://msyksphinz-self.github.io/riscv-isadoc/html/rvi.html)

the CPU model is [CPU](/verilog/RISCV_CPU32.v), this file only models the CPU, instruction code memory and RAM needs to be connected to its ports separately

# vivado Schematic
![[vivado-schematic]](vivado-schematic.png)
# Diagram
![[vivado-schematic]](schematic.png)
