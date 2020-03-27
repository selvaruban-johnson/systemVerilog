class base;
rand int a;
constraint c1 {a>0;}
endclass

class derived extends base;
constraint c2 {a<0;}
endclass

module top_constrained_overriding();
initial
begin
	derived d1;
	d1=new();
	repeat(10)
	begin
		if(d1.randomize())
			$display("randomization successful : a=%d",d1.a);
		else
			$display("randomization failed");
	end
end
endmodule 