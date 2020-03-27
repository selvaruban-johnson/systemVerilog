module tb_alu ();
logic rst,co;
bit clk;
logic [3:0] a,b,s,select;
alu_4bit a1 (.*);
always
	#50 clk = ~clk;
initial 
begin
	rst = 1'b1;
	$monitor ("rst=%b sel = %b a = %b b = %b {co,s}=%b",rst,select,a,b,{co,s});
	#100 rst =1'b0;
	repeat (1)
	begin
		for(int i=0;i<16;i++)
		begin 
			for(int j=0;j<16;j++)
			begin
				for(int k=0;k<16;k++)
				begin
					# 100 select = k;
				end
				#100 b=j;
			end
			#100 a=i;
		end
		#100 rst = rst+1'b1;
	end
end
endmodule 
	
	