`timescale 1ns / 1ps
module mux2(
input [1:0] I,
input S,
output Y
);
assign Y = I[S];
endmodule
