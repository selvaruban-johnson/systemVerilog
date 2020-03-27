module top_set_membership_pre_post_randomize();
class frame;
rand bit [7:0] src_port,dst_port;

constraint c1 {src_port inside {[8'h0:8'h8],8'h14,8'h18}; !(dst_port inside {[8'h4:8'hff]});}

/*function void pre_randomize();
begin
	$display("pre src port %x",src_port);
	$display("pre dst port %x",dst_port);
end
endfunction */

function void post_randomize();
begin
	$display ("post src port %x",src_port);
	$display ("post dst port %x",dst_port);
end
endfunction
endclass
integer i=0;
integer j=0;
initial
begin
	frame f1;
	f1=new();
	for(i=0;i<10;i++)
	begin
		$display("----------------");
		$display ("Randomize Value");
		$display("----------------");
		j=f1.randomize();
		$display("----------------");
	end
end
endmodule 