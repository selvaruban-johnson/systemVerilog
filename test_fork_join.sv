module test_fork_join ;
initial
begin
	fork
	begin
		#5 $display ($time,"i am child 1");
	//#1 $display($time,"i am child 11");
	end
	begin
		#10 $display ($time,"i am child 2");
		//#2 $display ($time,"i am child 22");
	end
	join_none
	# 5 $display ($time,"i am parent");
end
endmodule 