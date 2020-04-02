module fibonacci_series();
int i;
int out;

function automatic int fibo(int i);

if((i==0)||(i==1))
	fibo = i;
else
	fibo = fibo(i-1)+fibo(i-2);
endfunction
initial
begin
repeat(5)
begin
	$display("%d",fibo(i));
	i++;
end
end
endmodule 