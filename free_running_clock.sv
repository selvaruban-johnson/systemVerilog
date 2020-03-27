module free_running_clock ();

bit in,clk;
initial 
	clk =in;
task ti (input a,output b);
		b = ~a;
endtask 

always
	#50 ti(clk,clk);

endmodule 