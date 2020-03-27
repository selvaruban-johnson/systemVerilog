`include "classtest.sv"
module top_class();

initial
begin
	classtest t1;
	t1 = new();
	//test t1=new();
	t1.disp();
	t1.i=53;
	t1.disp();
	t1.i=100;
	t1.disp();
end
endmodule 