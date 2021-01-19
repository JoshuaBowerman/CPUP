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
*	Output Register A
*/
always @(posedge Register_Control_Bus[6])
	begin
		data_out = A;
	end 

/*
*	Output Register B
*/
always @(posedge Register_Control_Bus[7])
	begin
		data_out = B;
	end 

/*
*	Output Register C
*/
always @(posedge Register_Control_Bus[8])
	begin
		data_out = C;
	end 

/*
*	Output Register P
*/
always @(posedge Register_Control_Bus[9])
	begin
		data_out = P;
	end 

/*
*	Output Register S
*/
always @(posedge Register_Control_Bus[10])
	begin
		data_out = S;
	end 

/*
*	Output Register ST
*/
always @(posedge Register_Control_Bus[11])
	begin
		data_out = ST;
	end 

/*
*	Handling Register Input
*/
always @(negedge clock_in)
	begin
		if(Register_Control_Bus[0])
			begin
			A <= bus;
			end
		if(Register_Control_Bus[1])
			begin
			B <= bus;
			end
		if(Register_Control_Bus[2])
			begin
			C <= bus;
			end
		if(Register_Control_Bus[3])
			begin
			P <= bus;
			end
		if(Register_Control_Bus[4])
			begin
			S <= bus;
			end
		if(Register_Control_Bus[5])
			begin
			ST <= bus;
			end
	end
endmodule 