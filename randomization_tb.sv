module randomization_tb();
real r_num;
real s_num;
logic [15:0]a;
initial
begin
	a=15'hffff;
	//repeat(15)
	//begin
	//#1;
	//r_num = $bitstoreal ({$random,$random});
	r_num = $itor(a);
	//a = $realtobits (r_num);
	$display ("r_num = %e",r_num);
	//$display ("s_num = %e",s_num);
	$display ("r_num = %g",r_num);
	//$display ("s_num = %g",s_num);
	$display("bits = %b",a);
	//end
end
endmodule