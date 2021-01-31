#Register Module

The register module contains many of the registers used in the processor most are 16bits(1 word) in size. The register module is controlled with the RCB(Register Control Bus) that is attached to it and the execution module. It always outputs the S and P registers. these are directly connected to the memory module. For each register's size, function, and symbol refer to the following table.

##Registers Contained Within the Module
Symbol | Size(bits) | Function
------ | ---------- | --------
A | 16 | General Purpose Register A
B | 16 | General Purpose Register B
C | 16 | General Purpose Register C
P | 16 | Instruction Pointer
S | 16 | The address space being used by the cpu, currently unused.
ST | 16 | Stack Pointer

##Recgister Control Bus Layout

Index | Function
----- | --------
0 | A In
1 | B In
2 | C In
3 | P In
4 | S In
5 | ST In
6 | A Out
7 | B Out
8 | C Out
9 | P Out
10 | S Out
11 | ST Out

