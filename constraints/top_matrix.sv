class matrix;

rand int a[5][5];

constraint c {foreach(a[i,j]) a[i][j] dist {1:=80,0:=20};}

endclass

module top_matrix();
matrix t1 =new();
int i,r,c,ones,zeros;
initial
begin
	t1.randomize();
	/*repeat(5)
	begin
		repeat(5)
		begin
			$write("%d",t1.a[r][c]);
			c++;
			i++;
			if(t1.a[r][c]==0)
			zeros++;
			else if(t1.a[r][c]==1)
			ones++;
		end
		$write("\n");
		r++;
	end*/
	for(int l=0;l<5;l++)
	begin
		for(int k=0;k<5;k++)
		begin
			//t1.randomize(t1.a[l][k]);
			$write("%d",t1.a[k][l]);
			i++;
			if(t1.a[l][k]==0)
			zeros++;
			else if(t1.a[l][k]==1)
			ones++;
		end	
		$write("\n");
	end
	$display("ones = %d",ones);
	$display ("zeros = %d",zeros);
	$display("total bits = %d",i);
end
endmodule 