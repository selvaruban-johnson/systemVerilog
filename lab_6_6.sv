module lab_6_6();
reg [3:0][11:0]my_array;
reg [3:0][8:0]array;

initial
begin
	my_array[0]=12'h012;
	$display ("%b",my_array[0]);
	my_array[1]=12'h345;
	$display ("%b",my_array[1]);
	my_array[2]=12'h678;
	$display ("%b",my_array[2]);
	my_array[3]=12'h9ab;
	$display ("%b",my_array[3]);

	$display ("%h",my_array);
	for(int i=0;i<4;i++)
	begin
		for(int j=0;j<12;j++)
		begin
			if((j>=4)&&(j<=6))
			begin
				continue;
			end
			else
			begin
				array[i][j]=my_array[j];
			end
		end
	end
	$display ("%b",array[0]);
	$display ("%b",array[1]);
	$display ("%b",array[2]);
	$display ("%b",array[3]);
end
endmodule 

