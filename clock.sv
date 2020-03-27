module clock();
logic move ,rst;
bit clk;
logic [2:0]state;
initial
begin
	forever
	#50 clk = ~clk;
end
isro_fsm f1 (.*);
initial
begin
	#100 rst =1'b0 ;
end
endmodule
 