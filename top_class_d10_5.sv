/*5. Define a class with variable a & b with size of 3. Randomize class such that if b has a value 4
or 5 then a should have value 0.*/

class class_d10_5 ;
//bit [2:0]a=0;
rand bit [2:0]a,b;
constraint c1 {(b==4)|(b==5);}
constraint c2 {a==0;}
task disp();
	$display("a=%d b=%d",a,b);
endtask

endclass 

module top_class_d10_5 ();
class_d10_5 t1 =new();
initial
begin
	repeat(5)
	begin
		if(t1.randomize())
			t1.disp();
		else
			$display("randomize failed");
	end
end
endmodule 