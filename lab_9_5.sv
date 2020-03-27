/*5. Create the SystemVerilog code for the following requirements
a. Create a 3-byte queue and initialize it with 2, ?1, and 127
b. Print out the sum of the queue in the decimal radix
c. Print out the min and max values in the queue
d. Sort all values in the queue and print out the resulting queue
e. Print out the index of any negative values in the queue
f. Print out the positive values in the queue
g. Reverse sort all values in the queue and print out the resulting queue*/

module lab_9_5();

byte q[$:2] = {2,-1,127};
logic b[9:0];

initial
begin

	$display("q=%p",q);

	$display("%d",q[0]+q[1]+q[2]);
	
	$display("min=%p max=%p",q.min(),q.max());
	q.sort();
	$display("q=%p",q);
	foreach(q[i])
	begin
		if(q[i]<0)
		begin

			$display("negative");
			$display("index=%d q=%p",i,q[i]);
		end
		else if(q[i]>0)
		begin
			$display("positive");
			$display("index=%d q=%p",i,q[i]);
		end
	end
	q.reverse();
	$display("reverse = %p",q);
end
endmodule 