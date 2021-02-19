`timescale 1ns / 1ps

module	IO_Controller(
inout		[15:0]	bus,
input		[2:0]		SerialController,
input		[7:0]		SerialData_in,
output	[7:0]		SerialData_out,
input					SerialDataInValid,
output				SerialDataOutValid,
input					SerialDataError,
output				SerialInReady,
input					SerialOutReady,
output				SerialReset,
output				SerialMemwrreq,
output				SerialMemrdreq,
input					SerialMemEmpty,
input					SerialMemFull,
output	[7:0]		SerialMemOut,
input		[7:0]		SerialMemIn,

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
	
	if(SerialController[2])
	begin
		if(bus == 4'b0010) //Serial Output
		begin
			//write <= 1;
		end
	end
end

always @(negedge clock)
begin
	if(SerialController[0])
	begin
		IO <= bus;
	end
	
end
endmodule 

