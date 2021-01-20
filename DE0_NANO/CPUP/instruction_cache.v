`timescale 1ns / 1ps

module instruction_cache(
input		[15:0]	mem_offset,
input 	[5:0]		mem_inst_addr,
input		[15:0]	mem_inst_bus,
input					mem_we,
output	[15:0]	instruction,
output	[15:0]	bus,
input		[15:0]	P_reg,
input		[15:0]	S_reg,
output	[3:0]    mem_control_bus,
output				double_increment,
input					paging,
input					clock		

);



reg oe = 0;
reg [15:0] bus_out;
assign bus = oe ? bus_out : 16'bZ;

endmodule 
