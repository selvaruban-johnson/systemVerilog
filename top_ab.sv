class a;
int a=10;
local int b=20;
protected int c=30;
static int d =40;
task disp();
	$display("from a a=%d b=%d c=%d d=%d",a,b,c,d);
endtask
endclass

class b extends a;
task disp();
		
	a a1=new();
	a1.a++;
	//a1.b++;
	//a1.c++;
	a1.d++;
	$display("a=%d d=%d",a1.a,a1.d);
endtask
endclass

module top_ab();
b b1=new();
initial
begin

	b1.disp();
	/*a1.a=11;
	a1.d=41;
	a1.disp();
	//a1.b=21;
	//a1.c=31;
	//a1.disp();
	$display("a=%d",a1.a);
	$display("b=%d",a1.b);
	$display("c=%d",a1.c);
	$display("d=%d",a1.d);*/
end
endmodule  