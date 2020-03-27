module lab_9_7();

initial
begin
	$display("@%d starts fork join_any example ",$time);
	#10 $display("@%d sequential after #10 ",$time);
	fork
		$display("@%d parallel starts ",$time);
	#50	$display("@%d parallel after #50 ",$time);
	#10	$display("@%d parallel after #10 ",$time);
	begin
		#30 $display("@%d sequential after #30",$time);
		#10 $display("@%d sequential after #10",$time);
	end
	join_any
	 #80 $display ("@%d : final after #80",$time);
end
endmodule 