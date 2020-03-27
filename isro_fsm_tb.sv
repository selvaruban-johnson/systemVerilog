module isro_fsm_tb;
logic move,rst,clk;
logic [2:0]state;
isro_fsm s1 (.move(move),.rst(rst),.clk(clk),.state(state));
initial
begin
	clk = 1'b0;
	rst = 1'b1;
	move = 1'b0;
end
always 
	#50 clk = ~clk;
initial
begin
$monitor ($time,"rst = %b,move = %b state = %b",rst,move,state);
	#1 rst = 1'b0;
	move = 1'b1;

	#1 move = 1'b1;
	#1 move = 1'b0;
	/*#200 rst = 1'b1;
	#100 rst = 1'b0;
	#300 move = 1'b0;
	#100 move = 1'b1;
	#300 move = 1'b0;
	#100 move =  1'b1;
	#400 move = 1'b0;
	#100 rst = 1'b1;
	#100 rst =1'b0;
	#100 move = 1'b1;
	#200 move =1'b0;
	#100 move =1'b1;
	rst = 1'b1;
	#1 rst = 1'b0;
	move = 1'b1;
	#99 move = 1'b0;
	#99 move = 1'b1;
	rst = 1'b1;
	move = 1'b1;
	#100 rst = 1'b0;
 	//move = 1'b1;
	rst = 1'b1;
	#100 rst = 1'b0;

	move = 1'b1;

	
*/
end
endmodule 