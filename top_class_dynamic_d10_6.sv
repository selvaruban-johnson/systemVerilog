/*6. Define a class with dynamic array a. Randomize class such that each element of dynamic array
a has value greater than 7*/

`include "class_dynamic_d10_6.sv"

module top_class_dynamic_d10_6 ();
initial
begin
	class_dynamic_d10_6 c;
	c=new();
	c.a=new[10];
	repeat(1)
	begin
		if(c.randomize())
			$display("%p",c.a);
		else
			$display("randomize faild");
	end
	/*for(int i=0;i<10;i++)
	begin
		c.a[i]=$urandom(1,100);
		//i=i+1;
	end*/
	
end
endmodule 
