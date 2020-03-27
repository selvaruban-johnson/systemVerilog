class base;
rand int a;
constraint c1 {a<100;a>60;};
endclass


class derived extends base;
constraint c1 {a>50;};
endclass

module class_constraint_ovr;

initial
begin
	derived d1 ;
	d1=new();
	repeat(10)
	begin
	if(d1.randomize())
	$display("%0d",d1.a);
	else
	$display("failed");
	end
end

endmodule 