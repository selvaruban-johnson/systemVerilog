module day_23_3;

class class_randomize_1;
rand bit [2:0]a,b;
constraint c1 {a inside {5,6,7};b inside {4,6};};
endclass

initial
begin
	class_randomize_1 t1;
	t1=new();
	repeat(10)
	begin
		if(t1.randomize())
		$display("%d %d",t1.a,t1.b);
		else
		$display("failed");
	end
end

endmodule 