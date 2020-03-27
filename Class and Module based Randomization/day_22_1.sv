`include "testclass.sv"
module day_22_1;

initial
begin
	testclass f1[10];
	for(int k=0;k<10;k++)
	begin
	f1[k]=new();
	f1[k].i=k;
	f1[k].j=k+1;
	f1[k].disp();
	end
end

endmodule 

