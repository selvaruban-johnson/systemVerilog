/*Define a class with variable a & b with size of 3. Randomize class 10 times such that a should
have value 5 or 7 and b should have value between 4 to 6.*/

class class_d10_4;

rand bit [2:0]a,b;
constraint c1 {(a==5)|(a==7);}
constraint c2 {b>=4;b<=6;}

task disp();
	$display("a=%d b=%d",a,b);
endtask
endclass

module top_class_d10_4();

initial
begin
	class_d10_4 t1 =new();
	repeat(10)
	begin
		if(t1.randomize(a,b))
			t1.disp();
		else
			$display("randomize failed");
	end
end
endmodule 
