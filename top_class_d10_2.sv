/*2. Define a class with variable u, v and w and generate random value of u and v with fix value of
w (=70).*/

`include "class_d10_2.sv"

module top_class_d10_2 ();

initial
begin
	class_d10_2 c1 = new();
	repeat(5)
	begin
		c1.u=$urandom_range(1,100);
		c1.v=$urandom_range(1,100);
		c1.disp();
	end
end
endmodule 
