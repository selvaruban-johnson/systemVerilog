module queue_size_test();

int q[$];
int n=29;
initial
begin

	for(int i=0;i<(2**n-1);i++)
	begin
		q[i]=i;
	end
	$display ("size = %d",q.size());
end
endmodule 