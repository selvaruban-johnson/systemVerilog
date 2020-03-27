module class_static;

class baseclass;
int i=3;
local int k=40;
protected int m=50;
static int z=90;
task disp();
$display("%d %d %d %d ",i,k,m,z);
endtask
endclass

//class blah;

class derivedclass extends baseclass;

task disp();
begin
i++;
m++;
z=99;;
$display("%d %d %d",i,m,z);
end
endtask
endclass

class derivedclass1 extends derivedclass;

task disp();
begin
i++;
++m;
z++;
$display("%d %d %d ",i,m,z);
end
endtask
endclass

initial
begin
	baseclass b1;
	derivedclass d1;
	derivedclass1 d2;
	b1=new();
	d1=new();
	d2=new();
	//b1.i=10;
	b1.disp();
	
	d1.disp();
	d2.disp();
end

endmodule 