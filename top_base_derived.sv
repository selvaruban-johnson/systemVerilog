class base;
	int i=40;
	task disp();
		$display("from base  i= %d",i);
	endtask
endclass

class derived extends base;
int j=50;
task disp();
	$display("from derived i=%d j=%d",i,j);
endtask
endclass

module top_base_derived();
initial
begin
	base b1=new();
	derived d1 =new();
	b1.disp();
	d1.disp();
	d1.j=53;
	d1.disp();
	d1.i=43;
	b1.disp();
	d1.disp();
	b1.i=46;
	b1.disp();
	d1.disp();

end
endmodule 