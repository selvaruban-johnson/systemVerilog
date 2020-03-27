class sample;
randc int i;
int a;
constraint c1 {i>a;i<1000;}
task disp();
	$display("%d",i);
endtask
endclass

module top_constraints3;
sample s1=new();
initial begin
repeat(5)
begin
s1.a = s1.i;
s1.randomize();
s1.disp();
end
end
endmodule
