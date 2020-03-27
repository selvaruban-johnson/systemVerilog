module top_randommization_with_seed();

integer num,seed,i,j;

initial
begin
	for(j=0;j<10;j++)
	begin
		seed = 9;//2
		$display("seed is %d",seed);
		void '($urandom(seed)); 
		for(i=0;i<10;i++)
		begin
			num=($urandom(seed)%10);
			$write("|num = %2d|",num);
		end
		$display("");
	end
end
endmodule 
