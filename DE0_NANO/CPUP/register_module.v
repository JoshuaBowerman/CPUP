`timescale 1ns / 1ps

module register_module(
input					clock_in,
inout 	[15:0]	bus,
input		[11:0]	Register_Control_Bus
);

reg 	[15:0]	A;
reg 	[15:0]	B;
reg 	[15:0]	C;
reg 	[15:0]	P;
reg 	[15:0]	S;
reg 	[15:0]	ST;

reg	[15:0]   data_out;

wire   			oe; //Whether or not we are driving the bus

assign oe = |Register_Control_Bus[11:6];

assign bus = oe ? data_out : 16'bZ;


/*
*	Output Registers if required
*/
always @(posedge oe or posedge clock_in)
	begin
	if(oe)
		begin
		if(Register_Control_Bus[6])
			data_out <= A;
		else if (Register_Control_Bus[7])
			data_out <= B;
		else if (Register_Control_Bus[8])
			data_out <= C;
		else if (Register_Control_Bus[9])
			data_out <= P;
		else if (Register_Control_Bus[10])
			data_out <= S;
		else if (Register_Control_Bus[11])
			data_out <= ST;
		end
	end
/*
*	Handling Register Input
*/
always @(negedge clock_in)
	begin
	if(Register_Control_Bus[0])
		A <= bus;
	else if(Register_Control_Bus[1])
		B <= bus;
	else if(Register_Control_Bus[2])
		C <= bus;
	else if(Register_Control_Bus[3])
		P <= bus;
	else if(Register_Control_Bus[4])
		S <= bus;
	else if(Register_Control_Bus[5])
		ST <= bus;
	end
endmodule 