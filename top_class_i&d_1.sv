/*1. Declare class A, B and C. Class C has different variables a, b, c. Randomize class C inside
class A and transfer randomized class C properties to class B.Use static and protected variables
and their scope.*/

class c;
protected int aa,bb;
static int cc;
task disp();
	$display("aa=%d bb=%d cc=%d",aa,bb,cc);
endtask
endclass 



class a extends c;
task disp();
	c c1 = new();
	if(c1.randomize())
		c1.disp();
	else
		$display("randomize failed");
endtask
endclass

class b extends a;

task disp();
	a a1 = new();
	a1.disp();
endtask
endclass

module top_class_abc ();

initial
begin
	b b1 = new();
	repeat(5)
	begin
		b1.disp();
	end
end
endmodule 