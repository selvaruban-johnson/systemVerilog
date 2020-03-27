class packet;

randc bit [31:0] arr;

constraint c1 {arr inside {[5:15]};}

task disp();
	$display ("%d",arr);
endtask
endclass

module top_constraint_inside();
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