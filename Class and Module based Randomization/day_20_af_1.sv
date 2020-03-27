module day_20_af_1;

bit [0:3][0:11]my_array={12'h012,12'h345,12'h678,12'h9AB};
bit [11:0]j;
initial
begin
	for(int i=0;i<4;i++)
	begin
		//$display("temp[%0d]=%b",i,my_array[i]);
		j=my_array[i];
		$display("bits from 7 to 5:%b",j[7:5]);
	end
end

/*initial
begin
	foreach(my_array[i])
	begin
	j=my_array[i];
	$display("bits from 7 to 5:%b",j[7:5]);
	end
end*/
endmodule 

