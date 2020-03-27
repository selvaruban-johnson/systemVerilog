class packet;

int a;
rand int b;
constraint c1 {(a==10)-> (b<10);}
task disp();
 	$display("a = %d b= %d",a,b);
endtask
endclass 

module implication_constraints();
packet pkt = new();
initial
begin
	pkt.a =10;
	repeat (10)
	begin
		pkt.randomize();
		pkt.disp();
	end
end
endmodule