# CPUP
## Central Processing Unit Project

I wrote this project because i wanted to write my own tiny os. Rather than write it in x86 or ARM I decided to make my own architecture to use. It's a 16bit architecture that uses microcode. The cpu is written in verilog and is seperated into multiple units. below is a list of the units with links that lead to more details and a quick description of it's responsibilities.



## Units
### Execution Module
This is responsible for managing all the control busses coming from the various modules, as well as decoding instructions to microcode and executing it.
- [Execution Module](execution.md)

### ALU
This is responsible for all arithmatic, it is able to add, subtract, multiply, divide, and do modulus. It also produces the information used in conditional jumps.
- [Arithmatic and Logic Unit](alu.md)

### Clock Module
This is responsible for creating the main clock and the microcode clock, execution speed is modifiable with the toggle switched on the dev board. In the future the processor will be able to modify it's own clock speeds.
- [Clock Module](clock.md)

### Register Module
This module contains all the registers available for use by programs and used by the processor, except for a few exceptions all registers precide here.
- [Register Module](register.md)

### Memory Module
This module is responsible to operation of the fast memory used by the processor. It writes instantly and takes 4 cycles to read data. It also contains the instruction register.
- [Memory Module](fastMemory.md)

### IO Controller
This is responsible for all IO, it is currently able to manage a serial bus but it's designed to be able to be easily extended to do other IO. in the future it will be able to read and write to a HDD, and long term i would like to attach a vga controller here.
- [IO Controller](io.md)

## Instruction Set
Each instruction is 1 word in size. the processor uses a microcode architecture so each instruction is decoded to microcode before execution.
- [Instruction Set](instructions.md)

## Associated Tools

### MicroAssembler
This is the microassember for the CPUP processor, for details on the microassembly language and the microassembler itself follow the link.
[MicroAssembler](https://github.com/JoshuaBowerman/CPUP-Microassembler/blob/main/Readme.md)

### Assembler
This is the assembler for CPUP, for deatils on the assembly language and the assembler itself follow the link.
[Assembler](https://github.com/JoshuaBowerman/CPUP-Assembler/blob/main/Readme.md)

