`timescale 1ns / 1ps

module clock_module(
	input          clock_in,
	output         clock_out,
	output			clock_microcode,
	input   [7:0]  ratio
	);
	
	
reg [7:0] 	counter;
reg 			clk = 0;
reg			clk_p = 0;
reg			clk_micro = 0;
assign clock_out = clk;
assign clock_microcode = clk_micro;
	
always @(posedge clock_in)
	begin
		counter <= counter+1;
		if(counter >= ratio)
			begin
					counter <= 0;
					clk_micro = ~ clk_micro;
					
			end
	end

always @(posedge clk_micro)
	begin
			clk_p <= ~clk_p;
	end
	
always @(posedge clk_p)
	begin
			clk <= ~clk;
	end
endmodule
				