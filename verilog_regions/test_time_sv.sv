`timescale 1ns/1ps
module test_time_sv;
parameter real t_real=5.5;
parameter time t_time=5ns;
initial
begin
	#t_time $display("initial1_1 %1t",$realtime);
	#t_real $display("initial1_2 %1t",$realtime);
	#t_time $display("initial1_3 %1t",$realtime);
	#t_real $display("initial1_4 %1t",$realtime);
end
initial
begin
	#t_time $display("initial2_1 %1t",$time);
	#t_real $display("initial2_2 %1t",$time);
	#t_time $display("initial2_3 %1t",$time);
	#t_real $display("initial2_4 %1t",$time);
end
endmodule