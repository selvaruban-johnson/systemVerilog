class transaction;
rand bit [1:0]src,dst;
constraint c_dist {src dist {0:=40,[1:3]:=60};dst dist {0:/40,[1:3]:/60};}
endclass

module top_transaction();
transaction t1 =new();
initial
begin
	repeat(20)
	begin
		if(t1.randomize())
			$display("%d  %d",t1.src,t1.dst);
		else
			$display("randomization failed");
	end
end
endmodule 
			