//mux logic for carry
module mux_c
(input a,b,s,
output carry);
assign carry = s==1'b1 ? b : a;
endmodule