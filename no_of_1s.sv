module no_of_1s();

bit [7:0]word=8'b11100111;
int one;
function automatic int ones (int i,bit [7:0]word);
begin
	if(word[i]==1)
		ones = 1'b1;
	else
		ones=1'b0;
end
endfunction
initial 
begin
	for(int i=0;i<8;i++) 
		one=one+ones(i,word);
$display("%d",one);
end

endmodule 