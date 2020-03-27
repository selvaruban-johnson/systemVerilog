module class_protected;

class baseclass;
int i=3;
local int k=4;
protected int m=5;
task disp();
$display("%d %d %d",i,k,m);
endtask
endclass

class derivedclass extends baseclass;
task disp();
begin
m=2;
$display("%d %d",i,m);
end
endtask
endclass

class derivedclass1 extends baseclass;
task disp();
begin
$display("%d %d",i,m);
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
	b1.i=10;
	b1.disp();
	
	d1.disp();
	d2.disp();
end

endmodule 