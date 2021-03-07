`timescale 1ns / 1ps


module SerialController(
input		[7:0]		SerialData_in,
input    			SerialEmpty,
output				SerialRead,
output	[7:0]		SerialData_out,
output				SerialFull,
output				SerialWrite,
input 				clock_in,
output				clock_out,
inout		[1:0]		Serial_connection

);




endmodule 