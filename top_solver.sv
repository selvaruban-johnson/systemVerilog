`include "solver.sv"

module top_solver ();

initial
begin
	solver t1=new();
	repeat (10)
	begin
		if(t1.randomize(a,b) with {t1.a>10;t1.b<12;})
			t1.disp();
		else
			$display("randomization failed");
	end
end
endmodule 