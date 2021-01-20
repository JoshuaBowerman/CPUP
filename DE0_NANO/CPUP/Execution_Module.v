`timescale 1ns / 1ps
module Execution_Module(
inout		[15:0]	bus,
input 				clock,
input					d_inc,
output	[11:0]	RCB,
output	[3:0]		MCB,
output	[8:0]		ACB,
output	[2:0]		ICB,
input					paging,
input		[15:0]	instruction

);

reg oe = 0;
reg [15:0] bus_out;
assign bus = oe ? bus_out : 16'bZ;


//Temp
assign RCB = 12'bz;
assign MCB = 4'bz;
assign ACB = 8'bz;
assign ICB = 3'bz;





endmodule 