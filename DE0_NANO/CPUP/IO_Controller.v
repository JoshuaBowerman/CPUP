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

reg write = 0;
reg read = 0;

assign SerialData_Out = IO;
reg serialW = 0; //Serial write
assign SerialWrite = serialW;
reg serialR = 0; //Serial write
assign SerialRead = serialR;

always @(posedge clock)
begin
	
	serialW <= 0;
	serialR <= 0;
	if(SerialController[2])
	begin
		if(bus == 4'b0010) //Serial Output
		begin
			write <= 1;
		end
	end
end

always @(negedge clock)
begin
	if(SerialController[0])
	begin
		IO <= bus;
	end
	if(SerialController[2])
	begin
			if(bus == 4'b0000) //Is there serial data
		begin
			IO <= SerialEmpty ? 0 : 1;
		end
		if(bus == 4'b0001) //Is the output buffer full
		begin
			IO <= SerialFull ? 1 : 0;
		end
	end
	if(write)
	begin
		write <= 0;
		serialW <= 1;
	end
	if(read)
	begin
		read <= 0;
		serialR <= 1;
	end
end
endmodule 

