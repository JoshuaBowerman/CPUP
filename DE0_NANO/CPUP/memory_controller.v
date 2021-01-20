`timescale 1ns / 1ps

module memory_controller(
output 			ras,
output 			cas,
output			we,
output			oe,
output [12:0]	dram_addr,
inout  [15:0]	dram_dq,
inout  [15:0]	bus,
input  [15:0]	address_space,
input  [3:0]	mem_control_bus,
input				clock,
output [15:0]  instruction_bus,
output [5:0]   instruction_address,
output			inst_cache_we,
output 			paging,
output [15:0]	inst_offset,
input	 [15:0]	P_reg
);

reg boe = 0;
reg [15:0] bus_out;
assign bus = boe ? bus_out : 16'bZ;



endmodule 