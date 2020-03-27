module test_queue_5();

int q[$:5] = {10,20,30,40,50};

initial
begin
	q.insert(3,35);
	$display("q=%p size=%d",q,q.size());
end
endmodule 