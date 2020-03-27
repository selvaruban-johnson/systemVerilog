module tb_decoder_3x8 ();
logic [2:0]in;
logic [7:0]out;
decoder_3x8_for_loop  l1 (.*);
initial
begin
	$monitor("in=%b out =%b",in,out);
	for(int i=0;i<8;i++)
	#10 in=i;
end
endmodule
