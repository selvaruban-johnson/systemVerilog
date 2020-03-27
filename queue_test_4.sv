module queue_test_4();

int q[$];

initial
begin
	q.push_front (40);
	q.push_front (41);
	q.push_front (50);
	q.push_front (51);
	$display("%p,%d",q,q.size);
	q.pop_back();
	$display("%p,%d",q,q.size);
	q.pop_back();
	$display("%p,%d",q,q.size);
	q.pop_back();
	$display("%p,%d",q,q.size);
	q.pop_back();
	$display("%p,%d",q,q.size);
end
endmodule 