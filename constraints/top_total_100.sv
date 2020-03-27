class total_100;

rand logic a;

constraint c {a dist {1:=80,0:=20};}

endclass

module top_total_100();
total_100 t1 =new();
int i,ones,zeros;
initial
begin
	repeat(100)
	begin
		i++;
		t1.randomize();
		$display("a = %b",t1.a);
		if(t1.a==1)
			ones++;
		else
			zeros++;
	end
	$display("ones = %d",ones);
	$display ("zeros = %d",zeros);
	$display("total bits = %d",i);
end
endmodule 