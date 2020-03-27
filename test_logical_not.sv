module test_logical_not (input [3:0]a,output logic y);
always @ (a)
if (!a)
	y = 1;
else
	y = 0;
endmodule 