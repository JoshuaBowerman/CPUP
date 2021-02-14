`timescale 1ns / 1ps

module	IO_Controller(
inout		[15:0]	bus,
input		[2:0]		SerialController,
input		[7:0]		SerialData_in,
input    			SerialEmpty,
output				SerialRead,
output	[7:0]		SerialData_out,
output				SerialFull,
output				SerialWrite,
input 				clock
);

reg [15:0] IO;

wire oe;
wire [15:0] bus_out;
assign bus = oe ? bus_out : 16'bZ;
assign bus_out = IO;
assign oe = SerialController[1];


always @(posedge clock)
begin
	
end

always @(negedge clock)
begin
	if(SerialController[0])
	begin
		IO <= bus;
	end
end
endmodule 

