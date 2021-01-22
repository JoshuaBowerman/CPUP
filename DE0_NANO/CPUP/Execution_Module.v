`timescale 1ns / 1ps
module Execution_Module(
inout		[15:0]	bus,
input 				clock,
input					d_inc,
output	[11:0]	RCB,
output	[3:0]		MCB,
output	[8:0]		ACB,
output	[2:0]		ICB,
input					paging,
input		[15:0]	instruction,
output   [10:0]   mc_addr,
input		[25:0]	microcode

);

assign oe = microcode[25]; //Dont forget
assign bus = oe ? (d_inc ? 16'b10 : 16'b01) : 16'bZ;


//RCB stuff
wire [11:0] RCB_out;
assign RCB = RCB_out;

//microcode index
reg [3:0] counter;
//Setup the mc_addr
//index
assign mc_addr [3:0] = counter;
//attached?
assign mc_addr [4] = instruction[1];
//m2
assign mc_addr [5] = (instruction[9:8] == 2'b00) ? 0 : 1;
//m1
assign mc_addr [6] = (instruction[11:10] == 2'b00) ? 0 : 1;
//instruction
assign mc_addr[10:7] = instruction[15:12];

//update counter at every neg clock, resetting when appropriate
always @(negedge clock)
begin
	if(microcode[22] == 0)
		counter <= counter + 1;
	else
		counter <= 0;
end

//assign ACB to microcode
assign ACB = microcode[8:0];
//ICB
assign ICB = microcode[11:9];
//MCB
assign MCB = microcode[15:12];

/*
	This will be the logic to run the RCB
*/

	//A in
assign	RCB_out[0] = ((microcode[19] == 1) && (instruction[7:5] == 3'b000)) || ((microcode[18] == 1) && (instruction[4:2] == 3'b000));
	//B in
assign	RCB_out[1] = ((microcode[19] == 1) && (instruction[7:5] == 3'b001)) || ((microcode[18] == 1) && (instruction[4:2] == 3'b001));
	//C in
assign	RCB_out[2] = ((microcode[19] == 1) && (instruction[7:5] == 3'b010)) || ((microcode[18] == 1) && (instruction[4:2] == 3'b010));
	//P in
assign	RCB_out[3] = ((microcode[19] == 1) && (instruction[7:5] == 3'b011)) || ((microcode[18] == 1) && (instruction[4:2] == 3'b011)) || microcode[16];
	//S in
assign	RCB_out[4] = ((microcode[19] == 1) && (instruction[7:5] == 3'b110)) || ((microcode[18] == 1) && (instruction[4:2] == 3'b110));
	//ST in
assign	RCB_out[5] = ((microcode[19] == 1) && (instruction[7:5] == 3'b101)) || ((microcode[18] == 1) && (instruction[4:2] == 3'b101));
	//A out
assign	RCB_out[6] = ((microcode[21] == 1) && (instruction[7:5] == 3'b000)) || ((microcode[20] == 1) && (instruction[4:2] == 3'b000));
	//B out
assign	RCB_out[7] = ((microcode[21] == 1) && (instruction[7:5] == 3'b001)) || ((microcode[20] == 1) && (instruction[4:2] == 3'b001));
	//C out
assign	RCB_out[8] = ((microcode[21] == 1) && (instruction[7:5] == 3'b010)) || ((microcode[20] == 1) && (instruction[4:2] == 3'b010));
	//P out
assign	RCB_out[9] = ((microcode[21] == 1) && (instruction[7:5] == 3'b011)) || ((microcode[20] == 1) && (instruction[4:2] == 3'b011)) || microcode[17];
	//S out
assign	RCB_out[10] = ((microcode[21] == 1) && (instruction[7:5] == 3'b100)) || ((microcode[20] == 1) && (instruction[4:2] == 3'b100));
	//ST out
assign	RCB_out[11] = ((microcode[21] == 1) && (instruction[7:5] == 3'b101)) || ((microcode[20] == 1) && (instruction[4:2] == 3'b101));



endmodule 