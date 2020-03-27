class sample;

rand bit [31:0] array [10];

constraint c1 {unique {array};}
constraint c2 {foreach(array[i]) array[i]<10;}
task disp();
	$display("%d",array);
endtask
endclass

module top_constraints1;

sample s1 = new();

initial
begin
	if(s1.randomize())
	begin
		s1.disp();
	end
	else
		$display("failed");
	
end
endmodule 
