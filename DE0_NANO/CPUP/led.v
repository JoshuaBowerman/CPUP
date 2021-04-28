`timescale 1ns / 1ps
module LED_Drive(
input in,
input [15:0] in2,
output [7:0] out
);

assign out[6:0] = in2[6:0];
assign out[7] = in;
endmodule 