`timescale 1ns / 1ps

module ALU_Controller(
inout		[15:0]	bus,
input		[7:0]		ALU_control_bus,
input 				clock
);

reg oe = 0;
reg [15:0] bus_out;
assign bus = oe ? bus_out : 16'bZ;

endmodule 