module lab_5_4 ();
	
task t1();
begin
	#1000 $display ($time,"task1");
end
endtask 
task t2();
begin
	#2000 $display ($time,"task2");
end
endtask 

dtask t3();
begin
	#500 $display ($time,"task3");
end
endtask 

initial
begin
// t1 display comes first then t2 and then t3.
/*fork
	 t1;
	 t2;
join
	 t3; */

//output 
//                 1000task1
//                 2000task2
//                 2500task3

// t1 display comes first then t3 and then t2.
/*fork
	 t1;
	 t2;
join_any
	 t3; */

//output 
//                 1000task1
//                 1500task3
//                 2000task2

//t3 display comes first then t1 and then t2.
fork
	 t1;
	 t2;
join_none
	 t3;
//output
//                  500task3
//                 1000task1
//                 2000task2
end
endmodule
