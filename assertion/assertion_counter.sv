module assertion_counter(clk,reset,count,t);
input clk,reset;
output reg [3:0]count;
output t;
always @(posedge clk or negedge reset)
begin
if(!reset)
count <= 0;
else
count <= count + 1'b1;
end
assign t = &count;
endmodule