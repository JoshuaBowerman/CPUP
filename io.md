# IO Controller
The IO controller is currently only responsible for Serial Communication but in the future it will be responsible for most slow IO. long term Interrupts will be added here.

## IO Contol Bus Layout
Index | Function
----- | --------
0 | IO Register In
1 | IO Register Out
2 | Execute COM instruction

## COM Instruction
All functions of the controller are controlled with com instructions when receiving the com signal it will execute an instruction according to whatever is inside the IO register.

### COM Instruction Table
Value | Function
----- | --------
0000 | Is There Serial Data? (Outputs 1 if there is 0 if not)
0001 | Is The Serial Out Buffer Full?
0010 | Serial Output(The data in IO is added to the Serial out buffer)
0011 | Serial Input(a *BYTE* is taken off the serial in buffer and placed into IO)


## IO Archetecture
The IO Module connects the cpu with all external hardware. It will support Serial, I2C, and Persistant Storage. It contains it's own 8-bit `IO_Bus` for data, and an 8-bit `IO_Command_Bus` for commands.

### IO Command Bus Instruction Table

Value | Device | Function
----- | ------ | --------
0 | All | NOP
1 | Serial | Receive Buffer Size (how many bytes are waiting)
2 | Serial | Transmit Buffer Size
3 | Serial | Take byte from receive buffer and place on `IO Bus`.
4 | Serial | Take byte from `IO_Bus` and place in the transmit buffer.
