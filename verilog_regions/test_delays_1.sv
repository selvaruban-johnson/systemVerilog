module test_delays_1;
integer B,B1,B2,B3,A2,A;
initial
begin
	$monitor($time,"B=%0d B1=%0d B2=%0d B3=%0d A2=%0d A=%0d",B,B1,B2,B3,A2,A);
	B=5;
	fork
	#5 B1=2;
	#4 B2=3;
	begin
		#2 B3=4;
		#5 A2=3;
	end
	join
	#29 A=10;
end
initial 
#1 $finish;
endmodule