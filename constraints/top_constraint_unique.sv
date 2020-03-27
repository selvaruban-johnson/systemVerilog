class packet;

rand bit [31:0] array [10];
//constraint c1 {unique {array};}
constraint c1 {unique {array}; foreach (array[i]) array[i]<10;}
task run ();
	$display ("%p",array);
endtask
endclass 

module top_constraint_unique();
packet pkt=new();
initial
begin
	repeat(10)
	begin
	pkt.randomize();
	pkt.run();
	end
end
endmodule 