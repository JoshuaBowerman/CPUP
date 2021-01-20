`timescale 1ns / 1ps
module Execution_Module(
inout		[15:0]	bus,
input 				clock,
input					d_inc,
output	[11:0]	RCB,
output	[3:0]		MCB,
output	[7:0]		ACB,
output	[2:0]		ICB,
input					paging,
input		[15:0]	instruction

);

reg oe = 0;
reg [15:0] bus_out;
assign bus = oe ? bus_out : 16'bZ;

endmodule 