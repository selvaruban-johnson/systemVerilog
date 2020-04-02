timeunit 1ns;
timeprecision 1ns;
module test_time;
initial
begin
	#1ns $display("Time of first now %t",$time);
	#1us $display("Time is second now %t",$time);
	#1ns $display("Time is now %t",$time);
	#1s $display("Time is last now %t",$time);
end
endmodule