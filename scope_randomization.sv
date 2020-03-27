module scope_randomization();
integer a;
initial
begin
	for(int i=0;i<10;i++)
		if(randomize(a))
			$display("randomization success :%d ",a);
		else
			$display("randomization failed");
	
end
endmodule 