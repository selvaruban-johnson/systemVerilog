module day_23_6;

class qn_6;
rand int a,b;
endclass

initial
begin
	qn_6 t1;
	t1=new();
	repeat(5)
	begin
		if(t1.randomize())
		$display("%d %d",t1.a,t1.b);
		else
		$display("failed");
	end
	t1.a=55;
	$display("%d %d",t1.a,t1.b);

end

endmodule 