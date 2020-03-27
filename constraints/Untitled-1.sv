class packet;
rand bit [7:0] addr1;
randc bit [7:0] addr2;

constraint c1 {addr1 inside {[5:15]};}
constraint c2 {addr2 inside {1,2,3,4,5,6,7,8,9,10};}
task disp();
	$display("addr1 = %d addr2 = %d ",addr1,addr2);
endclass

module top_constraint;

packet pkt=new();

initial
begin
	repeat(10)
	begin
		pkt.randomize();
		pkt.disp();
	end
end
endmodule 