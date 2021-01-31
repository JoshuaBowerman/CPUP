# Memory Module

The memory module is responsible for managing reading and writing to the fast memory. The memory size is 32768 words or 65,536 bytes. It contains an internal address register, as well as the Instruction register used by the execution module. it is able to write to the memory with only 1 clock cycle but needs 4 to read from the memory. for details on the MCB(Memory Control Bus) see the attached table.


## Memory Control Bus
Index | Name | Function
----- | ---- | --------
0 | Addr_In | Takes the address on the bus and puts it in the internal address register.
1 | Write | Write the data on the bus into the address stored.
2 | Read | Output data from memory onto the bus according to the stored address.
3 | Inst_Read | Read from memory and put it in the instruction register.