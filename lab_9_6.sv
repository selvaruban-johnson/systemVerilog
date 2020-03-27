/*Write a test-bench to test Sparse/Associative array data type and its predefined methods by
using following statements
? declare a 64 bit integer type sparse array assoc & an index idx
? initialize idx to 1
? fill array assoc by 1 bit left shift of idx value in a loop which runs 64 times so that the
array is filled as sparse array
? use first, next, last, prev methods to get the values of these elements  */

module lab_9_6();

int assoc[bit [63:0]];

bit [63:0]idx;
initial
begin

	foreach(assoc[i])
	begin
		assoc[i]=idx;
		idx=idx<<1;
	end
	//assoc.first(idx)
	foreach(assoc[i])
	$display("%p %d",assoc[i],assoc.size());
	
/*	assoc.next(idx);
	$display("%p",assoc.);

	assoc.last();
	$display("%p",assoc);

	assoc.prev();
	$display("%p",assoc); */
end
endmodule 