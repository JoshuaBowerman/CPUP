# Machine Code
This page contains information on the structure of the machine's instructions
Each instruction is 1 word(16 bits) in size. The structure is detailed in the following table.

## Instruction Format
Bit Index | Purpose
--------- | -------
0 | This is unused, reserved for furture use.
1 | Signals whether or not there is attached data.
2 .. 4 | Register A(See the register id table for details)
5 .. 7 | Register B
8 .. 9 | B Type(See type table)
10 .. 11 | A Type
12 .. 16 | Instruction(See instruction table)

## Register ID Table
ID | Register
-- | --------
000 | A
001 | B
010 | C
011 | P
100 | S
101 | ST
110 | IO
111 | ER


## Type Table
The type signifies what type of data is contained in each register
ID | Type | Meaning
-- | ---- | -------
00 | REG | Simple Register
01 | MEM | A Memory location stored in a register or attached

## Instruction Table
ID | Instruction
-- | -----------
0000 | NOP
0001 | MOV
0010 | JMP
0011 | JE
0100 | JL
0101 | JG
0110 | JLE
0111 | JGE
1000 | ADD
1001 | SUB
1010 | MUL
1011 | DIV
1100 | COM
1101 | JER
1110 | MOD
