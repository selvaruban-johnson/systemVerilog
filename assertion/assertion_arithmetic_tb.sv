module assertion_arithmetic_tb();
logic [3:0] A, B;
logic [4:0] Q1;
logic [3:0] Q2, Q3;
logic [7:0] Q4;
assertion_arithmetic2 DUT(.*);
initial
begin
	$monitor( $fopen("./arithmetic.txt"),"A B Q1 Q2 Q3 Q4");
	$display( $fopen("./arithmetic.txt"),"A=%b B=%b Q1=%b Q2=%b Q3=%b Q4=%b", A, B, Q1, Q2, Q3, Q4);
end
initial
repeat(20)
begin
	A = $urandom_range(4'b1111);
	B = $urandom_range(4'b1111);
	#10 $display("A=%b B=%b Q1=%b Q2=%b Q3=%b Q4=%b", A, B, Q1, Q2, Q3,Q4);
end
endmodule

module assertion_arithmetic2
(input [3:0] A, B,
output logic [4:0] Q1,
output logic [3:0] Q2, Q3,
output logic [7:0] Q4);
always_comb
begin
	assert(^(A^B)!==1'bx) 
	else $warning("Input is xx");
	Q1 = A + B; //addition
	Q2 = A - B; //subtraction
	Q3 = A / 2; //division
	Q4 = A * B; //multiplication
end
endmodule