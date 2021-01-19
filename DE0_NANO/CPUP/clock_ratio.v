`timescale 1ns / 1ps

module clock_ratio(
	input 	[3:0] 	data,
	output 	[7:0] 	ratio
	);
	
assign ratio[7:5] = 4'b0;
assign ratio[4:1] = data[3:0];
assign ratio[0] = 0;
	
endmodule 