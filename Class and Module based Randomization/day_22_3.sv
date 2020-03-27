module day_22_3;

class a;
int i=30;
local int j=20;
protected int k=40;
static int z=90;
task disp();
$display("%d %d %d %d",i,j,k,z);
endtask
endclass

class b extends a;
task disp();
begin
	i++;
	//j++;
	z++;
	k++;
$display("%d %d %d",i,k,z);
end
endtask
endclass

class c;
task disp();
a a1;
b b1;
a1=new();
b1=new();
a1.i=55;
//b1.k=77;
a1.disp();
b1.disp();
//$display("%d %d %d",i,k,z);
endtask
endclass

initial
begin

	c c1;
	c1=new();
	c1.disp();
end

endmodule 
	
