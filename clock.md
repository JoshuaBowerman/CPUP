# Clock Module

The clock module is the simplest of them all. It takes the supplied 50mhz clock and divides it down according to the switches on the dev board. It outputs two clocks, the first being the standard system clock, and the second being the microcode clock which is 4 times the speed.


## Clock Edges
### Rising Edges
On the rising edge data output and related actions are performed. no data should be latched in on the rising edge. This is also when the microcode changes.
### Falling Edges
On the falling edge data is latched into registers and arithmatic is performed. The microcode address is also changed at this time.


## Microcode Clock
The microcode clock is not used by any modules. It is only used by the microcode rom, it is needed to ensure that the microcode is read before it is time to execute the microinstruction. The speed allows the microcode address to be changed on the falling edge of the standard clock and a new microinstruction to be ready on the rising edge of the standard clock.