/*/*3. Define a class with variable a with size of 3. Randomize class 8 times such that each time a
holds a different value.*/

`include "class_d10_3.sv"

module top_class_d10_3 ();
initial
begin
	class_d10_3 c =new();
	repeat(64)
		begin
		if(c.randomize())
			$display("%d",c.a);
		
		else
			$display("failed");
end
	end
endmodule 