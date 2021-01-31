#Execution Module
This is the most complicated module. it takes the instruction and ecodes it into a microcode address, then increments through the microcode rom executing each microinstruction. It is attached to all control busses, the microcode rom, as well as the Instruction Register from the memory module.



##Microcode
The microcode is 26 bits wide. The microcode address is 11 bits wide. for the breakdown of the addresses and microcode see the attached tables. There is an internal counter that counts to 16(the maximum number of clocks an instruction can take). 

##Microcode Breakdown
Index | Function
----- | --------
0 .. 8 | ALU Control Bus
9 .. 10 | This is Exec Function (See the exec function heading for more details)
11 | Execute COM instruction (IO controller)
12 .. 15 | Memory Control Bus
16 | P in
17 | P out
18 | B in (This is not register B but the register associated with the second argument)
19 | A in (Not Register A)
20 | B out (Not Register B)
21 | A out (Not Register A)
22 | Done (Begin counting again, a new instruction is in)
23 | Output a 0 onto the bus
24 | Increment amount out(1 if no data is attached, 2 if data is attached)
25 | Output a 1 onto the bus

##Microcode Address Breakdown
Index | Function
----- | --------
0 .. 3 | The counter index(internal counter used to increment through microcode.
4 | Whether or not this instruction has attached data.
5 | Whether or not B contains a memory address.
6 | Whether or not A contains a memory address.
7 .. 10 | The instruction ID


##Exec Function
This is used to jump conditionally. anything other than 00 will increase the counter by 7 if it's requirements are met.
When using this you should be driving the bus with ER.

Value | Meaning
----- | -------
00 | Nothing
01 | Greater than
10 | Equals
11 | Greater than or equals.