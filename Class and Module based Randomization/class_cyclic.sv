module class_cyclic;

class test;
rand bit [3:0]a,b,c;
randc bit [3:0]d;
endclass

initial
begin
	test t1;
	t1=new();
	repeat(26)
	begin
		if(t1.randomize())
		$display("%0d %0d %0d %0d",t1.a,t1.b,t1.c,t1.d);
		else
		$display("failed");
	end
end

endmodule 