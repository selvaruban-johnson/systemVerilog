module lab_5_5();
int d_n,d_t1,d_t2,d_t3;
logic f;
int g1,t;
task task1 (input [2:0]device_no,input int device_time,output flag);
begin
	#30;
	for(int i=0;i<=device_time;i++)
	begin
		if(i==device_time)
			flag=1'b0;
		else
			flag = 1'b1;
		$display("d_n = %d,d_t = %d,flag = %d",device_no,i,flag);
	end
end
endtask

task smallest_time (input a,b,output g);
begin
	g=(a<b)?a:b;
end
endtask

initial
begin
	d_t1 = 30;
	d_t2 = 45;
	d_t3 = 60;
	smallest_time (d_t1,d_t1,g1);
	smallest_time (g1,d_t3,t);
	case(t)
		30:task1(1,d_t1,f);
		45:task1(2,d_t2,f);
		60:task1(3,d_t3,f);
	endcase

end
endmodule
