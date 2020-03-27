class sample;
rand bit [8:0] array [10];
bit [31:0]a;
constraint c1 {foreach (array[i]) array[i]<1000;}
task disp();
	$display ("%p",array);
	foreach(array[i])
	
		a = a + array[i];

	$display("%p",a);
endtask
endclass
module top_constraints2;

sample s1;
initial
begin
	s1 = new();
	s1.randomize();
	s1.disp();
end
endmodule 