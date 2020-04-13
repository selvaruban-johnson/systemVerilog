// d flip flop of the ALU
module alu_dff
(input clk,reset,d,
output reg q);
always@(posedge clk)
begin
if(!reset)
	q<=0;
else
	q<=~d;
end
endmodule