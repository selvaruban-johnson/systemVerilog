class packet;

randc int arr[10];

constraint c1 {unique arr;!(arr inside {[5:15]});}

task disp();
	$display ("%d",arr);
endtask
endclass

module top_constraint_inside_w_array();
packet pkt=new();
initial
begin
	repeat(10)
	begin
	pkt.randomize();
	pkt.disp();
	end
end
endmodule 