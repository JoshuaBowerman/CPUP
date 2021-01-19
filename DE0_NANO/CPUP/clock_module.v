`timescale 1ns / 1ps

module clock_module(
	input          clock_in,
	output         clock_out,
	input   [7:0]  ratio
	);
	
	
reg [7:0] counter;
	
always @(posedge clock_in)
	begin
		counter <= counter+1;
		if(counter >= ratio)
			begin
					counter <= 0;
			end
	end

endmodule
				