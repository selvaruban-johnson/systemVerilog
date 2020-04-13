module mailboxes();

mailbox #(int) m =new();

task t1();
for(int i=0;i<4;i++)
begin
m.put(i);
$display("t1 send : %0d",i) ;
#5;
end
endtask

task t2();
int temp;
while(1)
begin
m.get(temp);
$display("t2 received : %0d",temp) ;
#5;
end
endtask

initial
begin
 fork
	t1();
	t2();
join
#0;
end
endmodule 