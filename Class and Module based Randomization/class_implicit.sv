module class_implicit;

class test;
rand bit a;
rand int b;
constraint c1 {a->b inside {2,4,6,8};b inside{2,4,6,8};};
endclass

initial
begin
	test t1;	
	t1=new();
	repeat(10)
	begin
		t1.randomize();
		$display("%d %d",t1.a,t1.b);
	end
end

endmodule 