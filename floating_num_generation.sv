module floating_num_generation ;
shortreal r;
initial
begin
	repeat(32)
	begin
		//r= $random();
		r= $bitstoshortreal ({$random,$random});
		//$display ("r=%d r=%e r=%f r=%g", r,r,r,r);
$display ("r=%e ", r);
	end
end
endmodule 