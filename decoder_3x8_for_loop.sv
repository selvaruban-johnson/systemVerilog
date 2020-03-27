module decoder_3x8_for_loop (input [2:0]in,output logic [7:0]out);
always_comb 
begin
	for(int i=0;i<8;i++)
	begin
		out[i]=(in==i)?1'b1:1'b0;
	end
end
endmodule 