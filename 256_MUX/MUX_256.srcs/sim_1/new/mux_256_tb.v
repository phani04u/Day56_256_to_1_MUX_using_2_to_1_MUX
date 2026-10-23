`timescale 1ns / 1ps
module mux_256_tb;
reg  [255:0] I;
reg   [7:0] S;
wire  Y;
mux_256 uut(
.I(I),
.S(S),
.Y(Y)
);
integer i;
initial begin 
I = 256'd123;
S = 0;
for(i=0;i<256;i=i+1) begin
 S = i;
 #10;
end
$finish;
end
endmodule


