module day_23_2;

class class_randomize;
rand bit [2:0]a,b;
constraint c1 {a==0;b>3;b<6;};
endclass

initial
begin
	class_randomize t1;
	t1=new();
		if(t1.randomize())
		$display("%d %d",t1.a,t1.b);
		else
		$display("failed");
end

endmodule 