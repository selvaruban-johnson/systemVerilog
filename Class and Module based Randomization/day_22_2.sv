module day_22_2;

class a;
int i=10;
local int j=20;
protected int k=30;
static int z=50;
task disp();
$display("%d %d %d %d",i,j,k,z);
endtask
endclass

class b extends a;
int a=10;
local int b=88;
protected int c=99;
static int d=898;
task disp();
i++;
k++;
z++;
$display(" %d %d %d %d %d %d %d",i,k,z,a,b,c,d);
endtask
endclass

class c extends b;
int p=65;
local int q=11;
protected int r=919;
static int s=98;
task disp();
p++;
r++;
s++;
i++;
k++;
z++;
$display(" %d %d %d %d %d %d %d %d %d %d",i,k,z,a,c,d,p,q,r,s);
endtask
endclass

initial
begin
	a a1;
	b b1;
	c c1;
	a1=new();
	b1=new();
	c1=new();
	a1.disp();
	b1.disp();
	c1.disp();
	b1.i=33;
	//b1.p=565;
	b1.d=77;
	a1.disp();
	b1.disp();
	c1.disp();
end

endmodule 
