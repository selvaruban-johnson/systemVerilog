module class_bidirectional;

class test;
rand bit [3:0]a,b,c;
randc bit [3:0]d;
constraint c1 {a>3;b<5;c==0;d<10;};
endclass

initial
begin
	test t1;
	t1=new();
	repeat(26)
	begin
		if(t1.randomize(a))
		$display("%0d %0d %0d %0d",t1.a,t1.b,t1.c,t1.d);
		else
		$display("failed");
	end
end

endmodule 