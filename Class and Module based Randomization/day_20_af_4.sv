module day_20_af_4;

/*initial
begin
	fork
	t1;
	t2;
	join_any
	t3;
end

task t1;
#10ms $display("t1 at %0t",$time);
endtask

task t2;
#20ms $display("t2 at %0t",$time);
endtask

task t3;
#5ms $display("t3 at %0t",$time);
endtask*/

/*initial
begin
	t3;
	fork
	t1;
	t2;
	join
end

task t1;
#10ms $display("t1 at %0t",$time);
endtask

task t2;
#20ms $display("t2 at %0t",$time);
endtask

task t3;
#5ms $display("t3 at %0t",$time);
endtask*/

initial
begin
	
	fork
	t1;
	t2;
	join
	t3;
end

task t1;
#10ms $display("t1 at %0t",$time);
endtask

task t2;
#20ms $display("t2 at %0t",$time);
endtask

task t3;
#5ms $display("t3 at %0t",$time);
endtask


endmodule 