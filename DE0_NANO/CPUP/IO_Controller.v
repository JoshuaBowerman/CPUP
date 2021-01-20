`timescale 1ns / 1ps

module	IO_Controller(
inout		[15:0]	bus,
inout		[1:0]		Serial,
input		[2:0]		IO_control_bus,
input 				clock
);

reg oe = 0;
reg [15:0] bus_out;
assign bus = oe ? bus_out : 16'bZ;

endmodule 

