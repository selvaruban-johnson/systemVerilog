module day_23_7;

class test;
rand int u,v,w;
endclass

initial
begin
	test t1;
	t1=new();
	repeat(10)
	begin
		if(t1.randomize() with {w==70;})
		$display("%d %d %d",t1.u,t1.v,t1.w);
		else
		$display("failed");
	end
end
endmodule 