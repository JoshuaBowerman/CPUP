`timescale 1ns / 1ps

module ALU_Controller(
inout		[15:0]	bus,
input		[8:0]		ALU_control_bus,
input 				clock,
output	[15:0]	A_out,
output	[15:0]	B_out,
output				dclken,
output				daclr,
input		[15:0]	divq,
input		[15:0]	divr
); 

reg [16:0]  A;
reg [16:0]	B;
reg [16:0]	Result;
reg [15:0]	Error;
reg [16:0]  Old_Result;

wire [16:0] add;
wire [16:0] sub;
wire [16:0] mul;


assign add = A + bus;
assign sub = A - bus;
assign mul = A * bus;

wire oe;
assign oe = ALU_control_bus[1] | ALU_control_bus[6];
reg [15:0] bus_out;
assign bus = oe ? bus_out : 16'bZ;


wire we;
assign we = |ALU_control_bus[5:2] | ALU_control_bus[8];

assign A_out = A[15:0];
assign B_out = B[15:0];

//Output
always @(posedge oe or posedge clock)
	begin
	if(oe)
		begin
			if(ALU_control_bus[1])
			bus_out <= Result[15:0];
		else if (ALU_control_bus[6])
			bus_out <= Error;
		end
	Old_Result = Result;
	end
	
	
//Input and other negative edge things
always @(negedge clock)
	begin
	if(ALU_control_bus[0])
		A[15:0] <= bus;
	else if(ALU_control_bus[7])
		Error <= bus;
		
	if(we)
		B[15:0] <= bus;
		
	//Add
	if(ALU_control_bus[2])
		begin
		Result <= add[15:0];
		if(add[16])
			Error[0] <= add[16];
		end
	//Subtract
	if(ALU_control_bus[3])
		begin
		Result <= sub[15:0];
		if(sub[16])
			Error[0] <= sub[16];
		Error[1] <= Old_Result[15:0] == bus;
		end
	//Multiplication	
	if(ALU_control_bus[4])
		begin
		Result <= mul[15:0];
		if(mul[16])
			Error[0] <= mul[16];
		end
	//Division	
	if(ALU_control_bus[5])
		begin
		Result <= divq;
		end
	//Modulus	
	if(ALU_control_bus[8])
		begin
		Result <= divr;
		end
	end
	



endmodule 