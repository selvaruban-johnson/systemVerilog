class random_test;
rand int a;
constraint c1 {a<100;};
constraint c1 {a>100;};
con
endclass

module class_random;

initial
begin
	random_test r1;
	r1=new();
	repeat(10)
	begin
	if(r1.randomize())
	$display("%d",r1.a);
	else
	$display("failed");
	end
end

endmodule 