module day_23_4;

class class_randc;
randc bit [2:0]a;
endclass

initial
begin
	class_randc t1;
	t1=new();
	repeat(8)
	begin
		if(t1.randomize())
		$display("%d",t1.a);
		else
		$display("failed");
	end
end

endmodule 