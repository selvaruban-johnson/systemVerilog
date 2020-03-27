/*1. Define a class with variable a and b and generate random value 5 times and print them.
Overwrite the value of a to 55 after randomization.*/

`include "class_d10.sv";

module top_class_d10();

initial
begin
	class_d10 aa;
	aa=new();
	repeat(5)
	begin
		
		aa.a = $urandom_range(1,100);
		aa.b = $urandom_range(1,100);
		aa.disp();
	end
	aa.a =55;
	aa.disp(); 
end
endmodule 