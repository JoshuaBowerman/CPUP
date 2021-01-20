`timescale 1ns / 1ps

module memory_controller(
output			we,
output [14:0]	dram_addr,
input  [15:0]	dram_dq,
output [15:0]  dram_data,
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





assign bus = mem_control_bus[2] ? dram_dq : 16'bZ;
assign dram_data = mem_control_bus[1] ? bus : 0;

reg [15:0] addr;
assign dram_addr = addr[14:0];

always @(negedge clock)
	begin
	if(mem_control_bus[0])
		addr <= bus;
	
	end



endmodule 