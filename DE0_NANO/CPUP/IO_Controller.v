`timescale 1ns / 1ps

module	IO_Controller(
inout		[15:0]	bus,
input		[2:0]		IO_Control_Bus,
inout		[7:0]		IO_Bus,
output   [7:0]    IO_Command_Bus,
input 				clock,
output	[7:0]		IO_Register
);

reg   [15:0]   IO;
reg	[15:0]   data_out;
reg   [7:0]    command_out;

assign IO_Command_Bus = command_out;

wire oe;
assign oe = IO_Control_Bus[1];
assign bus = oe ? data_out : 16'bZ;

reg io_oe = 0;
reg io_ie = 0;

assign IO_Bus = io_oe ? data_out[7:0] : 8'bZ;

assign IO_Register = IO[7:0];

always @(posedge clock)
begin
	data_out <= IO;
	begin
		if(IO_Control_Bus[2])
		begin
			case(bus)
				4'b0000 : begin
								command_out <= 4'b0001;
								io_ie <= 1;
								io_oe <= 0;
							 end
				4'b0001 : begin
								command_out <= 4'b0010;
								io_ie <= 1;
								io_oe <= 0;
							 end
				4'b0010 : begin
								command_out <= 4'b0100;
								io_ie <= 0;
								io_oe <= 1;
							 end
				4'b0011 : begin
								command_out <= 4'b0011;
								io_ie <= 1;
								io_oe <= 0;
							 end
				default : begin
								command_out <= 4'b0000;
								io_oe <= 0;
								io_ie <= 0;
							 end
			endcase
		end
		else
		begin
			command_out <= 4'b0000;
			io_oe <= 0;
			io_ie <= 0;
		end
	end
		
end

always @(negedge clock)
begin
	if(IO_Control_Bus[0])
		IO <= bus;
	else if(io_ie)
		IO <= IO_Bus;
end

endmodule 

