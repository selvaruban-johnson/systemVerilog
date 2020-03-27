class sample;
bit [7:0]pre_defined_array [] = {9,10,11};
rand bit [7:0]new_array [10];
constraint c1 {foreach (new_array[i]) new_array[i] inside {[9:11]};}
task disp();
	$display ("%p",pre_defined_array);
	$display ("%p",new_array);
endtask
endclass

module top_constraint_pre_array();
sample s1 =new();
initial
begin
	s1.randomize();
	s1.disp();
end
endmodule 